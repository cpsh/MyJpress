/*
Navicat MySQL Data Transfer

Source Server         : local-mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : jpress

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-28 19:55:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jpress_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jpress_attachment`;
CREATE TABLE `jpress_attachment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `title` text COMMENT '标题',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '上传附件的用户ID',
  `content_id` bigint(20) unsigned DEFAULT NULL COMMENT '附件所属的内容ID',
  `path` varchar(512) DEFAULT NULL COMMENT '路径',
  `mime_type` varchar(128) DEFAULT NULL COMMENT 'mime',
  `suffix` varchar(32) DEFAULT NULL COMMENT '附件的后缀',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `flag` varchar(256) DEFAULT NULL COMMENT '标示',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `order_number` int(11) DEFAULT NULL COMMENT '排序字段',
  `created` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `suffix` (`suffix`),
  KEY `mime_type` (`mime_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='附件表，用于保存用户上传的附件内容。';

-- ----------------------------
-- Records of jpress_attachment
-- ----------------------------
INSERT INTO `jpress_attachment` VALUES ('1', 'bb765c69f17f318bf6d66463a243888f.jpg', '1', null, '/attachment/20161222/2d8f7f72175a406f83e57be5510505eb.jpg', 'image/jpeg', '.jpg', null, null, null, null, null, '2016-12-22 19:11:25');
INSERT INTO `jpress_attachment` VALUES ('2', 'Merry Christmas1920x1080.png', '1', null, '/attachment/20161222/21a955ef29eb413e8e243e8128ae9670.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:14:59');
INSERT INTO `jpress_attachment` VALUES ('3', 'imagetools0.jpg', '1', null, '/attachment/20161222/b74a752dd4b64625a30b5638fd19e27a.jpg', 'image/jpeg', '.jpg', null, null, null, null, null, '2016-12-22 19:18:00');
INSERT INTO `jpress_attachment` VALUES ('4', 'imagetools1.png', '1', null, '/attachment/20161222/3bcce61ea13e432c9aa8a586fd691ab4.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:21:47');
INSERT INTO `jpress_attachment` VALUES ('5', 'imagetools2.png', '1', null, '/attachment/20161222/27f637c23218457b846e12bdf9280724.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:22:02');
INSERT INTO `jpress_attachment` VALUES ('6', 'imagetools3.png', '1', null, '/attachment/20161222/5edffc7130d14b1988669c0ee876cc52.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:22:43');
INSERT INTO `jpress_attachment` VALUES ('7', 'imagetools4.png', '1', null, '/attachment/20161222/073df261a4ea453495184c134c9f9f0b.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:23:24');
INSERT INTO `jpress_attachment` VALUES ('8', 'imagetools0.png', '1', null, '/attachment/20161222/a1f6bf7f194a4aaf880fa2b33ab3ffc3.png', 'image/png', '.png', null, null, null, null, null, '2016-12-22 19:26:13');
INSERT INTO `jpress_attachment` VALUES ('9', 'd028449d191ee865bf6f173ca10c332e.jpg', '1', null, '/attachment/20161222/468a4d4cdf174b4e8edd6d61b1730be5.jpg', 'image/jpeg', '.jpg', null, null, null, null, null, '2016-12-22 19:33:33');
INSERT INTO `jpress_attachment` VALUES ('10', '06788eb756e0436e9f64fa2546be86b1.jpg', '1', null, '/attachment/20161223/aa80d8e58f4449288c658d1bffa3d88d.jpg', 'image/jpeg', '.jpg', null, null, null, null, null, '2016-12-23 11:55:28');

-- ----------------------------
-- Table structure for jpress_comment
-- ----------------------------
DROP TABLE IF EXISTS `jpress_comment`;
CREATE TABLE `jpress_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复的评论ID',
  `content_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论的内容ID',
  `content_module` varchar(32) DEFAULT NULL COMMENT '评论的内容模型',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论的回复数量',
  `order_number` int(11) unsigned DEFAULT '0' COMMENT '排序编号，常用语置顶等',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论的用户ID',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论的IP地址',
  `author` varchar(128) DEFAULT NULL COMMENT '评论的作者',
  `type` varchar(32) DEFAULT 'comment' COMMENT '评论的类型，默认是comment',
  `text` longtext COMMENT '评论的内容',
  `agent` text COMMENT '提交评论的浏览器信息',
  `created` datetime DEFAULT NULL COMMENT '评论的时间',
  `slug` varchar(128) DEFAULT NULL COMMENT '评论的slug',
  `email` varchar(64) DEFAULT NULL COMMENT '评论用户的email',
  `status` varchar(32) DEFAULT NULL COMMENT '评论的状态',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '“顶”的数量',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '“踩”的数量',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  KEY `email` (`email`),
  KEY `created` (`created`),
  KEY `parent_id` (`parent_id`),
  KEY `content_module` (`content_module`),
  KEY `comment_count` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='评论表，用于保存content内容的回复、分享、推荐等信息。';

-- ----------------------------
-- Records of jpress_comment
-- ----------------------------
INSERT INTO `jpress_comment` VALUES ('1', null, '2', 'article', '0', '0', '1', '127.0.0.1', 'admin', 'comment', '使得法国', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-22 19:10:45', null, null, 'normal', '0', '0', null, null, null);
INSERT INTO `jpress_comment` VALUES ('2', null, '5', 'article', '0', '0', '1', '127.0.0.1', 'admin', 'comment', 'gggg', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-22 19:34:22', null, null, 'normal', '0', '0', null, null, null);
INSERT INTO `jpress_comment` VALUES ('3', '2', '5', 'article', '0', '0', '1', '127.0.0.1', 'admin', 'comment', '<p>嘿嘿</p>', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-22 19:37:27', null, null, 'normal', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for jpress_content
-- ----------------------------
DROP TABLE IF EXISTS `jpress_content`;
CREATE TABLE `jpress_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` text COMMENT '标题',
  `text` longtext COMMENT '内容',
  `summary` text COMMENT '摘要',
  `link_to` varchar(256) DEFAULT NULL COMMENT '连接到(常用于谋文章只是一个连接)',
  `markdown_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用markdown',
  `thumbnail` varchar(128) DEFAULT NULL COMMENT '缩略图',
  `module` varchar(32) DEFAULT NULL COMMENT '模型',
  `style` varchar(32) DEFAULT NULL COMMENT '样式',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `author` varchar(128) DEFAULT NULL COMMENT '匿名稿的用户',
  `user_email` varchar(128) DEFAULT NULL COMMENT '匿名稿的邮箱',
  `user_ip` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` text COMMENT '发布浏览agent',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父级内容ID',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联的对象ID',
  `order_number` int(11) unsigned DEFAULT '0' COMMENT '排序编号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '支持人数',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '反对人数',
  `rate` int(11) DEFAULT NULL COMMENT '评分分数',
  `rate_count` int(10) unsigned DEFAULT '0' COMMENT '评分次数',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `comment_status` varchar(32) DEFAULT NULL COMMENT '评论状态',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论总数',
  `comment_time` datetime DEFAULT NULL COMMENT '最后评论时间',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '访问量',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述信息',
  `remarks` text COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `content_module` (`module`),
  KEY `created` (`created`),
  KEY `vote_down` (`vote_down`),
  KEY `vote_up` (`vote_up`),
  KEY `view_count` (`view_count`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='内容表，用于存放比如文章、帖子、商品、问答等用户自定义模型内容。也用来存放比如菜单、购物车、消费记录等系统模型。';

-- ----------------------------
-- Records of jpress_content
-- ----------------------------
INSERT INTO `jpress_content` VALUES ('1', '第一个页面', '<p>first page</p>', null, null, '0', '/jpress-web-newest/attachment/20161222/2d8f7f72175a406f83e57be5510505eb.jpg', 'page', null, '1', null, null, null, null, null, null, '0', 'normal', '0', '0', null, '0', '0.00', null, '0', null, '4', '2016-12-22 19:08:00', '2016-12-22 19:56:03', 'page1', null, null, null, null, null, null);
INSERT INTO `jpress_content` VALUES ('2', 'SpringBoot入门系列：第二篇 再学Hello World', '<p><a class=\"replace_word\" title=\"Java EE知识库\" href=\"http://lib.csdn.net/base/javaee\" target=\"_blank\">spring</a>-Boot是Spring的新东东，为了让人尽快的使用，它提供了一个非常好的辅助工具，直接为我们生成Maven<a class=\"replace_word\" title=\"大型网站架构知识库\" href=\"http://lib.csdn.net/base/architecture\" target=\"_blank\">架构</a>的工程。下面，我们通过helloworld看</p> \n<p><img src=\"/jpress-web-newest\\attachment\\20161222\\5edffc7130d14b1988669c0ee876cc52.png\" alt=\"\" width=\"750\" height=\"400\"></p> \n<p>&nbsp;</p> \n<p>在Artifact中输入spring-boot-sample-helloworld，点击“<a href=\"http://start.spring.io/#\" target=\"_blank\">Switch to the full version.</a>”，勾选\"web\"，然后点击“&nbsp;Generate Project alt +”按钮，把文件保存到本地某个位置</p> \n<p>&nbsp;</p> \n<p>二、下载文件导入eclips</p> \n<p>1、解压下载的文件到某个文件夹；</p> \n<p>2、在eclips中导入工程file-&gt;import-&gt;Import Existing Maven Projects--&gt;Select Maven projects--&gt;finish</p> \n<p>3、在eclips中运行工程，正确则入图</p> \n<p>&nbsp;</p> \n<p><img src=\"/jpress-web-newest\\attachment\\20161222\\073df261a4ea453495184c134c9f9f0b.png\" alt=\"\" width=\"700\" height=\"372\"></p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>三、添加HelloController</p> \n<p>1、在包com.example中点击右键，选择new-&gt;class,再在Name中输入HelloController,入下图</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160624130242100?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"794\" height=\"856\"></p> \n<p>&nbsp;</p> \n<p>在上图中点击\"Finish\"</p> \n<p>2、在类上面条件声明@RestController</p> \n<p>3、增加方法</p> \n<pre class=\"language-java\"><code>@RequestMapping(\"/\")  \n    public String helloworld(){  \n        return \"Hello world!\";  \n    }  \n      \n    @RequestMapping(\"/hello/{name}\")  \n    public String hellName(@PathVariable String Name){  \n        return \"Hello \"+Name;  \n    }  </code></pre> \n<p>&nbsp;</p> \n<p>4、保存Ctrl+S</p> \n<p>5、自动添加引用 Ctrl+SHift+O</p> \n<p>6、整个HelloController文件如下</p> \n<p>&nbsp;</p> \n<pre class=\"language-java\"><code>package com.example;  \n  \nimport org.springframework.web.bind.annotation.PathVariable;  \nimport org.springframework.web.bind.annotation.RequestMapping;  \nimport org.springframework.web.bind.annotation.RestController;  \n  \n@RestController  \npublic class HelloController {  \n  \n    @RequestMapping(\"/\")  \n    public String helloworld(){  \n        return \"Hello world!\";  \n    }  \n      \n    @RequestMapping(\"/hello/{name}\")  \n    public String hellName(@PathVariable String name){  \n        return \"Hello \"+name;  \n    }  \n}  </code></pre> \n<p>&nbsp;</p> \n<p>7、启动测试</p> \n<p>&nbsp;</p> \n<p>在浏览器中依次输入</p> \n<p>http://localhost:8080/</p> \n<p>http://localhost:8080/hello/上帝</p> \n<p><img src=\"http://img.blog.csdn.net/20160624132450132?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"1210\" height=\"192\"></p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p>', null, null, '0', '/jpress-web-newest/attachment/20161222/21a955ef29eb413e8e243e8128ae9670.png', 'article', null, '1', null, null, null, null, null, null, '0', 'normal', '0', '0', null, '0', '0.00', null, '1', null, '9', '2016-12-22 19:10:33', '2016-12-23 11:54:44', 'SpringBoot入门系列第二篇_再学Hello_World', null, null, null, null, null, null);
INSERT INTO `jpress_content` VALUES ('3', '博客', '/jpress-web-newest/article', null, null, '0', null, 'menu', null, null, null, null, null, null, null, '1', '1', 'normal', '0', '0', null, '0', '0.00', null, '0', null, '0', '2016-12-23 11:59:43', '2016-12-23 11:59:43', null, null, null, null, null, null, null);
INSERT INTO `jpress_content` VALUES ('4', 'SpringBoot入门系列：第一篇 Hello World', '<p>跟随SpringBoot的文档（http://docs.<a class=\"replace_word\" title=\"Java EE知识库\" href=\"http://lib.csdn.net/base/javaee\" target=\"_blank\">spring</a>.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#boot-documentation）学习，前后几章关联才调通代码，煞是痛苦，在这里记录结果，过程隐忍。</p> \n<p>一、准备工作</p> \n<p>1、根据Maven工程特点，建立文档结果</p> \n<p>myFirstProject</p> \n<p>&nbsp; +-src</p> \n<p>&nbsp;&nbsp;&nbsp; +-main</p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +-<a class=\"replace_word\" title=\"Java SE知识库\" href=\"http://lib.csdn.net/base/javase\" target=\"_blank\">Java</a></p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +-resources</p> \n<p>&nbsp;&nbsp;&nbsp; +-test</p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +-java</p> \n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +-resources</p> \n<p>2、再在src/main/java下依次建立文件夹com，example，myFirstProject，可以构成Maven工程包(package)--&gt;com.example.myFirstProject,最后文档结构如图1</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160619093542021?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"426\" height=\"394\"></p> \n<p>&nbsp;</p> \n<p>3、编制pom.xml,存于myFirstProject文件夹下，与src同级</p> \n<pre class=\"language-xml\"><code>  \n  \n    4.0.0  \n  \n    com.example  \n    myFirstproject  \n    0.0.1-SNAPSHOT  \n  \n      \n      \n        org.springframework.boot  \n        spring-boot-starter-parent  \n        1.4.0.BUILD-SNAPSHOT  \n      \n  \n      \n      \n          \n            org.springframework.boot  \n            spring-boot-starter-web  \n          \n      \n  \n      \n      \n          \n              \n                org.springframework.boot  \n                spring-boot-maven-plugin  \n              \n          \n      \n  \n      \n      \n      \n          \n            spring-snapshots  \n            http://repo.spring.io/snapshot  \n            true  \n          \n          \n            spring-milestones  \n            http://repo.spring.io/milestone  \n          \n      \n      \n          \n            spring-snapshots  \n            http://repo.spring.io/snapshot  \n          \n          \n            spring-milestones  \n            http://repo.spring.io/milestone  \n          \n      \n  </code></pre> \n<p>&nbsp;</p> \n<p>文档内容从SpringBoot的文档拷贝</p> \n<p>&nbsp;</p> \n<p>4、编制Application.java存于myFirstProject\\src\\main\\java\\com\\example\\myFirstProject下</p> \n<pre class=\"language-java\"><code>package com.example.myFirstProject;  \n  \nimport org.springframework.boot.SpringApplication;  \nimport org.springframework.boot.autoconfigure.SpringBootApplication;  \n  \n  \n@SpringBootApplication  \npublic class Application {  \n  \n    public static void main(String[] args) {  \n        SpringApplication.run(Application.class, args);  \n    }  \n}  </code></pre> \n<p>&nbsp;</p> \n<p>5、编制Example.java，存于myFirstProject\\src\\main\\java\\com\\example\\myFirstProject下</p> \n<p>&nbsp;</p> \n<pre class=\"language-java\"><code>package com.example.myFirstProject;  \n  \nimport org.springframework.boot.autoconfigure.EnableAutoConfiguration;  \nimport org.springframework.web.bind.annotation.PathVariable;  \nimport org.springframework.web.bind.annotation.RequestMapping;  \nimport org.springframework.web.bind.annotation.RestController;  \n  \n@RestController  \n@EnableAutoConfiguration  \npublic class Example {  \n      \n    @RequestMapping(\"/\")  \n    String home() {  \n        return \"Hello World!\";  \n    }  \n      \n    @RequestMapping(\"/hello/{myName}\")  \n    String index(@PathVariable String myName) {  \n        return \"Hello \"+myName+\"!!!\";  \n    }  \n}  </code></pre> \n<p>&nbsp;</p> \n<p>二、Maven工程导入</p> \n<p>&nbsp;</p> \n<p>1、启动eclipse</p> \n<p>&nbsp;&nbsp;&nbsp; 1.1、java--&gt;jdk1.7.0_80x64</p> \n<p>&nbsp;&nbsp;&nbsp; 1.2、maven--&gt;Apache Maven 3.3.3</p> \n<p>&nbsp;&nbsp;&nbsp; 1.3、Eclipse <a class=\"replace_word\" title=\"Java EE知识库\" href=\"http://lib.csdn.net/base/javaee\" target=\"_blank\">Java EE</a> IDE for Web Developers. Version: Mars Release (4.5.0)</p> \n<p>&nbsp;&nbsp;&nbsp; 1.4、为本练习，新建一个workgroup</p> \n<p>2、在eclipse中，依次点击file--&gt;import--&gt;Maven--&gt;Existing Maven Projects--&gt;Next--&gt;Browse--&gt;定位到myFirstProject文件夹--&gt;确定--Finish</p> \n<p>3、导入结果如图2</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160619100805150?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"577\" height=\"471\"></p> \n<p>&nbsp;</p> \n<p>三、运行</p> \n<p>1、在eclipse的工程myFirstProject上右击鼠标，选择Run as--&gt;<a class=\"replace_word\" title=\"Java 知识库\" href=\"http://lib.csdn.net/base/java\" target=\"_blank\">Java </a>Application，如图3</p> \n<p>&nbsp;</p> \n<p><img src=\"/jpress-web-newest\\attachment\\20161222\\a1f6bf7f194a4aaf880fa2b33ab3ffc3.png\" alt=\"\" width=\"900\" height=\"623\"></p> \n<p>&nbsp;</p> \n<p>2、在select Java Aplication中选择“Application -com.example.myFirstProject”，如图4</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160619101752519?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"704\" height=\"648\"></p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>3、再次点击“OK”按钮,在Eclipse的Console中开始打印如图5</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160619101936779?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"1878\" height=\"844\"></p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>4、打开浏览器，输入http://localhost:8080，显示如图6</p> \n<p>&nbsp;</p> \n<p><img src=\"http://img.blog.csdn.net/20160619102227087?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"752\" height=\"312\"></p> \n<p>&nbsp;</p> \n<p>5、在浏览器中,输入http://localhost:8080/hello/SpringBoot</p> \n<p><img src=\"http://img.blog.csdn.net/20160619102438417?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\" alt=\"\" width=\"650\" height=\"182\"></p> \n<p>&nbsp;</p> \n<p>四、后记</p> \n<p>痛则不通，通则不痛。这个例子非常之简单，为了这个简单，费事不少。为了这个例子能够成功，最好做以下准备</p> \n<p>1、构建本地的Maven伺服，否则速度痛苦</p> \n<p>2、Sonatype Nexus尽量和jdk相对应的版本，不要最求最新，否则可能启动不起来。</p> \n<p>3、Sonatype Nexus搭建，参考</p> \n<p>&nbsp;</p> \n<h1 class=\"postTitle\"><a id=\"cb_post_title_url\" class=\"postTitle2\" href=\"http://www.cnblogs.com/luotaoyeah/p/3791966.html\" target=\"_blank\">Maven入门指南⑤：使用Nexus搭建Maven私服</a></h1> \n<h1><a name=\"t1\"></a></h1> \n<h1><a name=\"t2\"></a><span class=\"link_title\"><a href=\"http://blog.csdn.net/shawyeok/article/details/23564681\" target=\"_blank\">使用nexus搭建maven私服、手动更新索引</a></span></h1>', null, null, '0', '/jpress-web-newest\\attachment\\20161223\\aa80d8e58f4449288c658d1bffa3d88d.jpg', 'article', null, '1', null, null, null, null, null, null, '0', 'normal', '0', '0', null, '0', '0.00', null, '0', null, '21', '2016-12-22 19:28:24', '2016-12-23 11:55:32', 'SpringBoot入门系列第一篇_Hello_World', null, null, null, null, null, null);
INSERT INTO `jpress_content` VALUES ('5', 'MongoDB初探--安装和启动', '<h2 id=\"在mongodb中文网下载安装包\">在MongoDB中文网下载安装包</h2> \n<p>链接:<a href=\"http://pan.baidu.com/s/1dDGzlmh\">http://pan.baidu.com/s/1dDGzlmh</a>密码: 3gun</p> \n<h2 id=\"安装\"><a name=\"t1\"></a>安装</h2> \n<ul> \n <li> <p>随意安装 <br><img title=\"\" src=\"http://img.blog.csdn.net/20160329214353708\" alt=\"这里写图片描述\"></p> </li> \n</ul> \n<ul> \n <li> <p>next-&gt;finish</p> </li> \n <li>此时MongDB默认安装在C:\\Program Files\\MongDB下</li> \n <li>我们可以随意前切粘贴到D盘或E盘，我放在了E盘</li> \n <li>配置环境变量,在path中添加MongoDB目录下的bin路径”E:\\MongoDB\\Server\\3.0\\bin”</li> \n</ul> \n<p>&nbsp;</p> \n<p><img title=\"\" src=\"http://img.blog.csdn.net/20160329214957154\" alt=\"这里写图片描述\"> <br>这样就算安装完成了。是不是比sql、<a class=\"replace_word\" title=\"MySQL知识库\" href=\"http://lib.csdn.net/base/mysql\" target=\"_blank\">MySQL</a>方便多啦?!!!!!!!!!!!!!!!!!!!!!!!!!!</p> \n<h2 id=\"启动\">启动</h2> \n<ul> \n <li>win+R</li> \n <li>cmd</li> \n <li>进入如下目录（视安装位置而定，进入到MongoDB\\Server\\3.0\\bin\\data下） <br><img title=\"\" src=\"http://img.blog.csdn.net/20160329215436722\" alt=\"这里写图片描述\"></li> \n <li>启动 <br><img title=\"\" src=\"http://img.blog.csdn.net/20160329215730382\" alt=\"这里写图片描述\"></li> \n <li>启动成功</li> \n <li><img title=\"\" src=\"http://img.blog.csdn.net/20160329215814773\" alt=\"这里写图片描述\"></li> \n <li>访问端口<code>http://localhost:27017/</code> <br><img title=\"\" src=\"http://img.blog.csdn.net/20160329220217419\" alt=\"这里写图片描述\"> <br>启动成功！！！</li> \n</ul> \n<p>&nbsp;</p> \n<p>&nbsp;</p>', null, null, '0', '/jpress-web-newest/attachment/20161222/2d8f7f72175a406f83e57be5510505eb.jpg', 'article', null, '1', null, null, null, null, null, null, '0', 'normal', '0', '0', null, '0', '0.00', null, '2', null, '11', '2016-12-22 19:34:09', '2016-12-23 11:54:25', 'MongoDB初探__安装和启动', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jpress_mapping
-- ----------------------------
DROP TABLE IF EXISTS `jpress_mapping`;
CREATE TABLE `jpress_mapping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content_id` bigint(20) unsigned NOT NULL COMMENT '内容ID',
  `taxonomy_id` bigint(20) unsigned NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`),
  KEY `taxonomy_id` (`taxonomy_id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='内容和分类的多对多映射关系。';

-- ----------------------------
-- Records of jpress_mapping
-- ----------------------------
INSERT INTO `jpress_mapping` VALUES ('29', '5', '1');
INSERT INTO `jpress_mapping` VALUES ('30', '5', '2');
INSERT INTO `jpress_mapping` VALUES ('31', '5', '5');
INSERT INTO `jpress_mapping` VALUES ('32', '2', '1');
INSERT INTO `jpress_mapping` VALUES ('33', '2', '2');
INSERT INTO `jpress_mapping` VALUES ('34', '2', '3');
INSERT INTO `jpress_mapping` VALUES ('35', '4', '1');
INSERT INTO `jpress_mapping` VALUES ('36', '4', '2');
INSERT INTO `jpress_mapping` VALUES ('37', '4', '3');

-- ----------------------------
-- Table structure for jpress_metadata
-- ----------------------------
DROP TABLE IF EXISTS `jpress_metadata`;
CREATE TABLE `jpress_metadata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `meta_key` varchar(255) DEFAULT NULL COMMENT '元数据key',
  `meta_value` text COMMENT '元数据value',
  `object_type` varchar(32) DEFAULT NULL COMMENT '元数据的对象类型',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '元数据的对象ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='元数据表，用来对其他表的字段扩充。';

-- ----------------------------
-- Records of jpress_metadata
-- ----------------------------
INSERT INTO `jpress_metadata` VALUES ('1', '_meta1', null, 'content', '2');
INSERT INTO `jpress_metadata` VALUES ('2', '_meta2', null, 'content', '2');
INSERT INTO `jpress_metadata` VALUES ('3', '_meta1', null, 'content', '4');
INSERT INTO `jpress_metadata` VALUES ('4', '_meta2', null, 'content', '4');
INSERT INTO `jpress_metadata` VALUES ('5', '_meta1', null, 'content', '5');
INSERT INTO `jpress_metadata` VALUES ('6', '_meta2', null, 'content', '5');

-- ----------------------------
-- Table structure for jpress_option
-- ----------------------------
DROP TABLE IF EXISTS `jpress_option`;
CREATE TABLE `jpress_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `option_key` varchar(128) DEFAULT NULL COMMENT '配置KEY',
  `option_value` text COMMENT '配置内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='配置信息表，用来保存网站的所有配置信息。';

-- ----------------------------
-- Records of jpress_option
-- ----------------------------
INSERT INTO `jpress_option` VALUES ('1', 'web_name', '欢迎使用Jpress');
INSERT INTO `jpress_option` VALUES ('2', 'web_administrator_email', null);
INSERT INTO `jpress_option` VALUES ('3', 'web_administrator_wechat_openid', null);
INSERT INTO `jpress_option` VALUES ('4', 'web_icp_number', null);
INSERT INTO `jpress_option` VALUES ('5', 'autosave', 'watermark_enable,watermark_image,watermark_transparency,watermark_position');
INSERT INTO `jpress_option` VALUES ('6', 'web_subtitle', null);
INSERT INTO `jpress_option` VALUES ('7', 'web_title', 'Jpress');
INSERT INTO `jpress_option` VALUES ('8', 'web_domain', null);
INSERT INTO `jpress_option` VALUES ('9', 'web_administrator_phone', null);
INSERT INTO `jpress_option` VALUES ('10', 'ucode', '3e2f3bddba0a0f036496ce2a24569274');
INSERT INTO `jpress_option` VALUES ('11', 'web_copyright', 'Jpress测试');
INSERT INTO `jpress_option` VALUES ('12', 'comment_default_nickname', 'guest');
INSERT INTO `jpress_option` VALUES ('13', 'comment_allow_not_login', null);
INSERT INTO `jpress_option` VALUES ('14', 'comment_default_avatar', '/attachment/20161222/4e8dd6067622489b82ddbf34103b64ab.png');
INSERT INTO `jpress_option` VALUES ('15', 'comment_need_captcha', null);
INSERT INTO `jpress_option` VALUES ('16', 'comment_must_audited', null);
INSERT INTO `jpress_option` VALUES ('17', 'watermark_enable', null);
INSERT INTO `jpress_option` VALUES ('18', 'watermark_transparency', '1');
INSERT INTO `jpress_option` VALUES ('19', 'watermark_position', '5');
INSERT INTO `jpress_option` VALUES ('20', 'watermark_image', null);
INSERT INTO `jpress_option` VALUES ('21', 'router_content_type', '_static_module_id');
INSERT INTO `jpress_option` VALUES ('22', 'router_fakestatic_enable', null);
INSERT INTO `jpress_option` VALUES ('23', 'router_fakestatic_suffix', null);
INSERT INTO `jpress_option` VALUES ('24', 'router_content_prefix', null);
INSERT INTO `jpress_option` VALUES ('25', 'jpblog_wechat_pay_tips', null);
INSERT INTO `jpress_option` VALUES ('26', 'jpblog_wechat_pay_image', null);
INSERT INTO `jpress_option` VALUES ('27', 'jpblog_statistical_code', null);
INSERT INTO `jpress_option` VALUES ('28', 'jpblog_wechat_pay_enable', null);
INSERT INTO `jpress_option` VALUES ('29', 'jpblog_banner_url', null);
INSERT INTO `jpress_option` VALUES ('30', 'jpblog_banner_image', null);

-- ----------------------------
-- Table structure for jpress_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `jpress_taxonomy`;
CREATE TABLE `jpress_taxonomy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `text` text COMMENT '内容描述',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `content_module` varchar(32) DEFAULT NULL COMMENT '对于的内容模型',
  `content_count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
  `order_number` int(11) DEFAULT NULL COMMENT '排序编码',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父级分类的ID',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联的对象ID',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `object_id` (`object_id`),
  KEY `content_module` (`content_module`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='分类表。标签、专题、类别等都属于taxonomy。';

-- ----------------------------
-- Records of jpress_taxonomy
-- ----------------------------
INSERT INTO `jpress_taxonomy` VALUES ('1', '博客', '博客文章', 'blog', 'category', null, 'article', '3', null, '0', null, null, null, null, null, null, null);
INSERT INTO `jpress_taxonomy` VALUES ('2', 'IT技术内容', null, 'it', 'feature', null, 'article', '3', null, '0', null, null, null, null, null, null, null);
INSERT INTO `jpress_taxonomy` VALUES ('3', 'springboot', null, 'springboot', 'tag', 'group', 'article', '2', null, null, null, null, null, null, null, null, null);
INSERT INTO `jpress_taxonomy` VALUES ('4', 'Jpress', null, 'jpress', 'tag', null, 'article', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `jpress_taxonomy` VALUES ('5', 'mongodb', null, 'mongodb', 'tag', null, 'article', '1', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jpress_user
-- ----------------------------
DROP TABLE IF EXISTS `jpress_user`;
CREATE TABLE `jpress_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(128) DEFAULT NULL COMMENT '登陆名',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `realname` varchar(128) DEFAULT NULL COMMENT '实名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `email_status` varchar(32) DEFAULT NULL COMMENT '邮箱状态（是否认证等）',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机电话',
  `mobile_status` varchar(32) DEFAULT NULL COMMENT '手机状态（是否认证等）',
  `telephone` varchar(32) DEFAULT NULL COMMENT '固定电话',
  `amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '金额（余额）',
  `gender` varchar(16) DEFAULT NULL COMMENT '性别',
  `role` varchar(32) DEFAULT 'visitor' COMMENT '权限',
  `signature` varchar(2048) DEFAULT NULL COMMENT '签名',
  `content_count` int(11) unsigned DEFAULT '0' COMMENT '内容数量',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论数量',
  `qq` varchar(16) DEFAULT NULL COMMENT 'QQ号码',
  `wechat` varchar(32) DEFAULT NULL COMMENT '微信号',
  `weibo` varchar(256) DEFAULT NULL COMMENT '微博',
  `facebook` varchar(256) DEFAULT NULL,
  `linkedin` varchar(256) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `company` varchar(256) DEFAULT NULL COMMENT '公司',
  `occupation` varchar(256) DEFAULT NULL COMMENT '职位、职业',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `zipcode` varchar(128) DEFAULT NULL COMMENT '邮政编码',
  `site` varchar(256) DEFAULT NULL COMMENT '个人网址',
  `graduateschool` varchar(256) DEFAULT NULL COMMENT '毕业学校',
  `education` varchar(256) DEFAULT NULL COMMENT '学历',
  `avatar` varchar(256) DEFAULT NULL COMMENT '头像',
  `idcardtype` varchar(128) DEFAULT NULL COMMENT '证件类型：身份证 护照 军官证等',
  `idcard` varchar(128) DEFAULT NULL COMMENT '证件号码',
  `status` varchar(32) DEFAULT 'normal' COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `create_source` varchar(128) DEFAULT NULL COMMENT '用户来源（可能来之oauth第三方）',
  `logged` datetime DEFAULT NULL COMMENT '最后的登陆时间',
  `activated` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `content_count` (`content_count`),
  KEY `comment_count` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表，保存用户信息。';

-- ----------------------------
-- Records of jpress_user
-- ----------------------------
INSERT INTO `jpress_user` VALUES ('1', 'admin', null, null, '9c9c195d91ac99b30a7c16c094cd132ad05d27824a70112e13643e564680be94', '46bfa184ed18d2f390ef', null, null, null, null, null, '0.00', null, 'administrator', null, '4', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '/attachment/20161222/f7716121eb9d4853b94da7991e66671a.png', null, null, 'activited', '2016-12-22 19:03:38', null, '2016-12-22 19:07:28', null);
