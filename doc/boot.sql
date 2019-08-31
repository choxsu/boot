/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : choxsu

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 25/08/2019 11:16:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `createAt` datetime(0) NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `likeCount` int(11) NOT NULL DEFAULT 0 COMMENT '被赞次数',
  `isThird` int(2) NULL DEFAULT 0 COMMENT '是否第三方登陆 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'ChoxSu', 'choxsu@gmail.com', '5bbbe863f01c77c3873d93ebe2b2c926de52ff728b088e50019156b37ca5c083', 'ctozjvgRCT18mM_Eb_ye9DllokugYrR3', 1, '2018-04-18 09:00:19', '175.12.244.105', '0/1.jpg', 0, 0);
INSERT INTO `account` VALUES (2, '管理员', 'admin@styg.site', '0578028539a72c0bff4ea80510ad79548a89534c03ed376682de1ed457669f9e', '8wCSdUV6EJBvPg9zDkphts9JAHFNyO6t', 1, '2018-04-19 10:19:11', '175.12.244.105', '0/1.jpg', 0, 0);
INSERT INTO `account` VALUES (3, 'test', 'test@test.com', 'bd7c6d0e95221c2caf4afabce53ff2e59524377ae91939562f2a73f41128d076', 'RS_xQw8fhclJqZU2iDPYqa8EYyF9T6pc', 1, '2018-09-27 12:04:25', '183.64.28.18', '0/1.jpg', 0, 0);
INSERT INTO `account` VALUES (4, '2283546325', '2283546325@qq.com', '0330b6f6333b1604c50b9b220dbaedf36d950da05fe7015d11363b7d169633a4', 'L0CDX05Ei_IQ2ip7oEroePws4UB_VhHH', 1, '2018-12-24 22:56:22', '106.87.5.176', '0/1.jpg', 0, 0);
INSERT INTO `account` VALUES (5, 'ChoxSu', '', '', '', 1, '2019-04-26 18:30:28', '113.206.204.108', 'http://thirdqq.qlogo.cn/g?b=oidb&k=xicaTlW45aV3cfeTh6fa8LA&s=40', 0, 1);
INSERT INTO `account` VALUES (6, '123456', 'test@gmail.com', 'c0e68cf29980f6a7d4d0552b5c988f03939baead850b3a3ed71ad7e9c39cdbf0', 'MCRO22-YyWRwpWwuHTCJ2GQfmJSs2tFy', 1, '2019-05-19 17:05:35', '0:0:0:0:0:0:0:1', 'default.png', 0, 0);
INSERT INTO `account` VALUES (7, 'test1', 'test1@gmail.com', 'a55dfb6ad35314e2ff442f342f258f004697180743bffc8ad6594ca1fcbae7ff', 'MTZAz97M8Pjagg0sYxWm5F6UIsHI1Xv3', 1, '2019-05-19 17:10:19', '0:0:0:0:0:0:0:1', 'default.png', 0, 0);

-- ----------------------------
-- Table structure for account_open
-- ----------------------------
DROP TABLE IF EXISTS `account_open`;
CREATE TABLE `account_open`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `accountId` int(11) NOT NULL COMMENT '账户ID',
  `openType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方类型，比如qq、weibo',
  `openId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表用户唯一身份的ID',
  `accessToken` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用接口需要用到的token，比如利用accessToken发表微博等，如果只是对接登录的话，这个其实没啥用',
  `expiredTime` bigint(20) NULL DEFAULT NULL COMMENT '授权过期时间，第三方登录授权都是有过期时间的，比如3个月之后，这里存放毫秒数，过期的毫秒数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountIdAndOpenId`(`accountId`, `openId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户-登录第三方表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_open
-- ----------------------------
INSERT INTO `account_open` VALUES (2, 5, 'qq', 'C561FD0C7A0E9B3810F38AE1A12A978D', '60951872E5B815BF8F12859C4334D2E7', 7776000);

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role`  (
  `accountId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`, `roleId`) USING BTREE,
  INDEX `accountId`(`accountId`, `roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_role
-- ----------------------------
INSERT INTO `account_role` VALUES (1, 1);
INSERT INTO `account_role` VALUES (2, 6);
INSERT INTO `account_role` VALUES (3, 9);

-- ----------------------------
-- Table structure for auth_code
-- ----------------------------
DROP TABLE IF EXISTS `auth_code`;
CREATE TABLE `auth_code`  (
  `id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountId` int(11) NOT NULL,
  `expireAt` bigint(20) NOT NULL,
  `type` int(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_code
-- ----------------------------
INSERT INTO `auth_code` VALUES ('1b8e4d9fad9645a888316337e06329f7', 1, 1558249927762, 1);
INSERT INTO `auth_code` VALUES ('374ce2e12bf24f10a8815de34fa84869', 1, 1558250293102, 1);
INSERT INTO `auth_code` VALUES ('3c34cb7f7a8645169660db03aa595256', 1, 1558250139857, 1);
INSERT INTO `auth_code` VALUES ('53b85dc5d887425c86a51e6b6d0273d2', 1, 1558250263400, 1);
INSERT INTO `auth_code` VALUES ('75aa3415e0534739af36d8c015f43f64', 1, 1558249854466, 1);
INSERT INTO `auth_code` VALUES ('b5f7d752e99a48968205b589d957341e', 1, 1558249866051, 1);
INSERT INTO `auth_code` VALUES ('d51036b45d6048acb1c6e99aaec7e119', 1, 1558249984153, 1);
INSERT INTO `auth_code` VALUES ('e51eef1d13b9437285be3cae263ed6c0', 1, 1558249823043, 1);
INSERT INTO `auth_code` VALUES ('f9603919d3754240b0c4c6579922c501', 1, 1558250386780, 1);
INSERT INTO `auth_code` VALUES ('f9b5b0b98b714696988c8dc2aac5907b', 1, 1558254642345, 1);

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `accountId` int(11) NULL DEFAULT NULL COMMENT '博客主id',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `markedContent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '待解析内容',
  `createAt` datetime(0) NOT NULL COMMENT '创建时间',
  `updateAt` datetime(0) NOT NULL COMMENT '修改时间',
  `clickCount` int(11) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `likeCount` int(11) NOT NULL DEFAULT 0 COMMENT '喜欢次数',
  `favoriteCount` int(11) NOT NULL DEFAULT 0 COMMENT '收藏次数',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型 note（笔记）favorite(收藏）code(代码）about(关于）',
  `isDelete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0否1是',
  `tag_id` int(11) NULL DEFAULT NULL COMMENT 'tag_id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '代码分类id，如果category为code时候，这个值才会生效',
  `allowComments` tinyint(1) NULL DEFAULT 0 COMMENT '允许评论',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (14, 1, '我的简历', '<h1 id=\"h1-u8054u7CFBu65B9u5F0F\"><a name=\"联系方式\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>联系方式</h1><ul>\n<li>手机：189 9632 7369</li><li>Email：<a href=\"mailto:choxsu@gmail.com\">choxsu@gmail.com</a></li><li>QQ/微信号：2283546325/qxs31013991</li></ul>\n\n<h1 id=\"h1-u4E2Au4EBAu4FE1u606F\"><a name=\"个人信息\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>个人信息</h1><ul>\n<li>苏小秋/男/1993</li><li>大专/贵州电力职业技术学院、电力系统自动化</li><li>工作年限：3年</li><li>技术博客：<a href=\"http://choxsu.im/article\">http://choxsu.im/article</a></li><li>Gitee：<a href=\"https://gitee.com/choxsu\">https://gitee.com/choxsu</a></li><li>期望职位：Java高级程序员，架构师</li><li>期望薪资：税前月薪11k~15k，特别喜欢的公司可例外</li><li>期望城市：重庆</li></ul>\n\n<h1 id=\"h1-u6280u80FDu6E05u5355\"><a name=\"技能清单\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>技能清单</h1><p>以下均为我熟练使用的技能</p>\n<ul>\n<li>Web框架：SpringMvc/JFinal</li><li>前端框架：Vue/Bootstrap</li><li>开发工具：Idea/Eclipse</li><li>数据库相关：MySQL/Oracle</li><li>版本管理、文档管理工具：Svn/Git/apidoc</li><li>第三方开放平台：微信公众号开发</li></ul>\n<h2 id=\"h2-u53C2u8003u6280u80FDu5173u952Eu5B57\"><a name=\"参考技能关键字\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>参考技能关键字</h2><ul>\n<li>java</li><li>spring</li><li>mysql</li><li>linux</li><li>sql</li><li>mybatis</li><li>redis</li><li>nginx</li><li>api</li><li>git</li></ul>\n<h1 id=\"h1-u5DE5u4F5Cu7ECFu5386\"><a name=\"工作经历\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>工作经历</h1><h2 id=\"h2--2017-7-2019-3-\"><a name=\"重庆喜联科技发展有限公司（2017.7~2019.3）\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>重庆喜联科技发展有限公司（2017.7~2019.3）</h2><h3 id=\"h3-1-2-\"><a name=\"1+2新零售项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1+2新零售项目</h3><h5 id=\"h5-u9879u76EEu63CFu8FF0\"><a name=\"项目描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目描述</h5><p>项目主要是做的是爆款产品的批发零售系统，主要有批发购买抢购业务，自由批发业务，兑换专区业务。<br>1、批发抢购:实现了排队抢购的逻辑计算<br>2、自由批发:实现了订单超时，订单成交等业务<br>3、兑换专区:实现产品列表，列表同步es，可做全文检索，产品规格，兑换下单<br>4、使用框架:当下最流行的springboot，后台架构分层MVC，数据层使用到了jpa,mybatis等，缓存用到了redis ，全文检索使用分布式检索框架es。</p>\n<h5 id=\"h5-u8D23u4EFBu63CFu8FF0\"><a name=\"责任描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>责任描述</h5><ul>\n<li>负责排队业务的处理</li><li>负责所有订单的超时业务</li><li>负责相关业务api的业务逻辑实现</li><li>配合APP端实现APP的业务</li></ul>\n<h5 id=\"h5-u9879u76EEu5FC3u5F97\"><a name=\"项目心得\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目心得</h5><ul>\n<li>并发控制，基于缓存实现高并发</li></ul>\n\n<h3 id=\"h3-u4F53u9A8Cu5361u9879u76EE\"><a name=\"体验卡项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>体验卡项目</h3><h5 id=\"h5-u9879u76EEu63CFu8FF0\"><a name=\"项目描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目描述</h5><p>体验卡系统是我公司开发的一个基于体验卡的一个系统，该项目主要是体验卡的体验和激活两个流程，通过激活体验卡来购买酒和获取乐享，大致流程是通过系统发卡，然后服务点领卡，发放到用户，用户通过登录app然后进入体验卡系统，领取体验卡，然后会基于用户输入的体验乐享来每天返回乐享，只有当用户激活了体验卡之后乐享才会进入自己账户并且获得产品：酒，进入自己账户的乐享（包括现金券和免费券），现金券可体现消费，免费券兑换商城产品。</p>\n<h5 id=\"h5-u8D23u4EFBu63CFu8FF0\"><a name=\"责任描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>责任描述</h5><ul>\n<li>主要参与前期的需求的整理和分析，模块的时间估算</li><li>体验卡领卡相关业务完成</li><li>体验卡绑定业务逻辑，体验卡体验乐享收益信息</li><li>企业主卡和员工卡（体验卡的一部分）之间的业务逻辑完善</li><li>服务点相关收益的计算判断</li></ul>\n<h5 id=\"h5-u9879u76EEu5FC3u5F97\"><a name=\"项目心得\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目心得</h5><ul>\n<li>复杂的业务逻辑需要化繁为简的逻辑去实现</li><li>任何的前端效验都不可信，必须在后台业务逻辑里做判断</li><li>相关复杂的业务sql的性能优化得到提升</li><li>利用反射机制查询接口变成成通用接口，后台就只需处理sql即可</li></ul>\n\n<h3 id=\"h3-u559Cu8054u9001u5546u57CEu9879u76EE\"><a name=\"喜联送商城项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>喜联送商城项目</h3><h5 id=\"h5-u9879u76EEu63CFu8FF0\"><a name=\"项目描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目描述</h5><p>喜联送商城是我公司开发的一个B2C的一个线上购物电商项目，项目采用SpringCloud分布式架构，整体上可以把工程拆分成三个部分，表现层（用户交互页面）,接口层和服务层（业务逻辑，对内提供服务）。表现层包括了商品、订单、收藏、评论、等等展示页面和后台管理页面。表现层提供用户浏览商品，添加购物车，下单等功能。接口层提供外部访问接口，服务层提供,内容管理服务，订单服务，搜索服务，会员服务等。</p>\n<h5 id=\"h5-u8D23u4EFBu63CFu8FF0\"><a name=\"责任描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>责任描述</h5><ul>\n<li>主要参与前期需求分析，业务模块的划分</li><li>系统后台管理系统开发，权限控制</li><li>商品模块服务层业务逻辑处理，接口对接</li><li>ElasticSearch全文检索的实现了商品列表、门店列表的检索、以及数据的同步</li><li>IOS和Android接口服务</li><li>常用数据的Redis缓存化，实现数据的更快的访问和请求</li></ul>\n<h5 id=\"h5-u9879u76EEu5FC3u5F97\"><a name=\"项目心得\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目心得</h5><ul>\n<li>更深一步理解spring cloud架构，集成jpa和mybatis使用</li><li>Redis集成spring boot,及Redis的使用和ID生成策略的使用</li></ul>\n\n<h2 id=\"h2--2015-11-2017-7-\"><a name=\"重庆辰领科技有限公司（2015.11~2017.7）\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>重庆辰领科技有限公司（2015.11~2017.7）</h2><h3 id=\"h3-u624Du827Au7F51u89C6u9891u76F4u64ADu9879u76EE\"><a name=\"才艺网视频直播项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>才艺网视频直播项目</h3><h5 id=\"h5-u9879u76EEu63CFu8FF0\"><a name=\"项目描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目描述</h5><p>才艺网视频直播项目是我公司开发的一个视频直播项目，主要用于学校、社会才艺活动的视频直播，拉近了人们不用出门就可以看才艺观才艺的一种享受，视频直播增加了送彩礼，直播弹幕等功能，该平台提供了app端和pc端，方便更多用户的选择和使用<br>研发环境及所用技术： eclipse+SpringMVC +Hibernate+Spring+MySql+WebSocket+tomcat+linux</p>\n<h5 id=\"h5-u8D23u4EFBu63CFu8FF0\"><a name=\"责任描述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>责任描述</h5><ul>\n<li>主要参与前期需求分析，业务模块的划分 </li><li>系统后台管理系统开发，权限控制 </li><li>会员登录、注册、充值、视频模块业务逻辑处理，接口对接 </li><li>相册模块和视频模块的接口服务提供 </li><li>直播业务的实现（第三方服务对接，相应直播间评论，弹幕，礼物，礼物购买等） </li><li>IOS和Android接口服务</li></ul>\n<h5 id=\"h5-u9879u76EEu5FC3u5F97\"><a name=\"项目心得\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>项目心得</h5><ul>\n<li>集成了七牛云的视频直播云，提供相应的视频直播流格式 </li><li>利用WebSocket来实现了app端和pc端的弹幕评论交流 </li><li>充值集成了微信支付和支付宝支付用于购买礼物赠送主播</li></ul>\n\n<h1 id=\"h1-u5F00u6E90u9879u76EEu548Cu4F5Cu54C1\"><a name=\"开源项目和作品\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>开源项目和作品</h1><h2 id=\"h2-u5F00u6E90u9879u76EE\"><a name=\"开源项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>开源项目</h2><ul>\n<li><a href=\"### 作https://gitee.com/choxsu/sblog品\">Choxsu-Blog</a>：chosu-blog博客JFinal框架编写,页面极简设计</li></ul>\n<h2 id=\"h2-u6280u672Fu6587u7AE0\"><a name=\"技术文章\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>技术文章</h2><ul>\n<li><a href=\"http://choxsu.im/article/16\">在linux(CentOS7.2 64bit)上安装elasticSearch 6.0.0</a></li><li><a href=\"http://choxsu.im/article/25\">SpringBoot中使用ActiveRecordPlugin插件</a></li><li><a href=\"http://choxsu.im/article/49\">Spring或SpringBoot中管理JFinal ORM插件事物</a></li></ul>\n<h2 id=\"h2-u4E2Au4EBAu7F51u7AD9\"><a name=\"个人网站\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>个人网站</h2><p><a href=\"http://www.choxsu.im\">http://www.choxsu.im</a></p>\n\n<h1 id=\"h1-u81F4u8C22\"><a name=\"致谢\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>致谢</h1><p>感谢您花时间阅读我的简历，期待能有机会和您共事。</p>\n', '# 联系方式\n- 手机：189 9632 7369\n- Email：choxsu@gmail.com\n- QQ/微信号：2283546325/qxs31013991\n\n---\n\n# 个人信息\n\n - 苏小秋/男/1993\n - 大专/贵州电力职业技术学院、电力系统自动化\n - 工作年限：3年\n - 技术博客：http://choxsu.im/article\n - Gitee：https://gitee.com/choxsu\n - 期望职位：Java高级程序员，架构师\n - 期望薪资：税前月薪11k~15k，特别喜欢的公司可例外\n - 期望城市：重庆\n\n---\n\n# 技能清单\n以下均为我熟练使用的技能\n- Web框架：SpringMvc/JFinal\n- 前端框架：Vue/Bootstrap\n- 开发工具：Idea/Eclipse\n- 数据库相关：MySQL/Oracle\n- 版本管理、文档管理工具：Svn/Git/apidoc\n- 第三方开放平台：微信公众号开发\n\n## 参考技能关键字\n- java\n- spring\n- mysql\n- linux\n- sql\n- mybatis\n- redis\n- nginx\n- api\n- git\n\n# 工作经历\n## 重庆喜联科技发展有限公司（2017.7~2019.3）\n\n### 1+2新零售项目\n##### 项目描述\n项目主要是做的是爆款产品的批发零售系统，主要有批发购买抢购业务，自由批发业务，兑换专区业务。\n1、批发抢购:实现了排队抢购的逻辑计算\n2、自由批发:实现了订单超时，订单成交等业务 \n3、兑换专区:实现产品列表，列表同步es，可做全文检索，产品规格，兑换下单 \n4、使用框架:当下最流行的springboot，后台架构分层MVC，数据层使用到了jpa,mybatis等，缓存用到了redis ，全文检索使用分布式检索框架es。\n##### 责任描述\n- 负责排队业务的处理\n- 负责所有订单的超时业务\n- 负责相关业务api的业务逻辑实现\n- 配合APP端实现APP的业务\n\n##### 项目心得\n- 并发控制，基于缓存实现高并发\n\n---\n\n\n### 体验卡项目\n##### 项目描述\n体验卡系统是我公司开发的一个基于体验卡的一个系统，该项目主要是体验卡的体验和激活两个流程，通过激活体验卡来购买酒和获取乐享，大致流程是通过系统发卡，然后服务点领卡，发放到用户，用户通过登录app然后进入体验卡系统，领取体验卡，然后会基于用户输入的体验乐享来每天返回乐享，只有当用户激活了体验卡之后乐享才会进入自己账户并且获得产品：酒，进入自己账户的乐享（包括现金券和免费券），现金券可体现消费，免费券兑换商城产品。\n##### 责任描述\n- 主要参与前期的需求的整理和分析，模块的时间估算\n- 体验卡领卡相关业务完成\n- 体验卡绑定业务逻辑，体验卡体验乐享收益信息\n- 企业主卡和员工卡（体验卡的一部分）之间的业务逻辑完善\n- 服务点相关收益的计算判断\n\n##### 项目心得\n- 复杂的业务逻辑需要化繁为简的逻辑去实现\n- 任何的前端效验都不可信，必须在后台业务逻辑里做判断\n- 相关复杂的业务sql的性能优化得到提升\n- 利用反射机制查询接口变成成通用接口，后台就只需处理sql即可\n\n---\n\n### 喜联送商城项目\n##### 项目描述\n喜联送商城是我公司开发的一个B2C的一个线上购物电商项目，项目采用SpringCloud分布式架构，整体上可以把工程拆分成三个部分，表现层（用户交互页面）,接口层和服务层（业务逻辑，对内提供服务）。表现层包括了商品、订单、收藏、评论、等等展示页面和后台管理页面。表现层提供用户浏览商品，添加购物车，下单等功能。接口层提供外部访问接口，服务层提供,内容管理服务，订单服务，搜索服务，会员服务等。\n\n##### 责任描述\n- 主要参与前期需求分析，业务模块的划分\n- 系统后台管理系统开发，权限控制\n- 商品模块服务层业务逻辑处理，接口对接\n- ElasticSearch全文检索的实现了商品列表、门店列表的检索、以及数据的同步\n- IOS和Android接口服务\n- 常用数据的Redis缓存化，实现数据的更快的访问和请求\n\n##### 项目心得\n- 更深一步理解spring cloud架构，集成jpa和mybatis使用\n- Redis集成spring boot,及Redis的使用和ID生成策略的使用\n\n---\n\n## 重庆辰领科技有限公司（2015.11~2017.7）\n\n### 才艺网视频直播项目\n##### 项目描述\n才艺网视频直播项目是我公司开发的一个视频直播项目，主要用于学校、社会才艺活动的视频直播，拉近了人们不用出门就可以看才艺观才艺的一种享受，视频直播增加了送彩礼，直播弹幕等功能，该平台提供了app端和pc端，方便更多用户的选择和使用 \n研发环境及所用技术： eclipse+SpringMVC +Hibernate+Spring+MySql+WebSocket+tomcat+linux\n##### 责任描述\n- 主要参与前期需求分析，业务模块的划分 \n- 系统后台管理系统开发，权限控制 \n- 会员登录、注册、充值、视频模块业务逻辑处理，接口对接 \n- 相册模块和视频模块的接口服务提供 \n- 直播业务的实现（第三方服务对接，相应直播间评论，弹幕，礼物，礼物购买等） \n- IOS和Android接口服务\n\n##### 项目心得\n- 集成了七牛云的视频直播云，提供相应的视频直播流格式 \n- 利用WebSocket来实现了app端和pc端的弹幕评论交流 \n- 充值集成了微信支付和支付宝支付用于购买礼物赠送主播\n\n---\n\n# 开源项目和作品\n\n## 开源项目\n - [Choxsu-Blog](### 作https://gitee.com/choxsu/sblog品\n)：chosu-blog博客JFinal框架编写,页面极简设计\n\n## 技术文章\n- [在linux(CentOS7.2 64bit)上安装elasticSearch 6.0.0](http://choxsu.im/article/16)\n- [SpringBoot中使用ActiveRecordPlugin插件](http://choxsu.im/article/25)\n- [Spring或SpringBoot中管理JFinal ORM插件事物](http://choxsu.im/article/49)\n\n## 个人网站\n[http://www.choxsu.im](http://www.choxsu.im)\n\n---\n\n# 致谢\n感谢您花时间阅读我的简历，期待能有机会和您共事。\n', '2018-09-22 19:19:07', '2019-04-12 21:07:48', 89, 0, 0, 'about', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (15, 1, 'Spring或SpringBoot中管理JFinal ORM插件事物', '<p>  最近在SpringBoot中使用JFinal的ActiveRecordPlugin插件，虽然事物可以直接通过<a href=\"https://github.com/Before\" title=\"@Before\" class=\"at-link\">@Before</a>(Tx.class)来解决，但是后面项目的需要将事物交给spring来管理，具体实现看下去</p>\n<h3 id=\"h3--spring-aop-\"><a name=\"思路：使用spring AOP代理\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>思路：使用spring AOP代理</h3><p>这里使用springboot来实现，spring同理</p>\n<h4 id=\"h4-maven-\"><a name=\"maven 依赖\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>maven 依赖</h4><pre><code>&lt;dependency&gt;&lt;!-- spring boot aop starter依赖 --&gt;\n    &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;\n    &lt;artifactId&gt;spring-boot-starter-aop&lt;/artifactId&gt;\n&lt;/dependency&gt;\n&lt;!-- 数据源 --&gt;\n&lt;dependency&gt;\n    &lt;groupId&gt;com.zaxxer&lt;/groupId&gt;\n    &lt;artifactId&gt;HikariCP&lt;/artifactId&gt;\n&lt;/dependency&gt;\n</code></pre><h6 id=\"h6-u611Fu8C22\"><a name=\"感谢\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>感谢</h6><p><a href=\"https://gitee.com/596392912/codes\">如梦技术的代码片段</a> , <a href=\"http://jfinal.com\">JFinal</a></p>\n<h4 id=\"h4-jfinaltxaop\"><a name=\"JFinalTxAop\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>JFinalTxAop</h4><pre><code>package com.choxsu.elastic.config;\n\nimport com.jfinal.kit.LogKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordException;\nimport com.jfinal.plugin.activerecord.Config;\nimport com.jfinal.plugin.activerecord.DbKit;\nimport com.jfinal.plugin.activerecord.NestedTransactionHelpException;\nimport com.jfinal.plugin.activerecord.tx.TxConfig;\nimport org.aspectj.lang.ProceedingJoinPoint;\nimport org.aspectj.lang.annotation.Around;\nimport org.aspectj.lang.annotation.Aspect;\nimport org.aspectj.lang.annotation.Pointcut;\nimport org.aspectj.lang.reflect.MethodSignature;\nimport org.springframework.stereotype.Component;\n\nimport java.lang.reflect.Method;\nimport java.sql.Connection;\nimport java.sql.SQLException;\n\n/**\n * @author choxsu\n * @date 2018/4/13\n */\n@Aspect\n@Component\npublic class JFinalTxAop {\n\n\n    /**\n     * 自定义JFinal 事物注解\n     * value中的意思解释\n     *\n     * @annotation 表示注解只能支持方法上\n     * @within 表示注解在类下面所有的方法 ， 暂时不使用这种方式\n     */\n    @Pointcut(\"@annotation(com.choxsu.elastic.config.JFinalTx)\")\n    private void method() {\n    }\n\n    @Around(value = \"method()\", argNames = \"pjp\")\n    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {\n        Object retVal = null;\n        Config config = getConfigWithTxConfig(pjp);\n        if (config == null)\n            config = DbKit.getConfig();\n\n        Connection conn = config.getThreadLocalConnection();\n        // Nested transaction support\n        if (conn != null) {\n            try {\n                if (conn.getTransactionIsolation() &lt; getTransactionLevel(config))\n                    conn.setTransactionIsolation(getTransactionLevel(config));\n                retVal = pjp.proceed();\n                return retVal;\n            } catch (SQLException e) {\n                throw new ActiveRecordException(e);\n            }\n        }\n\n        Boolean autoCommit = null;\n        try {\n            conn = config.getConnection();\n            autoCommit = conn.getAutoCommit();\n            config.setThreadLocalConnection(conn);\n            conn.setTransactionIsolation(getTransactionLevel(config));// conn.setTransactionIsolation(transactionLevel);\n\n            conn.setAutoCommit(false);\n            retVal = pjp.proceed();\n            conn.commit();\n        } catch (NestedTransactionHelpException e) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            LogKit.logNothing(e);\n        } catch (Throwable t) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            throw t instanceof RuntimeException ? (RuntimeException) t : new ActiveRecordException(t);\n        } finally {\n            try {\n                if (conn != null) {\n                    if (autoCommit != null)\n                        conn.setAutoCommit(autoCommit);\n                    conn.close();\n                }\n            } catch (Throwable t) {\n                // can not throw exception here, otherwise the more important exception in previous catch block can not be thrown\n                LogKit.error(t.getMessage(), t);\n            } finally {\n                // prevent memory leak\n                config.removeThreadLocalConnection();\n            }\n        }\n        return retVal;\n    }\n\n    /**\n     * 获取配置的事务级别\n     *\n     * @param config\n     * @return\n     */\n    protected int getTransactionLevel(Config config) {\n        return config.getTransactionLevel();\n    }\n\n    /**\n     * @param pjp\n     * @return Config\n     */\n    public static Config getConfigWithTxConfig(ProceedingJoinPoint pjp) {\n        MethodSignature ms = (MethodSignature) pjp.getSignature();\n        Method method = ms.getMethod();\n        TxConfig txConfig = method.getAnnotation(TxConfig.class);\n        if (txConfig == null)\n            txConfig = pjp.getTarget().getClass().getAnnotation(TxConfig.class);\n\n        if (txConfig != null) {\n            Config config = DbKit.getConfig(txConfig.value());\n            if (config == null)\n                throw new RuntimeException(\"Config not found with TxConfig: \" + txConfig.value());\n            return config;\n        }\n        return null;\n    }\n}\n</code></pre><h4 id=\"h4-jfinaltx\"><a name=\"JFinalTx\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>JFinalTx</h4><pre><code>package com.choxsu.elastic.config;\n\n/**\n * @author choxsu\n */\n\nimport java.lang.annotation.*;\n\n/**\n * Jfinal事物交给spring管理注解\n * 目前只支持用在方法上\n */\n@Inherited\n@Target({ElementType.METHOD})\n@Retention(RetentionPolicy.RUNTIME)\npublic @interface JFinalTx {\n\n}\n</code></pre><h3 id=\"h3-u4F7Fu7528\"><a name=\"使用\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用</h3><h4 id=\"h4-testcontroller\"><a name=\"TestController\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>TestController</h4><pre><code>package com.choxsu.elastic.controller;\n\nimport com.choxsu.elastic.service.TestService;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n/**\n * @author choxsu\n */\n@RestController\n@RequestMapping(value = {\"/test/v1\"})\npublic class TestController {\n\n\n    @Autowired\n    private TestService testService;\n\n    @GetMapping(value = \"/testTran\")\n    public Object testTran(){\n\n\n        return testService.testTran();\n    }\n}\n</code></pre><h4 id=\"h4-testservice\"><a name=\"TestService\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>TestService</h4><pre><code>package com.choxsu.elastic.service;\n\nimport com.choxsu.elastic.config.JFinalTx;\nimport com.jfinal.kit.Ret;\nimport com.jfinal.plugin.activerecord.Db;\nimport com.jfinal.plugin.activerecord.Record;\nimport org.springframework.stereotype.Service;\n\n\n/**\n * @author choxsu\n */\n@Service\npublic class TestService {\n\n    /**\n     * 事物测试\n     *\n     * @return\n     */\n    @JFinalTx\n    public Object testTran() {\n        Record record = new Record();\n        record.set(\"id\", 10);\n        Db.save(\"test\", record);\n        if (true) {\n            throw new RuntimeException(\"test\");\n        }\n        return Ret.by(\"msg\", \"success\");\n    }\n}\n</code></pre><h5 id=\"h5-sql-\"><a name=\"sql执行了\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>sql执行了</h5><pre><code>Sql: insert into `test`(`id`) values(?)\n</code></pre><h5 id=\"h5-u4F46u662Fu6570u636Eu5E93u6CA1u6709u6570u636E\"><a name=\"但是数据库没有数据\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>但是数据库没有数据</h5><p><img src=\"/upload/img/article/0/1_20181222233320.jpeg\" alt=\"1545492800236.jpeg\"></p>\n<p>到此证明事物拦截成功，可以使用spring来管理ActiveRecordPlugin的事物了</p>\n<h4 id=\"h4--code-throw-new-runtimeexception-quot-test-quot-code-\"><a name=\"去掉<code>throw new RuntimeException(&quot;test&quot;);</code>的效果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>去掉<code>throw new RuntimeException(\"test\");</code>的效果</h4><h5 id=\"h5-sql\"><a name=\"sql\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>sql</h5><pre><code>Sql: insert into `test`(`id`) values(?)\n</code></pre><h5 id=\"h5-u6570u636Eu5E93u7ED3u679C\"><a name=\"数据库结果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>数据库结果</h5><p><img src=\"/upload/img/article/0/1_20181222233334.jpeg\" alt=\"1545492814226.jpeg\"></p>\n', '  最近在SpringBoot中使用JFinal的ActiveRecordPlugin插件，虽然事物可以直接通过@Before(Tx.class)来解决，但是后面项目的需要将事物交给spring来管理，具体实现看下去\n### 思路：使用spring AOP代理\n这里使用springboot来实现，spring同理\n\n\n#### maven 依赖\n```\n<dependency><!-- spring boot aop starter依赖 -->\n	<groupId>org.springframework.boot</groupId>\n	<artifactId>spring-boot-starter-aop</artifactId>\n</dependency>\n<!-- 数据源 -->\n<dependency>\n	<groupId>com.zaxxer</groupId>\n	<artifactId>HikariCP</artifactId>\n</dependency>\n```\n###### 感谢\n[如梦技术的代码片段](https://gitee.com/596392912/codes) , [JFinal](http://jfinal.com)\n#### JFinalTxAop\n```\npackage com.choxsu.elastic.config;\n\nimport com.jfinal.kit.LogKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordException;\nimport com.jfinal.plugin.activerecord.Config;\nimport com.jfinal.plugin.activerecord.DbKit;\nimport com.jfinal.plugin.activerecord.NestedTransactionHelpException;\nimport com.jfinal.plugin.activerecord.tx.TxConfig;\nimport org.aspectj.lang.ProceedingJoinPoint;\nimport org.aspectj.lang.annotation.Around;\nimport org.aspectj.lang.annotation.Aspect;\nimport org.aspectj.lang.annotation.Pointcut;\nimport org.aspectj.lang.reflect.MethodSignature;\nimport org.springframework.stereotype.Component;\n\nimport java.lang.reflect.Method;\nimport java.sql.Connection;\nimport java.sql.SQLException;\n\n/**\n * @author choxsu\n * @date 2018/4/13\n */\n@Aspect\n@Component\npublic class JFinalTxAop {\n\n\n    /**\n     * 自定义JFinal 事物注解\n     * value中的意思解释\n     *\n     * @annotation 表示注解只能支持方法上\n     * @within 表示注解在类下面所有的方法 ， 暂时不使用这种方式\n     */\n    @Pointcut(\"@annotation(com.choxsu.elastic.config.JFinalTx)\")\n    private void method() {\n    }\n\n    @Around(value = \"method()\", argNames = \"pjp\")\n    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {\n        Object retVal = null;\n        Config config = getConfigWithTxConfig(pjp);\n        if (config == null)\n            config = DbKit.getConfig();\n\n        Connection conn = config.getThreadLocalConnection();\n        // Nested transaction support\n        if (conn != null) {\n            try {\n                if (conn.getTransactionIsolation() < getTransactionLevel(config))\n                    conn.setTransactionIsolation(getTransactionLevel(config));\n                retVal = pjp.proceed();\n                return retVal;\n            } catch (SQLException e) {\n                throw new ActiveRecordException(e);\n            }\n        }\n\n        Boolean autoCommit = null;\n        try {\n            conn = config.getConnection();\n            autoCommit = conn.getAutoCommit();\n            config.setThreadLocalConnection(conn);\n            conn.setTransactionIsolation(getTransactionLevel(config));// conn.setTransactionIsolation(transactionLevel);\n\n            conn.setAutoCommit(false);\n            retVal = pjp.proceed();\n            conn.commit();\n        } catch (NestedTransactionHelpException e) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            LogKit.logNothing(e);\n        } catch (Throwable t) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            throw t instanceof RuntimeException ? (RuntimeException) t : new ActiveRecordException(t);\n        } finally {\n            try {\n                if (conn != null) {\n                    if (autoCommit != null)\n                        conn.setAutoCommit(autoCommit);\n                    conn.close();\n                }\n            } catch (Throwable t) {\n                // can not throw exception here, otherwise the more important exception in previous catch block can not be thrown\n                LogKit.error(t.getMessage(), t);\n            } finally {\n                // prevent memory leak\n                config.removeThreadLocalConnection();\n            }\n        }\n        return retVal;\n    }\n\n    /**\n     * 获取配置的事务级别\n     *\n     * @param config\n     * @return\n     */\n    protected int getTransactionLevel(Config config) {\n        return config.getTransactionLevel();\n    }\n\n    /**\n     * @param pjp\n     * @return Config\n     */\n    public static Config getConfigWithTxConfig(ProceedingJoinPoint pjp) {\n        MethodSignature ms = (MethodSignature) pjp.getSignature();\n        Method method = ms.getMethod();\n        TxConfig txConfig = method.getAnnotation(TxConfig.class);\n        if (txConfig == null)\n            txConfig = pjp.getTarget().getClass().getAnnotation(TxConfig.class);\n\n        if (txConfig != null) {\n            Config config = DbKit.getConfig(txConfig.value());\n            if (config == null)\n                throw new RuntimeException(\"Config not found with TxConfig: \" + txConfig.value());\n            return config;\n        }\n        return null;\n    }\n}\n```\n#### JFinalTx\n```\npackage com.choxsu.elastic.config;\n\n/**\n * @author choxsu\n */\n\nimport java.lang.annotation.*;\n\n/**\n * Jfinal事物交给spring管理注解\n * 目前只支持用在方法上\n */\n@Inherited\n@Target({ElementType.METHOD})\n@Retention(RetentionPolicy.RUNTIME)\npublic @interface JFinalTx {\n\n}\n```\n### 使用\n#### TestController\n```\npackage com.choxsu.elastic.controller;\n\nimport com.choxsu.elastic.service.TestService;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n/**\n * @author choxsu\n */\n@RestController\n@RequestMapping(value = {\"/test/v1\"})\npublic class TestController {\n\n\n    @Autowired\n    private TestService testService;\n\n    @GetMapping(value = \"/testTran\")\n    public Object testTran(){\n\n\n        return testService.testTran();\n    }\n}\n\n```\n#### TestService\n```\npackage com.choxsu.elastic.service;\n\nimport com.choxsu.elastic.config.JFinalTx;\nimport com.jfinal.kit.Ret;\nimport com.jfinal.plugin.activerecord.Db;\nimport com.jfinal.plugin.activerecord.Record;\nimport org.springframework.stereotype.Service;\n\n\n/**\n * @author choxsu\n */\n@Service\npublic class TestService {\n\n    /**\n     * 事物测试\n     *\n     * @return\n     */\n    @JFinalTx\n    public Object testTran() {\n        Record record = new Record();\n        record.set(\"id\", 10);\n        Db.save(\"test\", record);\n        if (true) {\n            throw new RuntimeException(\"test\");\n        }\n        return Ret.by(\"msg\", \"success\");\n    }\n}\n\n```\n##### sql执行了\n```\nSql: insert into `test`(`id`) values(?)\n```\n##### 但是数据库没有数据\n![1545492800236.jpeg](/upload/img/article/0/1_20181222233320.jpeg)\n\n到此证明事物拦截成功，可以使用spring来管理ActiveRecordPlugin的事物了\n\n#### 去掉`throw new RuntimeException(\"test\");`的效果\n##### sql\n```\nSql: insert into `test`(`id`) values(?)\n```\n##### 数据库结果\n![1545492814226.jpeg](/upload/img/article/0/1_20181222233334.jpeg)\n', '2018-06-14 12:09:34', '2019-01-28 14:43:28', 361, 0, 0, 'blog', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (16, 1, '在linux(CentOS7.2 64bit)上安装elasticSearch 6.0.0', '<h3 id=\"h3-01-\"><a name=\"01 准备工作及下载\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>01 准备工作及下载</h3><h5 id=\"h5-1-es-es-root-\"><a name=\"1)创建一个es专门的用户（必须），因为es不能用root用户启动\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1)创建一个es专门的用户（必须），因为es不能用root用户启动</h5><pre><code>useradd es -m\npasswd &lt;input es&gt;\nmkdir -p /usr/local/es/\nchown -R es /usr/local/es/\n</code></pre><h5 id=\"h5-2-es-\"><a name=\"2)切换到es用户下，下载安装包\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2)切换到es用户下，下载安装包</h5><pre><code>su es\ncd /usr/local/es\nwget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.zip\nunzip elasticsearch-6.0.0.zip\ncd elasticsearch-6.0.0/\nls\nbin  config  data  lib  LICENSE.txt  logs  modules  nohup.out  NOTICE.txt  plugins  README.textile\n</code></pre><h5 id=\"h5-3-\"><a name=\"3)修改配置文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3)修改配置文件</h5><pre><code>cd config/\nvim elasticsearch.yml\n</code></pre><pre><code>cluster.name: choxsu-es\n#path.data: /path/to/data  # 默认即可\n#path.logs: /path/to/logs  # 默认即可\nnetwork.host: 0.0.0.0\nhttp.port: 9200\n</code></pre><h5 id=\"h5-4-jvm-\"><a name=\"4)修改jvm内存大小\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4)修改jvm内存大小</h5><pre><code>vim config/jvm.options\n</code></pre><pre><code>-Xms256m\n-Xmx256m\n</code></pre><h3 id=\"h3-02-\"><a name=\"02 解决启动时报错\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>02 解决启动时报错</h3><h5 id=\"h5-1-\"><a name=\"1) 启动命令\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1) 启动命令</h5><p>这里注意啦，这里是后台启动，要发现错误的话，去logs目录下查看。</p>\n<pre><code>nohup ./bin/elasticsearch &amp;\n</code></pre><h5 id=\"h5-2-\"><a name=\"2)查看错误信息\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2)查看错误信息</h5><p>注意：ElasticSearch6.0.0必须jdk1.8以上支持；所以请记得在<em>/etc/profile</em>文件中配置jdk环境变量</p>\n<pre><code>export JAVA_HOME=/opt/java/jdk1.8.0_161\nexport CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar\nexport PATH=$JAVA_HOME/bin:$PATH\n</code></pre><p>直接查看nohup输出信息</p>\n<pre><code>tail -f nohup.out\n</code></pre><p>或者查看日志输出查看错误信息</p>\n<pre><code>tail -f logs/choxsu-es.log\n</code></pre><p>核心错误信息</p>\n<pre><code>[1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]\n[2]: max number of threads [1024] for user [es] is too low, increase to at least [4096]\n[3]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]\n[4]: system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk\n</code></pre><h5 id=\"h5-3-\"><a name=\"3)解决办法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3)解决办法</h5><pre><code>1）max file descriptors [4096] for elasticsearch process likely too low, increase to at least [65536]\n原因：无法创建本地文件问题,用户最大可创建文件数太小\n解决方案：切换到root用户，编辑limits.conf配置文件， 添加类似如下内容：\nvi /etc/security/limits.conf\n添加如下内容:\n* soft nofile 65536\n* hard nofile 131072\n* soft nproc 2048\n* hard nproc 4096\n\n备注：* 代表Linux所有用户名称（比如 hadoop）\n需要保存、退出、重新登录才可生效。\n\n2）max number of threads [1024] for user [es] likely too low, increase to at least [4096]\n原因：无法创建本地线程问题,用户最大可创建线程数太小\n解决方案：切换到root用户，进入limits.d目录下，修改90-nproc.conf 配置文件。\nvi /etc/security/limits.d/90-nproc.conf\n找到如下内容：\n* soft nproc 1024\n#修改为\n* soft nproc 4096\n\n3）max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]\n原因：最大虚拟内存太小\nroot用户执行命令：\n[root@localhost ~]# sysctl -w vm.max_map_count=262144\n\n4）system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk\n原因：Centos6不支持SecComp，而ES5.4.1默认bootstrap.system_call_filter为true进行检测，所以导致检测失败，失败后直接导致ES不能启动。\n详见 ：https://github.com/elastic/elasticsearch/issues/22899\n\n解决方法：在elasticsearch.yml中新增配置bootstrap.system_call_filter，设为false，注意要在Memory下面:\nbootstrap.memory_lock: false\nbootstrap.system_call_filter: false\n\n以上问题解决后，es启动成功了，但又遇到了新的问题，本地机器无法访问虚拟机的服务，两个原因：\n1）9200被限制为本机访问，需要在es的配置文件elasticsearch.yml中新增配置：\n    network.bind_host:0.0.0.0\n2）关闭虚拟机防火墙\n\n解决了这个两个问题后，本地能够顺利访问虚拟机的ES服务了。\n</code></pre><p>注意，以上虚拟内存的更改，每次重启系统之后都要重新设置</p>\n<pre><code>ysctl -w vm.max_map_count=262144\n</code></pre><h5 id=\"h5-4-\"><a name=\"4)解决完了之后，再次启动服务（先杀后启）\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4)解决完了之后，再次启动服务（先杀后启）</h5><pre><code>ps -ef|grep elasticsearch|grep bootstrap |awk &#39;{print $2}&#39; |xargs kill -9\nnohup ./bin/elasticsearch &amp;\n</code></pre><h3 id=\"h3-03-es\"><a name=\"03 访问es\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>03 访问es</h3><h5 id=\"h5-1-curl-\"><a name=\"1)使用curl测试，因为使用的是云服务器部署\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1)使用curl测试，因为使用的是云服务器部署</h5><p>curl <a href=\"http://localhost:9200/?pretty\">http://localhost:9200/?pretty</a><br>得到的内容</p>\n<pre><code>{\n  &quot;name&quot; : &quot;Nd1M7rH&quot;,\n  &quot;cluster_name&quot; : &quot;choxsu-es&quot;,\n  &quot;cluster_uuid&quot; : &quot;593zK7LuTZOvfcdgt09ZXQ&quot;,\n  &quot;version&quot; : {\n    &quot;number&quot; : &quot;6.0.0&quot;,\n    &quot;build_hash&quot; : &quot;8f0685b&quot;,\n    &quot;build_date&quot; : &quot;2017-11-10T18:41:22.859Z&quot;,\n    &quot;build_snapshot&quot; : false,\n    &quot;lucene_version&quot; : &quot;7.0.1&quot;,\n    &quot;minimum_wire_compatibility_version&quot; : &quot;5.6.0&quot;,\n    &quot;minimum_index_compatibility_version&quot; : &quot;5.0.0&quot;\n  },\n  &quot;tagline&quot; : &quot;You Know, for Search&quot;\n}\n</code></pre><h3 id=\"h3-04-\"><a name=\"04 使用原生方式创建索引\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>04 使用原生方式创建索引</h3><p>使用 Xput创建索引</p>\n<pre><code>curl -XPUT &#39;http://localhost:9200/twitter/doc/1?pretty&#39; -H &#39;Content-Type: application/json&#39; -d &#39;\n{\n    &quot;user&quot;: &quot;kimchy&quot;,\n    &quot;post_date&quot;: &quot;2009-11-15T13:12:00&quot;,\n    &quot;message&quot;: &quot;Trying out Elasticsearch, so far so good?&quot;\n}&#39;\n\ncurl -XPUT &#39;http://localhost:9200/twitter/doc/2?pretty&#39; -H &#39;Content-Type: application/json&#39; -d &#39;\n{\n    &quot;user&quot;: &quot;kimchy&quot;,\n    &quot;post_date&quot;: &quot;2009-11-15T13:12:00&quot;,\n    &quot;message&quot;: &quot;Trying out Elasticsearch, so far so good?&quot;\n}&#39;\n\ncurl -XPUT &#39;http://localhost:9200/twitter/doc/3?pretty&#39; -H &#39;Content-Type: application/json&#39; -d &#39;\n{\n    &quot;user&quot;: &quot;kimchy&quot;,\n    &quot;post_date&quot;: &quot;2009-11-15T13:12:00&quot;,\n    &quot;message&quot;: &quot;Trying out Elasticsearch, so far so good?&quot;\n}&#39;\n</code></pre><p>查询数据</p>\n<pre><code>curl -XGET &#39;http://localhost:9200/twitter/doc/1?pretty=true&#39;\ncurl -XGET &#39;http://localhost:9200/twitter/doc/2?pretty=true&#39;\ncurl -XGET &#39;http://localhost:9200/twitter/doc/3?pretty=true&#39;\n</code></pre><p>搜索数据<br>通过字进行查询：q=user:kimchy</p>\n<pre><code>curl -XGET &#39;http://localhost:9200/twitter/_search?q=user:kimchy&amp;pretty=true&#39;\n</code></pre><pre><code>curl -XGET &#39;http://localhost:9200/twitter/_search?q=user:kimchy&amp;pretty=true&#39;\n</code></pre><p>通过JSON的方式进行查询</p>\n<pre><code>curl -XGET &#39;http://localhost:9200/twitter/_search?pretty=true&#39; -H &#39;Content-Type: application/json&#39; -d &#39;\n{\n    &quot;query&quot; : {\n        &quot;match_all&quot; : {}\n    }\n}&#39;\n</code></pre><p>通过JSON的方式查询，查询的时候指定区间</p>\n<pre><code>curl -XGET &#39;http://localhost:9200/twitter/_search?pretty=true&#39; -H &#39;Content-Type: application/json&#39; -d &#39;\n{\n    &quot;query&quot; : {\n        &quot;range&quot; : {\n            &quot;post_date&quot; : { &quot;from&quot; : &quot;2009-11-15T13:00:00&quot;, &quot;to&quot; : &quot;2009-11-15T14:00:00&quot; }\n        }\n    }\n}&#39;\n</code></pre><p>那教程就到这里 </p>\n', ' ###01 准备工作及下载\n#####1)创建一个es专门的用户（必须），因为es不能用root用户启动\n```\nuseradd es -m\npasswd <input es>\nmkdir -p /usr/local/es/\nchown -R es /usr/local/es/\n```\n#####2)切换到es用户下，下载安装包\n```\nsu es\ncd /usr/local/es\nwget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.zip\nunzip elasticsearch-6.0.0.zip\ncd elasticsearch-6.0.0/\nls\nbin  config  data  lib  LICENSE.txt  logs  modules  nohup.out  NOTICE.txt  plugins  README.textile\n```\n#####3)修改配置文件\n```\ncd config/\nvim elasticsearch.yml\n```\n```\ncluster.name: choxsu-es\n#path.data: /path/to/data  # 默认即可\n#path.logs: /path/to/logs  # 默认即可\nnetwork.host: 0.0.0.0\nhttp.port: 9200  \n```\n#####4)修改jvm内存大小\n```\nvim config/jvm.options\n```\n```\n-Xms256m\n-Xmx256m\n```\n###02 解决启动时报错\n\n #####1) 启动命令\n这里注意啦，这里是后台启动，要发现错误的话，去logs目录下查看。\n```\nnohup ./bin/elasticsearch &\n```\n#####2)查看错误信息\n注意：ElasticSearch6.0.0必须jdk1.8以上支持；所以请记得在*/etc/profile*文件中配置jdk环境变量\n```\nexport JAVA_HOME=/opt/java/jdk1.8.0_161\nexport CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar\nexport PATH=$JAVA_HOME/bin:$PATH\n```\n直接查看nohup输出信息\n```\ntail -f nohup.out\n```\n或者查看日志输出查看错误信息\n```\ntail -f logs/choxsu-es.log\n```\n核心错误信息\n```\n[1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]\n[2]: max number of threads [1024] for user [es] is too low, increase to at least [4096]\n[3]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]\n[4]: system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk\n```\n#####3)解决办法\n```\n1）max file descriptors [4096] for elasticsearch process likely too low, increase to at least [65536]\n原因：无法创建本地文件问题,用户最大可创建文件数太小\n解决方案：切换到root用户，编辑limits.conf配置文件， 添加类似如下内容：\nvi /etc/security/limits.conf\n添加如下内容:\n* soft nofile 65536\n* hard nofile 131072\n* soft nproc 2048\n* hard nproc 4096\n\n备注：* 代表Linux所有用户名称（比如 hadoop）\n需要保存、退出、重新登录才可生效。\n\n2）max number of threads [1024] for user [es] likely too low, increase to at least [4096]\n原因：无法创建本地线程问题,用户最大可创建线程数太小\n解决方案：切换到root用户，进入limits.d目录下，修改90-nproc.conf 配置文件。\nvi /etc/security/limits.d/90-nproc.conf\n找到如下内容：\n* soft nproc 1024\n#修改为\n* soft nproc 4096\n\n3）max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]\n原因：最大虚拟内存太小\nroot用户执行命令：\n[root@localhost ~]# sysctl -w vm.max_map_count=262144\n\n4）system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk\n原因：Centos6不支持SecComp，而ES5.4.1默认bootstrap.system_call_filter为true进行检测，所以导致检测失败，失败后直接导致ES不能启动。\n详见 ：https://github.com/elastic/elasticsearch/issues/22899\n\n解决方法：在elasticsearch.yml中新增配置bootstrap.system_call_filter，设为false，注意要在Memory下面:\nbootstrap.memory_lock: false\nbootstrap.system_call_filter: false\n\n以上问题解决后，es启动成功了，但又遇到了新的问题，本地机器无法访问虚拟机的服务，两个原因：\n1）9200被限制为本机访问，需要在es的配置文件elasticsearch.yml中新增配置：\n    network.bind_host:0.0.0.0\n2）关闭虚拟机防火墙\n\n解决了这个两个问题后，本地能够顺利访问虚拟机的ES服务了。\n```\n注意，以上虚拟内存的更改，每次重启系统之后都要重新设置\n```\nysctl -w vm.max_map_count=262144\n```\n#####4)解决完了之后，再次启动服务（先杀后启）\n```\nps -ef|grep elasticsearch|grep bootstrap |awk \'{print $2}\' |xargs kill -9\nnohup ./bin/elasticsearch &\n```\n###03 访问es\n#####1)使用curl测试，因为使用的是云服务器部署\ncurl http://localhost:9200/?pretty\n得到的内容\n```\n{\n  \"name\" : \"Nd1M7rH\",\n  \"cluster_name\" : \"choxsu-es\",\n  \"cluster_uuid\" : \"593zK7LuTZOvfcdgt09ZXQ\",\n  \"version\" : {\n    \"number\" : \"6.0.0\",\n    \"build_hash\" : \"8f0685b\",\n    \"build_date\" : \"2017-11-10T18:41:22.859Z\",\n    \"build_snapshot\" : false,\n    \"lucene_version\" : \"7.0.1\",\n    \"minimum_wire_compatibility_version\" : \"5.6.0\",\n    \"minimum_index_compatibility_version\" : \"5.0.0\"\n  },\n  \"tagline\" : \"You Know, for Search\"\n}\n```\n\n###04 使用原生方式创建索引\n使用 Xput创建索引\n\n```\ncurl -XPUT \'http://localhost:9200/twitter/doc/1?pretty\' -H \'Content-Type: application/json\' -d \'\n{\n    \"user\": \"kimchy\",\n    \"post_date\": \"2009-11-15T13:12:00\",\n    \"message\": \"Trying out Elasticsearch, so far so good?\"\n}\'\n\ncurl -XPUT \'http://localhost:9200/twitter/doc/2?pretty\' -H \'Content-Type: application/json\' -d \'\n{\n    \"user\": \"kimchy\",\n    \"post_date\": \"2009-11-15T13:12:00\",\n    \"message\": \"Trying out Elasticsearch, so far so good?\"\n}\'\n\ncurl -XPUT \'http://localhost:9200/twitter/doc/3?pretty\' -H \'Content-Type: application/json\' -d \'\n{\n    \"user\": \"kimchy\",\n    \"post_date\": \"2009-11-15T13:12:00\",\n    \"message\": \"Trying out Elasticsearch, so far so good?\"\n}\'\n```\n查询数据\n```\ncurl -XGET \'http://localhost:9200/twitter/doc/1?pretty=true\'\ncurl -XGET \'http://localhost:9200/twitter/doc/2?pretty=true\'\ncurl -XGET \'http://localhost:9200/twitter/doc/3?pretty=true\'\n```\n搜索数据\n通过字进行查询：q=user:kimchy\n```\ncurl -XGET \'http://localhost:9200/twitter/_search?q=user:kimchy&pretty=true\'\n```\n```\ncurl -XGET \'http://localhost:9200/twitter/_search?q=user:kimchy&pretty=true\'\n```\n通过JSON的方式进行查询\n```\ncurl -XGET \'http://localhost:9200/twitter/_search?pretty=true\' -H \'Content-Type: application/json\' -d \'\n{\n    \"query\" : {\n        \"match_all\" : {}\n    }\n}\'\n```\n通过JSON的方式查询，查询的时候指定区间\n```\ncurl -XGET \'http://localhost:9200/twitter/_search?pretty=true\' -H \'Content-Type: application/json\' -d \'\n{\n    \"query\" : {\n        \"range\" : {\n            \"post_date\" : { \"from\" : \"2009-11-15T13:00:00\", \"to\" : \"2009-11-15T14:00:00\" }\n        }\n    }\n}\'\n```\n那教程就到这里 \n', '2018-06-14 17:02:23', '2018-06-14 17:02:23', 249, 0, 0, 'blog', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (24, 1, 'Mysql数据同步到Elasticsearch', '<h3 id=\"h3--elasticsearch-es-6-0-0-windows10-\"><a name=\"一、安装ElasticSearch(下面统称es,版本6.0.0,环境windows10)\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>一、安装ElasticSearch(下面统称es,版本6.0.0,环境windows10)</h3><p>直接上下载地址：<a href=\"https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.zip\">https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.zip</a></p>\n<h6 id=\"h6--\"><a name=\"解压后目录如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>解压后目录如下：</h6><p><img src=\"/upload/img/article/0/1_20181222233451.jpeg\" alt=\"1545492891560.jpeg\"><br>启动es，<code>./bin/elasticsearch.bat</code>；启动成功如图</p>\n<p><img src=\"/upload/img/article/0/1_20181222233512.jpeg\" alt=\"1545492912496.jpeg\"></p>\n<p>默认cluster_name是elasticsearch和端口9200可以修改，需要修改在config/elasticsearch.yml;上图<br><img src=\"/upload/img/article/0/1_20181222233525.jpeg\" alt=\"1545492925261.jpeg\"></p>\n<h3 id=\"h3--logstash\"><a name=\"二、安装logstash\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>二、安装logstash</h3><p>下载地址：<a href=\"https://artifacts.elastic.co/downloads/logstash/logstash-6.0.0.zip\">https://artifacts.elastic.co/downloads/logstash/logstash-6.0.0.zip</a></p>\n<h6 id=\"h6-u89E3u538Bu76EEu5F55\"><a name=\"解压目录\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>解压目录</h6><p><img src=\"/upload/img/article/0/1_20181222233537.jpeg\" alt=\"1545492937326.jpeg\"></p>\n<p>先安装logstash-input-jdbc插件<br><code>./bin/logstash-plugin.bat install logstash-input-jdbc</code></p>\n<p><img src=\"/upload/img/article/0/1_20181222233548.jpeg\" alt=\"1545492947991.jpeg\"></p>\n<p>在logstash目录下创建config-mysql，见图4<br><img src=\"/upload/img/article/0/1_20181222233600.jpeg\" alt=\"1545492960530.jpeg\"></p>\n<p>创建配置文件load_data.conf，配置文件随便取名，可以创建sql文件，也可以在conf配置文件中定义，具体下面有说明</p>\n<h6 id=\"h6-u5148u4E0Au914Du7F6Eu6587u4EF6u5185u5BB9\"><a name=\"先上配置文件内容\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>先上配置文件内容</h6><pre><code>input {\n    stdin {\n    }\n    jdbc {\n      jdbc_connection_string =&gt; \"jdbc:mysql://127.0.0.1:3306/jfinal_club?characterEncoding=utf8&amp;useSSL=false\"\n      jdbc_user =&gt; \"root\"\n      jdbc_password =&gt; \"root\"\n      jdbc_driver_library =&gt; \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/mysql-connector-java-5.1.43.jar\"\n      jdbc_driver_class =&gt; \"com.mysql.jdbc.Driver\"\n      jdbc_paging_enabled =&gt; \"true\"\n      jdbc_page_size =&gt; \"50000\"\n      statement_filepath =&gt; \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/store_list.sql\"\n      schedule =&gt; \"* * * * *\"\n      use_column_value =&gt; false\n      record_last_run =&gt; true\n      last_run_metadata_path =&gt; \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/run/store_list\"\n      type =&gt; \"sl\"\n    }\n\njdbc {\n      jdbc_connection_string =&gt; \"jdbc:mysql://127.0.0.1:3306/jfinal_club?characterEncoding=utf8&amp;useSSL=false\"\n      jdbc_user =&gt; \"root\"\n      jdbc_password =&gt; \"root\"\n      jdbc_driver_library =&gt; \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/mysql-connector-java-5.1.43.jar\"\n      jdbc_driver_class =&gt; \"com.mysql.jdbc.Driver\"\n      jdbc_paging_enabled =&gt; \"true\"\n      jdbc_page_size =&gt; \"50000\"\n      statement =&gt; \"select * from store where updated &gt; date_add(:sql_last_value, interval 8 hour)\"\n      schedule =&gt; \"* * * * *\"\n      use_column_value =&gt; false\n      record_last_run =&gt; true\n      last_run_metadata_path =&gt; \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/run/store_s\"\n      type =&gt; \"st\"\n    }\n}\n\nfilter {\n    json {\n        source =&gt; \"message\"\n        remove_field =&gt; [\"message\"]\n    }\n}\n\noutput {\n\n    if[type] == \"sl\"{\n        elasticsearch {\n              hosts =&gt; [\"127.0.0.1:9200\"]\n              index =&gt; \"store_list\"\n              document_type =&gt; \"jdbc\"\n              document_id =&gt; \"%{store_id}}\"\n        }\n    }\n\n    if[type] == \"st\"{\n        elasticsearch {\n              hosts =&gt; [\"127.0.0.1:9200\"]\n              index =&gt; \"store_st\"\n              document_type =&gt; \"jdbc\"\n              document_id =&gt; \"%{id}}\"\n        }\n    }\n\n    stdout {\n        codec =&gt; json_lines\n    }\n}\n</code></pre><p>字段解释;具体的见：<a href=\"https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html\">https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html</a></p>\n<h6 id=\"h6--run-sql_last_value-\"><a name=\"上图中有个run目录，在这里是用来存放:sql_last_value的时间值的\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>上图中有个run目录，在这里是用来存放:sql_last_value的时间值的</h6><h5 id=\"h5-store_list-sql\"><a name=\"store_list.sql\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>store_list.sql</h5><p><img src=\"/upload/img/article/0/1_20181222233630.jpeg\" alt=\"1545492990450.jpeg\"></p>\n<h5 id=\"h5--es-index\"><a name=\"先在es中生成index\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>先在es中生成index</h5><pre><code>PUT /store_list\n{\n    \"settings\": {\n    \"number_of_shards\": 3,\n    \"number_of_replicas\": 1\n  },\n  \"mappings\": {\n    \"jdbc\": {\n      \"properties\": {\n        \"@timestamp\": {\n          \"type\": \"date\"\n        },\n        \"@version\": {\n          \"type\": \"keyword\"\n        },\n        \"store_id\": {\n          \"type\": \"long\"\n        },\n        \"store_name\": {\n          \"type\": \"keyword\"\n        },\n        \"uid\": {\n          \"type\": \"text\"\n        },\n        \"telephone\": {\n          \"type\": \"text\"\n        },\n        \"street_id\": {\n          \"type\": \"text\"\n        },\n        \"detail\": {\n          \"type\": \"keyword\"\n        },\n        \"address\": {\n          \"type\": \"keyword\"\n        },\n        \"store_created\": {\n          \"type\": \"date\"\n        },\n        \"store_updated\": {\n          \"type\": \"date\"\n        },\n        \"detail_id\": {\n          \"type\": \"long\"\n        },\n        \"type_name\": {\n          \"type\": \"text\"\n        },\n        \"tag\": {\n          \"type\": \"keyword\"\n        },\n        \"overall_rating\": {\n          \"type\": \"text\"\n        },\n        \"navi_location_lng\": {\n          \"type\": \"double\"\n        },\n        \"navi_location_lat\": {\n          \"type\": \"double\"\n        },\n        \"detail_url\": {\n          \"type\": \"text\"\n        },\n        \"comment_num\": {\n          \"type\": \"integer\"\n        },\n        \"detail_created\": {\n          \"type\": \"date\"\n        },\n        \"detail_updated\": {\n          \"type\": \"date\"\n        },\n        \"location_id\": {\n          \"type\": \"long\"\n        },\n        \"lng\": {\n          \"type\": \"double\"\n        },\n        \"lat\": {\n          \"type\": \"double\"\n        }\n      }\n    }\n  }\n}\n</code></pre><p>上面这种方式可以通过es管理工具执行，比如<code>kibana-&gt;dev tools</code>;或者使用<code>curl</code>的方式也可以</p>\n<pre><code>curl -XPUT \"http://localhost:9200/store_list\" -H \'Content-Type: application/json\' -d\'\n{\n  \"settings\": {\n    \"number_of_shards\": 3,\n    \"number_of_replicas\": 1\n  },\n  \"mappings\": {\n    \"jdbc\": {\n      \"properties\": {\n        \"@timestamp\": {\n          \"type\": \"date\"\n        },\n        \"@version\": {\n          \"type\": \"keyword\"\n        },\n        \"store_id\": {\n          \"type\": \"long\"\n        },\n        \"store_name\": {\n          \"type\": \"keyword\"\n        },\n        \"uid\": {\n          \"type\": \"text\"\n        },\n        \"telephone\": {\n          \"type\": \"text\"\n        },\n        \"street_id\": {\n          \"type\": \"text\"\n        },\n        \"detail\": {\n          \"type\": \"keyword\"\n        },\n        \"address\": {\n          \"type\": \"keyword\"\n        },\n        \"store_created\": {\n          \"type\": \"date\"\n        },\n        \"store_updated\": {\n          \"type\": \"date\"\n        },\n        \"detail_id\": {\n          \"type\": \"long\"\n        },\n        \"type_name\": {\n          \"type\": \"text\"\n        },\n        \"tag\": {\n          \"type\": \"keyword\"\n        },\n        \"overall_rating\": {\n          \"type\": \"text\"\n        },\n        \"navi_location_lng\": {\n          \"type\": \"double\"\n        },\n        \"navi_location_lat\": {\n          \"type\": \"double\"\n        },\n        \"detail_url\": {\n          \"type\": \"text\"\n        },\n        \"comment_num\": {\n          \"type\": \"integer\"\n        },\n        \"detail_created\": {\n          \"type\": \"date\"\n        },\n        \"detail_updated\": {\n          \"type\": \"date\"\n        },\n        \"location_id\": {\n          \"type\": \"long\"\n        },\n        \"lng\": {\n          \"type\": \"double\"\n        },\n        \"lat\": {\n          \"type\": \"double\"\n        }\n      }\n    }\n  }\n}\'\n</code></pre><p>然后通过<a href=\"http://localhost:9200/store_list/查看字段生成情况\">http://localhost:9200/store_list/查看字段生成情况</a></p>\n<p>store_list就是index,相当于数据库的database<br><img src=\"/upload/img/article/0/1_20181222233657.jpeg\" alt=\"1545493017959.jpeg\"></p>\n<p>然后回到logstash目录下</p>\n<p>执行 <code>nohup.exe ./bin/logstash.bat -f config-mysql/load_data.conf &amp;</code><br><img src=\"/upload/img/article/0/1_20181222233718.jpeg\" alt=\"1545493038182.jpeg\"></p>\n<p>最好加上&amp; 结尾，后台运行</p>\n<p>然后看数据库同步情况</p>\n<p><img src=\"/upload/img/article/0/1_20181222233729.jpeg\" alt=\"1545493049439.jpeg\"></p>\n\n<p>完</p>\n', ' ### 一、安装ElasticSearch(下面统称es,版本6.0.0,环境windows10)\n\n直接上下载地址：https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.zip\n###### 解压后目录如下：\n![1545492891560.jpeg](/upload/img/article/0/1_20181222233451.jpeg)\n启动es，``./bin/elasticsearch.bat ``；启动成功如图\n\n![1545492912496.jpeg](/upload/img/article/0/1_20181222233512.jpeg)\n\n\n默认cluster_name是elasticsearch和端口9200可以修改，需要修改在config/elasticsearch.yml;上图\n![1545492925261.jpeg](/upload/img/article/0/1_20181222233525.jpeg)\n\n\n### 二、安装logstash\n\n下载地址：https://artifacts.elastic.co/downloads/logstash/logstash-6.0.0.zip\n\n######解压目录\n\n![1545492937326.jpeg](/upload/img/article/0/1_20181222233537.jpeg)\n\n先安装logstash-input-jdbc插件 \n``./bin/logstash-plugin.bat install logstash-input-jdbc``\n\n![1545492947991.jpeg](/upload/img/article/0/1_20181222233548.jpeg)\n\n\n在logstash目录下创建config-mysql，见图4\n![1545492960530.jpeg](/upload/img/article/0/1_20181222233600.jpeg)\n\n\n创建配置文件load_data.conf，配置文件随便取名，可以创建sql文件，也可以在conf配置文件中定义，具体下面有说明\n\n######先上配置文件内容\n```\ninput {\n    stdin {\n    }\n    jdbc {\n      jdbc_connection_string => \"jdbc:mysql://127.0.0.1:3306/jfinal_club?characterEncoding=utf8&useSSL=false\"\n      jdbc_user => \"root\"\n      jdbc_password => \"root\"\n      jdbc_driver_library => \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/mysql-connector-java-5.1.43.jar\"\n      jdbc_driver_class => \"com.mysql.jdbc.Driver\"\n      jdbc_paging_enabled => \"true\"\n      jdbc_page_size => \"50000\"\n      statement_filepath => \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/store_list.sql\"\n      schedule => \"* * * * *\"\n      use_column_value => false\n      record_last_run => true\n      last_run_metadata_path => \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/run/store_list\"\n      type => \"sl\"\n    }\n\njdbc {\n      jdbc_connection_string => \"jdbc:mysql://127.0.0.1:3306/jfinal_club?characterEncoding=utf8&useSSL=false\"\n      jdbc_user => \"root\"\n      jdbc_password => \"root\"\n      jdbc_driver_library => \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/mysql-connector-java-5.1.43.jar\"\n      jdbc_driver_class => \"com.mysql.jdbc.Driver\"\n      jdbc_paging_enabled => \"true\"\n      jdbc_page_size => \"50000\"\n      statement => \"select * from store where updated > date_add(:sql_last_value, interval 8 hour)\"\n      schedule => \"* * * * *\"\n      use_column_value => false\n      record_last_run => true\n      last_run_metadata_path => \"D:/ELK/6.0.0/logstash-6.0.0/config-mysql/run/store_s\"\n      type => \"st\"\n    }\n}\n\nfilter {\n    json {\n        source => \"message\"\n        remove_field => [\"message\"]\n    }\n}\n\noutput {\n\n    if[type] == \"sl\"{\n        elasticsearch {\n              hosts => [\"127.0.0.1:9200\"]\n              index => \"store_list\"\n              document_type => \"jdbc\"\n              document_id => \"%{store_id}}\"\n        }\n    }\n\n    if[type] == \"st\"{\n        elasticsearch {\n              hosts => [\"127.0.0.1:9200\"]\n              index => \"store_st\"\n              document_type => \"jdbc\"\n              document_id => \"%{id}}\"\n        }\n    }\n\n    stdout {\n        codec => json_lines\n    }\n}\n```\n字段解释;具体的见：https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html\n\n\n###### 上图中有个run目录，在这里是用来存放:sql_last_value的时间值的\n\n##### store_list.sql\n![1545492990450.jpeg](/upload/img/article/0/1_20181222233630.jpeg)\n\n##### 先在es中生成index\n```\nPUT /store_list\n{\n    \"settings\": {\n    \"number_of_shards\": 3,\n    \"number_of_replicas\": 1\n  },\n  \"mappings\": {\n    \"jdbc\": {\n      \"properties\": {\n        \"@timestamp\": {\n          \"type\": \"date\"\n        },\n        \"@version\": {\n          \"type\": \"keyword\"\n        },\n        \"store_id\": {\n          \"type\": \"long\"\n        },\n        \"store_name\": {\n          \"type\": \"keyword\"\n        },\n        \"uid\": {\n          \"type\": \"text\"\n        },\n        \"telephone\": {\n          \"type\": \"text\"\n        },\n        \"street_id\": {\n          \"type\": \"text\"\n        },\n        \"detail\": {\n          \"type\": \"keyword\"\n        },\n        \"address\": {\n          \"type\": \"keyword\"\n        },\n        \"store_created\": {\n          \"type\": \"date\"\n        },\n        \"store_updated\": {\n          \"type\": \"date\"\n        },\n        \"detail_id\": {\n          \"type\": \"long\"\n        },\n        \"type_name\": {\n          \"type\": \"text\"\n        },\n        \"tag\": {\n          \"type\": \"keyword\"\n        },\n        \"overall_rating\": {\n          \"type\": \"text\"\n        },\n        \"navi_location_lng\": {\n          \"type\": \"double\"\n        },\n        \"navi_location_lat\": {\n          \"type\": \"double\"\n        },\n        \"detail_url\": {\n          \"type\": \"text\"\n        },\n        \"comment_num\": {\n          \"type\": \"integer\"\n        },\n        \"detail_created\": {\n          \"type\": \"date\"\n        },\n        \"detail_updated\": {\n          \"type\": \"date\"\n        },\n        \"location_id\": {\n          \"type\": \"long\"\n        },\n        \"lng\": {\n          \"type\": \"double\"\n        },\n        \"lat\": {\n          \"type\": \"double\"\n        }\n      }\n    }\n  }\n}\n```\n上面这种方式可以通过es管理工具执行，比如`kibana->dev tools`;或者使用`curl`的方式也可以\n```\ncurl -XPUT \"http://localhost:9200/store_list\" -H \'Content-Type: application/json\' -d\'\n{\n  \"settings\": {\n    \"number_of_shards\": 3,\n    \"number_of_replicas\": 1\n  },\n  \"mappings\": {\n    \"jdbc\": {\n      \"properties\": {\n        \"@timestamp\": {\n          \"type\": \"date\"\n        },\n        \"@version\": {\n          \"type\": \"keyword\"\n        },\n        \"store_id\": {\n          \"type\": \"long\"\n        },\n        \"store_name\": {\n          \"type\": \"keyword\"\n        },\n        \"uid\": {\n          \"type\": \"text\"\n        },\n        \"telephone\": {\n          \"type\": \"text\"\n        },\n        \"street_id\": {\n          \"type\": \"text\"\n        },\n        \"detail\": {\n          \"type\": \"keyword\"\n        },\n        \"address\": {\n          \"type\": \"keyword\"\n        },\n        \"store_created\": {\n          \"type\": \"date\"\n        },\n        \"store_updated\": {\n          \"type\": \"date\"\n        },\n        \"detail_id\": {\n          \"type\": \"long\"\n        },\n        \"type_name\": {\n          \"type\": \"text\"\n        },\n        \"tag\": {\n          \"type\": \"keyword\"\n        },\n        \"overall_rating\": {\n          \"type\": \"text\"\n        },\n        \"navi_location_lng\": {\n          \"type\": \"double\"\n        },\n        \"navi_location_lat\": {\n          \"type\": \"double\"\n        },\n        \"detail_url\": {\n          \"type\": \"text\"\n        },\n        \"comment_num\": {\n          \"type\": \"integer\"\n        },\n        \"detail_created\": {\n          \"type\": \"date\"\n        },\n        \"detail_updated\": {\n          \"type\": \"date\"\n        },\n        \"location_id\": {\n          \"type\": \"long\"\n        },\n        \"lng\": {\n          \"type\": \"double\"\n        },\n        \"lat\": {\n          \"type\": \"double\"\n        }\n      }\n    }\n  }\n}\'\n```\n然后通过http://localhost:9200/store_list/查看字段生成情况\n\nstore_list就是index,相当于数据库的database\n![1545493017959.jpeg](/upload/img/article/0/1_20181222233657.jpeg)\n\n\n然后回到logstash目录下\n\n执行 ``nohup.exe ./bin/logstash.bat -f config-mysql/load_data.conf &``\n![1545493038182.jpeg](/upload/img/article/0/1_20181222233718.jpeg)\n\n最好加上& 结尾，后台运行\n\n然后看数据库同步情况\n\n![1545493049439.jpeg](/upload/img/article/0/1_20181222233729.jpeg)\n\n---\n\n完\n', '2018-06-14 17:04:36', '2019-01-29 11:32:46', 95, 0, 0, 'blog', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (25, 1, 'SpringBoot中使用JFinal的ActiveRecordPlugin插件', '<h4 id=\"h4--jfinal-3-3-5-13-activerecordactiverecordplugin-java-web-java-web-start-\"><a name=\"在写分享前先看了看jfinal-3.3的文档章节：5.13 任意环境下使用 ActiveRecordActiveRecordPlugin 可以独立于 java web 环境运行在任何普通的 java 程序中，使用方式极度简单，相对于 web 项目只需要手动调用一下其 start() 方法即可立即使用。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>在写分享前先看了看jfinal-3.3的文档章节：5.13 任意环境下使用 ActiveRecordActiveRecordPlugin 可以独立于 java web 环境运行在任何普通的 java 程序中，使用方式极度简单，相对于 web 项目只需要手动调用一下其 start() 方法即可立即使用。</h4><h5 id=\"h5--\"><a name=\"以下是代码示例：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>以下是代码示例：</h5><pre><code>public class ActiveRecordTest{\n   public static void main(String[] args){\n       DruidPlugin dp=new DruidPlugin(&quot;localhost&quot;,&quot;userName&quot;,&quot;password&quot;);\n       ActiveRecordPlugin arp=new ActiveRecordPlugin(dp);\n       arp.addMapping(&quot;blog&quot;,Blog.class);\n       // 与web环境唯一的不同是要手动调用一次相关插件的start()方法\n       dp.start();\n       arp.start();\n       // 通过上面简单的几行代码，即可立即开始使用\n      newBlog().set(&quot;title&quot;,&quot;title&quot;).set(&quot;content&quot;,&quot;cxt text&quot;).save();\n       Blog.dao.findById(123);\n   }\n}\n</code></pre><p>注意：<code>ActiveRecordPlugin</code> 所依赖的其它插件也必须手动调用一下 start()方法，如上例中的<code>dp.start()</code></p>\n<h5 id=\"h5--\"><a name=\"下面进入正题：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>下面进入正题：</h5><p>创建一个插件类</p>\n<h6 id=\"h6-activerecordpluginconfig-\"><a name=\"ActiveRecordPluginConfig类\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>ActiveRecordPluginConfig类</h6><pre><code>package com.choxsu.elastic.config;\nimport com.alibaba.druid.filter.stat.StatFilter;\nimport com.alibaba.druid.wall.WallFilter;\nimport com.choxsu.elastic.entity._MappingKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordPlugin;\nimport com.jfinal.plugin.druid.DruidPlugin;\nimport com.jfinal.template.source.ClassPathSourceFactory;\nimport org.springframework.beans.factory.annotation.Value;\nimport org.springframework.context.annotation.Bean;\nimport org.springframework.context.annotation.Configuration;\nimport java.sql.Connection;\n/**\n * @author chox su\n * @date 2017/11/29 10:16\n */\n @Configuration\n public class ActiveRecordPluginConfig{\n    @Value(&quot;${spring.datasource.username}&quot;)\n    private String username;\n\n    @Value(&quot;${spring.datasource.password}&quot;)\n    private String password;\n\n    @Value(&quot;${spring.datasource.url}&quot;)\n    private String url;\n\n    @Bean\n    public ActiveRecordPlug ininitActiveRecordPlugin(){\n        DruidPlugindruidPlugin=newDruidPlugin(url,username,password);\n        // 加强数据库安全\n        WallFilterwallFilter=newWallFilter();\n        wallFilter.setDbType(&quot;mysql&quot;);\n        druidPlugin.addFilter(wallFilter);\n        // 添加 StatFilter 才会有统计数据\n        // druidPlugin.addFilter(new StatFilter());\n        // 必须手动调用start\n        druidPlugin.start();\n        ActiveRecordPlugin arp=new ActiveRecordPlugin(druidPlugin);\n        arp.setTransactionLevel(Connection.TRANSACTION_READ_COMMITTED);\n        _MappingKit.mapping(arp);\n        arp.setShowSql(false);\n        arp.getEngine().setSourceFactory(new ClassPathSourceFactory());\n        arp.addSqlTemplate(&quot;/sql/all_sqls.sql&quot;);\n        // 必须手动调用start\n        arp.start();\n        return arp;\n    }\n}\n</code></pre><h6 id=\"h6-application-yml-\"><a name=\"application.yml配置文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>application.yml配置文件</h6><pre><code>server:\n  port: 1013\nspring:\n  application:\n    name: name:elastic\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://192.168.3.44:3306/jfinal_club?characterEncoding=utf8&amp;useSSL=false\n</code></pre><h6 id=\"h6-pom-xml-\"><a name=\"pom.xml配置文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>pom.xml配置文件</h6><pre><code>&lt;dependency&gt;\n  &lt;groupId&gt;com.zgxl.market&lt;/groupId&gt;\n  &lt;artifactId&gt;fastjson&lt;/artifactId&gt;\n  &lt;version&gt;1.0.0&lt;/version&gt;\n&lt;/dependency&gt;\n\n&lt;dependency&gt;\n  &lt;groupId&gt;mysql&lt;/groupId&gt;\n  &lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;\n  &lt;version&gt;5.1.42&lt;/version&gt;\n&lt;/dependency&gt;\n\n&lt;dependency&gt;\n  &lt;groupId&gt;com.jfinal&lt;/groupId&gt;\n  &lt;artifactId&gt;jfinal&lt;/artifactId&gt;\n  &lt;version&gt;3.3&lt;/version&gt;\n&lt;/dependency&gt;\n\n&lt;dependency&gt;\n  &lt;groupId&gt;com.alibaba&lt;/groupId&gt;\n  &lt;artifactId&gt;druid&lt;/artifactId&gt;\n  &lt;version&gt;3.3&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre><p>主要用到的是上面这几个maven dependency</p>\n<h5 id=\"h5-u76EEu5F55u7ED3u6784\"><a name=\"目录结构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>目录结构</h5><p><img src=\"/upload/img/article/0/1_20181222234237.jpeg\" alt=\"1545493357388.jpeg\"></p>\n<h5 id=\"h5-u6D4Bu8BD5u6548u679C\"><a name=\"测试效果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试效果</h5><p>Controller类方法定义<br><img src=\"/upload/img/article/0/1_20181222234305.jpeg\" alt=\"1545493385715.jpeg\"></p>\n<p>swagger接口测试<br><img src=\"/upload/img/article/0/1_20181222234330.jpeg\" alt=\"1545493410781.jpeg\"></p>\n<hr>\n<p><img src=\"/upload/img/article/0/1_20181222234343.jpeg\" alt=\"1545493423406.jpeg\"></p>\n<p>sql管理功能这里没贴上来，但我已经测试通过了，springboot打包成jar启动可以找到sql路径，之前我是使用PathKit.getRootPath这种方式，这种方式打包成jar后就找不到路径；按照<code>ActiveRecordPluginConfig类</code>配置即可</p>\n', ' #### 在写分享前先看了看jfinal-3.3的文档章节：5.13 任意环境下使用 ActiveRecordActiveRecordPlugin 可以独立于 java web 环境运行在任何普通的 java 程序中，使用方式极度简单，相对于 web 项目只需要手动调用一下其 start() 方法即可立即使用。\n##### 以下是代码示例：\n```\npublic class ActiveRecordTest{\n   public static void main(String[] args){\n       DruidPlugin dp=new DruidPlugin(\"localhost\",\"userName\",\"password\");\n       ActiveRecordPlugin arp=new ActiveRecordPlugin(dp);\n       arp.addMapping(\"blog\",Blog.class);\n       // 与web环境唯一的不同是要手动调用一次相关插件的start()方法\n       dp.start();\n       arp.start();\n       // 通过上面简单的几行代码，即可立即开始使用\n      newBlog().set(\"title\",\"title\").set(\"content\",\"cxt text\").save();\n       Blog.dao.findById(123);\n   }\n}\n```\n注意：``ActiveRecordPlugin`` 所依赖的其它插件也必须手动调用一下 start()方法，如上例中的``dp.start()``\n\n#####下面进入正题：\n\n创建一个插件类\n###### ActiveRecordPluginConfig类\n\n```\npackage com.choxsu.elastic.config;\nimport com.alibaba.druid.filter.stat.StatFilter;\nimport com.alibaba.druid.wall.WallFilter;\nimport com.choxsu.elastic.entity._MappingKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordPlugin;\nimport com.jfinal.plugin.druid.DruidPlugin;\nimport com.jfinal.template.source.ClassPathSourceFactory;\nimport org.springframework.beans.factory.annotation.Value;\nimport org.springframework.context.annotation.Bean;\nimport org.springframework.context.annotation.Configuration;\nimport java.sql.Connection;\n/**\n * @author chox su\n * @date 2017/11/29 10:16\n */\n @Configuration\n public class ActiveRecordPluginConfig{\n    @Value(\"${spring.datasource.username}\")\n    private String username;\n\n    @Value(\"${spring.datasource.password}\")\n    private String password;\n\n    @Value(\"${spring.datasource.url}\")\n    private String url;\n\n    @Bean\n    public ActiveRecordPlug ininitActiveRecordPlugin(){\n        DruidPlugindruidPlugin=newDruidPlugin(url,username,password);\n        // 加强数据库安全\n        WallFilterwallFilter=newWallFilter();\n        wallFilter.setDbType(\"mysql\");\n        druidPlugin.addFilter(wallFilter);\n        // 添加 StatFilter 才会有统计数据\n        // druidPlugin.addFilter(new StatFilter());\n        // 必须手动调用start\n        druidPlugin.start();\n        ActiveRecordPlugin arp=new ActiveRecordPlugin(druidPlugin);\n        arp.setTransactionLevel(Connection.TRANSACTION_READ_COMMITTED);\n        _MappingKit.mapping(arp);\n        arp.setShowSql(false);\n        arp.getEngine().setSourceFactory(new ClassPathSourceFactory());\n        arp.addSqlTemplate(\"/sql/all_sqls.sql\");\n        // 必须手动调用start\n        arp.start();\n        return arp;\n    }\n}\n\n```\n###### application.yml配置文件\n```\nserver:\n  port: 1013\nspring:\n  application:\n    name: name:elastic\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://192.168.3.44:3306/jfinal_club?characterEncoding=utf8&useSSL=false\n```\n###### pom.xml配置文件\n```\n<dependency>\n  <groupId>com.zgxl.market</groupId>\n  <artifactId>fastjson</artifactId>\n  <version>1.0.0</version>\n</dependency>\n\n<dependency>\n  <groupId>mysql</groupId>\n  <artifactId>mysql-connector-java</artifactId>\n  <version>5.1.42</version>\n</dependency>\n\n<dependency>\n  <groupId>com.jfinal</groupId>\n  <artifactId>jfinal</artifactId>\n  <version>3.3</version>\n</dependency>\n\n<dependency>\n  <groupId>com.alibaba</groupId>\n  <artifactId>druid</artifactId>\n  <version>3.3</version>\n</dependency>\n\n```\n主要用到的是上面这几个maven dependency\n\n##### 目录结构\n\n![1545493357388.jpeg](/upload/img/article/0/1_20181222234237.jpeg)\n##### 测试效果\n\nController类方法定义\n![1545493385715.jpeg](/upload/img/article/0/1_20181222234305.jpeg)\n\n\nswagger接口测试\n![1545493410781.jpeg](/upload/img/article/0/1_20181222234330.jpeg)\n\n----\n\n![1545493423406.jpeg](/upload/img/article/0/1_20181222234343.jpeg)\n\nsql管理功能这里没贴上来，但我已经测试通过了，springboot打包成jar启动可以找到sql路径，之前我是使用PathKit.getRootPath这种方式，这种方式打包成jar后就找不到路径；按照``ActiveRecordPluginConfig类``配置即可\n', '2018-06-14 17:05:40', '2018-12-22 23:44:03', 151, 0, 0, 'blog', 0, 20, NULL, 1);
INSERT INTO `blog` VALUES (26, 1, 'IDEA下利用Jrebel插件实现JFinal或SpringBoot【热启动】（Tomcat同理）', '<h4 id=\"h4--jrebel-\"><a name=\"第一步：下载jrebel插件，这个是必须的，步骤如下\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>第一步：下载jrebel插件，这个是必须的，步骤如下</h4><p><img src=\"/upload/img/article/0/1_20181223001002.png\" alt=\"1545495013080.png\"></p>\n<p>我这里已经下载了，如果没有下载，就选择下载，下载有点慢，慢慢等待就好，需要离线插件包可以@我</p>\n<p>下载完成后重启，然后激活，<br><img src=\"/upload/img/article/0/1_20181223001033.png\" alt=\"1545495043709.png\"></p>\n<p>进入激活页面<br><img src=\"/upload/img/article/0/1_20181223001045.png\" alt=\"1545495055992.png\"><br>也可以选择我的方式，去官网注册获取激活code</p>\n<p>具体激活参考这个帖子IntelliJ IDEA / JRebel 激活;</p>\n<p>jrebel相关设置</p>\n<p>file&gt;setting&gt;jrebel, 类资源刷新间隔设置</p>\n<p><img src=\"/upload/img/article/0/1_20181223001117.png\" alt=\"1545495087472.png\"></p>\n<p>file&gt;setting&gt;jrebel&gt;Startup,默认即可<br><img src=\"/upload/img/article/0/1_20181223001128.png\" alt=\"1545495099248.png\"><br>第二步：进入正题，相应的设置，见图流程走下去</p>\n<p>使用快捷键ctrl+alt+shift+/ —&gt;registry<br><img src=\"/upload/img/article/0/1_20181223001143.png\" alt=\"1545495113988.png\"></p>\n<p><img src=\"/upload/img/article/0/1_20181223001151.png\" alt=\"1545495121962.png\"><br>到这里离热启动又近一步了</p>\n<p>打开设置，打开自动编译</p>\n<p><img src=\"/upload/img/article/0/1_20181223001201.png\" alt=\"1545495131800.png\"></p>\n<p>JRebel项目或者模块选择热部署页面</p>\n<p><img src=\"/upload/img/article/0/1_20181223001221.png\" alt=\"1545495151667.png\"></p>\n<p>需要部署的项目勾选</p>\n<p><img src=\"/upload/img/article/0/1_20181223001242.png\" alt=\"1545495173214.png\"><br>最后一步</p>\n<p><img src=\"/upload/img/article/0/1_20181223001302.png\" alt=\"1545495192700.png\"></p>\n<p><img src=\"/upload/img/article/0/1_20181223001311.png\" alt=\"1545495202111.png\"><br>对比</p>\n<p>修改前<br><img src=\"/upload/img/article/0/1_20181223001329.png\" alt=\"1545495220132.png\"></p>\n<p><img src=\"/upload/img/article/0/1_20181223001345.png\" alt=\"1545495235878.png\"><br>修改后</p>\n<p><img src=\"/upload/img/article/0/1_20181223001405.png\" alt=\"1545495255794.png\"></p>\n<p><img src=\"/upload/img/article/0/1_20181223001400.png\" alt=\"1545495251020.png\"><br>到这里就可以节约n多时间</p>\n', '#### 第一步：下载jrebel插件，这个是必须的，步骤如下\n![1545495013080.png](/upload/img/article/0/1_20181223001002.png)\n\n我这里已经下载了，如果没有下载，就选择下载，下载有点慢，慢慢等待就好，需要离线插件包可以@我\n\n下载完成后重启，然后激活，\n![1545495043709.png](/upload/img/article/0/1_20181223001033.png)\n\n进入激活页面\n![1545495055992.png](/upload/img/article/0/1_20181223001045.png)\n也可以选择我的方式，去官网注册获取激活code\n\n具体激活参考这个帖子IntelliJ IDEA / JRebel 激活;\n\njrebel相关设置\n\nfile>setting>jrebel, 类资源刷新间隔设置\n\n![1545495087472.png](/upload/img/article/0/1_20181223001117.png)\n\nfile>setting>jrebel>Startup,默认即可\n![1545495099248.png](/upload/img/article/0/1_20181223001128.png)\n第二步：进入正题，相应的设置，见图流程走下去\n\n使用快捷键ctrl+alt+shift+/ -->registry\n![1545495113988.png](/upload/img/article/0/1_20181223001143.png)\n\n\n![1545495121962.png](/upload/img/article/0/1_20181223001151.png)\n到这里离热启动又近一步了\n\n打开设置，打开自动编译\n\n![1545495131800.png](/upload/img/article/0/1_20181223001201.png)\n\nJRebel项目或者模块选择热部署页面\n\n![1545495151667.png](/upload/img/article/0/1_20181223001221.png)\n\n需要部署的项目勾选\n\n![1545495173214.png](/upload/img/article/0/1_20181223001242.png)\n最后一步\n\n![1545495192700.png](/upload/img/article/0/1_20181223001302.png)\n\n![1545495202111.png](/upload/img/article/0/1_20181223001311.png)\n对比\n\n修改前\n![1545495220132.png](/upload/img/article/0/1_20181223001329.png)\n\n![1545495235878.png](/upload/img/article/0/1_20181223001345.png)\n修改后\n\n![1545495255794.png](/upload/img/article/0/1_20181223001405.png)\n\n![1545495251020.png](/upload/img/article/0/1_20181223001400.png)\n到这里就可以节约n多时间', '2018-06-14 17:14:52', '2018-12-23 00:14:25', 50, 0, 0, 'blog', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (27, 1, 'IDEA push to origin/master was rejected错误解决方案', '<h5 id=\"h5-idea-oschina-git-git-push-push-to-origin-master-war-rejected-\"><a name=\"idea中，发布项目到OSChina的Git中，当时按照这样的流程添加Git，然后push，提示：push to origin/master war rejected”。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>idea中，发布项目到OSChina的Git中，当时按照这样的流程添加Git，然后push，提示：push to origin/master war rejected”。</h5><p><img src=\"/upload/img/article/0/1_20181223000017.jpeg\" alt=\"1545494417439.jpeg\"></p>\n<p><img src=\"/upload/img/article/0/1_20181223000024.jpeg\" alt=\"1545494424047.jpeg\"><br>解决方案如下：</p>\n<p>1.切换到自己项目所在的目录，右键选择<code>GIT BASH Here</code></p>\n<p>2.在terminl窗口中依次输入命令：</p>\n<pre><code>git pull\n\ngit pull origin master\n\ngit pull origin master --allow-unrelated-histories\n</code></pre><p>3.在idea中重新push自己的项目，成功！！！</p>\n', ' ##### idea中，发布项目到OSChina的Git中，当时按照这样的流程添加Git，然后push，提示：push to origin/master war rejected\"。\n\n![1545494417439.jpeg](/upload/img/article/0/1_20181223000017.jpeg)\n\n![1545494424047.jpeg](/upload/img/article/0/1_20181223000024.jpeg)\n解决方案如下：\n\n1.切换到自己项目所在的目录，右键选择`GIT BASH Here`\n\n2.在terminl窗口中依次输入命令：\n\n```\ngit pull\n\ngit pull origin master\n\ngit pull origin master --allow-unrelated-histories\n```\n\n3.在idea中重新push自己的项目，成功！！！', '2018-06-14 17:16:36', '2018-12-23 00:00:49', 135, 0, 0, 'blog', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (28, 2, '详解log4j2(上) - 从基础到实战(转)', '<p> log4j2相对于log4j 1.x有了脱胎换骨的变化，其官网宣称的优势有多线程下10几倍于log4j 1.x和logback的高吞吐量、可配置的审计型日志、基于插件架构的各种灵活配置等。如果已经掌握log4j 1.x，使用log4j2还是非常简单的。</p>\n<p>先看一个示例</p>\n<h4 id=\"h4-1-\"><a name=\"1 基础配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1 基础配置</h4><p>普通java项目手动添加jar包</p>\n<pre><code>log4j-api-2.5.jar  \nlog4j-core-2.5.jar\n</code></pre><p>Maven项目pom.xml</p>\n<pre><code>&lt;dependencies&gt;  \n    &lt;dependency&gt;  \n        &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;  \n        &lt;artifactId&gt;log4j-api&lt;/artifactId&gt;  \n        &lt;version&gt;2.5&lt;/version&gt;  \n    &lt;/dependency&gt;  \n    &lt;dependency&gt;  \n        &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;  \n        &lt;artifactId&gt;log4j-core&lt;/artifactId&gt;  \n        &lt;version&gt;2.5&lt;/version&gt;  \n    &lt;/dependency&gt;  \n&lt;/dependencies&gt;\n</code></pre><p>测试代码</p>\n<pre><code>public static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);  \n    logger.trace(&quot;trace level&quot;);  \n    logger.debug(&quot;debug level&quot;);  \n    logger.info(&quot;info level&quot;);  \n    logger.warn(&quot;warn level&quot;);  \n    logger.error(&quot;error level&quot;);  \n    logger.fatal(&quot;fatal level&quot;);  \n}\n</code></pre><p>运行后输出</p>\n<pre><code>1.  ERROR StatusLogger No log4j2 configuration file found. Using default configuration: logging only errors to the console.  \n2.  20:37:11.965 [main] ERROR  - error level  \n3.  20:37:11.965 [main] FATAL  - fatal level\n</code></pre><p>可以看到log4j2先发了一句牢骚，抱怨没有找到配置文件什么的，不过还是输出了error和fatal两个级别的信息。<br>log4j2默认会在classpath目录下寻找log4j.json、log4j.jsn、log4j2.xml等名称的文件，如果都没有找到，则会按默认配置输出，也就是输出到控制台。</p>\n<p>下面我们按默认配置添加一个log4j2.xml，添加到src根目录即可</p>\n<pre><code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;  \n&lt;Configuration status=&quot;WARN&quot;&gt;  \n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n    &lt;/Appenders&gt;  \n    &lt;Loggers&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p>重新执行测试代码，可以看到输出结果相同，但是没有再提示找不到配置文件。<br>来看我们添加的配置文件log4j2.xml，以Configuration为根节点，有一个status属性，这个属性表示log4j2本身的日志信息打印级别。如果把status改为TRACE再执行测试代码，可以看到控制台中打印了一些log4j加载插件、组装logger等调试信息。<br>日志级别从低到高分为TRACE &lt; DEBUG &lt; INFO &lt; WARN &lt; ERROR &lt; FATAL，如果设置为WARN，则低于WARN的信息都不会输出。对于Loggers中level的定义同样适用。</p>\n<p>下面是Appender配置，Appender可以理解为日志的输出目的地，这里配置了一个类型为Console的Appender，也就是输出到控制台。Console节点中的PatternLayout定义了输出日志时的格式：</p>\n<p>%d{HH:mm:ss.SSS} 表示输出到毫秒的时间</p>\n<p>%t 输出当前线程名称</p>\n<p>%-5level 输出日志级别，-5表示左对齐并且固定输出5个字符，如果不足在右边补0</p>\n<p>%logger 输出logger名称，因为Root Logger没有名称，所以没有输出</p>\n<p>%msg 日志文本</p>\n<p>%n 换行</p>\n<p>其他常用的占位符有：</p>\n<p>%F 输出所在的类文件名，如Client.java</p>\n<p>%L 输出行号</p>\n<p>%M 输出所在方法名</p>\n<p>%l  输出语句所在的行数, 包括类名、方法名、文件名、行数</p>\n<p>最后是Logger的配置，这里只配置了一个Root Logger。</p>\n<h4 id=\"h4-2-logger\"><a name=\"2 自定义Logger\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2 自定义Logger</h4><p>首先修改测试代码</p>\n<pre><code>public static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(&quot;mylog&quot;);  \n    logger.trace(&quot;trace level&quot;);  \n    logger.debug(&quot;debug level&quot;);  \n    logger.info(&quot;info level&quot;);  \n    logger.warn(&quot;warn level&quot;);  \n    logger.error(&quot;error level&quot;);  \n    logger.fatal(&quot;fatal level&quot;);  \n}\n</code></pre><p>logger从获取Root Logger改为尝试获得一个名称为mylog的Logger，在配置文件中一无所得后，又找到了Root Logger，所以执行结果相同。<br>下面修改配置文件</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n    &lt;/Appenders&gt;  \n    &lt;Loggers&gt;  \n        &lt;Logger name=&quot;mylog&quot; level=&quot;trace&quot; additivity=&quot;false&quot;&gt;  \n        &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n    &lt;/Logger&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p>再次执行测试代码，这一次log4j2很高兴的找到了名称为mylog的配置，于是使用新配置把level改为trace，全部的信息都输出了。<br>additivity=”false”表示在该logger中输出的日志不会再延伸到父层logger。这里如果改为true，则会延伸到Root Logger，遵循Root Logger的配置也输出一次。</p>\n<p>注意根节点增加了一个monitorInterval属性，含义是每隔300秒重新读取配置文件，可以不重启应用的情况下修改配置，还是很好用的功能。</p>\n<h4 id=\"h4-3-appender\"><a name=\"3 自定义Appender\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3 自定义Appender</h4><p>修改配置文件，添加一个文件类型的Appender，并且把mylog的AppenderRef改为新加的Appender</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n        &lt;File name=&quot;MyFile&quot; fileName=&quot;D:/logs/app.log&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/File&gt;  \n    &lt;/Appenders&gt;  \n    &lt;Loggers&gt;  \n        &lt;Logger name=&quot;mylog&quot; level=&quot;trace&quot; additivity=&quot;true&quot;&gt;  \n            &lt;AppenderRef ref=&quot;MyFile&quot; /&gt;  \n        &lt;/Logger&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p>执行并查看控制台和 <strong>D:/logs/app.log</strong>的输出结果</p>\n<h4 id=\"h4-4-\"><a name=\"4 实用型配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4 实用型配置</h4><p>下面配置一个按时间和文件大小滚动的RollingRandomAccessFile Appender，名字真是够长，但不光只是名字长，相比RollingFileAppender有很大的性能提升，官网宣称是20-200%。</p>\n<p>Rolling的意思是当满足一定条件后，就重命名原日志文件用于备份，并从新生成一个新的日志文件。例如需求是每天生成一个日志文件，但是如果一天内的日志文件体积已经超过1G，就从新生成，两个条件满足一个即可。这在log4j 1.x原生功能中无法实现，在log4j2中就很简单了。</p>\n<p>看下面的配置</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;properties&gt;  \n        &lt;property name=&quot;LOG_HOME&quot;&gt;D:/logs&lt;/property&gt;  \n        &lt;property name=&quot;FILE_NAME&quot;&gt;mylog&lt;/property&gt;  \n    &lt;/properties&gt;  \n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n        &lt;RollingRandomAccessFile name=&quot;MyFile&quot;  \n            fileName=&quot;${LOG_HOME}/${FILE_NAME}.log&quot;  \n            filePattern=&quot;${LOG_HOME}/$${date:yyyy-MM}/${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i.log&quot;&gt;  \n            &lt;PatternLayout  \n                pattern=&quot;%d{yyyy-MM-dd HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n            &lt;Policies&gt;  \n                &lt;TimeBasedTriggeringPolicy interval=&quot;1&quot; /&gt;  \n                &lt;SizeBasedTriggeringPolicy size=&quot;10 MB&quot; /&gt;  \n            &lt;/Policies&gt;  \n            &lt;DefaultRolloverStrategy max=&quot;20&quot; /&gt;  \n        &lt;/RollingRandomAccessFile&gt;  \n    &lt;/Appenders&gt;  \n\n    &lt;Loggers&gt;  \n        &lt;Logger name=&quot;mylog&quot; level=&quot;trace&quot; additivity=&quot;false&quot;&gt;  \n            &lt;AppenderRef ref=&quot;MyFile&quot; /&gt;  \n        &lt;/Logger&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p>&lt;properties&gt;定义了两个常量方便后面复用</p>\n<p>RollingRandomAccessFile的属性：</p>\n<p>fileName  指定当前日志文件的位置和文件名称</p>\n<p>filePattern  指定当发生Rolling时，文件的转移和重命名规则</p>\n<p>SizeBasedTriggeringPolicy  指定当文件体积大于size指定的值时，触发Rolling</p>\n<p>DefaultRolloverStrategy  指定最多保存的文件个数</p>\n<p>TimeBasedTriggeringPolicy  这个配置需要和filePattern结合使用，注意filePattern中配置的文件重命名规则是${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i，最小的时间粒度是mm，即分钟，TimeBasedTriggeringPolicy指定的size是1，结合起来就是每1分钟生成一个新文件。如果改成%d{yyyy-MM-dd HH}，最小粒度为小时，则每一个小时生成一个文件。</p>\n<p>修改测试代码，模拟文件体积超过10M和时间超过1分钟来验证结果</p>\n<pre><code>public static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(&quot;mylog&quot;);  \n    for(int i = 0; i &lt; 50000; i++) {  \n        logger.trace(&quot;trace level&quot;);  \n        logger.debug(&quot;debug level&quot;);  \n        logger.info(&quot;info level&quot;);  \n        logger.warn(&quot;warn level&quot;);  \n        logger.error(&quot;error level&quot;);  \n        logger.fatal(&quot;fatal level&quot;);  \n    }  \n    try {  \n        Thread.sleep(1000 * 61);  \n    } catch (InterruptedException e) {}  \n    logger.trace(&quot;trace level&quot;);  \n    logger.debug(&quot;debug level&quot;);  \n    logger.info(&quot;info level&quot;);  \n    logger.warn(&quot;warn level&quot;);  \n    logger.error(&quot;error level&quot;);  \n    logger.fatal(&quot;fatal level&quot;);  \n}\n</code></pre><h4 id=\"h4-5-\"><a name=\"5 自定义配置文件位置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>5 自定义配置文件位置</h4><p>log4j2默认在classpath下查找配置文件，可以修改配置文件的位置。在非web项目中：</p>\n<pre><code>public static void main(String[] args) throws IOException {  \n    File file = new File(&quot;D:/log4j2.xml&quot;);  \n    BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));  \n    final ConfigurationSource source = new ConfigurationSource(in);  \n    Configurator.initialize(null, source);  \n\n    Logger logger = LogManager.getLogger(&quot;mylog&quot;);  \n}\n</code></pre><p>如果是web项目，在web.xml中添加</p>\n<pre><code>&lt;context-param&gt;  \n    &lt;param-name&gt;log4jConfiguration&lt;/param-name&gt;  \n    &lt;param-value&gt;/WEB-INF/conf/log4j2.xml&lt;/param-value&gt;  \n&lt;/context-param&gt;  \n\n&lt;listener&gt;  \n    &lt;listener-class&gt;org.apache.logging.log4j.web.Log4jServletContextListener&lt;/listener-class&gt;  \n&lt;/listener&gt;\n</code></pre><p>掌握这些基本可以实际使用了，下篇介绍一些高级应用，异步Appender、MongoDB Appender和基于Filters的按级别输出到不同文件的设置</p>\n<p><em>转自：</em> <a href=\"http://blog.csdn.net/autfish/article/details/51203709\">http://blog.csdn.net/autfish/article/details/51203709</a></p>\n', ' log4j2相对于log4j 1.x有了脱胎换骨的变化，其官网宣称的优势有多线程下10几倍于log4j 1.x和logback的高吞吐量、可配置的审计型日志、基于插件架构的各种灵活配置等。如果已经掌握log4j 1.x，使用log4j2还是非常简单的。\n\n先看一个示例\n####1 基础配置\n普通java项目手动添加jar包\n\n```\nlog4j-api-2.5.jar  \nlog4j-core-2.5.jar  \n```\nMaven项目pom.xml\n\n```\n<dependencies>  \n    <dependency>  \n        <groupId>org.apache.logging.log4j</groupId>  \n        <artifactId>log4j-api</artifactId>  \n        <version>2.5</version>  \n    </dependency>  \n    <dependency>  \n        <groupId>org.apache.logging.log4j</groupId>  \n        <artifactId>log4j-core</artifactId>  \n        <version>2.5</version>  \n    </dependency>  \n</dependencies>  \n```\n测试代码\n```\npublic static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);  \n    logger.trace(\"trace level\");  \n    logger.debug(\"debug level\");  \n    logger.info(\"info level\");  \n    logger.warn(\"warn level\");  \n    logger.error(\"error level\");  \n    logger.fatal(\"fatal level\");  \n}  \n```\n运行后输出\n```\n1.  ERROR StatusLogger No log4j2 configuration file found. Using default configuration: logging only errors to the console.  \n2.  20:37:11.965 [main] ERROR  - error level  \n3.  20:37:11.965 [main] FATAL  - fatal level\n\n```\n可以看到log4j2先发了一句牢骚，抱怨没有找到配置文件什么的，不过还是输出了error和fatal两个级别的信息。\nlog4j2默认会在classpath目录下寻找log4j.json、log4j.jsn、log4j2.xml等名称的文件，如果都没有找到，则会按默认配置输出，也就是输出到控制台。\n\n下面我们按默认配置添加一个log4j2.xml，添加到src根目录即可\n\n```\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>  \n<Configuration status=\"WARN\">  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n    </Appenders>  \n    <Loggers>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n重新执行测试代码，可以看到输出结果相同，但是没有再提示找不到配置文件。\n来看我们添加的配置文件log4j2.xml，以Configuration为根节点，有一个status属性，这个属性表示log4j2本身的日志信息打印级别。如果把status改为TRACE再执行测试代码，可以看到控制台中打印了一些log4j加载插件、组装logger等调试信息。\n日志级别从低到高分为TRACE < DEBUG < INFO < WARN < ERROR < FATAL，如果设置为WARN，则低于WARN的信息都不会输出。对于Loggers中level的定义同样适用。\n\n下面是Appender配置，Appender可以理解为日志的输出目的地，这里配置了一个类型为Console的Appender，也就是输出到控制台。Console节点中的PatternLayout定义了输出日志时的格式：\n\n%d{HH:mm:ss.SSS} 表示输出到毫秒的时间\n\n%t 输出当前线程名称\n\n%-5level 输出日志级别，-5表示左对齐并且固定输出5个字符，如果不足在右边补0\n\n%logger 输出logger名称，因为Root Logger没有名称，所以没有输出\n\n%msg 日志文本\n\n%n 换行\n\n其他常用的占位符有：\n\n%F 输出所在的类文件名，如Client.java\n\n%L 输出行号\n\n%M 输出所在方法名\n\n%l  输出语句所在的行数, 包括类名、方法名、文件名、行数\n\n最后是Logger的配置，这里只配置了一个Root Logger。\n####2 自定义Logger\n\n首先修改测试代码\n\n```\npublic static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(\"mylog\");  \n    logger.trace(\"trace level\");  \n    logger.debug(\"debug level\");  \n    logger.info(\"info level\");  \n    logger.warn(\"warn level\");  \n    logger.error(\"error level\");  \n    logger.fatal(\"fatal level\");  \n}  \n```\nlogger从获取Root Logger改为尝试获得一个名称为mylog的Logger，在配置文件中一无所得后，又找到了Root Logger，所以执行结果相同。\n下面修改配置文件\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n    </Appenders>  \n    <Loggers>  \n        <Logger name=\"mylog\" level=\"trace\" additivity=\"false\">  \n        <AppenderRef ref=\"Console\" />  \n    </Logger>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n再次执行测试代码，这一次log4j2很高兴的找到了名称为mylog的配置，于是使用新配置把level改为trace，全部的信息都输出了。\nadditivity=\"false\"表示在该logger中输出的日志不会再延伸到父层logger。这里如果改为true，则会延伸到Root Logger，遵循Root Logger的配置也输出一次。\n\n注意根节点增加了一个monitorInterval属性，含义是每隔300秒重新读取配置文件，可以不重启应用的情况下修改配置，还是很好用的功能。\n####3 自定义Appender\n修改配置文件，添加一个文件类型的Appender，并且把mylog的AppenderRef改为新加的Appender\n\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n        <File name=\"MyFile\" fileName=\"D:/logs/app.log\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </File>  \n    </Appenders>  \n    <Loggers>  \n        <Logger name=\"mylog\" level=\"trace\" additivity=\"true\">  \n            <AppenderRef ref=\"MyFile\" />  \n        </Logger>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>\n```\n执行并查看控制台和 **D:/logs/app.log**的输出结果\n\n####4 实用型配置\n下面配置一个按时间和文件大小滚动的RollingRandomAccessFile Appender，名字真是够长，但不光只是名字长，相比RollingFileAppender有很大的性能提升，官网宣称是20-200%。\n\nRolling的意思是当满足一定条件后，就重命名原日志文件用于备份，并从新生成一个新的日志文件。例如需求是每天生成一个日志文件，但是如果一天内的日志文件体积已经超过1G，就从新生成，两个条件满足一个即可。这在log4j 1.x原生功能中无法实现，在log4j2中就很简单了。\n\n看下面的配置\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <properties>  \n        <property name=\"LOG_HOME\">D:/logs</property>  \n        <property name=\"FILE_NAME\">mylog</property>  \n    </properties>  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n        <RollingRandomAccessFile name=\"MyFile\"  \n            fileName=\"${LOG_HOME}/${FILE_NAME}.log\"  \n            filePattern=\"${LOG_HOME}/$${date:yyyy-MM}/${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i.log\">  \n            <PatternLayout  \n                pattern=\"%d{yyyy-MM-dd HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n            <Policies>  \n                <TimeBasedTriggeringPolicy interval=\"1\" />  \n                <SizeBasedTriggeringPolicy size=\"10 MB\" />  \n            </Policies>  \n            <DefaultRolloverStrategy max=\"20\" />  \n        </RollingRandomAccessFile>  \n    </Appenders>  \n  \n    <Loggers>  \n        <Logger name=\"mylog\" level=\"trace\" additivity=\"false\">  \n            <AppenderRef ref=\"MyFile\" />  \n        </Logger>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n<properties>定义了两个常量方便后面复用\n\nRollingRandomAccessFile的属性：\n\nfileName  指定当前日志文件的位置和文件名称\n\nfilePattern  指定当发生Rolling时，文件的转移和重命名规则\n\nSizeBasedTriggeringPolicy  指定当文件体积大于size指定的值时，触发Rolling\n\nDefaultRolloverStrategy  指定最多保存的文件个数\n\nTimeBasedTriggeringPolicy  这个配置需要和filePattern结合使用，注意filePattern中配置的文件重命名规则是${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i，最小的时间粒度是mm，即分钟，TimeBasedTriggeringPolicy指定的size是1，结合起来就是每1分钟生成一个新文件。如果改成%d{yyyy-MM-dd HH}，最小粒度为小时，则每一个小时生成一个文件。\n\n修改测试代码，模拟文件体积超过10M和时间超过1分钟来验证结果\n\n```\npublic static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(\"mylog\");  \n    for(int i = 0; i < 50000; i++) {  \n        logger.trace(\"trace level\");  \n        logger.debug(\"debug level\");  \n        logger.info(\"info level\");  \n        logger.warn(\"warn level\");  \n        logger.error(\"error level\");  \n        logger.fatal(\"fatal level\");  \n    }  \n    try {  \n        Thread.sleep(1000 * 61);  \n    } catch (InterruptedException e) {}  \n    logger.trace(\"trace level\");  \n    logger.debug(\"debug level\");  \n    logger.info(\"info level\");  \n    logger.warn(\"warn level\");  \n    logger.error(\"error level\");  \n    logger.fatal(\"fatal level\");  \n}  \n```\n####5 自定义配置文件位置\nlog4j2默认在classpath下查找配置文件，可以修改配置文件的位置。在非web项目中：\n```\npublic static void main(String[] args) throws IOException {  \n    File file = new File(\"D:/log4j2.xml\");  \n    BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));  \n    final ConfigurationSource source = new ConfigurationSource(in);  \n    Configurator.initialize(null, source);  \n      \n    Logger logger = LogManager.getLogger(\"mylog\");  \n} \n ```\n如果是web项目，在web.xml中添加\n```\n<context-param>  \n    <param-name>log4jConfiguration</param-name>  \n    <param-value>/WEB-INF/conf/log4j2.xml</param-value>  \n</context-param>  \n  \n<listener>  \n    <listener-class>org.apache.logging.log4j.web.Log4jServletContextListener</listener-class>  \n</listener>  \n```\n掌握这些基本可以实际使用了，下篇介绍一些高级应用，异步Appender、MongoDB Appender和基于Filters的按级别输出到不同文件的设置\n\n*转自：* [http://blog.csdn.net/autfish/article/details/51203709](http://blog.csdn.net/autfish/article/details/51203709)\n ', '2018-06-14 18:18:09', '2018-06-14 17:17:09', 134, 0, 0, 'favorite', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (29, 2, '详解log4j2(下) - Async/MongoDB/Flume Appender 按日志级别区分文件输出', '<h3 id=\"h3-1-\"><a name=\"1. 按日志级别区分文件输出\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1. 按日志级别区分文件输出</h3><p>有些人习惯按日志信息级别输出到不同名称的文件中，如info.log，error.log，warn.log等，在log4j2中可通过配置Filters来实现。</p>\n<p>假定需求是把INFO及以下级别的信息输出到info.log，WARN和ERROR级别的信息输出到error.log，FATAL级别输出到fatal.log，配置文件如下：</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;\n    &lt;properties&gt;\n        &lt;property name=&quot;LOG_HOME&quot;&gt;D:/logs&lt;/property&gt;\n    &lt;/properties&gt;\n    &lt;Appenders&gt;\n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;\n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;\n        &lt;/Console&gt;\n\n        &lt;RollingRandomAccessFile name=&quot;InfoFile&quot;\n            fileName=&quot;${LOG_HOME}/info.log&quot;\n            filePattern=&quot;${LOG_HOME}/$${date:yyyy-MM}/info-%d{yyyy-MM-dd}-%i.log&quot;&gt;\n            &lt;Filters&gt;\n                &lt;ThresholdFilter level=&quot;warn&quot; onMatch=&quot;DENY&quot; onMismatch=&quot;NEUTRAL&quot; /&gt;\n                &lt;ThresholdFilter level=&quot;trace&quot; onMatch=&quot;ACCEPT&quot; onMismatch=&quot;DENY&quot; /&gt;\n            &lt;/Filters&gt;\n            &lt;PatternLayout pattern=&quot;%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n&quot; /&gt;\n            &lt;Policies&gt;\n                &lt;TimeBasedTriggeringPolicy /&gt;\n                &lt;SizeBasedTriggeringPolicy size=&quot;10 MB&quot; /&gt;\n            &lt;/Policies&gt;\n            &lt;DefaultRolloverStrategy max=&quot;20&quot; /&gt;\n        &lt;/RollingRandomAccessFile&gt;\n\n        &lt;RollingRandomAccessFile name=&quot;ErrorFile&quot;\n            fileName=&quot;${LOG_HOME}/error.log&quot;\n            filePattern=&quot;${LOG_HOME}/$${date:yyyy-MM}/error-%d{yyyy-MM-dd}-%i.log&quot;&gt;\n            &lt;Filters&gt;\n                &lt;ThresholdFilter level=&quot;fatal&quot; onMatch=&quot;DENY&quot; onMismatch=&quot;NEUTRAL&quot; /&gt;\n                &lt;ThresholdFilter level=&quot;warn&quot; onMatch=&quot;ACCEPT&quot; onMismatch=&quot;DENY&quot; /&gt;\n            &lt;/Filters&gt;\n            &lt;PatternLayout pattern=&quot;%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n&quot; /&gt;\n            &lt;Policies&gt;\n                &lt;TimeBasedTriggeringPolicy /&gt;\n                &lt;SizeBasedTriggeringPolicy size=&quot;10 MB&quot; /&gt;\n            &lt;/Policies&gt;\n            &lt;DefaultRolloverStrategy max=&quot;20&quot; /&gt;\n        &lt;/RollingRandomAccessFile&gt;\n\n        &lt;RollingRandomAccessFile name=&quot;FatalFile&quot;\n            fileName=&quot;${LOG_HOME}/fatal.log&quot;\n            filePattern=&quot;${LOG_HOME}/$${date:yyyy-MM}/fatal-%d{yyyy-MM-dd}-%i.log&quot;&gt;\n            &lt;Filters&gt;\n                &lt;ThresholdFilter level=&quot;fatal&quot; onMatch=&quot;ACCEPT&quot; onMismatch=&quot;DENY&quot; /&gt;\n            &lt;/Filters&gt;\n            &lt;PatternLayout pattern=&quot;%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n&quot; /&gt;\n            &lt;Policies&gt;\n                &lt;TimeBasedTriggeringPolicy /&gt;\n                &lt;SizeBasedTriggeringPolicy size=&quot;10 MB&quot; /&gt;\n            &lt;/Policies&gt;\n            &lt;DefaultRolloverStrategy max=&quot;20&quot; /&gt;\n        &lt;/RollingRandomAccessFile&gt;\n    &lt;/Appenders&gt;\n\n    &lt;Loggers&gt;\n        &lt;Root level=&quot;trace&quot;&gt;\n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;\n            &lt;AppenderRef ref=&quot;InfoFile&quot; /&gt;\n            &lt;AppenderRef ref=&quot;ErrorFile&quot; /&gt;\n            &lt;AppenderRef ref=&quot;FatalFile&quot; /&gt;\n        &lt;/Root&gt;\n    &lt;/Loggers&gt;\n&lt;/Configuration&gt;\n</code></pre><p>测试代码：</p>\n<pre><code>public static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(Client.class);  \n    logger.trace(&quot;trace level&quot;);  \n    logger.debug(&quot;debug level&quot;);  \n    logger.info(&quot;info level&quot;);  \n    logger.warn(&quot;warn level&quot;);  \n    logger.error(&quot;error level&quot;);  \n    logger.fatal(&quot;fatal level&quot;);  \n}\n</code></pre><h3 id=\"h3-2-\"><a name=\"2 异步写日志\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2 异步写日志</h3><p>配置文件：</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;properties&gt;  \n        &lt;property name=&quot;LOG_HOME&quot;&gt;D:/logs&lt;/property&gt;  \n        &lt;property name=&quot;FILE_NAME&quot;&gt;mylog&lt;/property&gt;  \n    &lt;/properties&gt;  \n\n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n        &lt;RollingRandomAccessFile name=&quot;MyFile&quot;  \n            fileName=&quot;${LOG_HOME}/${FILE_NAME}.log&quot;  \n            filePattern=&quot;${LOG_HOME}/$${date:yyyy-MM}/${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i.log&quot;&gt;  \n            &lt;PatternLayout  \n                pattern=&quot;%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n&quot; /&gt;  \n            &lt;Policies&gt;  \n                &lt;TimeBasedTriggeringPolicy interval=&quot;1&quot; /&gt;  \n                &lt;SizeBasedTriggeringPolicy size=&quot;10 MB&quot; /&gt;  \n            &lt;/Policies&gt;  \n            &lt;DefaultRolloverStrategy max=&quot;20&quot; /&gt;  \n        &lt;/RollingRandomAccessFile&gt;  \n        &lt;Async name=&quot;Async&quot;&gt;  \n            &lt;AppenderRef ref=&quot;MyFile&quot; /&gt;  \n        &lt;/Async&gt;  \n    &lt;/Appenders&gt;  \n\n    &lt;Loggers&gt;  \n        &lt;Logger name=&quot;asynclog&quot; level=&quot;trace&quot; additivity=&quot;false&quot; &gt;  \n            &lt;AppenderRef ref=&quot;Async&quot; /&gt;  \n        &lt;/Logger&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p>测试代码：</p>\n<pre><code>public static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(&quot;asynclog&quot;);  \n    logger.trace(&quot;trace level&quot;);  \n    logger.debug(&quot;debug level&quot;);  \n    logger.info(&quot;info level&quot;);  \n    logger.warn(&quot;warn level&quot;);  \n    logger.error(&quot;error level&quot;);  \n    logger.fatal(&quot;fatal level&quot;);  \n}\n</code></pre><h3 id=\"h3-3-mongodb\"><a name=\"3 输出到MongoDB\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3 输出到MongoDB</h3><p>添加依赖：</p>\n<pre><code>&lt;dependency&gt;  \n    &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;  \n    &lt;artifactId&gt;log4j-nosql&lt;/artifactId&gt;  \n    &lt;version&gt;2.5&lt;/version&gt;  \n&lt;/dependency&gt;  \n&lt;dependency&gt;  \n    &lt;groupId&gt;org.mongodb&lt;/groupId&gt;  \n    &lt;artifactId&gt;mongo-java-driver&lt;/artifactId&gt;  \n    &lt;version&gt;3.2.2&lt;/version&gt;  \n&lt;/dependency&gt;\n</code></pre><p>配置文件：</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;Appenders&gt;  \n        &lt;Console name=&quot;Console&quot; target=&quot;SYSTEM_OUT&quot;&gt;  \n            &lt;PatternLayout pattern=&quot;%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n&quot; /&gt;  \n        &lt;/Console&gt;  \n\n        &lt;NoSql name=&quot;databaseAppender&quot;&gt;  \n            &lt;MongoDb databaseName=&quot;test&quot; collectionName=&quot;errorlog&quot;  \n                server=&quot;localhost&quot; port=&quot;27017&quot; /&gt;  \n        &lt;/NoSql&gt;  \n    &lt;/Appenders&gt;  \n\n    &lt;Loggers&gt;  \n        &lt;Logger name=&quot;mongolog&quot; level=&quot;trace&quot; additivity=&quot;false&quot;&gt;  \n            &lt;AppenderRef ref=&quot;databaseAppender&quot; /&gt;  \n        &lt;/Logger&gt;  \n        &lt;Root level=&quot;error&quot;&gt;  \n            &lt;AppenderRef ref=&quot;Console&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><h3 id=\"h3-4-flume\"><a name=\"4 输出到Flume\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4 输出到Flume</h3><p>Flume配置(flume-conf.properties)</p>\n<pre><code>agent1.sources=source1   \nagent1.sinks=sink1   \nagent1.channels=channel1   \n\nagent1.sources.source1.type=avro  \nagent1.sources.source1.channels=channel1  \nagent1.sources.source1.bind=0.0.0.0  \nagent1.sources.source1.port=41414  \n\nagent1.sinks.sink1.type=file_roll   \nagent1.sinks.sink1.sink.directory=D:/log  \nagent1.sinks.sink1.channel=channel1  \nagent1.sinks.sink1.sink.rollInterval=86400  \nagent1.sinks.sink1.sink.batchSize=100  \nagent1.sinks.sink1.sink.serializer=text  \nagent1.sinks.sink1.sink.serializer.appendNewline = false  \n\nagent1.channels.channel1.type=file   \nagent1.channels.channel1.checkpointDir=D:/log/checkpoint   \nagent1.channels.channel1.dataDirs=D:/log/data\n</code></pre><p>启动Flume（注：测试环境为windows）</p>\n<pre><code>flume-ng.cmd agent --conf ../conf/ --conf-file ../conf/flume-conf.properties -name agent1\n</code></pre><p>添加依赖：</p>\n<pre><code>&lt;dependency&gt;  \n    &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;  \n    &lt;artifactId&gt;log4j-flume-ng&lt;/artifactId&gt;  \n    &lt;version&gt;2.5&lt;/version&gt;  \n&lt;/dependency&gt;\n</code></pre><p>配置文件：</p>\n<pre><code>&lt;Configuration status=&quot;WARN&quot; monitorInterval=&quot;300&quot;&gt;  \n    &lt;Appenders&gt;  \n        &lt;Flume name=&quot;eventLogger&quot; compress=&quot;false&quot;&gt;  \n            &lt;Agent host=&quot;127.0.0.1&quot; port=&quot;41414&quot; /&gt;  \n            &lt;RFC5424Layout enterpriseNumber=&quot;18060&quot; includeMDC=&quot;true&quot; appName=&quot;MyApp&quot; /&gt;  \n        &lt;/Flume&gt;  \n    &lt;/Appenders&gt;  \n    &lt;Loggers&gt;  \n        &lt;Root level=&quot;trace&quot;&gt;  \n            &lt;AppenderRef ref=&quot;eventLogger&quot; /&gt;  \n        &lt;/Root&gt;  \n    &lt;/Loggers&gt;  \n&lt;/Configuration&gt;\n</code></pre><p><em>转自:</em><a href=\"http://blog.csdn.net/autfish/article/details/51244787\">http://blog.csdn.net/autfish/article/details/51244787</a></p>\n', ' ### 1. 按日志级别区分文件输出\n\n有些人习惯按日志信息级别输出到不同名称的文件中，如info.log，error.log，warn.log等，在log4j2中可通过配置Filters来实现。\n\n假定需求是把INFO及以下级别的信息输出到info.log，WARN和ERROR级别的信息输出到error.log，FATAL级别输出到fatal.log，配置文件如下：\n\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">\n	<properties>\n        <property name=\"LOG_HOME\">D:/logs</property>\n    </properties>\n	<Appenders>\n		<Console name=\"Console\" target=\"SYSTEM_OUT\">\n			<PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />\n		</Console>\n\n		<RollingRandomAccessFile name=\"InfoFile\"\n			fileName=\"${LOG_HOME}/info.log\"\n			filePattern=\"${LOG_HOME}/$${date:yyyy-MM}/info-%d{yyyy-MM-dd}-%i.log\">\n			<Filters>\n				<ThresholdFilter level=\"warn\" onMatch=\"DENY\" onMismatch=\"NEUTRAL\" />\n				<ThresholdFilter level=\"trace\" onMatch=\"ACCEPT\" onMismatch=\"DENY\" />\n			</Filters>\n			<PatternLayout pattern=\"%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n\" />\n			<Policies>\n				<TimeBasedTriggeringPolicy />\n				<SizeBasedTriggeringPolicy size=\"10 MB\" />\n			</Policies>\n			<DefaultRolloverStrategy max=\"20\" />\n		</RollingRandomAccessFile>\n		\n		<RollingRandomAccessFile name=\"ErrorFile\"\n			fileName=\"${LOG_HOME}/error.log\"\n			filePattern=\"${LOG_HOME}/$${date:yyyy-MM}/error-%d{yyyy-MM-dd}-%i.log\">\n			<Filters>\n				<ThresholdFilter level=\"fatal\" onMatch=\"DENY\" onMismatch=\"NEUTRAL\" />\n				<ThresholdFilter level=\"warn\" onMatch=\"ACCEPT\" onMismatch=\"DENY\" />\n			</Filters>\n			<PatternLayout pattern=\"%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n\" />\n			<Policies>\n				<TimeBasedTriggeringPolicy />\n				<SizeBasedTriggeringPolicy size=\"10 MB\" />\n			</Policies>\n			<DefaultRolloverStrategy max=\"20\" />\n		</RollingRandomAccessFile>\n		\n		<RollingRandomAccessFile name=\"FatalFile\"\n			fileName=\"${LOG_HOME}/fatal.log\"\n			filePattern=\"${LOG_HOME}/$${date:yyyy-MM}/fatal-%d{yyyy-MM-dd}-%i.log\">\n			<Filters>\n				<ThresholdFilter level=\"fatal\" onMatch=\"ACCEPT\" onMismatch=\"DENY\" />\n			</Filters>\n			<PatternLayout pattern=\"%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n\" />\n			<Policies>\n				<TimeBasedTriggeringPolicy />\n				<SizeBasedTriggeringPolicy size=\"10 MB\" />\n			</Policies>\n			<DefaultRolloverStrategy max=\"20\" />\n		</RollingRandomAccessFile>\n	</Appenders>\n\n	<Loggers>\n		<Root level=\"trace\">\n			<AppenderRef ref=\"Console\" />\n			<AppenderRef ref=\"InfoFile\" />\n			<AppenderRef ref=\"ErrorFile\" />\n			<AppenderRef ref=\"FatalFile\" />\n		</Root>\n	</Loggers>\n</Configuration>\n```\n\n测试代码：\n\n```\npublic static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(Client.class);  \n    logger.trace(\"trace level\");  \n    logger.debug(\"debug level\");  \n    logger.info(\"info level\");  \n    logger.warn(\"warn level\");  \n    logger.error(\"error level\");  \n    logger.fatal(\"fatal level\");  \n} \n```\n### 2 异步写日志\n\n配置文件：\n\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <properties>  \n        <property name=\"LOG_HOME\">D:/logs</property>  \n        <property name=\"FILE_NAME\">mylog</property>  \n    </properties>  \n  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n        <RollingRandomAccessFile name=\"MyFile\"  \n            fileName=\"${LOG_HOME}/${FILE_NAME}.log\"  \n            filePattern=\"${LOG_HOME}/$${date:yyyy-MM}/${FILE_NAME}-%d{yyyy-MM-dd HH-mm}-%i.log\">  \n            <PatternLayout  \n                pattern=\"%date{yyyy-MM-dd HH:mm:ss.SSS} %level [%thread][%file:%line] - %msg%n\" />  \n            <Policies>  \n                <TimeBasedTriggeringPolicy interval=\"1\" />  \n                <SizeBasedTriggeringPolicy size=\"10 MB\" />  \n            </Policies>  \n            <DefaultRolloverStrategy max=\"20\" />  \n        </RollingRandomAccessFile>  \n        <Async name=\"Async\">  \n            <AppenderRef ref=\"MyFile\" />  \n        </Async>  \n    </Appenders>  \n  \n    <Loggers>  \n        <Logger name=\"asynclog\" level=\"trace\" additivity=\"false\" >  \n            <AppenderRef ref=\"Async\" />  \n        </Logger>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n测试代码：\n\n```\npublic static void main(String[] args) {  \n    Logger logger = LogManager.getLogger(\"asynclog\");  \n    logger.trace(\"trace level\");  \n    logger.debug(\"debug level\");  \n    logger.info(\"info level\");  \n    logger.warn(\"warn level\");  \n    logger.error(\"error level\");  \n    logger.fatal(\"fatal level\");  \n}  \n```\n\n\n### 3 输出到MongoDB\n\n添加依赖：\n\n```\n<dependency>  \n    <groupId>org.apache.logging.log4j</groupId>  \n    <artifactId>log4j-nosql</artifactId>  \n    <version>2.5</version>  \n</dependency>  \n<dependency>  \n    <groupId>org.mongodb</groupId>  \n    <artifactId>mongo-java-driver</artifactId>  \n    <version>3.2.2</version>  \n</dependency>  \n```\n\n\n配置文件：\n\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <Appenders>  \n        <Console name=\"Console\" target=\"SYSTEM_OUT\">  \n            <PatternLayout pattern=\"%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n\" />  \n        </Console>  \n  \n        <NoSql name=\"databaseAppender\">  \n            <MongoDb databaseName=\"test\" collectionName=\"errorlog\"  \n                server=\"localhost\" port=\"27017\" />  \n        </NoSql>  \n    </Appenders>  \n  \n    <Loggers>  \n        <Logger name=\"mongolog\" level=\"trace\" additivity=\"false\">  \n            <AppenderRef ref=\"databaseAppender\" />  \n        </Logger>  \n        <Root level=\"error\">  \n            <AppenderRef ref=\"Console\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n\n\n### 4 输出到Flume\n\nFlume配置(flume-conf.properties)\n\n```\nagent1.sources=source1   \nagent1.sinks=sink1   \nagent1.channels=channel1   \n  \nagent1.sources.source1.type=avro  \nagent1.sources.source1.channels=channel1  \nagent1.sources.source1.bind=0.0.0.0  \nagent1.sources.source1.port=41414  \n  \nagent1.sinks.sink1.type=file_roll   \nagent1.sinks.sink1.sink.directory=D:/log  \nagent1.sinks.sink1.channel=channel1  \nagent1.sinks.sink1.sink.rollInterval=86400  \nagent1.sinks.sink1.sink.batchSize=100  \nagent1.sinks.sink1.sink.serializer=text  \nagent1.sinks.sink1.sink.serializer.appendNewline = false  \n  \nagent1.channels.channel1.type=file   \nagent1.channels.channel1.checkpointDir=D:/log/checkpoint   \nagent1.channels.channel1.dataDirs=D:/log/data  \n```\n\n启动Flume（注：测试环境为windows）\n\n```\nflume-ng.cmd agent --conf ../conf/ --conf-file ../conf/flume-conf.properties -name agent1  \n```\n\n添加依赖：\n\n```\n<dependency>  \n    <groupId>org.apache.logging.log4j</groupId>  \n    <artifactId>log4j-flume-ng</artifactId>  \n    <version>2.5</version>  \n</dependency> \n```\n\n配置文件：\n\n```\n<Configuration status=\"WARN\" monitorInterval=\"300\">  \n    <Appenders>  \n        <Flume name=\"eventLogger\" compress=\"false\">  \n            <Agent host=\"127.0.0.1\" port=\"41414\" />  \n            <RFC5424Layout enterpriseNumber=\"18060\" includeMDC=\"true\" appName=\"MyApp\" />  \n        </Flume>  \n    </Appenders>  \n    <Loggers>  \n        <Root level=\"trace\">  \n            <AppenderRef ref=\"eventLogger\" />  \n        </Root>  \n    </Loggers>  \n</Configuration>  \n```\n*转自:*[http://blog.csdn.net/autfish/article/details/51244787](http://blog.csdn.net/autfish/article/details/51244787)\n ', '2018-06-14 18:18:34', '2018-06-14 17:17:25', 137, 0, 0, 'favorite', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (30, 1, '解决mysql数据库tinyInt(1) 转换为java的Boolean解决方案', '<p> JAVA数据类型 和 MYSQL的数据类型转换，要注意tinyInt 类型，且存储长度为1的情况。</p>\n<h3 id=\"h3-mysql-\"><a name=\"mysql文档给出的解释\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>mysql文档给出的解释</h3><p><code>java.lang.Boolean if the configuration property tinyInt1isBit is set to true (the default) and the storage size is 1, or java.lang.Integer if not.</code></p>\n<h3 id=\"h3-u8981u6CE8u610Fu4E0Bu9762u8FD9u4E2Au63D0u793A\"><a name=\"要注意下面这个提示\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>要注意下面这个提示</h3><p>The <code>ResultSet.getObject()</code> method uses the type conversions between MySQL and Java types, following the JDBC specification where appropriate. The values returned by <code>ResultSetMetaData.GetColumnTypeName()</code>and <code>ResultSetMetaData.GetColumnClassName()</code> are shown in the table below. For more information on the JDBC types, see the reference on the <a href=\"http://docs.oracle.com/javase/8/docs/api/java/sql/Types.html\">java.sql.Types</a> class.</p>\n<hr>\n<p>文档地址：<a href=\"https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-reference-type-conversions.html\">https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-reference-type-conversions.html</a><br><img src=\"/upload/img/article/0/1_20181223000445.jpeg\" alt=\"1545494685501.jpeg\"></p>\n<h3 id=\"h3-u89E3u51B3u65B9u6848\"><a name=\"解决方案\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>解决方案</h3><p>1、<code>tinyInt(1)</code> 只用来代表Boolean含义的字段，且0代表False，1代表True。如果要存储多个数值，则定义为<code>tinyInt(N), N&gt;1</code>。例如 <code>tinyInt(2)</code><br>2、JDBC的URL增加 tinyInt1isBit=false参数，注意参数名区分大小写，否则不生效</p>\n<pre><code>jdbc:mysql://${ucmha.proxy1_2.host}/${db.mysql.db}?tinyInt1isBit=false\n</code></pre>', ' JAVA数据类型 和 MYSQL的数据类型转换，要注意tinyInt 类型，且存储长度为1的情况。\n\n### mysql文档给出的解释\n`\njava.lang.Boolean if the configuration property tinyInt1isBit is set to true (the default) and the storage size is 1, or java.lang.Integer if not.\n`\n### 要注意下面这个提示\n\nThe `ResultSet.getObject()` method uses the type conversions between MySQL and Java types, following the JDBC specification where appropriate. The values returned by `ResultSetMetaData.GetColumnTypeName()`and `ResultSetMetaData.GetColumnClassName()` are shown in the table below. For more information on the JDBC types, see the reference on the [java.sql.Types](http://docs.oracle.com/javase/8/docs/api/java/sql/Types.html) class.\n\n------\n\n文档地址：https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-reference-type-conversions.html\n![1545494685501.jpeg](/upload/img/article/0/1_20181223000445.jpeg)\n\n### 解决方案\n1、`tinyInt(1)` 只用来代表Boolean含义的字段，且0代表False，1代表True。如果要存储多个数值，则定义为`tinyInt(N), N>1`。例如 `tinyInt(2)`\n2、JDBC的URL增加 tinyInt1isBit=false参数，注意参数名区分大小写，否则不生效\n```\njdbc:mysql://${ucmha.proxy1_2.host}/${db.mysql.db}?tinyInt1isBit=false\n```\n\n', '2018-06-14 17:17:51', '2018-12-23 00:05:04', 71, 0, 0, 'blog', 0, 8, NULL, 1);
INSERT INTO `blog` VALUES (31, 1, 'Guava教程之EventBus', '<p> <strong>EventBus</strong>允许在组件之间进行发布-订阅式的通信，而不需要组件之间显式地进行注册(从而相互了解)。它的设计完全是为了用显式注册代替传统的Java进程内事件分布。它不是通用的发布-订阅系统，也不是用于进程间通信的。</p>\n<h3 id=\"h3-eventbus-\"><a name=\"EventBus对象的创建\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>EventBus对象的创建</h3><p>通过EventBus.register(Object object)方法来注册订阅者（subscriber ），使用EventBus.post(Object event)方法来发布事件。 </p>\n<pre><code>    @Test\n    public void test1() {\n        //创建EventBus对象，并给予identifier\n        //identifier：此总线的简短名称，用于日志记录。应该是一个有效的java标识符。\n        EventBus eventBus = new EventBus(&quot;choxsu&quot;);\n\n        //注册所有的订阅\n        eventBus.register(new HelloEventListener());\n        //eventBus.register(new Hello2EventListener());\n\n        //发布事件\n        eventBus.post(new OrderEvent(&quot;hello&quot;));\n        eventBus.post(new OrderEvent(&quot;world&quot;));\n\n        eventBus.post(&quot;hello world&quot;);\n        eventBus.post(&quot;hello world2&quot;);\n\n        eventBus.post(1);\n        eventBus.post(12);\n    }\n</code></pre><h3 id=\"h3--listener-\"><a name=\"(订阅)Listener类的定义，具体实现见代码\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>(订阅)Listener类的定义，具体实现见代码</h3><p>使用Guava之后发布-订阅模式就变得很简单了，如果你需要订阅某种类型的消息，只需要在指定的方法上加上<a href=\"https://github.com/Subscribe\" title=\"&#64;Subscribe\" class=\"at-link\">@Subscribe</a>注解即可。</p>\n<h6 id=\"h6-1-subscriber-guava-subscriber-\"><a name=\"1.一个subscriber也可以同时订阅多个事件，Guava会通过事件类型来和订阅方法的形参来决定到底调用subscriber的哪个订阅方法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.一个subscriber也可以同时订阅多个事件，Guava会通过事件类型来和订阅方法的形参来决定到底调用subscriber的哪个订阅方法</h6><p>EventBus post OrderEvent类型事件时，Hello2EventListener 的listen(OrderEvent event)方法会被调用，当post String类型事件时，Hello2EventListener 的listen(String event) 会被调用。</p>\n<pre><code>    class HelloEventListener {\n\n        @Subscribe\n        public void listen(OrderEvent event) {\n            System.out.println(&quot;receive1 msg:&quot; + event.getMessage());\n        }\n\n\n        @Subscribe\n        public void listen(String event) {\n            System.out.println(&quot;receive2 msg:&quot; + event);\n        }\n\n\n        @Subscribe\n        public void listen(Integer event) {\n            System.out.println(&quot;receive3 msg:&quot; + event);\n        }\n\n    }\n</code></pre><h6 id=\"h6-2-subscriber-subscriber-\"><a name=\"2.如果多个subscriber订阅了同一个事件，那么每个subscriber都将收到事件通知，并且收到事件通知的顺序跟注册的顺序保持一致\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.如果多个subscriber订阅了同一个事件，那么每个subscriber都将收到事件通知，并且收到事件通知的顺序跟注册的顺序保持一致</h6><pre><code>    class Hello2EventListener {\n        @Subscribe\n        public void listen(OrderEvent event) {\n            System.out.println(&quot;hello2 receive2 msg:&quot; + event.getMessage());\n        }\n        @Subscribe\n        public void listen(String event) {\n            System.out.println(&quot;hello2 receive2 msg:&quot; + event);\n        }\n    }\n</code></pre><pre><code>//注册所有的订阅\neventBus.register(new HelloEventListener());\neventBus.register(new Hello2EventListener());\n</code></pre><p>HelloEventListener和MultiEventListener都订阅了OrderEvent 事件，所以他们都会收到OrderEvent 事件通知。但是HelloEventListener会第一个收到OrderEvent 事件通知，其次是Hello2EventListener。</p>\n<h3 id=\"h3--event-pojo-\"><a name=\"自定义Event对象（一个简单POJO）\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>自定义Event对象（一个简单POJO）</h3><p>Guava 发布-订阅模式 中传递的事件，是一个普通的POJO类。</p>\n<pre><code>    class OrderEvent {\n        private String message;\n\n        public OrderEvent(String message) {\n            this.message = message;\n        }\n\n        public String getMessage() {\n            return message;\n        }\n    }\n</code></pre><h3 id=\"h3-u8F93u51FAu7ED3u679C\"><a name=\"输出结果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>输出结果</h3><pre><code>receive1 msg:hello\nhello2 receive2 msg:hello\nreceive1 msg:world\nhello2 receive2 msg:world\nreceive2 msg:hello world\nhello2 receive2 msg:hello world\nreceive2 msg:hello world2\nhello2 receive2 msg:hello world2\nreceive3 msg:1\nreceive3 msg:12\n</code></pre>', ' **EventBus**允许在组件之间进行发布-订阅式的通信，而不需要组件之间显式地进行注册(从而相互了解)。它的设计完全是为了用显式注册代替传统的Java进程内事件分布。它不是通用的发布-订阅系统，也不是用于进程间通信的。\n###EventBus对象的创建\n通过EventBus.register(Object object)方法来注册订阅者（subscriber ），使用EventBus.post(Object event)方法来发布事件。 \n```\n    @Test\n    public void test1() {\n        //创建EventBus对象，并给予identifier\n        //identifier：此总线的简短名称，用于日志记录。应该是一个有效的java标识符。\n        EventBus eventBus = new EventBus(\"choxsu\");\n\n        //注册所有的订阅\n        eventBus.register(new HelloEventListener());\n        //eventBus.register(new Hello2EventListener());\n\n        //发布事件\n        eventBus.post(new OrderEvent(\"hello\"));\n        eventBus.post(new OrderEvent(\"world\"));\n\n        eventBus.post(\"hello world\");\n        eventBus.post(\"hello world2\");\n\n        eventBus.post(1);\n        eventBus.post(12);\n    }\n```\n###(订阅)Listener类的定义，具体实现见代码\n使用Guava之后发布-订阅模式就变得很简单了，如果你需要订阅某种类型的消息，只需要在指定的方法上加上@Subscribe注解即可。\n######1.一个subscriber也可以同时订阅多个事件，Guava会通过事件类型来和订阅方法的形参来决定到底调用subscriber的哪个订阅方法\nEventBus post OrderEvent类型事件时，Hello2EventListener 的listen(OrderEvent event)方法会被调用，当post String类型事件时，Hello2EventListener 的listen(String event) 会被调用。\n```\n    class HelloEventListener {\n\n        @Subscribe\n        public void listen(OrderEvent event) {\n            System.out.println(\"receive1 msg:\" + event.getMessage());\n        }\n\n\n        @Subscribe\n        public void listen(String event) {\n            System.out.println(\"receive2 msg:\" + event);\n        }\n\n\n        @Subscribe\n        public void listen(Integer event) {\n            System.out.println(\"receive3 msg:\" + event);\n        }\n\n    }\n```\n######2.如果多个subscriber订阅了同一个事件，那么每个subscriber都将收到事件通知，并且收到事件通知的顺序跟注册的顺序保持一致\n```\n    class Hello2EventListener {\n        @Subscribe\n        public void listen(OrderEvent event) {\n            System.out.println(\"hello2 receive2 msg:\" + event.getMessage());\n        }\n        @Subscribe\n        public void listen(String event) {\n            System.out.println(\"hello2 receive2 msg:\" + event);\n        }\n    }\n```\n\n```\n//注册所有的订阅\neventBus.register(new HelloEventListener());\neventBus.register(new Hello2EventListener());\n```\nHelloEventListener和MultiEventListener都订阅了OrderEvent 事件，所以他们都会收到OrderEvent 事件通知。但是HelloEventListener会第一个收到OrderEvent 事件通知，其次是Hello2EventListener。\n\n###自定义Event对象（一个简单POJO）\nGuava 发布-订阅模式 中传递的事件，是一个普通的POJO类。\n```\n    class OrderEvent {\n        private String message;\n\n        public OrderEvent(String message) {\n            this.message = message;\n        }\n\n        public String getMessage() {\n            return message;\n        }\n    }\n```\n\n###输出结果\n```\nreceive1 msg:hello\nhello2 receive2 msg:hello\nreceive1 msg:world\nhello2 receive2 msg:world\nreceive2 msg:hello world\nhello2 receive2 msg:hello world\nreceive2 msg:hello world2\nhello2 receive2 msg:hello world2\nreceive3 msg:1\nreceive3 msg:12\n```\n\n\n\n', '2018-06-14 17:18:09', '2018-06-14 17:18:09', 123, 0, 0, 'code', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (32, 1, 'Linux下使用ps命令查看某个进程文件的启动位置', '<p> 使用ps命令，使用方法如下：</p>\n<p><code>ps -ef|grep shutdown</code></p>\n<p>其中shutdown为关机命令，但是此时查看到的只是相对路径，没有绝对路径，如：</p>\n<p><img src=\"http://upload-images.jianshu.io/upload_images/7463793-eab04570c3675dd4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240\" alt=\"image\"></p>\n<p>其中4170就是进程ID，此时进入【/proc/4170】，并通过 ls -al查看如下：</p>\n<p><code>ls -al /proc/4170</code></p>\n<p><img src=\"http://upload-images.jianshu.io/upload_images/7463793-c0abcd2f4ba45f6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240\" alt=\"image\"></p>\n<p>注意：</p>\n<ul>\n<li>cwd符号链接的是进程运行目录；</li><li>exe符号连接就是执行程序的绝对路径；</li><li>cmdline就是程序运行时输入的命令行命令；</li><li>environ记录了进程运行时的环境变量；</li><li>fd目录下是进程打开或使用的文件的符号连接。</li></ul>\n', ' 使用ps命令，使用方法如下：\n\n`ps -ef|grep shutdown`\n\n其中shutdown为关机命令，但是此时查看到的只是相对路径，没有绝对路径，如：\n\n![image](http://upload-images.jianshu.io/upload_images/7463793-eab04570c3675dd4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n其中4170就是进程ID，此时进入【/proc/4170】，并通过 ls -al查看如下：\n\n`ls -al /proc/4170`\n\n![image](http://upload-images.jianshu.io/upload_images/7463793-c0abcd2f4ba45f6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n注意：\n\n*   cwd符号链接的是进程运行目录；\n*   exe符号连接就是执行程序的绝对路径；\n*   cmdline就是程序运行时输入的命令行命令；\n*   environ记录了进程运行时的环境变量；\n*   fd目录下是进程打开或使用的文件的符号连接。\n', '2018-06-14 17:18:43', '2018-06-14 17:18:43', 73, 0, 0, 'blog', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (33, 1, 'Linux系统下的find文件查找', '<h3 id=\"h3-u76F4u63A5u8FDBu5165u6B63u9898\"><a name=\"直接进入正题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>直接进入正题</h3><p>查找命令: <code>find</code></p>\n<h4 id=\"h4-u8BEDu6CD5\"><a name=\"语法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>语法</h4><p><code>find(选项)(参数)</code></p>\n<h4 id=\"h4-u9009u9879\"><a name=\"选项\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>选项</h4><pre><code>-amin&lt;分钟&gt;：查找在指定时间曾被存取过的文件或目录，单位以分钟计算；\n\n-anewer&lt;参考文件或目录&gt;：查找其存取时间较指定文件或目录的存取时间更接近现在的文件或目录；\n\n-atime&lt;24小时数&gt;：查找在指定时间曾被存取过的文件或目录，单位以24小时计算；\n\n-cmin&lt;分钟&gt;：查找在指定时间之时被更改过的文件或目录；\n\n-cnewer&lt;参考文件或目录&gt;查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；\n\n-ctime&lt;24小时数&gt;：查找在指定时间之时被更改的文件或目录，单位以24小时计算；\n\n-daystart：从本日开始计算时间；\n\n-depth：从指定目录下最深层的子目录开始查找；\n\n-expty：寻找文件大小为0 Byte的文件，或目录下没有任何子目录或文件的空目录；\n\n-[exec](http://man.linuxde.net/exec &quot;exec命令&quot;)&lt;执行指令&gt;：假设find指令的回传值为True，就执行该指令；\n\n-false：将find指令的回传值皆设为False；\n\n-fls&lt;列表文件&gt;：此参数的效果和指定“-[ls](http://man.linuxde.net/ls &quot;ls命令&quot;)”参数类似，但会把结果保存为指定的列表文件；\n\n-follow：排除符号连接；\n\n-fprint&lt;列表文件&gt;：此参数的效果和指定“-print”参数类似，但会把结果保存成指定的列表文件；\n\n-fprint0&lt;列表文件&gt;：此参数的效果和指定“-print0”参数类似，但会把结果保存成指定的列表文件；\n\n-fprintf&lt;列表文件&gt;&lt;输出格式&gt;：此参数的效果和指定“-[printf](http://man.linuxde.net/printf &quot;printf命令&quot;)”参数类似，但会把结果保存成指定的列表文件；\n\n-fstype&lt;文件系统类型&gt;：只寻找该文件系统类型下的文件或目录；\n\n-gid&lt;群组识别码&gt;：查找符合指定之群组识别码的文件或目录；\n\n-group&lt;群组名称&gt;：查找符合指定之群组名称的文件或目录；\n\n-[help](http://man.linuxde.net/help &quot;help命令&quot;)或——help：在线帮助；\n\n-ilname&lt;范本样式&gt;：此参数的效果和指定“-lname”参数类似，但忽略字符大小写的差别；\n\n-iname&lt;范本样式&gt;：此参数的效果和指定“-name”参数类似，但忽略字符大小写的差别；\n\n-inum&lt;inode编号&gt;：查找符合指定的inode编号的文件或目录；\n\n-ipath&lt;范本样式&gt;：此参数的效果和指定“-path”参数类似，但忽略字符大小写的差别；\n\n-iregex&lt;范本样式&gt;：此参数的效果和指定“-regexe”参数类似，但忽略字符大小写的差别；\n\n-links&lt;连接数目&gt;：查找符合指定的硬连接数目的文件或目录；\n\n-iname&lt;范本样式&gt;：指定字符串作为寻找符号连接的范本样式；\n\n-ls：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出；\n\n-maxdepth&lt;目录层级&gt;：设置最大目录层级；\n\n-mindepth&lt;目录层级&gt;：设置最小目录层级；\n\n-mmin&lt;分钟&gt;：查找在指定时间曾被更改过的文件或目录，单位以分钟计算；\n\n-[mount](http://man.linuxde.net/mount &quot;mount命令&quot;)：此参数的效果和指定“-xdev”相同；\n\n-mtime&lt;24小时数&gt;：查找在指定时间曾被更改过的文件或目录，单位以24小时计算；\n\n-name&lt;范本样式&gt;：指定字符串作为寻找文件或目录的范本样式；\n\n-newer&lt;参考文件或目录&gt;：查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；\n\n-nogroup：找出不属于本地主机群组识别码的文件或目录；\n\n-noleaf：不去考虑目录至少需拥有两个硬连接存在；\n\n-nouser：找出不属于本地主机用户识别码的文件或目录；\n\n-ok&lt;执行指令&gt;：此参数的效果和指定“-exec”类似，但在执行指令之前会先询问用户，若回答“y”或“Y”，则放\n弃执行命令；\n\n-path&lt;范本样式&gt;：指定字符串作为寻找目录的范本样式；\n\n-perm&lt;权限数值&gt;：查找符合指定的权限数值的文件或目录；\n\n-print：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为每列一个名称，每个名称前皆有“./”字符串；\n\n-print0：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为全部的名称皆在同一行；\n\n-printf&lt;输出格式&gt;：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式可以自行指定；\n\n-prune：不寻找字符串作为寻找文件或目录的范本样式;\n\n-regex&lt;范本样式&gt;：指定字符串作为寻找文件或目录的范本样式；\n\n-size&lt;文件大小&gt;：查找符合指定的文件大小的文件；\n\n-true：将find指令的回传值皆设为True；\n\n-typ&lt;文件类型&gt;：只寻找符合指定的文件类型的文件；\n\n-uid&lt;用户识别码&gt;：查找符合指定的用户识别码的文件或目录；\n\n-used&lt;日数&gt;：查找文件或目录被更改之后在指定时间曾被存取过的文件或目录，单位以日计算；\n\n-user&lt;拥有者名称&gt;：查找符和指定的拥有者名称的文件或目录；\n\n-version或——version：显示版本信息；\n\n-xdev：将范围局限在先行的文件系统中；\n\n-xtype&lt;文件类型&gt;：此参数的效果和指定“-[type](http://man.linuxde.net/type &quot;type命令&quot;)”参数类似，差别在于它针对符号连接检查。&lt;/pre&gt;\n</code></pre><h4 id=\"h4-u53C2u6570\"><a name=\"参数\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>参数</h4><p>起始目录：查找文件的起始目录。</p>\n<h4 id=\"h4-u5B9Eu4F8B\"><a name=\"实例\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>实例</h4><p><code>根据文件或者正则表达式进行匹配</code></p>\n<p>列出当前目录及子目录下所有文件和文件夹<br><code>find .</code></p>\n<p>在<code>/home</code>目录下查找以.txt结尾的文件名</p>\n<p><code>find /home -name &quot;*.txt&quot;</code></p>\n<p>同上，但忽略大小写</p>\n<p><code>find /home -iname &quot;*.txt&quot;</code></p>\n<p>当前目录及子目录下查找所有以.txt和.pdf结尾的文件</p>\n<p><code>find . \\( -name &quot;*.txt&quot; -o -name &quot;*.pdf&quot; \\)</code>或<code>find . -name &quot;*.txt&quot; -o -name &quot;*.pdf&quot;</code></p>\n<p>匹配文件路径或者文件</p>\n<p><code>find /usr/ -path &quot;*local*&quot;</code></p>\n<p>基于正则表达式匹配文件路径</p>\n<p><code>find . -regex &quot;.*\\(\\.txt\\|\\.pdf\\)$&quot;</code></p>\n<p>同上，但忽略大小写</p>\n<p><code>find . -iregex &quot;.*\\(\\.txt\\|\\.pdf\\)$&quot;</code></p>\n<h4 id=\"h4-u5426u5B9Au53C2u6570\"><a name=\"否定参数\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>否定参数</h4><p>找出/home下不是以.txt结尾的文件</p>\n<p><code>find /home ! -name &quot;*.txt&quot;</code></p>\n<h4 id=\"h4-u6839u636Eu6587u4EF6u7C7Bu578Bu8FDBu884Cu641Cu7D22\"><a name=\"根据文件类型进行搜索\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>根据文件类型进行搜索</h4><p><code>find . -type 类型参数</code></p>\n<p>类型参数列表：</p>\n<ul>\n<li><strong>f </strong>普通文件</li><li><strong>l </strong>符号连接</li><li><strong>d</strong> 目录</li><li><strong>c </strong>字符设备</li><li><strong>b </strong>块设备</li><li><strong>s </strong>套接字</li><li><strong>p </strong>Fifo</li></ul>\n<h4 id=\"h4-u57FAu4E8Eu76EEu5F55u6DF1u5EA6u641Cu7D22\"><a name=\"基于目录深度搜索\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>基于目录深度搜索</h4><p>向下最大深度限制为3</p>\n<p><code>find . -maxdepth 3 -type f</code></p>\n<p>搜索出深度距离当前目录至少2个子目录的所有文件</p>\n<p><code>find . -mindepth 2 -type f</code></p>\n<h4 id=\"h4-u6839u636Eu6587u4EF6u65F6u95F4u6233u8FDBu884Cu641Cu7D22\"><a name=\"根据文件时间戳进行搜索\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>根据文件时间戳进行搜索</h4><p><code>find . -type f 时间戳</code></p>\n<p>UNIX/Linux文件系统每个文件都有三种时间戳：</p>\n<ul>\n<li><strong>访问时间</strong>（-atime/天，-amin/分钟）：用户最近一次访问时间。</li><li><strong>修改时间</strong>（-mtime/天，-mmin/分钟）：文件最后一次修改时间。</li><li><strong>变化时间</strong>（-ctime/天，-cmin/分钟）：文件数据元（例如权限等）最后一次修改时间。</li></ul>\n<p>搜索最近七天内被访问过的所有文件<br><code>find . -type f -atime -7</code></p>\n<p>搜索恰好在七天前被访问过的所有文件</p>\n<p><code>find . -type f -atime 7</code></p>\n<p>搜索超过七天内被访问过的所有文件</p>\n<p><code>find . -type f -atime +7</code></p>\n<p>搜索访问时间超过10分钟的所有文件</p>\n<p><code>find . -type f -amin +10</code></p>\n<p>找出比<a href=\"http://man.linuxde.net/file\" title=\"file命令\">file</a>.log修改时间更长的所有文件<br><code>find . -type f -newer file.log</code></p>\n<h4 id=\"h4-u6839u636Eu6587u4EF6u5927u5C0Fu8FDBu884Cu5339u914D\"><a name=\"根据文件大小进行匹配\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>根据文件大小进行匹配</h4><p><code>find . -type f -size 文件大小单元</code></p>\n<p>文件大小单元：</p>\n<ul>\n<li><strong>b</strong> —— 块（512字节）</li><li><strong>c</strong> —— 字节</li><li><strong><a href=\"http://man.linuxde.net/w\" title=\"w命令\">w</a></strong> —— 字（2字节）</li><li><strong>k</strong> —— 千字节</li><li><strong>M</strong> —— 兆字节</li><li><strong>G</strong> —— 吉字节</li></ul>\n<p>搜索大于10KB的文件</p>\n<p><code>find . -type f -size +10k</code></p>\n<p>搜索小于10KB的文件</p>\n<p><code>find . -type f -size -10k</code></p>\n<p>搜索等于10KB的文件</p>\n<p><code>find . -type f -size 10k</code></p>\n<h4 id=\"h4-u5220u9664u5339u914Du6587u4EF6\"><a name=\"删除匹配文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>删除匹配文件</h4><p>删除当前目录下所有.txt文件</p>\n<p><code>find . -type f -name &quot;*.txt&quot; -delete</code></p>\n<h4 id=\"h4--\"><a name=\"根据文件权限/所有权进行匹配\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>根据文件权限/所有权进行匹配</h4><p>当前目录下搜索出权限为777的文件<br><code>find . -type f -perm 777</code></p>\n<p>找出当前目录下权限不是644的<a href=\"http://man.linuxde.net/php\" title=\"php命令\">php</a>文件</p>\n<p><code>find . -type f -name &quot;*.php&quot; ! -perm 644</code></p>\n<p>找出当前目录用户tom拥有的所有文件</p>\n<p><code>find . -type f -user tom</code></p>\n<p>找出当前目录用户组sunk拥有的所有文件</p>\n<p><code>find . -type f -group sunk</code></p>\n<h4 id=\"h4--code-exec-code-\"><a name=\"借助<code>-exec</code>选项与其他命令结合使用\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>借助<code>-exec</code>选项与其他命令结合使用</h4><p>找出当前目录下所有root的文件，并把所有权更改为用户tom</p>\n<p><code>find .-type f -user root -exec [chown](http://man.linuxde.net/chown &quot;chown命令&quot;) tom {} \\;</code></p>\n<p>上例中，<strong>{}</strong> 用于与<strong>-exec</strong>选项结合使用来匹配所有文件，然后会被替换为相应的文件名。</p>\n<p>找出自己家目录下所有的.txt文件并删除</p>\n<p><code>find $HOME/. -name &quot;*.txt&quot; -ok [rm](http://man.linuxde.net/rm &quot;rm命令&quot;) {} \\;</code></p>\n<p>上例中，<strong>-ok</strong>和<strong>-exec</strong>行为一样，不过它会给出提示，是否执行相应的操作。</p>\n<p>查找当前目录下所有.txt文件并把他们拼接起来写入到all.txt文件中</p>\n<p><code>find . -type f -name &quot;*.txt&quot; -exec [cat](http://man.linuxde.net/cat &quot;cat命令&quot;) {} \\;&gt; all.txt</code></p>\n<p>将30天前的.log文件移动到old目录中</p>\n<p><code>find . -type f -mtime +30 -name &quot;*.log&quot; -exec [cp](http://man.linuxde.net/cp &quot;cp命令&quot;) {} old \\;</code></p>\n<p>找出当前目录下所有.txt文件并以“File:文件名”的形式打印出来</p>\n<p><code>find . -type f -name &quot;*.txt&quot; -exec printf &quot;File: %s\\n&quot; {} \\;</code></p>\n<p>因为单行命令中-exec参数中无法使用多个命令，以下方法可以实现在-exec之后接受多条命令</p>\n<p><code>-exec ./text.sh {} \\;</code></p>\n<h4 id=\"h4-u641Cu7D22u4F46u8DF3u51FAu6307u5B9Au7684u76EEu5F55\"><a name=\"搜索但跳出指定的目录\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>搜索但跳出指定的目录</h4><p>查找当前目录或者子目录下所有.txt文件，但是跳过子目录sk</p>\n<p><code>find . -path &quot;./sk&quot; -prune -o -name &quot;*.txt&quot; -print</code></p>\n<h4 id=\"h4-find-\"><a name=\"find其他技巧收集\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>find其他技巧收集</h4><p>要列出所有长度为零的文件</p>\n<p><code>find . -empty</code></p>\n', ' ### 直接进入正题\n查找命令: `find`\n#### 语法\n`\nfind(选项)(参数)\n`\n\n#### 选项\n```\n-amin<分钟>：查找在指定时间曾被存取过的文件或目录，单位以分钟计算；\n\n-anewer<参考文件或目录>：查找其存取时间较指定文件或目录的存取时间更接近现在的文件或目录；\n\n-atime<24小时数>：查找在指定时间曾被存取过的文件或目录，单位以24小时计算；\n\n-cmin<分钟>：查找在指定时间之时被更改过的文件或目录；\n\n-cnewer<参考文件或目录>查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；\n\n-ctime<24小时数>：查找在指定时间之时被更改的文件或目录，单位以24小时计算；\n\n-daystart：从本日开始计算时间；\n\n-depth：从指定目录下最深层的子目录开始查找；\n\n-expty：寻找文件大小为0 Byte的文件，或目录下没有任何子目录或文件的空目录；\n\n-[exec](http://man.linuxde.net/exec \"exec命令\")<执行指令>：假设find指令的回传值为True，就执行该指令；\n\n-false：将find指令的回传值皆设为False；\n\n-fls<列表文件>：此参数的效果和指定“-[ls](http://man.linuxde.net/ls \"ls命令\")”参数类似，但会把结果保存为指定的列表文件；\n\n-follow：排除符号连接；\n\n-fprint<列表文件>：此参数的效果和指定“-print”参数类似，但会把结果保存成指定的列表文件；\n\n-fprint0<列表文件>：此参数的效果和指定“-print0”参数类似，但会把结果保存成指定的列表文件；\n\n-fprintf<列表文件><输出格式>：此参数的效果和指定“-[printf](http://man.linuxde.net/printf \"printf命令\")”参数类似，但会把结果保存成指定的列表文件；\n\n-fstype<文件系统类型>：只寻找该文件系统类型下的文件或目录；\n\n-gid<群组识别码>：查找符合指定之群组识别码的文件或目录；\n\n-group<群组名称>：查找符合指定之群组名称的文件或目录；\n\n-[help](http://man.linuxde.net/help \"help命令\")或——help：在线帮助；\n\n-ilname<范本样式>：此参数的效果和指定“-lname”参数类似，但忽略字符大小写的差别；\n\n-iname<范本样式>：此参数的效果和指定“-name”参数类似，但忽略字符大小写的差别；\n\n-inum<inode编号>：查找符合指定的inode编号的文件或目录；\n\n-ipath<范本样式>：此参数的效果和指定“-path”参数类似，但忽略字符大小写的差别；\n\n-iregex<范本样式>：此参数的效果和指定“-regexe”参数类似，但忽略字符大小写的差别；\n\n-links<连接数目>：查找符合指定的硬连接数目的文件或目录；\n\n-iname<范本样式>：指定字符串作为寻找符号连接的范本样式；\n\n-ls：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出；\n\n-maxdepth<目录层级>：设置最大目录层级；\n\n-mindepth<目录层级>：设置最小目录层级；\n\n-mmin<分钟>：查找在指定时间曾被更改过的文件或目录，单位以分钟计算；\n\n-[mount](http://man.linuxde.net/mount \"mount命令\")：此参数的效果和指定“-xdev”相同；\n\n-mtime<24小时数>：查找在指定时间曾被更改过的文件或目录，单位以24小时计算；\n\n-name<范本样式>：指定字符串作为寻找文件或目录的范本样式；\n\n-newer<参考文件或目录>：查找其更改时间较指定文件或目录的更改时间更接近现在的文件或目录；\n\n-nogroup：找出不属于本地主机群组识别码的文件或目录；\n\n-noleaf：不去考虑目录至少需拥有两个硬连接存在；\n\n-nouser：找出不属于本地主机用户识别码的文件或目录；\n\n-ok<执行指令>：此参数的效果和指定“-exec”类似，但在执行指令之前会先询问用户，若回答“y”或“Y”，则放\n弃执行命令；\n\n-path<范本样式>：指定字符串作为寻找目录的范本样式；\n\n-perm<权限数值>：查找符合指定的权限数值的文件或目录；\n\n-print：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为每列一个名称，每个名称前皆有“./”字符串；\n\n-print0：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式为全部的名称皆在同一行；\n\n-printf<输出格式>：假设find指令的回传值为Ture，就将文件或目录名称列出到标准输出。格式可以自行指定；\n\n-prune：不寻找字符串作为寻找文件或目录的范本样式;\n\n-regex<范本样式>：指定字符串作为寻找文件或目录的范本样式；\n\n-size<文件大小>：查找符合指定的文件大小的文件；\n\n-true：将find指令的回传值皆设为True；\n\n-typ<文件类型>：只寻找符合指定的文件类型的文件；\n\n-uid<用户识别码>：查找符合指定的用户识别码的文件或目录；\n\n-used<日数>：查找文件或目录被更改之后在指定时间曾被存取过的文件或目录，单位以日计算；\n\n-user<拥有者名称>：查找符和指定的拥有者名称的文件或目录；\n\n-version或——version：显示版本信息；\n\n-xdev：将范围局限在先行的文件系统中；\n\n-xtype<文件类型>：此参数的效果和指定“-[type](http://man.linuxde.net/type \"type命令\")”参数类似，差别在于它针对符号连接检查。</pre>\n```\n#### 参数\n\n起始目录：查找文件的起始目录。\n\n#### 实例\n``根据文件或者正则表达式进行匹配``\n\n列出当前目录及子目录下所有文件和文件夹\n`find .`\n\n在`/home`目录下查找以.txt结尾的文件名\n\n`find /home -name \"*.txt\"`\n\n同上，但忽略大小写\n\n`find /home -iname \"*.txt\"`\n\n当前目录及子目录下查找所有以.txt和.pdf结尾的文件\n\n`find . \\( -name \"*.txt\" -o -name \"*.pdf\" \\)`或`find . -name \"*.txt\" -o -name \"*.pdf\" `\n\n匹配文件路径或者文件\n\n`find /usr/ -path \"*local*\"`\n\n基于正则表达式匹配文件路径\n\n`find . -regex \".*\\(\\.txt\\|\\.pdf\\)$\"`\n\n同上，但忽略大小写\n\n`find . -iregex \".*\\(\\.txt\\|\\.pdf\\)$\"`\n\n#### 否定参数\n\n找出/home下不是以.txt结尾的文件\n\n`find /home ! -name \"*.txt\"`\n\n#### 根据文件类型进行搜索\n\n`find . -type 类型参数`\n\n类型参数列表：\n\n*   **f **普通文件\n*   **l **符号连接\n*   **d** 目录\n*   **c **字符设备\n*   **b **块设备\n*   **s **套接字\n*   **p **Fifo\n\n#### 基于目录深度搜索\n\n向下最大深度限制为3\n\n`find . -maxdepth 3 -type f`\n\n搜索出深度距离当前目录至少2个子目录的所有文件\n\n`find . -mindepth 2 -type f`\n\n#### 根据文件时间戳进行搜索\n`find . -type f 时间戳`\n\nUNIX/Linux文件系统每个文件都有三种时间戳：\n\n*   **访问时间**（-atime/天，-amin/分钟）：用户最近一次访问时间。\n*   **修改时间**（-mtime/天，-mmin/分钟）：文件最后一次修改时间。\n*   **变化时间**（-ctime/天，-cmin/分钟）：文件数据元（例如权限等）最后一次修改时间。\n\n搜索最近七天内被访问过的所有文件\n`find . -type f -atime -7`\n\n搜索恰好在七天前被访问过的所有文件\n\n`find . -type f -atime 7`\n\n搜索超过七天内被访问过的所有文件\n\n`find . -type f -atime +7`\n\n搜索访问时间超过10分钟的所有文件\n\n`find . -type f -amin +10`\n\n找出比[file](http://man.linuxde.net/file \"file命令\").log修改时间更长的所有文件\n`find . -type f -newer file.log`\n\n#### 根据文件大小进行匹配\n`find . -type f -size 文件大小单元`\n\n文件大小单元：\n\n*   **b** —— 块（512字节）\n*   **c** —— 字节\n*   **[w](http://man.linuxde.net/w \"w命令\")** —— 字（2字节）\n*   **k** —— 千字节\n*   **M** —— 兆字节\n*   **G** —— 吉字节\n\n搜索大于10KB的文件\n\n`find . -type f -size +10k`\n\n搜索小于10KB的文件\n\n`find . -type f -size -10k`\n\n搜索等于10KB的文件\n\n`find . -type f -size 10k`\n\n#### 删除匹配文件\n\n删除当前目录下所有.txt文件\n\n`find . -type f -name \"*.txt\" -delete`\n\n#### 根据文件权限/所有权进行匹配\n\n当前目录下搜索出权限为777的文件\n`find . -type f -perm 777`\n\n找出当前目录下权限不是644的[php](http://man.linuxde.net/php \"php命令\")文件\n\n`find . -type f -name \"*.php\" ! -perm 644`\n\n找出当前目录用户tom拥有的所有文件\n\n`find . -type f -user tom`\n\n找出当前目录用户组sunk拥有的所有文件\n\n`find . -type f -group sunk`\n\n#### 借助`-exec`选项与其他命令结合使用\n\n找出当前目录下所有root的文件，并把所有权更改为用户tom\n\n`find .-type f -user root -exec [chown](http://man.linuxde.net/chown \"chown命令\") tom {} \\;`\n\n上例中，**{}** 用于与**-exec**选项结合使用来匹配所有文件，然后会被替换为相应的文件名。\n\n找出自己家目录下所有的.txt文件并删除\n\n`find $HOME/. -name \"*.txt\" -ok [rm](http://man.linuxde.net/rm \"rm命令\") {} \\;`\n\n上例中，**-ok**和**-exec**行为一样，不过它会给出提示，是否执行相应的操作。\n\n查找当前目录下所有.txt文件并把他们拼接起来写入到all.txt文件中\n\n`find . -type f -name \"*.txt\" -exec [cat](http://man.linuxde.net/cat \"cat命令\") {} \\;> all.txt`\n\n将30天前的.log文件移动到old目录中\n\n`find . -type f -mtime +30 -name \"*.log\" -exec [cp](http://man.linuxde.net/cp \"cp命令\") {} old \\;`\n\n找出当前目录下所有.txt文件并以“File:文件名”的形式打印出来\n\n`find . -type f -name \"*.txt\" -exec printf \"File: %s\\n\" {} \\;`\n\n因为单行命令中-exec参数中无法使用多个命令，以下方法可以实现在-exec之后接受多条命令\n\n`-exec ./text.sh {} \\;`\n\n#### 搜索但跳出指定的目录\n\n查找当前目录或者子目录下所有.txt文件，但是跳过子目录sk\n\n`find . -path \"./sk\" -prune -o -name \"*.txt\" -print`\n\n#### find其他技巧收集\n\n要列出所有长度为零的文件\n\n`find . -empty`\n\n', '2018-06-14 17:19:03', '2018-06-14 17:19:03', 108, 0, 0, 'blog', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (34, 1, 'Nginx、Tomcat 开启Gzip，提升网站静态资源打开速度', '<h3 id=\"h3-nginx-\"><a name=\"Nginx配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Nginx配置</h3><p>进入正题：环境。阿里云服务器 centos7<br><code>vim  /etc/nginx/nginx.conf</code><br>增加配置</p>\n<pre><code>gzip on;\ngzip_min_length  1k;\ngzip_buffers 4 16k;\n#gzip_http_version 1.0;\ngzip_comp_level 2;\ngzip_types text/plain application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;\ngzip_vary off;\ngzip_disable &quot;MSIE [1-6]\\.&quot;;\n</code></pre><h3 id=\"h3-u914Du7F6Eu89E3u91CA\"><a name=\"配置解释\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置解释</h3><pre><code>gzip on：开启Gzip\ngzip_min_length：不压缩临界值，大于1K的才压缩，一般不用改\ngzip_buffers：buffer，默认值: gzip_buffers 4 4k/8k\ngzip_http_version：用了反向代理的话，末端通信是HTTP/1.0，有需求的应该也不用看我这科普文了；有这句的话注释了就行了，默认是HTTP/1.1\ngzip_comp_level：压缩级别，1-10，数字越大压缩的越好，时间也越长，但是CPU压力越大，综合考虑吧\ngzip_types：压缩类型，匹配MIME类型进行压缩 # 不能用通配符 text/* # (无论是否指定)text/html默认已经压缩 # 设置哪压缩种文本文件可参考 conf/mime.types\ngzip_vary： 和http头有关系，加个vary头，给代理服务器用的，有的浏览器支持压缩，有的不支持，所以避免浪费不支持的也压缩，所以根据客户端的HTTP头来判断，是否需要压缩\ngzip_disable：IE6对Gzip不怎么友好，不给它Gzip；禁用IE6的gzip压缩，又是因为杯具的IE6。当然，IE6目前依然广泛的存在，所以这里你也可以设置为“MSIE [1-5].\n</code></pre><h3 id=\"h3--nginx-conf-\"><a name=\"检查nginx.conf文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>检查nginx.conf文件</h3><p><code>cd /sbin</code><br><code>./nginx -t</code><br>出现</p>\n<pre><code class=\"lang-`\">inx: the configuration file /etc/nginx/nginx.conf syntax is ok \nginx: configuration file /etc/nginx/nginx.conf test is successful\n</code></pre>\n<p>表示Nginx文件配置没有问题<br>然后就是重启Nginx了<br><code>/nginx -s reload</code></p>\n<h3 id=\"h3-tomcat-\"><a name=\"Tomcat配置\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Tomcat配置</h3><p>编辑tomcat配置文件<br><code>vim /data/java/apache-tomcat-1013/conf/server.xml</code></p>\n<pre><code>&lt;Connerctor port=&quot;80&quot; protocol=&quot;HTTP/1.1&quot;  connectionTimeout=&quot;20000&quot;\nredirectPort=&quot;8443&quot; executor=&quot;tomcatThreadPool&quot; URIEncoding=&quot;utf-8&quot;   \ncompression=&quot;on&quot;   \ncompressionMinSize=&quot;50&quot; noCompressionUserAgents=&quot;gozilla, traviata&quot;   \ncompressableMimeType=&quot;text/html,text/xml,text/javascript,text/css,text/plain&quot; /&gt;\n</code></pre><p>重启Tomcat</p>\n<h3 id=\"h3-u6D4Bu8BD5\"><a name=\"测试\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试</h3><p>使用curl进行测试<br><code>curl -I -H &quot;Accept-Encoding: gzip, deflate&quot; &quot;http://127.0.0.1:1013&quot;</code></p>\n<pre><code>HTTP/1.1 200 OK\nServer: Apache-Coyote/1.1\nContent-Type: text/html;charset=UTF-8\nTransfer-Encoding: chunked\nContent-Encoding: gzip\nVary: Accept-Encoding\nDate: Wed, 10 Jan 2018 08:25:55 GMT\n</code></pre><p>出现Content-Encoding: gzip这个就表示开启Gzip成功<br>使用浏览器测试</p>\n<p><img src=\"https://upload-images.jianshu.io/upload_images/7463793-5692cbd4f1b12209.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240\" alt=\"image\"></p>\n<p>红色框表示开启Gzip成功</p>\n', '###  Nginx配置\n进入正题：环境。阿里云服务器 centos7\n`vim  /etc/nginx/nginx.conf`\n增加配置\n```\ngzip on;\ngzip_min_length  1k;\ngzip_buffers 4 16k;\n#gzip_http_version 1.0;\ngzip_comp_level 2;\ngzip_types text/plain application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;\ngzip_vary off;\ngzip_disable \"MSIE [1-6]\\.\";\n```\n### 配置解释\n```\ngzip on：开启Gzip\ngzip_min_length：不压缩临界值，大于1K的才压缩，一般不用改\ngzip_buffers：buffer，默认值: gzip_buffers 4 4k/8k\ngzip_http_version：用了反向代理的话，末端通信是HTTP/1.0，有需求的应该也不用看我这科普文了；有这句的话注释了就行了，默认是HTTP/1.1\ngzip_comp_level：压缩级别，1-10，数字越大压缩的越好，时间也越长，但是CPU压力越大，综合考虑吧\ngzip_types：压缩类型，匹配MIME类型进行压缩 # 不能用通配符 text/* # (无论是否指定)text/html默认已经压缩 # 设置哪压缩种文本文件可参考 conf/mime.types\ngzip_vary： 和http头有关系，加个vary头，给代理服务器用的，有的浏览器支持压缩，有的不支持，所以避免浪费不支持的也压缩，所以根据客户端的HTTP头来判断，是否需要压缩\ngzip_disable：IE6对Gzip不怎么友好，不给它Gzip；禁用IE6的gzip压缩，又是因为杯具的IE6。当然，IE6目前依然广泛的存在，所以这里你也可以设置为“MSIE [1-5].\n```\n\n### 检查nginx.conf文件\n`cd /sbin`\n`./nginx -t     `\n出现\n````\ninx: the configuration file /etc/nginx/nginx.conf syntax is ok \nginx: configuration file /etc/nginx/nginx.conf test is successful\n```\n表示Nginx文件配置没有问题\n然后就是重启Nginx了\n`/nginx -s reload`\n\n\n### Tomcat配置\n编辑tomcat配置文件\n`vim /data/java/apache-tomcat-1013/conf/server.xml`\n```\n<Connerctor port=\"80\" protocol=\"HTTP/1.1\"  connectionTimeout=\"20000\"\nredirectPort=\"8443\" executor=\"tomcatThreadPool\" URIEncoding=\"utf-8\"   \ncompression=\"on\"   \ncompressionMinSize=\"50\" noCompressionUserAgents=\"gozilla, traviata\"   \ncompressableMimeType=\"text/html,text/xml,text/javascript,text/css,text/plain\" />\n```\n重启Tomcat\n\n\n### 测试\n使用curl进行测试\n`curl -I -H \"Accept-Encoding: gzip, deflate\" \"http://127.0.0.1:1013\"`\n\n```\nHTTP/1.1 200 OK\nServer: Apache-Coyote/1.1\nContent-Type: text/html;charset=UTF-8\nTransfer-Encoding: chunked\nContent-Encoding: gzip\nVary: Accept-Encoding\nDate: Wed, 10 Jan 2018 08:25:55 GMT\n```\n出现Content-Encoding: gzip这个就表示开启Gzip成功\n使用浏览器测试\n\n![image](https://upload-images.jianshu.io/upload_images/7463793-5692cbd4f1b12209.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n红色框表示开启Gzip成功\n ', '2018-06-26 09:19:51', '2018-06-14 17:23:46', 65, 0, 0, 'blog', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (35, 1, 'linux下mysql数据的导出和导入', '<h4 id=\"h4-u5BFCu51FAu6574u4E2Au6570u636Eu5E93u4E2Du7684u6240u6709u6570u636E\"><a name=\"导出整个数据库中的所有数据\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导出整个数据库中的所有数据</h4><p>1、在linux命令行下输入：</p>\n<pre><code>mysqldump -u userName -p  dabaseName  &gt; fileName.sql\n</code></pre><p><code>fileName.sql最好加上路径名</code></p>\n<h4 id=\"h4-u5BFCu51FAu6570u636Eu5E93u4E2Du7684u67D0u4E2Au8868u7684u6570u636E\"><a name=\"导出数据库中的某个表的数据\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导出数据库中的某个表的数据</h4><pre><code>mysqldump -u userName -p  dabaseName tableName &gt; fileName.sql\n</code></pre><h4 id=\"h4-u5BFCu51FAu6574u4E2Au6570u636Eu5E93u4E2Du7684u6240u6709u7684u8868u7ED3u6784\"><a name=\"导出整个数据库中的所有的表结构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导出整个数据库中的所有的表结构</h4><p>在linux命令行下输入：</p>\n<pre><code>mysqldump -u userName -p -d dabaseName  &gt; fileName.sql\n</code></pre><p><code>注意：是加了-d</code></p>\n<h4 id=\"h4-u5BFCu51FAu6574u4E2Au6570u636Eu5E93u4E2Du67D0u4E2Au8868u7684u8868u7ED3u6784\"><a name=\"导出整个数据库中某个表的表结构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导出整个数据库中某个表的表结构</h4><p>在linux命令行下输入：</p>\n<pre><code>mysqldump -u userName -p -d dabaseName tableName &gt; fileName.sql\n</code></pre><p><code>注意：是加了-d</code></p>\n<h4 id=\"h4--mysql-1\"><a name=\"导入mysql方法1\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导入mysql方法1</h4><p>进入linux命令命令行下：</p>\n<pre><code>mysql -uroot -p 回车  输入密码\nsource fileName.sql\n注意fileName.sql要有路径名，例如：source /home/user/data/fileName.sql\n</code></pre><h4 id=\"h4--mysql-2\"><a name=\"导入mysql方法2\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导入mysql方法2</h4><p>进入linux命令命令行下：</p>\n<pre><code>mysql -uroot -p database &lt; fileName.sql\n</code></pre><p><code>注意fileName.sql要有路径名</code></p>\n', ' #### 导出整个数据库中的所有数据\n\n1、在linux命令行下输入：\n\n```\nmysqldump -u userName -p  dabaseName  > fileName.sql \n```\n`fileName.sql最好加上路径名`\n\n #### 导出数据库中的某个表的数据\n```\nmysqldump -u userName -p  dabaseName tableName > fileName.sql \n```\n #### 导出整个数据库中的所有的表结构\n\n在linux命令行下输入：\n\n```\nmysqldump -u userName -p -d dabaseName  > fileName.sql\n```\n`注意：是加了-d `\n\n#### 导出整个数据库中某个表的表结构\n\n在linux命令行下输入：\n```\nmysqldump -u userName -p -d dabaseName tableName > fileName.sql\n```\n`注意：是加了-d`\n\n#### 导入mysql方法1\n\n进入linux命令命令行下：\n```\nmysql -uroot -p 回车  输入密码\nsource fileName.sql\n注意fileName.sql要有路径名，例如：source /home/user/data/fileName.sql\n```\n#### 导入mysql方法2\n\n进入linux命令命令行下：\n```\nmysql -uroot -p database < fileName.sql\n```\n`注意fileName.sql要有路径名`', '2018-07-05 22:10:51', '2018-07-05 22:10:51', 116, 0, 0, 'favorite', 0, 8, NULL, 1);
INSERT INTO `blog` VALUES (36, 1, 'ssh远程登录命令简单实例', '<h4 id=\"h4-ssh-\"><a name=\"ssh远程登录命令简单实例\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>ssh远程登录命令简单实例</h4><p>ssh命令用于远程登录上Linux主机。</p>\n<p>常用格式：ssh [-l login_name] [-p port] [user@]hostname<br>更详细的可以用ssh -h查看。</p>\n<h4 id=\"h4-u4E3Eu4F8B\"><a name=\"举例\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>举例</h4><h6 id=\"h6--\"><a name=\"不指定用户：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>不指定用户：</h6><p><code>ssh 192.168.0.11</code></p>\n<h6 id=\"h6--\"><a name=\"指定用户：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>指定用户：</h6><p><code>ssh -l root 192.168.0.11</code></p>\n<p><code>ssh <a href=\"mailto:root@192.168.0\">root@192.168.0</a>.11</code></p>\n<h6 id=\"h6--ssh-\"><a name=\"如果修改过ssh登录端口的可以：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>如果修改过ssh登录端口的可以：</h6><p><code>ssh -p 12333 192.168.0.11</code></p>\n<p><code>ssh -l root -p 12333 216.230.230.114</code></p>\n<p><code>ssh -p 12333 <a href=\"mailto:root@216.230.230\">root@216.230.230</a>.114</code></p>\n<h6 id=\"h6--etc-ssh-sshd_config-ssh-root-\"><a name=\"另外修改配置文件/etc/ssh/sshd_config，可以改ssh登录端口和禁止root登录。改端口可以防止被端口扫描。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>另外修改配置文件/etc/ssh/sshd_config，可以改ssh登录端口和禁止root登录。改端口可以防止被端口扫描。</h6><p>编辑配置文件：</p>\n<p><code>vim /etc/ssh/sshd_config</code></p>\n<p>找到#Port 22，去掉注释，修改成一个五位的端口：</p>\n<p><code>Port 12333</code></p>\n<p>找到#PermitRootLogin yes，去掉注释，修改为：</p>\n<p><code>PermitRootLogin no</code></p>\n<h6 id=\"h6--sshd-\"><a name=\"重启sshd服务：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>重启sshd服务：</h6><p><code>service sshd restart</code></p>\n', '####ssh远程登录命令简单实例\n \nssh命令用于远程登录上Linux主机。\n \n常用格式：ssh [-l login_name] [-p port] [user@]hostname\n更详细的可以用ssh -h查看。\n \n####举例\n \n######不指定用户：\n \n`ssh 192.168.0.11`\n \n######指定用户：\n \n`ssh -l root 192.168.0.11`\n \n`ssh root@192.168.0.11`\n \n######如果修改过ssh登录端口的可以：\n \n`ssh -p 12333 192.168.0.11`\n \n`ssh -l root -p 12333 216.230.230.114`\n \n`ssh -p 12333 root@216.230.230.114`\n \n######另外修改配置文件/etc/ssh/sshd_config，可以改ssh登录端口和禁止root登录。改端口可以防止被端口扫描。\n \n编辑配置文件：\n \n`vim /etc/ssh/sshd_config`\n \n找到#Port 22，去掉注释，修改成一个五位的端口：\n \n`Port 12333`\n \n找到#PermitRootLogin yes，去掉注释，修改为：\n \n`PermitRootLogin no`\n \n######重启sshd服务：\n \n`service sshd restart`', '2018-07-05 22:24:37', '2018-07-05 22:24:37', 64, 0, 0, 'favorite', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (37, 1, 'JRbel激活服务', '<h2 id=\"h2-jrebel-idea-\"><a name=\"jrebel idea插件激活，亲测可用：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>jrebel idea插件激活，亲测可用：</h2><h4 id=\"h4--jrebel-server-\"><a name=\"在jrebel server处，写上：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>在jrebel server处，写上：</h4><p><a href=\"http://139.199.89.239:1008/88414687-3b91-4286-89ba-2dc813b107ce\">http://139.199.89.239:1008/88414687-3b91-4286-89ba-2dc813b107ce</a></p>\n<p>如果出现激活过期的情况，请重新生成guid，替换原来的guid即可</p>\n<p>邮箱随便写，即可激活。</p>\n', 'jrebel idea插件激活，亲测可用：\n-------\n#### 在jrebel server处，写上：\n\nhttp://139.199.89.239:1008/88414687-3b91-4286-89ba-2dc813b107ce\n\n如果出现激活过期的情况，请重新生成guid，替换原来的guid即可\n\n邮箱随便写，即可激活。', '2018-07-23 11:02:39', '2018-07-23 11:02:39', 203, 0, 0, 'blog', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (38, 1, 'vim中 E212：无法打开并写入文件 的解决办法', '<p> 在编写配置文件时，常常忘记切换到root用户，导致文件编辑完毕，敲入:wq 退出保存时，出现 E212：无法打开并写入文件 的错误提示。这是由于在该目录下当前用户没有写权限导致。</p>\n<p>解决办法如下：</p>\n<h5 id=\"h5--1-\"><a name=\"【1】 将文件保存到用户目录下，再改变所有者，然后移动到配置目录下，步骤如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>【1】 将文件保存到用户目录下，再改变所有者，然后移动到配置目录下，步骤如下：</h5><p>1） 保存退出时用 <code>:wq ! ~/tmp/file.conf</code></p>\n<p>2）su切换到root用户，将file.conf改变属主， <code>chown root file.conf</code></p>\n<p>3）移动配置文件到目标目录，<code>mv file.conf  [pathname]</code></p>\n<h5 id=\"h5--2-\"><a name=\"【2】 第二种解决办法相对比较简便\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>【2】 第二种解决办法相对比较简便</h5><p><code>保存文件时用  : w ! sudo tee %</code></p>\n<p><code>tee</code> 用于读取输入文件，同时保存</p>\n<p> %表示当前编辑文件 </p>\n<p>（不过这种方法有个要求就是当前编辑用户必须在 sudoers这个文件中，这也是执行sudo命令的要求</p>\n', ' 在编写配置文件时，常常忘记切换到root用户，导致文件编辑完毕，敲入:wq 退出保存时，出现 E212：无法打开并写入文件 的错误提示。这是由于在该目录下当前用户没有写权限导致。\n\n解决办法如下：\n\n#####【1】 将文件保存到用户目录下，再改变所有者，然后移动到配置目录下，步骤如下：\n\n1） 保存退出时用 `:wq ! ~/tmp/file.conf`\n\n2）su切换到root用户，将file.conf改变属主， `chown root file.conf`\n\n3）移动配置文件到目标目录，`mv file.conf  [pathname]`\n\n#####【2】 第二种解决办法相对比较简便\n`保存文件时用  : w ! sudo tee %`\n\n`tee` 用于读取输入文件，同时保存\n\n %表示当前编辑文件 \n\n（不过这种方法有个要求就是当前编辑用户必须在 sudoers这个文件中，这也是执行sudo命令的要求', '2018-07-25 10:48:58', '2018-07-25 10:48:58', 87, 0, 0, 'blog', 0, 18, NULL, 1);
INSERT INTO `blog` VALUES (39, 1, 'linux 查询启动路径', '<h3 id=\"h3--linux-pid-pid-\"><a name=\"在linux实际操作命令中，查看pid的方式有很多种，通过pid找程序路径的方式也有好几个\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>在linux实际操作命令中，查看pid的方式有很多种，通过pid找程序路径的方式也有好几个</h3><p>但是可能大家都忽略的一个很简单也是很实用的命令：<code>pwdx.</code></p>\n<h5 id=\"h5--java-ps-pid-\"><a name=\"比如要查找某个java编写的程序运行情况可通过ps命令查看，然后可以通过显示的pid进行程序定位\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>比如要查找某个java编写的程序运行情况可通过ps命令查看，然后可以通过显示的pid进行程序定位</h5><p><code>ps -ef|grep java</code><br>就可查询到相应的PID</p>\n<pre><code>root     31920 31918  0 Aug02 ?        01:52:47 java -XX:MaxPermSize=192m -Djava.io.tmpdir=./tmp...\n</code></pre><p><code>31920</code> 就是此运行程序的pid</p>\n<h4 id=\"h4-u76F4u63A5u5C31u53EFu4EE5u67E5u8BE2u5230\"><a name=\"直接就可以查询到\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>直接就可以查询到</h4><pre><code>[root@localhost ~]# pwdx 31920\n31920: /data/www/maven_repo/maven2.1/nexus-2.14.5-02\n</code></pre><h4 id=\"h4-u9700u8981u67E5u770Bu66F4u8BE6u7EC6u7684u4FE1u606F\"><a name=\"需要查看更详细的信息\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>需要查看更详细的信息</h4><p>可以使用 <code>ll /prod/{PID}</code> 查看更详细的进程信息<br>解释下<code>l /prod/pid</code></p>\n<blockquote>\n<p>符号链接的是进程运行目录；</p>\n<p>exe符号连接就是执行程序的绝对路径；</p>\n<p>cmdline就是程序运行时输入的命令行命令；</p>\n<p>environ记录了进程运行时的环境变量；</p>\n<p>fd目录下是进程打开或使用的文件的符号连接。</p>\n</blockquote>\n<h4 id=\"h4--\"><a name=\"只知道端口的情况下，可以使用下列方法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>只知道端口的情况下，可以使用下列方法</h4><p>根据 port 找到 PID<br><code>lsof -i:&lt;port&gt;</code></p>\n<p>然后使用上面的方式查看进程所在的位置</p>\n', '###在linux实际操作命令中，查看pid的方式有很多种，通过pid找程序路径的方式也有好几个\n\n但是可能大家都忽略的一个很简单也是很实用的命令：`pwdx.`\n\n#####比如要查找某个java编写的程序运行情况可通过ps命令查看，然后可以通过显示的pid进行程序定位\n`` ps -ef|grep java ``\n就可查询到相应的PID\n```\nroot     31920 31918  0 Aug02 ?        01:52:47 java -XX:MaxPermSize=192m -Djava.io.tmpdir=./tmp...\n```\n`31920` 就是此运行程序的pid\n\n#### 直接就可以查询到\n```\n[root@localhost ~]# pwdx 31920\n31920: /data/www/maven_repo/maven2.1/nexus-2.14.5-02\n```\n####  需要查看更详细的信息\n可以使用 `ll /prod/{PID}` 查看更详细的进程信息\n解释下`l /prod/pid `\n> 符号链接的是进程运行目录；\n\n>exe符号连接就是执行程序的绝对路径；\n\n>cmdline就是程序运行时输入的命令行命令；\n\n>environ记录了进程运行时的环境变量；\n\n>fd目录下是进程打开或使用的文件的符号连接。\n\n#### 只知道端口的情况下，可以使用下列方法\n根据 port 找到 PID\n`lsof -i:<port>`\n\n然后使用上面的方式查看进程所在的位置\n\n\n', '2018-08-28 09:10:46', '2018-08-28 09:10:46', 33, 0, 0, 'favorite', 0, 18, NULL, 1);
INSERT INTO `blog` VALUES (40, 1, ' linux下DNS配置及域名解析服务', '<p> 转自： <a href=\"https://blog.csdn.net/chao199512/article/details/80436722\">https://blog.csdn.net/chao199512/article/details/80436722</a><br> 觉得这篇文章讲的很详细，所以在此分享出来，感谢作者的贡献</p>\n', ' 转自： https://blog.csdn.net/chao199512/article/details/80436722\n 觉得这篇文章讲的很详细，所以在此分享出来，感谢作者的贡献', '2018-08-28 09:13:52', '2018-08-28 09:13:52', 31, 0, 0, 'favorite', 0, 18, NULL, 1);
INSERT INTO `blog` VALUES (41, 1, 'vue this.$router.push()传参', '<h3 id=\"h3-1-params-\"><a name=\"1  params 传参\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1  params 传参</h3><blockquote>\n<p>注意⚠️：patams传参 ，路径不能使用path 只能使用name,不然获取不到传的数据</p>\n</blockquote>\n<p><code>this.$router.push({name: \'dispatch\', params: {paicheNo: obj.paicheNo}})</code></p>\n<p>取数据：<code>this.$route.params.paicheNo</code></p>\n<p><code>this.$route.params.paicheNo</code></p>\n<h3 id=\"h3-2-query-\"><a name=\"2 query传参\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2 query传参</h3><p><code>this.$router.push({path: \'/transport/dispatch\', query: {paicheNo: obj.paicheNo}})</code></p>\n<p>取数据：<code>this.$route.query.paicheNo</code></p>\n<p><code>this.$route.query.paicheNo</code></p>\n', '### 1  params 传参\n\n>注意⚠️：patams传参 ，路径不能使用path 只能使用name,不然获取不到传的数据\n\n`this.$router.push({name: \'dispatch\', params: {paicheNo: obj.paicheNo}})`\n\n取数据：`this.$route.params.paicheNo`\n\n`this.$route.params.paicheNo`\n\n\n### 2 query传参\n\n`this.$router.push({path: \'/transport/dispatch\', query: {paicheNo: obj.paicheNo}})`\n\n取数据：`this.$route.query.paicheNo`\n\n`this.$route.query.paicheNo`', '2018-09-04 12:10:15', '2018-09-04 12:10:15', 52, 0, 0, 'favorite', 0, 25, NULL, 1);
INSERT INTO `blog` VALUES (42, 1, 'Vue中axios踩坑之路-POST传参', '<p> 刚开始使用Vue，里面的坑是一个接一个，今天就遇到一个axios POST传参的问题，我需要在请求中传递参数，然后按官方文档的格式开始操作，代码如下：</p>\n<pre><code> axios.post(&#39;/user&#39;, {\n    firstName: &#39;Fred&#39;,\n    lastName: &#39;Flintstone&#39;\n  })\n  .then(function (response) {\n    console.log(response);\n  })\n  .catch(function (error) {\n    console.log(error);\n  });\n</code></pre><p> 打开控制台，报400，报错信息是：传递的参数不存在，但在请求中看的到参数，只是参数的格式是Request Payload，具体也没看懂是什么，总之知道就是参数格式不对，查阅资料找到两种解决办法，代码如下：</p>\n<pre><code>1.\nvar qs = require(&#39;qs&#39;);\naxios.post(&#39;/foo&#39;, qs.stringify({ &#39;bar&#39;: 123 }));\n\n2.\nvar params = new URLSearchParams();\nparams.append(&#39;param1&#39;, &#39;value1&#39;);\nparams.append(&#39;param2&#39;, &#39;value2&#39;);\naxios.post(&#39;/foo&#39;, params);\n</code></pre><blockquote>\n<p>测试，这两种办法都可以</p>\n</blockquote>\n<p> 这个问题刚解决，后台就抛给我一个问题，我的参数里面要传数组呢，我以为直接按上面的做法就能一马平川了，然而现实是残酷的，崩盘！查看官方文档发现，其实这个的解决也是非常的简单，只需要在qs的方法中设置它的indices为false即可，如：</p>\n<p><code>s.stringify({ a: [&#39;b&#39;, &#39;c&#39;, &#39;d&#39;] }, { indices: false });</code></p>\n<p>更多qs功能参考：<a href=\"https://www.npmjs.com/package/qs\">https://www.npmjs.com/package/qs</a></p>\n', ' 刚开始使用Vue，里面的坑是一个接一个，今天就遇到一个axios POST传参的问题，我需要在请求中传递参数，然后按官方文档的格式开始操作，代码如下：\n ```\n axios.post(\'/user\', {\n    firstName: \'Fred\',\n    lastName: \'Flintstone\'\n  })\n  .then(function (response) {\n    console.log(response);\n  })\n  .catch(function (error) {\n    console.log(error);\n  });\n ```\n 打开控制台，报400，报错信息是：传递的参数不存在，但在请求中看的到参数，只是参数的格式是Request Payload，具体也没看懂是什么，总之知道就是参数格式不对，查阅资料找到两种解决办法，代码如下：\n ```\n1.\nvar qs = require(\'qs\');\naxios.post(\'/foo\', qs.stringify({ \'bar\': 123 }));\n\n2.\nvar params = new URLSearchParams();\nparams.append(\'param1\', \'value1\');\nparams.append(\'param2\', \'value2\');\naxios.post(\'/foo\', params);\n ```\n>测试，这两种办法都可以\n \n \n 这个问题刚解决，后台就抛给我一个问题，我的参数里面要传数组呢，我以为直接按上面的做法就能一马平川了，然而现实是残酷的，崩盘！查看官方文档发现，其实这个的解决也是非常的简单，只需要在qs的方法中设置它的indices为false即可，如：\n\n`s.stringify({ a: [\'b\', \'c\', \'d\'] }, { indices: false });`\n\n更多qs功能参考：https://www.npmjs.com/package/qs', '2018-09-04 12:22:48', '2018-09-04 12:22:48', 41, 0, 0, 'favorite', 0, 25, NULL, 1);
INSERT INTO `blog` VALUES (43, 1, '【心血来潮，看看了CSS相关知识】CSS', '<p> 我在网上发现了这个东西，挺好用的，就拿过来放这里保存好</p>\n<h3 id=\"h3-css3-translate-\"><a name=\"Css3使用translate属性，使不知道宽度、高度的元素实现水平、垂直居中\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>Css3使用translate属性，使不知道宽度、高度的元素实现水平、垂直居中</h3><pre><code> &lt;div class=&quot;wrapper&quot;&gt;我不知道我的宽度和高是多少，我要实现水平垂直居中&lt;/div&gt;\n .wrapper{   \n    padding:20px;  \n    background: orange;  \n    color: #fff;  \n    position: absolute;  \n    top:50%;  \n    left: 50%;  \n    -webkit-transform:translate(-50%,-50%);   \n    -moz-transform:translate(-50%,-50%);  \n    -transform:translate(-50%,-50%);  \n}\n</code></pre>', ' 我在网上发现了这个东西，挺好用的，就拿过来放这里保存好\n ### Css3使用translate属性，使不知道宽度、高度的元素实现水平、垂直居中\n ```\n <div class=\"wrapper\">我不知道我的宽度和高是多少，我要实现水平垂直居中</div>\n .wrapper{   \n    padding:20px;  \n    background: orange;  \n    color: #fff;  \n    position: absolute;  \n    top:50%;  \n    left: 50%;  \n    -webkit-transform:translate(-50%,-50%);   \n    -moz-transform:translate(-50%,-50%);  \n    -transform:translate(-50%,-50%);  \n} \n ```', '2018-09-10 13:45:54', '2018-09-10 13:45:54', 29, 0, 0, 'favorite', 0, 25, NULL, 1);
INSERT INTO `blog` VALUES (44, 1, 'Redis 总结精讲 看一篇成高手系统', '<h1 id=\"h1-u672Cu6587u56F4u7ED5u4EE5u4E0Bu51E0u70B9u8FDBu884Cu9610u8FF0\"><a name=\"本文围绕以下几点进行阐述\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>本文围绕以下几点进行阐述</h1><p>1、为什么使用redis<br>2、使用redis有什么缺点<br>3、单线程的redis为什么这么快<br>4、redis的数据类型，以及每种数据类型的使用场景<br>5、redis的过期策略以及内存淘汰机制<br>6、redis和数据库双写一致性问题<br>7、如何应对缓存穿透和缓存雪崩问题<br>8、如何解决redis的并发竞争问题</p>\n<h2 id=\"h2-u6B63u6587\"><a name=\"正文\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>正文</h2><h3 id=\"h3-1-redis\"><a name=\"1、为什么使用redis\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1、为什么使用redis</h3><p>分析:博主觉得在项目中使用redis，主要是从两个角度去考虑:性能和并发。当然，redis还具备可以做分布式锁等其他功能，但是如果只是为了分布式锁这些其他功能，完全还有其他中间件(如zookpeer等)代替，并不是非要使用redis。因此，这个问题主要从性能和并发两个角度去答。<br>回答:如下所示，分为两点</p>\n<h5 id=\"h5--\"><a name=\"（一）性能\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>（一）性能</h5><p>如下图所示，我们在碰到需要执行耗时特别久，且结果不频繁变动的SQL，就特别适合将运行结果放入缓存。这样，后面的请求就去缓存中读取，使得请求能够迅速响应。<br><img src=\"/upload/img/article/0/1_20190403145554.png\" alt=\"1554274557093.png\"><br>题外话：忽然想聊一下这个迅速响应的标准。其实根据交互效果的不同，这个响应时间没有固定标准。不过曾经有人这么告诉我:”在理想状态下，我们的页面跳转需要在瞬间解决，对于页内操作则需要在刹那间解决。另外，超过一弹指的耗时操作要有进度提示，并且可以随时中止或取消，这样才能给用户最好的体验。”</p>\n<h5 id=\"h5--\"><a name=\"（二）并发\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>（二）并发</h5><p>如下图所示，在大并发的情况下，所有的请求直接访问数据库，数据库会出现连接异常。这个时候，就需要使用redis做一个缓冲操作，让请求先访问到redis，而不是直接访问数据库。<br><img src=\"/upload/img/article/0/1_20190403145713.png\" alt=\"1554274635536.png\"></p>\n<h3 id=\"h3-2-redis-\"><a name=\"2、使用redis有什么缺点\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2、使用redis有什么缺点</h3><p>分析:大家用redis这么久，这个问题是必须要了解的，基本上使用redis都会碰到一些问题，常见的也就几个。<br>回答:主要是四个问题</p>\n<p>(一)缓存和数据库双写一致性问题<br>(二)缓存雪崩问题<br>(三)缓存击穿问题<br>(四)缓存的并发竞争问题<br>这四个问题，我个人是觉得在项目中，比较常遇见的，具体解决方案，后文给出。</p>\n<h3 id=\"h3-3-redis-\"><a name=\"3、单线程的redis为什么这么快\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3、单线程的redis为什么这么快</h3><p>分析:这个问题其实是对redis内部机制的一个考察。其实根据博主的面试经验，很多人其实都不知道redis是单线程工作模型。所以，这个问题还是应该要复习一下的。<br>回答:主要是以下三点<br>(一)纯内存操作<br>(二)单线程操作，避免了频繁的上下文切换<br>(三)采用了非阻塞I/O多路复用机制<br>题外话：我们现在要仔细的说一说I/O多路复用机制，因为这个说法实在是太通俗了，通俗到一般人都不懂是什么意思。博主打一个比方：小曲在S城开了一家快递店，负责同城快送服务。小曲因为资金限制，雇佣了一批快递员，然后小曲发现资金不够了，只够买一辆车送快递。</p>\n<p>经营方式一</p>\n<p>客户每送来一份快递，小曲就让一个快递员盯着，然后快递员开车去送快递。慢慢的小曲就发现了这种经营方式存在下述问题<br>几十个快递员基本上时间都花在了抢车上了，大部分快递员都处在闲置状态，谁抢到了车，谁就能去送快递<br>随着快递的增多，快递员也越来越多，小曲发现快递店里越来越挤，没办法雇佣新的快递员了<br>快递员之间的协调很花时间</p>\n<p>综合上述缺点，小曲痛定思痛，提出了下面的经营方式</p>\n<p>经营方式二</p>\n<p>小曲只雇佣一个快递员。然后呢，客户送来的快递，小曲按送达地点标注好，然后依次放在一个地方。最后，那个快递员依次的去取快递，一次拿一个，然后开着车去送快递，送好了就回来拿下一个快递。</p>\n<p>对比</p>\n<p>上述两种经营方式对比，是不是明显觉得第二种，效率更高，更好呢。在上述比喻中:</p>\n<p>每个快递员——————&gt;每个线程</p>\n<p>每个快递——————–&gt;每个socket(I/O流)<br>快递的送达地点————–&gt;socket的不同状态<br>客户送快递请求————–&gt;来自客户端的请求<br>小曲的经营方式————–&gt;服务端运行的代码<br>一辆车———————-&gt;CPU的核数</p>\n<p>于是我们有如下结论</p>\n<p>1、经营方式一就是传统的并发模型，每个I/O流(快递)都有一个新的线程(快递员)管理。</p>\n<p>2、经营方式二就是I/O多路复用。只有单个线程(一个快递员)，通过跟踪每个I/O流的状态(每个快递的送达地点)，来管理多个I/O流。</p>\n<p>下面类比到真实的redis线程模型，如图所示<br><img src=\"/upload/img/article/0/1_20190403145740.png\" alt=\"1554274662664.png\"><br>参照上图，简单来说，就是。我们的redis-client在操作的时候，会产生具有不同事件类型的socket。在服务端，有一段I/0多路复用程序，将其置入队列之中。然后，文件事件分派器，依次去队列中取，转发到不同的事件处理器中。</p>\n<p>需要说明的是，这个I/O多路复用机制，redis还提供了select、epoll、evport、kqueue等多路复用函数库，大家可以自行去了解。</p>\n<h3 id=\"h3-4-redis-\"><a name=\"4、redis的数据类型，以及每种数据类型的使用场景\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>4、redis的数据类型，以及每种数据类型的使用场景</h3><p>分析：是不是觉得这个问题很基础，其实我也这么觉得。然而根据面试经验发现，至少百分八十的人答不上这个问题。建议，在项目中用到后，再类比记忆，体会更深，不要硬记。基本上，一个合格的程序员，五种类型都会用到。<br>回答：一共五种<br>(一)String<br>这个其实没啥好说的，最常规的set/get操作，value可以是String也可以是数字。一般做一些复杂的计数功能的缓存。<br>(二)hash<br>这里value存放的是结构化的对象，比较方便的就是操作其中的某个字段。博主在做单点登录的时候，就是用这种数据结构存储用户信息，以cookieId作为key，设置30分钟为缓存过期时间，能很好的模拟出类似session的效果。<br>(三)list<br>使用List的数据结构，可以做简单的消息队列的功能。另外还有一个就是，可以利用lrange命令，做基于redis的分页功能，性能极佳，用户体验好。本人还用一个场景，很合适—-取行情信息。就也是个生产者和消费者的场景。LIST可以很好的完成排队，先进先出的原则。<br>(四)set<br>因为set堆放的是一堆不重复值的集合。所以可以做全局去重的功能。为什么不用JVM自带的Set进行去重？因为我们的系统一般都是集群部署，使用JVM自带的Set，比较麻烦，难道为了一个做一个全局去重，再起一个公共服务，太麻烦了。</p>\n<p>另外，就是利用交集、并集、差集等操作，可以计算共同喜好，全部的喜好，自己独有的喜好等功能。<br>(五)sorted set<br>sorted set多了一个权重参数score,集合中的元素能够按score进行排列。可以做排行榜应用，取TOP N操作。</p>\n<h3 id=\"h3-5-redis-\"><a name=\"5、redis的过期策略以及内存淘汰机制\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>5、redis的过期策略以及内存淘汰机制</h3><p>分析:这个问题其实相当重要，到底redis有没用到家，这个问题就可以看出来。比如你redis只能存5G数据，可是你写了10G，那会删5G的数据。怎么删的，这个问题思考过么？还有，你的数据已经设置了过期时间，但是时间到了，内存占用率还是比较高，有思考过原因么?<br>回答:<br>redis采用的是定期删除+惰性删除策略。</p>\n<p>为什么不用定时删除策略?</p>\n<p>定时删除,用一个定时器来负责监视key,过期则自动删除。虽然内存及时释放，但是十分消耗CPU资源。在大并发请求下，CPU要将时间应用在处理请求，而不是删除key,因此没有采用这一策略.</p>\n<p>定期删除+惰性删除是如何工作的呢?</p>\n<p>定期删除，redis默认每个100ms检查，是否有过期的key,有过期key则删除。需要说明的是，redis不是每个100ms将所有的key检查一次，而是随机抽取进行检查(如果每隔100ms,全部key进行检查，redis岂不是卡死)。因此，如果只采用定期删除策略，会导致很多key到时间没有删除。</p>\n<p>于是，惰性删除派上用场。也就是说在你获取某个key的时候，redis会检查一下，这个key如果设置了过期时间那么是否过期了？如果过期了此时就会删除。</p>\n<p>采用定期删除+惰性删除就没其他问题了么?</p>\n<p>不是的，如果定期删除没删除key。然后你也没即时去请求key，也就是说惰性删除也没生效。这样，redis的内存会越来越高。那么就应该采用内存淘汰机制。<br>在redis.conf中有一行配置<br><code># maxmemory-policy volatile-lru</code><br>该配置就是配内存淘汰策略的(什么，你没配过？好好反省一下自己)</p>\n<p>1）noeviction：当内存不足以容纳新写入数据时，新写入操作会报错。应该没人用吧。</p>\n<p>2）allkeys-lru：当内存不足以容纳新写入数据时，在键空间中，移除最近最少使用的key。推荐使用，目前项目在用这种。</p>\n<p>3）allkeys-random：当内存不足以容纳新写入数据时，在键空间中，随机移除某个key。应该也没人用吧，你不删最少使用Key,去随机删。</p>\n<p>4）volatile-lru：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，移除最近最少使用的key。这种情况一般是把redis既当缓存，又做持久化存储的时候才用。不推荐</p>\n<p>5）volatile-random：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，随机移除某个key。依然不推荐<br>6）volatile-ttl：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，有更早过期时间的key优先移除。不推荐</p>\n<p>ps：如果没有设置 expire 的key, 不满足先决条件(prerequisites); 那么 volatile-lru, volatile-random 和 volatile-ttl 策略的行为, 和 noeviction(不删除) 基本上一致。</p>\n<h3 id=\"h3-6-redis-\"><a name=\"6、redis和数据库双写一致性问题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>6、redis和数据库双写一致性问题</h3><p>分析:一致性问题是分布式常见问题，还可以再分为最终一致性和强一致性。数据库和缓存双写，就必然会存在不一致的问题。答这个问题，先明白一个前提。就是如果对数据有强一致性要求，不能放缓存。我们所做的一切，只能保证最终一致性。另外，我们所做的方案其实从根本上来说，只能说降低不一致发生的概率，无法完全避免。因此，有强一致性要求的数据，不能放缓存。</p>\n<p>首先，采取正确更新策略，先更新数据库，再删缓存。其次，因为可能存在删除缓存失败的问题，提供一个补偿措施即可，例如利用消息队列。</p>\n<h3 id=\"h3-7-\"><a name=\"7、如何应对缓存穿透和缓存雪崩问题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>7、如何应对缓存穿透和缓存雪崩问题</h3><p>分析:这两个问题，说句实在话，一般中小型传统软件企业，很难碰到这个问题。如果有大并发的项目，流量有几百万左右。这两个问题一定要深刻考虑。</p>\n<p>回答:如下所示</p>\n<p>缓存穿透，即黑客故意去请求缓存中不存在的数据，导致所有的请求都怼到数据库上，从而数据库连接异常。<br>解决方案:<br>(一)利用互斥锁，缓存失效的时候，先去获得锁，得到锁了，再去请求数据库。没得到锁，则休眠一段时间重试<br>(二)采用异步更新策略，无论key是否取到值，都直接返回。value值中维护一个缓存失效时间，缓存如果过期，异步起一个线程去读数据库，更新缓存。需要做缓存预热(项目启动前，先加载缓存)操作。<br>(三)提供一个能迅速判断请求是否有效的拦截机制，比如，利用布隆过滤器，内部维护一系列合法有效的key。迅速判断出，请求所携带的Key是否合法有效。如果不合法，则直接返回。<br>缓存雪崩，即缓存同一时间大面积的失效，这个时候又来了一波请求，结果请求都怼到数据库上，从而导致数据库连接异常。</p>\n<p>解决方案:<br>(一)给缓存的失效时间，加上一个随机值，避免集体失效。<br>(二)使用互斥锁，但是该方案吞吐量明显下降了。<br>(三)双缓存。我们有两个缓存，缓存A和缓存B。缓存A的失效时间为20分钟，缓存B不设失效时间。自己做缓存预热操作。然后细分以下几个小点<br>    I 从缓存A读数据库，有则直接返回<br>    II A没有数据，直接从B读数据，直接返回，并且异步启动一个更新线程。<br>    III 更新线程同时更新缓存A和缓存B。</p>\n<h3 id=\"h3-8-redis-key-\"><a name=\"8、如何解决redis的并发竞争key问题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>8、如何解决redis的并发竞争key问题</h3><p>分析:这个问题大致就是，同时有多个子系统去set一个key。这个时候要注意什么呢？大家思考过么。需要说明一下，博主提前百度了一下，发现答案基本都是推荐用redis事务机制。博主不推荐使用redis的事务机制。因为我们的生产环境，基本都是redis集群环境，做了数据分片操作。你一个事务中有涉及到多个key操作的时候，这多个key不一定都存储在同一个redis-server上。因此，redis的事务机制，十分鸡肋。<br>回答:如下所示<br>(1)如果对这个key操作，不要求顺序<br>这种情况下，准备一个分布式锁，大家去抢锁，抢到锁就做set操作即可，比较简单。<br>(2)如果对这个key操作，要求顺序<br>假设有一个key1,系统A需要将key1设置为valueA,系统B需要将key1设置为valueB,系统C需要将key1设置为valueC.</p>\n<p>期望按照key1的value值按照 valueA–&gt;valueB–&gt;valueC的顺序变化。这种时候我们在数据写入数据库的时候，需要保存一个时间戳。假设时间戳如下<br>系统A key 1 {valueA  3:00}</p>\n<p>系统B key 1 {valueB  3:05}</p>\n<p>系统C key 1 {valueC  3:10}</p>\n<p>那么，假设这会系统B先抢到锁，将key1设置为{valueB 3:05}。接下来系统A抢到锁，发现自己的valueA的时间戳早于缓存中的时间戳，那就不做set操作了。以此类推。</p>\n<p>其他方法，比如利用队列，将set方法变成串行访问也可以。总之，灵活变通。</p>\n\n<p>本文来自 hjm4702192 的CSDN 博客 ，全文地址请点击：<a href=\"https://blog.csdn.net/hjm4702192/article/details/80518856?utm_source=copy\">https://blog.csdn.net/hjm4702192/article/details/80518856?utm_source=copy</a>   </p>\n', '# 本文围绕以下几点进行阐述\n1、为什么使用redis\n2、使用redis有什么缺点\n3、单线程的redis为什么这么快\n4、redis的数据类型，以及每种数据类型的使用场景\n5、redis的过期策略以及内存淘汰机制\n6、redis和数据库双写一致性问题\n7、如何应对缓存穿透和缓存雪崩问题\n8、如何解决redis的并发竞争问题\n## 正文\n### 1、为什么使用redis\n分析:博主觉得在项目中使用redis，主要是从两个角度去考虑:性能和并发。当然，redis还具备可以做分布式锁等其他功能，但是如果只是为了分布式锁这些其他功能，完全还有其他中间件(如zookpeer等)代替，并不是非要使用redis。因此，这个问题主要从性能和并发两个角度去答。\n回答:如下所示，分为两点\n\n#####（一）性能\n如下图所示，我们在碰到需要执行耗时特别久，且结果不频繁变动的SQL，就特别适合将运行结果放入缓存。这样，后面的请求就去缓存中读取，使得请求能够迅速响应。\n![1554274557093.png](/upload/img/article/0/1_20190403145554.png)\n题外话：忽然想聊一下这个迅速响应的标准。其实根据交互效果的不同，这个响应时间没有固定标准。不过曾经有人这么告诉我:”在理想状态下，我们的页面跳转需要在瞬间解决，对于页内操作则需要在刹那间解决。另外，超过一弹指的耗时操作要有进度提示，并且可以随时中止或取消，这样才能给用户最好的体验。”\n\n#####（二）并发\n\n\n如下图所示，在大并发的情况下，所有的请求直接访问数据库，数据库会出现连接异常。这个时候，就需要使用redis做一个缓冲操作，让请求先访问到redis，而不是直接访问数据库。\n![1554274635536.png](/upload/img/article/0/1_20190403145713.png)\n\n\n### 2、使用redis有什么缺点\n分析:大家用redis这么久，这个问题是必须要了解的，基本上使用redis都会碰到一些问题，常见的也就几个。\n回答:主要是四个问题\n\n(一)缓存和数据库双写一致性问题\n(二)缓存雪崩问题\n(三)缓存击穿问题\n(四)缓存的并发竞争问题\n这四个问题，我个人是觉得在项目中，比较常遇见的，具体解决方案，后文给出。\n### 3、单线程的redis为什么这么快\n分析:这个问题其实是对redis内部机制的一个考察。其实根据博主的面试经验，很多人其实都不知道redis是单线程工作模型。所以，这个问题还是应该要复习一下的。\n回答:主要是以下三点\n(一)纯内存操作\n(二)单线程操作，避免了频繁的上下文切换\n(三)采用了非阻塞I/O多路复用机制\n题外话：我们现在要仔细的说一说I/O多路复用机制，因为这个说法实在是太通俗了，通俗到一般人都不懂是什么意思。博主打一个比方：小曲在S城开了一家快递店，负责同城快送服务。小曲因为资金限制，雇佣了一批快递员，然后小曲发现资金不够了，只够买一辆车送快递。\n\n经营方式一\n\n客户每送来一份快递，小曲就让一个快递员盯着，然后快递员开车去送快递。慢慢的小曲就发现了这种经营方式存在下述问题\n几十个快递员基本上时间都花在了抢车上了，大部分快递员都处在闲置状态，谁抢到了车，谁就能去送快递\n随着快递的增多，快递员也越来越多，小曲发现快递店里越来越挤，没办法雇佣新的快递员了\n快递员之间的协调很花时间\n\n综合上述缺点，小曲痛定思痛，提出了下面的经营方式\n\n经营方式二\n\n小曲只雇佣一个快递员。然后呢，客户送来的快递，小曲按送达地点标注好，然后依次放在一个地方。最后，那个快递员依次的去取快递，一次拿一个，然后开着车去送快递，送好了就回来拿下一个快递。\n\n对比\n\n上述两种经营方式对比，是不是明显觉得第二种，效率更高，更好呢。在上述比喻中:\n\n每个快递员——————>每个线程\n\n每个快递——————–>每个socket(I/O流)\n快递的送达地点————–>socket的不同状态\n客户送快递请求————–>来自客户端的请求\n小曲的经营方式————–>服务端运行的代码\n一辆车———————->CPU的核数\n\n于是我们有如下结论\n\n1、经营方式一就是传统的并发模型，每个I/O流(快递)都有一个新的线程(快递员)管理。\n\n2、经营方式二就是I/O多路复用。只有单个线程(一个快递员)，通过跟踪每个I/O流的状态(每个快递的送达地点)，来管理多个I/O流。\n\n下面类比到真实的redis线程模型，如图所示\n![1554274662664.png](/upload/img/article/0/1_20190403145740.png)\n参照上图，简单来说，就是。我们的redis-client在操作的时候，会产生具有不同事件类型的socket。在服务端，有一段I/0多路复用程序，将其置入队列之中。然后，文件事件分派器，依次去队列中取，转发到不同的事件处理器中。\n\n\n需要说明的是，这个I/O多路复用机制，redis还提供了select、epoll、evport、kqueue等多路复用函数库，大家可以自行去了解。\n\n\n### 4、redis的数据类型，以及每种数据类型的使用场景\n分析：是不是觉得这个问题很基础，其实我也这么觉得。然而根据面试经验发现，至少百分八十的人答不上这个问题。建议，在项目中用到后，再类比记忆，体会更深，不要硬记。基本上，一个合格的程序员，五种类型都会用到。\n回答：一共五种\n(一)String\n这个其实没啥好说的，最常规的set/get操作，value可以是String也可以是数字。一般做一些复杂的计数功能的缓存。\n(二)hash\n这里value存放的是结构化的对象，比较方便的就是操作其中的某个字段。博主在做单点登录的时候，就是用这种数据结构存储用户信息，以cookieId作为key，设置30分钟为缓存过期时间，能很好的模拟出类似session的效果。\n(三)list\n使用List的数据结构，可以做简单的消息队列的功能。另外还有一个就是，可以利用lrange命令，做基于redis的分页功能，性能极佳，用户体验好。本人还用一个场景，很合适---取行情信息。就也是个生产者和消费者的场景。LIST可以很好的完成排队，先进先出的原则。\n(四)set\n因为set堆放的是一堆不重复值的集合。所以可以做全局去重的功能。为什么不用JVM自带的Set进行去重？因为我们的系统一般都是集群部署，使用JVM自带的Set，比较麻烦，难道为了一个做一个全局去重，再起一个公共服务，太麻烦了。\n\n\n另外，就是利用交集、并集、差集等操作，可以计算共同喜好，全部的喜好，自己独有的喜好等功能。\n(五)sorted set\nsorted set多了一个权重参数score,集合中的元素能够按score进行排列。可以做排行榜应用，取TOP N操作。\n\n### 5、redis的过期策略以及内存淘汰机制\n\n分析:这个问题其实相当重要，到底redis有没用到家，这个问题就可以看出来。比如你redis只能存5G数据，可是你写了10G，那会删5G的数据。怎么删的，这个问题思考过么？还有，你的数据已经设置了过期时间，但是时间到了，内存占用率还是比较高，有思考过原因么?\n回答:\nredis采用的是定期删除+惰性删除策略。\n\n为什么不用定时删除策略?\n\n定时删除,用一个定时器来负责监视key,过期则自动删除。虽然内存及时释放，但是十分消耗CPU资源。在大并发请求下，CPU要将时间应用在处理请求，而不是删除key,因此没有采用这一策略.\n\n定期删除+惰性删除是如何工作的呢?\n\n定期删除，redis默认每个100ms检查，是否有过期的key,有过期key则删除。需要说明的是，redis不是每个100ms将所有的key检查一次，而是随机抽取进行检查(如果每隔100ms,全部key进行检查，redis岂不是卡死)。因此，如果只采用定期删除策略，会导致很多key到时间没有删除。\n\n于是，惰性删除派上用场。也就是说在你获取某个key的时候，redis会检查一下，这个key如果设置了过期时间那么是否过期了？如果过期了此时就会删除。\n\n采用定期删除+惰性删除就没其他问题了么?\n\n不是的，如果定期删除没删除key。然后你也没即时去请求key，也就是说惰性删除也没生效。这样，redis的内存会越来越高。那么就应该采用内存淘汰机制。\n在redis.conf中有一行配置\n`# maxmemory-policy volatile-lru`\n该配置就是配内存淘汰策略的(什么，你没配过？好好反省一下自己)\n\n1）noeviction：当内存不足以容纳新写入数据时，新写入操作会报错。应该没人用吧。\n\n2）allkeys-lru：当内存不足以容纳新写入数据时，在键空间中，移除最近最少使用的key。推荐使用，目前项目在用这种。\n\n3）allkeys-random：当内存不足以容纳新写入数据时，在键空间中，随机移除某个key。应该也没人用吧，你不删最少使用Key,去随机删。\n\n4）volatile-lru：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，移除最近最少使用的key。这种情况一般是把redis既当缓存，又做持久化存储的时候才用。不推荐\n\n5）volatile-random：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，随机移除某个key。依然不推荐\n6）volatile-ttl：当内存不足以容纳新写入数据时，在设置了过期时间的键空间中，有更早过期时间的key优先移除。不推荐\n\nps：如果没有设置 expire 的key, 不满足先决条件(prerequisites); 那么 volatile-lru, volatile-random 和 volatile-ttl 策略的行为, 和 noeviction(不删除) 基本上一致。\n\n### 6、redis和数据库双写一致性问题\n分析:一致性问题是分布式常见问题，还可以再分为最终一致性和强一致性。数据库和缓存双写，就必然会存在不一致的问题。答这个问题，先明白一个前提。就是如果对数据有强一致性要求，不能放缓存。我们所做的一切，只能保证最终一致性。另外，我们所做的方案其实从根本上来说，只能说降低不一致发生的概率，无法完全避免。因此，有强一致性要求的数据，不能放缓存。\n\n首先，采取正确更新策略，先更新数据库，再删缓存。其次，因为可能存在删除缓存失败的问题，提供一个补偿措施即可，例如利用消息队列。\n### 7、如何应对缓存穿透和缓存雪崩问题\n分析:这两个问题，说句实在话，一般中小型传统软件企业，很难碰到这个问题。如果有大并发的项目，流量有几百万左右。这两个问题一定要深刻考虑。\n\n回答:如下所示\n\n缓存穿透，即黑客故意去请求缓存中不存在的数据，导致所有的请求都怼到数据库上，从而数据库连接异常。\n解决方案:\n(一)利用互斥锁，缓存失效的时候，先去获得锁，得到锁了，再去请求数据库。没得到锁，则休眠一段时间重试\n(二)采用异步更新策略，无论key是否取到值，都直接返回。value值中维护一个缓存失效时间，缓存如果过期，异步起一个线程去读数据库，更新缓存。需要做缓存预热(项目启动前，先加载缓存)操作。\n(三)提供一个能迅速判断请求是否有效的拦截机制，比如，利用布隆过滤器，内部维护一系列合法有效的key。迅速判断出，请求所携带的Key是否合法有效。如果不合法，则直接返回。\n缓存雪崩，即缓存同一时间大面积的失效，这个时候又来了一波请求，结果请求都怼到数据库上，从而导致数据库连接异常。\n\n解决方案:\n(一)给缓存的失效时间，加上一个随机值，避免集体失效。\n(二)使用互斥锁，但是该方案吞吐量明显下降了。\n(三)双缓存。我们有两个缓存，缓存A和缓存B。缓存A的失效时间为20分钟，缓存B不设失效时间。自己做缓存预热操作。然后细分以下几个小点\n	I 从缓存A读数据库，有则直接返回\n	II A没有数据，直接从B读数据，直接返回，并且异步启动一个更新线程。\n	III 更新线程同时更新缓存A和缓存B。\n### 8、如何解决redis的并发竞争key问题\n分析:这个问题大致就是，同时有多个子系统去set一个key。这个时候要注意什么呢？大家思考过么。需要说明一下，博主提前百度了一下，发现答案基本都是推荐用redis事务机制。博主不推荐使用redis的事务机制。因为我们的生产环境，基本都是redis集群环境，做了数据分片操作。你一个事务中有涉及到多个key操作的时候，这多个key不一定都存储在同一个redis-server上。因此，redis的事务机制，十分鸡肋。\n回答:如下所示\n(1)如果对这个key操作，不要求顺序\n这种情况下，准备一个分布式锁，大家去抢锁，抢到锁就做set操作即可，比较简单。\n(2)如果对这个key操作，要求顺序\n假设有一个key1,系统A需要将key1设置为valueA,系统B需要将key1设置为valueB,系统C需要将key1设置为valueC.\n\n\n期望按照key1的value值按照 valueA–>valueB–>valueC的顺序变化。这种时候我们在数据写入数据库的时候，需要保存一个时间戳。假设时间戳如下\n系统A key 1 {valueA  3:00}\n\n系统B key 1 {valueB  3:05}\n\n系统C key 1 {valueC  3:10}\n\n\n那么，假设这会系统B先抢到锁，将key1设置为{valueB 3:05}。接下来系统A抢到锁，发现自己的valueA的时间戳早于缓存中的时间戳，那就不做set操作了。以此类推。\n\n其他方法，比如利用队列，将set方法变成串行访问也可以。总之，灵活变通。\n\n---------------------\n\n本文来自 hjm4702192 的CSDN 博客 ，全文地址请点击：https://blog.csdn.net/hjm4702192/article/details/80518856?utm_source=copy   ', '2018-09-27 13:04:14', '2019-04-03 14:58:08', 172, 0, 0, 'favorite', 0, 26, NULL, 1);
INSERT INTO `blog` VALUES (45, 1, '解决报错 “build.sh /bin/bash^M: 坏的解释器：没有那个文件或目录”', '<p> 执行.sh脚本时，报错 “start.sh  /bin/bash^M: 坏的解释器：没有那个文件或目录”,因为 .sh文件是从windows拷贝过来的，所以多了\\r，执行：<br> <code>sed -i &#39;s/\\r$//&#39; start.sh</code><br> 会把 start.sh 中的\\r 替换成空白，再次执行则成功！</p>\n', ' 执行.sh脚本时，报错 \"start.sh  /bin/bash^M: 坏的解释器：没有那个文件或目录”,因为 .sh文件是从windows拷贝过来的，所以多了\\r，执行：\n `\n sed -i \'s/\\r$//\' start.sh \n `\n 会把 start.sh 中的\\r 替换成空白，再次执行则成功！', '2018-10-17 16:52:34', '2018-10-17 16:52:34', 48, 0, 0, 'favorite', 0, 16, NULL, 1);
INSERT INTO `blog` VALUES (46, 1, 'CentOS 7 开放防火墙80,3306等端口命令', '<h2 id=\"h2-centos-7-\"><a name=\"CentOS 7 开放防火墙端口 命令\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>CentOS 7 开放防火墙端口 命令</h2><h3 id=\"h3-1-firewalld-\"><a name=\"1、使用firewalld方法如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1、使用firewalld方法如下：</h3><h4 id=\"h4-u5173u95EDu9632u706Bu5899\"><a name=\"关闭防火墙\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>关闭防火墙</h4><pre><code>systemctl stop firewalld.service             #停止firewall\nsystemctl disable firewalld.service          #禁止firewall开机启动\n</code></pre><h4 id=\"h4-u5F00u542Fu7AEFu53E3\"><a name=\"开启端口\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>开启端口</h4><pre><code>firewall-cmd --zone=public --add-port=80/tcp --permanent\n</code></pre><pre><code> 命令含义：\n--zone             #作用域\n--add-port=80/tcp  #添加端口，格式为：端口/通讯协议\n--permanent        #永久生效，没有此参数重启后失效\n</code></pre><h4 id=\"h4-u91CDu542Fu9632u706Bu5899\"><a name=\"重启防火墙\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>重启防火墙</h4><pre><code>firewall-cmd --reload\n</code></pre><h4 id=\"h4-u5E38u7528u547Du4EE4u4ECBu7ECD\"><a name=\"常用命令介绍\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>常用命令介绍</h4><pre><code>firewall-cmd --state                           ##查看防火墙状态，是否是running\nfirewall-cmd --reload                          ##重新载入配置，比如添加规则之后，需要执行此命令\nfirewall-cmd --get-zones                       ##列出支持的zone\nfirewall-cmd --get-services                    ##列出支持的服务，在列表中的服务是放行的\nfirewall-cmd --query-service ftp               ##查看ftp服务是否支持，返回yes或者no\nfirewall-cmd --add-service=ftp                 ##临时开放ftp服务\nfirewall-cmd --add-service=ftp --permanent     ##永久开放ftp服务\nfirewall-cmd --remove-service=ftp --permanent  ##永久移除ftp服务\nfirewall-cmd --add-port=80/tcp --permanent     ##永久添加80端口 \niptables -L -n                                 ##查看规则，这个命令是和iptables的相同的\nfirewall-cmd --help                            ##查看帮助\n</code></pre><h3 id=\"h3-2-centos-7-0-firewall-iptables-\"><a name=\"2、CentOS 7.0默认使用的是firewall作为防火墙，使用iptables必须重新设置一下\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2、CentOS 7.0默认使用的是firewall作为防火墙，使用iptables必须重新设置一下</h3><blockquote>\n<h4 id=\"h4-1-\"><a name=\"1、直接关闭防火墙\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1、直接关闭防火墙</h4><pre><code>systemctl stop firewalld.service           #停止firewall\nsystemctl disable firewalld.service        #禁止firewall开机启动\n</code></pre><h4 id=\"h4-2-iptables-service\"><a name=\"2、设置 iptables service\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2、设置 iptables service</h4><p><code>yum -y install iptables-services</code><br>如果要修改防火墙配置，如增加防火墙端口3306<br><code>vi /etc/sysconfig/iptables</code><br>增加规则<br><code>-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT</code>\\<br>保存退出后</p>\n<pre><code>systemctl restart iptables.service #重启防火墙使配置生效\nsystemctl enable iptables.service  #设置防火墙开机启动\n</code></pre><p>最后重启系统使设置生效即可。</p>\n</blockquote>\n', '## CentOS 7 开放防火墙端口 命令\n### 1、使用firewalld方法如下：\n\n#### 关闭防火墙\n```\nsystemctl stop firewalld.service             #停止firewall\nsystemctl disable firewalld.service          #禁止firewall开机启动\n```\n\n#### 开启端口\n	firewall-cmd --zone=public --add-port=80/tcp --permanent\n ```\n 命令含义：\n--zone             #作用域\n--add-port=80/tcp  #添加端口，格式为：端口/通讯协议\n--permanent        #永久生效，没有此参数重启后失效\n```\n\n#### 重启防火墙\n	firewall-cmd --reload\n\n#### 常用命令介绍\n```\nfirewall-cmd --state                           ##查看防火墙状态，是否是running\nfirewall-cmd --reload                          ##重新载入配置，比如添加规则之后，需要执行此命令\nfirewall-cmd --get-zones                       ##列出支持的zone\nfirewall-cmd --get-services                    ##列出支持的服务，在列表中的服务是放行的\nfirewall-cmd --query-service ftp               ##查看ftp服务是否支持，返回yes或者no\nfirewall-cmd --add-service=ftp                 ##临时开放ftp服务\nfirewall-cmd --add-service=ftp --permanent     ##永久开放ftp服务\nfirewall-cmd --remove-service=ftp --permanent  ##永久移除ftp服务\nfirewall-cmd --add-port=80/tcp --permanent     ##永久添加80端口 \niptables -L -n                                 ##查看规则，这个命令是和iptables的相同的\nfirewall-cmd --help                            ##查看帮助\n```\n\n### 2、CentOS 7.0默认使用的是firewall作为防火墙，使用iptables必须重新设置一下\n\n> #### 1、直接关闭防火墙\n```\nsystemctl stop firewalld.service           #停止firewall\nsystemctl disable firewalld.service        #禁止firewall开机启动\n```\n\n> #### 2、设置 iptables service\n`yum -y install iptables-services`\n如果要修改防火墙配置，如增加防火墙端口3306\n`vi /etc/sysconfig/iptables `\n增加规则\n`-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT`\\\n保存退出后\n```\nsystemctl restart iptables.service #重启防火墙使配置生效\nsystemctl enable iptables.service  #设置防火墙开机启动\n```\n最后重启系统使设置生效即可。\n\n\n', '2018-10-22 09:44:59', '2018-12-26 22:42:07', 35, 0, 0, 'favorite', 0, 18, NULL, 1);
INSERT INTO `blog` VALUES (47, 1, '为啥 redis 单线程模型也能效率这么高？', '<ul>\n<li>纯内存操作</li><li>核心是基于非阻塞IO多路复用机制</li><li>单线程反而避免了多线程的上下文频繁切换问题</li></ul>\n', '- 纯内存操作\n- 核心是基于非阻塞IO多路复用机制\n- 单线程反而避免了多线程的上下文频繁切换问题\n', '2019-01-30 15:25:07', '2019-01-30 15:25:07', 13, 0, 0, '', 0, 26, NULL, 1);
INSERT INTO `blog` VALUES (48, 1, 'Redis 都有哪些数据类型？分别在哪些场景下使用比较合适？', '<h3 id=\"h3-redis-\"><a name=\"redis 主要有以下几种数据类型\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>redis 主要有以下几种数据类型</h3><ul>\n<li>string</li><li>hash</li><li>list</li><li>set</li><li>sorted set</li></ul>\n<h4 id=\"h4-string\"><a name=\"string\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>string</h4><p>这是最简单的类型，就是普通的 set 和 get，做简单的 KV 缓存。</p>\n<pre><code>set college szu\n</code></pre><h4 id=\"h4-hash\"><a name=\"hash\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>hash</h4><p>这个是类似 map 的一种结构，这个一般就是可以将结构化的数据，比如一个对象（前提是这个对象没嵌套其他的对象）给缓存在 redis 里，然后每次读写缓存的时候，可以就操作 hash 里的某个字段。</p>\n<pre><code>hset person name bingo\nhset person age 20\nhset person id 1\nhget person name\n</code></pre><pre><code>person = {\n    \"name\": \"bingo\",\n    \"age\": 20,\n    \"id\": 1\n}\n</code></pre><h4 id=\"h4-list\"><a name=\"list\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>list</h4><p>list 是有序列表，这个可以玩儿出很多花样。</p>\n<p>比如可以通过 list 存储一些列表型的数据结构，类似粉丝列表、文章的评论列表之类的东西。</p>\n<p>比如可以通过 lrange 命令，读取某个闭区间内的元素，可以基于 list 实现分页查询，这个是很棒的一个功能，基于 redis 实现简单的高性能分页，可以做类似微博那种下拉不断分页的东西，性能高，就一页一页走。</p>\n<pre><code># 0开始位置，-1结束位置，结束位置为-1时，表示列表的最后一个位置，即查看所有。\nlrange mylist 0 -1\n</code></pre><p>比如可以搞个简单的消息队列，从 list 头怼进去，从 list 尾巴那里弄出来。</p>\n<pre><code>lpush mylist 1\nlpush mylist 2\nlpush mylist 3 4 5\n\n# 1\nrpop mylist\n</code></pre><h4 id=\"h4-set\"><a name=\"set\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>set</h4><p>set 是无序集合，自动去重。</p>\n<p>直接基于 set 将系统里需要去重的数据扔进去，自动就给去重了，如果你需要对一些数据进行快速的全局去重，你当然也可以基于 jvm 内存里的 HashSet 进行去重，但是如果你的某个系统部署在多台机器上呢？得基于 redis 进行全局的 set 去重。</p>\n<p>可以基于 set 玩儿交集、并集、差集的操作，比如交集吧，可以把两个人的粉丝列表整一个交集，看看俩人的共同好友是谁？对吧。</p>\n<p>把两个大 V 的粉丝都放在两个 set 中，对两个 set 做交集。</p>\n<pre><code>#-------操作一个set-------\n# 添加元素\nsadd mySet 1\n\n# 查看全部元素\nsmembers mySet\n\n# 判断是否包含某个值\nsismember mySet 3\n\n# 删除某个/些元素\nsrem mySet 1\nsrem mySet 2 4\n\n# 查看元素个数\nscard mySet\n\n# 随机删除一个元素\nspop mySet\n\n#-------操作多个set-------\n# 将一个set的元素移动到另外一个set\nsmove yourSet mySet 2\n\n# 求两set的交集\nsinter yourSet mySet\n\n# 求两set的并集\nsunion yourSet mySet\n\n# 求在yourSet中而不在mySet中的元素\nsdiff yourSet mySet\n</code></pre><h4 id=\"h4-sorted-set\"><a name=\"sorted set\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>sorted set</h4><p>sorted set 是排序的 set，去重但可以排序，写进去的时候给一个分数，自动根据分数排序。</p>\n<pre><code>zadd board 85 zhangsan\nzadd board 72 lisi\nzadd board 96 wangwu\nzadd board 63 zhaoliu\n\n# 获取排名前三的用户（默认是升序，所以需要 rev 改为降序）\nzrevrange board 0 3\n\n# 获取某用户的排名\nzrank board zhaoliu\n</code></pre>', '### redis 主要有以下几种数据类型\n- string\n- hash\n- list\n- set\n- sorted set\n\n#### string\n这是最简单的类型，就是普通的 set 和 get，做简单的 KV 缓存。\n```\nset college szu\n```\n#### hash \n这个是类似 map 的一种结构，这个一般就是可以将结构化的数据，比如一个对象（前提是这个对象没嵌套其他的对象）给缓存在 redis 里，然后每次读写缓存的时候，可以就操作 hash 里的某个字段。\n```\nhset person name bingo\nhset person age 20\nhset person id 1\nhget person name\n```\n```\nperson = {\n    \"name\": \"bingo\",\n    \"age\": 20,\n    \"id\": 1\n}\n```\n#### list\nlist 是有序列表，这个可以玩儿出很多花样。\n\n比如可以通过 list 存储一些列表型的数据结构，类似粉丝列表、文章的评论列表之类的东西。\n\n比如可以通过 lrange 命令，读取某个闭区间内的元素，可以基于 list 实现分页查询，这个是很棒的一个功能，基于 redis 实现简单的高性能分页，可以做类似微博那种下拉不断分页的东西，性能高，就一页一页走。\n```\n# 0开始位置，-1结束位置，结束位置为-1时，表示列表的最后一个位置，即查看所有。\nlrange mylist 0 -1\n```\n比如可以搞个简单的消息队列，从 list 头怼进去，从 list 尾巴那里弄出来。\n```\nlpush mylist 1\nlpush mylist 2\nlpush mylist 3 4 5\n\n# 1\nrpop mylist\n```\n#### set\nset 是无序集合，自动去重。\n\n直接基于 set 将系统里需要去重的数据扔进去，自动就给去重了，如果你需要对一些数据进行快速的全局去重，你当然也可以基于 jvm 内存里的 HashSet 进行去重，但是如果你的某个系统部署在多台机器上呢？得基于 redis 进行全局的 set 去重。\n\n可以基于 set 玩儿交集、并集、差集的操作，比如交集吧，可以把两个人的粉丝列表整一个交集，看看俩人的共同好友是谁？对吧。\n\n把两个大 V 的粉丝都放在两个 set 中，对两个 set 做交集。\n```\n#-------操作一个set-------\n# 添加元素\nsadd mySet 1\n\n# 查看全部元素\nsmembers mySet\n\n# 判断是否包含某个值\nsismember mySet 3\n\n# 删除某个/些元素\nsrem mySet 1\nsrem mySet 2 4\n\n# 查看元素个数\nscard mySet\n\n# 随机删除一个元素\nspop mySet\n\n#-------操作多个set-------\n# 将一个set的元素移动到另外一个set\nsmove yourSet mySet 2\n\n# 求两set的交集\nsinter yourSet mySet\n\n# 求两set的并集\nsunion yourSet mySet\n\n# 求在yourSet中而不在mySet中的元素\nsdiff yourSet mySet\n```\n#### sorted set\nsorted set 是排序的 set，去重但可以排序，写进去的时候给一个分数，自动根据分数排序。\n```\nzadd board 85 zhangsan\nzadd board 72 lisi\nzadd board 96 wangwu\nzadd board 63 zhaoliu\n\n# 获取排名前三的用户（默认是升序，所以需要 rev 改为降序）\nzrevrange board 0 3\n\n# 获取某用户的排名\nzrank board zhaoliu\n```\n\n\n\n\n\n\n\n', '2019-01-30 15:34:02', '2019-01-30 15:34:02', 14, 0, 0, '', 0, 26, NULL, 1);
INSERT INTO `blog` VALUES (49, 1, 'Spring或SpringBoot中管理JFinal ORM插件事物(优化版本)', '<p>此教程是针对<a href=\"http://www.styg.site/article/15\">Spring或SpringBoot中管理JFinal ORM插件事物</a>教程上的优化</p>\n<h4 id=\"h4--spring-aop-\"><a name=\"使用spring AOP代理\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用spring AOP代理</h4><p>这里使用springboot来实现，spring同理<br>使用注解@ Aspect</p>\n<h4 id=\"h4-maven-\"><a name=\"maven 依赖\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>maven 依赖</h4><pre><code>&lt;dependency&gt;&lt;!-- spring boot aop starter依赖 --&gt;\n    &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;\n    &lt;artifactId&gt;spring-boot-starter-aop&lt;/artifactId&gt;\n&lt;/dependency&gt;\n&lt;!-- 数据源 --&gt;\n&lt;dependency&gt;\n    &lt;groupId&gt;com.zaxxer&lt;/groupId&gt;\n    &lt;artifactId&gt;HikariCP&lt;/artifactId&gt;\n&lt;/dependency&gt;\n</code></pre><h4 id=\"h4-jfinaltxaop\"><a name=\"JFinalTxAop\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>JFinalTxAop</h4><pre><code>package com.syc.common.aop;\n\nimport com.jfinal.kit.LogKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordException;\nimport com.jfinal.plugin.activerecord.Config;\nimport com.jfinal.plugin.activerecord.DbKit;\nimport com.jfinal.plugin.activerecord.NestedTransactionHelpException;\nimport com.jfinal.plugin.activerecord.tx.TxConfig;\nimport org.aspectj.lang.ProceedingJoinPoint;\nimport org.aspectj.lang.annotation.Around;\nimport org.aspectj.lang.annotation.Aspect;\nimport org.aspectj.lang.annotation.Pointcut;\nimport org.aspectj.lang.reflect.MethodSignature;\nimport org.springframework.stereotype.Component;\nimport org.springframework.transaction.NoTransactionException;\nimport org.springframework.transaction.interceptor.TransactionAspectSupport;\n\nimport java.lang.reflect.Method;\nimport java.sql.Connection;\nimport java.sql.SQLException;\n\n/**\n * @author choxsu\n * @date 2018/4/13\n */\n@Aspect\n@Component\npublic class JFinalTxAop {\n    /**\n     * 是否可以手动提交事物，默认可以自动提交\n     */\n    private static boolean canCommit = true;\n    /**\n     * 自定义JFinal 事物注解:类上面\n     *\n     * @within 表示注解在类下面所有的方法\n     */\n    @Pointcut(\"@within(org.springframework.transaction.annotation.Transactional)\")\n    private void methodWithin() {\n    }\n\n    /**\n     * 自定义JFinal 事物注解:方法上面\n     *\n     * @annotation 表示注解只能支持方法上\n     */\n    @Pointcut(\"@annotation(org.springframework.transaction.annotation.Transactional)\")\n    private void methodAnno() {\n    }\n\n    /**\n     * 兼容@Transactional可以放在类上和方法上\n     * 当放类上时，类中所有方法都支持事物注解，\n     * 如果类上没有@Transactional，然而是放在方法上的，那么只有此方法支持事物注解\n     *\n     * @param pjp 切入点目标对象\n     * @return 返回切入方法的返回数据\n     * @throws Throwable\n     */\n    @Around(value = \"methodWithin() || methodAnno()\")\n    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {\n        Object retVal = null;\n        Config config = getConfigWithTxConfig(pjp);\n        if (config == null)\n            config = DbKit.getConfig();\n\n        Connection conn = config.getThreadLocalConnection();\n        // Nested transaction support\n        if (conn != null) {\n            try {\n                if (conn.getTransactionIsolation() &lt; getTransactionLevel(config))\n                    conn.setTransactionIsolation(getTransactionLevel(config));\n                retVal = pjp.proceed();\n                return retVal;\n            } catch (SQLException e) {\n                throw new ActiveRecordException(e);\n            }\n        }\n        Boolean autoCommit = null;\n        try {\n            conn = config.getConnection();\n            autoCommit = conn.getAutoCommit();\n            config.setThreadLocalConnection(conn);\n            conn.setTransactionIsolation(getTransactionLevel(config));// conn.setTransactionIsolation(transactionLevel);\n            conn.setAutoCommit(false);\n            retVal = pjp.proceed();\n            if (canCommit) {\n                conn.commit();\n            } else {\n                try {\n                    conn.rollback();\n                } catch (Exception e1) {\n                    LogKit.error(e1.getMessage(), e1);\n                }\n            }\n        } catch (NestedTransactionHelpException e) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            LogKit.logNothing(e);\n        } catch (Throwable t) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            throw t instanceof RuntimeException ? (RuntimeException) t : new ActiveRecordException(t);\n        } finally {\n            canCommit = true;\n            try {\n                if (conn != null) {\n                    if (autoCommit != null)\n                        conn.setAutoCommit(autoCommit);\n                    conn.close();\n                }\n            } catch (Throwable t) {\n                // can not throw exception here, otherwise the more important exception in previous catch block can not be thrown\n                LogKit.error(t.getMessage(), t);\n            } finally {\n                // prevent memory leak\n                config.removeThreadLocalConnection();\n            }\n        }\n        return retVal;\n    }\n\n    /**\n     * 获取配置的事务级别\n     *\n     * @param config\n     * @return\n     */\n    protected int getTransactionLevel(Config config) {\n        return config.getTransactionLevel();\n    }\n\n    /**\n     * @param pjp\n     * @return Config\n     */\n    public static Config getConfigWithTxConfig(ProceedingJoinPoint pjp) {\n        MethodSignature ms = (MethodSignature) pjp.getSignature();\n        Method method = ms.getMethod();\n        TxConfig txConfig = method.getAnnotation(TxConfig.class);\n        if (txConfig == null)\n            txConfig = pjp.getTarget().getClass().getAnnotation(TxConfig.class);\n\n        if (txConfig != null) {\n            Config config = DbKit.getConfig(txConfig.value());\n            if (config == null)\n                throw new RuntimeException(\"Config not found with TxConfig: \" + txConfig.value());\n            return config;\n        }\n        return null;\n    }\n\n    public static boolean setRollbackOnly() {\n        canCommit = false;\n        try {\n            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();\n        } catch (NoTransactionException e) {\n            return false;\n        }\n        return true;\n    }\n}\n</code></pre><h3 id=\"h3-u4F7Fu7528\"><a name=\"使用\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用</h3><h4 id=\"h4-testcontroller\"><a name=\"TestController\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>TestController</h4><pre><code>package com.choxsu.elastic.controller;\n\nimport com.choxsu.elastic.service.TestService;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n/**\n * @author choxsu\n */\n@RestController\n@RequestMapping(value = {\"/test/v1\"})\npublic class TestController {\n\n\n    @Autowired\n    private TestService testService;\n\n    @GetMapping(value = \"/testTran\")\n    public Object testTran(){\n        return testService.testTran();\n    }\n}\n</code></pre><h4 id=\"h4-testservice\"><a name=\"TestService\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>TestService</h4><p><code>@ Transactional</code>可以放在类上或方法上都没问题</p>\n<blockquote>\n<p>当调用了setRollbackOnly方法 记得return,不return的话 后面的业务也会被回滚，所以记得return</p>\n</blockquote>\n<pre><code>package com.choxsu.elastic.service;\n\nimport com.choxsu.elastic.config.JFinalTx;\nimport com.jfinal.kit.Ret;\nimport com.jfinal.plugin.activerecord.Db;\nimport com.jfinal.plugin.activerecord.Record;\nimport org.springframework.stereotype.Service;\n\n\n/**\n * @author choxsu\n */\n@Transactional \n@Service\npublic class TestService {\n\n    /**\n     * 事物测试\n     *\n     * @return\n     */\n    @Transactional\n    public Object testTran() {\n        Record record = new Record();\n        record.set(\"id\", 10);\n        Db.save(\"test\", record);\n        if (true) {\n            throw new RuntimeException(\"test\");\n        }\n        //或者手动回滚，不用抛出异常\n        JFinalTxAop.setRollbackOnly()\n\n        return Ret.by(\"msg\", \"success\");\n    }\n}\n</code></pre><h5 id=\"h5-sql-\"><a name=\"sql执行了\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>sql执行了</h5><pre><code>Sql: insert into `test`(`id`) values(?)\n</code></pre><h5 id=\"h5-u4F46u662Fu6570u636Eu5E93u6CA1u6709u6570u636E\"><a name=\"但是数据库没有数据\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>但是数据库没有数据</h5><p><img src=\"/upload/img/article/0/1_20181222233320.jpeg\" alt=\"1545492800236.jpeg\"></p>\n<p>到此证明事物拦截成功，可以使用spring来管理ActiveRecordPlugin的事物了</p>\n<h4 id=\"h4--code-throw-new-runtimeexception-quot-test-quot-jfinaltxaop-setrollbackonly-code-\"><a name=\"去掉<code>throw new RuntimeException(&quot;test&quot;);或者JFinalTxAop.setRollbackOnly()</code>的效果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>去掉<code>throw new RuntimeException(\"test\");或者JFinalTxAop.setRollbackOnly()</code>的效果</h4><h5 id=\"h5-sql\"><a name=\"sql\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>sql</h5><pre><code>Sql: insert into `test`(`id`) values(?)\n</code></pre><h5 id=\"h5-u6570u636Eu5E93u7ED3u679C\"><a name=\"数据库结果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>数据库结果</h5><p><img src=\"/upload/img/article/0/1_20181222233334.jpeg\" alt=\"1545492814226.jpeg\"></p>\n', '此教程是针对[Spring或SpringBoot中管理JFinal ORM插件事物](http://www.styg.site/article/15)教程上的优化\n#### 使用spring AOP代理\n这里使用springboot来实现，spring同理\n使用注解@ Aspect\n\n#### maven 依赖\n```\n<dependency><!-- spring boot aop starter依赖 -->\n	<groupId>org.springframework.boot</groupId>\n	<artifactId>spring-boot-starter-aop</artifactId>\n</dependency>\n<!-- 数据源 -->\n<dependency>\n	<groupId>com.zaxxer</groupId>\n	<artifactId>HikariCP</artifactId>\n</dependency>\n```\n#### JFinalTxAop\n```\npackage com.syc.common.aop;\n\nimport com.jfinal.kit.LogKit;\nimport com.jfinal.plugin.activerecord.ActiveRecordException;\nimport com.jfinal.plugin.activerecord.Config;\nimport com.jfinal.plugin.activerecord.DbKit;\nimport com.jfinal.plugin.activerecord.NestedTransactionHelpException;\nimport com.jfinal.plugin.activerecord.tx.TxConfig;\nimport org.aspectj.lang.ProceedingJoinPoint;\nimport org.aspectj.lang.annotation.Around;\nimport org.aspectj.lang.annotation.Aspect;\nimport org.aspectj.lang.annotation.Pointcut;\nimport org.aspectj.lang.reflect.MethodSignature;\nimport org.springframework.stereotype.Component;\nimport org.springframework.transaction.NoTransactionException;\nimport org.springframework.transaction.interceptor.TransactionAspectSupport;\n\nimport java.lang.reflect.Method;\nimport java.sql.Connection;\nimport java.sql.SQLException;\n\n/**\n * @author choxsu\n * @date 2018/4/13\n */\n@Aspect\n@Component\npublic class JFinalTxAop {\n    /**\n     * 是否可以手动提交事物，默认可以自动提交\n     */\n    private static boolean canCommit = true;\n    /**\n     * 自定义JFinal 事物注解:类上面\n     *\n     * @within 表示注解在类下面所有的方法\n     */\n    @Pointcut(\"@within(org.springframework.transaction.annotation.Transactional)\")\n    private void methodWithin() {\n    }\n\n    /**\n     * 自定义JFinal 事物注解:方法上面\n     *\n     * @annotation 表示注解只能支持方法上\n     */\n    @Pointcut(\"@annotation(org.springframework.transaction.annotation.Transactional)\")\n    private void methodAnno() {\n    }\n\n    /**\n     * 兼容@Transactional可以放在类上和方法上\n     * 当放类上时，类中所有方法都支持事物注解，\n     * 如果类上没有@Transactional，然而是放在方法上的，那么只有此方法支持事物注解\n     *\n     * @param pjp 切入点目标对象\n     * @return 返回切入方法的返回数据\n     * @throws Throwable\n     */\n    @Around(value = \"methodWithin() || methodAnno()\")\n    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {\n        Object retVal = null;\n        Config config = getConfigWithTxConfig(pjp);\n        if (config == null)\n            config = DbKit.getConfig();\n\n        Connection conn = config.getThreadLocalConnection();\n        // Nested transaction support\n        if (conn != null) {\n            try {\n                if (conn.getTransactionIsolation() < getTransactionLevel(config))\n                    conn.setTransactionIsolation(getTransactionLevel(config));\n                retVal = pjp.proceed();\n                return retVal;\n            } catch (SQLException e) {\n                throw new ActiveRecordException(e);\n            }\n        }\n        Boolean autoCommit = null;\n        try {\n            conn = config.getConnection();\n            autoCommit = conn.getAutoCommit();\n            config.setThreadLocalConnection(conn);\n            conn.setTransactionIsolation(getTransactionLevel(config));// conn.setTransactionIsolation(transactionLevel);\n            conn.setAutoCommit(false);\n            retVal = pjp.proceed();\n            if (canCommit) {\n                conn.commit();\n            } else {\n                try {\n                    conn.rollback();\n                } catch (Exception e1) {\n                    LogKit.error(e1.getMessage(), e1);\n                }\n            }\n        } catch (NestedTransactionHelpException e) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            LogKit.logNothing(e);\n        } catch (Throwable t) {\n            if (conn != null) try {\n                conn.rollback();\n            } catch (Exception e1) {\n                LogKit.error(e1.getMessage(), e1);\n            }\n            throw t instanceof RuntimeException ? (RuntimeException) t : new ActiveRecordException(t);\n        } finally {\n			canCommit = true;\n            try {\n                if (conn != null) {\n                    if (autoCommit != null)\n                        conn.setAutoCommit(autoCommit);\n                    conn.close();\n                }\n            } catch (Throwable t) {\n                // can not throw exception here, otherwise the more important exception in previous catch block can not be thrown\n                LogKit.error(t.getMessage(), t);\n            } finally {\n                // prevent memory leak\n                config.removeThreadLocalConnection();\n            }\n        }\n        return retVal;\n    }\n\n    /**\n     * 获取配置的事务级别\n     *\n     * @param config\n     * @return\n     */\n    protected int getTransactionLevel(Config config) {\n        return config.getTransactionLevel();\n    }\n\n    /**\n     * @param pjp\n     * @return Config\n     */\n    public static Config getConfigWithTxConfig(ProceedingJoinPoint pjp) {\n        MethodSignature ms = (MethodSignature) pjp.getSignature();\n        Method method = ms.getMethod();\n        TxConfig txConfig = method.getAnnotation(TxConfig.class);\n        if (txConfig == null)\n            txConfig = pjp.getTarget().getClass().getAnnotation(TxConfig.class);\n\n        if (txConfig != null) {\n            Config config = DbKit.getConfig(txConfig.value());\n            if (config == null)\n                throw new RuntimeException(\"Config not found with TxConfig: \" + txConfig.value());\n            return config;\n        }\n        return null;\n    }\n\n    public static boolean setRollbackOnly() {\n        canCommit = false;\n        try {\n            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();\n        } catch (NoTransactionException e) {\n            return false;\n        }\n        return true;\n    }\n}\n```\n\n### 使用\n#### TestController\n```\npackage com.choxsu.elastic.controller;\n\nimport com.choxsu.elastic.service.TestService;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n/**\n * @author choxsu\n */\n@RestController\n@RequestMapping(value = {\"/test/v1\"})\npublic class TestController {\n\n\n    @Autowired\n    private TestService testService;\n\n    @GetMapping(value = \"/testTran\")\n    public Object testTran(){\n        return testService.testTran();\n    }\n}\n\n```\n#### TestService\n``@ Transactional``可以放在类上或方法上都没问题\n> 当调用了setRollbackOnly方法 记得return,不return的话 后面的业务也会被回滚，所以记得return\n\n```\npackage com.choxsu.elastic.service;\n\nimport com.choxsu.elastic.config.JFinalTx;\nimport com.jfinal.kit.Ret;\nimport com.jfinal.plugin.activerecord.Db;\nimport com.jfinal.plugin.activerecord.Record;\nimport org.springframework.stereotype.Service;\n\n\n/**\n * @author choxsu\n */\n@Transactional \n@Service\npublic class TestService {\n\n    /**\n     * 事物测试\n     *\n     * @return\n     */\n    @Transactional\n    public Object testTran() {\n        Record record = new Record();\n        record.set(\"id\", 10);\n        Db.save(\"test\", record);\n        if (true) {\n            throw new RuntimeException(\"test\");\n        }\n		//或者手动回滚，不用抛出异常\n		JFinalTxAop.setRollbackOnly()\n		\n        return Ret.by(\"msg\", \"success\");\n    }\n}\n\n```\n##### sql执行了\n```\nSql: insert into `test`(`id`) values(?)\n```\n##### 但是数据库没有数据\n![1545492800236.jpeg](/upload/img/article/0/1_20181222233320.jpeg)\n\n到此证明事物拦截成功，可以使用spring来管理ActiveRecordPlugin的事物了\n\n#### 去掉`throw new RuntimeException(\"test\");或者JFinalTxAop.setRollbackOnly()`的效果\n##### sql\n```\nSql: insert into `test`(`id`) values(?)\n```\n##### 数据库结果\n![1545492814226.jpeg](/upload/img/article/0/1_20181222233334.jpeg)\n', '2019-01-31 14:09:43', '2019-01-31 16:37:52', 43, 0, 0, '', 0, 1, NULL, 1);
INSERT INTO `blog` VALUES (50, 1, '一步一步的教你在windows下安装MySQL5.7', '<h2 id=\"h2-u5B89u88C5u4E4Bu524D\"><a name=\"安装之前\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装之前</h2><p>MySQL数据库在日常使用是非常的频繁的，不管是线上还是线下。下面我就分享出我安装MySQL5.7的一步一脚印的教程，本教程只针对windows版本，<code>linux</code>和<code>mac</code>后面会给出相应的链接教程</p>\n<h2 id=\"h2-u4E0Bu8F7Du5730u5740\"><a name=\"下载地址\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>下载地址</h2><p>先上下载地址：<a href=\"https://dev.mysql.com/downloads/mysql/5.7.html#downloads\">mysql5.7下载地址</a><br>这是mysql官网的下载地址，选择官网是没问题的<br><img src=\"/upload/img/article/0/1_20190427124426.png\" alt=\"1556340266010.png\"><br>进入最终下载页，默认要你登录，但是一般都不登录，直接点击下面no thanks…开始下载<br><img src=\"/upload/img/article/0/1_20190427094215.png\" alt=\"\"></p>\n<h2 id=\"h2-u5B89u88C5\"><a name=\"安装\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装</h2><h3 id=\"h3-u89E3u538B\"><a name=\"解压\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>解压</h3><p>我这里将<code>mysql-5.7.26-winx64.zip</code>这个压缩包cp（复制）到<code>D:/MYSQL/</code>目录下并解压，如图<br><img src=\"/upload/img/article/0/1_20190427100645.png\" alt=\"mysql安装包解压\" title=\"mysql安装包解压\"></p>\n<h3 id=\"h3-u914Du7F6Eu73AFu5883u53D8u91CF\"><a name=\"配置环境变量\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置环境变量</h3><p>先<code>cd mysql-5.7.26-winx64/</code>到这个目录<br><img src=\"/upload/img/article/0/1_20190427101422.png\" alt=\"\"></p>\n<h4 id=\"h4-u6253u5F00u73AFu5883u53D8u91CF\"><a name=\"打开环境变量\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>打开环境变量</h4><p>打开环境变量路径如图中标红<br><img src=\"/upload/img/article/0/1_20190427101402.png\" alt=\"\"></p>\n<h4 id=\"h4-u8BBEu7F6Eu73AFu5883u53D8u91CF\"><a name=\"设置环境变量\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>设置环境变量</h4><p>设置环境变量，这一步才是主要的<br><img src=\"/upload/img/article/0/1_20190427101447.png\" alt=\"\"><br>变量名用MYSQL_HOME,变量值就是刚刚的解压后进入的目录，然后点击确认<br><img src=\"/upload/img/article/0/1_20190427102123.png\" alt=\"1556331687433.png\"><br>到这里环境就配置好了？No,还差一步，那就是Path<br><img src=\"/upload/img/article/0/1_20190427102540.png\" alt=\"path环境设置\" title=\"path环境设置\"></p>\n<h3 id=\"h3-my-ini-\"><a name=\"my.ini文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>my.ini文件</h3><p>当前版本是没有默认的my-default.ini，之前的版本是有的，但是现在没有我们就只有自己创建了；<br>那我就给一份ini的配置文件</p>\n<pre><code>[mysqld]\n# 端口\nport = 3306\n# 这个你自己的安装目录\nbasedir=D:\\MySQL\\mysql-5.7.26-winx64\ndatadir=D:\\MySQL\\mysql-5.7.26-winx64/data\nmax_connections=150\ncharacter-set-server=utf8\n# 数据库类型inndb支持事务\ndefault-storage-engine=INNODB\nsql_mode=STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION\n[mysql]\n</code></pre><p>将my.imi文件放到<code>D:\\MySQL\\mysql-5.7.26-winx64</code>；<code>注意：</code>这里的路径是自己解压的MySQL目录，maybe你可以和我一样的路径方式</p>\n<h3 id=\"h3-u6253u5F00u547Du4EE4u884Cu63D0u793Au7B26\"><a name=\"打开命令行提示符\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>打开命令行提示符</h3><p>一定要<code>以管理员身份运行</code>，这里要注意了<br><img src=\"/upload/img/article/0/1_20190427104036.png\" alt=\"\"><br>cd 到你的安装目录<br><img src=\"/upload/img/article/0/1_20190427104024.png\" alt=\"1556332828782.png\"></p>\n<h3 id=\"h3--mysql\"><a name=\"命令行安装mysql\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>命令行安装mysql</h3><p>执行下面的命令，mysqld可以直接使用的原因是之前是配置了MySQL的Path环境变量的</p>\n<pre><code>mysqld -install\n</code></pre><p>然后会看到<code>Service successfully installed.</code><br><img src=\"/upload/img/article/0/1_20190427104443.png\" alt=\"1556333087316.png\"><br>别着急，后面还有几个步骤，但是已经过了大半了<br>需要在执行一个命令</p>\n<pre><code>mysqld --initialize-insecure --user=mysql\n</code></pre><p>执行上面命令后会在MySQL的安装目录下生成data目录并创建root用户<br><img src=\"/upload/img/article/0/1_20190427104956.png\" alt=\"\"></p>\n<h3 id=\"h3-u542Fu52A8u670Du52A1\"><a name=\"启动服务\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>启动服务</h3><p>执行命令</p>\n<pre><code>net start mysql\n</code></pre><p><img src=\"/upload/img/article/0/1_20190427105145.png\" alt=\"12\" title=\"12\"></p>\n<h3 id=\"h3-u767Bu5F55u6210u529F\"><a name=\"登录成功\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>登录成功</h3><p>链接成功了，默认是没有密码的，输入完<code>mysql -uroot -p</code>两次回车就等成功了<br><img src=\"/upload/img/article/0/1_20190427105240.png\" alt=\"1556333564728.png\"></p>\n<h3 id=\"h3--root-\"><a name=\"设置root的密码\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>设置root的密码</h3><p>还是用命令来操作，是不是挺好玩的</p>\n<pre><code>mysqladmin -u root -p password newPassword\nEnter password: oldPassword\n</code></pre><p>Enter password 密码的时候直接回车就可以修改成功了</p>\n<h3 id=\"h3-u7ED3u675Fu8BED\"><a name=\"结束语\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>结束语</h3><p>到这里呢，基本就搞定，如果文章对你有帮助，望多多关注我，thanks^_^</p>\n', '## 安装之前\nMySQL数据库在日常使用是非常的频繁的，不管是线上还是线下。下面我就分享出我安装MySQL5.7的一步一脚印的教程，本教程只针对windows版本，`linux`和`mac`后面会给出相应的链接教程\n## 下载地址\n先上下载地址：[mysql5.7下载地址](https://dev.mysql.com/downloads/mysql/5.7.html#downloads)\n这是mysql官网的下载地址，选择官网是没问题的\n![1556340266010.png](/upload/img/article/0/1_20190427124426.png)\n进入最终下载页，默认要你登录，但是一般都不登录，直接点击下面no thanks...开始下载\n![](/upload/img/article/0/1_20190427094215.png)\n## 安装\n### 解压\n我这里将`mysql-5.7.26-winx64.zip`这个压缩包cp（复制）到`D:/MYSQL/`目录下并解压，如图\n![mysql安装包解压](/upload/img/article/0/1_20190427100645.png \"mysql安装包解压\")\n### 配置环境变量\n先`cd mysql-5.7.26-winx64/`到这个目录\n![](/upload/img/article/0/1_20190427101422.png)\n#### 打开环境变量\n打开环境变量路径如图中标红\n![](/upload/img/article/0/1_20190427101402.png)\n#### 设置环境变量\n设置环境变量，这一步才是主要的\n![](/upload/img/article/0/1_20190427101447.png)\n变量名用MYSQL_HOME,变量值就是刚刚的解压后进入的目录，然后点击确认\n![1556331687433.png](/upload/img/article/0/1_20190427102123.png)\n到这里环境就配置好了？No,还差一步，那就是Path\n![path环境设置](/upload/img/article/0/1_20190427102540.png \"path环境设置\")\n### my.ini文件\n当前版本是没有默认的my-default.ini，之前的版本是有的，但是现在没有我们就只有自己创建了；\n那我就给一份ini的配置文件\n```\n[mysqld]\n# 端口\nport = 3306\n# 这个你自己的安装目录\nbasedir=D:\\MySQL\\mysql-5.7.26-winx64\ndatadir=D:\\MySQL\\mysql-5.7.26-winx64/data\nmax_connections=150\ncharacter-set-server=utf8\n# 数据库类型inndb支持事务\ndefault-storage-engine=INNODB\nsql_mode=STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION\n[mysql]\n```\n将my.imi文件放到`D:\\MySQL\\mysql-5.7.26-winx64`；`注意：`这里的路径是自己解压的MySQL目录，maybe你可以和我一样的路径方式\n### 打开命令行提示符\n一定要`以管理员身份运行`，这里要注意了\n![](/upload/img/article/0/1_20190427104036.png)\ncd 到你的安装目录\n![1556332828782.png](/upload/img/article/0/1_20190427104024.png)\n### 命令行安装mysql\n执行下面的命令，mysqld可以直接使用的原因是之前是配置了MySQL的Path环境变量的\n```\nmysqld -install\n```\n然后会看到`Service successfully installed.`\n![1556333087316.png](/upload/img/article/0/1_20190427104443.png)\n别着急，后面还有几个步骤，但是已经过了大半了\n需要在执行一个命令\n```\nmysqld --initialize-insecure --user=mysql\n```\n执行上面命令后会在MySQL的安装目录下生成data目录并创建root用户\n![](/upload/img/article/0/1_20190427104956.png)\n### 启动服务\n执行命令\n```\nnet start mysql\n```\n![12](/upload/img/article/0/1_20190427105145.png \"12\")\n### 登录成功\n链接成功了，默认是没有密码的，输入完`mysql -uroot -p`两次回车就等成功了\n![1556333564728.png](/upload/img/article/0/1_20190427105240.png)\n### 设置root的密码\n还是用命令来操作，是不是挺好玩的\n```\nmysqladmin -u root -p password newPassword\nEnter password: oldPassword\n```\nEnter password 密码的时候直接回车就可以修改成功了\n### 结束语\n到这里呢，基本就搞定，如果文章对你有帮助，望多多关注我，thanks^_^\n', '2019-04-27 09:59:49', '2019-04-27 12:44:37', 44, 0, 0, '', 0, 8, NULL, 1);
INSERT INTO `blog` VALUES (52, 1, '我的简历1123213123', '<p>sdfsdafdsaf asdfdsafsdf~~~~</p>\n', '~~sdfsdafdsaf asdfdsafsdf~~~~~~', '2019-05-25 15:46:09', '2019-05-25 15:46:09', 0, 0, 0, '', 1, 1, NULL, 0);
INSERT INTO `blog` VALUES (53, 1, 'Go语言环境安装111', '<h2 id=\"h2-u4F60u597D\"><a name=\"你好\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>你好</h2><h3 id=\"h3-u4F60u597Du5440\"><a name=\"你好呀\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>你好呀</h3>', '## 你好\n\n### 你好呀', '2019-06-14 11:48:32', '2019-06-14 11:48:32', 0, 0, 0, '', 1, 5, NULL, 0);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `status` int(4) NOT NULL DEFAULT 0 COMMENT '是否有效；0是1否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, 'JAVA', 0);
INSERT INTO `blog_category` VALUES (2, 'Python', 0);
INSERT INTO `blog_category` VALUES (3, 'C', 0);
INSERT INTO `blog_category` VALUES (4, 'C++', 0);
INSERT INTO `blog_category` VALUES (5, 'Spring', 0);
INSERT INTO `blog_category` VALUES (6, 'GO', 0);
INSERT INTO `blog_category` VALUES (7, 'JavaScript', 0);
INSERT INTO `blog_category` VALUES (8, 'PHP', 0);
INSERT INTO `blog_category` VALUES (9, 'Kotiln', 0);

-- ----------------------------
-- Table structure for blog_reply
-- ----------------------------
DROP TABLE IF EXISTS `blog_reply`;
CREATE TABLE `blog_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `accountId` int(11) NOT NULL COMMENT '账户ID',
  `blogId` int(11) NOT NULL COMMENT '文章ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `createTime` datetime(0) NOT NULL COMMENT '创建时间',
  `report` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_reply
-- ----------------------------
INSERT INTO `blog_reply` VALUES (1, 1, 44, '你好啊，文章写得不错，赞一个', '2019-05-25 08:44:23', 0);
INSERT INTO `blog_reply` VALUES (2, 1, 44, '你好啊，文章写得不错，赞一个', '2019-05-25 08:57:52', 0);
INSERT INTO `blog_reply` VALUES (3, 1, 44, '你好啊，文章写得不错，赞一个', '2019-05-25 09:00:44', 0);
INSERT INTO `blog_reply` VALUES (4, 1, 37, '你好啊，文章写得不错，赞一个', '2019-05-25 09:01:44', 0);
INSERT INTO `blog_reply` VALUES (5, 1, 44, 'src=\"/upload/avatar/#(x.avatar)\"', '2019-05-25 09:24:02', 0);
INSERT INTO `blog_reply` VALUES (6, 1, 15, '的非官方的时光帝国饭店fasdasdf奋斗的爽肤水，大晚上的防守打法', '2019-05-25 09:31:34', 0);
INSERT INTO `blog_reply` VALUES (7, 1, 15, '评一个', '2019-05-25 09:34:50', 0);
INSERT INTO `blog_reply` VALUES (8, 1, 15, '评一个', '2019-05-25 09:37:26', 0);
INSERT INTO `blog_reply` VALUES (9, 1, 15, '神鼎飞丹砂', '2019-05-25 09:38:36', 0);
INSERT INTO `blog_reply` VALUES (10, 1, 15, '胜多负少的', '2019-05-25 09:38:55', 0);
INSERT INTO `blog_reply` VALUES (11, 1, 15, '爽肤水', '2019-05-25 09:39:24', 0);
INSERT INTO `blog_reply` VALUES (12, 1, 15, '是的发送', '2019-05-25 09:40:47', 0);
INSERT INTO `blog_reply` VALUES (13, 1, 15, '你好', '2019-05-25 09:42:00', 0);
INSERT INTO `blog_reply` VALUES (28, 1, 16, '出发上大学时的办理户口胜多负少的就按法律，撒地方大师傅奇偶i', '2019-05-25 10:25:24', 0);
INSERT INTO `blog_reply` VALUES (30, 1, 25, '你好', '2019-05-25 10:29:20', 0);
INSERT INTO `blog_reply` VALUES (32, 1, 25, '<a href=\"javascript:void(0);\" target=\"_blank\" class=\"at-me\">@ChoxSu</a> 你好啊', '2019-05-25 10:37:54', 0);
INSERT INTO `blog_reply` VALUES (33, 1, 15, 'adfa', '2019-05-25 13:56:22', 0);
INSERT INTO `blog_reply` VALUES (34, 1, 15, 'fadsfasdf', '2019-05-25 13:56:24', 0);
INSERT INTO `blog_reply` VALUES (35, 1, 15, 'dfasdfasfsd', '2019-05-25 13:56:27', 0);
INSERT INTO `blog_reply` VALUES (36, 1, 15, 'adfadsfads', '2019-05-25 13:56:29', 0);
INSERT INTO `blog_reply` VALUES (37, 1, 15, 'dfasdfasdf', '2019-05-25 13:56:31', 0);
INSERT INTO `blog_reply` VALUES (38, 1, 37, 'afasdf', '2019-05-25 15:00:46', 0);

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `status` int(4) NOT NULL DEFAULT 0 COMMENT '是否有效；0是1否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, 'JAVA', 0);
INSERT INTO `blog_tag` VALUES (3, 'JavaScript', 0);
INSERT INTO `blog_tag` VALUES (5, 'Nginx', 0);
INSERT INTO `blog_tag` VALUES (8, 'Mysql', 0);
INSERT INTO `blog_tag` VALUES (9, 'SQL', 0);
INSERT INTO `blog_tag` VALUES (11, '读书笔记', 0);
INSERT INTO `blog_tag` VALUES (12, 'JAVA基础', 0);
INSERT INTO `blog_tag` VALUES (15, 'Tomcat', 0);
INSERT INTO `blog_tag` VALUES (16, '服务器', 0);
INSERT INTO `blog_tag` VALUES (18, 'Linux', 0);
INSERT INTO `blog_tag` VALUES (20, 'Jfinal', 0);
INSERT INTO `blog_tag` VALUES (23, 'SpringBoot', 0);
INSERT INTO `blog_tag` VALUES (24, 'SpringCloud', 0);
INSERT INTO `blog_tag` VALUES (25, 'Vue', 0);
INSERT INTO `blog_tag` VALUES (26, 'Redis', 0);

-- ----------------------------
-- Table structure for code_config
-- ----------------------------
DROP TABLE IF EXISTS `code_config`;
CREATE TABLE `code_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `base_package` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基础包名',
  `entity_package` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体包名',
  `service_package` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'service包名',
  `entity_base_package` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体基础包',
  `is_clear_prefix` tinyint(1) NULL DEFAULT NULL COMMENT '是否去除前缀',
  `prefix` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `is_generate_chain_setter` tinyint(1) NULL DEFAULT NULL COMMENT 'BaseModel 是否生成链式 setter 方法',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_config
-- ----------------------------
INSERT INTO `code_config` VALUES (1, NULL, 'com.choxsu', 'entity', NULL, 'entity.base', 0, NULL, 1, NULL, '2019-06-25 21:05:30');

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `accountId` int(11) NOT NULL COMMENT '账户ID',
  `friendId` int(11) NOT NULL COMMENT '朋友账户ID',
  `createAt` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`accountId`, `friendId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) NOT NULL COMMENT '上传者',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片原始名称',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片类型',
  `created` int(255) NOT NULL COMMENT '创建时间',
  `source` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `file_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片上厂记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (27, 1, '/upload/img/article/0/1_20181222230313.jpeg', '1_20181222230313.jpeg', '.jpeg', 1545490993, '', '0', '1545490993541.jpeg');
INSERT INTO `images` VALUES (28, 1, '/upload/img/article/0/1_20181222230334.jpeg', '1_20181222230334.jpeg', '.jpeg', 1545491014, '', '0', '1545491014660.jpeg');
INSERT INTO `images` VALUES (29, 1, '/upload/img/article/0/1_20181222230548.jpeg', '1_20181222230548.jpeg', '.jpeg', 1545491148, '', '0', '1545491148014.jpeg');
INSERT INTO `images` VALUES (30, 1, '/upload/img/article/0/1_20181222233320.jpeg', '1_20181222233320.jpeg', '.jpeg', 1545492800, '', '5594', '1545492800236.jpeg');
INSERT INTO `images` VALUES (31, 1, '/upload/img/article/0/1_20181222233334.jpeg', '1_20181222233334.jpeg', '.jpeg', 1545492814, '', '5245', '1545492814226.jpeg');
INSERT INTO `images` VALUES (32, 1, '/upload/img/article/0/1_20181222233451.jpeg', '1_20181222233451.jpeg', '.jpeg', 1545492891, '', '12210', '1545492891560.jpeg');
INSERT INTO `images` VALUES (33, 1, '/upload/img/article/0/1_20181222233512.jpeg', '1_20181222233512.jpeg', '.jpeg', 1545492912, '', '23392', '1545492912496.jpeg');
INSERT INTO `images` VALUES (34, 1, '/upload/img/article/0/1_20181222233525.jpeg', '1_20181222233525.jpeg', '.jpeg', 1545492925, '', '30477', '1545492925261.jpeg');
INSERT INTO `images` VALUES (35, 1, '/upload/img/article/0/1_20181222233537.jpeg', '1_20181222233537.jpeg', '.jpeg', 1545492937, '', '20716', '1545492937326.jpeg');
INSERT INTO `images` VALUES (36, 1, '/upload/img/article/0/1_20181222233548.jpeg', '1_20181222233548.jpeg', '.jpeg', 1545492948, '', '7279', '1545492947991.jpeg');
INSERT INTO `images` VALUES (37, 1, '/upload/img/article/0/1_20181222233600.jpeg', '1_20181222233600.jpeg', '.jpeg', 1545492960, '', '9365', '1545492960530.jpeg');
INSERT INTO `images` VALUES (38, 1, '/upload/img/article/0/1_20181222233630.jpeg', '1_20181222233630.jpeg', '.jpeg', 1545492990, '', '25817', '1545492990450.jpeg');
INSERT INTO `images` VALUES (39, 1, '/upload/img/article/0/1_20181222233657.jpeg', '1_20181222233657.jpeg', '.jpeg', 1545493017, '', '15285', '1545493017959.jpeg');
INSERT INTO `images` VALUES (40, 1, '/upload/img/article/0/1_20181222233718.jpeg', '1_20181222233718.jpeg', '.jpeg', 1545493038, '', '45331', '1545493038182.jpeg');
INSERT INTO `images` VALUES (41, 1, '/upload/img/article/0/1_20181222233725.jpeg', '1_20181222233725.jpeg', '.jpeg', 1545493045, '', '15476', '1545493045869.jpeg');
INSERT INTO `images` VALUES (42, 1, '/upload/img/article/0/1_20181222233729.jpeg', '1_20181222233729.jpeg', '.jpeg', 1545493049, '', '15476', '1545493049439.jpeg');
INSERT INTO `images` VALUES (43, 1, '/upload/img/article/0/1_20181222234237.jpeg', '1_20181222234237.jpeg', '.jpeg', 1545493357, '', '14754', '1545493357388.jpeg');
INSERT INTO `images` VALUES (44, 1, '/upload/img/article/0/1_20181222234305.jpeg', '1_20181222234305.jpeg', '.jpeg', 1545493385, '', '13566', '1545493385715.jpeg');
INSERT INTO `images` VALUES (45, 1, '/upload/img/article/0/1_20181222234330.jpeg', '1_20181222234330.jpeg', '.jpeg', 1545493410, '', '47704', '1545493410781.jpeg');
INSERT INTO `images` VALUES (46, 1, '/upload/img/article/0/1_20181222234343.jpeg', '1_20181222234343.jpeg', '.jpeg', 1545493423, '', '43783', '1545493423406.jpeg');
INSERT INTO `images` VALUES (47, 1, '/upload/img/article/0/1_20181222235228.jpg', '1_20181222235228.jpg', '.jpg', 1545493948, '', '141735', 'c.jpg');
INSERT INTO `images` VALUES (48, 1, '/upload/img/article/0/1_20181223000017.jpeg', '1_20181223000017.jpeg', '.jpeg', 1545494417, '', '64556', '1545494417439.jpeg');
INSERT INTO `images` VALUES (49, 1, '/upload/img/article/0/1_20181223000024.jpeg', '1_20181223000024.jpeg', '.jpeg', 1545494424, '', '22179', '1545494424047.jpeg');
INSERT INTO `images` VALUES (50, 1, '/upload/img/article/0/1_20181223000445.jpeg', '1_20181223000445.jpeg', '.jpeg', 1545494685, '', '133195', '1545494685501.jpeg');
INSERT INTO `images` VALUES (51, 1, '/upload/img/article/0/1_20181223001002.png', '1_20181223001002.png', '.png', 1545495002, '', '55220', '1545495013080.png');
INSERT INTO `images` VALUES (52, 1, '/upload/img/article/0/1_20181223001033.png', '1_20181223001033.png', '.png', 1545495033, '', '23413', '1545495043709.png');
INSERT INTO `images` VALUES (53, 1, '/upload/img/article/0/1_20181223001045.png', '1_20181223001045.png', '.png', 1545495045, '', '26973', '1545495055992.png');
INSERT INTO `images` VALUES (54, 1, '/upload/img/article/0/1_20181223001117.png', '1_20181223001117.png', '.png', 1545495077, '', '38897', '1545495087472.png');
INSERT INTO `images` VALUES (55, 1, '/upload/img/article/0/1_20181223001128.png', '1_20181223001128.png', '.png', 1545495088, '', '42917', '1545495099248.png');
INSERT INTO `images` VALUES (56, 1, '/upload/img/article/0/1_20181223001143.png', '1_20181223001143.png', '.png', 1545495103, '', '6732', '1545495113988.png');
INSERT INTO `images` VALUES (57, 1, '/upload/img/article/0/1_20181223001151.png', '1_20181223001151.png', '.png', 1545495111, '', '40637', '1545495121962.png');
INSERT INTO `images` VALUES (58, 1, '/upload/img/article/0/1_20181223001201.png', '1_20181223001201.png', '.png', 1545495121, '', '56626', '1545495131800.png');
INSERT INTO `images` VALUES (59, 1, '/upload/img/article/0/1_20181223001221.png', '1_20181223001221.png', '.png', 1545495141, '', '43202', '1545495151667.png');
INSERT INTO `images` VALUES (60, 1, '/upload/img/article/0/1_20181223001242.png', '1_20181223001242.png', '.png', 1545495162, '', '7300', '1545495173214.png');
INSERT INTO `images` VALUES (61, 1, '/upload/img/article/0/1_20181223001302.png', '1_20181223001302.png', '.png', 1545495182, '', '3446', '1545495192700.png');
INSERT INTO `images` VALUES (62, 1, '/upload/img/article/0/1_20181223001311.png', '1_20181223001311.png', '.png', 1545495191, '', '46768', '1545495202111.png');
INSERT INTO `images` VALUES (63, 1, '/upload/img/article/0/1_20181223001329.png', '1_20181223001329.png', '.png', 1545495209, '', '21796', '1545495220132.png');
INSERT INTO `images` VALUES (64, 1, '/upload/img/article/0/1_20181223001345.png', '1_20181223001345.png', '.png', 1545495225, '', '8270', '1545495235878.png');
INSERT INTO `images` VALUES (65, 1, '/upload/img/article/0/1_20181223001400.png', '1_20181223001400.png', '.png', 1545495240, '', '21961', '1545495251020.png');
INSERT INTO `images` VALUES (66, 1, '/upload/img/article/0/1_20181223001405.png', '1_20181223001405.png', '.png', 1545495245, '', '21961', '1545495255794.png');
INSERT INTO `images` VALUES (67, 1, '/upload/img/article/0/1_20190403145554.png', '1_20190403145554.png', '.png', 1554274554, '', '15867', '1554274557093.png');
INSERT INTO `images` VALUES (68, 1, '/upload/img/article/0/1_20190403145713.png', '1_20190403145713.png', '.png', 1554274633, '', '15867', '1554274635536.png');
INSERT INTO `images` VALUES (69, 1, '/upload/img/article/0/1_20190403145740.png', '1_20190403145740.png', '.png', 1554274660, '', '32858', '1554274662664.png');
INSERT INTO `images` VALUES (70, 1, '/upload/img/article/0/1_20190427094201.png', '1_20190427094201.png', '.png', 1556329321, '', '82190', 'mysql5.7下载.png');
INSERT INTO `images` VALUES (71, 1, '/upload/img/article/0/1_20190427094215.png', '1_20190427094215.png', '.png', 1556329335, '', '58272', 'mysql5.7下载2.png');
INSERT INTO `images` VALUES (72, 1, '/upload/img/article/0/1_20190427100645.png', '1_20190427100645.png', '.png', 1556330805, '', '11568', '3.png');
INSERT INTO `images` VALUES (73, 1, '/upload/img/article/0/1_20190427101359.png', '1_20190427101359.png', '.png', 1556331240, '', '17158', '4.png');
INSERT INTO `images` VALUES (74, 1, '/upload/img/article/0/1_20190427101402.png', '1_20190427101402.png', '.png', 1556331242, '', '40806', '5.png');
INSERT INTO `images` VALUES (75, 1, '/upload/img/article/0/1_20190427101422.png', '1_20190427101422.png', '.png', 1556331262, '', '17158', '4.png');
INSERT INTO `images` VALUES (76, 1, '/upload/img/article/0/1_20190427101447.png', '1_20190427101447.png', '.png', 1556331287, '', '29467', '6.png');
INSERT INTO `images` VALUES (77, 1, '/upload/img/article/0/1_20190427102123.png', '1_20190427102123.png', '.png', 1556331683, '', '14323', '1556331687433.png');
INSERT INTO `images` VALUES (78, 1, '/upload/img/article/0/1_20190427102140.png', '1_20190427102140.png', '.png', 1556331700, '', '14323', '1556331704466.png');
INSERT INTO `images` VALUES (79, 1, '/upload/img/article/0/1_20190427102540.png', '1_20190427102540.png', '.png', 1556331940, '', '45978', '8.png');
INSERT INTO `images` VALUES (80, 1, '/upload/img/article/0/1_20190427104024.png', '1_20190427104024.png', '.png', 1556332824, '', '8976', '1556332828782.png');
INSERT INTO `images` VALUES (81, 1, '/upload/img/article/0/1_20190427104036.png', '1_20190427104036.png', '.png', 1556332836, '', '17895', '9.png');
INSERT INTO `images` VALUES (82, 1, '/upload/img/article/0/1_20190427104443.png', '1_20190427104443.png', '.png', 1556333083, '', '4615', '1556333087316.png');
INSERT INTO `images` VALUES (83, 1, '/upload/img/article/0/1_20190427104956.png', '1_20190427104956.png', '.png', 1556333396, '', '22530', '11.png');
INSERT INTO `images` VALUES (84, 1, '/upload/img/article/0/1_20190427105145.png', '1_20190427105145.png', '.png', 1556333505, '', '2908', '12.png');
INSERT INTO `images` VALUES (85, 1, '/upload/img/article/0/1_20190427105240.png', '1_20190427105240.png', '.png', 1556333560, '', '26571', '1556333564728.png');
INSERT INTO `images` VALUES (86, 1, '/upload/img/article/0/1_20190427113735.png', '1_20190427113735.png', '.png', 1556336255, '', '2908', '12.png');
INSERT INTO `images` VALUES (87, 1, '/upload/img/article/0/1_20190427114334.png', '1_20190427114334.png', '.png', 1556336614, '', '22530', '11.png');
INSERT INTO `images` VALUES (88, 1, '/upload/img/article/0/1_20190427114925.png', '1_20190427114925.png', '.png', 1556336965, '', '22530', '11.png');
INSERT INTO `images` VALUES (89, 1, '/upload/img/article/0/1_20190427115206.png', '1_20190427115206.png', '.png', 1556337126, '', '29467', '6.png');
INSERT INTO `images` VALUES (90, 1, '/upload/img/article/0/1_20190427115450.png', '1_20190427115450.png', '.png', 1556337290, '', '196743', '1556337290605.png');
INSERT INTO `images` VALUES (91, 1, '/upload/img/article/0/1_20190427115627.png', '1_20190427115627.png', '.png', 1556337387, '', '56711', '1556337387968.png');
INSERT INTO `images` VALUES (92, 1, '/upload/img/article/0/1_20190427115733.png', '1_20190427115733.png', '.png', 1556337453, '', '56711', '1556337453438.png');
INSERT INTO `images` VALUES (93, 1, '/upload/img/article/0/1_20190427120344.png', '1_20190427120344.png', '.png', 1556337824, '', '123835', '1556337824711.png');
INSERT INTO `images` VALUES (94, 1, '/upload/img/article/0/1_20190427121934.png', '1_20190427121934.png', '.png', 1556338774, '', '22530', '11.png');
INSERT INTO `images` VALUES (95, 1, '/upload/img/article/0/1_20190427124426.png', '1_20190427124426.png', '.png', 1556340266, '', '123835', '1556340266010.png');

-- ----------------------------
-- Table structure for ip_repository
-- ----------------------------
DROP TABLE IF EXISTS `ip_repository`;
CREATE TABLE `ip_repository`  (
  `id` bigint(20) NOT NULL COMMENT ' ',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域2',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `county` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `isp` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `country_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `area_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isp_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'IP库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ip_repository
-- ----------------------------
INSERT INTO `ip_repository` VALUES (68832667423997952, '127.0.0.1', 'XX', '', 'XX', '内网IP', '内网IP', '内网IP', 'xx', '', 'xx', 'local', 'local', 'local', '2019-06-12 12:41:39');

-- ----------------------------
-- Table structure for job_manager
-- ----------------------------
DROP TABLE IF EXISTS `job_manager`;
CREATE TABLE `job_manager`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `clazz` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类名',
  `cron_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '定时表达式',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`, `group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `accountId` int(11) NOT NULL,
  `loginAt` datetime(0) NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `accountId_index`(`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, '2018-06-14 17:44:44', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-14 17:57:45', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-14 17:59:19', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-14 18:03:55', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:06:59', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:17:36', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:24:32', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-14 18:31:49', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-14 22:19:45', '106.87.4.147');
INSERT INTO `login_log` VALUES (1, '2018-06-14 22:26:24', '106.87.4.147');
INSERT INTO `login_log` VALUES (1, '2018-06-14 22:31:25', '106.87.4.147');
INSERT INTO `login_log` VALUES (1, '2018-06-14 22:40:54', '106.87.4.147');
INSERT INTO `login_log` VALUES (1, '2018-06-19 12:36:15', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-19 12:49:11', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-19 13:29:13', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-19 13:56:03', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-19 14:57:13', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-20 10:37:33', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-20 11:10:59', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-20 21:42:44', '106.87.5.52');
INSERT INTO `login_log` VALUES (1, '2018-06-25 19:40:01', '125.82.15.51');
INSERT INTO `login_log` VALUES (1, '2018-06-26 09:18:54', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 09:29:05', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 09:38:11', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 09:55:01', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 09:58:35', '183.64.28.18');
INSERT INTO `login_log` VALUES (2, '2018-06-26 10:48:21', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 11:55:07', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 12:00:31', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-06-26 16:53:04', '47.74.0.27');
INSERT INTO `login_log` VALUES (1, '2018-07-05 08:51:12', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 10:34:16', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 12:47:31', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 17:59:24', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 18:22:25', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 18:23:16', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 18:37:11', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 18:40:21', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-05 21:29:52', '106.87.7.88');
INSERT INTO `login_log` VALUES (1, '2018-07-05 22:04:44', '106.87.7.88');
INSERT INTO `login_log` VALUES (1, '2018-07-05 22:04:44', '106.87.7.88');
INSERT INTO `login_log` VALUES (1, '2018-07-05 22:04:44', '106.87.7.88');
INSERT INTO `login_log` VALUES (1, '2018-07-09 08:51:54', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-09 09:55:42', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-09 10:18:39', '47.74.16.178');
INSERT INTO `login_log` VALUES (1, '2018-07-09 10:46:44', '164.52.13.51');
INSERT INTO `login_log` VALUES (1, '2018-07-09 19:41:46', '47.74.16.178');
INSERT INTO `login_log` VALUES (1, '2018-07-13 09:01:07', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-13 11:09:16', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-13 11:41:52', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-16 11:52:10', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-17 11:10:11', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-18 10:25:19', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-23 11:01:04', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-23 11:09:52', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-23 11:09:52', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-23 11:09:52', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-23 12:58:06', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-07-25 10:32:43', '45.77.182.136');
INSERT INTO `login_log` VALUES (1, '2018-08-06 16:10:02', '125.84.220.230');
INSERT INTO `login_log` VALUES (1, '2018-08-28 08:48:51', '125.84.221.49');
INSERT INTO `login_log` VALUES (1, '2018-09-04 12:07:43', '125.84.223.79');
INSERT INTO `login_log` VALUES (1, '2018-09-10 13:42:42', '125.86.83.173');
INSERT INTO `login_log` VALUES (1, '2018-09-10 15:24:51', '125.86.83.173');
INSERT INTO `login_log` VALUES (1, '2018-09-13 16:25:03', '159.65.133.239');
INSERT INTO `login_log` VALUES (1, '2018-09-13 16:25:41', '159.65.133.239');
INSERT INTO `login_log` VALUES (1, '2018-09-21 09:19:40', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-21 09:20:04', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-21 09:21:09', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-21 09:22:07', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-22 18:46:34', '106.87.8.54');
INSERT INTO `login_log` VALUES (1, '2018-09-22 18:49:20', '106.87.8.54');
INSERT INTO `login_log` VALUES (1, '2018-09-22 18:56:47', '106.87.8.54');
INSERT INTO `login_log` VALUES (1, '2018-09-27 10:49:55', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-27 11:42:57', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-09-27 12:04:02', '183.64.28.18');
INSERT INTO `login_log` VALUES (3, '2018-09-27 12:05:41', '183.64.28.18');
INSERT INTO `login_log` VALUES (3, '2018-09-27 13:13:37', '125.86.80.222');
INSERT INTO `login_log` VALUES (3, '2018-09-29 08:56:22', '117.136.110.237');
INSERT INTO `login_log` VALUES (3, '2018-10-11 20:37:10', '106.87.5.191');
INSERT INTO `login_log` VALUES (1, '2018-10-11 20:38:36', '106.87.5.191');
INSERT INTO `login_log` VALUES (1, '2018-10-17 16:51:30', '125.86.83.209');
INSERT INTO `login_log` VALUES (1, '2018-10-22 09:36:27', '125.86.82.42');
INSERT INTO `login_log` VALUES (3, '2018-10-24 11:59:05', '124.205.77.28');
INSERT INTO `login_log` VALUES (3, '2018-11-07 10:40:59', '171.118.182.51');
INSERT INTO `login_log` VALUES (1, '2018-11-07 11:29:25', '45.76.78.184');
INSERT INTO `login_log` VALUES (3, '2018-11-13 11:16:03', '121.237.212.112');
INSERT INTO `login_log` VALUES (3, '2018-11-24 16:10:40', '27.47.194.199');
INSERT INTO `login_log` VALUES (1, '2018-11-26 12:49:14', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:43:47', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:44:32', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:45:24', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:52:57', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:54:59', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 21:59:00', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-11-28 22:30:01', '127.0.0.1');
INSERT INTO `login_log` VALUES (3, '2018-11-30 09:13:20', '127.0.0.1');
INSERT INTO `login_log` VALUES (3, '2018-11-30 10:52:28', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2018-12-20 20:47:30', '106.87.6.236');
INSERT INTO `login_log` VALUES (1, '2018-12-20 21:01:49', '106.87.6.236');
INSERT INTO `login_log` VALUES (1, '2018-12-20 21:02:37', '106.87.6.236');
INSERT INTO `login_log` VALUES (1, '2018-12-20 23:56:03', '106.87.6.236');
INSERT INTO `login_log` VALUES (1, '2018-12-21 17:45:38', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-21 23:47:47', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 00:04:31', '106.87.4.43');
INSERT INTO `login_log` VALUES (3, '2018-12-22 00:06:04', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 10:28:10', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 11:36:30', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 12:23:00', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 12:23:16', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 13:54:47', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 23:00:18', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 23:31:04', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-22 23:56:48', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-23 00:09:04', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-23 00:30:26', '106.87.4.43');
INSERT INTO `login_log` VALUES (3, '2018-12-23 00:42:41', '106.87.4.43');
INSERT INTO `login_log` VALUES (1, '2018-12-23 14:57:42', '106.87.5.176');
INSERT INTO `login_log` VALUES (1, '2018-12-23 16:00:39', '106.87.5.176');
INSERT INTO `login_log` VALUES (1, '2018-12-24 10:24:11', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-24 22:53:00', '106.87.5.176');
INSERT INTO `login_log` VALUES (1, '2018-12-24 23:42:34', '106.87.5.176');
INSERT INTO `login_log` VALUES (4, '2018-12-25 08:58:13', '178.128.57.158');
INSERT INTO `login_log` VALUES (1, '2018-12-25 08:58:45', '178.128.57.158');
INSERT INTO `login_log` VALUES (1, '2018-12-25 09:08:29', '178.128.57.158');
INSERT INTO `login_log` VALUES (3, '2018-12-25 14:42:44', '113.246.154.137');
INSERT INTO `login_log` VALUES (1, '2018-12-25 15:58:10', '125.86.80.22');
INSERT INTO `login_log` VALUES (1, '2018-12-25 17:52:53', '125.86.80.69');
INSERT INTO `login_log` VALUES (1, '2018-12-25 21:24:45', '106.87.10.157');
INSERT INTO `login_log` VALUES (1, '2018-12-26 13:51:01', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-26 13:56:20', '47.74.2.57');
INSERT INTO `login_log` VALUES (3, '2018-12-26 14:26:33', '112.232.242.195');
INSERT INTO `login_log` VALUES (1, '2018-12-26 14:36:38', '183.64.28.18');
INSERT INTO `login_log` VALUES (1, '2018-12-26 14:58:01', '125.86.83.250');
INSERT INTO `login_log` VALUES (3, '2018-12-26 15:23:52', '125.86.81.191');
INSERT INTO `login_log` VALUES (1, '2018-12-26 17:23:28', '125.86.81.191');
INSERT INTO `login_log` VALUES (3, '2018-12-26 20:46:56', '125.86.83.250');
INSERT INTO `login_log` VALUES (1, '2018-12-26 22:38:24', '106.87.11.3');
INSERT INTO `login_log` VALUES (1, '2018-12-26 22:44:50', '106.87.11.3');
INSERT INTO `login_log` VALUES (3, '2018-12-26 22:48:36', '106.87.11.3');
INSERT INTO `login_log` VALUES (1, '2018-12-26 22:49:43', '106.87.11.3');
INSERT INTO `login_log` VALUES (3, '2018-12-27 08:41:23', '125.86.81.191');
INSERT INTO `login_log` VALUES (1, '2018-12-27 08:42:31', '125.86.81.191');
INSERT INTO `login_log` VALUES (1, '2018-12-27 13:24:51', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-27 14:14:03', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-27 14:28:21', '47.74.2.57');
INSERT INTO `login_log` VALUES (1, '2018-12-27 16:21:32', '47.52.92.207');
INSERT INTO `login_log` VALUES (2, '2018-12-27 16:27:52', '47.52.92.207');
INSERT INTO `login_log` VALUES (1, '2018-12-27 16:28:05', '47.52.92.207');
INSERT INTO `login_log` VALUES (3, '2018-12-29 21:02:54', '125.84.220.205');
INSERT INTO `login_log` VALUES (3, '2019-01-01 01:05:40', '123.9.167.232');
INSERT INTO `login_log` VALUES (3, '2019-01-01 18:40:20', '125.86.82.234');
INSERT INTO `login_log` VALUES (3, '2019-01-02 23:20:22', '125.84.220.152');
INSERT INTO `login_log` VALUES (3, '2019-01-03 16:49:21', '183.95.255.210');
INSERT INTO `login_log` VALUES (1, '2019-01-07 16:17:27', '125.84.220.50');
INSERT INTO `login_log` VALUES (3, '2019-01-07 16:18:36', '61.51.60.152');
INSERT INTO `login_log` VALUES (3, '2019-01-07 16:19:08', '61.51.60.152');
INSERT INTO `login_log` VALUES (1, '2019-01-07 17:01:55', '125.84.220.50');
INSERT INTO `login_log` VALUES (1, '2019-01-08 17:23:17', '47.74.2.57');
INSERT INTO `login_log` VALUES (3, '2019-01-08 17:30:06', '47.52.92.207');
INSERT INTO `login_log` VALUES (1, '2019-01-08 17:31:00', '47.52.92.207');
INSERT INTO `login_log` VALUES (3, '2019-01-08 17:32:00', '47.74.2.57');
INSERT INTO `login_log` VALUES (3, '2019-01-08 18:41:27', '47.52.92.207');
INSERT INTO `login_log` VALUES (1, '2019-01-08 19:07:46', '45.77.182.136');
INSERT INTO `login_log` VALUES (3, '2019-01-09 09:24:04', '45.77.182.136');
INSERT INTO `login_log` VALUES (1, '2019-01-09 09:46:08', '45.77.182.136');
INSERT INTO `login_log` VALUES (3, '2019-01-09 12:45:21', '125.86.83.1');
INSERT INTO `login_log` VALUES (1, '2019-01-09 17:00:58', '125.86.83.189');
INSERT INTO `login_log` VALUES (3, '2019-01-10 17:32:59', '182.242.190.146');
INSERT INTO `login_log` VALUES (3, '2019-01-10 21:48:01', '106.87.11.44');
INSERT INTO `login_log` VALUES (1, '2019-01-15 22:41:03', '106.87.8.125');
INSERT INTO `login_log` VALUES (1, '2019-01-21 14:41:54', '125.84.220.70');
INSERT INTO `login_log` VALUES (1, '2019-01-22 13:49:12', '125.84.220.70');
INSERT INTO `login_log` VALUES (1, '2019-01-28 14:42:28', '125.86.81.227');
INSERT INTO `login_log` VALUES (1, '2019-01-29 09:17:00', '125.86.81.227');
INSERT INTO `login_log` VALUES (1, '2019-01-29 11:31:22', '125.86.81.227');
INSERT INTO `login_log` VALUES (3, '2019-01-30 09:18:44', '125.84.221.69');
INSERT INTO `login_log` VALUES (3, '2019-01-30 10:04:20', '125.84.222.37');
INSERT INTO `login_log` VALUES (1, '2019-01-30 15:22:57', '125.84.221.69');
INSERT INTO `login_log` VALUES (1, '2019-01-31 13:34:31', '125.84.221.69');
INSERT INTO `login_log` VALUES (1, '2019-01-31 16:36:30', '125.84.222.37');
INSERT INTO `login_log` VALUES (1, '2019-01-31 17:08:49', '125.84.221.69');
INSERT INTO `login_log` VALUES (1, '2019-02-01 09:38:46', '125.86.83.75');
INSERT INTO `login_log` VALUES (1, '2019-02-01 09:48:54', '125.86.83.75');
INSERT INTO `login_log` VALUES (1, '2019-02-01 11:47:30', '125.86.80.229');
INSERT INTO `login_log` VALUES (3, '2019-02-12 09:21:20', '124.202.206.114');
INSERT INTO `login_log` VALUES (1, '2019-02-17 15:42:09', '106.87.10.148');
INSERT INTO `login_log` VALUES (3, '2019-02-23 17:49:04', '36.57.130.232');
INSERT INTO `login_log` VALUES (3, '2019-02-23 18:03:48', '36.57.130.232');
INSERT INTO `login_log` VALUES (1, '2019-03-02 18:51:38', '106.87.6.162');
INSERT INTO `login_log` VALUES (3, '2019-03-14 16:57:38', '211.97.131.140');
INSERT INTO `login_log` VALUES (3, '2019-03-14 17:52:25', '211.97.131.140');
INSERT INTO `login_log` VALUES (3, '2019-03-25 17:34:10', '183.14.30.243');
INSERT INTO `login_log` VALUES (3, '2019-03-26 20:27:21', '106.87.10.172');
INSERT INTO `login_log` VALUES (1, '2019-03-28 17:57:19', '222.182.195.249');
INSERT INTO `login_log` VALUES (1, '2019-04-02 21:48:17', '106.87.8.13');
INSERT INTO `login_log` VALUES (1, '2019-04-03 14:54:33', '106.87.8.13');
INSERT INTO `login_log` VALUES (1, '2019-04-03 15:40:56', '106.87.8.13');
INSERT INTO `login_log` VALUES (1, '2019-04-03 17:11:53', '106.87.8.13');
INSERT INTO `login_log` VALUES (1, '2019-04-03 19:25:55', '106.87.8.13');
INSERT INTO `login_log` VALUES (3, '2019-04-04 10:52:26', '211.97.128.216');
INSERT INTO `login_log` VALUES (1, '2019-04-10 20:10:01', '106.87.5.64');
INSERT INTO `login_log` VALUES (1, '2019-04-12 21:06:25', '106.87.7.187');
INSERT INTO `login_log` VALUES (3, '2019-04-19 10:39:56', '223.75.169.35');
INSERT INTO `login_log` VALUES (3, '2019-04-25 12:05:27', '122.193.173.140');
INSERT INTO `login_log` VALUES (1, '2019-04-26 18:21:29', '113.206.204.108');
INSERT INTO `login_log` VALUES (1, '2019-04-26 18:25:00', '113.206.204.108');
INSERT INTO `login_log` VALUES (5, '2019-04-26 18:30:28', '113.206.204.108');
INSERT INTO `login_log` VALUES (1, '2019-04-26 18:31:15', '113.206.204.108');
INSERT INTO `login_log` VALUES (1, '2019-04-27 09:28:41', '106.87.6.232');
INSERT INTO `login_log` VALUES (1, '2019-04-27 11:35:49', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 12:42:53', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 14:02:25', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 14:36:11', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 14:36:50', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 14:47:12', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-04-27 21:04:19', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-05-13 22:44:20', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-05-17 20:05:00', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (6, '2019-05-19 17:09:35', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (7, '2019-05-19 17:11:01', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-05-19 17:57:43', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-05-19 18:13:18', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-05-25 08:42:08', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-06-06 15:00:55', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2019-06-12 13:01:20', '127.0.0.1');
INSERT INTO `login_log` VALUES (1, '2019-06-13 16:54:57', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-06-25 21:03:39', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES (1, '2019-07-14 11:47:34', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user` int(11) NOT NULL COMMENT '消息的主人',
  `friend` int(11) NOT NULL COMMENT '对方的ID',
  `sender` int(11) NOT NULL COMMENT '发送者',
  `receiver` int(11) NOT NULL COMMENT '接收者',
  `type` tinyint(2) NOT NULL COMMENT '0：普通消息，1：系统消息',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细内容',
  `createAt` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news_feed
-- ----------------------------
DROP TABLE IF EXISTS `news_feed`;
CREATE TABLE `news_feed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL COMMENT '动态创建者',
  `refType` tinyint(2) NOT NULL COMMENT '动态引用类型',
  `refId` int(11) NOT NULL DEFAULT 0 COMMENT '动态引用所关联的 id',
  `refParentType` tinyint(2) NOT NULL DEFAULT 0 COMMENT 'reply所属的贴子类型, 与type 字段填的值一样',
  `refParentId` int(11) NOT NULL DEFAULT 0,
  `createAt` datetime(0) NOT NULL COMMENT '动态创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_feed
-- ----------------------------
INSERT INTO `news_feed` VALUES (1, 1, 4, 1, 3, 44, '2019-05-25 08:44:32');
INSERT INTO `news_feed` VALUES (2, 1, 4, 2, 3, 44, '2019-05-25 08:57:52');
INSERT INTO `news_feed` VALUES (3, 1, 4, 3, 3, 44, '2019-05-25 09:00:44');
INSERT INTO `news_feed` VALUES (4, 1, 4, 4, 3, 37, '2019-05-25 09:01:44');
INSERT INTO `news_feed` VALUES (5, 1, 4, 5, 3, 44, '2019-05-25 09:24:02');
INSERT INTO `news_feed` VALUES (6, 1, 4, 6, 3, 15, '2019-05-25 09:31:34');
INSERT INTO `news_feed` VALUES (7, 1, 4, 7, 3, 15, '2019-05-25 09:34:50');
INSERT INTO `news_feed` VALUES (8, 1, 4, 8, 3, 15, '2019-05-25 09:37:26');
INSERT INTO `news_feed` VALUES (9, 1, 4, 9, 3, 15, '2019-05-25 09:38:36');
INSERT INTO `news_feed` VALUES (10, 1, 4, 10, 3, 15, '2019-05-25 09:38:55');
INSERT INTO `news_feed` VALUES (11, 1, 4, 11, 3, 15, '2019-05-25 09:39:24');
INSERT INTO `news_feed` VALUES (12, 1, 4, 12, 3, 15, '2019-05-25 09:40:47');
INSERT INTO `news_feed` VALUES (13, 1, 4, 13, 3, 15, '2019-05-25 09:42:00');
INSERT INTO `news_feed` VALUES (14, 1, 4, 14, 3, 15, '2019-05-25 09:45:22');
INSERT INTO `news_feed` VALUES (15, 1, 4, 15, 3, 15, '2019-05-25 09:46:01');
INSERT INTO `news_feed` VALUES (16, 1, 4, 16, 3, 15, '2019-05-25 09:48:41');
INSERT INTO `news_feed` VALUES (28, 1, 4, 28, 3, 16, '2019-05-25 10:25:24');
INSERT INTO `news_feed` VALUES (29, 1, 4, 29, 3, 16, '2019-05-25 10:28:50');
INSERT INTO `news_feed` VALUES (30, 1, 4, 30, 3, 25, '2019-05-25 10:29:20');
INSERT INTO `news_feed` VALUES (31, 1, 4, 31, 3, 25, '2019-05-25 10:32:09');
INSERT INTO `news_feed` VALUES (32, 1, 4, 32, 3, 25, '2019-05-25 10:37:54');
INSERT INTO `news_feed` VALUES (33, 1, 4, 33, 3, 15, '2019-05-25 13:56:22');
INSERT INTO `news_feed` VALUES (34, 1, 4, 34, 3, 15, '2019-05-25 13:56:24');
INSERT INTO `news_feed` VALUES (35, 1, 4, 35, 3, 15, '2019-05-25 13:56:27');
INSERT INTO `news_feed` VALUES (36, 1, 4, 36, 3, 15, '2019-05-25 13:56:29');
INSERT INTO `news_feed` VALUES (37, 1, 4, 37, 3, 15, '2019-05-25 13:56:31');
INSERT INTO `news_feed` VALUES (38, 1, 4, 38, 3, 37, '2019-05-25 15:00:46');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionKey` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `controller` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (230, '/admin', 'com.choxsu.admin.index.IndexAdminController', '后台首页');
INSERT INTO `permission` VALUES (231, '/admin/account', 'com.choxsu.admin.account.AccountAdminController', '账户首页');
INSERT INTO `permission` VALUES (232, '/admin/account/add', 'com.choxsu.admin.account.AccountAdminController', '账户添加页面');
INSERT INTO `permission` VALUES (233, '/admin/account/addRole', 'com.choxsu.admin.account.AccountAdminController', '账户角色添加');
INSERT INTO `permission` VALUES (234, '/admin/account/assignRoles', 'com.choxsu.admin.account.AccountAdminController', '账户分配角色页面');
INSERT INTO `permission` VALUES (235, '/admin/account/del', 'com.choxsu.admin.account.AccountAdminController', '账户删除');
INSERT INTO `permission` VALUES (236, '/admin/account/delTemFile', 'com.choxsu.admin.account.AccountAdminController', '删除存放临时目录的图片文件');
INSERT INTO `permission` VALUES (237, '/admin/account/deleteRole', 'com.choxsu.admin.account.AccountAdminController', '账户角色删除');
INSERT INTO `permission` VALUES (238, '/admin/account/edit', 'com.choxsu.admin.account.AccountAdminController', '账户编辑页面');
INSERT INTO `permission` VALUES (239, '/admin/account/lock', 'com.choxsu.admin.account.AccountAdminController', '账户锁定');
INSERT INTO `permission` VALUES (240, '/admin/account/save', 'com.choxsu.admin.account.AccountAdminController', '账户保存');
INSERT INTO `permission` VALUES (241, '/admin/account/saveAvatar', 'com.choxsu.admin.account.AccountAdminController', '账户头像保存');
INSERT INTO `permission` VALUES (242, '/admin/account/showAdminList', 'com.choxsu.admin.account.AccountAdminController', '显示后台管理员账户首页');
INSERT INTO `permission` VALUES (243, '/admin/account/unlock', 'com.choxsu.admin.account.AccountAdminController', '账户解锁');
INSERT INTO `permission` VALUES (244, '/admin/account/update', 'com.choxsu.admin.account.AccountAdminController', '账户更新');
INSERT INTO `permission` VALUES (245, '/admin/account/uploadAvatar', 'com.choxsu.admin.account.AccountAdminController', '账户头像裁剪');
INSERT INTO `permission` VALUES (246, '/admin/blog', 'com.choxsu.admin.blog.AdminBlogController', '文章首页');
INSERT INTO `permission` VALUES (247, '/admin/blog/add', 'com.choxsu.admin.blog.AdminBlogController', '文章添加页面');
INSERT INTO `permission` VALUES (248, '/admin/blog/allowComments', 'com.choxsu.admin.blog.AdminBlogController', '开启评论');
INSERT INTO `permission` VALUES (249, '/admin/blog/delete', 'com.choxsu.admin.blog.AdminBlogController', '文章删除');
INSERT INTO `permission` VALUES (250, '/admin/blog/edit', 'com.choxsu.admin.blog.AdminBlogController', '文章编辑页面');
INSERT INTO `permission` VALUES (251, '/admin/blog/oneKeyAllowComments', 'com.choxsu.admin.blog.AdminBlogController', '一键开启评论');
INSERT INTO `permission` VALUES (252, '/admin/blog/save', 'com.choxsu.admin.blog.AdminBlogController', '文章保存');
INSERT INTO `permission` VALUES (253, '/admin/blog/unAllowComments', 'com.choxsu.admin.blog.AdminBlogController', '关闭评论');
INSERT INTO `permission` VALUES (254, '/admin/blog/update', 'com.choxsu.admin.blog.AdminBlogController', '文章更新');
INSERT INTO `permission` VALUES (255, '/admin/code', 'com.choxsu.admin.code.CodeController', '代码生成首页');
INSERT INTO `permission` VALUES (256, '/admin/code/gen', 'com.choxsu.admin.code.CodeController', '代码生成');
INSERT INTO `permission` VALUES (257, '/admin/codeConfig', 'com.choxsu.admin.code.CodeConfigController', '生成配置');
INSERT INTO `permission` VALUES (258, '/admin/codeConfig/update', 'com.choxsu.admin.code.CodeConfigController', '更新生成配置');
INSERT INTO `permission` VALUES (259, '/admin/druid', 'com.choxsu.admin.druid.DruidController', 'Druid管理首页');
INSERT INTO `permission` VALUES (260, '/admin/loginLog', 'com.choxsu.admin.account.AccountAdminController', '账户登录日志首页');
INSERT INTO `permission` VALUES (261, '/admin/permission', 'com.choxsu.admin.permission.PermissionAdminController', '权限首页');
INSERT INTO `permission` VALUES (262, '/admin/permission/delete', 'com.choxsu.admin.permission.PermissionAdminController', '权限删除');
INSERT INTO `permission` VALUES (263, '/admin/permission/edit', 'com.choxsu.admin.permission.PermissionAdminController', '权限编辑页面');
INSERT INTO `permission` VALUES (264, '/admin/permission/sync', 'com.choxsu.admin.permission.PermissionAdminController', '权限同步');
INSERT INTO `permission` VALUES (265, '/admin/permission/update', 'com.choxsu.admin.permission.PermissionAdminController', '权限更新');
INSERT INTO `permission` VALUES (266, '/admin/quartz', 'com.choxsu.admin.quartz.JobManageController', '定时任务管理首页');
INSERT INTO `permission` VALUES (267, '/admin/quartz/add', 'com.choxsu.admin.quartz.JobManageController', '定时任务添加页面');
INSERT INTO `permission` VALUES (268, '/admin/quartz/delete', 'com.choxsu.admin.quartz.JobManageController', '定时任务删除');
INSERT INTO `permission` VALUES (269, '/admin/quartz/edit', 'com.choxsu.admin.quartz.JobManageController', '定时任务编辑页面');
INSERT INTO `permission` VALUES (270, '/admin/quartz/get', 'com.choxsu.admin.quartz.JobManageController', '定时任务详情');
INSERT INTO `permission` VALUES (271, '/admin/quartz/save', 'com.choxsu.admin.quartz.JobManageController', '定时任务保存');
INSERT INTO `permission` VALUES (272, '/admin/quartz/start', 'com.choxsu.admin.quartz.JobManageController', '定时任务开始');
INSERT INTO `permission` VALUES (273, '/admin/quartz/update', 'com.choxsu.admin.quartz.JobManageController', '定时任务更新');
INSERT INTO `permission` VALUES (274, '/admin/reply', 'com.choxsu.admin.reply.ReplyController', '评论列表首页');
INSERT INTO `permission` VALUES (275, '/admin/role', 'com.choxsu.admin.role.RoleAdminController', '角色管理首页');
INSERT INTO `permission` VALUES (276, '/admin/role/add', 'com.choxsu.admin.role.RoleAdminController', '角色添加页面');
INSERT INTO `permission` VALUES (277, '/admin/role/addPermission', 'com.choxsu.admin.role.RoleAdminController', '角色权限增加');
INSERT INTO `permission` VALUES (278, '/admin/role/assignPermissions', 'com.choxsu.admin.role.RoleAdminController', '角色分配权限页面');
INSERT INTO `permission` VALUES (279, '/admin/role/delete', 'com.choxsu.admin.role.RoleAdminController', '角色删除');
INSERT INTO `permission` VALUES (280, '/admin/role/deletePermission', 'com.choxsu.admin.role.RoleAdminController', '角色权限删除');
INSERT INTO `permission` VALUES (281, '/admin/role/edit', 'com.choxsu.admin.role.RoleAdminController', '角色编辑页面');
INSERT INTO `permission` VALUES (282, '/admin/role/save', 'com.choxsu.admin.role.RoleAdminController', '角色保存');
INSERT INTO `permission` VALUES (283, '/admin/role/update', 'com.choxsu.admin.role.RoleAdminController', '角色更新');
INSERT INTO `permission` VALUES (284, '/admin/sensitiveWord', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字管理首页');
INSERT INTO `permission` VALUES (285, '/admin/sensitiveWord/add', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字添加页面');
INSERT INTO `permission` VALUES (286, '/admin/sensitiveWord/delete', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字删除');
INSERT INTO `permission` VALUES (287, '/admin/sensitiveWord/edit', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字编辑页面');
INSERT INTO `permission` VALUES (288, '/admin/sensitiveWord/exchange', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字汉字转换拼音');
INSERT INTO `permission` VALUES (289, '/admin/sensitiveWord/save', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字保存');
INSERT INTO `permission` VALUES (290, '/admin/sensitiveWord/update', 'com.choxsu.admin.sensitive_word.SensitiveWordAdminController', '敏感字更新');
INSERT INTO `permission` VALUES (291, '/admin/tag', 'com.choxsu.admin.tag.AdminTagController', '标签管理首页');
INSERT INTO `permission` VALUES (292, '/admin/tag/add', 'com.choxsu.admin.tag.AdminTagController', '标签添加页面');
INSERT INTO `permission` VALUES (293, '/admin/tag/delete', 'com.choxsu.admin.tag.AdminTagController', '标签删除');
INSERT INTO `permission` VALUES (294, '/admin/tag/edit', 'com.choxsu.admin.tag.AdminTagController', '标签编辑页面');
INSERT INTO `permission` VALUES (295, '/admin/tag/save', 'com.choxsu.admin.tag.AdminTagController', '标签保存');
INSERT INTO `permission` VALUES (296, '/admin/tag/update', 'com.choxsu.admin.tag.AdminTagController', '标签更新');
INSERT INTO `permission` VALUES (297, '/admin/upload/base64ImgUpload', 'com.choxsu.common.upload.UploadController', NULL);
INSERT INTO `permission` VALUES (298, '/admin/upload/editormdImgUpload', 'com.choxsu.common.upload.UploadController', NULL);
INSERT INTO `permission` VALUES (299, '/admin/uploadLog', 'com.choxsu.admin.account.AccountAdminController', '图片上传日志记录首页');
INSERT INTO `permission` VALUES (300, '/admin/visitor', 'com.choxsu.admin.visitor.VisitorAdminController', 'PV管理首页');

-- ----------------------------
-- Table structure for refer_me
-- ----------------------------
DROP TABLE IF EXISTS `refer_me`;
CREATE TABLE `refer_me`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `referAccountId` int(11) NOT NULL COMMENT '接收者账号id',
  `newsFeedId` int(11) NOT NULL COMMENT 'newsFeedId',
  `type` tinyint(2) NOT NULL COMMENT '@我、评论我等等的refer类型',
  `createAt` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refer_me
-- ----------------------------
INSERT INTO `refer_me` VALUES (1, 1, 14, 1, '2019-05-25 09:45:22');
INSERT INTO `refer_me` VALUES (2, 1, 15, 1, '2019-05-25 09:46:01');
INSERT INTO `refer_me` VALUES (3, 1, 16, 1, '2019-05-25 09:48:41');
INSERT INTO `refer_me` VALUES (4, 1, 29, 1, '2019-05-25 10:28:50');
INSERT INTO `refer_me` VALUES (5, 1, 31, 1, '2019-05-25 10:32:09');
INSERT INTO `refer_me` VALUES (6, 1, 32, 1, '2019-05-25 10:37:54');

-- ----------------------------
-- Table structure for remind
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind`  (
  `accountId` int(11) NOT NULL COMMENT '用户账号id，必须手动指定，不自增',
  `referMe` int(11) NOT NULL DEFAULT 0 COMMENT '提到我的消息条数',
  `message` int(11) NOT NULL DEFAULT 0 COMMENT '私信条数',
  `fans` int(11) NOT NULL DEFAULT 0 COMMENT '粉丝增加个数',
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES (1, 6, 0, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `createAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '2018-03-19 09:58:19');
INSERT INTO `role` VALUES (6, '管理员', '2018-05-03 10:15:44');
INSERT INTO `role` VALUES (8, '小编', '2018-05-03 10:25:52');
INSERT INTO `role` VALUES (9, 'test', '2018-09-27 11:04:02');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `permissionId`) USING BTREE,
  INDEX `roleId`(`roleId`, `permissionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (6, 70);
INSERT INTO `role_permission` VALUES (6, 94);
INSERT INTO `role_permission` VALUES (6, 95);
INSERT INTO `role_permission` VALUES (6, 97);
INSERT INTO `role_permission` VALUES (6, 98);
INSERT INTO `role_permission` VALUES (6, 105);
INSERT INTO `role_permission` VALUES (6, 107);
INSERT INTO `role_permission` VALUES (6, 119);
INSERT INTO `role_permission` VALUES (6, 120);
INSERT INTO `role_permission` VALUES (6, 121);
INSERT INTO `role_permission` VALUES (6, 122);
INSERT INTO `role_permission` VALUES (6, 123);
INSERT INTO `role_permission` VALUES (6, 124);
INSERT INTO `role_permission` VALUES (6, 125);
INSERT INTO `role_permission` VALUES (6, 126);
INSERT INTO `role_permission` VALUES (6, 140);
INSERT INTO `role_permission` VALUES (6, 141);
INSERT INTO `role_permission` VALUES (6, 142);
INSERT INTO `role_permission` VALUES (6, 143);
INSERT INTO `role_permission` VALUES (6, 144);
INSERT INTO `role_permission` VALUES (6, 145);
INSERT INTO `role_permission` VALUES (6, 146);
INSERT INTO `role_permission` VALUES (8, 70);
INSERT INTO `role_permission` VALUES (8, 94);
INSERT INTO `role_permission` VALUES (8, 95);
INSERT INTO `role_permission` VALUES (8, 96);
INSERT INTO `role_permission` VALUES (8, 97);
INSERT INTO `role_permission` VALUES (8, 98);
INSERT INTO `role_permission` VALUES (8, 100);
INSERT INTO `role_permission` VALUES (8, 101);
INSERT INTO `role_permission` VALUES (8, 102);
INSERT INTO `role_permission` VALUES (8, 103);
INSERT INTO `role_permission` VALUES (8, 104);
INSERT INTO `role_permission` VALUES (8, 105);
INSERT INTO `role_permission` VALUES (9, 70);
INSERT INTO `role_permission` VALUES (9, 80);
INSERT INTO `role_permission` VALUES (9, 82);
INSERT INTO `role_permission` VALUES (9, 85);
INSERT INTO `role_permission` VALUES (9, 86);
INSERT INTO `role_permission` VALUES (9, 88);
INSERT INTO `role_permission` VALUES (9, 91);
INSERT INTO `role_permission` VALUES (9, 94);
INSERT INTO `role_permission` VALUES (9, 95);
INSERT INTO `role_permission` VALUES (9, 97);
INSERT INTO `role_permission` VALUES (9, 107);
INSERT INTO `role_permission` VALUES (9, 119);
INSERT INTO `role_permission` VALUES (9, 120);
INSERT INTO `role_permission` VALUES (9, 122);
INSERT INTO `role_permission` VALUES (9, 140);
INSERT INTO `role_permission` VALUES (9, 155);
INSERT INTO `role_permission` VALUES (9, 156);

-- ----------------------------
-- Table structure for sensitive_words
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_words`;
CREATE TABLE `sensitive_words`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `word_pinyin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2699 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sensitive_words
-- ----------------------------
INSERT INTO `sensitive_words` VALUES (1, '第二代领导', 1, 'Di Er Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (2, '第三代领导', 1, 'Di San Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (3, '第四代领导', 1, 'Di Si Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (4, '第五代领导', 1, 'Di Wu Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (5, '第六代领导', 1, 'Di Liu Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (6, '第七代领导', 1, 'Di Qi Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (7, '第1代领导', 1, 'Di 1 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (8, '第2代领导', 1, 'Di 2 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (9, '第3代领导', 1, 'Di 3 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (10, '第4代领导', 1, 'Di 4 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (11, '第5代领导', 1, 'Di 5 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (12, '第6代领导', 1, 'Di 6 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (13, '第7代领导', 1, 'Di 7 Dai Ling Dao');
INSERT INTO `sensitive_words` VALUES (14, '一位老同志的谈话', 1, 'Yi Wei Lao Tong Zhi De Tan Hua');
INSERT INTO `sensitive_words` VALUES (15, '国办发', 1, 'Guo Ban Fa');
INSERT INTO `sensitive_words` VALUES (16, '中办发', 1, 'Zhong Ban Fa');
INSERT INTO `sensitive_words` VALUES (17, '腐败中国', 1, 'Fu Bai Zhong Guo');
INSERT INTO `sensitive_words` VALUES (18, '三个呆婊', 1, 'San Ge Dai Biao');
INSERT INTO `sensitive_words` VALUES (19, '你办事我放心', 1, 'Ni Ban Shi Wo Fang Xin');
INSERT INTO `sensitive_words` VALUES (20, '社会主义灭亡', 1, 'She Hui Zhu Yi Mie Wang');
INSERT INTO `sensitive_words` VALUES (21, '打倒中国', 1, 'Da Dao Zhong Guo');
INSERT INTO `sensitive_words` VALUES (22, '灭亡中国', 1, 'Mie Wang Zhong Guo');
INSERT INTO `sensitive_words` VALUES (23, '亡党亡国', 1, 'Wang Dang Wang Guo');
INSERT INTO `sensitive_words` VALUES (24, '粉碎四人帮', 1, 'Fen Sui Si Ren Bang');
INSERT INTO `sensitive_words` VALUES (25, '激流中国', 1, 'Ji Liu Zhong Guo');
INSERT INTO `sensitive_words` VALUES (26, '特供', 1, 'Te Gong');
INSERT INTO `sensitive_words` VALUES (27, '特贡', 1, 'Te Gong');
INSERT INTO `sensitive_words` VALUES (28, '特共', 1, 'Te Gong');
INSERT INTO `sensitive_words` VALUES (29, 'zf大楼', 1, 'z f Da Lou');
INSERT INTO `sensitive_words` VALUES (30, '殃视', 1, 'Yang Shi');
INSERT INTO `sensitive_words` VALUES (31, '贪污腐败', 1, 'Tan Wu Fu Bai');
INSERT INTO `sensitive_words` VALUES (32, '强制拆除', 1, 'Qiang Zhi Chai Chu');
INSERT INTO `sensitive_words` VALUES (33, '形式主义', 1, 'Xing Shi Zhu Yi');
INSERT INTO `sensitive_words` VALUES (34, '政治风波', 1, 'Zheng Zhi Feng Bo');
INSERT INTO `sensitive_words` VALUES (35, '太子党', 1, 'Tai Zi Dang');
INSERT INTO `sensitive_words` VALUES (36, '上海帮', 1, 'Shang Hai Bang');
INSERT INTO `sensitive_words` VALUES (37, '北京帮', 1, 'Bei Jing Bang');
INSERT INTO `sensitive_words` VALUES (38, '清华帮', 1, 'Qing Hua Bang');
INSERT INTO `sensitive_words` VALUES (39, '红色贵族', 1, 'Hong Se Gui Zu');
INSERT INTO `sensitive_words` VALUES (40, '权贵集团', 1, 'Quan Gui Ji Tuan');
INSERT INTO `sensitive_words` VALUES (41, '河蟹社会', 1, 'He Xie She Hui');
INSERT INTO `sensitive_words` VALUES (42, '喝血社会', 1, 'He Xue She Hui');
INSERT INTO `sensitive_words` VALUES (43, '九风', 1, 'Jiu Feng');
INSERT INTO `sensitive_words` VALUES (44, '9风', 1, '9 Feng');
INSERT INTO `sensitive_words` VALUES (45, '十七大', 1, 'Shi Qi Da');
INSERT INTO `sensitive_words` VALUES (46, '十7大', 1, 'Shi 7 Da');
INSERT INTO `sensitive_words` VALUES (47, '17da', 1, '1 7 d a');
INSERT INTO `sensitive_words` VALUES (48, '九学', 1, 'Jiu Xue');
INSERT INTO `sensitive_words` VALUES (49, '9学', 1, '9 Xue');
INSERT INTO `sensitive_words` VALUES (50, '四风', 1, 'Si Feng');
INSERT INTO `sensitive_words` VALUES (51, '4风', 1, '4 Feng');
INSERT INTO `sensitive_words` VALUES (52, '双规', 1, 'Shuang Gui');
INSERT INTO `sensitive_words` VALUES (53, '南街村', 1, 'Nan Jie Cun');
INSERT INTO `sensitive_words` VALUES (54, '最淫官员', 1, 'Zui Yin Guan Yuan');
INSERT INTO `sensitive_words` VALUES (55, '警匪', 1, 'Jing Fei');
INSERT INTO `sensitive_words` VALUES (56, '官匪', 1, 'Guan Fei');
INSERT INTO `sensitive_words` VALUES (57, '独夫民贼', 1, 'Du Fu Min Zei');
INSERT INTO `sensitive_words` VALUES (58, '官商勾结', 1, 'Guan Shang Gou Jie');
INSERT INTO `sensitive_words` VALUES (59, '城管暴力执法', 1, 'Cheng Guan Bao Li Zhi Fa');
INSERT INTO `sensitive_words` VALUES (60, '强制捐款', 1, 'Qiang Zhi Juan Kuan');
INSERT INTO `sensitive_words` VALUES (61, '毒豺', 1, 'Du Chai');
INSERT INTO `sensitive_words` VALUES (62, '一党执政', 1, 'Yi Dang Zhi Zheng');
INSERT INTO `sensitive_words` VALUES (63, '一党专制', 1, 'Yi Dang Zhuan Zhi');
INSERT INTO `sensitive_words` VALUES (64, '一党专政', 1, 'Yi Dang Zhuan Zheng');
INSERT INTO `sensitive_words` VALUES (65, '专制政权', 1, 'Zhuan Zhi Zheng Quan');
INSERT INTO `sensitive_words` VALUES (66, '宪法法院', 1, 'Xian Fa Fa Yuan');
INSERT INTO `sensitive_words` VALUES (67, '胡平', 1, 'Hu Ping');
INSERT INTO `sensitive_words` VALUES (68, '苏晓康', 1, 'Su Xiao Kang');
INSERT INTO `sensitive_words` VALUES (69, '贺卫方', 1, 'He Wei Fang');
INSERT INTO `sensitive_words` VALUES (70, '谭作人', 1, 'Tan Zuo Ren');
INSERT INTO `sensitive_words` VALUES (71, '焦国标', 1, 'Jiao Guo Biao');
INSERT INTO `sensitive_words` VALUES (72, '万润南', 1, 'Wan Run Nan');
INSERT INTO `sensitive_words` VALUES (73, '张志新', 1, 'Zhang Zhi Xin');
INSERT INTO `sensitive_words` VALUES (74, '辛灝年', 1, 'Xin Hao Nian');
INSERT INTO `sensitive_words` VALUES (75, '高勤荣', 1, 'Gao Qin Rong');
INSERT INTO `sensitive_words` VALUES (76, '王炳章', 1, 'Wang Bing Zhang');
INSERT INTO `sensitive_words` VALUES (77, '高智晟', 1, 'Gao Zhi Sheng');
INSERT INTO `sensitive_words` VALUES (78, '司马璐', 1, 'Si Ma Lu');
INSERT INTO `sensitive_words` VALUES (79, '刘晓竹', 1, 'Liu Xiao Zhu');
INSERT INTO `sensitive_words` VALUES (80, '刘宾雁', 1, 'Liu Bin Yan');
INSERT INTO `sensitive_words` VALUES (81, '魏京生', 1, 'Wei Jing Sheng');
INSERT INTO `sensitive_words` VALUES (82, '寻找林昭的灵魂', 1, 'Xun Zhao Lin Zhao De Ling Hun');
INSERT INTO `sensitive_words` VALUES (83, '别梦成灰', 1, 'Bie Meng Cheng Hui');
INSERT INTO `sensitive_words` VALUES (84, '谁是新中国', 1, 'Shei Shi Xin Zhong Guo');
INSERT INTO `sensitive_words` VALUES (85, '讨伐中宣部', 1, 'Tao Fa Zhong Xuan Bu');
INSERT INTO `sensitive_words` VALUES (86, '异议人士', 1, 'Yi Yi Ren Shi');
INSERT INTO `sensitive_words` VALUES (87, '民运人士', 1, 'Min Yun Ren Shi');
INSERT INTO `sensitive_words` VALUES (88, '启蒙派', 1, 'Qi Meng Pai');
INSERT INTO `sensitive_words` VALUES (89, '选国家主席', 1, 'Xuan Guo Jia Zhu Xi');
INSERT INTO `sensitive_words` VALUES (90, '民一主', 1, 'Min Yi Zhu');
INSERT INTO `sensitive_words` VALUES (91, 'min主', 1, 'm i n Zhu');
INSERT INTO `sensitive_words` VALUES (92, '民竹', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (93, '民珠', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (94, '民猪', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (95, 'chinesedemocracy', 1, 'c h i n e s e d e m o c r a c y');
INSERT INTO `sensitive_words` VALUES (96, '大赦国际', 1, 'Da She Guo Ji');
INSERT INTO `sensitive_words` VALUES (97, '国际特赦', 1, 'Guo Ji Te She');
INSERT INTO `sensitive_words` VALUES (98, 'da选', 1, 'd a Xuan');
INSERT INTO `sensitive_words` VALUES (99, '投公', 1, 'Tou Gong');
INSERT INTO `sensitive_words` VALUES (100, '公头', 1, 'Gong Tou');
INSERT INTO `sensitive_words` VALUES (101, '宪政', 1, 'Xian Zheng');
INSERT INTO `sensitive_words` VALUES (102, '平反', 1, 'Ping Fan');
INSERT INTO `sensitive_words` VALUES (103, '党章', 1, 'Dang Zhang');
INSERT INTO `sensitive_words` VALUES (104, '维权', 1, 'Wei Quan');
INSERT INTO `sensitive_words` VALUES (105, '昝爱宗', 1, 'Zan Ai Zong');
INSERT INTO `sensitive_words` VALUES (106, '宪章', 1, 'Xian Zhang');
INSERT INTO `sensitive_words` VALUES (107, '08宪', 1, '0 8 Xian');
INSERT INTO `sensitive_words` VALUES (108, '08xz', 1, '0 8 x z');
INSERT INTO `sensitive_words` VALUES (109, '觉醒的中国公民日渐清楚地认识到', 1, 'Jue Xing De Zhong Guo Gong Min Ri Jian Qing Chu Di Ren Shi Dao');
INSERT INTO `sensitive_words` VALUES (110, '抿主', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (111, '民主', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (112, '敏主', 1, 'Min Zhu');
INSERT INTO `sensitive_words` VALUES (113, '人拳', 1, 'Ren Quan');
INSERT INTO `sensitive_words` VALUES (114, '人木又', 1, 'Ren Mu You');
INSERT INTO `sensitive_words` VALUES (115, '人quan', 1, 'Ren q u a n');
INSERT INTO `sensitive_words` VALUES (116, 'renquan', 1, 'r e n q u a n');
INSERT INTO `sensitive_words` VALUES (117, '中国人权', 1, 'Zhong Guo Ren Quan');
INSERT INTO `sensitive_words` VALUES (118, '中国的人权', 1, 'Zhong Guo De Ren Quan');
INSERT INTO `sensitive_words` VALUES (119, '中国新民党', 1, 'Zhong Guo Xin Min Dang');
INSERT INTO `sensitive_words` VALUES (120, '群体事件', 1, 'Qun Ti Shi Jian');
INSERT INTO `sensitive_words` VALUES (121, '群体性事件', 1, 'Qun Ti Xing Shi Jian');
INSERT INTO `sensitive_words` VALUES (122, '上中央', 1, 'Shang Zhong Yang');
INSERT INTO `sensitive_words` VALUES (123, '去中央', 1, 'Qu Zhong Yang');
INSERT INTO `sensitive_words` VALUES (124, '讨说法', 1, 'Tao Shuo Fa');
INSERT INTO `sensitive_words` VALUES (125, '请愿', 1, 'Qing Yuan');
INSERT INTO `sensitive_words` VALUES (126, '请命', 1, 'Qing Ming');
INSERT INTO `sensitive_words` VALUES (127, '公开信', 1, 'Gong Kai Xin');
INSERT INTO `sensitive_words` VALUES (128, '联名上书', 1, 'Lian Ming Shang Shu');
INSERT INTO `sensitive_words` VALUES (129, '万人大签名', 1, 'Wan Ren Da Qian Ming');
INSERT INTO `sensitive_words` VALUES (130, '万人骚动', 1, 'Wan Ren Sao Dong');
INSERT INTO `sensitive_words` VALUES (131, '截访', 1, 'Jie Fang');
INSERT INTO `sensitive_words` VALUES (132, '上访', 1, 'Shang Fang');
INSERT INTO `sensitive_words` VALUES (133, 'shangfang', 1, 's h a n g f a n g');
INSERT INTO `sensitive_words` VALUES (134, '信访', 1, 'Xin Fang');
INSERT INTO `sensitive_words` VALUES (135, '访民', 1, 'Fang Min');
INSERT INTO `sensitive_words` VALUES (136, '集合', 1, 'Ji He');
INSERT INTO `sensitive_words` VALUES (137, '集会', 1, 'Ji Hui');
INSERT INTO `sensitive_words` VALUES (138, '组织集体', 1, 'Zu Zhi Ji Ti');
INSERT INTO `sensitive_words` VALUES (139, '静坐', 1, 'Jing Zuo');
INSERT INTO `sensitive_words` VALUES (140, '静zuo', 1, 'Jing z u o');
INSERT INTO `sensitive_words` VALUES (141, 'jing坐', 1, 'j i n g Zuo');
INSERT INTO `sensitive_words` VALUES (142, '示威', 1, 'Shi Wei');
INSERT INTO `sensitive_words` VALUES (143, '示wei', 1, 'Shi w e i');
INSERT INTO `sensitive_words` VALUES (144, '游行', 1, 'You Xing');
INSERT INTO `sensitive_words` VALUES (145, 'you行', 1, 'y o u Xing');
INSERT INTO `sensitive_words` VALUES (146, '油行', 1, 'You Xing');
INSERT INTO `sensitive_words` VALUES (147, '游xing', 1, 'You x i n g');
INSERT INTO `sensitive_words` VALUES (148, 'youxing', 1, 'y o u x i n g');
INSERT INTO `sensitive_words` VALUES (149, '官逼民反', 1, 'Guan Bi Min Fan');
INSERT INTO `sensitive_words` VALUES (150, '反party', 1, 'Fan p a r t y');
INSERT INTO `sensitive_words` VALUES (151, '反共', 1, 'Fan Gong');
INSERT INTO `sensitive_words` VALUES (152, '抗议', 1, 'Kang Yi');
INSERT INTO `sensitive_words` VALUES (153, '亢议', 1, 'Kang Yi');
INSERT INTO `sensitive_words` VALUES (154, '抵制', 1, 'Di Zhi');
INSERT INTO `sensitive_words` VALUES (155, '低制', 1, 'Di Zhi');
INSERT INTO `sensitive_words` VALUES (156, '底制', 1, 'Di Zhi');
INSERT INTO `sensitive_words` VALUES (157, 'di制', 1, 'd i Zhi');
INSERT INTO `sensitive_words` VALUES (158, '抵zhi', 1, 'Di z h i');
INSERT INTO `sensitive_words` VALUES (159, 'dizhi', 1, 'd i z h i');
INSERT INTO `sensitive_words` VALUES (160, 'boycott', 1, 'b o y c o t t');
INSERT INTO `sensitive_words` VALUES (161, '血书', 1, 'Xue Shu');
INSERT INTO `sensitive_words` VALUES (162, '焚烧中国国旗', 1, 'Fen Shao Zhong Guo Guo Qi');
INSERT INTO `sensitive_words` VALUES (163, 'baoluan', 1, 'b a o l u a n');
INSERT INTO `sensitive_words` VALUES (164, '流血冲突', 1, 'Liu Xue Chong Tu');
INSERT INTO `sensitive_words` VALUES (165, '出现暴动', 1, 'Chu Xian Bao Dong');
INSERT INTO `sensitive_words` VALUES (166, '发生暴动', 1, 'Fa Sheng Bao Dong');
INSERT INTO `sensitive_words` VALUES (167, '引起暴动', 1, 'Yin Qi Bao Dong');
INSERT INTO `sensitive_words` VALUES (168, 'baodong', 1, 'b a o d o n g');
INSERT INTO `sensitive_words` VALUES (169, '灭共', 1, 'Mie Gong');
INSERT INTO `sensitive_words` VALUES (170, '杀毙', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (171, '罢工', 1, 'Ba Gong');
INSERT INTO `sensitive_words` VALUES (172, '霸工', 1, 'Ba Gong');
INSERT INTO `sensitive_words` VALUES (173, '罢考', 1, 'Ba Kao');
INSERT INTO `sensitive_words` VALUES (174, '罢餐', 1, 'Ba Can');
INSERT INTO `sensitive_words` VALUES (175, '霸餐', 1, 'Ba Can');
INSERT INTO `sensitive_words` VALUES (176, '罢参', 1, 'Ba Can');
INSERT INTO `sensitive_words` VALUES (177, '罢饭', 1, 'Ba Fan');
INSERT INTO `sensitive_words` VALUES (178, '罢吃', 1, 'Ba Chi');
INSERT INTO `sensitive_words` VALUES (179, '罢食', 1, 'Ba Shi');
INSERT INTO `sensitive_words` VALUES (180, '罢课', 1, 'Ba Ke');
INSERT INTO `sensitive_words` VALUES (181, '罢ke', 1, 'Ba k e');
INSERT INTO `sensitive_words` VALUES (182, '霸课', 1, 'Ba Ke');
INSERT INTO `sensitive_words` VALUES (183, 'ba课', 1, 'b a Ke');
INSERT INTO `sensitive_words` VALUES (184, '罢教', 1, 'Ba Jiao');
INSERT INTO `sensitive_words` VALUES (185, '罢学', 1, 'Ba Xue');
INSERT INTO `sensitive_words` VALUES (186, '罢运', 1, 'Ba Yun');
INSERT INTO `sensitive_words` VALUES (187, '网特', 1, 'Wang Te');
INSERT INTO `sensitive_words` VALUES (188, '网评员', 1, 'Wang Ping Yuan');
INSERT INTO `sensitive_words` VALUES (189, '网络评论员', 1, 'Wang Luo Ping Lun Yuan');
INSERT INTO `sensitive_words` VALUES (190, '五毛党', 1, 'Wu Mao Dang');
INSERT INTO `sensitive_words` VALUES (191, '五毛们', 1, 'Wu Mao Men');
INSERT INTO `sensitive_words` VALUES (192, '5毛党', 1, '5 Mao Dang');
INSERT INTO `sensitive_words` VALUES (193, '戒严', 1, 'Jie Yan');
INSERT INTO `sensitive_words` VALUES (194, 'jieyan', 1, 'j i e y a n');
INSERT INTO `sensitive_words` VALUES (195, 'jie严', 1, 'j i e Yan');
INSERT INTO `sensitive_words` VALUES (196, '戒yan', 1, 'Jie y a n');
INSERT INTO `sensitive_words` VALUES (197, '8的平方事件', 1, '8 De Ping Fang Shi Jian');
INSERT INTO `sensitive_words` VALUES (198, '知道64', 1, 'Zhi Dao 6 4');
INSERT INTO `sensitive_words` VALUES (199, '八九年', 1, 'Ba Jiu Nian');
INSERT INTO `sensitive_words` VALUES (200, '贰拾年', 1, 'Er Shi Nian');
INSERT INTO `sensitive_words` VALUES (201, '2o年', 1, '2 o Nian');
INSERT INTO `sensitive_words` VALUES (202, '20和谐年', 1, '2 0 He Xie Nian');
INSERT INTO `sensitive_words` VALUES (203, '贰拾周年', 1, 'Er Shi Zhou Nian');
INSERT INTO `sensitive_words` VALUES (204, '六四', 1, 'Liu Si');
INSERT INTO `sensitive_words` VALUES (205, '六河蟹四', 1, 'Liu He Xie Si');
INSERT INTO `sensitive_words` VALUES (206, '六百度四', 1, 'Liu Bai Du Si');
INSERT INTO `sensitive_words` VALUES (207, '六和谐四', 1, 'Liu He Xie Si');
INSERT INTO `sensitive_words` VALUES (208, '陆四', 1, 'Lu Si');
INSERT INTO `sensitive_words` VALUES (209, '陆肆', 1, 'Lu Si');
INSERT INTO `sensitive_words` VALUES (210, '198964', 1, '1 9 8 9 6 4');
INSERT INTO `sensitive_words` VALUES (211, '5月35', 1, '5 Yue 3 5');
INSERT INTO `sensitive_words` VALUES (212, '89年春夏之交', 1, '8 9 Nian Chun Xia Zhi Jiao');
INSERT INTO `sensitive_words` VALUES (213, '64惨案', 1, '6 4 Can An');
INSERT INTO `sensitive_words` VALUES (214, '64时期', 1, '6 4 Shi Qi');
INSERT INTO `sensitive_words` VALUES (215, '64运动', 1, '6 4 Yun Dong');
INSERT INTO `sensitive_words` VALUES (216, '4事件', 1, '4 Shi Jian');
INSERT INTO `sensitive_words` VALUES (217, '四事件', 1, 'Si Shi Jian');
INSERT INTO `sensitive_words` VALUES (218, '北京风波', 1, 'Bei Jing Feng Bo');
INSERT INTO `sensitive_words` VALUES (219, '学潮', 1, 'Xue Chao');
INSERT INTO `sensitive_words` VALUES (220, '学chao', 1, 'Xue c h a o');
INSERT INTO `sensitive_words` VALUES (221, 'xuechao', 1, 'x u e c h a o');
INSERT INTO `sensitive_words` VALUES (222, '学百度潮', 1, 'Xue Bai Du Chao');
INSERT INTO `sensitive_words` VALUES (223, '门安天', 1, 'Men An Tian');
INSERT INTO `sensitive_words` VALUES (224, '天按门', 1, 'Tian An Men');
INSERT INTO `sensitive_words` VALUES (225, '坦克压大学生', 1, 'Tan Ke Ya Da Xue Sheng');
INSERT INTO `sensitive_words` VALUES (226, '民主女神', 1, 'Min Zhu Nv Shen');
INSERT INTO `sensitive_words` VALUES (227, '历史的伤口', 1, 'Li Shi De Shang Kou');
INSERT INTO `sensitive_words` VALUES (228, '高自联', 1, 'Gao Zi Lian');
INSERT INTO `sensitive_words` VALUES (229, '北高联', 1, 'Bei Gao Lian');
INSERT INTO `sensitive_words` VALUES (230, '维多利亚公园', 1, 'Wei Duo Li Ya Gong Yuan');
INSERT INTO `sensitive_words` VALUES (231, 'thegateofheavenlypeace', 1, 't h e g a t e o f h e a v e n l y p e a c e');
INSERT INTO `sensitive_words` VALUES (232, 'bloodisonthesquare', 1, 'b l o o d i s o n t h e s q u a r e');
INSERT INTO `sensitive_words` VALUES (233, '为了忘却的纪念', 1, 'Wei Le Wang Que De Ji Nian');
INSERT INTO `sensitive_words` VALUES (234, '血洗京城', 1, 'Xue Xi Jing Cheng');
INSERT INTO `sensitive_words` VALUES (235, '四二六社论', 1, 'Si Er Liu She Lun');
INSERT INTO `sensitive_words` VALUES (236, '王丹', 1, 'Wang Dan');
INSERT INTO `sensitive_words` VALUES (237, '柴玲', 1, 'Chai Ling');
INSERT INTO `sensitive_words` VALUES (238, '沈彤', 1, 'Shen Tong');
INSERT INTO `sensitive_words` VALUES (239, '封从德', 1, 'Feng Cong De');
INSERT INTO `sensitive_words` VALUES (240, '王超华', 1, 'Wang Chao Hua');
INSERT INTO `sensitive_words` VALUES (241, '王维林', 1, 'Wang Wei Lin');
INSERT INTO `sensitive_words` VALUES (242, '吾尔开希', 1, 'Wu Er Kai Xi');
INSERT INTO `sensitive_words` VALUES (243, '吾尔开西', 1, 'Wu Er Kai Xi');
INSERT INTO `sensitive_words` VALUES (244, '侯德健', 1, 'Hou De Jian');
INSERT INTO `sensitive_words` VALUES (245, '阎明复', 1, 'Yan Ming Fu');
INSERT INTO `sensitive_words` VALUES (246, '方励之', 1, 'Fang Li Zhi');
INSERT INTO `sensitive_words` VALUES (247, '蒋捷连', 1, 'Jiang Jie Lian');
INSERT INTO `sensitive_words` VALUES (248, '丁子霖', 1, 'Ding Zi Lin');
INSERT INTO `sensitive_words` VALUES (249, '辛灏年', 1, 'Xin Hao Nian');
INSERT INTO `sensitive_words` VALUES (250, '蒋彦永', 1, 'Jiang Yan Yong');
INSERT INTO `sensitive_words` VALUES (251, '严家其', 1, 'Yan Jia Qi');
INSERT INTO `sensitive_words` VALUES (252, '陈一咨', 1, 'Chen Yi Zi');
INSERT INTO `sensitive_words` VALUES (253, '中华局域网', 1, 'Zhong Hua Ju Yu Wang');
INSERT INTO `sensitive_words` VALUES (254, '党的喉舌', 1, 'Dang De Hou She');
INSERT INTO `sensitive_words` VALUES (255, '互联网审查', 1, 'Hu Lian Wang Shen Cha');
INSERT INTO `sensitive_words` VALUES (256, '当局严密封锁', 1, 'Dang Ju Yan Mi Feng Suo');
INSERT INTO `sensitive_words` VALUES (257, '新闻封锁', 1, 'Xin Wen Feng Suo');
INSERT INTO `sensitive_words` VALUES (258, '封锁消息', 1, 'Feng Suo Xiao Xi');
INSERT INTO `sensitive_words` VALUES (259, '爱国者同盟', 1, 'Ai Guo Zhe Tong Meng');
INSERT INTO `sensitive_words` VALUES (260, '关闭所有论坛', 1, 'Guan Bi Suo You Lun Tan');
INSERT INTO `sensitive_words` VALUES (261, '网络封锁', 1, 'Wang Luo Feng Suo');
INSERT INTO `sensitive_words` VALUES (262, '金盾工程', 1, 'Jin Dun Gong Cheng');
INSERT INTO `sensitive_words` VALUES (263, 'gfw', 1, 'g f w');
INSERT INTO `sensitive_words` VALUES (264, '无界浏览', 1, 'Wu Jie Liu Lan');
INSERT INTO `sensitive_words` VALUES (265, '无界网络', 1, 'Wu Jie Wang Luo');
INSERT INTO `sensitive_words` VALUES (266, '自由门', 1, 'Zi You Men');
INSERT INTO `sensitive_words` VALUES (267, '何清涟', 1, 'He Qing Lian');
INSERT INTO `sensitive_words` VALUES (268, '中国的陷阱', 1, 'Zhong Guo De Xian Jing');
INSERT INTO `sensitive_words` VALUES (269, '汪兆钧', 1, 'Wang Zhao Jun');
INSERT INTO `sensitive_words` VALUES (270, '记者无疆界', 1, 'Ji Zhe Wu Jiang Jie');
INSERT INTO `sensitive_words` VALUES (271, '境外媒体', 1, 'Jing Wai Mei Ti');
INSERT INTO `sensitive_words` VALUES (272, '维基百科', 1, 'Wei Ji Bai Ke');
INSERT INTO `sensitive_words` VALUES (273, '纽约时报', 1, 'Niu Yue Shi Bao');
INSERT INTO `sensitive_words` VALUES (274, 'bbc中文网', 1, 'b b c Zhong Wen Wang');
INSERT INTO `sensitive_words` VALUES (275, '华盛顿邮报', 1, 'Hua Sheng Dun You Bao');
INSERT INTO `sensitive_words` VALUES (276, '世界日报', 1, 'Shi Jie Ri Bao');
INSERT INTO `sensitive_words` VALUES (277, '东森新闻网', 1, 'Dong Sen Xin Wen Wang');
INSERT INTO `sensitive_words` VALUES (278, '东森电视', 1, 'Dong Sen Dian Shi');
INSERT INTO `sensitive_words` VALUES (279, '基督教科学箴言报', 1, 'Ji Du Jiao Ke Xue Zhen Yan Bao');
INSERT INTO `sensitive_words` VALUES (280, '星岛日报', 1, 'Xing Dao Ri Bao');
INSERT INTO `sensitive_words` VALUES (281, '亚洲周刊', 1, 'Ya Zhou Zhou Kan');
INSERT INTO `sensitive_words` VALUES (282, '泰晤士报', 1, 'Tai Wu Shi Bao');
INSERT INTO `sensitive_words` VALUES (283, '美联社', 1, 'Mei Lian She');
INSERT INTO `sensitive_words` VALUES (284, '中央社', 1, 'Zhong Yang She');
INSERT INTO `sensitive_words` VALUES (285, '雅虎香港', 1, 'Ya Hu Xiang Gang');
INSERT INTO `sensitive_words` VALUES (286, 'wikipedia', 1, 'w i k i p e d i a');
INSERT INTO `sensitive_words` VALUES (287, 'youtube', 1, 'y o u t u b e');
INSERT INTO `sensitive_words` VALUES (288, 'googleblogger', 1, 'g o o g l e b l o g g e r');
INSERT INTO `sensitive_words` VALUES (289, '美国之音', 1, 'Mei Guo Zhi Yin');
INSERT INTO `sensitive_words` VALUES (290, '美国广播公司', 1, 'Mei Guo Guang Bo Gong Si');
INSERT INTO `sensitive_words` VALUES (291, '英国金融时报', 1, 'Ying Guo Jin Rong Shi Bao');
INSERT INTO `sensitive_words` VALUES (292, '自由亚洲', 1, 'Zi You Ya Zhou');
INSERT INTO `sensitive_words` VALUES (293, '中央日报', 1, 'Zhong Yang Ri Bao');
INSERT INTO `sensitive_words` VALUES (294, '自由时报', 1, 'Zi You Shi Bao');
INSERT INTO `sensitive_words` VALUES (295, '中国时报', 1, 'Zhong Guo Shi Bao');
INSERT INTO `sensitive_words` VALUES (296, '反分裂', 1, 'Fan Fen Lie');
INSERT INTO `sensitive_words` VALUES (297, '威胁论', 1, 'Wei Xie Lun');
INSERT INTO `sensitive_words` VALUES (298, '左翼联盟', 1, 'Zuo Yi Lian Meng');
INSERT INTO `sensitive_words` VALUES (299, '钓鱼岛', 1, 'Diao Yu Dao');
INSERT INTO `sensitive_words` VALUES (300, '保钓组织', 1, 'Bao Diao Zu Zhi');
INSERT INTO `sensitive_words` VALUES (301, '主权', 1, 'Zhu Quan');
INSERT INTO `sensitive_words` VALUES (302, '弓单', 1, 'Gong Dan');
INSERT INTO `sensitive_words` VALUES (303, '火乍', 1, 'Huo Zha');
INSERT INTO `sensitive_words` VALUES (304, '木仓', 1, 'Mu Cang');
INSERT INTO `sensitive_words` VALUES (305, '石肖', 1, 'Shi Xiao');
INSERT INTO `sensitive_words` VALUES (306, '核蛋', 1, 'He Dan');
INSERT INTO `sensitive_words` VALUES (307, '步qiang', 1, 'Bu q i a n g');
INSERT INTO `sensitive_words` VALUES (308, 'bao炸', 1, 'b a o Zha');
INSERT INTO `sensitive_words` VALUES (309, '爆zha', 1, 'Bao z h a');
INSERT INTO `sensitive_words` VALUES (310, 'baozha', 1, 'b a o z h a');
INSERT INTO `sensitive_words` VALUES (311, 'zha药', 1, 'z h a Yao');
INSERT INTO `sensitive_words` VALUES (312, 'zha弹', 1, 'z h a Dan');
INSERT INTO `sensitive_words` VALUES (313, '炸dan', 1, 'Zha d a n');
INSERT INTO `sensitive_words` VALUES (314, '炸yao', 1, 'Zha y a o');
INSERT INTO `sensitive_words` VALUES (315, 'zhadan', 1, 'z h a d a n');
INSERT INTO `sensitive_words` VALUES (316, 'zhayao', 1, 'z h a y a o');
INSERT INTO `sensitive_words` VALUES (317, 'hmtd', 1, 'h m t d');
INSERT INTO `sensitive_words` VALUES (318, '三硝基甲苯', 1, 'San Xiao Ji Jia Ben');
INSERT INTO `sensitive_words` VALUES (319, '六氟化铀', 1, 'Liu Fu Hua You');
INSERT INTO `sensitive_words` VALUES (320, '炸药配方', 1, 'Zha Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (321, '弹药配方', 1, 'Dan Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (322, '炸弹配方', 1, 'Zha Dan Pei Fang');
INSERT INTO `sensitive_words` VALUES (323, '皮箱炸弹', 1, 'Pi Xiang Zha Dan');
INSERT INTO `sensitive_words` VALUES (324, '火药配方', 1, 'Huo Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (325, '人体炸弹', 1, 'Ren Ti Zha Dan');
INSERT INTO `sensitive_words` VALUES (326, '人肉炸弹', 1, 'Ren Rou Zha Dan');
INSERT INTO `sensitive_words` VALUES (327, '解放军', 1, 'Jie Fang Jun');
INSERT INTO `sensitive_words` VALUES (328, '兵力部署', 1, 'Bing Li Bu Shu');
INSERT INTO `sensitive_words` VALUES (329, '军转', 1, 'Jun Zhuan');
INSERT INTO `sensitive_words` VALUES (330, '军事社', 1, 'Jun Shi She');
INSERT INTO `sensitive_words` VALUES (331, '8341部队', 1, '8 3 4 1 Bu Dui');
INSERT INTO `sensitive_words` VALUES (332, '第21集团军', 1, 'Di 2 1 Ji Tuan Jun');
INSERT INTO `sensitive_words` VALUES (333, '七大军区', 1, 'Qi Da Jun Qu');
INSERT INTO `sensitive_words` VALUES (334, '7大军区', 1, '7 Da Jun Qu');
INSERT INTO `sensitive_words` VALUES (335, '北京军区', 1, 'Bei Jing Jun Qu');
INSERT INTO `sensitive_words` VALUES (336, '沈阳军区', 1, 'Shen Yang Jun Qu');
INSERT INTO `sensitive_words` VALUES (337, '济南军区', 1, 'Ji Nan Jun Qu');
INSERT INTO `sensitive_words` VALUES (338, '成都军区', 1, 'Cheng Dou Jun Qu');
INSERT INTO `sensitive_words` VALUES (339, '广州军区', 1, 'Guang Zhou Jun Qu');
INSERT INTO `sensitive_words` VALUES (340, '南京军区', 1, 'Nan Jing Jun Qu');
INSERT INTO `sensitive_words` VALUES (341, '兰州军区', 1, 'Lan Zhou Jun Qu');
INSERT INTO `sensitive_words` VALUES (342, '颜色革命', 1, 'Yan Se Ge Ming');
INSERT INTO `sensitive_words` VALUES (343, '规模冲突', 1, 'Gui Mo Chong Tu');
INSERT INTO `sensitive_words` VALUES (344, '塔利班', 1, 'Ta Li Ban');
INSERT INTO `sensitive_words` VALUES (345, '基地组织', 1, 'Ji Di Zu Zhi');
INSERT INTO `sensitive_words` VALUES (346, '恐怖分子', 1, 'Kong Bu Fen Zi');
INSERT INTO `sensitive_words` VALUES (347, '恐怖份子', 1, 'Kong Bu Fen Zi');
INSERT INTO `sensitive_words` VALUES (348, '三股势力', 1, 'San Gu Shi Li');
INSERT INTO `sensitive_words` VALUES (349, '印尼屠华', 1, 'Yin Ni Tu Hua');
INSERT INTO `sensitive_words` VALUES (350, '印尼事件', 1, 'Yin Ni Shi Jian');
INSERT INTO `sensitive_words` VALUES (351, '蒋公纪念歌', 1, 'Jiang Gong Ji Nian Ge');
INSERT INTO `sensitive_words` VALUES (352, '马英九', 1, 'Ma Ying Jiu');
INSERT INTO `sensitive_words` VALUES (353, 'mayingjiu', 1, 'm a y i n g j i u');
INSERT INTO `sensitive_words` VALUES (354, '李天羽', 1, 'Li Tian Yu');
INSERT INTO `sensitive_words` VALUES (355, '苏贞昌', 1, 'Su Zhen Chang');
INSERT INTO `sensitive_words` VALUES (356, '林文漪', 1, 'Lin Wen Yi');
INSERT INTO `sensitive_words` VALUES (357, '陈水扁', 1, 'Chen Shui Bian');
INSERT INTO `sensitive_words` VALUES (358, '陈s扁', 1, 'Chen s Bian');
INSERT INTO `sensitive_words` VALUES (359, '陈随便', 1, 'Chen Sui Bian');
INSERT INTO `sensitive_words` VALUES (360, '阿扁', 1, 'A Bian');
INSERT INTO `sensitive_words` VALUES (361, 'a扁', 1, 'a Bian');
INSERT INTO `sensitive_words` VALUES (362, '告全国同胞书', 1, 'Gao Quan Guo Tong Bao Shu');
INSERT INTO `sensitive_words` VALUES (363, '台百度湾', 1, 'Tai Bai Du Wan');
INSERT INTO `sensitive_words` VALUES (364, '台完', 1, 'Tai Wan');
INSERT INTO `sensitive_words` VALUES (365, '台wan', 1, 'Tai w a n');
INSERT INTO `sensitive_words` VALUES (366, 'taiwan', 1, 't a i w a n');
INSERT INTO `sensitive_words` VALUES (367, '台弯', 1, 'Tai Wan');
INSERT INTO `sensitive_words` VALUES (368, '湾台', 1, 'Wan Tai');
INSERT INTO `sensitive_words` VALUES (369, '台湾国', 1, 'Tai Wan Guo');
INSERT INTO `sensitive_words` VALUES (370, '台湾共和国', 1, 'Tai Wan Gong He Guo');
INSERT INTO `sensitive_words` VALUES (371, '台军', 1, 'Tai Jun');
INSERT INTO `sensitive_words` VALUES (372, '台独', 1, 'Tai Du');
INSERT INTO `sensitive_words` VALUES (373, '台毒', 1, 'Tai Du');
INSERT INTO `sensitive_words` VALUES (374, '台du', 1, 'Tai d u');
INSERT INTO `sensitive_words` VALUES (375, 'taidu', 1, 't a i d u');
INSERT INTO `sensitive_words` VALUES (376, 'twdl', 1, 't w d l');
INSERT INTO `sensitive_words` VALUES (377, '一中一台', 1, 'Yi Zhong Yi Tai');
INSERT INTO `sensitive_words` VALUES (378, '打台湾', 1, 'Da Tai Wan');
INSERT INTO `sensitive_words` VALUES (379, '两岸关系', 1, 'Liang An Guan Xi');
INSERT INTO `sensitive_words` VALUES (380, '两岸战争', 1, 'Liang An Zhan Zheng');
INSERT INTO `sensitive_words` VALUES (381, '攻占台湾', 1, 'Gong Zhan Tai Wan');
INSERT INTO `sensitive_words` VALUES (382, '支持台湾', 1, 'Zhi Chi Tai Wan');
INSERT INTO `sensitive_words` VALUES (383, '进攻台湾', 1, 'Jin Gong Tai Wan');
INSERT INTO `sensitive_words` VALUES (384, '占领台湾', 1, 'Zhan Ling Tai Wan');
INSERT INTO `sensitive_words` VALUES (385, '统一台湾', 1, 'Tong Yi Tai Wan');
INSERT INTO `sensitive_words` VALUES (386, '收复台湾', 1, 'Shou Fu Tai Wan');
INSERT INTO `sensitive_words` VALUES (387, '登陆台湾', 1, 'Deng Lu Tai Wan');
INSERT INTO `sensitive_words` VALUES (388, '解放台湾', 1, 'Jie Fang Tai Wan');
INSERT INTO `sensitive_words` VALUES (389, '解放tw', 1, 'Jie Fang t w');
INSERT INTO `sensitive_words` VALUES (390, '解决台湾', 1, 'Jie Jue Tai Wan');
INSERT INTO `sensitive_words` VALUES (391, '光复民国', 1, 'Guang Fu Min Guo');
INSERT INTO `sensitive_words` VALUES (392, '台湾独立', 1, 'Tai Wan Du Li');
INSERT INTO `sensitive_words` VALUES (393, '台湾问题', 1, 'Tai Wan Wen Ti');
INSERT INTO `sensitive_words` VALUES (394, '台海问题', 1, 'Tai Hai Wen Ti');
INSERT INTO `sensitive_words` VALUES (395, '台海危机', 1, 'Tai Hai Wei Ji');
INSERT INTO `sensitive_words` VALUES (396, '台海统一', 1, 'Tai Hai Tong Yi');
INSERT INTO `sensitive_words` VALUES (397, '台海大战', 1, 'Tai Hai Da Zhan');
INSERT INTO `sensitive_words` VALUES (398, '台海战争', 1, 'Tai Hai Zhan Zheng');
INSERT INTO `sensitive_words` VALUES (399, '台海局势', 1, 'Tai Hai Ju Shi');
INSERT INTO `sensitive_words` VALUES (400, '入联', 1, 'Ru Lian');
INSERT INTO `sensitive_words` VALUES (401, '入耳关', 1, 'Ru Er Guan');
INSERT INTO `sensitive_words` VALUES (402, '中华联邦', 1, 'Zhong Hua Lian Bang');
INSERT INTO `sensitive_words` VALUES (403, '国民党', 1, 'Guo Min Dang');
INSERT INTO `sensitive_words` VALUES (404, 'x民党', 1, 'x Min Dang');
INSERT INTO `sensitive_words` VALUES (405, '民进党', 1, 'Min Jin Dang');
INSERT INTO `sensitive_words` VALUES (406, '青天白日', 1, 'Qing Tian Bai Ri');
INSERT INTO `sensitive_words` VALUES (407, '闹独立', 1, 'Nao Du Li');
INSERT INTO `sensitive_words` VALUES (408, 'duli', 1, 'd u l i');
INSERT INTO `sensitive_words` VALUES (409, 'fenlie', 1, 'f e n l i e');
INSERT INTO `sensitive_words` VALUES (410, '日本万岁', 1, 'Ri Ben Wan Sui');
INSERT INTO `sensitive_words` VALUES (411, '小泽一郎', 1, 'Xiao Ze Yi Lang');
INSERT INTO `sensitive_words` VALUES (412, '劣等民族', 1, 'Lie Deng Min Zu');
INSERT INTO `sensitive_words` VALUES (413, '汉人', 1, 'Han Ren');
INSERT INTO `sensitive_words` VALUES (414, '汉维', 1, 'Han Wei');
INSERT INTO `sensitive_words` VALUES (415, '维汉', 1, 'Wei Han');
INSERT INTO `sensitive_words` VALUES (416, '维吾', 1, 'Wei Wu');
INSERT INTO `sensitive_words` VALUES (417, '吾尔', 1, 'Wu Er');
INSERT INTO `sensitive_words` VALUES (418, '热比娅', 1, 'Re Bi Ya');
INSERT INTO `sensitive_words` VALUES (419, '伊力哈木', 1, 'Yi Li Ha Mu');
INSERT INTO `sensitive_words` VALUES (420, '疆独', 1, 'Jiang Du');
INSERT INTO `sensitive_words` VALUES (421, '东突厥斯坦解放组织', 1, 'Dong Tu Jue Si Tan Jie Fang Zu Zhi');
INSERT INTO `sensitive_words` VALUES (422, '东突解放组织', 1, 'Dong Tu Jie Fang Zu Zhi');
INSERT INTO `sensitive_words` VALUES (423, '蒙古分裂分子', 1, 'Meng Gu Fen Lie Fen Zi');
INSERT INTO `sensitive_words` VALUES (424, '列确', 1, 'Lie Que');
INSERT INTO `sensitive_words` VALUES (425, '阿旺晋美', 1, 'A Wang Jin Mei');
INSERT INTO `sensitive_words` VALUES (426, '藏人', 1, 'Zang Ren');
INSERT INTO `sensitive_words` VALUES (427, '臧人', 1, 'Zang Ren');
INSERT INTO `sensitive_words` VALUES (428, 'zang人', 1, 'z a n g Ren');
INSERT INTO `sensitive_words` VALUES (429, '藏民', 1, 'Zang Min');
INSERT INTO `sensitive_words` VALUES (430, '藏m', 1, 'Zang m');
INSERT INTO `sensitive_words` VALUES (431, '达赖', 1, 'Da Lai');
INSERT INTO `sensitive_words` VALUES (432, '赖达', 1, 'Lai Da');
INSERT INTO `sensitive_words` VALUES (433, 'dalai', 1, 'd a l a i');
INSERT INTO `sensitive_words` VALUES (434, '哒赖', 1, 'Da Lai');
INSERT INTO `sensitive_words` VALUES (435, 'dl喇嘛', 1, 'd l La Ma');
INSERT INTO `sensitive_words` VALUES (436, '丹增嘉措', 1, 'Dan Zeng Jia Cuo');
INSERT INTO `sensitive_words` VALUES (437, '打砸抢', 1, 'Da Za Qiang');
INSERT INTO `sensitive_words` VALUES (438, '西独', 1, 'Xi Du');
INSERT INTO `sensitive_words` VALUES (439, '藏独', 1, 'Zang Du');
INSERT INTO `sensitive_words` VALUES (440, '葬独', 1, 'Zang Du');
INSERT INTO `sensitive_words` VALUES (441, '臧独', 1, 'Zang Du');
INSERT INTO `sensitive_words` VALUES (442, '藏毒', 1, 'Zang Du');
INSERT INTO `sensitive_words` VALUES (443, '藏du', 1, 'Zang d u');
INSERT INTO `sensitive_words` VALUES (444, 'zangdu', 1, 'z a n g d u');
INSERT INTO `sensitive_words` VALUES (445, '支持zd', 1, 'Zhi Chi z d');
INSERT INTO `sensitive_words` VALUES (446, '藏暴乱', 1, 'Zang Bao Luan');
INSERT INTO `sensitive_words` VALUES (447, '藏青会', 1, 'Zang Qing Hui');
INSERT INTO `sensitive_words` VALUES (448, '雪山狮子旗', 1, 'Xue Shan Shi Zi Qi');
INSERT INTO `sensitive_words` VALUES (449, '拉萨', 1, 'La Sa');
INSERT INTO `sensitive_words` VALUES (450, '啦萨', 1, 'La Sa');
INSERT INTO `sensitive_words` VALUES (451, '啦沙', 1, 'La Sha');
INSERT INTO `sensitive_words` VALUES (452, '啦撒', 1, 'La Sa');
INSERT INTO `sensitive_words` VALUES (453, '拉sa', 1, 'La s a');
INSERT INTO `sensitive_words` VALUES (454, 'lasa', 1, 'l a s a');
INSERT INTO `sensitive_words` VALUES (455, 'la萨', 1, 'l a Sa');
INSERT INTO `sensitive_words` VALUES (456, '西藏', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (457, '藏西', 1, 'Zang Xi');
INSERT INTO `sensitive_words` VALUES (458, 'xizang', 1, 'x i z a n g');
INSERT INTO `sensitive_words` VALUES (459, 'xi藏', 1, 'x i Zang');
INSERT INTO `sensitive_words` VALUES (460, 'x藏', 1, 'x Zang');
INSERT INTO `sensitive_words` VALUES (461, '西z', 1, 'Xi z');
INSERT INTO `sensitive_words` VALUES (462, 'tibet', 1, 't i b e t');
INSERT INTO `sensitive_words` VALUES (463, '希葬', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (464, '希藏', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (465, '硒藏', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (466, '稀藏', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (467, '西脏', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (468, '西奘', 1, 'Xi Zhuang');
INSERT INTO `sensitive_words` VALUES (469, '西葬', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (470, '西臧', 1, 'Xi Zang');
INSERT INTO `sensitive_words` VALUES (471, '援藏', 1, 'Yuan Zang');
INSERT INTO `sensitive_words` VALUES (472, 'bjork', 1, 'b j o r k');
INSERT INTO `sensitive_words` VALUES (473, '王千源', 1, 'Wang Qian Yuan');
INSERT INTO `sensitive_words` VALUES (474, '安拉', 1, 'An La');
INSERT INTO `sensitive_words` VALUES (475, '回教', 1, 'Hui Jiao');
INSERT INTO `sensitive_words` VALUES (476, '回族', 1, 'Hui Zu');
INSERT INTO `sensitive_words` VALUES (477, '回回', 1, 'Hui Hui');
INSERT INTO `sensitive_words` VALUES (478, '回民', 1, 'Hui Min');
INSERT INTO `sensitive_words` VALUES (479, '穆斯林', 1, 'Mu Si Lin');
INSERT INTO `sensitive_words` VALUES (480, '穆罕穆德', 1, 'Mu Han Mu De');
INSERT INTO `sensitive_words` VALUES (481, '穆罕默德', 1, 'Mu Han Mo De');
INSERT INTO `sensitive_words` VALUES (482, '默罕默德', 1, 'Mo Han Mo De');
INSERT INTO `sensitive_words` VALUES (483, '伊斯兰', 1, 'Yi Si Lan');
INSERT INTO `sensitive_words` VALUES (484, '圣战组织', 1, 'Sheng Zhan Zu Zhi');
INSERT INTO `sensitive_words` VALUES (485, '清真', 1, 'Qing Zhen');
INSERT INTO `sensitive_words` VALUES (486, '清zhen', 1, 'Qing z h e n');
INSERT INTO `sensitive_words` VALUES (487, 'qingzhen', 1, 'q i n g z h e n');
INSERT INTO `sensitive_words` VALUES (488, '真主', 1, 'Zhen Zhu');
INSERT INTO `sensitive_words` VALUES (489, '阿拉伯', 1, 'A La Bo');
INSERT INTO `sensitive_words` VALUES (490, '高丽棒子', 1, 'Gao Li Bang Zi');
INSERT INTO `sensitive_words` VALUES (491, '韩国狗', 1, 'Han Guo Gou');
INSERT INTO `sensitive_words` VALUES (492, '满洲第三帝国', 1, 'Man Zhou Di San Di Guo');
INSERT INTO `sensitive_words` VALUES (493, '满狗', 1, 'Man Gou');
INSERT INTO `sensitive_words` VALUES (494, '鞑子', 1, 'Da Zi');
INSERT INTO `sensitive_words` VALUES (495, '领导名人类：', 1, 'Ling Dao Ming Ren Lei ：');
INSERT INTO `sensitive_words` VALUES (496, '胡的接班人', 1, 'Hu De Jie Ban Ren');
INSERT INTO `sensitive_words` VALUES (497, '钦定接班人', 1, 'Qin Ding Jie Ban Ren');
INSERT INTO `sensitive_words` VALUES (498, '习近平', 1, 'Xi Jin Ping');
INSERT INTO `sensitive_words` VALUES (499, '平近习', 1, 'Ping Jin Xi');
INSERT INTO `sensitive_words` VALUES (500, 'xjp', 1, 'x j p');
INSERT INTO `sensitive_words` VALUES (501, '习太子', 1, 'Xi Tai Zi');
INSERT INTO `sensitive_words` VALUES (502, '习明泽', 1, 'Xi Ming Ze');
INSERT INTO `sensitive_words` VALUES (503, '老习', 1, 'Lao Xi');
INSERT INTO `sensitive_words` VALUES (504, '温家宝', 1, 'Wen Jia Bao');
INSERT INTO `sensitive_words` VALUES (505, '温加宝', 1, 'Wen Jia Bao');
INSERT INTO `sensitive_words` VALUES (506, '温x', 1, 'Wen x');
INSERT INTO `sensitive_words` VALUES (507, '温jia宝', 1, 'Wen j i a Bao');
INSERT INTO `sensitive_words` VALUES (508, '温宝宝', 1, 'Wen Bao Bao');
INSERT INTO `sensitive_words` VALUES (509, '温加饱', 1, 'Wen Jia Bao');
INSERT INTO `sensitive_words` VALUES (510, '温加保', 1, 'Wen Jia Bao');
INSERT INTO `sensitive_words` VALUES (511, '张培莉', 1, 'Zhang Pei Li');
INSERT INTO `sensitive_words` VALUES (512, '温云松', 1, 'Wen Yun Song');
INSERT INTO `sensitive_words` VALUES (513, '温如春', 1, 'Wen Ru Chun');
INSERT INTO `sensitive_words` VALUES (514, '温jb', 1, 'Wen j b');
INSERT INTO `sensitive_words` VALUES (515, '胡温', 1, 'Hu Wen');
INSERT INTO `sensitive_words` VALUES (516, '胡x', 1, 'Hu x');
INSERT INTO `sensitive_words` VALUES (517, '胡jt', 1, 'Hu j t');
INSERT INTO `sensitive_words` VALUES (518, '胡boss', 1, 'Hu b o s s');
INSERT INTO `sensitive_words` VALUES (519, '胡总', 1, 'Hu Zong');
INSERT INTO `sensitive_words` VALUES (520, '胡王八', 1, 'Hu Wang Ba');
INSERT INTO `sensitive_words` VALUES (521, 'hujintao', 1, 'h u j i n t a o');
INSERT INTO `sensitive_words` VALUES (522, '胡jintao', 1, 'Hu j i n t a o');
INSERT INTO `sensitive_words` VALUES (523, '胡j涛', 1, 'Hu j Tao');
INSERT INTO `sensitive_words` VALUES (524, '胡惊涛', 1, 'Hu Jing Tao');
INSERT INTO `sensitive_words` VALUES (525, '胡景涛', 1, 'Hu Jing Tao');
INSERT INTO `sensitive_words` VALUES (526, '胡紧掏', 1, 'Hu Jin Tao');
INSERT INTO `sensitive_words` VALUES (527, '湖紧掏', 1, 'Hu Jin Tao');
INSERT INTO `sensitive_words` VALUES (528, '胡紧套', 1, 'Hu Jin Tao');
INSERT INTO `sensitive_words` VALUES (529, '锦涛', 1, 'Jin Tao');
INSERT INTO `sensitive_words` VALUES (530, 'hjt', 1, 'h j t');
INSERT INTO `sensitive_words` VALUES (531, '胡派', 1, 'Hu Pai');
INSERT INTO `sensitive_words` VALUES (532, '胡主席', 1, 'Hu Zhu Xi');
INSERT INTO `sensitive_words` VALUES (533, '刘永清', 1, 'Liu Yong Qing');
INSERT INTO `sensitive_words` VALUES (534, '胡海峰', 1, 'Hu Hai Feng');
INSERT INTO `sensitive_words` VALUES (535, '胡海清', 1, 'Hu Hai Qing');
INSERT INTO `sensitive_words` VALUES (536, '江泽民', 1, 'Jiang Ze Min');
INSERT INTO `sensitive_words` VALUES (537, '民泽江', 1, 'Min Ze Jiang');
INSERT INTO `sensitive_words` VALUES (538, '江胡', 1, 'Jiang Hu');
INSERT INTO `sensitive_words` VALUES (539, '江哥', 1, 'Jiang Ge');
INSERT INTO `sensitive_words` VALUES (540, '江主席', 1, 'Jiang Zhu Xi');
INSERT INTO `sensitive_words` VALUES (541, '江书记', 1, 'Jiang Shu Ji');
INSERT INTO `sensitive_words` VALUES (542, '江浙闽', 1, 'Jiang Zhe Min');
INSERT INTO `sensitive_words` VALUES (543, '江沢民', 1, 'Jiang Ze Min');
INSERT INTO `sensitive_words` VALUES (544, '江浙民', 1, 'Jiang Zhe Min');
INSERT INTO `sensitive_words` VALUES (545, '择民', 1, 'Ze Min');
INSERT INTO `sensitive_words` VALUES (546, '则民', 1, 'Ze Min');
INSERT INTO `sensitive_words` VALUES (547, '茳泽民', 1, 'Jiang Ze Min');
INSERT INTO `sensitive_words` VALUES (548, 'zemin', 1, 'z e m i n');
INSERT INTO `sensitive_words` VALUES (549, 'ze民', 1, 'z e Min');
INSERT INTO `sensitive_words` VALUES (550, '老江', 1, 'Lao Jiang');
INSERT INTO `sensitive_words` VALUES (551, '老j', 1, 'Lao j');
INSERT INTO `sensitive_words` VALUES (552, '江core', 1, 'Jiang c o r e');
INSERT INTO `sensitive_words` VALUES (553, '江x', 1, 'Jiang x');
INSERT INTO `sensitive_words` VALUES (554, '江派', 1, 'Jiang Pai');
INSERT INTO `sensitive_words` VALUES (555, '江zm', 1, 'Jiang z m');
INSERT INTO `sensitive_words` VALUES (556, 'jzm', 1, 'j z m');
INSERT INTO `sensitive_words` VALUES (557, '江戏子', 1, 'Jiang Xi Zi');
INSERT INTO `sensitive_words` VALUES (558, '江蛤蟆', 1, 'Jiang Ha Ma');
INSERT INTO `sensitive_words` VALUES (559, '江某某', 1, 'Jiang Mou Mou');
INSERT INTO `sensitive_words` VALUES (560, '江贼', 1, 'Jiang Zei');
INSERT INTO `sensitive_words` VALUES (561, '江猪', 1, 'Jiang Zhu');
INSERT INTO `sensitive_words` VALUES (562, '江氏集团', 1, 'Jiang Shi Ji Tuan');
INSERT INTO `sensitive_words` VALUES (563, '江绵恒', 1, 'Jiang Mian Heng');
INSERT INTO `sensitive_words` VALUES (564, '江绵康', 1, 'Jiang Mian Kang');
INSERT INTO `sensitive_words` VALUES (565, '王冶坪', 1, 'Wang Ye Ping');
INSERT INTO `sensitive_words` VALUES (566, '江泽慧', 1, 'Jiang Ze Hui');
INSERT INTO `sensitive_words` VALUES (567, '邓小平', 1, 'Deng Xiao Ping');
INSERT INTO `sensitive_words` VALUES (568, '平小邓', 1, 'Ping Xiao Deng');
INSERT INTO `sensitive_words` VALUES (569, 'xiao平', 1, 'x i a o Ping');
INSERT INTO `sensitive_words` VALUES (570, '邓xp', 1, 'Deng x p');
INSERT INTO `sensitive_words` VALUES (571, '邓晓平', 1, 'Deng Xiao Ping');
INSERT INTO `sensitive_words` VALUES (572, '邓朴方', 1, 'Deng Po Fang');
INSERT INTO `sensitive_words` VALUES (573, '邓榕', 1, 'Deng Rong');
INSERT INTO `sensitive_words` VALUES (574, '邓质方', 1, 'Deng Zhi Fang');
INSERT INTO `sensitive_words` VALUES (575, '毛泽东', 1, 'Mao Ze Dong');
INSERT INTO `sensitive_words` VALUES (576, '猫泽东', 1, 'Mao Ze Dong');
INSERT INTO `sensitive_words` VALUES (577, '猫则东', 1, 'Mao Ze Dong');
INSERT INTO `sensitive_words` VALUES (578, 'chairmanmao', 1, 'c h a i r m a n m a o');
INSERT INTO `sensitive_words` VALUES (579, '猫贼洞', 1, 'Mao Zei Dong');
INSERT INTO `sensitive_words` VALUES (580, '毛zd', 1, 'Mao z d');
INSERT INTO `sensitive_words` VALUES (581, '毛zx', 1, 'Mao z x');
INSERT INTO `sensitive_words` VALUES (582, 'z东', 1, 'z Dong');
INSERT INTO `sensitive_words` VALUES (583, 'ze东', 1, 'z e Dong');
INSERT INTO `sensitive_words` VALUES (584, '泽d', 1, 'Ze d');
INSERT INTO `sensitive_words` VALUES (585, 'zedong', 1, 'z e d o n g');
INSERT INTO `sensitive_words` VALUES (586, '毛太祖', 1, 'Mao Tai Zu');
INSERT INTO `sensitive_words` VALUES (587, '毛相', 1, 'Mao Xiang');
INSERT INTO `sensitive_words` VALUES (588, '主席画像', 1, 'Zhu Xi Hua Xiang');
INSERT INTO `sensitive_words` VALUES (589, '改革历程', 1, 'Gai Ge Li Cheng');
INSERT INTO `sensitive_words` VALUES (590, '朱镕基', 1, 'Zhu Rong Ji');
INSERT INTO `sensitive_words` VALUES (591, '朱容基', 1, 'Zhu Rong Ji');
INSERT INTO `sensitive_words` VALUES (592, '朱镕鸡', 1, 'Zhu Rong Ji');
INSERT INTO `sensitive_words` VALUES (593, '朱容鸡', 1, 'Zhu Rong Ji');
INSERT INTO `sensitive_words` VALUES (594, '朱云来', 1, 'Zhu Yun Lai');
INSERT INTO `sensitive_words` VALUES (595, '李鹏', 1, 'Li Peng');
INSERT INTO `sensitive_words` VALUES (596, '李peng', 1, 'Li p e n g');
INSERT INTO `sensitive_words` VALUES (597, '里鹏', 1, 'Li Peng');
INSERT INTO `sensitive_words` VALUES (598, '李月月鸟', 1, 'Li Yue Yue Niao');
INSERT INTO `sensitive_words` VALUES (599, '李小鹏', 1, 'Li Xiao Peng');
INSERT INTO `sensitive_words` VALUES (600, '李小琳', 1, 'Li Xiao Lin');
INSERT INTO `sensitive_words` VALUES (601, '华主席', 1, 'Hua Zhu Xi');
INSERT INTO `sensitive_words` VALUES (602, '华国', 1, 'Hua Guo');
INSERT INTO `sensitive_words` VALUES (603, '国锋', 1, 'Guo Feng');
INSERT INTO `sensitive_words` VALUES (604, '国峰', 1, 'Guo Feng');
INSERT INTO `sensitive_words` VALUES (605, '锋同志', 1, 'Feng Tong Zhi');
INSERT INTO `sensitive_words` VALUES (606, '白春礼', 1, 'Bai Chun Li');
INSERT INTO `sensitive_words` VALUES (607, '薄熙来', 1, 'Bo Xi Lai');
INSERT INTO `sensitive_words` VALUES (608, '薄一波', 1, 'Bo Yi Bo');
INSERT INTO `sensitive_words` VALUES (609, '蔡赴朝', 1, 'Cai Fu Chao');
INSERT INTO `sensitive_words` VALUES (610, '蔡武', 1, 'Cai Wu');
INSERT INTO `sensitive_words` VALUES (611, '曹刚川', 1, 'Cao Gang Chuan');
INSERT INTO `sensitive_words` VALUES (612, '常万全', 1, 'Chang Wan Quan');
INSERT INTO `sensitive_words` VALUES (613, '陈炳德', 1, 'Chen Bing De');
INSERT INTO `sensitive_words` VALUES (614, '陈德铭', 1, 'Chen De Ming');
INSERT INTO `sensitive_words` VALUES (615, '陈建国', 1, 'Chen Jian Guo');
INSERT INTO `sensitive_words` VALUES (616, '陈良宇', 1, 'Chen Liang Yu');
INSERT INTO `sensitive_words` VALUES (617, '陈绍基', 1, 'Chen Shao Ji');
INSERT INTO `sensitive_words` VALUES (618, '陈同海', 1, 'Chen Tong Hai');
INSERT INTO `sensitive_words` VALUES (619, '陈至立', 1, 'Chen Zhi Li');
INSERT INTO `sensitive_words` VALUES (620, '戴秉国', 1, 'Dai Bing Guo');
INSERT INTO `sensitive_words` VALUES (621, '丁一平', 1, 'Ding Yi Ping');
INSERT INTO `sensitive_words` VALUES (622, '董建华', 1, 'Dong Jian Hua');
INSERT INTO `sensitive_words` VALUES (623, '杜德印', 1, 'Du De Yin');
INSERT INTO `sensitive_words` VALUES (624, '杜世成', 1, 'Du Shi Cheng');
INSERT INTO `sensitive_words` VALUES (625, '傅锐', 1, 'Fu Rui');
INSERT INTO `sensitive_words` VALUES (626, '郭伯雄', 1, 'Guo Bo Xiong');
INSERT INTO `sensitive_words` VALUES (627, '郭金龙', 1, 'Guo Jin Long');
INSERT INTO `sensitive_words` VALUES (628, '贺国强', 1, 'He Guo Qiang');
INSERT INTO `sensitive_words` VALUES (629, '胡春华', 1, 'Hu Chun Hua');
INSERT INTO `sensitive_words` VALUES (630, '耀邦', 1, 'Yao Bang');
INSERT INTO `sensitive_words` VALUES (631, '华建敏', 1, 'Hua Jian Min');
INSERT INTO `sensitive_words` VALUES (632, '黄华华', 1, 'Huang Hua Hua');
INSERT INTO `sensitive_words` VALUES (633, '黄丽满', 1, 'Huang Li Man');
INSERT INTO `sensitive_words` VALUES (634, '黄兴国', 1, 'Huang Xing Guo');
INSERT INTO `sensitive_words` VALUES (635, '回良玉', 1, 'Hui Liang Yu');
INSERT INTO `sensitive_words` VALUES (636, '贾庆林', 1, 'Jia Qing Lin');
INSERT INTO `sensitive_words` VALUES (637, '贾廷安', 1, 'Jia Ting An');
INSERT INTO `sensitive_words` VALUES (638, '靖志远', 1, 'Jing Zhi Yuan');
INSERT INTO `sensitive_words` VALUES (639, '李长春', 1, 'Li Zhang Chun');
INSERT INTO `sensitive_words` VALUES (640, '李春城', 1, 'Li Chun Cheng');
INSERT INTO `sensitive_words` VALUES (641, '李建国', 1, 'Li Jian Guo');
INSERT INTO `sensitive_words` VALUES (642, '李克强', 1, 'Li Ke Qiang');
INSERT INTO `sensitive_words` VALUES (643, '李岚清', 1, 'Li Lan Qing');
INSERT INTO `sensitive_words` VALUES (644, '李沛瑶', 1, 'Li Pei Yao');
INSERT INTO `sensitive_words` VALUES (645, '李荣融', 1, 'Li Rong Rong');
INSERT INTO `sensitive_words` VALUES (646, '李瑞环', 1, 'Li Rui Huan');
INSERT INTO `sensitive_words` VALUES (647, '李铁映', 1, 'Li Tie Ying');
INSERT INTO `sensitive_words` VALUES (648, '李先念', 1, 'Li Xian Nian');
INSERT INTO `sensitive_words` VALUES (649, '李学举', 1, 'Li Xue Ju');
INSERT INTO `sensitive_words` VALUES (650, '李源潮', 1, 'Li Yuan Chao');
INSERT INTO `sensitive_words` VALUES (651, '栗智', 1, 'Li Zhi');
INSERT INTO `sensitive_words` VALUES (652, '梁光烈', 1, 'Liang Guang Lie');
INSERT INTO `sensitive_words` VALUES (653, '廖锡龙', 1, 'Liao Xi Long');
INSERT INTO `sensitive_words` VALUES (654, '林树森', 1, 'Lin Shu Sen');
INSERT INTO `sensitive_words` VALUES (655, '林炎志', 1, 'Lin Yan Zhi');
INSERT INTO `sensitive_words` VALUES (656, '林左鸣', 1, 'Lin Zuo Ming');
INSERT INTO `sensitive_words` VALUES (657, '令计划', 1, 'Ling Ji Hua');
INSERT INTO `sensitive_words` VALUES (658, '柳斌杰', 1, 'Liu Bin Jie');
INSERT INTO `sensitive_words` VALUES (659, '刘奇葆', 1, 'Liu Qi Bao');
INSERT INTO `sensitive_words` VALUES (660, '刘少奇', 1, 'Liu Shao Qi');
INSERT INTO `sensitive_words` VALUES (661, '刘延东', 1, 'Liu Yan Dong');
INSERT INTO `sensitive_words` VALUES (662, '刘云山', 1, 'Liu Yun Shan');
INSERT INTO `sensitive_words` VALUES (663, '刘志军', 1, 'Liu Zhi Jun');
INSERT INTO `sensitive_words` VALUES (664, '龙新民', 1, 'Long Xin Min');
INSERT INTO `sensitive_words` VALUES (665, '路甬祥', 1, 'Lu Yong Xiang');
INSERT INTO `sensitive_words` VALUES (666, '罗箭', 1, 'Luo Jian');
INSERT INTO `sensitive_words` VALUES (667, '吕祖善', 1, 'Lv Zu Shan');
INSERT INTO `sensitive_words` VALUES (668, '马飚', 1, 'Ma Biao');
INSERT INTO `sensitive_words` VALUES (669, '马恺', 1, 'Ma Kai');
INSERT INTO `sensitive_words` VALUES (670, '孟建柱', 1, 'Meng Jian Zhu');
INSERT INTO `sensitive_words` VALUES (671, '欧广源', 1, 'Ou Guang Yuan');
INSERT INTO `sensitive_words` VALUES (672, '强卫', 1, 'Qiang Wei');
INSERT INTO `sensitive_words` VALUES (673, '沈跃跃', 1, 'Shen Yue Yue');
INSERT INTO `sensitive_words` VALUES (674, '宋平顺', 1, 'Song Ping Shun');
INSERT INTO `sensitive_words` VALUES (675, '粟戎生', 1, 'Su Rong Sheng');
INSERT INTO `sensitive_words` VALUES (676, '苏树林', 1, 'Su Shu Lin');
INSERT INTO `sensitive_words` VALUES (677, '孙家正', 1, 'Sun Jia Zheng');
INSERT INTO `sensitive_words` VALUES (678, '铁凝', 1, 'Tie Ning');
INSERT INTO `sensitive_words` VALUES (679, '屠光绍', 1, 'Tu Guang Shao');
INSERT INTO `sensitive_words` VALUES (680, '王东明', 1, 'Wang Dong Ming');
INSERT INTO `sensitive_words` VALUES (681, '汪东兴', 1, 'Wang Dong Xing');
INSERT INTO `sensitive_words` VALUES (682, '王鸿举', 1, 'Wang Hong Ju');
INSERT INTO `sensitive_words` VALUES (683, '王沪宁', 1, 'Wang Hu Ning');
INSERT INTO `sensitive_words` VALUES (684, '王乐泉', 1, 'Wang Le Quan');
INSERT INTO `sensitive_words` VALUES (685, '王洛林', 1, 'Wang Luo Lin');
INSERT INTO `sensitive_words` VALUES (686, '王岐山', 1, 'Wang Qi Shan');
INSERT INTO `sensitive_words` VALUES (687, '王胜俊', 1, 'Wang Sheng Jun');
INSERT INTO `sensitive_words` VALUES (688, '王太华', 1, 'Wang Tai Hua');
INSERT INTO `sensitive_words` VALUES (689, '王学军', 1, 'Wang Xue Jun');
INSERT INTO `sensitive_words` VALUES (690, '王兆国', 1, 'Wang Zhao Guo');
INSERT INTO `sensitive_words` VALUES (691, '王振华', 1, 'Wang Zhen Hua');
INSERT INTO `sensitive_words` VALUES (692, '吴邦国', 1, 'Wu Bang Guo');
INSERT INTO `sensitive_words` VALUES (693, '吴定富', 1, 'Wu Ding Fu');
INSERT INTO `sensitive_words` VALUES (694, '吴官正', 1, 'Wu Guan Zheng');
INSERT INTO `sensitive_words` VALUES (695, '无官正', 1, 'Wu Guan Zheng');
INSERT INTO `sensitive_words` VALUES (696, '吴胜利', 1, 'Wu Sheng Li');
INSERT INTO `sensitive_words` VALUES (697, '吴仪', 1, 'Wu Yi');
INSERT INTO `sensitive_words` VALUES (698, '奚国华', 1, 'Xi Guo Hua');
INSERT INTO `sensitive_words` VALUES (699, '习仲勋', 1, 'Xi Zhong Xun');
INSERT INTO `sensitive_words` VALUES (700, '徐才厚', 1, 'Xu Cai Hou');
INSERT INTO `sensitive_words` VALUES (701, '许其亮', 1, 'Xu Qi Liang');
INSERT INTO `sensitive_words` VALUES (702, '徐绍史', 1, 'Xu Shao Shi');
INSERT INTO `sensitive_words` VALUES (703, '杨洁篪', 1, 'Yang Jie Chi');
INSERT INTO `sensitive_words` VALUES (704, '叶剑英', 1, 'Ye Jian Ying');
INSERT INTO `sensitive_words` VALUES (705, '由喜贵', 1, 'You Xi Gui');
INSERT INTO `sensitive_words` VALUES (706, '于幼军', 1, 'Yu You Jun');
INSERT INTO `sensitive_words` VALUES (707, '俞正声', 1, 'Yu Zheng Sheng');
INSERT INTO `sensitive_words` VALUES (708, '袁纯清', 1, 'Yuan Chun Qing');
INSERT INTO `sensitive_words` VALUES (709, '曾培炎', 1, 'Ceng Pei Yan');
INSERT INTO `sensitive_words` VALUES (710, '曾庆红', 1, 'Ceng Qing Hong');
INSERT INTO `sensitive_words` VALUES (711, '曾宪梓', 1, 'Ceng Xian Zi');
INSERT INTO `sensitive_words` VALUES (712, '曾荫权', 1, 'Ceng Yin Quan');
INSERT INTO `sensitive_words` VALUES (713, '张德江', 1, 'Zhang De Jiang');
INSERT INTO `sensitive_words` VALUES (714, '张定发', 1, 'Zhang Ding Fa');
INSERT INTO `sensitive_words` VALUES (715, '张高丽', 1, 'Zhang Gao Li');
INSERT INTO `sensitive_words` VALUES (716, '张立昌', 1, 'Zhang Li Chang');
INSERT INTO `sensitive_words` VALUES (717, '张荣坤', 1, 'Zhang Rong Kun');
INSERT INTO `sensitive_words` VALUES (718, '张志国', 1, 'Zhang Zhi Guo');
INSERT INTO `sensitive_words` VALUES (719, '赵洪祝', 1, 'Zhao Hong Zhu');
INSERT INTO `sensitive_words` VALUES (720, '紫阳', 1, 'Zi Yang');
INSERT INTO `sensitive_words` VALUES (721, '周生贤', 1, 'Zhou Sheng Xian');
INSERT INTO `sensitive_words` VALUES (722, '周永康', 1, 'Zhou Yong Kang');
INSERT INTO `sensitive_words` VALUES (723, '朱海仑', 1, 'Zhu Hai Lun');
INSERT INTO `sensitive_words` VALUES (724, '政治局常委', 1, 'Zheng Zhi Ju Chang Wei');
INSERT INTO `sensitive_words` VALUES (725, '中纪委', 1, 'Zhong Ji Wei');
INSERT INTO `sensitive_words` VALUES (726, '主席像', 1, 'Zhu Xi Xiang');
INSERT INTO `sensitive_words` VALUES (727, '总书记', 1, 'Zong Shu Ji');
INSERT INTO `sensitive_words` VALUES (728, '中南海', 1, 'Zhong Nan Hai');
INSERT INTO `sensitive_words` VALUES (729, '大陆当局', 1, 'Da Lu Dang Ju');
INSERT INTO `sensitive_words` VALUES (730, '中国当局', 1, 'Zhong Guo Dang Ju');
INSERT INTO `sensitive_words` VALUES (731, '北京当局', 1, 'Bei Jing Dang Ju');
INSERT INTO `sensitive_words` VALUES (732, '共产党', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (733, '党产共', 1, 'Dang Chan Gong');
INSERT INTO `sensitive_words` VALUES (734, 'gcd', 1, 'g c d');
INSERT INTO `sensitive_words` VALUES (735, '共贪党', 1, 'Gong Tan Dang');
INSERT INTO `sensitive_words` VALUES (736, 'gongchandang', 1, 'g o n g c h a n d a n g');
INSERT INTO `sensitive_words` VALUES (737, '阿共', 1, 'A Gong');
INSERT INTO `sensitive_words` VALUES (738, '共一产一党', 1, 'Gong Yi Chan Yi Dang');
INSERT INTO `sensitive_words` VALUES (739, '产党共', 1, 'Chan Dang Gong');
INSERT INTO `sensitive_words` VALUES (740, '公产党', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (741, '工产党', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (742, '共c党', 1, 'Gong c Dang');
INSERT INTO `sensitive_words` VALUES (743, '共x党', 1, 'Gong x Dang');
INSERT INTO `sensitive_words` VALUES (744, '共铲', 1, 'Gong Chan');
INSERT INTO `sensitive_words` VALUES (745, '供产', 1, 'Gong Chan');
INSERT INTO `sensitive_words` VALUES (746, '共惨', 1, 'Gong Can');
INSERT INTO `sensitive_words` VALUES (747, '供铲党', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (748, '供铲谠', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (749, '供铲裆', 1, 'Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (750, '共残党', 1, 'Gong Can Dang');
INSERT INTO `sensitive_words` VALUES (751, '共残主义', 1, 'Gong Can Zhu Yi');
INSERT INTO `sensitive_words` VALUES (752, '共产主义的幽灵', 1, 'Gong Chan Zhu Yi De You Ling');
INSERT INTO `sensitive_words` VALUES (753, '拱铲', 1, 'Gong Chan');
INSERT INTO `sensitive_words` VALUES (754, '老共', 1, 'Lao Gong');
INSERT INTO `sensitive_words` VALUES (755, '中共', 1, 'Zhong Gong');
INSERT INTO `sensitive_words` VALUES (756, '中珙', 1, 'Zhong Gong');
INSERT INTO `sensitive_words` VALUES (757, '中gong', 1, 'Zhong g o n g');
INSERT INTO `sensitive_words` VALUES (758, 'gc党', 1, 'g c Dang');
INSERT INTO `sensitive_words` VALUES (759, '贡挡', 1, 'Gong Dang');
INSERT INTO `sensitive_words` VALUES (760, 'gong党', 1, 'g o n g Dang');
INSERT INTO `sensitive_words` VALUES (761, 'g产', 1, 'g Chan');
INSERT INTO `sensitive_words` VALUES (762, '狗产蛋', 1, 'Gou Chan Dan');
INSERT INTO `sensitive_words` VALUES (763, '共残裆', 1, 'Gong Can Dang');
INSERT INTO `sensitive_words` VALUES (764, '恶党', 1, 'E Dang');
INSERT INTO `sensitive_words` VALUES (765, '邪党', 1, 'Xie Dang');
INSERT INTO `sensitive_words` VALUES (766, '共产专制', 1, 'Gong Chan Zhuan Zhi');
INSERT INTO `sensitive_words` VALUES (767, '共产王朝', 1, 'Gong Chan Wang Chao');
INSERT INTO `sensitive_words` VALUES (768, '裆中央', 1, 'Dang Zhong Yang');
INSERT INTO `sensitive_words` VALUES (769, '土共', 1, 'Tu Gong');
INSERT INTO `sensitive_words` VALUES (770, '土g', 1, 'Tu g');
INSERT INTO `sensitive_words` VALUES (771, '共狗', 1, 'Gong Gou');
INSERT INTO `sensitive_words` VALUES (772, 'g匪', 1, 'g Fei');
INSERT INTO `sensitive_words` VALUES (773, '共匪', 1, 'Gong Fei');
INSERT INTO `sensitive_words` VALUES (774, '仇共', 1, 'Chou Gong');
INSERT INTO `sensitive_words` VALUES (775, 'communistparty', 1, 'c o m m u n i s t p a r t y');
INSERT INTO `sensitive_words` VALUES (776, '政府', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (777, '症腐', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (778, '政腐', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (779, '政付', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (780, '正府', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (781, '政俯', 1, 'Zheng Fu');
INSERT INTO `sensitive_words` VALUES (782, '政一府', 1, 'Zheng Yi Fu');
INSERT INTO `sensitive_words` VALUES (783, '政百度府', 1, 'Zheng Bai Du Fu');
INSERT INTO `sensitive_words` VALUES (784, '政f', 1, 'Zheng f');
INSERT INTO `sensitive_words` VALUES (785, 'zhengfu', 1, 'z h e n g f u');
INSERT INTO `sensitive_words` VALUES (786, '政zhi', 1, 'Zheng z h i');
INSERT INTO `sensitive_words` VALUES (787, '挡中央', 1, 'Dang Zhong Yang');
INSERT INTO `sensitive_words` VALUES (788, '档中央', 1, 'Dang Zhong Yang');
INSERT INTO `sensitive_words` VALUES (789, '中央领导', 1, 'Zhong Yang Ling Dao');
INSERT INTO `sensitive_words` VALUES (790, '中国zf', 1, 'Zhong Guo z f');
INSERT INTO `sensitive_words` VALUES (791, '中央zf', 1, 'Zhong Yang z f');
INSERT INTO `sensitive_words` VALUES (792, '国wu院', 1, 'Guo w u Yuan');
INSERT INTO `sensitive_words` VALUES (793, '中华帝国', 1, 'Zhong Hua Di Guo');
INSERT INTO `sensitive_words` VALUES (794, 'gong和', 1, 'g o n g He');
INSERT INTO `sensitive_words` VALUES (795, '大陆官方', 1, 'Da Lu Guan Fang');
INSERT INTO `sensitive_words` VALUES (796, '北京政权 ', 1, 'Bei Jing Zheng Quan');
INSERT INTO `sensitive_words` VALUES (797, '迷信、邪教类：', 1, 'Mi Xin 、 Xie Jiao Lei ：');
INSERT INTO `sensitive_words` VALUES (798, '福音会', 1, 'Fu Yin Hui');
INSERT INTO `sensitive_words` VALUES (799, '中国教徒', 1, 'Zhong Guo Jiao Tu');
INSERT INTO `sensitive_words` VALUES (800, '统一教', 1, 'Tong Yi Jiao');
INSERT INTO `sensitive_words` VALUES (801, '观音法门', 1, 'Guan Yin Fa Men');
INSERT INTO `sensitive_words` VALUES (802, '清海无上师', 1, 'Qing Hai Wu Shang Shi');
INSERT INTO `sensitive_words` VALUES (803, '盘古', 1, 'Pan Gu');
INSERT INTO `sensitive_words` VALUES (804, '李洪志', 1, 'Li Hong Zhi');
INSERT INTO `sensitive_words` VALUES (805, '志洪李', 1, 'Zhi Hong Li');
INSERT INTO `sensitive_words` VALUES (806, '李宏志', 1, 'Li Hong Zhi');
INSERT INTO `sensitive_words` VALUES (807, '轮功', 1, 'Lun Gong');
INSERT INTO `sensitive_words` VALUES (808, '法轮', 1, 'Fa Lun');
INSERT INTO `sensitive_words` VALUES (809, '轮法功', 1, 'Lun Fa Gong');
INSERT INTO `sensitive_words` VALUES (810, '三去车仑', 1, 'San Qu Che Lun');
INSERT INTO `sensitive_words` VALUES (811, '氵去车仑', 1, 'Shui Qu Che Lun');
INSERT INTO `sensitive_words` VALUES (812, '发论工', 1, 'Fa Lun Gong');
INSERT INTO `sensitive_words` VALUES (813, '法x功', 1, 'Fa x Gong');
INSERT INTO `sensitive_words` VALUES (814, '法o功', 1, 'Fa o Gong');
INSERT INTO `sensitive_words` VALUES (815, '法0功', 1, 'Fa 0 Gong');
INSERT INTO `sensitive_words` VALUES (816, '法一轮一功', 1, 'Fa Yi Lun Yi Gong');
INSERT INTO `sensitive_words` VALUES (817, '轮子功', 1, 'Lun Zi Gong');
INSERT INTO `sensitive_words` VALUES (818, '车仑工力', 1, 'Che Lun Gong Li');
INSERT INTO `sensitive_words` VALUES (819, '法lun', 1, 'Fa l u n');
INSERT INTO `sensitive_words` VALUES (820, 'fa轮', 1, 'f a Lun');
INSERT INTO `sensitive_words` VALUES (821, '法lg', 1, 'Fa l g');
INSERT INTO `sensitive_words` VALUES (822, 'flg', 1, 'f l g');
INSERT INTO `sensitive_words` VALUES (823, 'fl功', 1, 'f l Gong');
INSERT INTO `sensitive_words` VALUES (824, 'falungong', 1, 'f a l u n g o n g');
INSERT INTO `sensitive_words` VALUES (825, '大法弟子', 1, 'Da Fa Di Zi');
INSERT INTO `sensitive_words` VALUES (826, '大纪元', 1, 'Da Ji Yuan');
INSERT INTO `sensitive_words` VALUES (827, 'dajiyuan', 1, 'd a j i y u a n');
INSERT INTO `sensitive_words` VALUES (828, '明慧网', 1, 'Ming Hui Wang');
INSERT INTO `sensitive_words` VALUES (829, '明慧周报', 1, 'Ming Hui Zhou Bao');
INSERT INTO `sensitive_words` VALUES (830, '正见网', 1, 'Zheng Jian Wang');
INSERT INTO `sensitive_words` VALUES (831, '新唐人', 1, 'Xin Tang Ren');
INSERT INTO `sensitive_words` VALUES (832, '伪火', 1, 'Wei Huo');
INSERT INTO `sensitive_words` VALUES (833, '退党', 1, 'Tui Dang');
INSERT INTO `sensitive_words` VALUES (834, 'tuidang', 1, 't u i d a n g');
INSERT INTO `sensitive_words` VALUES (835, '退dang', 1, 'Tui d a n g');
INSERT INTO `sensitive_words` VALUES (836, '超越红墙', 1, 'Chao Yue Hong Qiang');
INSERT INTO `sensitive_words` VALUES (837, '自fen', 1, 'Zi f e n');
INSERT INTO `sensitive_words` VALUES (838, '真善忍', 1, 'Zhen Shan Ren');
INSERT INTO `sensitive_words` VALUES (839, '九评', 1, 'Jiu Ping');
INSERT INTO `sensitive_words` VALUES (840, '9评', 1, '9 Ping');
INSERT INTO `sensitive_words` VALUES (841, '9ping', 1, '9 p i n g');
INSERT INTO `sensitive_words` VALUES (842, '九ping', 1, 'Jiu p i n g');
INSERT INTO `sensitive_words` VALUES (843, 'jiuping', 1, 'j i u p i n g');
INSERT INTO `sensitive_words` VALUES (844, '藏字石', 1, 'Zang Zi Shi');
INSERT INTO `sensitive_words` VALUES (845, '集体自杀', 1, 'Ji Ti Zi Sha');
INSERT INTO `sensitive_words` VALUES (846, '自sha', 1, 'Zi s h a');
INSERT INTO `sensitive_words` VALUES (847, 'zi杀', 1, 'z i Sha');
INSERT INTO `sensitive_words` VALUES (848, 'suicide', 1, 's u i c i d e');
INSERT INTO `sensitive_words` VALUES (849, 'titor', 1, 't i t o r');
INSERT INTO `sensitive_words` VALUES (850, '逢8必灾', 1, 'Feng 8 Bi Zai');
INSERT INTO `sensitive_words` VALUES (851, '逢八必灾', 1, 'Feng Ba Bi Zai');
INSERT INTO `sensitive_words` VALUES (852, '逢9必乱', 1, 'Feng 9 Bi Luan');
INSERT INTO `sensitive_words` VALUES (853, '逢九必乱', 1, 'Feng Jiu Bi Luan');
INSERT INTO `sensitive_words` VALUES (854, '朱瑟里诺', 1, 'Zhu Se Li Nuo');
INSERT INTO `sensitive_words` VALUES (855, '根达亚文明', 1, 'Gen Da Ya Wen Ming');
INSERT INTO `sensitive_words` VALUES (856, '诺查丹玛斯', 1, 'Nuo Cha Dan Ma Si');
INSERT INTO `sensitive_words` VALUES (857, '人类灭亡进程表', 1, 'Ren Lei Mie Wang Jin Cheng Biao');
INSERT INTO `sensitive_words` VALUES (858, '按照马雅历法', 1, 'An Zhao Ma Ya Li Fa');
INSERT INTO `sensitive_words` VALUES (859, '推背图', 1, 'Tui Bei Tu');
INSERT INTO `sensitive_words` VALUES (860, '推bei图', 1, 'Tui b e i Tu');
INSERT INTO `sensitive_words` VALUES (861, '济世灵文', 1, 'Ji Shi Ling Wen');
INSERT INTO `sensitive_words` VALUES (862, '诸世纪', 1, 'Zhu Shi Ji');
INSERT INTO `sensitive_words` VALUES (863, '色情类： ', 1, 'Se Qing Lei ：');
INSERT INTO `sensitive_words` VALUES (864, '爱女人', 1, 'Ai Nv Ren');
INSERT INTO `sensitive_words` VALUES (865, '爱液', 1, 'Ai Ye');
INSERT INTO `sensitive_words` VALUES (866, '按摩棒', 1, 'An Mo Bang');
INSERT INTO `sensitive_words` VALUES (867, '拔出来', 1, 'Ba Chu Lai');
INSERT INTO `sensitive_words` VALUES (868, '爆草', 1, 'Bao Cao');
INSERT INTO `sensitive_words` VALUES (869, '包二奶', 1, 'Bao Er Nai');
INSERT INTO `sensitive_words` VALUES (870, '暴干', 1, 'Bao Gan');
INSERT INTO `sensitive_words` VALUES (871, '暴奸', 1, 'Bao Jian');
INSERT INTO `sensitive_words` VALUES (872, '暴乳', 1, 'Bao Ru');
INSERT INTO `sensitive_words` VALUES (873, '爆乳', 1, 'Bao Ru');
INSERT INTO `sensitive_words` VALUES (874, '暴淫', 1, 'Bao Yin');
INSERT INTO `sensitive_words` VALUES (875, '屄', 1, 'Bi');
INSERT INTO `sensitive_words` VALUES (876, '被操', 1, 'Bei Cao');
INSERT INTO `sensitive_words` VALUES (877, '被插', 1, 'Bei Cha');
INSERT INTO `sensitive_words` VALUES (878, '被干', 1, 'Bei Gan');
INSERT INTO `sensitive_words` VALUES (879, '逼奸', 1, 'Bi Jian');
INSERT INTO `sensitive_words` VALUES (880, '仓井空', 1, 'Cang Jing Kong');
INSERT INTO `sensitive_words` VALUES (881, '插暴', 1, 'Cha Bao');
INSERT INTO `sensitive_words` VALUES (882, '操逼', 1, 'Cao Bi');
INSERT INTO `sensitive_words` VALUES (883, '操黑', 1, 'Cao Hei');
INSERT INTO `sensitive_words` VALUES (884, '操烂', 1, 'Cao Lan');
INSERT INTO `sensitive_words` VALUES (885, '肏你', 1, 'Cao Ni');
INSERT INTO `sensitive_words` VALUES (886, '肏死', 1, 'Cao Si');
INSERT INTO `sensitive_words` VALUES (887, '操死', 1, 'Cao Si');
INSERT INTO `sensitive_words` VALUES (888, '操我', 1, 'Cao Wo');
INSERT INTO `sensitive_words` VALUES (889, '厕奴', 1, 'Ce Nu');
INSERT INTO `sensitive_words` VALUES (890, '插比', 1, 'Cha Bi');
INSERT INTO `sensitive_words` VALUES (891, '插b', 1, 'Cha b');
INSERT INTO `sensitive_words` VALUES (892, '插逼', 1, 'Cha Bi');
INSERT INTO `sensitive_words` VALUES (893, '插进', 1, 'Cha Jin');
INSERT INTO `sensitive_words` VALUES (894, '插你', 1, 'Cha Ni');
INSERT INTO `sensitive_words` VALUES (895, '插我', 1, 'Cha Wo');
INSERT INTO `sensitive_words` VALUES (896, '插阴', 1, 'Cha Yin');
INSERT INTO `sensitive_words` VALUES (897, '潮吹', 1, 'Chao Chui');
INSERT INTO `sensitive_words` VALUES (898, '潮喷', 1, 'Chao Pen');
INSERT INTO `sensitive_words` VALUES (899, '成人电影', 1, 'Cheng Ren Dian Ying');
INSERT INTO `sensitive_words` VALUES (900, '成人论坛', 1, 'Cheng Ren Lun Tan');
INSERT INTO `sensitive_words` VALUES (901, '成人色情', 1, 'Cheng Ren Se Qing');
INSERT INTO `sensitive_words` VALUES (902, '成人网站', 1, 'Cheng Ren Wang Zhan');
INSERT INTO `sensitive_words` VALUES (903, '成人文学', 1, 'Cheng Ren Wen Xue');
INSERT INTO `sensitive_words` VALUES (904, '成人小说', 1, 'Cheng Ren Xiao Shuo');
INSERT INTO `sensitive_words` VALUES (905, '艳情小说', 1, 'Yan Qing Xiao Shuo');
INSERT INTO `sensitive_words` VALUES (906, '成人游戏', 1, 'Cheng Ren You Xi');
INSERT INTO `sensitive_words` VALUES (907, '吃精', 1, 'Chi Jing');
INSERT INTO `sensitive_words` VALUES (908, '赤裸', 1, 'Chi Luo');
INSERT INTO `sensitive_words` VALUES (909, '抽插', 1, 'Chou Cha');
INSERT INTO `sensitive_words` VALUES (910, '扌由插', 1, 'Shou You Cha');
INSERT INTO `sensitive_words` VALUES (911, '抽一插', 1, 'Chou Yi Cha');
INSERT INTO `sensitive_words` VALUES (912, '春药', 1, 'Chun Yao');
INSERT INTO `sensitive_words` VALUES (913, '大波', 1, 'Da Bo');
INSERT INTO `sensitive_words` VALUES (914, '大力抽送', 1, 'Da Li Chou Song');
INSERT INTO `sensitive_words` VALUES (915, '大乳', 1, 'Da Ru');
INSERT INTO `sensitive_words` VALUES (916, '荡妇', 1, 'Dang Fu');
INSERT INTO `sensitive_words` VALUES (917, '荡女', 1, 'Dang Nv');
INSERT INTO `sensitive_words` VALUES (918, '盗撮', 1, 'Dao Cuo');
INSERT INTO `sensitive_words` VALUES (919, '多人轮', 1, 'Duo Ren Lun');
INSERT INTO `sensitive_words` VALUES (920, '发浪', 1, 'Fa Lang');
INSERT INTO `sensitive_words` VALUES (921, '放尿', 1, 'Fang Niao');
INSERT INTO `sensitive_words` VALUES (922, '肥逼', 1, 'Fei Bi');
INSERT INTO `sensitive_words` VALUES (923, '粉穴', 1, 'Fen Xue');
INSERT INTO `sensitive_words` VALUES (924, '封面女郎', 1, 'Feng Mian Nv Lang');
INSERT INTO `sensitive_words` VALUES (925, '风月大陆', 1, 'Feng Yue Da Lu');
INSERT INTO `sensitive_words` VALUES (926, '干死你', 1, 'Gan Si Ni');
INSERT INTO `sensitive_words` VALUES (927, '干穴', 1, 'Gan Xue');
INSERT INTO `sensitive_words` VALUES (928, '肛交', 1, 'Gang Jiao');
INSERT INTO `sensitive_words` VALUES (929, '肛门', 1, 'Gang Men');
INSERT INTO `sensitive_words` VALUES (930, '龟头', 1, 'Gui Tou');
INSERT INTO `sensitive_words` VALUES (931, '裹本', 1, 'Guo Ben');
INSERT INTO `sensitive_words` VALUES (932, '国产av', 1, 'Guo Chan a v');
INSERT INTO `sensitive_words` VALUES (933, '好嫩', 1, 'Hao Nen');
INSERT INTO `sensitive_words` VALUES (934, '豪乳', 1, 'Hao Ru');
INSERT INTO `sensitive_words` VALUES (935, '黑逼', 1, 'Hei Bi');
INSERT INTO `sensitive_words` VALUES (936, '后庭', 1, 'Hou Ting');
INSERT INTO `sensitive_words` VALUES (937, '后穴', 1, 'Hou Xue');
INSERT INTO `sensitive_words` VALUES (938, '虎骑', 1, 'Hu Qi');
INSERT INTO `sensitive_words` VALUES (939, '花花公子', 1, 'Hua Hua Gong Zi');
INSERT INTO `sensitive_words` VALUES (940, '换妻俱乐部', 1, 'Huan Qi Ju Le Bu');
INSERT INTO `sensitive_words` VALUES (941, '黄片', 1, 'Huang Pian');
INSERT INTO `sensitive_words` VALUES (942, '几吧', 1, 'Ji Ba');
INSERT INTO `sensitive_words` VALUES (943, '鸡吧', 1, 'Ji Ba');
INSERT INTO `sensitive_words` VALUES (944, '鸡巴', 1, 'Ji Ba');
INSERT INTO `sensitive_words` VALUES (945, '鸡奸', 1, 'Ji Jian');
INSERT INTO `sensitive_words` VALUES (946, '寂寞男', 1, 'Ji Mo Nan');
INSERT INTO `sensitive_words` VALUES (947, '寂寞女', 1, 'Ji Mo Nv');
INSERT INTO `sensitive_words` VALUES (948, '妓女', 1, 'Ji Nv');
INSERT INTO `sensitive_words` VALUES (949, '激情', 1, 'Ji Qing');
INSERT INTO `sensitive_words` VALUES (950, '集体淫', 1, 'Ji Ti Yin');
INSERT INTO `sensitive_words` VALUES (951, '奸情', 1, 'Jian Qing');
INSERT INTO `sensitive_words` VALUES (952, '叫床', 1, 'Jiao Chuang');
INSERT INTO `sensitive_words` VALUES (953, '脚交', 1, 'Jiao Jiao');
INSERT INTO `sensitive_words` VALUES (954, '金鳞岂是池中物', 1, 'Jin Lin Qi Shi Chi Zhong Wu');
INSERT INTO `sensitive_words` VALUES (955, '金麟岂是池中物', 1, 'Jin Lin Qi Shi Chi Zhong Wu');
INSERT INTO `sensitive_words` VALUES (956, '精液', 1, 'Jing Ye');
INSERT INTO `sensitive_words` VALUES (957, '就去日', 1, 'Jiu Qu Ri');
INSERT INTO `sensitive_words` VALUES (958, '巨屌', 1, 'Ju Diao');
INSERT INTO `sensitive_words` VALUES (959, '菊花洞', 1, 'Ju Hua Dong');
INSERT INTO `sensitive_words` VALUES (960, '菊门', 1, 'Ju Men');
INSERT INTO `sensitive_words` VALUES (961, '巨奶', 1, 'Ju Nai');
INSERT INTO `sensitive_words` VALUES (962, '巨乳', 1, 'Ju Ru');
INSERT INTO `sensitive_words` VALUES (963, '菊穴', 1, 'Ju Xue');
INSERT INTO `sensitive_words` VALUES (964, '开苞', 1, 'Kai Bao');
INSERT INTO `sensitive_words` VALUES (965, '口爆', 1, 'Kou Bao');
INSERT INTO `sensitive_words` VALUES (966, '口活', 1, 'Kou Huo');
INSERT INTO `sensitive_words` VALUES (967, '口交', 1, 'Kou Jiao');
INSERT INTO `sensitive_words` VALUES (968, '口射', 1, 'Kou She');
INSERT INTO `sensitive_words` VALUES (969, '口淫', 1, 'Kou Yin');
INSERT INTO `sensitive_words` VALUES (970, '裤袜', 1, 'Ku Wa');
INSERT INTO `sensitive_words` VALUES (971, '狂操', 1, 'Kuang Cao');
INSERT INTO `sensitive_words` VALUES (972, '狂插', 1, 'Kuang Cha');
INSERT INTO `sensitive_words` VALUES (973, '浪逼', 1, 'Lang Bi');
INSERT INTO `sensitive_words` VALUES (974, '浪妇', 1, 'Lang Fu');
INSERT INTO `sensitive_words` VALUES (975, '浪叫', 1, 'Lang Jiao');
INSERT INTO `sensitive_words` VALUES (976, '浪女', 1, 'Lang Nv');
INSERT INTO `sensitive_words` VALUES (977, '狼友', 1, 'Lang You');
INSERT INTO `sensitive_words` VALUES (978, '聊性', 1, 'Liao Xing');
INSERT INTO `sensitive_words` VALUES (979, '流淫', 1, 'Liu Yin');
INSERT INTO `sensitive_words` VALUES (980, '铃木麻', 1, 'Ling Mu Ma');
INSERT INTO `sensitive_words` VALUES (981, '凌辱', 1, 'Ling Ru');
INSERT INTO `sensitive_words` VALUES (982, '漏乳', 1, 'Lou Ru');
INSERT INTO `sensitive_words` VALUES (983, '露b', 1, 'Lu b');
INSERT INTO `sensitive_words` VALUES (984, '乱交', 1, 'Luan Jiao');
INSERT INTO `sensitive_words` VALUES (985, '乱伦', 1, 'Luan Lun');
INSERT INTO `sensitive_words` VALUES (986, '轮暴', 1, 'Lun Bao');
INSERT INTO `sensitive_words` VALUES (987, '轮操', 1, 'Lun Cao');
INSERT INTO `sensitive_words` VALUES (988, '轮奸', 1, 'Lun Jian');
INSERT INTO `sensitive_words` VALUES (989, '裸陪', 1, 'Luo Pei');
INSERT INTO `sensitive_words` VALUES (990, '买春', 1, 'Mai Chun');
INSERT INTO `sensitive_words` VALUES (991, '美逼', 1, 'Mei Bi');
INSERT INTO `sensitive_words` VALUES (992, '美少妇', 1, 'Mei Shao Fu');
INSERT INTO `sensitive_words` VALUES (993, '美乳', 1, 'Mei Ru');
INSERT INTO `sensitive_words` VALUES (994, '美腿', 1, 'Mei Tui');
INSERT INTO `sensitive_words` VALUES (995, '美穴', 1, 'Mei Xue');
INSERT INTO `sensitive_words` VALUES (996, '美幼', 1, 'Mei You');
INSERT INTO `sensitive_words` VALUES (997, '秘唇', 1, 'Mi Chun');
INSERT INTO `sensitive_words` VALUES (998, '迷奸', 1, 'Mi Jian');
INSERT INTO `sensitive_words` VALUES (999, '密穴', 1, 'Mi Xue');
INSERT INTO `sensitive_words` VALUES (1000, '蜜穴', 1, 'Mi Xue');
INSERT INTO `sensitive_words` VALUES (1001, '蜜液', 1, 'Mi Ye');
INSERT INTO `sensitive_words` VALUES (1002, '摸奶', 1, 'Mo Nai');
INSERT INTO `sensitive_words` VALUES (1003, '摸胸', 1, 'Mo Xiong');
INSERT INTO `sensitive_words` VALUES (1004, '母奸', 1, 'Mu Jian');
INSERT INTO `sensitive_words` VALUES (1005, '奈美', 1, 'Nai Mei');
INSERT INTO `sensitive_words` VALUES (1006, '奶子', 1, 'Nai Zi');
INSERT INTO `sensitive_words` VALUES (1007, '男奴', 1, 'Nan Nu');
INSERT INTO `sensitive_words` VALUES (1008, '内射', 1, 'Nei She');
INSERT INTO `sensitive_words` VALUES (1009, '嫩逼', 1, 'Nen Bi');
INSERT INTO `sensitive_words` VALUES (1010, '嫩女', 1, 'Nen Nv');
INSERT INTO `sensitive_words` VALUES (1011, '嫩穴', 1, 'Nen Xue');
INSERT INTO `sensitive_words` VALUES (1012, '捏弄', 1, 'Nie Nong');
INSERT INTO `sensitive_words` VALUES (1013, '女优', 1, 'Nv You');
INSERT INTO `sensitive_words` VALUES (1014, '炮友', 1, 'Pao You');
INSERT INTO `sensitive_words` VALUES (1015, '砲友', 1, 'Pao You');
INSERT INTO `sensitive_words` VALUES (1016, '喷精', 1, 'Pen Jing');
INSERT INTO `sensitive_words` VALUES (1017, '屁眼', 1, 'Pi Yan');
INSERT INTO `sensitive_words` VALUES (1018, '品香堂', 1, 'Pin Xiang Tang');
INSERT INTO `sensitive_words` VALUES (1019, '前凸后翘', 1, 'Qian Tu Hou Qiao');
INSERT INTO `sensitive_words` VALUES (1020, '强jian', 1, 'Qiang j i a n');
INSERT INTO `sensitive_words` VALUES (1021, '强暴', 1, 'Qiang Bao');
INSERT INTO `sensitive_words` VALUES (1022, '强奸处女', 1, 'Qiang Jian Chu Nv');
INSERT INTO `sensitive_words` VALUES (1023, '情趣用品', 1, 'Qing Qu Yong Pin');
INSERT INTO `sensitive_words` VALUES (1024, '情色', 1, 'Qing Se');
INSERT INTO `sensitive_words` VALUES (1025, '拳交', 1, 'Quan Jiao');
INSERT INTO `sensitive_words` VALUES (1026, '全裸', 1, 'Quan Luo');
INSERT INTO `sensitive_words` VALUES (1027, '群交', 1, 'Qun Jiao');
INSERT INTO `sensitive_words` VALUES (1028, '惹火身材', 1, 'Re Huo Shen Cai');
INSERT INTO `sensitive_words` VALUES (1029, '人妻', 1, 'Ren Qi');
INSERT INTO `sensitive_words` VALUES (1030, '人兽', 1, 'Ren Shou');
INSERT INTO `sensitive_words` VALUES (1031, '日逼', 1, 'Ri Bi');
INSERT INTO `sensitive_words` VALUES (1032, '日烂', 1, 'Ri Lan');
INSERT INTO `sensitive_words` VALUES (1033, '肉棒', 1, 'Rou Bang');
INSERT INTO `sensitive_words` VALUES (1034, '肉逼', 1, 'Rou Bi');
INSERT INTO `sensitive_words` VALUES (1035, '肉唇', 1, 'Rou Chun');
INSERT INTO `sensitive_words` VALUES (1036, '肉洞', 1, 'Rou Dong');
INSERT INTO `sensitive_words` VALUES (1037, '肉缝', 1, 'Rou Feng');
INSERT INTO `sensitive_words` VALUES (1038, '肉棍', 1, 'Rou Gun');
INSERT INTO `sensitive_words` VALUES (1039, '肉茎', 1, 'Rou Jing');
INSERT INTO `sensitive_words` VALUES (1040, '肉具', 1, 'Rou Ju');
INSERT INTO `sensitive_words` VALUES (1041, '揉乳', 1, 'Rou Ru');
INSERT INTO `sensitive_words` VALUES (1042, '肉穴', 1, 'Rou Xue');
INSERT INTO `sensitive_words` VALUES (1043, '肉欲', 1, 'Rou Yu');
INSERT INTO `sensitive_words` VALUES (1044, '乳爆', 1, 'Ru Bao');
INSERT INTO `sensitive_words` VALUES (1045, '乳房', 1, 'Ru Fang');
INSERT INTO `sensitive_words` VALUES (1046, '乳沟', 1, 'Ru Gou');
INSERT INTO `sensitive_words` VALUES (1047, '乳交', 1, 'Ru Jiao');
INSERT INTO `sensitive_words` VALUES (1048, '乳头', 1, 'Ru Tou');
INSERT INTO `sensitive_words` VALUES (1049, '三级片', 1, 'San Ji Pian');
INSERT INTO `sensitive_words` VALUES (1050, '骚逼', 1, 'Sao Bi');
INSERT INTO `sensitive_words` VALUES (1051, '骚比', 1, 'Sao Bi');
INSERT INTO `sensitive_words` VALUES (1052, '骚女', 1, 'Sao Nv');
INSERT INTO `sensitive_words` VALUES (1053, '骚水', 1, 'Sao Shui');
INSERT INTO `sensitive_words` VALUES (1054, '骚穴', 1, 'Sao Xue');
INSERT INTO `sensitive_words` VALUES (1055, '色逼', 1, 'Se Bi');
INSERT INTO `sensitive_words` VALUES (1056, '色界', 1, 'Se Jie');
INSERT INTO `sensitive_words` VALUES (1057, '色猫', 1, 'Se Mao');
INSERT INTO `sensitive_words` VALUES (1058, '色盟', 1, 'Se Meng');
INSERT INTO `sensitive_words` VALUES (1059, '色情网站', 1, 'Se Qing Wang Zhan');
INSERT INTO `sensitive_words` VALUES (1060, '色区', 1, 'Se Qu');
INSERT INTO `sensitive_words` VALUES (1061, '色色', 1, 'Se Se');
INSERT INTO `sensitive_words` VALUES (1062, '色诱', 1, 'Se You');
INSERT INTO `sensitive_words` VALUES (1063, '色欲', 1, 'Se Yu');
INSERT INTO `sensitive_words` VALUES (1064, '色b', 1, 'Se b');
INSERT INTO `sensitive_words` VALUES (1065, '少年阿宾', 1, 'Shao Nian A Bin');
INSERT INTO `sensitive_words` VALUES (1066, '少修正', 1, 'Shao Xiu Zheng');
INSERT INTO `sensitive_words` VALUES (1067, '射爽', 1, 'She Shuang');
INSERT INTO `sensitive_words` VALUES (1068, '射颜', 1, 'She Yan');
INSERT INTO `sensitive_words` VALUES (1069, '食精', 1, 'Shi Jing');
INSERT INTO `sensitive_words` VALUES (1070, '释欲', 1, 'Shi Yu');
INSERT INTO `sensitive_words` VALUES (1071, '兽奸', 1, 'Shou Jian');
INSERT INTO `sensitive_words` VALUES (1072, '兽交', 1, 'Shou Jiao');
INSERT INTO `sensitive_words` VALUES (1073, '手淫', 1, 'Shou Yin');
INSERT INTO `sensitive_words` VALUES (1074, '兽欲', 1, 'Shou Yu');
INSERT INTO `sensitive_words` VALUES (1075, '熟妇', 1, 'Shu Fu');
INSERT INTO `sensitive_words` VALUES (1076, '熟母', 1, 'Shu Mu');
INSERT INTO `sensitive_words` VALUES (1077, '熟女', 1, 'Shu Nv');
INSERT INTO `sensitive_words` VALUES (1078, '爽片', 1, 'Shuang Pian');
INSERT INTO `sensitive_words` VALUES (1079, '爽死我了', 1, 'Shuang Si Wo Le');
INSERT INTO `sensitive_words` VALUES (1080, '双臀', 1, 'Shuang Tun');
INSERT INTO `sensitive_words` VALUES (1081, '死逼', 1, 'Si Bi');
INSERT INTO `sensitive_words` VALUES (1082, '丝袜', 1, 'Si Wa');
INSERT INTO `sensitive_words` VALUES (1083, '丝诱', 1, 'Si You');
INSERT INTO `sensitive_words` VALUES (1084, '松岛枫', 1, 'Song Dao Feng');
INSERT INTO `sensitive_words` VALUES (1085, '酥痒', 1, 'Su Yang');
INSERT INTO `sensitive_words` VALUES (1086, '汤加丽', 1, 'Tang Jia Li');
INSERT INTO `sensitive_words` VALUES (1087, '套弄', 1, 'Tao Nong');
INSERT INTO `sensitive_words` VALUES (1088, '体奸', 1, 'Ti Jian');
INSERT INTO `sensitive_words` VALUES (1089, '体位', 1, 'Ti Wei');
INSERT INTO `sensitive_words` VALUES (1090, '舔脚', 1, 'Tian Jiao');
INSERT INTO `sensitive_words` VALUES (1091, '舔阴', 1, 'Tian Yin');
INSERT INTO `sensitive_words` VALUES (1092, '调教', 1, 'Diao Jiao');
INSERT INTO `sensitive_words` VALUES (1093, '偷欢', 1, 'Tou Huan');
INSERT INTO `sensitive_words` VALUES (1094, '偷拍', 1, 'Tou Pai');
INSERT INTO `sensitive_words` VALUES (1095, '推油', 1, 'Tui You');
INSERT INTO `sensitive_words` VALUES (1096, '脱内裤', 1, 'Tuo Nei Ku');
INSERT INTO `sensitive_words` VALUES (1097, '文做', 1, 'Wen Zuo');
INSERT INTO `sensitive_words` VALUES (1098, '我就色', 1, 'Wo Jiu Se');
INSERT INTO `sensitive_words` VALUES (1099, '无码', 1, 'Wu Ma');
INSERT INTO `sensitive_words` VALUES (1100, '舞女', 1, 'Wu Nv');
INSERT INTO `sensitive_words` VALUES (1101, '无修正', 1, 'Wu Xiu Zheng');
INSERT INTO `sensitive_words` VALUES (1102, '吸精', 1, 'Xi Jing');
INSERT INTO `sensitive_words` VALUES (1103, '夏川纯', 1, 'Xia Chuan Chun');
INSERT INTO `sensitive_words` VALUES (1104, '相奸', 1, 'Xiang Jian');
INSERT INTO `sensitive_words` VALUES (1105, '小逼', 1, 'Xiao Bi');
INSERT INTO `sensitive_words` VALUES (1106, '校鸡', 1, 'Xiao Ji');
INSERT INTO `sensitive_words` VALUES (1107, '小穴', 1, 'Xiao Xue');
INSERT INTO `sensitive_words` VALUES (1108, '小xue', 1, 'Xiao x u e');
INSERT INTO `sensitive_words` VALUES (1109, '写真', 1, 'Xie Zhen');
INSERT INTO `sensitive_words` VALUES (1110, '性感妖娆', 1, 'Xing Gan Yao Rao');
INSERT INTO `sensitive_words` VALUES (1111, '性感诱惑', 1, 'Xing Gan You Huo');
INSERT INTO `sensitive_words` VALUES (1112, '性虎', 1, 'Xing Hu');
INSERT INTO `sensitive_words` VALUES (1113, '性饥渴', 1, 'Xing Ji Ke');
INSERT INTO `sensitive_words` VALUES (1114, '性技巧', 1, 'Xing Ji Qiao');
INSERT INTO `sensitive_words` VALUES (1115, '性交', 1, 'Xing Jiao');
INSERT INTO `sensitive_words` VALUES (1116, '性奴', 1, 'Xing Nu');
INSERT INTO `sensitive_words` VALUES (1117, '性虐', 1, 'Xing Nve');
INSERT INTO `sensitive_words` VALUES (1118, '性息', 1, 'Xing Xi');
INSERT INTO `sensitive_words` VALUES (1119, '性欲', 1, 'Xing Yu');
INSERT INTO `sensitive_words` VALUES (1120, '胸推', 1, 'Xiong Tui');
INSERT INTO `sensitive_words` VALUES (1121, '穴口', 1, 'Xue Kou');
INSERT INTO `sensitive_words` VALUES (1122, '学生妹', 1, 'Xue Sheng Mei');
INSERT INTO `sensitive_words` VALUES (1123, '穴图', 1, 'Xue Tu');
INSERT INTO `sensitive_words` VALUES (1124, '亚情', 1, 'Ya Qing');
INSERT INTO `sensitive_words` VALUES (1125, '颜射', 1, 'Yan She');
INSERT INTO `sensitive_words` VALUES (1126, '阳具', 1, 'Yang Ju');
INSERT INTO `sensitive_words` VALUES (1127, '杨思敏', 1, 'Yang Si Min');
INSERT INTO `sensitive_words` VALUES (1128, '要射了', 1, 'Yao She Le');
INSERT INTO `sensitive_words` VALUES (1129, '夜勤病栋', 1, 'Ye Qin Bing Dong');
INSERT INTO `sensitive_words` VALUES (1130, '一本道', 1, 'Yi Ben Dao');
INSERT INTO `sensitive_words` VALUES (1131, '一夜欢', 1, 'Yi Ye Huan');
INSERT INTO `sensitive_words` VALUES (1132, '一夜情', 1, 'Yi Ye Qing');
INSERT INTO `sensitive_words` VALUES (1133, '一ye情', 1, 'Yi y e Qing');
INSERT INTO `sensitive_words` VALUES (1134, '阴部', 1, 'Yin Bu');
INSERT INTO `sensitive_words` VALUES (1135, '淫虫', 1, 'Yin Chong');
INSERT INTO `sensitive_words` VALUES (1136, '阴唇', 1, 'Yin Chun');
INSERT INTO `sensitive_words` VALUES (1137, '淫荡', 1, 'Yin Dang');
INSERT INTO `sensitive_words` VALUES (1138, '阴道', 1, 'Yin Dao');
INSERT INTO `sensitive_words` VALUES (1139, '淫电影', 1, 'Yin Dian Ying');
INSERT INTO `sensitive_words` VALUES (1140, '阴阜', 1, 'Yin Fu');
INSERT INTO `sensitive_words` VALUES (1141, '淫妇', 1, 'Yin Fu');
INSERT INTO `sensitive_words` VALUES (1142, '淫河', 1, 'Yin He');
INSERT INTO `sensitive_words` VALUES (1143, '阴核', 1, 'Yin He');
INSERT INTO `sensitive_words` VALUES (1144, '阴户', 1, 'Yin Hu');
INSERT INTO `sensitive_words` VALUES (1145, '淫贱', 1, 'Yin Jian');
INSERT INTO `sensitive_words` VALUES (1146, '淫叫', 1, 'Yin Jiao');
INSERT INTO `sensitive_words` VALUES (1147, '淫教师', 1, 'Yin Jiao Shi');
INSERT INTO `sensitive_words` VALUES (1148, '阴茎', 1, 'Yin Jing');
INSERT INTO `sensitive_words` VALUES (1149, '阴精', 1, 'Yin Jing');
INSERT INTO `sensitive_words` VALUES (1150, '淫浪', 1, 'Yin Lang');
INSERT INTO `sensitive_words` VALUES (1151, '淫媚', 1, 'Yin Mei');
INSERT INTO `sensitive_words` VALUES (1152, '淫糜', 1, 'Yin Mi');
INSERT INTO `sensitive_words` VALUES (1153, '淫魔', 1, 'Yin Mo');
INSERT INTO `sensitive_words` VALUES (1154, '淫母', 1, 'Yin Mu');
INSERT INTO `sensitive_words` VALUES (1155, '淫女', 1, 'Yin Nv');
INSERT INTO `sensitive_words` VALUES (1156, '淫虐', 1, 'Yin Nve');
INSERT INTO `sensitive_words` VALUES (1157, '淫妻', 1, 'Yin Qi');
INSERT INTO `sensitive_words` VALUES (1158, '淫情', 1, 'Yin Qing');
INSERT INTO `sensitive_words` VALUES (1159, '淫色', 1, 'Yin Se');
INSERT INTO `sensitive_words` VALUES (1160, '淫声浪语', 1, 'Yin Sheng Lang Yu');
INSERT INTO `sensitive_words` VALUES (1161, '淫兽学园', 1, 'Yin Shou Xue Yuan');
INSERT INTO `sensitive_words` VALUES (1162, '淫书', 1, 'Yin Shu');
INSERT INTO `sensitive_words` VALUES (1163, '淫术炼金士', 1, 'Yin Shu Lian Jin Shi');
INSERT INTO `sensitive_words` VALUES (1164, '淫水', 1, 'Yin Shui');
INSERT INTO `sensitive_words` VALUES (1165, '淫娃', 1, 'Yin Wa');
INSERT INTO `sensitive_words` VALUES (1166, '淫威', 1, 'Yin Wei');
INSERT INTO `sensitive_words` VALUES (1167, '淫亵', 1, 'Yin Xie');
INSERT INTO `sensitive_words` VALUES (1168, '淫样', 1, 'Yin Yang');
INSERT INTO `sensitive_words` VALUES (1169, '淫液', 1, 'Yin Ye');
INSERT INTO `sensitive_words` VALUES (1170, '淫照', 1, 'Yin Zhao');
INSERT INTO `sensitive_words` VALUES (1171, '阴b', 1, 'Yin b');
INSERT INTO `sensitive_words` VALUES (1172, '应召', 1, 'Ying Zhao');
INSERT INTO `sensitive_words` VALUES (1173, '幼交', 1, 'You Jiao');
INSERT INTO `sensitive_words` VALUES (1174, '幼男', 1, 'You Nan');
INSERT INTO `sensitive_words` VALUES (1175, '幼女', 1, 'You Nv');
INSERT INTO `sensitive_words` VALUES (1176, '欲火', 1, 'Yu Huo');
INSERT INTO `sensitive_words` VALUES (1177, '欲女', 1, 'Yu Nv');
INSERT INTO `sensitive_words` VALUES (1178, '玉女心经', 1, 'Yu Nv Xin Jing');
INSERT INTO `sensitive_words` VALUES (1179, '玉蒲团', 1, 'Yu Pu Tuan');
INSERT INTO `sensitive_words` VALUES (1180, '玉乳', 1, 'Yu Ru');
INSERT INTO `sensitive_words` VALUES (1181, '欲仙欲死', 1, 'Yu Xian Yu Si');
INSERT INTO `sensitive_words` VALUES (1182, '玉穴', 1, 'Yu Xue');
INSERT INTO `sensitive_words` VALUES (1183, '援交', 1, 'Yuan Jiao');
INSERT INTO `sensitive_words` VALUES (1184, '原味内衣', 1, 'Yuan Wei Nei Yi');
INSERT INTO `sensitive_words` VALUES (1185, '援助交际', 1, 'Yuan Zhu Jiao Ji');
INSERT INTO `sensitive_words` VALUES (1186, '张筱雨', 1, 'Zhang Xiao Yu');
INSERT INTO `sensitive_words` VALUES (1187, '招鸡', 1, 'Zhao Ji');
INSERT INTO `sensitive_words` VALUES (1188, '招妓', 1, 'Zhao Ji');
INSERT INTO `sensitive_words` VALUES (1189, '中年美妇', 1, 'Zhong Nian Mei Fu');
INSERT INTO `sensitive_words` VALUES (1190, '抓胸', 1, 'Zhua Xiong');
INSERT INTO `sensitive_words` VALUES (1191, '自拍', 1, 'Zi Pai');
INSERT INTO `sensitive_words` VALUES (1192, '自慰', 1, 'Zi Wei');
INSERT INTO `sensitive_words` VALUES (1193, '作爱', 1, 'Zuo Ai');
INSERT INTO `sensitive_words` VALUES (1194, '18禁', 1, '1 8 Jin');
INSERT INTO `sensitive_words` VALUES (1195, '99bb', 1, '9 9 b b');
INSERT INTO `sensitive_words` VALUES (1196, 'a4u', 1, 'a 4 u');
INSERT INTO `sensitive_words` VALUES (1197, 'a4y', 1, 'a 4 y');
INSERT INTO `sensitive_words` VALUES (1198, 'adult', 1, 'a d u l t');
INSERT INTO `sensitive_words` VALUES (1199, 'amateur', 1, 'a m a t e u r');
INSERT INTO `sensitive_words` VALUES (1200, 'anal', 1, 'a n a l');
INSERT INTO `sensitive_words` VALUES (1201, 'a片', 1, 'a Pian');
INSERT INTO `sensitive_words` VALUES (1202, 'fuck', 1, 'f u c k');
INSERT INTO `sensitive_words` VALUES (1203, 'gay片', 1, 'g a y Pian');
INSERT INTO `sensitive_words` VALUES (1204, 'g点', 1, 'g Dian');
INSERT INTO `sensitive_words` VALUES (1205, 'g片', 1, 'g Pian');
INSERT INTO `sensitive_words` VALUES (1206, 'hardcore', 1, 'h a r d c o r e');
INSERT INTO `sensitive_words` VALUES (1207, 'h动画', 1, 'h Dong Hua');
INSERT INTO `sensitive_words` VALUES (1208, 'h动漫', 1, 'h Dong Man');
INSERT INTO `sensitive_words` VALUES (1209, 'incest', 1, 'i n c e s t');
INSERT INTO `sensitive_words` VALUES (1210, 'porn', 1, 'p o r n');
INSERT INTO `sensitive_words` VALUES (1211, 'secom', 1, 's e c o m');
INSERT INTO `sensitive_words` VALUES (1212, 'sexinsex', 1, 's e x i n s e x');
INSERT INTO `sensitive_words` VALUES (1213, 'sm女王', 1, 's m Nv Wang');
INSERT INTO `sensitive_words` VALUES (1214, 'xiao77', 1, 'x i a o 7 7');
INSERT INTO `sensitive_words` VALUES (1215, 'xing伴侣', 1, 'x i n g Ban Lv');
INSERT INTO `sensitive_words` VALUES (1216, 'tokyohot', 1, 't o k y o h o t');
INSERT INTO `sensitive_words` VALUES (1217, 'yin荡', 1, 'y i n Dang');
INSERT INTO `sensitive_words` VALUES (1218, '时事类：', 1, 'Shi Shi Lei ：');
INSERT INTO `sensitive_words` VALUES (1219, '汉芯造假', 1, 'Han Xin Zao Jia');
INSERT INTO `sensitive_words` VALUES (1220, '杨树宽', 1, 'Yang Shu Kuan');
INSERT INTO `sensitive_words` VALUES (1221, '中印边界谈判结果', 1, 'Zhong Yin Bian Jie Tan Pan Jie Guo');
INSERT INTO `sensitive_words` VALUES (1222, '喂奶门', 1, 'Wei Nai Men');
INSERT INTO `sensitive_words` VALUES (1223, '摸nai门', 1, 'Mo n a i Men');
INSERT INTO `sensitive_words` VALUES (1224, '酒瓶门', 1, 'Jiu Ping Men');
INSERT INTO `sensitive_words` VALUES (1225, '脱裤门', 1, 'Tuo Ku Men');
INSERT INTO `sensitive_words` VALUES (1226, '75事件', 1, '7 5 Shi Jian');
INSERT INTO `sensitive_words` VALUES (1227, '乌鲁木齐', 1, 'Wu Lu Mu Qi');
INSERT INTO `sensitive_words` VALUES (1228, '新疆骚乱', 1, 'Xin Jiang Sao Luan');
INSERT INTO `sensitive_words` VALUES (1229, '针刺', 1, 'Zhen Ci');
INSERT INTO `sensitive_words` VALUES (1230, '打针', 1, 'Da Zhen');
INSERT INTO `sensitive_words` VALUES (1231, '食堂涨价', 1, 'Shi Tang Zhang Jia');
INSERT INTO `sensitive_words` VALUES (1232, '饭菜涨价', 1, 'Fan Cai Zhang Jia');
INSERT INTO `sensitive_words` VALUES (1233, 'h1n1', 1, 'h 1 n 1');
INSERT INTO `sensitive_words` VALUES (1234, '瘟疫爆发', 1, 'Wen Yi Bao Fa');
INSERT INTO `sensitive_words` VALUES (1235, 'yangjia', 1, 'y a n g j i a');
INSERT INTO `sensitive_words` VALUES (1236, 'y佳', 1, 'y Jia');
INSERT INTO `sensitive_words` VALUES (1237, 'yang佳', 1, 'y a n g Jia');
INSERT INTO `sensitive_words` VALUES (1238, '杨佳', 1, 'Yang Jia');
INSERT INTO `sensitive_words` VALUES (1239, '杨j', 1, 'Yang j');
INSERT INTO `sensitive_words` VALUES (1240, '袭警', 1, 'Xi Jing');
INSERT INTO `sensitive_words` VALUES (1241, '杀警', 1, 'Sha Jing');
INSERT INTO `sensitive_words` VALUES (1242, '武侯祠', 1, 'Wu Hou Ci');
INSERT INTO `sensitive_words` VALUES (1243, '川b26931', 1, 'Chuan b 2 6 9 3 1');
INSERT INTO `sensitive_words` VALUES (1244, '贺立旗', 1, 'He Li Qi');
INSERT INTO `sensitive_words` VALUES (1245, '周正毅', 1, 'Zhou Zheng Yi');
INSERT INTO `sensitive_words` VALUES (1246, 'px项目', 1, 'p x Xiang Mu');
INSERT INTO `sensitive_words` VALUES (1247, '骂四川', 1, 'Ma Si Chuan');
INSERT INTO `sensitive_words` VALUES (1248, '家l福', 1, 'Jia l Fu');
INSERT INTO `sensitive_words` VALUES (1249, '家le福', 1, 'Jia l e Fu');
INSERT INTO `sensitive_words` VALUES (1250, '加了服', 1, 'Jia Le Fu');
INSERT INTO `sensitive_words` VALUES (1251, '麦当劳被砸', 1, 'Mai Dang Lao Bei Za');
INSERT INTO `sensitive_words` VALUES (1252, '豆腐渣', 1, 'Dou Fu Zha');
INSERT INTO `sensitive_words` VALUES (1253, '这不是天灾', 1, 'Zhe Bu Shi Tian Zai');
INSERT INTO `sensitive_words` VALUES (1254, '龙小霞', 1, 'Long Xiao Xia');
INSERT INTO `sensitive_words` VALUES (1255, '震其国土', 1, 'Zhen Qi Guo Tu');
INSERT INTO `sensitive_words` VALUES (1256, 'yuce', 1, 'y u c e');
INSERT INTO `sensitive_words` VALUES (1257, '提前预测', 1, 'Ti Qian Yu Ce');
INSERT INTO `sensitive_words` VALUES (1258, '地震预测', 1, 'Di Zhen Yu Ce');
INSERT INTO `sensitive_words` VALUES (1259, '隐瞒地震', 1, 'Yin Man Di Zhen');
INSERT INTO `sensitive_words` VALUES (1260, '李四光预测', 1, 'Li Si Guang Yu Ce');
INSERT INTO `sensitive_words` VALUES (1261, '蟾蜍迁徙', 1, 'Chan Chu Qian Xi');
INSERT INTO `sensitive_words` VALUES (1262, '地震来得更猛烈', 1, 'Di Zhen Lai De Geng Meng Lie');
INSERT INTO `sensitive_words` VALUES (1263, '八级地震毫无预报', 1, 'Ba Ji Di Zhen Hao Wu Yu Bao');
INSERT INTO `sensitive_words` VALUES (1264, '踩踏事故', 1, 'Cai Ta Shi Gu');
INSERT INTO `sensitive_words` VALUES (1265, '聂树斌', 1, 'Nie Shu Bin');
INSERT INTO `sensitive_words` VALUES (1266, '万里大造林', 1, 'Wan Li Da Zao Lin');
INSERT INTO `sensitive_words` VALUES (1267, '陈相贵', 1, 'Chen Xiang Gui');
INSERT INTO `sensitive_words` VALUES (1268, '张丹红', 1, 'Zhang Dan Hong');
INSERT INTO `sensitive_words` VALUES (1269, '尹方明', 1, 'Yin Fang Ming');
INSERT INTO `sensitive_words` VALUES (1270, '李树菲', 1, 'Li Shu Fei');
INSERT INTO `sensitive_words` VALUES (1271, '王奉友', 1, 'Wang Feng You');
INSERT INTO `sensitive_words` VALUES (1272, '零八奥运艰', 1, 'Ling Ba Ao Yun Jian');
INSERT INTO `sensitive_words` VALUES (1273, '惨奥', 1, 'Can Ao');
INSERT INTO `sensitive_words` VALUES (1274, '奥晕', 1, 'Ao Yun');
INSERT INTO `sensitive_words` VALUES (1275, '凹晕', 1, 'Ao Yun');
INSERT INTO `sensitive_words` VALUES (1276, '懊运', 1, 'Ao Yun');
INSERT INTO `sensitive_words` VALUES (1277, '懊孕', 1, 'Ao Yun');
INSERT INTO `sensitive_words` VALUES (1278, '奥孕', 1, 'Ao Yun');
INSERT INTO `sensitive_words` VALUES (1279, '奥你妈的运', 1, 'Ao Ni Ma De Yun');
INSERT INTO `sensitive_words` VALUES (1280, '反奥', 1, 'Fan Ao');
INSERT INTO `sensitive_words` VALUES (1281, '628事件', 1, '6 2 8 Shi Jian');
INSERT INTO `sensitive_words` VALUES (1282, 'weng安', 1, 'w e n g An');
INSERT INTO `sensitive_words` VALUES (1283, 'wengan', 1, 'w e n g a n');
INSERT INTO `sensitive_words` VALUES (1284, '翁安', 1, 'Weng An');
INSERT INTO `sensitive_words` VALUES (1285, '瓮安事件', 1, 'Weng An Shi Jian');
INSERT INTO `sensitive_words` VALUES (1286, '化工厂爆炸', 1, 'Hua Gong Chang Bao Zha');
INSERT INTO `sensitive_words` VALUES (1287, '讨回工资', 1, 'Tao Hui Gong Zi');
INSERT INTO `sensitive_words` VALUES (1288, '广告、非法信息类： ', 1, 'Guang Gao 、 Fei Fa Xin Xi Lei ：');
INSERT INTO `sensitive_words` VALUES (1289, '专业代理', 1, 'Zhuan Ye Dai Li');
INSERT INTO `sensitive_words` VALUES (1290, '帮忙点一下', 1, 'Bang Mang Dian Yi Xia');
INSERT INTO `sensitive_words` VALUES (1291, '帮忙点下', 1, 'Bang Mang Dian Xia');
INSERT INTO `sensitive_words` VALUES (1292, '请点击进入', 1, 'Qing Dian Ji Jin Ru');
INSERT INTO `sensitive_words` VALUES (1293, '详情请进入', 1, 'Xiang Qing Qing Jin Ru');
INSERT INTO `sensitive_words` VALUES (1294, '私人侦探', 1, 'Si Ren Zhen Tan');
INSERT INTO `sensitive_words` VALUES (1295, '私家侦探', 1, 'Si Jia Zhen Tan');
INSERT INTO `sensitive_words` VALUES (1296, '针孔摄象', 1, 'Zhen Kong She Xiang');
INSERT INTO `sensitive_words` VALUES (1297, '调查婚外情', 1, 'Diao Cha Hun Wai Qing');
INSERT INTO `sensitive_words` VALUES (1298, '信用卡提现', 1, 'Xin Yong Ka Ti Xian');
INSERT INTO `sensitive_words` VALUES (1299, '无抵押贷款', 1, 'Wu Di Ya Dai Kuan');
INSERT INTO `sensitive_words` VALUES (1300, '广告代理', 1, 'Guang Gao Dai Li');
INSERT INTO `sensitive_words` VALUES (1301, '原音铃声', 1, 'Yuan Yin Ling Sheng');
INSERT INTO `sensitive_words` VALUES (1302, '借腹生子', 1, 'Jie Fu Sheng Zi');
INSERT INTO `sensitive_words` VALUES (1303, '找个妈妈', 1, 'Zhao Ge Ma Ma');
INSERT INTO `sensitive_words` VALUES (1304, '找个爸爸', 1, 'Zhao Ge Ba Ba');
INSERT INTO `sensitive_words` VALUES (1305, '代孕妈妈', 1, 'Dai Yun Ma Ma');
INSERT INTO `sensitive_words` VALUES (1306, '代生孩子', 1, 'Dai Sheng Hai Zi');
INSERT INTO `sensitive_words` VALUES (1307, '代开发票', 1, 'Dai Kai Fa Piao');
INSERT INTO `sensitive_words` VALUES (1308, '腾讯客服电话', 1, 'Teng Xun Ke Fu Dian Hua');
INSERT INTO `sensitive_words` VALUES (1309, '销售热线', 1, 'Xiao Shou Re Xian');
INSERT INTO `sensitive_words` VALUES (1310, '免费订购热线', 1, 'Mian Fei Ding Gou Re Xian');
INSERT INTO `sensitive_words` VALUES (1311, '低价出售', 1, 'Di Jia Chu Shou');
INSERT INTO `sensitive_words` VALUES (1312, '款到发货', 1, 'Kuan Dao Fa Huo');
INSERT INTO `sensitive_words` VALUES (1313, '回复可见', 1, 'Hui Fu Ke Jian');
INSERT INTO `sensitive_words` VALUES (1314, '连锁加盟', 1, 'Lian Suo Jia Meng');
INSERT INTO `sensitive_words` VALUES (1315, '加盟连锁', 1, 'Jia Meng Lian Suo');
INSERT INTO `sensitive_words` VALUES (1316, '免费二级域名', 1, 'Mian Fei Er Ji Yu Ming');
INSERT INTO `sensitive_words` VALUES (1317, '免费使用', 1, 'Mian Fei Shi Yong');
INSERT INTO `sensitive_words` VALUES (1318, '免费索取', 1, 'Mian Fei Suo Qu');
INSERT INTO `sensitive_words` VALUES (1319, '蚁力神', 1, 'Yi Li Shen');
INSERT INTO `sensitive_words` VALUES (1320, '婴儿汤', 1, 'Ying Er Tang');
INSERT INTO `sensitive_words` VALUES (1321, '售肾', 1, 'Shou Shen');
INSERT INTO `sensitive_words` VALUES (1322, '刻章办', 1, 'Ke Zhang Ban');
INSERT INTO `sensitive_words` VALUES (1323, '买小车', 1, 'Mai Xiao Che');
INSERT INTO `sensitive_words` VALUES (1324, '套牌车', 1, 'Tao Pai Che');
INSERT INTO `sensitive_words` VALUES (1325, '玛雅网', 1, 'Ma Ya Wang');
INSERT INTO `sensitive_words` VALUES (1326, '电脑传讯', 1, 'Dian Nao Chuan Xun');
INSERT INTO `sensitive_words` VALUES (1327, '视频来源', 1, 'Shi Pin Lai Yuan');
INSERT INTO `sensitive_words` VALUES (1328, '下载速度', 1, 'Xia Zai Su Du');
INSERT INTO `sensitive_words` VALUES (1329, '高清在线', 1, 'Gao Qing Zai Xian');
INSERT INTO `sensitive_words` VALUES (1330, '全集在线', 1, 'Quan Ji Zai Xian');
INSERT INTO `sensitive_words` VALUES (1331, '在线播放', 1, 'Zai Xian Bo Fang');
INSERT INTO `sensitive_words` VALUES (1332, 'txt下载', 1, 't x t Xia Zai');
INSERT INTO `sensitive_words` VALUES (1333, '六位qq', 1, 'Liu Wei q q');
INSERT INTO `sensitive_words` VALUES (1334, '6位qq', 1, '6 Wei q q');
INSERT INTO `sensitive_words` VALUES (1335, '位的qq', 1, 'Wei De q q');
INSERT INTO `sensitive_words` VALUES (1336, '个qb', 1, 'Ge q b');
INSERT INTO `sensitive_words` VALUES (1337, '送qb', 1, 'Song q b');
INSERT INTO `sensitive_words` VALUES (1338, '用刀横向切腹', 1, 'Yong Dao Heng Xiang Qie Fu');
INSERT INTO `sensitive_words` VALUES (1339, '完全自杀手册', 1, 'Wan Quan Zi Sha Shou Ce');
INSERT INTO `sensitive_words` VALUES (1340, '四海帮', 1, 'Si Hai Bang');
INSERT INTO `sensitive_words` VALUES (1341, '足球投注', 1, 'Zu Qiu Tou Zhu');
INSERT INTO `sensitive_words` VALUES (1342, '地下钱庄', 1, 'Di Xia Qian Zhuang');
INSERT INTO `sensitive_words` VALUES (1343, '中国复兴党', 1, 'Zhong Guo Fu Xing Dang');
INSERT INTO `sensitive_words` VALUES (1344, '阿波罗网', 1, 'A Bo Luo Wang');
INSERT INTO `sensitive_words` VALUES (1345, '曾道人', 1, 'Ceng Dao Ren');
INSERT INTO `sensitive_words` VALUES (1346, '六合彩', 1, 'Liu He Cai');
INSERT INTO `sensitive_words` VALUES (1347, '改卷内幕', 1, 'Gai Juan Nei Mu');
INSERT INTO `sensitive_words` VALUES (1348, '替考试', 1, 'Ti Kao Shi');
INSERT INTO `sensitive_words` VALUES (1349, '隐形耳机', 1, 'Yin Xing Er Ji');
INSERT INTO `sensitive_words` VALUES (1350, '出售答案', 1, 'Chu Shou Da An');
INSERT INTO `sensitive_words` VALUES (1351, '考中答案', 1, 'Kao Zhong Da An');
INSERT INTO `sensitive_words` VALUES (1352, '答an', 1, 'Da a n');
INSERT INTO `sensitive_words` VALUES (1353, 'da案', 1, 'd a An');
INSERT INTO `sensitive_words` VALUES (1354, '资金周转', 1, 'Zi Jin Zhou Zhuan');
INSERT INTO `sensitive_words` VALUES (1355, '救市', 1, 'Jiu Shi');
INSERT INTO `sensitive_words` VALUES (1356, '股市圈钱', 1, 'Gu Shi Quan Qian');
INSERT INTO `sensitive_words` VALUES (1357, '崩盘', 1, 'Beng Pan');
INSERT INTO `sensitive_words` VALUES (1358, '资金短缺', 1, 'Zi Jin Duan Que');
INSERT INTO `sensitive_words` VALUES (1359, '证监会', 1, 'Zheng Jian Hui');
INSERT INTO `sensitive_words` VALUES (1360, '质押贷款', 1, 'Zhi Ya Dai Kuan');
INSERT INTO `sensitive_words` VALUES (1361, '小额贷款', 1, 'Xiao E Dai Kuan');
INSERT INTO `sensitive_words` VALUES (1362, '周小川', 1, 'Zhou Xiao Chuan');
INSERT INTO `sensitive_words` VALUES (1363, '刘明康', 1, 'Liu Ming Kang');
INSERT INTO `sensitive_words` VALUES (1364, '尚福林', 1, 'Shang Fu Lin');
INSERT INTO `sensitive_words` VALUES (1365, '孔丹', 1, 'Kong Dan');
INSERT INTO `sensitive_words` VALUES (1366, '药物毒品类：', 1, 'Yao Wu Du Pin Lei ：');
INSERT INTO `sensitive_words` VALUES (1367, '安眠酮', 1, 'An Mian Tong');
INSERT INTO `sensitive_words` VALUES (1368, '代药物毒品类：血浆', 1, 'Dai Yao Wu Du Pin Lei ： Xue Jiang');
INSERT INTO `sensitive_words` VALUES (1369, '普萘洛尔', 1, 'Pu Nai Luo Er');
INSERT INTO `sensitive_words` VALUES (1370, '呋塞米', 1, 'Fu Sai Mi');
INSERT INTO `sensitive_words` VALUES (1371, '西布曲明', 1, 'Xi Bu Qu Ming');
INSERT INTO `sensitive_words` VALUES (1372, 'testosterone', 1, 't e s t o s t e r o n e');
INSERT INTO `sensitive_words` VALUES (1373, '胰岛素样生长因子', 1, 'Yi Dao Su Yang Sheng Zhang Yin Zi');
INSERT INTO `sensitive_words` VALUES (1374, '促红细胞生成素', 1, 'Cu Hong Xi Bao Sheng Cheng Su');
INSERT INTO `sensitive_words` VALUES (1375, '地西泮', 1, 'Di Xi Pan');
INSERT INTO `sensitive_words` VALUES (1376, '尼可刹米', 1, 'Ni Ke Cha Mi');
INSERT INTO `sensitive_words` VALUES (1377, '甲睾酮', 1, 'Jia Gao Tong');
INSERT INTO `sensitive_words` VALUES (1378, 'adrenaline', 1, 'a d r e n a l i n e');
INSERT INTO `sensitive_words` VALUES (1379, 'erythropoietin', 1, 'e r y t h r o p o i e t i n');
INSERT INTO `sensitive_words` VALUES (1380, '地奈德', 1, 'Di Nai De');
INSERT INTO `sensitive_words` VALUES (1381, '莫达非尼', 1, 'Mo Da Fei Ni');
INSERT INTO `sensitive_words` VALUES (1382, '氯噻嗪', 1, 'Lv Sai Qin');
INSERT INTO `sensitive_words` VALUES (1383, '苯巴比妥', 1, 'Ben Ba Bi Tuo');
INSERT INTO `sensitive_words` VALUES (1384, '促性腺激素', 1, 'Cu Xing Xian Ji Su');
INSERT INTO `sensitive_words` VALUES (1385, '泼尼松', 1, 'Po Ni Song');
INSERT INTO `sensitive_words` VALUES (1386, '麻黄草', 1, 'Ma Huang Cao');
INSERT INTO `sensitive_words` VALUES (1387, '雄烯二醇', 1, 'Xiong Xi Er Chun');
INSERT INTO `sensitive_words` VALUES (1388, '地塞米松', 1, 'Di Sai Mi Song');
INSERT INTO `sensitive_words` VALUES (1389, 'tamoxifen', 1, 't a m o x i f e n');
INSERT INTO `sensitive_words` VALUES (1390, 'strychnine', 1, 's t r y c h n i n e');
INSERT INTO `sensitive_words` VALUES (1391, 'androst', 1, 'a n d r o s t');
INSERT INTO `sensitive_words` VALUES (1392, '新型毒品', 1, 'Xin Xing Du Pin');
INSERT INTO `sensitive_words` VALUES (1393, '杜冷丁', 1, 'Du Leng Ding');
INSERT INTO `sensitive_words` VALUES (1394, '兴奋剂', 1, 'Xing Fen Ji');
INSERT INTO `sensitive_words` VALUES (1395, 'mdma', 1, 'm d m a');
INSERT INTO `sensitive_words` VALUES (1396, '海洛因', 1, 'Hai Luo Yin');
INSERT INTO `sensitive_words` VALUES (1397, '海luo因', 1, 'Hai l u o Yin');
INSERT INTO `sensitive_words` VALUES (1398, 'heroin', 1, 'h e r o i n');
INSERT INTO `sensitive_words` VALUES (1399, 'diamorphine', 1, 'd i a m o r p h i n e');
INSERT INTO `sensitive_words` VALUES (1400, 'diacetylmorphine', 1, 'd i a c e t y l m o r p h i n e');
INSERT INTO `sensitive_words` VALUES (1401, '鸦片', 1, 'Ya Pian');
INSERT INTO `sensitive_words` VALUES (1402, '阿芙蓉', 1, 'A Fu Rong');
INSERT INTO `sensitive_words` VALUES (1403, '咖啡因', 1, 'Ka Fei Yin');
INSERT INTO `sensitive_words` VALUES (1404, 'cocain', 1, 'c o c a i n');
INSERT INTO `sensitive_words` VALUES (1405, '三唑仑', 1, 'San Zuo Lun');
INSERT INTO `sensitive_words` VALUES (1406, '美沙酮', 1, 'Mei Sha Tong');
INSERT INTO `sensitive_words` VALUES (1407, '麻古', 1, 'Ma Gu');
INSERT INTO `sensitive_words` VALUES (1408, 'k粉', 1, 'k Fen');
INSERT INTO `sensitive_words` VALUES (1409, '凯他敏', 1, 'Kai Ta Min');
INSERT INTO `sensitive_words` VALUES (1410, 'ketamine', 1, 'k e t a m i n e');
INSERT INTO `sensitive_words` VALUES (1411, '冰毒', 1, 'Bing Du');
INSERT INTO `sensitive_words` VALUES (1412, '苯丙胺', 1, 'Ben Bing An');
INSERT INTO `sensitive_words` VALUES (1413, 'cannabis', 1, 'c a n n a b i s');
INSERT INTO `sensitive_words` VALUES (1414, '大麻', 1, 'Da Ma');
INSERT INTO `sensitive_words` VALUES (1415, '爱他死', 1, 'Ai Ta Si');
INSERT INTO `sensitive_words` VALUES (1416, '氯胺酮', 1, 'Lv An Tong');
INSERT INTO `sensitive_words` VALUES (1417, 'benzodiazepines', 1, 'b e n z o d i a z e p i n e s');
INSERT INTO `sensitive_words` VALUES (1418, '甲基安非他明', 1, 'Jia Ji An Fei Ta Ming');
INSERT INTO `sensitive_words` VALUES (1419, '安非他命', 1, 'An Fei Ta Ming');
INSERT INTO `sensitive_words` VALUES (1420, '吗啡', 1, 'Ma Fei');
INSERT INTO `sensitive_words` VALUES (1421, 'morphine', 1, 'm o r p h i n e');
INSERT INTO `sensitive_words` VALUES (1422, '摇头丸', 1, 'Yao Tou Wan');
INSERT INTO `sensitive_words` VALUES (1423, '迷药', 1, 'Mi Yao');
INSERT INTO `sensitive_words` VALUES (1424, '乖乖粉', 1, 'Guai Guai Fen');
INSERT INTO `sensitive_words` VALUES (1425, 'narcotic', 1, 'n a r c o t i c');
INSERT INTO `sensitive_words` VALUES (1426, '麻醉药', 1, 'Ma Zui Yao');
INSERT INTO `sensitive_words` VALUES (1427, '精神药品 ', 1, 'Jing Shen Yao Pin');
INSERT INTO `sensitive_words` VALUES (1428, '其它：', 1, 'Qi Ta ：');
INSERT INTO `sensitive_words` VALUES (1429, '穴海', 1, 'Xue Hai');
INSERT INTO `sensitive_words` VALUES (1430, '协警', 1, 'Xie Jing');
INSERT INTO `sensitive_words` VALUES (1431, '纳米比亚', 1, 'Na Mi Bi Ya');
INSERT INTO `sensitive_words` VALUES (1432, '专业调查', 1, 'Zhuan Ye Diao Cha');
INSERT INTO `sensitive_words` VALUES (1433, '有华龙', 1, 'You Hua Long');
INSERT INTO `sensitive_words` VALUES (1434, 'jq的来', 1, 'j q De Lai');
INSERT INTO `sensitive_words` VALUES (1435, '电信路', 1, 'Dian Xin Lu');
INSERT INTO `sensitive_words` VALUES (1436, '第一夫人', 1, 'Di Yi Fu Ren');
INSERT INTO `sensitive_words` VALUES (1437, '党鞭', 1, 'Dang Bian');
INSERT INTO `sensitive_words` VALUES (1438, '黄巨', 1, 'Huang Ju');
INSERT INTO `sensitive_words` VALUES (1439, '荡尽天下', 1, 'Dang Jin Tian Xia');
INSERT INTO `sensitive_words` VALUES (1440, '家元自称玉皇大帝', 1, 'Jia Yuan Zi Cheng Yu Huang Da Di');
INSERT INTO `sensitive_words` VALUES (1441, '主席李世民', 1, 'Zhu Xi Li Shi Min');
INSERT INTO `sensitive_words` VALUES (1442, '何祚庥', 1, 'He Zuo Xiu');
INSERT INTO `sensitive_words` VALUES (1443, '刘刚', 1, 'Liu Gang');
INSERT INTO `sensitive_words` VALUES (1444, '不要沉默', 1, 'Bu Yao Chen Mo');
INSERT INTO `sensitive_words` VALUES (1445, '后勤集团', 1, 'Hou Qin Ji Tuan');
INSERT INTO `sensitive_words` VALUES (1446, '发国难财', 1, 'Fa Guo Nan Cai');
INSERT INTO `sensitive_words` VALUES (1447, '浪漫邂逅', 1, 'Lang Man Xie Hou');
INSERT INTO `sensitive_words` VALUES (1448, '红满堂', 1, 'Hong Man Tang');
INSERT INTO `sensitive_words` VALUES (1449, '张小洋', 1, 'Zhang Xiao Yang');
INSERT INTO `sensitive_words` VALUES (1450, '炸学校', 1, 'Zha Xue Xiao');
INSERT INTO `sensitive_words` VALUES (1451, '子宫', 1, 'Zi Gong');
INSERT INTO `sensitive_words` VALUES (1452, '叫晶晶的女孩', 1, 'Jiao Jing Jing De Nv Hai');
INSERT INTO `sensitive_words` VALUES (1453, '回派', 1, 'Hui Pai');
INSERT INTO `sensitive_words` VALUES (1454, '社会黑暗', 1, 'She Hui Hei An');
INSERT INTO `sensitive_words` VALUES (1455, '国之母', 1, 'Guo Zhi Mu');
INSERT INTO `sensitive_words` VALUES (1456, '国母', 1, 'Guo Mu');
INSERT INTO `sensitive_words` VALUES (1457, '国姆', 1, 'Guo Mu');
INSERT INTO `sensitive_words` VALUES (1458, '东方微点', 1, 'Dong Fang Wei Dian');
INSERT INTO `sensitive_words` VALUES (1459, '震惊全球', 1, 'Zhen Jing Quan Qiu');
INSERT INTO `sensitive_words` VALUES (1460, 'nowto', 1, 'n o w t o');
INSERT INTO `sensitive_words` VALUES (1461, 'chengdu', 1, 'c h e n g d u');
INSERT INTO `sensitive_words` VALUES (1462, '徐明', 1, 'Xu Ming');
INSERT INTO `sensitive_words` VALUES (1463, '六月飞雪', 1, 'Liu Yue Fei Xue');
INSERT INTO `sensitive_words` VALUES (1464, '暴力虐待', 1, 'Bao Li Nve Dai');
INSERT INTO `sensitive_words` VALUES (1465, '暴力袭击', 1, 'Bao Li Xi Ji');
INSERT INTO `sensitive_words` VALUES (1466, '天府广场', 1, 'Tian Fu Guang Chang');
INSERT INTO `sensitive_words` VALUES (1467, '粮荒', 1, 'Liang Huang');
INSERT INTO `sensitive_words` VALUES (1468, '洗脑班', 1, 'Xi Nao Ban');
INSERT INTO `sensitive_words` VALUES (1469, '复制地址到地址栏', 1, 'Fu Zhi Di Zhi Dao Di Zhi Lan');
INSERT INTO `sensitive_words` VALUES (1470, '骂人、讽刺类：', 1, 'Ma Ren 、 Feng Ci Lei ：');
INSERT INTO `sensitive_words` VALUES (1471, '李愚蠢', 1, 'Li Yu Chun');
INSERT INTO `sensitive_words` VALUES (1472, '中国猪', 1, 'Zhong Guo Zhu');
INSERT INTO `sensitive_words` VALUES (1473, '台湾猪', 1, 'Tai Wan Zhu');
INSERT INTO `sensitive_words` VALUES (1474, '进化不完全的生命体', 1, 'Jin Hua Bu Wan Quan De Sheng Ming Ti');
INSERT INTO `sensitive_words` VALUES (1475, '震死他们', 1, 'Zhen Si Ta Men');
INSERT INTO `sensitive_words` VALUES (1476, '贱人', 1, 'Jian Ren');
INSERT INTO `sensitive_words` VALUES (1477, '装b', 1, 'Zhuang b');
INSERT INTO `sensitive_words` VALUES (1478, '大sb', 1, 'Da s b');
INSERT INTO `sensitive_words` VALUES (1479, '傻逼', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (1480, '傻b', 1, 'Sha b');
INSERT INTO `sensitive_words` VALUES (1481, '煞逼', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (1482, '煞笔', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (1483, '刹笔', 1, 'Cha Bi');
INSERT INTO `sensitive_words` VALUES (1484, '傻比', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (1485, '沙比', 1, 'Sha Bi');
INSERT INTO `sensitive_words` VALUES (1486, '欠干', 1, 'Qian Gan');
INSERT INTO `sensitive_words` VALUES (1487, '婊子养的', 1, 'Biao Zi Yang De');
INSERT INTO `sensitive_words` VALUES (1488, '我日你', 1, 'Wo Ri Ni');
INSERT INTO `sensitive_words` VALUES (1489, '我操', 1, 'Wo Cao');
INSERT INTO `sensitive_words` VALUES (1490, '我草', 1, 'Wo Cao');
INSERT INTO `sensitive_words` VALUES (1491, '卧艹', 1, 'Wo Cao');
INSERT INTO `sensitive_words` VALUES (1492, '卧槽', 1, 'Wo Cao');
INSERT INTO `sensitive_words` VALUES (1493, '爆你菊', 1, 'Bao Ni Ju');
INSERT INTO `sensitive_words` VALUES (1494, '艹你', 1, 'Cao Ni');
INSERT INTO `sensitive_words` VALUES (1495, 'cao你', 1, 'c a o Ni');
INSERT INTO `sensitive_words` VALUES (1496, '你他妈', 1, 'Ni Ta Ma');
INSERT INTO `sensitive_words` VALUES (1497, '真他妈', 1, 'Zhen Ta Ma');
INSERT INTO `sensitive_words` VALUES (1498, '别他吗', 1, 'Bie Ta Ma');
INSERT INTO `sensitive_words` VALUES (1499, '草你吗', 1, 'Cao Ni Ma');
INSERT INTO `sensitive_words` VALUES (1500, '草你丫', 1, 'Cao Ni Ya');
INSERT INTO `sensitive_words` VALUES (1501, '操你妈', 1, 'Cao Ni Ma');
INSERT INTO `sensitive_words` VALUES (1502, '擦你妈', 1, 'Ca Ni Ma');
INSERT INTO `sensitive_words` VALUES (1503, '操你娘', 1, 'Cao Ni Niang');
INSERT INTO `sensitive_words` VALUES (1504, '操他妈', 1, 'Cao Ta Ma');
INSERT INTO `sensitive_words` VALUES (1505, '日你妈', 1, 'Ri Ni Ma');
INSERT INTO `sensitive_words` VALUES (1506, '干你妈', 1, 'Gan Ni Ma');
INSERT INTO `sensitive_words` VALUES (1507, '干你娘', 1, 'Gan Ni Niang');
INSERT INTO `sensitive_words` VALUES (1508, '娘西皮', 1, 'Niang Xi Pi');
INSERT INTO `sensitive_words` VALUES (1509, '狗操', 1, 'Gou Cao');
INSERT INTO `sensitive_words` VALUES (1510, '狗草', 1, 'Gou Cao');
INSERT INTO `sensitive_words` VALUES (1511, '狗杂种', 1, 'Gou Za Zhong');
INSERT INTO `sensitive_words` VALUES (1512, '狗日的', 1, 'Gou Ri De');
INSERT INTO `sensitive_words` VALUES (1513, '操你祖宗', 1, 'Cao Ni Zu Zong');
INSERT INTO `sensitive_words` VALUES (1514, '操你全家', 1, 'Cao Ni Quan Jia');
INSERT INTO `sensitive_words` VALUES (1515, '操你大爷', 1, 'Cao Ni Da Ye');
INSERT INTO `sensitive_words` VALUES (1516, '妈逼', 1, 'Ma Bi');
INSERT INTO `sensitive_words` VALUES (1517, '你麻痹', 1, 'Ni Ma Bi');
INSERT INTO `sensitive_words` VALUES (1518, '麻痹的', 1, 'Ma Bi De');
INSERT INTO `sensitive_words` VALUES (1519, '妈了个逼', 1, 'Ma Le Ge Bi');
INSERT INTO `sensitive_words` VALUES (1520, '马勒', 1, 'Ma Le');
INSERT INTO `sensitive_words` VALUES (1521, '狗娘养', 1, 'Gou Niang Yang');
INSERT INTO `sensitive_words` VALUES (1522, '贱比', 1, 'Jian Bi');
INSERT INTO `sensitive_words` VALUES (1523, '贱b', 1, 'Jian b');
INSERT INTO `sensitive_words` VALUES (1524, '下贱', 1, 'Xia Jian');
INSERT INTO `sensitive_words` VALUES (1525, '死全家', 1, 'Si Quan Jia');
INSERT INTO `sensitive_words` VALUES (1526, '全家死光', 1, 'Quan Jia Si Guang');
INSERT INTO `sensitive_words` VALUES (1527, '全家不得好死', 1, 'Quan Jia Bu De Hao Si');
INSERT INTO `sensitive_words` VALUES (1528, '全家死绝', 1, 'Quan Jia Si Jue');
INSERT INTO `sensitive_words` VALUES (1529, '白痴', 1, 'Bai Chi');
INSERT INTO `sensitive_words` VALUES (1530, '无耻', 1, 'Wu Chi');
INSERT INTO `sensitive_words` VALUES (1531, 'sb', 1, 's b');
INSERT INTO `sensitive_words` VALUES (1532, '杀b', 1, 'Sha b');
INSERT INTO `sensitive_words` VALUES (1533, '你吗b', 1, 'Ni Ma b');
INSERT INTO `sensitive_words` VALUES (1534, '你妈的', 1, 'Ni Ma De');
INSERT INTO `sensitive_words` VALUES (1535, '婊子', 1, 'Biao Zi');
INSERT INTO `sensitive_words` VALUES (1536, '贱货', 1, 'Jian Huo');
INSERT INTO `sensitive_words` VALUES (1537, '人渣', 1, 'Ren Zha');
INSERT INTO `sensitive_words` VALUES (1538, '混蛋', 1, 'Hun Dan');
INSERT INTO `sensitive_words` VALUES (1539, '媚外', 1, 'Mei Wai');
INSERT INTO `sensitive_words` VALUES (1540, '和弦', 1, 'He Xian');
INSERT INTO `sensitive_words` VALUES (1541, '兼职', 1, 'Jian Zhi');
INSERT INTO `sensitive_words` VALUES (1542, '限量', 1, 'Xian Liang');
INSERT INTO `sensitive_words` VALUES (1543, '铃声', 1, 'Ling Sheng');
INSERT INTO `sensitive_words` VALUES (1544, '性伴侣', 1, 'Xing Ban Lv');
INSERT INTO `sensitive_words` VALUES (1545, '男公关', 1, 'Nan Gong Guan');
INSERT INTO `sensitive_words` VALUES (1546, '火辣', 1, 'Huo La');
INSERT INTO `sensitive_words` VALUES (1547, '精子', 1, 'Jing Zi');
INSERT INTO `sensitive_words` VALUES (1548, '射精', 1, 'She Jing');
INSERT INTO `sensitive_words` VALUES (1549, '诱奸', 1, 'You Jian');
INSERT INTO `sensitive_words` VALUES (1550, '强奸', 1, 'Qiang Jian');
INSERT INTO `sensitive_words` VALUES (1551, '做爱', 1, 'Zuo Ai');
INSERT INTO `sensitive_words` VALUES (1552, '性爱', 1, 'Xing Ai');
INSERT INTO `sensitive_words` VALUES (1553, '发生关系', 1, 'Fa Sheng Guan Xi');
INSERT INTO `sensitive_words` VALUES (1554, '按摩', 1, 'An Mo');
INSERT INTO `sensitive_words` VALUES (1555, '快感', 1, 'Kuai Gan');
INSERT INTO `sensitive_words` VALUES (1556, '处男', 1, 'Chu Nan');
INSERT INTO `sensitive_words` VALUES (1557, '猛男', 1, 'Meng Nan');
INSERT INTO `sensitive_words` VALUES (1558, '少妇', 1, 'Shao Fu');
INSERT INTO `sensitive_words` VALUES (1559, '屌', 1, 'Diao');
INSERT INTO `sensitive_words` VALUES (1560, '屁股', 1, 'Pi Gu');
INSERT INTO `sensitive_words` VALUES (1561, '下体', 1, 'Xia Ti');
INSERT INTO `sensitive_words` VALUES (1562, '内裤', 1, 'Nei Ku');
INSERT INTO `sensitive_words` VALUES (1563, '浑圆', 1, 'Hun Yuan');
INSERT INTO `sensitive_words` VALUES (1564, '咪咪', 1, 'Mi Mi');
INSERT INTO `sensitive_words` VALUES (1565, '发情', 1, 'Fa Qing');
INSERT INTO `sensitive_words` VALUES (1566, '刺激', 1, 'Ci Ji');
INSERT INTO `sensitive_words` VALUES (1567, '白嫩', 1, 'Bai Nen');
INSERT INTO `sensitive_words` VALUES (1568, '粉嫩', 1, 'Fen Nen');
INSERT INTO `sensitive_words` VALUES (1569, '兽性', 1, 'Shou Xing');
INSERT INTO `sensitive_words` VALUES (1570, '风骚', 1, 'Feng Sao');
INSERT INTO `sensitive_words` VALUES (1571, '呻吟', 1, 'Shen Yin');
INSERT INTO `sensitive_words` VALUES (1572, 'sm', 1, 's m');
INSERT INTO `sensitive_words` VALUES (1573, '阉割', 1, 'Yan Ge');
INSERT INTO `sensitive_words` VALUES (1574, '高潮', 1, 'Gao Chao');
INSERT INTO `sensitive_words` VALUES (1575, '裸露', 1, 'Luo Lu');
INSERT INTO `sensitive_words` VALUES (1576, '不穿', 1, 'Bu Chuan');
INSERT INTO `sensitive_words` VALUES (1577, '一丝不挂', 1, 'Yi Si Bu Gua');
INSERT INTO `sensitive_words` VALUES (1578, '脱光', 1, 'Tuo Guang');
INSERT INTO `sensitive_words` VALUES (1579, '干你', 1, 'Gan Ni');
INSERT INTO `sensitive_words` VALUES (1580, '干死', 1, 'Gan Si');
INSERT INTO `sensitive_words` VALUES (1581, '我干', 1, 'Wo Gan');
INSERT INTO `sensitive_words` VALUES (1582, '中日没有不友好的', 1, 'Zhong Ri Mei You Bu You Hao De');
INSERT INTO `sensitive_words` VALUES (1583, '木牛流马的污染比汽车飞机大', 1, 'Mu Niu Liu Ma De Wu Ran Bi Qi Che Fei Ji Da');
INSERT INTO `sensitive_words` VALUES (1584, '他们嫌我挡了城市的道路', 1, 'Ta Men Xian Wo Dang Le Cheng Shi De Dao Lu');
INSERT INTO `sensitive_words` VALUES (1585, '当官靠后台', 1, 'Dang Guan Kao Hou Tai');
INSERT INTO `sensitive_words` VALUES (1586, '警察我们是为人民服务的', 1, 'Jing Cha Wo Men Shi Wei Ren Min Fu Wu De');
INSERT INTO `sensitive_words` VALUES (1587, '中石化说亏损', 1, 'Zhong Shi Hua Shuo Kui Sun');
INSERT INTO `sensitive_words` VALUES (1588, '做人不能太cctv了', 1, 'Zuo Ren Bu Neng Tai c c t v Le');
INSERT INTO `sensitive_words` VALUES (1589, '领导干部吃王八', 1, 'Ling Dao Gan Bu Chi Wang Ba');
INSERT INTO `sensitive_words` VALUES (1590, '工商税务两条狼', 1, 'Gong Shang Shui Wu Liang Tiao Lang');
INSERT INTO `sensitive_words` VALUES (1591, '公检法是流氓', 1, 'Gong Jian Fa Shi Liu Mang');
INSERT INTO `sensitive_words` VALUES (1592, '公安把秩序搞乱', 1, 'Gong An Ba Zhi Xu Gao Luan');
INSERT INTO `sensitive_words` VALUES (1593, '剖腹一刀五千几', 1, 'Pou Fu Yi Dao Wu Qian Ji');
INSERT INTO `sensitive_words` VALUES (1594, '读不起选个学校三万起', 1, 'Du Bu Qi Xuan Ge Xue Xiao San Wan Qi');
INSERT INTO `sensitive_words` VALUES (1595, '父母下岗儿下地', 1, 'Fu Mu Xia Gang Er Xia Di');
INSERT INTO `sensitive_words` VALUES (1596, '裙中性运动', 1, 'Qun Zhong Xing Yun Dong');
INSERT INTO `sensitive_words` VALUES (1597, '其它次要的适合于后台审核的敏感词： ', 1, 'Qi Ta Ci Yao De Shi He Yu Hou Tai Shen He De Min Gan Ci ：');
INSERT INTO `sensitive_words` VALUES (1598, '自制', 1, 'Zi Zhi');
INSERT INTO `sensitive_words` VALUES (1599, '制造', 1, 'Zhi Zao');
INSERT INTO `sensitive_words` VALUES (1600, '制作', 1, 'Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (1601, '收购', 1, 'Shou Gou');
INSERT INTO `sensitive_words` VALUES (1602, '求购', 1, 'Qiu Gou');
INSERT INTO `sensitive_words` VALUES (1603, '电话', 1, 'Dian Hua');
INSERT INTO `sensitive_words` VALUES (1604, '手机', 1, 'Shou Ji');
INSERT INTO `sensitive_words` VALUES (1605, '销售', 1, 'Xiao Shou');
INSERT INTO `sensitive_words` VALUES (1606, '联系', 1, 'Lian Xi');
INSERT INTO `sensitive_words` VALUES (1607, 'qq', 1, 'q q');
INSERT INTO `sensitive_words` VALUES (1608, '买', 1, 'Mai');
INSERT INTO `sensitive_words` VALUES (1609, '卖', 1, 'Mai');
INSERT INTO `sensitive_words` VALUES (1610, '匕首', 1, 'Bi Shou');
INSERT INTO `sensitive_words` VALUES (1611, '管制刀具', 1, 'Guan Zhi Dao Ju');
INSERT INTO `sensitive_words` VALUES (1612, '弹药', 1, 'Dan Yao');
INSERT INTO `sensitive_words` VALUES (1613, 'bb弹', 1, 'b b Dan');
INSERT INTO `sensitive_words` VALUES (1614, '违禁品', 1, 'Wei Jin Pin');
INSERT INTO `sensitive_words` VALUES (1615, '军用品', 1, 'Jun Yong Pin');
INSERT INTO `sensitive_words` VALUES (1616, '电棍', 1, 'Dian Gun');
INSERT INTO `sensitive_words` VALUES (1617, '手枪', 1, 'Shou Qiang');
INSERT INTO `sensitive_words` VALUES (1618, '机枪', 1, 'Ji Qiang');
INSERT INTO `sensitive_words` VALUES (1619, '步枪', 1, 'Bu Qiang');
INSERT INTO `sensitive_words` VALUES (1620, '气枪', 1, 'Qi Qiang');
INSERT INTO `sensitive_words` VALUES (1621, '电狗', 1, 'Dian Gou');
INSERT INTO `sensitive_words` VALUES (1622, '手狗', 1, 'Shou Gou');
INSERT INTO `sensitive_words` VALUES (1623, '枪模', 1, 'Qiang Mo');
INSERT INTO `sensitive_words` VALUES (1624, '模型枪', 1, 'Mo Xing Qiang');
INSERT INTO `sensitive_words` VALUES (1625, '仿真枪', 1, 'Fang Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (1626, '狙击枪', 1, 'Ju Ji Qiang');
INSERT INTO `sensitive_words` VALUES (1627, '信号枪', 1, 'Xin Hao Qiang');
INSERT INTO `sensitive_words` VALUES (1628, '麻醉枪', 1, 'Ma Zui Qiang');
INSERT INTO `sensitive_words` VALUES (1629, '来福枪', 1, 'Lai Fu Qiang');
INSERT INTO `sensitive_words` VALUES (1630, '来复枪', 1, 'Lai Fu Qiang');
INSERT INTO `sensitive_words` VALUES (1631, '冲锋枪', 1, 'Chong Feng Qiang');
INSERT INTO `sensitive_words` VALUES (1632, '散弹枪', 1, 'San Dan Qiang');
INSERT INTO `sensitive_words` VALUES (1633, '卡宾枪', 1, 'Ka Bin Qiang');
INSERT INTO `sensitive_words` VALUES (1634, '枪支', 1, 'Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (1635, '枪械', 1, 'Qiang Xie');
INSERT INTO `sensitive_words` VALUES (1636, '炸药', 1, 'Zha Yao');
INSERT INTO `sensitive_words` VALUES (1637, '硝铵', 1, 'Xiao An');
INSERT INTO `sensitive_words` VALUES (1638, '火药', 1, 'Huo Yao');
INSERT INTO `sensitive_words` VALUES (1639, '燃烧瓶', 1, 'Ran Shao Ping');
INSERT INTO `sensitive_words` VALUES (1640, '可燃物', 1, 'Ke Ran Wu');
INSERT INTO `sensitive_words` VALUES (1641, '爆炸物', 1, 'Bao Zha Wu');
INSERT INTO `sensitive_words` VALUES (1642, '炸弹', 1, 'Zha Dan');
INSERT INTO `sensitive_words` VALUES (1643, '雷管', 1, 'Lei Guan');
INSERT INTO `sensitive_words` VALUES (1644, '原子弹', 1, 'Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (1645, '燃烧弹', 1, 'Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (1646, 'tnt', 1, 't n t');
INSERT INTO `sensitive_words` VALUES (1647, '出售', 1, 'Chu Shou');
INSERT INTO `sensitive_words` VALUES (1648, '胡锦涛', 1, 'Hu Jin Tao');
INSERT INTO `sensitive_words` VALUES (1649, '贺子珍', 1, 'He Zi Zhen');
INSERT INTO `sensitive_words` VALUES (1650, '李德生', 1, 'Li De Sheng');
INSERT INTO `sensitive_words` VALUES (1651, '姚依林', 1, 'Yao Yi Lin');
INSERT INTO `sensitive_words` VALUES (1652, '李干成', 1, 'Li Gan Cheng');
INSERT INTO `sensitive_words` VALUES (1653, '黄镇', 1, 'Huang Zhen');
INSERT INTO `sensitive_words` VALUES (1654, '刘瑞龙', 1, 'Liu Rui Long');
INSERT INTO `sensitive_words` VALUES (1655, '黄敬', 1, 'Huang Jing');
INSERT INTO `sensitive_words` VALUES (1656, '薄熙', 1, 'Bo Xi');
INSERT INTO `sensitive_words` VALUES (1657, '周建南', 1, 'Zhou Jian Nan');
INSERT INTO `sensitive_words` VALUES (1658, '让国人愤怒的第二代身份证', 1, 'Rang Guo Ren Fen Nu De Di Er Dai Shen Fen Zheng');
INSERT INTO `sensitive_words` VALUES (1659, '第二代身份证', 1, 'Di Er Dai Shen Fen Zheng');
INSERT INTO `sensitive_words` VALUES (1660, '文化大革命', 1, 'Wen Hua Da Ge Ming');
INSERT INTO `sensitive_words` VALUES (1661, '老丁', 1, 'Lao Ding');
INSERT INTO `sensitive_words` VALUES (1662, '莱仕德事件', 1, 'Lai Shi De Shi Jian');
INSERT INTO `sensitive_words` VALUES (1663, '地下的先烈们纷纷打来电话询问', 1, 'Di Xia De Xian Lie Men Fen Fen Da Lai Dian Hua Xun Wen');
INSERT INTO `sensitive_words` VALUES (1664, '淫靡', 1, 'Yin Mi');
INSERT INTO `sensitive_words` VALUES (1665, '六四事件', 1, 'Liu Si Shi Jian');
INSERT INTO `sensitive_words` VALUES (1666, '迷昏药', 1, 'Mi Hun Yao');
INSERT INTO `sensitive_words` VALUES (1667, '迷魂药', 1, 'Mi Hun Yao');
INSERT INTO `sensitive_words` VALUES (1668, '窃听器', 1, 'Qie Ting Qi');
INSERT INTO `sensitive_words` VALUES (1669, '买卖枪支', 1, 'Mai Mai Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (1670, '麻醉乙醚', 1, 'Ma Zui Yi Mi');
INSERT INTO `sensitive_words` VALUES (1671, '短信群发器', 1, 'Duan Xin Qun Fa Qi');
INSERT INTO `sensitive_words` VALUES (1672, '帝国之梦', 1, 'Di Guo Zhi Meng');
INSERT INTO `sensitive_words` VALUES (1673, '毛一鲜', 1, 'Mao Yi Xian');
INSERT INTO `sensitive_words` VALUES (1674, '黎阳平', 1, 'Li Yang Ping');
INSERT INTO `sensitive_words` VALUES (1675, '对日强硬', 1, 'Dui Ri Qiang Ying');
INSERT INTO `sensitive_words` VALUES (1676, '出售枪支', 1, 'Chu Shou Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (1677, '西藏天葬', 1, 'Xi Zang Tian Zang');
INSERT INTO `sensitive_words` VALUES (1678, '军长发威', 1, 'Jun Zhang Fa Wei');
INSERT INTO `sensitive_words` VALUES (1679, 'PK黑社会', 1, 'P K Hei She Hui');
INSERT INTO `sensitive_words` VALUES (1680, '枪决女犯', 1, 'Qiang Jue Nv Fan');
INSERT INTO `sensitive_words` VALUES (1681, '投毒杀人', 1, 'Tou Du Sha Ren');
INSERT INTO `sensitive_words` VALUES (1682, '强硬发言', 1, 'Qiang Ying Fa Yan');
INSERT INTO `sensitive_words` VALUES (1683, '出售假币', 1, 'Chu Shou Jia Bi');
INSERT INTO `sensitive_words` VALUES (1684, '监听王', 1, 'Jian Ting Wang');
INSERT INTO `sensitive_words` VALUES (1685, '昏药', 1, 'Hun Yao');
INSERT INTO `sensitive_words` VALUES (1686, '侦探设备', 1, 'Zhen Tan She Bei');
INSERT INTO `sensitive_words` VALUES (1687, '麻醉钢枪', 1, 'Ma Zui Gang Qiang');
INSERT INTO `sensitive_words` VALUES (1688, '反华', 1, 'Fan Hua');
INSERT INTO `sensitive_words` VALUES (1689, '升达毕业证', 1, 'Sheng Da Bi Ye Zheng');
INSERT INTO `sensitive_words` VALUES (1690, '手机复制', 1, 'Shou Ji Fu Zhi');
INSERT INTO `sensitive_words` VALUES (1691, '戴海静', 1, 'Dai Hai Jing');
INSERT INTO `sensitive_words` VALUES (1692, '自杀指南', 1, 'Zi Sha Zhi Nan');
INSERT INTO `sensitive_words` VALUES (1693, '自杀手册', 1, 'Zi Sha Shou Ce');
INSERT INTO `sensitive_words` VALUES (1694, '张小平', 1, 'Zhang Xiao Ping');
INSERT INTO `sensitive_words` VALUES (1695, '佳静安定片', 1, 'Jia Jing An Ding Pian');
INSERT INTO `sensitive_words` VALUES (1696, '蒙汗药粉', 1, 'Meng Han Yao Fen');
INSERT INTO `sensitive_words` VALUES (1697, '古方迷香', 1, 'Gu Fang Mi Xiang');
INSERT INTO `sensitive_words` VALUES (1698, '强效失意药', 1, 'Qiang Xiao Shi Yi Yao');
INSERT INTO `sensitive_words` VALUES (1699, '迷奸药', 1, 'Mi Jian Yao');
INSERT INTO `sensitive_words` VALUES (1700, '透视眼镜', 1, 'Tou Shi Yan Jing');
INSERT INTO `sensitive_words` VALUES (1701, '远程偷拍', 1, 'Yuan Cheng Tou Pai');
INSERT INTO `sensitive_words` VALUES (1702, '自制手枪', 1, 'Zi Zhi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (1703, '激情小电影', 1, 'Ji Qing Xiao Dian Ying');
INSERT INTO `sensitive_words` VALUES (1704, '黄色小电影', 1, 'Huang Se Xiao Dian Ying');
INSERT INTO `sensitive_words` VALUES (1705, '天鹅之旅', 1, 'Tian E Zhi Lv');
INSERT INTO `sensitive_words` VALUES (1706, '盘古乐队', 1, 'Pan Gu Le Dui');
INSERT INTO `sensitive_words` VALUES (1707, '高校暴乱', 1, 'Gao Xiao Bao Luan');
INSERT INTO `sensitive_words` VALUES (1708, '高校群体事件', 1, 'Gao Xiao Qun Ti Shi Jian');
INSERT INTO `sensitive_words` VALUES (1709, '大学骚乱', 1, 'Da Xue Sao Luan');
INSERT INTO `sensitive_words` VALUES (1710, '高校骚乱', 1, 'Gao Xiao Sao Luan');
INSERT INTO `sensitive_words` VALUES (1711, '催情药', 1, 'Cui Qing Yao');
INSERT INTO `sensitive_words` VALUES (1712, '拍肩神药', 1, 'Pai Jian Shen Yao');
INSERT INTO `sensitive_words` VALUES (1713, '身份证生成器', 1, 'Shen Fen Zheng Sheng Cheng Qi');
INSERT INTO `sensitive_words` VALUES (1714, '枪决现场', 1, 'Qiang Jue Xian Chang');
INSERT INTO `sensitive_words` VALUES (1715, '出售手枪', 1, 'Chu Shou Shou Qiang');
INSERT INTO `sensitive_words` VALUES (1716, '办理证件', 1, 'Ban Li Zheng Jian');
INSERT INTO `sensitive_words` VALUES (1717, '办理文凭', 1, 'Ban Li Wen Ping');
INSERT INTO `sensitive_words` VALUES (1718, '高干子弟', 1, 'Gao Gan Zi Di');
INSERT INTO `sensitive_words` VALUES (1719, '高干子女', 1, 'Gao Gan Zi Nv');
INSERT INTO `sensitive_words` VALUES (1720, '枪支弹药', 1, 'Qiang Zhi Dan Yao');
INSERT INTO `sensitive_words` VALUES (1721, '血腥图片', 1, 'Xue Xing Tu Pian');
INSERT INTO `sensitive_words` VALUES (1722, '反政府', 1, 'Fan Zheng Fu');
INSERT INTO `sensitive_words` VALUES (1723, '禁书', 1, 'Jin Shu');
INSERT INTO `sensitive_words` VALUES (1724, '无界浏览器', 1, 'Wu Jie Liu Lan Qi');
INSERT INTO `sensitive_words` VALUES (1725, '特码', 1, 'Te Ma');
INSERT INTO `sensitive_words` VALUES (1726, '成人', 1, 'Cheng Ren');
INSERT INTO `sensitive_words` VALUES (1727, '换妻', 1, 'Huan Qi');
INSERT INTO `sensitive_words` VALUES (1728, '腐败', 1, 'Fu Bai');
INSERT INTO `sensitive_words` VALUES (1729, '贪污', 1, 'Tan Wu');
INSERT INTO `sensitive_words` VALUES (1730, '骚妇', 1, 'Sao Fu');
INSERT INTO `sensitive_words` VALUES (1731, '台独=台反文旁虫', 1, 'Tai Du = Tai Fan Wen Pang Chong');
INSERT INTO `sensitive_words` VALUES (1732, '法论功=三点水去论工力', 1, 'Fa Lun Gong = San Dian Shui Qu Lun Gong Li');
INSERT INTO `sensitive_words` VALUES (1733, '李宏志=L·H·Z', 1, 'Li Hong Zhi = L · H · Z');
INSERT INTO `sensitive_words` VALUES (1734, '江湖淫娘', 1, 'Jiang Hu Yin Niang');
INSERT INTO `sensitive_words` VALUES (1735, '骆冰淫传', 1, 'Luo Bing Yin Chuan');
INSERT INTO `sensitive_words` VALUES (1736, '夫妇乐园', 1, 'Fu Fu Le Yuan');
INSERT INTO `sensitive_words` VALUES (1737, '阿里布达年代记', 1, 'A Li Bu Da Nian Dai Ji');
INSERT INTO `sensitive_words` VALUES (1738, '爱神之传奇', 1, 'Ai Shen Zhi Chuan Qi');
INSERT INTO `sensitive_words` VALUES (1739, '不良少女日记', 1, 'Bu Liang Shao Nv Ri Ji');
INSERT INTO `sensitive_words` VALUES (1740, '沧澜曲', 1, 'Cang Lan Qu');
INSERT INTO `sensitive_words` VALUES (1741, '创世之子猎艳之旅', 1, 'Chuang Shi Zhi Zi Lie Yan Zhi Lv');
INSERT INTO `sensitive_words` VALUES (1742, '东北风情熟女之惑', 1, 'Dong Bei Feng Qing Shu Nv Zhi Huo');
INSERT INTO `sensitive_words` VALUES (1743, '风骚侍女', 1, 'Feng Sao Shi Nv');
INSERT INTO `sensitive_words` VALUES (1744, '海盗的悠闲生活', 1, 'Hai Dao De You Xian Sheng Huo');
INSERT INTO `sensitive_words` VALUES (1745, '黑天使', 1, 'Hei Tian Shi');
INSERT INTO `sensitive_words` VALUES (1746, '黑星女侠', 1, 'Hei Xing Nv Xia');
INSERT INTO `sensitive_words` VALUES (1747, '混蛋神风流史', 1, 'Hun Dan Shen Feng Liu Shi');
INSERT INTO `sensitive_words` VALUES (1748, '狡猾的风水相师', 1, 'Jiao Hua De Feng Shui Xiang Shi');
INSERT INTO `sensitive_words` VALUES (1749, '俪影蝎心', 1, 'Li Ying Xie Xin');
INSERT INTO `sensitive_words` VALUES (1750, '秦青的幸福生活', 1, 'Qin Qing De Xing Fu Sheng Huo');
INSERT INTO `sensitive_words` VALUES (1751, '四海龙女', 1, 'Si Hai Long Nv');
INSERT INTO `sensitive_words` VALUES (1752, '逃亡艳旅', 1, 'Tao Wang Yan Lv');
INSERT INTO `sensitive_words` VALUES (1753, '性启蒙', 1, 'Xing Qi Meng');
INSERT INTO `sensitive_words` VALUES (1754, '现代艳帝传奇', 1, 'Xian Dai Yan Di Chuan Qi');
INSERT INTO `sensitive_words` VALUES (1755, '星光伴我淫', 1, 'Xing Guang Ban Wo Yin');
INSERT INTO `sensitive_words` VALUES (1756, '倚天屠龙别记', 1, 'Yi Tian Tu Long Bie Ji');
INSERT INTO `sensitive_words` VALUES (1757, '十景缎', 1, 'Shi Jing Duan');
INSERT INTO `sensitive_words` VALUES (1758, '往事追忆录', 1, 'Wang Shi Zhui Yi Lu');
INSERT INTO `sensitive_words` VALUES (1759, '舌战法庭', 1, 'She Zhan Fa Ting');
INSERT INTO `sensitive_words` VALUES (1760, '少妇白洁', 1, 'Shao Fu Bai Jie');
INSERT INTO `sensitive_words` VALUES (1761, '风尘劫', 1, 'Feng Chen Jie');
INSERT INTO `sensitive_words` VALUES (1762, '美少妇的哀羞', 1, 'Mei Shao Fu De Ai Xiu');
INSERT INTO `sensitive_words` VALUES (1763, '阿兵哥言语录', 1, 'A Bing Ge Yan Yu Lu');
INSERT INTO `sensitive_words` VALUES (1764, '遥想当年春衫薄', 1, 'Yao Xiang Dang Nian Chun Shan Bo');
INSERT INTO `sensitive_words` VALUES (1765, '王子淫传', 1, 'Wang Zi Yin Chuan');
INSERT INTO `sensitive_words` VALUES (1766, '神雕外传之郭襄', 1, 'Shen Diao Wai Chuan Zhi Guo Xiang');
INSERT INTO `sensitive_words` VALUES (1767, '睡着的武神', 1, 'Shui Zhe De Wu Shen');
INSERT INTO `sensitive_words` VALUES (1768, '毛主席复活', 1, 'Mao Zhu Xi Fu Huo');
INSERT INTO `sensitive_words` VALUES (1769, '蒙汗药', 1, 'Meng Han Yao');
INSERT INTO `sensitive_words` VALUES (1770, '粗口歌', 1, 'Cu Kou Ge');
INSERT INTO `sensitive_words` VALUES (1771, '激情电影', 1, 'Ji Qing Dian Ying');
INSERT INTO `sensitive_words` VALUES (1772, 'AV', 1, 'A V');
INSERT INTO `sensitive_words` VALUES (1773, '十八禁', 1, 'Shi Ba Jin');
INSERT INTO `sensitive_words` VALUES (1774, '性虐待', 1, 'Xing Nve Dai');
INSERT INTO `sensitive_words` VALUES (1775, '耽美', 1, 'Dan Mei');
INSERT INTO `sensitive_words` VALUES (1776, '金瓶梅', 1, 'Jin Ping Mei');
INSERT INTO `sensitive_words` VALUES (1777, '毛片', 1, 'Mao Pian');
INSERT INTO `sensitive_words` VALUES (1778, '少儿不宜', 1, 'Shao Er Bu Yi');
INSERT INTO `sensitive_words` VALUES (1779, '藏春阁', 1, 'Zang Chun Ge');
INSERT INTO `sensitive_words` VALUES (1780, '隐形喷剂', 1, 'Yin Xing Pen Ji');
INSERT INTO `sensitive_words` VALUES (1781, '反雷达测速', 1, 'Fan Lei Da Ce Su');
INSERT INTO `sensitive_words` VALUES (1782, '假币', 1, 'Jia Bi');
INSERT INTO `sensitive_words` VALUES (1783, '假钞', 1, 'Jia Chao');
INSERT INTO `sensitive_words` VALUES (1784, '窃听', 1, 'Qie Ting');
INSERT INTO `sensitive_words` VALUES (1785, '电话拦截系统', 1, 'Dian Hua Lan Jie Xi Tong');
INSERT INTO `sensitive_words` VALUES (1786, '探测狗', 1, 'Tan Ce Gou');
INSERT INTO `sensitive_words` VALUES (1787, '手机卡复制器', 1, 'Shou Ji Ka Fu Zhi Qi');
INSERT INTO `sensitive_words` VALUES (1788, '手机跟踪定位器', 1, 'Shou Ji Gen Zong Ding Wei Qi');
INSERT INTO `sensitive_words` VALUES (1789, '监听器', 1, 'Jian Ting Qi');
INSERT INTO `sensitive_words` VALUES (1790, '针孔摄像', 1, 'Zhen Kong She Xiang');
INSERT INTO `sensitive_words` VALUES (1791, '监听宝', 1, 'Jian Ting Bao');
INSERT INTO `sensitive_words` VALUES (1792, '迷幻药', 1, 'Mi Huan Yao');
INSERT INTO `sensitive_words` VALUES (1793, '手拍肩', 1, 'Shou Pai Jian');
INSERT INTO `sensitive_words` VALUES (1794, '迷魂香', 1, 'Mi Hun Xiang');
INSERT INTO `sensitive_words` VALUES (1795, '政府软弱', 1, 'Zheng Fu Ruan Ruo');
INSERT INTO `sensitive_words` VALUES (1796, '政府无能', 1, 'Zheng Fu Wu Neng');
INSERT INTO `sensitive_words` VALUES (1797, '十七大代表', 1, 'Shi Qi Da Dai Biao');
INSERT INTO `sensitive_words` VALUES (1798, '办证', 1, 'Ban Zheng');
INSERT INTO `sensitive_words` VALUES (1799, '暴力拆迁', 1, 'Bao Li Chai Qian');
INSERT INTO `sensitive_words` VALUES (1800, '轮暴致死', 1, 'Lun Bao Zhi Si');
INSERT INTO `sensitive_words` VALUES (1801, '人民报', 1, 'Ren Min Bao');
INSERT INTO `sensitive_words` VALUES (1802, '天葬', 1, 'Tian Zang');
INSERT INTO `sensitive_words` VALUES (1803, '暴力镇压', 1, 'Bao Li Zhen Ya');
INSERT INTO `sensitive_words` VALUES (1804, '天安门事件', 1, 'Tian An Men Shi Jian');
INSERT INTO `sensitive_words` VALUES (1805, '高干子弟名单', 1, 'Gao Gan Zi Di Ming Dan');
INSERT INTO `sensitive_words` VALUES (1806, '性免费电影', 1, 'Xing Mian Fei Dian Ying');
INSERT INTO `sensitive_words` VALUES (1807, '偷 拍', 1, 'Tou   Pai');
INSERT INTO `sensitive_words` VALUES (1808, '中共十七大', 1, 'Zhong Gong Shi Qi Da');
INSERT INTO `sensitive_words` VALUES (1809, '徐和柴学友', 1, 'Xu He Chai Xue You');
INSERT INTO `sensitive_words` VALUES (1810, '修炼之歌', 1, 'Xiu Lian Zhi Ge');
INSERT INTO `sensitive_words` VALUES (1811, '警察殴打', 1, 'Jing Cha Ou Da');
INSERT INTO `sensitive_words` VALUES (1812, '新诗年鉴', 1, 'Xin Shi Nian Jian');
INSERT INTO `sensitive_words` VALUES (1813, '李沛瑶遇害', 1, 'Li Pei Yao Yu Hai');
INSERT INTO `sensitive_words` VALUES (1814, '美国凯德', 1, 'Mei Guo Kai De');
INSERT INTO `sensitive_words` VALUES (1815, '肥东交警', 1, 'Fei Dong Jiao Jing');
INSERT INTO `sensitive_words` VALUES (1816, '中央军委', 1, 'Zhong Yang Jun Wei');
INSERT INTO `sensitive_words` VALUES (1817, '针对台湾', 1, 'Zhen Dui Tai Wan');
INSERT INTO `sensitive_words` VALUES (1818, '梁保华', 1, 'Liang Bao Hua');
INSERT INTO `sensitive_words` VALUES (1819, 'MC军团', 1, 'M C Jun Tuan');
INSERT INTO `sensitive_words` VALUES (1820, '旧民运', 1, 'Jiu Min Yun');
INSERT INTO `sensitive_words` VALUES (1821, '伪民运', 1, 'Wei Min Yun');
INSERT INTO `sensitive_words` VALUES (1822, '采花堂', 1, 'Cai Hua Tang');
INSERT INTO `sensitive_words` VALUES (1823, '中国劳工通讯', 1, 'Zhong Guo Lao Gong Tong Xun');
INSERT INTO `sensitive_words` VALUES (1824, '评中国共产党', 1, 'Ping Zhong Guo Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (1825, '建立生活性补贴', 1, 'Jian Li Sheng Huo Xing Bu Tie');
INSERT INTO `sensitive_words` VALUES (1826, '中共走狗', 1, 'Zhong Gong Zou Gou');
INSERT INTO `sensitive_words` VALUES (1827, '中共小丑', 1, 'Zhong Gong Xiao Chou');
INSERT INTO `sensitive_words` VALUES (1828, '共奴', 1, 'Gong Nu');
INSERT INTO `sensitive_words` VALUES (1829, '中共恶霸', 1, 'Zhong Gong E Ba');
INSERT INTO `sensitive_words` VALUES (1830, '共产无赖', 1, 'Gong Chan Wu Lai');
INSERT INTO `sensitive_words` VALUES (1831, '右派', 1, 'You Pai');
INSERT INTO `sensitive_words` VALUES (1832, '流氓政府', 1, 'Liu Mang Zheng Fu');
INSERT INTO `sensitive_words` VALUES (1833, '原子弹制作简明教程', 1, 'Yuan Zi Dan Zhi Zuo Jian Ming Jiao Cheng');
INSERT INTO `sensitive_words` VALUES (1834, '绝食抗议', 1, 'Jue Shi Kang Yi');
INSERT INTO `sensitive_words` VALUES (1835, '北戴河会议', 1, 'Bei Dai He Hui Yi');
INSERT INTO `sensitive_words` VALUES (1836, '邓二世', 1, 'Deng Er Shi');
INSERT INTO `sensitive_words` VALUES (1837, '内斗退党', 1, 'Nei Dou Tui Dang');
INSERT INTO `sensitive_words` VALUES (1838, '退团', 1, 'Tui Tuan');
INSERT INTO `sensitive_words` VALUES (1839, '江理论', 1, 'Jiang Li Lun');
INSERT INTO `sensitive_words` VALUES (1840, '香港六合彩', 1, 'Xiang Gang Liu He Cai');
INSERT INTO `sensitive_words` VALUES (1841, 'A集中营', 1, 'A Ji Zhong Ying');
INSERT INTO `sensitive_words` VALUES (1842, '法新闻社', 1, 'Fa Xin Wen She');
INSERT INTO `sensitive_words` VALUES (1843, '欧洲圆明网', 1, 'Ou Zhou Yuan Ming Wang');
INSERT INTO `sensitive_words` VALUES (1844, '亚太正悟网', 1, 'Ya Tai Zheng Wu Wang');
INSERT INTO `sensitive_words` VALUES (1845, '大法新闻社', 1, 'Da Fa Xin Wen She');
INSERT INTO `sensitive_words` VALUES (1846, '白宫事件', 1, 'Bai Gong Shi Jian');
INSERT INTO `sensitive_words` VALUES (1847, '日本大使馆0R409游行', 1, 'Ri Ben Da Shi Guan 0 R 4 0 9 You Xing');
INSERT INTO `sensitive_words` VALUES (1848, '反日万人游行', 1, 'Fan Ri Wan Ren You Xing');
INSERT INTO `sensitive_words` VALUES (1849, '六四屠杀', 1, 'Liu Si Tu Sha');
INSERT INTO `sensitive_words` VALUES (1850, '六四屠城', 1, 'Liu Si Tu Cheng');
INSERT INTO `sensitive_words` VALUES (1851, '六四政变', 1, 'Liu Si Zheng Bian');
INSERT INTO `sensitive_words` VALUES (1852, '六四之役', 1, 'Liu Si Zhi Yi');
INSERT INTO `sensitive_words` VALUES (1853, '27军长砸洗浴中心', 1, '2 7 Jun Zhang Za Xi Yu Zhong Xin');
INSERT INTO `sensitive_words` VALUES (1854, '中共邪教', 1, 'Zhong Gong Xie Jiao');
INSERT INTO `sensitive_words` VALUES (1855, '调查真相委员会', 1, 'Diao Cha Zhen Xiang Wei Yuan Hui');
INSERT INTO `sensitive_words` VALUES (1856, '追查国际', 1, 'Zhui Cha Guo Ji');
INSERT INTO `sensitive_words` VALUES (1857, '中共暴行', 1, 'Zhong Gong Bao Xing');
INSERT INTO `sensitive_words` VALUES (1858, '大法洪传', 1, 'Da Fa Hong Chuan');
INSERT INTO `sensitive_words` VALUES (1859, '弘法体', 1, 'Hong Fa Ti');
INSERT INTO `sensitive_words` VALUES (1860, '大法之声', 1, 'Da Fa Zhi Sheng');
INSERT INTO `sensitive_words` VALUES (1861, '江独裁', 1, 'Jiang Du Cai');
INSERT INTO `sensitive_words` VALUES (1862, '李屠夫', 1, 'Li Tu Fu');
INSERT INTO `sensitive_words` VALUES (1863, '江恶人', 1, 'Jiang E Ren');
INSERT INTO `sensitive_words` VALUES (1864, '中共特务', 1, 'Zhong Gong Te Wu');
INSERT INTO `sensitive_words` VALUES (1865, '乙醚', 1, 'Yi Mi');
INSERT INTO `sensitive_words` VALUES (1866, '党内分裂', 1, 'Dang Nei Fen Lie');
INSERT INTO `sensitive_words` VALUES (1867, '新生网', 1, 'Xin Sheng Wang');
INSERT INTO `sensitive_words` VALUES (1868, '圆明网', 1, 'Yuan Ming Wang');
INSERT INTO `sensitive_words` VALUES (1869, '发正念', 1, 'Fa Zheng Nian');
INSERT INTO `sensitive_words` VALUES (1870, '和平修炼', 1, 'He Ping Xiu Lian');
INSERT INTO `sensitive_words` VALUES (1871, '放下生死', 1, 'Fang Xia Sheng Si');
INSERT INTO `sensitive_words` VALUES (1872, '大法大福', 1, 'Da Fa Da Fu');
INSERT INTO `sensitive_words` VALUES (1873, '大硞弟子', 1, 'Da Que Di Zi');
INSERT INTO `sensitive_words` VALUES (1874, '支联会', 1, 'Zhi Lian Hui');
INSERT INTO `sensitive_words` VALUES (1875, '共产极权', 1, 'Gong Chan Ji Quan');
INSERT INTO `sensitive_words` VALUES (1876, '专政机器', 1, 'Zhuan Zheng Ji Qi');
INSERT INTO `sensitive_words` VALUES (1877, '毛派', 1, 'Mao Pai');
INSERT INTO `sensitive_words` VALUES (1878, '法网恢恢', 1, 'Fa Wang Hui Hui');
INSERT INTO `sensitive_words` VALUES (1879, '邓派', 1, 'Deng Pai');
INSERT INTO `sensitive_words` VALUES (1880, '五套功法', 1, 'Wu Tao Gong Fa');
INSERT INTO `sensitive_words` VALUES (1881, '宇宙最高法理', 1, 'Yu Zhou Zui Gao Fa Li');
INSERT INTO `sensitive_words` VALUES (1882, '法正人间', 1, 'Fa Zheng Ren Jian');
INSERT INTO `sensitive_words` VALUES (1883, '法正乾坤', 1, 'Fa Zheng Qian Kun');
INSERT INTO `sensitive_words` VALUES (1884, '正法时期', 1, 'Zheng Fa Shi Qi');
INSERT INTO `sensitive_words` VALUES (1885, '海外护法', 1, 'Hai Wai Hu Fa');
INSERT INTO `sensitive_words` VALUES (1886, '洪发交流', 1, 'Hong Fa Jiao Liu');
INSERT INTO `sensitive_words` VALUES (1887, '报禁', 1, 'Bao Jin');
INSERT INTO `sensitive_words` VALUES (1888, '党禁', 1, 'Dang Jin');
INSERT INTO `sensitive_words` VALUES (1889, '鸽派', 1, 'Ge Pai');
INSERT INTO `sensitive_words` VALUES (1890, '鹰派', 1, 'Ying Pai');
INSERT INTO `sensitive_words` VALUES (1891, '赣江学院暴动', 1, 'Gan Jiang Xue Yuan Bao Dong');
INSERT INTO `sensitive_words` VALUES (1892, '全国退党', 1, 'Quan Guo Tui Dang');
INSERT INTO `sensitive_words` VALUES (1893, '绝食抗暴', 1, 'Jue Shi Kang Bao');
INSERT INTO `sensitive_words` VALUES (1894, '维权抗暴', 1, 'Wei Quan Kang Bao');
INSERT INTO `sensitive_words` VALUES (1895, '活体器官', 1, 'Huo Ti Qi Guan');
INSERT INTO `sensitive_words` VALUES (1896, '中共暴政', 1, 'Zhong Gong Bao Zheng');
INSERT INTO `sensitive_words` VALUES (1897, '器官移植', 1, 'Qi Guan Yi Zhi');
INSERT INTO `sensitive_words` VALUES (1898, '中共当局', 1, 'Zhong Gong Dang Ju');
INSERT INTO `sensitive_words` VALUES (1899, '胡温政府', 1, 'Hu Wen Zheng Fu');
INSERT INTO `sensitive_words` VALUES (1900, '江罗集团', 1, 'Jiang Luo Ji Tuan');
INSERT INTO `sensitive_words` VALUES (1901, '师傅法身', 1, 'Shi Fu Fa Shen');
INSERT INTO `sensitive_words` VALUES (1902, '正派民运', 1, 'Zheng Pai Min Yun');
INSERT INTO `sensitive_words` VALUES (1903, '中华联邦政府', 1, 'Zhong Hua Lian Bang Zheng Fu');
INSERT INTO `sensitive_words` VALUES (1904, '亲共行动', 1, 'Qin Gong Xing Dong');
INSERT INTO `sensitive_words` VALUES (1905, '联邦政府', 1, 'Lian Bang Zheng Fu');
INSERT INTO `sensitive_words` VALUES (1906, '流氓民运', 1, 'Liu Mang Min Yun');
INSERT INTO `sensitive_words` VALUES (1907, '特务民运', 1, 'Te Wu Min Yun');
INSERT INTO `sensitive_words` VALUES (1908, '江贼民', 1, 'Jiang Zei Min');
INSERT INTO `sensitive_words` VALUES (1909, '中共警察', 1, 'Zhong Gong Jing Cha');
INSERT INTO `sensitive_words` VALUES (1910, '中共监狱', 1, 'Zhong Gong Jian Yu');
INSERT INTO `sensitive_words` VALUES (1911, '中共政权', 1, 'Zhong Gong Zheng Quan');
INSERT INTO `sensitive_words` VALUES (1912, '中共迫害', 1, 'Zhong Gong Po Hai');
INSERT INTO `sensitive_words` VALUES (1913, '自由联邦', 1, 'Zi You Lian Bang');
INSERT INTO `sensitive_words` VALUES (1914, '中共独枭', 1, 'Zhong Gong Du Xiao');
INSERT INTO `sensitive_words` VALUES (1915, '流氓无产者', 1, 'Liu Mang Wu Chan Zhe');
INSERT INTO `sensitive_words` VALUES (1916, '中共专制', 1, 'Zhong Gong Zhuan Zhi');
INSERT INTO `sensitive_words` VALUES (1917, '明慧周刊', 1, 'Ming Hui Zhou Kan');
INSERT INTO `sensitive_words` VALUES (1918, '九评共产党', 1, 'Jiu Ping Gong Chan Dang');
INSERT INTO `sensitive_words` VALUES (1919, '江泽民其人', 1, 'Jiang Ze Min Qi Ren');
INSERT INTO `sensitive_words` VALUES (1920, '色情', 1, 'Se Qing');
INSERT INTO `sensitive_words` VALUES (1921, '秘密文件', 1, 'Mi Mi Wen Jian');
INSERT INTO `sensitive_words` VALUES (1922, '机密文件', 1, 'Ji Mi Wen Jian');
INSERT INTO `sensitive_words` VALUES (1923, '红头文件', 1, 'Hong Tou Wen Jian');
INSERT INTO `sensitive_words` VALUES (1924, '政府文件', 1, 'Zheng Fu Wen Jian');
INSERT INTO `sensitive_words` VALUES (1925, '自焚', 1, 'Zi Fen');
INSERT INTO `sensitive_words` VALUES (1926, '破网软件', 1, 'Po Wang Ruan Jian');
INSERT INTO `sensitive_words` VALUES (1927, '亲共来源', 1, 'Qin Gong Lai Yuan');
INSERT INTO `sensitive_words` VALUES (1928, '黄色小说', 1, 'Huang Se Xiao Shuo');
INSERT INTO `sensitive_words` VALUES (1929, '台湾18DY电影', 1, 'Tai Wan 1 8 D Y Dian Ying');
INSERT INTO `sensitive_words` VALUES (1930, 'tmd', 1, 't m d');
INSERT INTO `sensitive_words` VALUES (1931, 'nnd', 1, 'n n d');
INSERT INTO `sensitive_words` VALUES (1932, '亚热', 1, 'Ya Re');
INSERT INTO `sensitive_words` VALUES (1933, '包娃衣', 1, 'Bao Wa Yi');
INSERT INTO `sensitive_words` VALUES (1934, '禁播', 1, 'Jin Bo');
INSERT INTO `sensitive_words` VALUES (1935, 'H漫画', 1, 'H Man Hua');
INSERT INTO `sensitive_words` VALUES (1936, '丁度巴拉斯', 1, 'Ding Du Ba La Si');
INSERT INTO `sensitive_words` VALUES (1937, '大禁', 1, 'Da Jin');
INSERT INTO `sensitive_words` VALUES (1938, '买春堂', 1, 'Mai Chun Tang');
INSERT INTO `sensitive_words` VALUES (1939, '苏东解体', 1, 'Su Dong Jie Ti');
INSERT INTO `sensitive_words` VALUES (1940, '反右题材', 1, 'Fan You Ti Cai');
INSERT INTO `sensitive_words` VALUES (1941, '隐私图片', 1, 'Yin Si Tu Pian');
INSERT INTO `sensitive_words` VALUES (1942, '卫星接收器', 1, 'Wei Xing Jie Shou Qi');
INSERT INTO `sensitive_words` VALUES (1943, '卫星电视', 1, 'Wei Xing Dian Shi');
INSERT INTO `sensitive_words` VALUES (1944, '信号拦截器', 1, 'Xin Hao Lan Jie Qi');
INSERT INTO `sensitive_words` VALUES (1945, '中国威胁论', 1, 'Zhong Guo Wei Xie Lun');
INSERT INTO `sensitive_words` VALUES (1946, '新闻通气会', 1, 'Xin Wen Tong Qi Hui');
INSERT INTO `sensitive_words` VALUES (1947, '山西洪洞', 1, 'Shan Xi Hong Dong');
INSERT INTO `sensitive_words` VALUES (1948, '巨额骗储', 1, 'Ju E Pian Chu');
INSERT INTO `sensitive_words` VALUES (1949, '五奶小青', 1, 'Wu Nai Xiao Qing');
INSERT INTO `sensitive_words` VALUES (1950, '红楼绮梦', 1, 'Hong Lou Qi Meng');
INSERT INTO `sensitive_words` VALUES (1951, '阿里布达年代', 1, 'A Li Bu Da Nian Dai');
INSERT INTO `sensitive_words` VALUES (1952, '不良少少日记', 1, 'Bu Liang Shao Shao Ri Ji');
INSERT INTO `sensitive_words` VALUES (1953, '狂风暴雨', 1, 'Kuang Feng Bao Yu');
INSERT INTO `sensitive_words` VALUES (1954, '梦中的女孩', 1, 'Meng Zhong De Nv Hai');
INSERT INTO `sensitive_words` VALUES (1955, '首先使用核武器', 1, 'Shou Xian Shi Yong He Wu Qi');
INSERT INTO `sensitive_words` VALUES (1956, '汽车爆炸案', 1, 'Qi Che Bao Zha An');
INSERT INTO `sensitive_words` VALUES (1957, '香港GHB水', 1, 'Xiang Gang G H B Shui');
INSERT INTO `sensitive_words` VALUES (1958, '色空寺', 1, 'Se Kong Si');
INSERT INTO `sensitive_words` VALUES (1959, '周容重', 1, 'Zhou Rong Zhong');
INSERT INTO `sensitive_words` VALUES (1960, '朱蒙', 1, 'Zhu Meng');
INSERT INTO `sensitive_words` VALUES (1961, '汕頭頻傳擄童割器官', 1, 'Shan Tou Pin Chuan Lu Tong Ge Qi Guan');
INSERT INTO `sensitive_words` VALUES (1962, '法輪功', 1, 'Fa Lun Gong');
INSERT INTO `sensitive_words` VALUES (1963, '六决不', 1, 'Liu Jue Bu');
INSERT INTO `sensitive_words` VALUES (1964, '清华网管', 1, 'Qing Hua Wang Guan');
INSERT INTO `sensitive_words` VALUES (1965, '道县公安', 1, 'Dao Xian Gong An');
INSERT INTO `sensitive_words` VALUES (1966, '济南建设路', 1, 'Ji Nan Jian She Lu');
INSERT INTO `sensitive_words` VALUES (1967, '老虎机', 1, 'Lao Hu Ji');
INSERT INTO `sensitive_words` VALUES (1968, '轮盘机', 1, 'Lun Pan Ji');
INSERT INTO `sensitive_words` VALUES (1969, '百家乐', 1, 'Bai Jia Le');
INSERT INTO `sensitive_words` VALUES (1970, '连线机', 1, 'Lian Xian Ji');
INSERT INTO `sensitive_words` VALUES (1971, '模拟机', 1, 'Mo Ni Ji');
INSERT INTO `sensitive_words` VALUES (1972, '彩票机', 1, 'Cai Piao Ji');
INSERT INTO `sensitive_words` VALUES (1973, '礼品机', 1, 'Li Pin Ji');
INSERT INTO `sensitive_words` VALUES (1974, '卢跃刚', 1, 'Lu Yue Gang');
INSERT INTO `sensitive_words` VALUES (1975, '玫瑰园', 1, 'Mei Gui Yuan');
INSERT INTO `sensitive_words` VALUES (1976, '天浴', 1, 'Tian Yu');
INSERT INTO `sensitive_words` VALUES (1977, '一卡多号', 1, 'Yi Ka Duo Hao');
INSERT INTO `sensitive_words` VALUES (1978, '偷电', 1, 'Tou Dian');
INSERT INTO `sensitive_words` VALUES (1979, '盗电', 1, 'Dao Dian');
INSERT INTO `sensitive_words` VALUES (1980, '中国人都在上的四大当', 1, 'Zhong Guo Ren Dou Zai Shang De Si Da Dang');
INSERT INTO `sensitive_words` VALUES (1981, '总统的讲话', 1, 'Zong Tong De Jiang Hua');
INSERT INTO `sensitive_words` VALUES (1982, '痛批政法委', 1, 'Tong Pi Zheng Fa Wei');
INSERT INTO `sensitive_words` VALUES (1983, '山西黑砖窑', 1, 'Shan Xi Hei Zhuan Yao');
INSERT INTO `sensitive_words` VALUES (1984, '黑窑奴役', 1, 'Hei Yao Nu Yi');
INSERT INTO `sensitive_words` VALUES (1985, '杨元元', 1, 'Yang Yuan Yuan');
INSERT INTO `sensitive_words` VALUES (1986, '敢坐飞机吗', 1, 'Gan Zuo Fei Ji Ma');
INSERT INTO `sensitive_words` VALUES (1987, '韩国身份证', 1, 'Han Guo Shen Fen Zheng');
INSERT INTO `sensitive_words` VALUES (1988, '台湾身份证', 1, 'Tai Wan Shen Fen Zheng');
INSERT INTO `sensitive_words` VALUES (1989, '广电总局', 1, 'Guang Dian Zong Ju');
INSERT INTO `sensitive_words` VALUES (1990, '学生暴动', 1, 'Xue Sheng Bao Dong');
INSERT INTO `sensitive_words` VALUES (1991, '镇压学生', 1, 'Zhen Ya Xue Sheng');
INSERT INTO `sensitive_words` VALUES (1992, '广安第二人民医院', 1, 'Guang An Di Er Ren Min Yi Yuan');
INSERT INTO `sensitive_words` VALUES (1993, '山不过来', 1, 'Shan Bu Guo Lai');
INSERT INTO `sensitive_words` VALUES (1994, '胡新宇', 1, 'Hu Xin Yu');
INSERT INTO `sensitive_words` VALUES (1995, '趙紫陽', 1, 'Zhao Zi Yang');
INSERT INTO `sensitive_words` VALUES (1996, '赵紫阳', 1, 'Zhao Zi Yang');
INSERT INTO `sensitive_words` VALUES (1997, '自由亚州', 1, 'Zi You Ya Zhou');
INSERT INTO `sensitive_words` VALUES (1998, '明慧', 1, 'Ming Hui');
INSERT INTO `sensitive_words` VALUES (1999, '践踏中国女性', 1, 'Jian Ta Zhong Guo Nv Xing');
INSERT INTO `sensitive_words` VALUES (2000, '拉凳', 1, 'La Deng');
INSERT INTO `sensitive_words` VALUES (2001, '南京大学法学院', 1, 'Nan Jing Da Xue Fa Xue Yuan');
INSERT INTO `sensitive_words` VALUES (2002, '挥发型迷药', 1, 'Hui Fa Xing Mi Yao');
INSERT INTO `sensitive_words` VALUES (2003, '喷雾型迷药', 1, 'Pen Wu Xing Mi Yao');
INSERT INTO `sensitive_words` VALUES (2004, '金伯帆', 1, 'Jin Bo Fan');
INSERT INTO `sensitive_words` VALUES (2005, '崔英杰', 1, 'Cui Ying Jie');
INSERT INTO `sensitive_words` VALUES (2006, '松花江污染', 1, 'Song Hua Jiang Wu Ran');
INSERT INTO `sensitive_words` VALUES (2007, '火药制作', 1, 'Huo Yao Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2008, '江氏', 1, 'Jiang Shi');
INSERT INTO `sensitive_words` VALUES (2009, '第十六次代表', 1, 'Di Shi Liu Ci Dai Biao');
INSERT INTO `sensitive_words` VALUES (2010, '仁寿警方', 1, 'Ren Shou Jing Fang');
INSERT INTO `sensitive_words` VALUES (2011, '愈快乐愈堕落', 1, 'Yu Kuai Le Yu Duo Luo');
INSERT INTO `sensitive_words` VALUES (2012, '上海交警', 1, 'Shang Hai Jiao Jing');
INSERT INTO `sensitive_words` VALUES (2013, '最牛钉子户', 1, 'Zui Niu Ding Zi Hu');
INSERT INTO `sensitive_words` VALUES (2014, '淫间道', 1, 'Yin Jian Dao');
INSERT INTO `sensitive_words` VALUES (2015, '唐人电视台', 1, 'Tang Ren Dian Shi Tai');
INSERT INTO `sensitive_words` VALUES (2016, '江山美人志', 1, 'Jiang Shan Mei Ren Zhi');
INSERT INTO `sensitive_words` VALUES (2017, '六合采', 1, 'Liu He Cai');
INSERT INTO `sensitive_words` VALUES (2018, '民警当副院长', 1, 'Min Jing Dang Fu Yuan Zhang');
INSERT INTO `sensitive_words` VALUES (2019, '股市民谣', 1, 'Gu Shi Min Yao');
INSERT INTO `sensitive_words` VALUES (2020, '禁断少女', 1, 'Jin Duan Shao Nv');
INSERT INTO `sensitive_words` VALUES (2021, '卫星遭黑客攻击', 1, 'Wei Xing Zao Hei Ke Gong Ji');
INSERT INTO `sensitive_words` VALUES (2022, '萬人暴', 1, 'Wan Ren Bao');
INSERT INTO `sensitive_words` VALUES (2023, '中原油田', 1, 'Zhong Yuan You Tian');
INSERT INTO `sensitive_words` VALUES (2024, '张大权', 1, 'Zhang Da Quan');
INSERT INTO `sensitive_words` VALUES (2025, '油田总部', 1, 'You Tian Zong Bu');
INSERT INTO `sensitive_words` VALUES (2026, '枪淫少妇', 1, 'Qiang Yin Shao Fu');
INSERT INTO `sensitive_words` VALUES (2027, '博白县', 1, 'Bo Bai Xian');
INSERT INTO `sensitive_words` VALUES (2028, '動乱', 1, 'Dong Luan');
INSERT INTO `sensitive_words` VALUES (2029, '军火价格', 1, 'Jun Huo Jia Ge');
INSERT INTO `sensitive_words` VALUES (2030, '女死囚', 1, 'Nv Si Qiu');
INSERT INTO `sensitive_words` VALUES (2031, '劉奇葆', 1, 'Liu Qi Bao');
INSERT INTO `sensitive_words` VALUES (2032, '法lun功', 1, 'Fa l u n Gong');
INSERT INTO `sensitive_words` VALUES (2033, '女友坊', 1, 'Nv You Fang');
INSERT INTO `sensitive_words` VALUES (2034, '香港马会', 1, 'Xiang Gang Ma Hui');
INSERT INTO `sensitive_words` VALUES (2035, '白小姐', 1, 'Bai Xiao Jie');
INSERT INTO `sensitive_words` VALUES (2036, '一码中特', 1, 'Yi Ma Zhong Te');
INSERT INTO `sensitive_words` VALUES (2037, '艳照门', 1, 'Yan Zhao Men');
INSERT INTO `sensitive_words` VALUES (2038, '奴役童工', 1, 'Nu Yi Tong Gong');
INSERT INTO `sensitive_words` VALUES (2039, '计生风暴', 1, 'Ji Sheng Feng Bao');
INSERT INTO `sensitive_words` VALUES (2040, '厦门大游行', 1, 'Sha Men Da You Xing');
INSERT INTO `sensitive_words` VALUES (2041, '想不到的黑幕', 1, 'Xiang Bu Dao De Hei Mu');
INSERT INTO `sensitive_words` VALUES (2042, '死亡笔记', 1, 'Si Wang Bi Ji');
INSERT INTO `sensitive_words` VALUES (2043, '二奶', 1, 'Er Nai');
INSERT INTO `sensitive_words` VALUES (2044, '2奶', 1, '2 Nai');
INSERT INTO `sensitive_words` VALUES (2045, '纪股票市场五卅惨案', 1, 'Ji Gu Piao Shi Chang Wu Sa Can An');
INSERT INTO `sensitive_words` VALUES (2046, '这年头就这样', 1, 'Zhe Nian Tou Jiu Zhe Yang');
INSERT INTO `sensitive_words` VALUES (2047, '代开普通发票', 1, 'Dai Kai Pu Tong Fa Piao');
INSERT INTO `sensitive_words` VALUES (2048, '代开商品发票', 1, 'Dai Kai Shang Pin Fa Piao');
INSERT INTO `sensitive_words` VALUES (2049, '代开国税发票', 1, 'Dai Kai Guo Shui Fa Piao');
INSERT INTO `sensitive_words` VALUES (2050, '代开地税发票', 1, 'Dai Kai Di Shui Fa Piao');
INSERT INTO `sensitive_words` VALUES (2051, '代开广告发票', 1, 'Dai Kai Guang Gao Fa Piao');
INSERT INTO `sensitive_words` VALUES (2052, '代开运输发票', 1, 'Dai Kai Yun Shu Fa Piao');
INSERT INTO `sensitive_words` VALUES (2053, '代开租赁发票', 1, 'Dai Kai Zu Lin Fa Piao');
INSERT INTO `sensitive_words` VALUES (2054, '代开维修发票', 1, 'Dai Kai Wei Xiu Fa Piao');
INSERT INTO `sensitive_words` VALUES (2055, '代开建筑发票', 1, 'Dai Kai Jian Zhu Fa Piao');
INSERT INTO `sensitive_words` VALUES (2056, '代开安装发票', 1, 'Dai Kai An Zhuang Fa Piao');
INSERT INTO `sensitive_words` VALUES (2057, '代开餐饮发票', 1, 'Dai Kai Can Yin Fa Piao');
INSERT INTO `sensitive_words` VALUES (2058, '代开服务发票', 1, 'Dai Kai Fu Wu Fa Piao');
INSERT INTO `sensitive_words` VALUES (2059, '毛爷爷复活', 1, 'Mao Ye Ye Fu Huo');
INSERT INTO `sensitive_words` VALUES (2060, '智能Ｈ３', 1, 'Zhi Neng Ｈ ３');
INSERT INTO `sensitive_words` VALUES (2061, '智能H3', 1, 'Zhi Neng H 3');
INSERT INTO `sensitive_words` VALUES (2062, '赣江学院', 1, 'Gan Jiang Xue Yuan');
INSERT INTO `sensitive_words` VALUES (2063, '江西田园置业集团', 1, 'Jiang Xi Tian Yuan Zhi Ye Ji Tuan');
INSERT INTO `sensitive_words` VALUES (2064, '海乐神', 1, 'Hai Le Shen');
INSERT INTO `sensitive_words` VALUES (2065, '酣乐欣', 1, 'Han Le Xin');
INSERT INTO `sensitive_words` VALUES (2066, '高莺莺', 1, 'Gao Ying Ying');
INSERT INTO `sensitive_words` VALUES (2067, '无界', 1, 'Wu Jie');
INSERT INTO `sensitive_words` VALUES (2068, '广东王', 1, 'Guang Dong Wang');
INSERT INTO `sensitive_words` VALUES (2069, '口头检查', 1, 'Kou Tou Jian Cha');
INSERT INTO `sensitive_words` VALUES (2070, '三句硬话', 1, 'San Ju Ying Hua');
INSERT INTO `sensitive_words` VALUES (2071, '红海湾', 1, 'Hong Hai Wan');
INSERT INTO `sensitive_words` VALUES (2072, '升达', 1, 'Sheng Da');
INSERT INTO `sensitive_words` VALUES (2073, '沈阳公安', 1, 'Shen Yang Gong An');
INSERT INTO `sensitive_words` VALUES (2074, '拦截器', 1, 'Lan Jie Qi');
INSERT INTO `sensitive_words` VALUES (2075, '阻无通畅', 1, 'Zu Wu Tong Chang');
INSERT INTO `sensitive_words` VALUES (2076, '民为法执', 1, 'Min Wei Fa Zhi');
INSERT INTO `sensitive_words` VALUES (2077, '臭作', 1, 'Chou Zuo');
INSERT INTO `sensitive_words` VALUES (2078, '尾行', 1, 'Wei Xing');
INSERT INTO `sensitive_words` VALUES (2079, '电车之狼', 1, 'Dian Che Zhi Lang');
INSERT INTO `sensitive_words` VALUES (2080, '绕过封锁', 1, 'Rao Guo Feng Suo');
INSERT INTO `sensitive_words` VALUES (2081, '新疆独立', 1, 'Xin Jiang Du Li');
INSERT INTO `sensitive_words` VALUES (2082, '西藏独立', 1, 'Xi Zang Du Li');
INSERT INTO `sensitive_words` VALUES (2083, '本拉登', 1, 'Ben La Deng');
INSERT INTO `sensitive_words` VALUES (2084, '大紀元', 1, 'Da Ji Yuan');
INSERT INTO `sensitive_words` VALUES (2085, '汕尾事件', 1, 'Shan Wei Shi Jian');
INSERT INTO `sensitive_words` VALUES (2086, '公务员工资', 1, 'Gong Wu Yuan Gong Zi');
INSERT INTO `sensitive_words` VALUES (2087, '公务员调资', 1, 'Gong Wu Yuan Diao Zi');
INSERT INTO `sensitive_words` VALUES (2088, '公务员的工资', 1, 'Gong Wu Yuan De Gong Zi');
INSERT INTO `sensitive_words` VALUES (2089, '反中游行', 1, 'Fan Zhong You Xing');
INSERT INTO `sensitive_words` VALUES (2090, '双鞋的故事', 1, 'Shuang Xie De Gu Shi');
INSERT INTO `sensitive_words` VALUES (2091, '中国军用运输机', 1, 'Zhong Guo Jun Yong Yun Shu Ji');
INSERT INTO `sensitive_words` VALUES (2092, '科技精英遇难', 1, 'Ke Ji Jing Ying Yu Nan');
INSERT INTO `sensitive_words` VALUES (2093, '湘阴杨林', 1, 'Xiang Yin Yang Lin');
INSERT INTO `sensitive_words` VALUES (2094, '杨林寨', 1, 'Yang Lin Zhai');
INSERT INTO `sensitive_words` VALUES (2095, '湘阴县杨林', 1, 'Xiang Yin Xian Yang Lin');
INSERT INTO `sensitive_words` VALUES (2096, '死刑枪毙', 1, 'Si Xing Qiang Bi');
INSERT INTO `sensitive_words` VALUES (2097, '马加爵', 1, 'Ma Jia Jue');
INSERT INTO `sensitive_words` VALUES (2098, '死刑过程', 1, 'Si Xing Guo Cheng');
INSERT INTO `sensitive_words` VALUES (2099, '学生与警察', 1, 'Xue Sheng Yu Jing Cha');
INSERT INTO `sensitive_words` VALUES (2100, '鬼村', 1, 'Gui Cun');
INSERT INTO `sensitive_words` VALUES (2101, '周容', 1, 'Zhou Rong');
INSERT INTO `sensitive_words` VALUES (2102, '重题工', 1, 'Zhong Ti Gong');
INSERT INTO `sensitive_words` VALUES (2103, '先烈的电电', 1, 'Xian Lie De Dian Dian');
INSERT INTO `sensitive_words` VALUES (2104, '身份证生成', 1, 'Shen Fen Zheng Sheng Cheng');
INSERT INTO `sensitive_words` VALUES (2105, '短信猫', 1, 'Duan Xin Mao');
INSERT INTO `sensitive_words` VALUES (2106, '车牌反光', 1, 'Che Pai Fan Guang');
INSERT INTO `sensitive_words` VALUES (2107, '次下跪', 1, 'Ci Xia Gui');
INSERT INTO `sensitive_words` VALUES (2108, '求救遭拒', 1, 'Qiu Jiu Zao Ju');
INSERT INTO `sensitive_words` VALUES (2109, '邪恶的党', 1, 'Xie E De Dang');
INSERT INTO `sensitive_words` VALUES (2110, '出售迷药', 1, 'Chu Shou Mi Yao');
INSERT INTO `sensitive_words` VALUES (2111, '针孔摄像机', 1, 'Zhen Kong She Xiang Ji');
INSERT INTO `sensitive_words` VALUES (2112, '日本小泉', 1, 'Ri Ben Xiao Quan');
INSERT INTO `sensitive_words` VALUES (2113, '小泉恶搞', 1, 'Xiao Quan E Gao');
INSERT INTO `sensitive_words` VALUES (2114, '温家堡', 1, 'Wen Jia Bao');
INSERT INTO `sensitive_words` VALUES (2115, '灭绝罪', 1, 'Mie Jue Zui');
INSERT INTO `sensitive_words` VALUES (2116, '大揭露', 1, 'Da Jie Lu');
INSERT INTO `sensitive_words` VALUES (2117, '突破封锁', 1, 'Tu Po Feng Suo');
INSERT INTO `sensitive_words` VALUES (2118, '多党执政', 1, 'Duo Dang Zhi Zheng');
INSERT INTO `sensitive_words` VALUES (2119, '生成身份证', 1, 'Sheng Cheng Shen Fen Zheng');
INSERT INTO `sensitive_words` VALUES (2120, '华国锋', 1, 'Hua Guo Feng');
INSERT INTO `sensitive_words` VALUES (2121, '陈云', 1, 'Chen Yun');
INSERT INTO `sensitive_words` VALUES (2122, '韦国清', 1, 'Wei Guo Qing');
INSERT INTO `sensitive_words` VALUES (2123, '乌兰夫', 1, 'Wu Lan Fu');
INSERT INTO `sensitive_words` VALUES (2124, '方毅', 1, 'Fang Yi');
INSERT INTO `sensitive_words` VALUES (2125, '刘伯承', 1, 'Liu Bo Cheng');
INSERT INTO `sensitive_words` VALUES (2126, '许世友', 1, 'Xu Shi You');
INSERT INTO `sensitive_words` VALUES (2127, '纪登奎', 1, 'Ji Deng Kui');
INSERT INTO `sensitive_words` VALUES (2128, '苏振华', 1, 'Su Zhen Hua');
INSERT INTO `sensitive_words` VALUES (2129, '吴德', 1, 'Wu De');
INSERT INTO `sensitive_words` VALUES (2130, '余秋里', 1, 'Yu Qiu Li');
INSERT INTO `sensitive_words` VALUES (2131, '张廷发', 1, 'Zhang Ting Fa');
INSERT INTO `sensitive_words` VALUES (2132, '陈永贵', 1, 'Chen Yong Gui');
INSERT INTO `sensitive_words` VALUES (2133, '陈锡联', 1, 'Chen Xi Lian');
INSERT INTO `sensitive_words` VALUES (2134, '耿飚', 1, 'Geng Biao');
INSERT INTO `sensitive_words` VALUES (2135, '聂荣臻', 1, 'Nie Rong Zhen');
INSERT INTO `sensitive_words` VALUES (2136, '倪志福', 1, 'Ni Zhi Fu');
INSERT INTO `sensitive_words` VALUES (2137, '徐向前', 1, 'Xu Xiang Qian');
INSERT INTO `sensitive_words` VALUES (2138, '彭冲', 1, 'Peng Chong');
INSERT INTO `sensitive_words` VALUES (2139, '王震', 1, 'Wang Zhen');
INSERT INTO `sensitive_words` VALUES (2140, '邓颖超', 1, 'Deng Ying Chao');
INSERT INTO `sensitive_words` VALUES (2141, '杨尚昆', 1, 'Yang Shang Kun');
INSERT INTO `sensitive_words` VALUES (2142, '杨得志', 1, 'Yang De Zhi');
INSERT INTO `sensitive_words` VALUES (2143, '宋任穷', 1, 'Song Ren Qiong');
INSERT INTO `sensitive_words` VALUES (2144, '胡乔木', 1, 'Hu Qiao Mu');
INSERT INTO `sensitive_words` VALUES (2145, '胡耀邦', 1, 'Hu Yao Bang');
INSERT INTO `sensitive_words` VALUES (2146, '彭真', 1, 'Peng Zhen');
INSERT INTO `sensitive_words` VALUES (2147, '廖承志', 1, 'Liao Cheng Zhi');
INSERT INTO `sensitive_words` VALUES (2148, '秦基伟', 1, 'Qin Ji Wei');
INSERT INTO `sensitive_words` VALUES (2149, '陈慕华', 1, 'Chen Mu Hua');
INSERT INTO `sensitive_words` VALUES (2150, '田纪云', 1, 'Tian Ji Yun');
INSERT INTO `sensitive_words` VALUES (2151, '乔石', 1, 'Qiao Shi');
INSERT INTO `sensitive_words` VALUES (2152, '李锡铭', 1, 'Li Xi Ming');
INSERT INTO `sensitive_words` VALUES (2153, '杨汝岱', 1, 'Yang Ru Dai');
INSERT INTO `sensitive_words` VALUES (2154, '吴学谦', 1, 'Wu Xue Qian');
INSERT INTO `sensitive_words` VALUES (2155, '宋平', 1, 'Song Ping');
INSERT INTO `sensitive_words` VALUES (2156, '胡启立', 1, 'Hu Qi Li');
INSERT INTO `sensitive_words` VALUES (2157, '芮杏文', 1, 'Rui Xing Wen');
INSERT INTO `sensitive_words` VALUES (2158, '丁关根', 1, 'Ding Guan Gen');
INSERT INTO `sensitive_words` VALUES (2159, '刘华清', 1, 'Liu Hua Qing');
INSERT INTO `sensitive_words` VALUES (2160, '杨白冰', 1, 'Yang Bai Bing');
INSERT INTO `sensitive_words` VALUES (2161, '邹家华', 1, 'Zou Jia Hua');
INSERT INTO `sensitive_words` VALUES (2162, '陈希同', 1, 'Chen Xi Tong');
INSERT INTO `sensitive_words` VALUES (2163, '姜春云', 1, 'Jiang Chun Yun');
INSERT INTO `sensitive_words` VALUES (2164, '钱其琛', 1, 'Qian Qi Chen');
INSERT INTO `sensitive_words` VALUES (2165, '尉健行', 1, 'Wei Jian Xing');
INSERT INTO `sensitive_words` VALUES (2166, '谢非', 1, 'Xie Fei');
INSERT INTO `sensitive_words` VALUES (2167, '谭绍文', 1, 'Tan Shao Wen');
INSERT INTO `sensitive_words` VALUES (2168, '王汉斌', 1, 'Wang Han Bin');
INSERT INTO `sensitive_words` VALUES (2169, '任建新', 1, 'Ren Jian Xin');
INSERT INTO `sensitive_words` VALUES (2170, '迟浩田', 1, 'Chi Hao Tian');
INSERT INTO `sensitive_words` VALUES (2171, '张万年', 1, 'Zhang Wan Nian');
INSERT INTO `sensitive_words` VALUES (2172, '于永波', 1, 'Yu Yong Bo');
INSERT INTO `sensitive_words` VALUES (2173, '傅全有', 1, 'Fu Quan You');
INSERT INTO `sensitive_words` VALUES (2174, '罗干', 1, 'Luo Gan');
INSERT INTO `sensitive_words` VALUES (2175, '黄菊', 1, 'Huang Ju');
INSERT INTO `sensitive_words` VALUES (2176, '王克', 1, 'Wang Ke');
INSERT INTO `sensitive_words` VALUES (2177, '王瑞林', 1, 'Wang Rui Lin');
INSERT INTO `sensitive_words` VALUES (2178, '刘淇', 1, 'Liu Qi');
INSERT INTO `sensitive_words` VALUES (2179, '王刚', 1, 'Wang Gang');
INSERT INTO `sensitive_words` VALUES (2180, '隐形摄像头', 1, 'Yin Xing She Xiang Tou');
INSERT INTO `sensitive_words` VALUES (2181, '何勇', 1, 'He Yong');
INSERT INTO `sensitive_words` VALUES (2182, '李继耐', 1, 'Li Ji Nai');
INSERT INTO `sensitive_words` VALUES (2183, '裸聊', 1, 'Luo Liao');
INSERT INTO `sensitive_words` VALUES (2184, '代考', 1, 'Dai Kao');
INSERT INTO `sensitive_words` VALUES (2185, '英语枪手', 1, 'Ying Yu Qiang Shou');
INSERT INTO `sensitive_words` VALUES (2186, '考试作弊器', 1, 'Kao Shi Zuo Bi Qi');
INSERT INTO `sensitive_words` VALUES (2187, '开锁器', 1, 'Kai Suo Qi');
INSERT INTO `sensitive_words` VALUES (2188, '淫秽=yin*h', 1, 'Yin Hui = y i n * h');
INSERT INTO `sensitive_words` VALUES (2189, '定位器', 1, 'Ding Wei Qi');
INSERT INTO `sensitive_words` VALUES (2190, '上分器', 1, 'Shang Fen Qi');
INSERT INTO `sensitive_words` VALUES (2191, '干扰器', 1, 'Gan Rao Qi');
INSERT INTO `sensitive_words` VALUES (2192, '退币王', 1, 'Tui Bi Wang');
INSERT INTO `sensitive_words` VALUES (2193, '诈骗信息', 1, 'Zha Pian Xin Xi');
INSERT INTO `sensitive_words` VALUES (2194, '销售枪支', 1, 'Xiao Shou Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (2195, '爆炸物品', 1, 'Bao Zha Wu Pin');
INSERT INTO `sensitive_words` VALUES (2196, '性器官', 1, 'Xing Qi Guan');
INSERT INTO `sensitive_words` VALUES (2197, '风骚小阿姨', 1, 'Feng Sao Xiao A Yi');
INSERT INTO `sensitive_words` VALUES (2198, '非常诱惑', 1, 'Fei Chang You Huo');
INSERT INTO `sensitive_words` VALUES (2199, '风月宝鉴之冥府春色', 1, 'Feng Yue Bao Jian Zhi Ming Fu Chun Se');
INSERT INTO `sensitive_words` VALUES (2200, '风流一夜情', 1, 'Feng Liu Yi Ye Qing');
INSERT INTO `sensitive_words` VALUES (2201, '飞凤春宵', 1, 'Fei Feng Chun Xiao');
INSERT INTO `sensitive_words` VALUES (2202, '风情万种野玫瑰', 1, 'Feng Qing Wan Zhong Ye Mei Gui');
INSERT INTO `sensitive_words` VALUES (2203, '夫妻作爱', 1, 'Fu Qi Zuo Ai');
INSERT INTO `sensitive_words` VALUES (2204, '夫妻做爱', 1, 'Fu Qi Zuo Ai');
INSERT INTO `sensitive_words` VALUES (2205, '三级片片', 1, 'San Ji Pian Pian');
INSERT INTO `sensitive_words` VALUES (2206, '应召女郎', 1, 'Ying Zhao Nv Lang');
INSERT INTO `sensitive_words` VALUES (2207, '性生活', 1, 'Xing Sheng Huo');
INSERT INTO `sensitive_words` VALUES (2208, '香醇的诱惑', 1, 'Xiang Chun De You Huo');
INSERT INTO `sensitive_words` VALUES (2209, '奸杀', 1, 'Jian Sha');
INSERT INTO `sensitive_words` VALUES (2210, '血溅红灯区', 1, 'Xue Jian Hong Deng Qu');
INSERT INTO `sensitive_words` VALUES (2211, '雪肌夜叉', 1, 'Xue Ji Ye Cha');
INSERT INTO `sensitive_words` VALUES (2212, '血恋', 1, 'Xue Lian');
INSERT INTO `sensitive_words` VALUES (2213, '现代靓妹仔', 1, 'Xian Dai Jing Mei Zi');
INSERT INTO `sensitive_words` VALUES (2214, '新七擒七纵七色狼', 1, 'Xin Qi Qin Qi Zong Qi Se Lang');
INSERT INTO `sensitive_words` VALUES (2215, '骚b', 1, 'Sao b');
INSERT INTO `sensitive_words` VALUES (2216, '三级图片', 1, 'San Ji Tu Pian');
INSERT INTO `sensitive_words` VALUES (2217, '淫乱', 1, 'Yin Luan');
INSERT INTO `sensitive_words` VALUES (2218, 'a级情片', 1, 'a Ji Qing Pian');
INSERT INTO `sensitive_words` VALUES (2219, '淫乱秘史', 1, 'Yin Luan Mi Shi');
INSERT INTO `sensitive_words` VALUES (2220, '艳丽片', 1, 'Yan Li Pian');
INSERT INTO `sensitive_words` VALUES (2221, '香港伦理片', 1, 'Xiang Gang Lun Li Pian');
INSERT INTO `sensitive_words` VALUES (2222, '淫色漫画', 1, 'Yin Se Man Hua');
INSERT INTO `sensitive_words` VALUES (2223, '淫片', 1, 'Yin Pian');
INSERT INTO `sensitive_words` VALUES (2224, '叫春', 1, 'Jiao Chun');
INSERT INTO `sensitive_words` VALUES (2225, '中国性搜网', 1, 'Zhong Guo Xing Sou Wang');
INSERT INTO `sensitive_words` VALUES (2226, '阴毛', 1, 'Yin Mao');
INSERT INTO `sensitive_words` VALUES (2227, '艳舞女郎', 1, 'Yan Wu Nv Lang');
INSERT INTO `sensitive_words` VALUES (2228, '禁宮秘史', 1, 'Jin Gong Mi Shi');
INSERT INTO `sensitive_words` VALUES (2229, '少女换衣', 1, 'Shao Nv Huan Yi');
INSERT INTO `sensitive_words` VALUES (2230, '18dy', 1, '1 8 d y');
INSERT INTO `sensitive_words` VALUES (2231, '蒙汗药出售', 1, 'Meng Han Yao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2232, '迷奸药出售', 1, 'Mi Jian Yao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2233, '迷魂药出售', 1, 'Mi Hun Yao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2234, '迷情水出售', 1, 'Mi Qing Shui Chu Shou');
INSERT INTO `sensitive_words` VALUES (2235, '喷雾蒙汗药', 1, 'Pen Wu Meng Han Yao');
INSERT INTO `sensitive_words` VALUES (2236, '迷奸香水出售', 1, 'Mi Jian Xiang Shui Chu Shou');
INSERT INTO `sensitive_words` VALUES (2237, '香水型迷奸药', 1, 'Xiang Shui Xing Mi Jian Yao');
INSERT INTO `sensitive_words` VALUES (2238, '少女迷奸药水', 1, 'Shao Nv Mi Jian Yao Shui');
INSERT INTO `sensitive_words` VALUES (2239, '少女迷情药', 1, 'Shao Nv Mi Qing Yao');
INSERT INTO `sensitive_words` VALUES (2240, '少女迷情粉货到付款', 1, 'Shao Nv Mi Qing Fen Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2241, '狂插男根胶囊', 1, 'Kuang Cha Nan Gen Jiao Nang');
INSERT INTO `sensitive_words` VALUES (2242, '狂插性器具', 1, 'Kuang Cha Xing Qi Ju');
INSERT INTO `sensitive_words` VALUES (2243, 'SM后庭器具', 1, 'S M Hou Ting Qi Ju');
INSERT INTO `sensitive_words` VALUES (2244, '后庭专区', 1, 'Hou Ting Zhuan Qu');
INSERT INTO `sensitive_words` VALUES (2245, '口交器具', 1, 'Kou Jiao Qi Ju');
INSERT INTO `sensitive_words` VALUES (2246, '抽插仿真器具', 1, 'Chou Cha Fang Zhen Qi Ju');
INSERT INTO `sensitive_words` VALUES (2247, '淫荡口交妹', 1, 'Yin Dang Kou Jiao Mei');
INSERT INTO `sensitive_words` VALUES (2248, '前阴后庭抽插自慰器', 1, 'Qian Yin Hou Ting Chou Cha Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2249, '肛栓母狗', 1, 'Gang Shuan Mu Gou');
INSERT INTO `sensitive_words` VALUES (2250, '男根增长sex吧', 1, 'Nan Gen Zeng Zhang s e x Ba');
INSERT INTO `sensitive_words` VALUES (2251, '强奸丸', 1, 'Qiang Jian Wan');
INSERT INTO `sensitive_words` VALUES (2252, '淫荡迷情药', 1, 'Yin Dang Mi Qing Yao');
INSERT INTO `sensitive_words` VALUES (2253, '香烟迷药', 1, 'Xiang Yan Mi Yao');
INSERT INTO `sensitive_words` VALUES (2254, '催眠迷幻药', 1, 'Cui Mian Mi Huan Yao');
INSERT INTO `sensitive_words` VALUES (2255, '速效迷奸药', 1, 'Su Xiao Mi Jian Yao');
INSERT INTO `sensitive_words` VALUES (2256, '失身粉', 1, 'Shi Shen Fen');
INSERT INTO `sensitive_words` VALUES (2257, '拍肩迷药出售', 1, 'Pai Jian Mi Yao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2258, '红蜘蛛迷奸药', 1, 'Hong Zhi Zhu Mi Jian Yao');
INSERT INTO `sensitive_words` VALUES (2259, '西班牙苍蝇水', 1, 'Xi Ban Ya Cang Ying Shui');
INSERT INTO `sensitive_words` VALUES (2260, '制幻剂出售', 1, 'Zhi Huan Ji Chu Shou');
INSERT INTO `sensitive_words` VALUES (2261, '女性自慰sex吧', 1, 'Nv Xing Zi Wei s e x Ba');
INSERT INTO `sensitive_words` VALUES (2262, '淫荡肛交妹自慰器', 1, 'Yin Dang Gang Jiao Mei Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2263, '操屄自慰器', 1, 'Cao Bi Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2264, '花和尚社区成人性用品', 1, 'Hua He Shang She Qu Cheng Ren Xing Yong Pin');
INSERT INTO `sensitive_words` VALUES (2265, '美臀夹阴', 1, 'Mei Tun Jia Yin');
INSERT INTO `sensitive_words` VALUES (2266, '波霸乳交器具', 1, 'Bo Ba Ru Jiao Qi Ju');
INSERT INTO `sensitive_words` VALUES (2267, '成人仿真抽插', 1, 'Cheng Ren Fang Zhen Chou Cha');
INSERT INTO `sensitive_words` VALUES (2268, '灌肠自慰器', 1, 'Guan Chang Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2269, '舔阴自慰器', 1, 'Tian Yin Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2270, '淫荡自慰器', 1, 'Yin Dang Zi Wei Qi');
INSERT INTO `sensitive_words` VALUES (2271, '出售雷管', 1, 'Chu Shou Lei Guan');
INSERT INTO `sensitive_words` VALUES (2272, '出售炸药', 1, 'Chu Shou Zha Yao');
INSERT INTO `sensitive_words` VALUES (2273, '出售炸药 电话', 1, 'Chu Shou Zha Yao   Dian Hua');
INSERT INTO `sensitive_words` VALUES (2274, '制作火药配方', 1, 'Zhi Zuo Huo Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2275, '炸药出售 ', 1, 'Zha Yao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2276, '出售雷管炸药', 1, 'Chu Shou Lei Guan Zha Yao');
INSERT INTO `sensitive_words` VALUES (2277, '在家里做原子弹', 1, 'Zai Jia Li Zuo Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2278, '硝酸甘油炸弹制作', 1, 'Xiao Suan Gan You Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2279, 'TNT 炸弹的制作', 1, 'T N T   Zha Dan De Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2280, '硝铵炸药配方', 1, 'Xiao An Zha Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2281, '硝酸甘油制作', 1, 'Xiao Suan Gan You Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2282, '简易炸药', 1, 'Jian Yi Zha Yao');
INSERT INTO `sensitive_words` VALUES (2283, '火药制作简易炸弹', 1, 'Huo Yao Zhi Zuo Jian Yi Zha Dan');
INSERT INTO `sensitive_words` VALUES (2284, '炸弹制作', 1, 'Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2285, '硝酸甘油', 1, 'Xiao Suan Gan You');
INSERT INTO `sensitive_words` VALUES (2286, '硝酸甘油炸弹制作方法', 1, 'Xiao Suan Gan You Zha Dan Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2287, '手把手教你做炸弹', 1, 'Shou Ba Shou Jiao Ni Zuo Zha Dan');
INSERT INTO `sensitive_words` VALUES (2288, '恐怖分子傻瓜手册', 1, 'Kong Bu Fen Zi Sha Gua Shou Ce');
INSERT INTO `sensitive_words` VALUES (2289, '氢弹手工制作方法', 1, 'Qing Dan Shou Gong Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2290, '起爆器', 1, 'Qi Bao Qi');
INSERT INTO `sensitive_words` VALUES (2291, '自制燃烧弹', 1, 'Zi Zhi Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2292, '弹药制造方法', 1, 'Dan Yao Zhi Zao Fang Fa');
INSERT INTO `sensitive_words` VALUES (2293, '液体炸药配方', 1, 'Ye Ti Zha Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2294, '炸药配方与制作', 1, 'Zha Yao Pei Fang Yu Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2295, '自制炸药配方', 1, 'Zi Zhi Zha Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2296, 'tnt炸药成分', 1, 't n t Zha Yao Cheng Fen');
INSERT INTO `sensitive_words` VALUES (2297, '炸药的制作', 1, 'Zha Yao De Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2298, 'tnt炸药配方', 1, 't n t Zha Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2299, '各种炸药配方大全', 1, 'Ge Zhong Zha Yao Pei Fang Da Quan');
INSERT INTO `sensitive_words` VALUES (2300, '炸药的成分', 1, 'Zha Yao De Cheng Fen');
INSERT INTO `sensitive_words` VALUES (2301, '燃烧弹的制作方 ', 1, 'Ran Shao Dan De Zhi Zuo Fang');
INSERT INTO `sensitive_words` VALUES (2302, '黑火药的配方', 1, 'Hei Huo Yao De Pei Fang');
INSERT INTO `sensitive_words` VALUES (2303, '黑火药的制作', 1, 'Hei Huo Yao De Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2304, '黑火药比例', 1, 'Hei Huo Yao Bi Li');
INSERT INTO `sensitive_words` VALUES (2305, '燃烧弹 制作', 1, 'Ran Shao Dan   Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2306, '黑火药配方比例', 1, 'Hei Huo Yao Pei Fang Bi Li');
INSERT INTO `sensitive_words` VALUES (2307, '黑火药的成分', 1, 'Hei Huo Yao De Cheng Fen');
INSERT INTO `sensitive_words` VALUES (2308, '原子弹配方', 1, 'Yuan Zi Dan Pei Fang');
INSERT INTO `sensitive_words` VALUES (2309, '原子弹DIY教程', 1, 'Yuan Zi Dan D I Y Jiao Cheng');
INSERT INTO `sensitive_words` VALUES (2310, 'C4炸药', 1, 'C 4 Zha Yao');
INSERT INTO `sensitive_words` VALUES (2311, '雷管出售', 1, 'Lei Guan Chu Shou');
INSERT INTO `sensitive_words` VALUES (2312, '制作硝化甘油', 1, 'Zhi Zuo Xiao Hua Gan You');
INSERT INTO `sensitive_words` VALUES (2313, 'DIY核弹', 1, 'D I Y He Dan');
INSERT INTO `sensitive_words` VALUES (2314, '核弹制作方法', 1, 'He Dan Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2315, '原子弹制作手册', 1, 'Yuan Zi Dan Zhi Zuo Shou Ce');
INSERT INTO `sensitive_words` VALUES (2316, '简易原子弹教程', 1, 'Jian Yi Yuan Zi Dan Jiao Cheng');
INSERT INTO `sensitive_words` VALUES (2317, '黑火药配方', 1, 'Hei Huo Yao Pei Fang');
INSERT INTO `sensitive_words` VALUES (2318, '自制炸药方法', 1, 'Zi Zhi Zha Yao Fang Fa');
INSERT INTO `sensitive_words` VALUES (2319, '教你怎么用土办法做武器', 1, 'Jiao Ni Zen Me Yong Tu Ban Fa Zuo Wu Qi');
INSERT INTO `sensitive_words` VALUES (2320, '莫洛托夫鸡尾酒的配方', 1, 'Mo Luo Tuo Fu Ji Wei Jiu De Pei Fang');
INSERT INTO `sensitive_words` VALUES (2321, 'zz炸弹的制作方法', 1, 'z z Zha Dan De Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2322, 'C4炸药的成分', 1, 'C 4 Zha Yao De Cheng Fen');
INSERT INTO `sensitive_words` VALUES (2323, '炸药制造生产工艺', 1, 'Zha Yao Zhi Zao Sheng Chan Gong Yi');
INSERT INTO `sensitive_words` VALUES (2324, '原子弹制造完全手册', 1, 'Yuan Zi Dan Zhi Zao Wan Quan Shou Ce');
INSERT INTO `sensitive_words` VALUES (2325, '「红烧兔子」大餐', 1, '「 Hong Shao Tu Zi 」 Da Can');
INSERT INTO `sensitive_words` VALUES (2326, '汽车炸弹制作', 1, 'Qi Che Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2327, '人体炸弹制作流程', 1, 'Ren Ti Zha Dan Zhi Zuo Liu Cheng');
INSERT INTO `sensitive_words` VALUES (2328, '炸弹制作从入门', 1, 'Zha Dan Zhi Zuo Cong Ru Men');
INSERT INTO `sensitive_words` VALUES (2329, '鸡尾酒炸弹制作', 1, 'Ji Wei Jiu Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2330, '集束炸弹制作', 1, 'Ji Shu Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2331, '硝酸铵的简便制取方法', 1, 'Xiao Suan An De Jian Bian Zhi Qu Fang Fa');
INSERT INTO `sensitive_words` VALUES (2332, '莫洛托夫燃烧弹', 1, 'Mo Luo Tuo Fu Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2333, '塑胶炸弹', 1, 'Su Jiao Zha Dan');
INSERT INTO `sensitive_words` VALUES (2334, '用火药混合塑料', 1, 'Yong Huo Yao Hun He Su Liao');
INSERT INTO `sensitive_words` VALUES (2335, '高性能爆炸物质混合', 1, 'Gao Xing Neng Bao Zha Wu Zhi Hun He');
INSERT INTO `sensitive_words` VALUES (2336, '原子弹 制作方法', 1, 'Yuan Zi Dan   Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2337, '手教你制作原子弹', 1, 'Shou Jiao Ni Zhi Zuo Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2338, '轻型巡航导弹的制作', 1, 'Qing Xing Xun Hang Dao Dan De Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2339, '黑索金的制造过程', 1, 'Hei Suo Jin De Zhi Zao Guo Cheng');
INSERT INTO `sensitive_words` VALUES (2340, 'Zha药制造进程', 1, 'Z h a Yao Zhi Zao Jin Cheng');
INSERT INTO `sensitive_words` VALUES (2341, '购买自爆材料', 1, 'Gou Mai Zi Bao Cai Liao');
INSERT INTO `sensitive_words` VALUES (2342, '可塑炸弹制作方法', 1, 'Ke Su Zha Dan Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2343, 'C4塑胶炸药', 1, 'C 4 Su Jiao Zha Yao');
INSERT INTO `sensitive_words` VALUES (2344, '水浴法制TNT', 1, 'Shui Yu Fa Zhi T N T');
INSERT INTO `sensitive_words` VALUES (2345, '简易核弹头的制造', 1, 'Jian Yi He Dan Tou De Zhi Zao');
INSERT INTO `sensitive_words` VALUES (2346, '高爆炸药的基本配方', 1, 'Gao Bao Zha Yao De Ji Ben Pei Fang');
INSERT INTO `sensitive_words` VALUES (2347, '如何制硝化甘油', 1, 'Ru He Zhi Xiao Hua Gan You');
INSERT INTO `sensitive_words` VALUES (2348, '燃烧剂的简易制备', 1, 'Ran Shao Ji De Jian Yi Zhi Bei');
INSERT INTO `sensitive_words` VALUES (2349, '简易大威力炸弹', 1, 'Jian Yi Da Wei Li Zha Dan');
INSERT INTO `sensitive_words` VALUES (2350, '炸弹制作入门', 1, 'Zha Dan Zhi Zuo Ru Men');
INSERT INTO `sensitive_words` VALUES (2351, '硝酸甘油炸药制作', 1, 'Xiao Suan Gan You Zha Yao Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2352, '基本配方是硝酸甘', 1, 'Ji Ben Pei Fang Shi Xiao Suan Gan');
INSERT INTO `sensitive_words` VALUES (2353, '燃烧剂的简易制作', 1, 'Ran Shao Ji De Jian Yi Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2354, '制作性能优良的燃烧弹', 1, 'Zhi Zuo Xing Neng You Liang De Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2355, '酸甘油炸药', 1, 'Suan Gan You Zha Yao');
INSERT INTO `sensitive_words` VALUES (2356, '简易导弹制作', 1, 'Jian Yi Dao Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2357, '核弹头的制造', 1, 'He Dan Tou De Zhi Zao');
INSERT INTO `sensitive_words` VALUES (2358, '可塑炸弹制作', 1, 'Ke Su Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2359, '炸药硝酸甘油制法', 1, 'Zha Yao Xiao Suan Gan You Zhi Fa');
INSERT INTO `sensitive_words` VALUES (2360, '原子弹制作方法', 1, 'Yuan Zi Dan Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2361, '火药的配方', 1, 'Huo Yao De Pei Fang');
INSERT INTO `sensitive_words` VALUES (2362, '手教你做原子弹', 1, 'Shou Jiao Ni Zuo Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2363, '怎么用土办法做武器', 1, 'Zen Me Yong Tu Ban Fa Zuo Wu Qi');
INSERT INTO `sensitive_words` VALUES (2364, '手把手教你制作原子弹', 1, 'Shou Ba Shou Jiao Ni Zhi Zuo Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2365, '燃烧弹的制作方法', 1, 'Ran Shao Dan De Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2366, '怎么自制燃烧弹', 1, 'Zen Me Zi Zhi Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2367, 'TNT炸弹制作', 1, 'T N T Zha Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2368, '高爆炸药基本配方', 1, 'Gao Bao Zha Yao Ji Ben Pei Fang');
INSERT INTO `sensitive_words` VALUES (2369, '爆破和杀伤燃烧弹', 1, 'Bao Po He Sha Shang Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2370, '炸弹制作从入门到精', 1, 'Zha Dan Zhi Zuo Cong Ru Men Dao Jing');
INSERT INTO `sensitive_words` VALUES (2371, '写的炸弹制作教程', 1, 'Xie De Zha Dan Zhi Zuo Jiao Cheng');
INSERT INTO `sensitive_words` VALUES (2372, '原子弹制作 方法', 1, 'Yuan Zi Dan Zhi Zuo   Fang Fa');
INSERT INTO `sensitive_words` VALUES (2373, '教你制作原子弹', 1, 'Jiao Ni Zhi Zuo Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2374, '下硝化甘油的制作方法', 1, 'Xia Xiao Hua Gan You De Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2375, 'DIY原子弹', 1, 'D I Y Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2376, '原子弹制作', 1, 'Yuan Zi Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2377, '炸药及其制造方法', 1, 'Zha Yao Ji Qi Zhi Zao Fang Fa');
INSERT INTO `sensitive_words` VALUES (2378, 'ATOM弹制造', 1, 'A T O M Dan Zhi Zao');
INSERT INTO `sensitive_words` VALUES (2379, '三分钟教你原子弹', 1, 'San Fen Zhong Jiao Ni Yuan Zi Dan');
INSERT INTO `sensitive_words` VALUES (2380, '火药原理', 1, 'Huo Yao Yuan Li');
INSERT INTO `sensitive_words` VALUES (2381, '简易炸弹', 1, 'Jian Yi Zha Dan');
INSERT INTO `sensitive_words` VALUES (2382, '简易燃烧弹', 1, 'Jian Yi Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2383, '土炸药成份', 1, 'Tu Zha Yao Cheng Fen');
INSERT INTO `sensitive_words` VALUES (2384, '你怎么用土办法做武器', 1, 'Ni Zen Me Yong Tu Ban Fa Zuo Wu Qi');
INSERT INTO `sensitive_words` VALUES (2385, '燃烧弹制作', 1, 'Ran Shao Dan Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2386, '燃烧瓶的制作方法', 1, 'Ran Shao Ping De Zhi Zuo Fang Fa');
INSERT INTO `sensitive_words` VALUES (2387, '炸弹制作手册 硫酸', 1, 'Zha Dan Zhi Zuo Shou Ce   Liu Suan');
INSERT INTO `sensitive_words` VALUES (2388, '原子弹制作方法DIY', 1, 'Yuan Zi Dan Zhi Zuo Fang Fa D I Y');
INSERT INTO `sensitive_words` VALUES (2389, '汽油三分之一白糖混合', 1, 'Qi You San Fen Zhi Yi Bai Tang Hun He');
INSERT INTO `sensitive_words` VALUES (2390, '炸药的制作配方', 1, 'Zha Yao De Zhi Zuo Pei Fang');
INSERT INTO `sensitive_words` VALUES (2391, '炸药的配方', 1, 'Zha Yao De Pei Fang');
INSERT INTO `sensitive_words` VALUES (2392, '如何自制燃烧弹', 1, 'Ru He Zi Zhi Ran Shao Dan');
INSERT INTO `sensitive_words` VALUES (2393, '标准炸弹教程', 1, 'Biao Zhun Zha Dan Jiao Cheng');
INSERT INTO `sensitive_words` VALUES (2394, '黑火药和硝酸钾农药混合', 1, 'Hei Huo Yao He Xiao Suan Jia Nong Yao Hun He');
INSERT INTO `sensitive_words` VALUES (2395, '恐怖分子自己制造炸弹', 1, 'Kong Bu Fen Zi Zi Ji Zhi Zao Zha Dan');
INSERT INTO `sensitive_words` VALUES (2396, '手柄制作炸弹引爆器', 1, 'Shou Bing Zhi Zuo Zha Dan Yin Bao Qi');
INSERT INTO `sensitive_words` VALUES (2397, '制作炸弹首先要', 1, 'Zhi Zuo Zha Dan Shou Xian Yao');
INSERT INTO `sensitive_words` VALUES (2398, '燃烧瓶制作', 1, 'Ran Shao Ping Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2399, '出售炸药QQ', 1, 'Chu Shou Zha Yao Q Q');
INSERT INTO `sensitive_words` VALUES (2400, '出售气枪', 1, 'Chu Shou Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2401, '出售气枪 QQ', 1, 'Chu Shou Qi Qiang   Q Q');
INSERT INTO `sensitive_words` VALUES (2402, '出售气枪 电话', 1, 'Chu Shou Qi Qiang   Dian Hua');
INSERT INTO `sensitive_words` VALUES (2403, '出售手枪 QQ', 1, 'Chu Shou Shou Qiang   Q Q');
INSERT INTO `sensitive_words` VALUES (2404, '出售手枪 电话', 1, 'Chu Shou Shou Qiang   Dian Hua');
INSERT INTO `sensitive_words` VALUES (2405, '出售猎枪', 1, 'Chu Shou Lie Qiang');
INSERT INTO `sensitive_words` VALUES (2406, '出售猎枪 QQ', 1, 'Chu Shou Lie Qiang   Q Q');
INSERT INTO `sensitive_words` VALUES (2407, '出售猎枪 电话', 1, 'Chu Shou Lie Qiang   Dian Hua');
INSERT INTO `sensitive_words` VALUES (2408, '出售汽枪', 1, 'Chu Shou Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2409, '出售步枪', 1, 'Chu Shou Bu Qiang');
INSERT INTO `sensitive_words` VALUES (2410, '出售狙击枪', 1, 'Chu Shou Ju Ji Qiang');
INSERT INTO `sensitive_words` VALUES (2411, '出售手狗', 1, 'Chu Shou Shou Gou');
INSERT INTO `sensitive_words` VALUES (2412, '出售气狗', 1, 'Chu Shou Qi Gou');
INSERT INTO `sensitive_words` VALUES (2413, '出售猎狗', 1, 'Chu Shou Lie Gou');
INSERT INTO `sensitive_words` VALUES (2414, '【手枪出售】联系电话', 1, '【 Shou Qiang Chu Shou 】 Lian Xi Dian Hua');
INSERT INTO `sensitive_words` VALUES (2415, '64式手枪出售', 1, '6 4 Shi Shou Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2416, '92式手枪出售', 1, '9 2 Shi Shou Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2417, '出售:高仿真枪', 1, 'Chu Shou : Gao Fang Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (2418, '出售54式手枪', 1, 'Chu Shou 5 4 Shi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2419, '出售M1911', 1, 'Chu Shou M 1 9 1 1');
INSERT INTO `sensitive_words` VALUES (2420, '出售各类猎狗', 1, 'Chu Shou Ge Lei Lie Gou');
INSERT INTO `sensitive_words` VALUES (2421, '出售国产军用54手枪', 1, 'Chu Shou Guo Chan Jun Yong 5 4 Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2422, '出售火枪 –游戏', 1, 'Chu Shou Huo Qiang   – You Xi');
INSERT INTO `sensitive_words` VALUES (2423, '出售进口金属枪模', 1, 'Chu Shou Jin Kou Jin Shu Qiang Mo');
INSERT INTO `sensitive_words` VALUES (2424, '出售仿真枪', 1, 'Chu Shou Fang Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (2425, '出售麻醉枪免收任何定金', 1, 'Chu Shou Ma Zui Qiang Mian Shou Ren He Ding Jin');
INSERT INTO `sensitive_words` VALUES (2426, '出售手枪=货到付款', 1, 'Chu Shou Shou Qiang = Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2427, '出售外国枪模', 1, 'Chu Shou Wai Guo Qiang Mo');
INSERT INTO `sensitive_words` VALUES (2428, '出售袖珍手枪', 1, 'Chu Shou Xiu Zhen Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2429, '娥眉气枪出售', 1, 'E Mei Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2430, '防身手枪QQ', 1, 'Fang Shen Shou Qiang Q Q');
INSERT INTO `sensitive_words` VALUES (2431, '防身武器手枪', 1, 'Fang Shen Wu Qi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2432, '仿真枪QQ', 1, 'Fang Zhen Qiang Q Q');
INSERT INTO `sensitive_words` VALUES (2433, '钢珠枪小口径步枪', 1, 'Gang Zhu Qiang Xiao Kou Jing Bu Qiang');
INSERT INTO `sensitive_words` VALUES (2434, '高压狗QQ', 1, 'Gao Ya Gou Q Q');
INSERT INTO `sensitive_words` VALUES (2435, '高压气枪,气枪子弹', 1, 'Gao Ya Qi Qiang , Qi Qiang Zi Dan');
INSERT INTO `sensitive_words` VALUES (2436, '高压气枪|电狗专卖', 1, 'Gao Ya Qi Qiang | Dian Gou Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2437, '高压气枪|气枪货到付款', 1, 'Gao Ya Qi Qiang | Qi Qiang Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2438, '高压气枪专卖店', 1, 'Gao Ya Qi Qiang Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2439, '各类军用枪', 1, 'Ge Lei Jun Yong Qiang');
INSERT INTO `sensitive_words` VALUES (2440, '各类军用枪支', 1, 'Ge Lei Jun Yong Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (2441, '各式气枪出售', 1, 'Ge Shi Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2442, '工字牌气枪出售专卖', 1, 'Gong Zi Pai Qi Qiang Chu Shou Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2443, '工字汽狗麻醉枪', 1, 'Gong Zi Qi Gou Ma Zui Qiang');
INSERT INTO `sensitive_words` VALUES (2444, '供应军用手枪', 1, 'Gong Ying Jun Yong Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2445, '供应汽枪', 1, 'Gong Ying Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2446, '购买枪支QQ', 1, 'Gou Mai Qiang Zhi Q Q');
INSERT INTO `sensitive_words` VALUES (2447, '国产汽狗专卖|气枪货', 1, 'Guo Chan Qi Gou Zhuan Mai | Qi Qiang Huo');
INSERT INTO `sensitive_words` VALUES (2448, '集团出售手枪', 1, 'Ji Tuan Chu Shou Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2449, '集团出售手枪气枪', 1, 'Ji Tuan Chu Shou Shou Qiang Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2450, '进口气枪,气枪子弹', 1, 'Jin Kou Qi Qiang , Qi Qiang Zi Dan');
INSERT INTO `sensitive_words` VALUES (2451, '军用54出售', 1, 'Jun Yong 5 4 Chu Shou');
INSERT INTO `sensitive_words` VALUES (2452, '军用77出售', 1, 'Jun Yong 7 7 Chu Shou');
INSERT INTO `sensitive_words` VALUES (2453, '军用手枪钢珠枪', 1, 'Jun Yong Shou Qiang Gang Zhu Qiang');
INSERT INTO `sensitive_words` VALUES (2454, '里有汽枪出售', 1, 'Li You Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2455, '猎枪出售/枪', 1, 'Lie Qiang Chu Shou / Qiang');
INSERT INTO `sensitive_words` VALUES (2456, '猎枪仿真枪QQ', 1, 'Lie Qiang Fang Zhen Qiang Q Q');
INSERT INTO `sensitive_words` VALUES (2457, '猎枪麻醉枪钢珠枪', 1, 'Lie Qiang Ma Zui Qiang Gang Zhu Qiang');
INSERT INTO `sensitive_words` VALUES (2458, '猎枪哪里有卖', 1, 'Lie Qiang Na Li You Mai');
INSERT INTO `sensitive_words` VALUES (2459, '猎枪手枪买卖', 1, 'Lie Qiang Shou Qiang Mai Mai');
INSERT INTO `sensitive_words` VALUES (2460, '猎枪销售手枪销售气枪', 1, 'Lie Qiang Xiao Shou Shou Qiang Xiao Shou Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2461, '猎枪专卖店', 1, 'Lie Qiang Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2462, '猎枪子弹底火专卖', 1, 'Lie Qiang Zi Dan Di Huo Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2463, '麻醉枪出售可验货', 1, 'Ma Zui Qiang Chu Shou Ke Yan Huo');
INSERT INTO `sensitive_words` VALUES (2464, '麻醉枪猎枪军用', 1, 'Ma Zui Qiang Lie Qiang Jun Yong');
INSERT INTO `sensitive_words` VALUES (2465, '买卖54狗', 1, 'Mai Mai 5 4 Gou');
INSERT INTO `sensitive_words` VALUES (2466, '买卖64狗', 1, 'Mai Mai 6 4 Gou');
INSERT INTO `sensitive_words` VALUES (2467, '买卖警察枪支', 1, 'Mai Mai Jing Cha Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (2468, '买卖军狗', 1, 'Mai Mai Jun Gou');
INSERT INTO `sensitive_words` VALUES (2469, '买卖军用枪支', 1, 'Mai Mai Jun Yong Qiang Zhi');
INSERT INTO `sensitive_words` VALUES (2470, '卖64手枪', 1, 'Mai 6 4 Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2471, '卖92手枪', 1, 'Mai 9 2 Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2472, '卖钢珠枪QQ', 1, 'Mai Gang Zhu Qiang Q Q');
INSERT INTO `sensitive_words` VALUES (2473, '哪里能买到自制手枪  ', 1, 'Na Li Neng Mai Dao Zi Zhi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2474, '哪里有钢珠枪', 1, 'Na Li You Gang Zhu Qiang');
INSERT INTO `sensitive_words` VALUES (2475, '哪里有连发猎枪买卖', 1, 'Na Li You Lian Fa Lie Qiang Mai Mai');
INSERT INTO `sensitive_words` VALUES (2476, '哪里有卖双管猎', 1, 'Na Li You Mai Shuang Guan Lie');
INSERT INTO `sensitive_words` VALUES (2477, '哪里有气枪卖', 1, 'Na Li You Qi Qiang Mai');
INSERT INTO `sensitive_words` VALUES (2478, '哪里有枪出售', 1, 'Na Li You Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2479, '哪里有真枪出售', 1, 'Na Li You Zhen Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2480, '哪里有真枪卖买', 1, 'Na Li You Zhen Qiang Mai Mai');
INSERT INTO `sensitive_words` VALUES (2481, '哪能买到真枪', 1, 'Na Neng Mai Dao Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (2482, '期出售手枪气枪猎', 1, 'Qi Chu Shou Shou Qiang Qi Qiang Lie');
INSERT INTO `sensitive_words` VALUES (2483, '气狗 高压气枪', 1, 'Qi Gou   Gao Ya Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2484, '气狗出售 进口气狗', 1, 'Qi Gou Chu Shou   Jin Kou Qi Gou');
INSERT INTO `sensitive_words` VALUES (2485, '气枪专卖网', 1, 'Qi Qiang Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2486, '气枪/出售/专卖网', 1, 'Qi Qiang / Chu Shou / Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2487, '气枪/猎枪/钢珠枪', 1, 'Qi Qiang / Lie Qiang / Gang Zhu Qiang');
INSERT INTO `sensitive_words` VALUES (2488, '气枪仿真枪出售', 1, 'Qi Qiang Fang Zhen Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2489, '气枪购买|气枪组装', 1, 'Qi Qiang Gou Mai | Qi Qiang Zu Zhuang');
INSERT INTO `sensitive_words` VALUES (2490, '气枪货到付款,汽狗出售', 1, 'Qi Qiang Huo Dao Fu Kuan , Qi Gou Chu Shou');
INSERT INTO `sensitive_words` VALUES (2491, '气枪价格 仿真气枪', 1, 'Qi Qiang Jia Ge   Fang Zhen Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2492, '气枪价格，气枪专卖店', 1, 'Qi Qiang Jia Ge ， Qi Qiang Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2493, '气枪看货加QQ', 1, 'Qi Qiang Kan Huo Jia Q Q');
INSERT INTO `sensitive_words` VALUES (2494, '气枪联系QQ', 1, 'Qi Qiang Lian Xi Q Q');
INSERT INTO `sensitive_words` VALUES (2495, '气枪猎枪麻醉枪', 1, 'Qi Qiang Lie Qiang Ma Zui Qiang');
INSERT INTO `sensitive_words` VALUES (2496, '气枪迷魂药', 1, 'Qi Qiang Mi Hun Yao');
INSERT INTO `sensitive_words` VALUES (2497, '汽狗高压汽枪', 1, 'Qi Gou Gao Ya Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2498, '铅弹 上海工字气枪', 1, 'Qian Dan   Shang Hai Gong Zi Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2499, '全金属仿真枪专卖', 1, 'Quan Jin Shu Fang Zhen Qiang Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2500, '热武器QQ', 1, 'Re Wu Qi Q Q');
INSERT INTO `sensitive_words` VALUES (2501, '三箭气枪出售', 1, 'San Jian Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2502, '手枪气* 枪猎', 1, 'Shou Qiang Qi *   Qiang Lie');
INSERT INTO `sensitive_words` VALUES (2503, '手槍买卖自制手枪', 1, 'Shou Qiang Mai Mai Zi Zhi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2504, '售枪购买手枪', 1, 'Shou Qiang Gou Mai Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2505, '售手枪QQ', 1, 'Shou Shou Qiang Q Q');
INSERT INTO `sensitive_words` VALUES (2506, '司马仿真枪模型QQ', 1, 'Si Ma Fang Zhen Qiang Mo Xing Q Q');
INSERT INTO `sensitive_words` VALUES (2507, '淘宝气枪货到付款', 1, 'Tao Bao Qi Qiang Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2508, '提供气狗专卖店', 1, 'Ti Gong Qi Gou Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2509, '提供专业及时的气狗', 1, 'Ti Gong Zhuan Ye Ji Shi De Qi Gou');
INSERT INTO `sensitive_words` VALUES (2510, '秃鹰气枪货到付款', 1, 'Tu Ying Qi Qiang Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2511, '锡峰气枪出售', 1, 'Xi Feng Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2512, '仙鹤气枪出售', 1, 'Xian He Qi Qiang Chu Shou');
INSERT INTO `sensitive_words` VALUES (2513, '销售/专卖/买卖77式手枪', 1, 'Xiao Shou / Zhuan Mai / Mai Mai 7 7 Shi Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2514, '销售电手狗', 1, 'Xiao Shou Dian Shou Gou');
INSERT INTO `sensitive_words` VALUES (2515, '销售气手狗', 1, 'Xiao Shou Qi Shou Gou');
INSERT INTO `sensitive_words` VALUES (2516, '销售小口径步枪', 1, 'Xiao Shou Xiao Kou Jing Bu Qiang');
INSERT INTO `sensitive_words` VALUES (2517, '销售运动步枪', 1, 'Xiao Shou Yun Dong Bu Qiang');
INSERT INTO `sensitive_words` VALUES (2518, '小口径秃鹰沙漠', 1, 'Xiao Kou Jing Tu Ying Sha Mo');
INSERT INTO `sensitive_words` VALUES (2519, '有军用枪支出售', 1, 'You Jun Yong Qiang Zhi Chu Shou');
INSERT INTO `sensitive_words` VALUES (2520, '长期出 售手枪', 1, 'Zhang Qi Chu   Shou Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2521, '折叠狗QQ', 1, 'Zhe Die Gou Q Q');
INSERT INTO `sensitive_words` VALUES (2522, '转让 猎枪', 1, 'Zhuan Rang   Lie Qiang');
INSERT INTO `sensitive_words` VALUES (2523, '子弹货到付款', 1, 'Zi Dan Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2524, '自制手枪哪里买  ', 1, 'Zi Zhi Shou Qiang Na Li Mai');
INSERT INTO `sensitive_words` VALUES (2525, '自制手枪哪里有卖', 1, 'Zi Zhi Shou Qiang Na Li You Mai');
INSERT INTO `sensitive_words` VALUES (2526, '阻击枪/汽枪/高压气枪', 1, 'Zu Ji Qiang / Qi Qiang / Gao Ya Qi Qiang');
INSERT INTO `sensitive_words` VALUES (2527, '组装手枪  ', 1, 'Zu Zhuang Shou Qiang');
INSERT INTO `sensitive_words` VALUES (2528, '最新销售汽狗', 1, 'Zui Xin Xiao Shou Qi Gou');
INSERT INTO `sensitive_words` VALUES (2529, '出售警用手铐|仿真枪', 1, 'Chu Shou Jing Yong Shou Kao | Fang Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (2530, '猎枪|真枪', 1, 'Lie Qiang | Zhen Qiang');
INSERT INTO `sensitive_words` VALUES (2531, '手枪|阻击枪', 1, 'Shou Qiang | Zu Ji Qiang');
INSERT INTO `sensitive_words` VALUES (2532, '弓弩专营', 1, 'Gong Nu Zhuan Ying');
INSERT INTO `sensitive_words` VALUES (2533, '弓弩专卖网货到付款', 1, 'Gong Nu Zhuan Mai Wang Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2534, '弓弩专卖网', 1, 'Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2535, '弓弩专卖货到付款', 1, 'Gong Nu Zhuan Mai Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2536, '弓弩专卖店网', 1, 'Gong Nu Zhuan Mai Dian Wang');
INSERT INTO `sensitive_words` VALUES (2537, '弓弩专卖店', 1, 'Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2538, '弓弩专卖', 1, 'Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2539, '弓弩制作', 1, 'Gong Nu Zhi Zuo');
INSERT INTO `sensitive_words` VALUES (2540, '弓弩直销', 1, 'Gong Nu Zhi Xiao');
INSERT INTO `sensitive_words` VALUES (2541, '弓弩有限公司', 1, 'Gong Nu You Xian Gong Si');
INSERT INTO `sensitive_words` VALUES (2542, '弓弩营销中心', 1, 'Gong Nu Ying Xiao Zhong Xin');
INSERT INTO `sensitive_words` VALUES (2543, '弓弩一百专卖店', 1, 'Gong Nu Yi Bai Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2544, '弓弩销售', 1, 'Gong Nu Xiao Shou');
INSERT INTO `sensitive_words` VALUES (2545, '弓弩网 ', 1, 'Gong Nu Wang');
INSERT INTO `sensitive_words` VALUES (2546, '弓弩图纸', 1, 'Gong Nu Tu Zhi');
INSERT INTO `sensitive_words` VALUES (2547, '弓弩特许经销', 1, 'Gong Nu Te Xu Jing Xiao');
INSERT INTO `sensitive_words` VALUES (2548, '弓弩狩猎网', 1, 'Gong Nu Shou Lie Wang');
INSERT INTO `sensitive_words` VALUES (2549, '自制手弩', 1, 'Zi Zhi Shou Nu');
INSERT INTO `sensitive_words` VALUES (2550, '追风弓弩麻醉箭专卖', 1, 'Zhui Feng Gong Nu Ma Zui Jian Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2551, '专业弓弩网', 1, 'Zhuan Ye Gong Nu Wang');
INSERT INTO `sensitive_words` VALUES (2552, '中国战神军用弓弩', 1, 'Zhong Guo Zhan Shen Jun Yong Gong Nu');
INSERT INTO `sensitive_words` VALUES (2553, '中国弩弓专卖', 1, 'Zhong Guo Nu Gong Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2554, '中国弓弩专卖网', 1, 'Zhong Guo Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2555, '中国弓弩直销', 1, 'Zhong Guo Gong Nu Zhi Xiao');
INSERT INTO `sensitive_words` VALUES (2556, '中国弓弩网', 1, 'Zhong Guo Gong Nu Wang');
INSERT INTO `sensitive_words` VALUES (2557, '中国弓弩狩猎网', 1, 'Zhong Guo Gong Nu Shou Lie Wang');
INSERT INTO `sensitive_words` VALUES (2558, '中国弓驽网', 1, 'Zhong Guo Gong Nu Wang');
INSERT INTO `sensitive_words` VALUES (2559, '制作简易弓弩 ', 1, 'Zhi Zuo Jian Yi Gong Nu');
INSERT INTO `sensitive_words` VALUES (2560, '郑州弓弩专卖', 1, 'Zheng Zhou Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2561, '赵氏弓弩专卖网', 1, 'Zhao Shi Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2562, '赵氏弓弩专卖店', 1, 'Zhao Shi Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2563, '赵氏弓弩专卖', 1, 'Zhao Shi Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2564, '赵氏弓弩销售', 1, 'Zhao Shi Gong Nu Xiao Shou');
INSERT INTO `sensitive_words` VALUES (2565, '小型弓弩专卖店', 1, 'Xiao Xing Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2566, '小猎人弓弩网', 1, 'Xiao Lie Ren Gong Nu Wang');
INSERT INTO `sensitive_words` VALUES (2567, '狩猎器材弓弩专卖', 1, 'Shou Lie Qi Cai Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2568, '狩猎器材弓弩', 1, 'Shou Lie Qi Cai Gong Nu');
INSERT INTO `sensitive_words` VALUES (2569, '狩猎弓弩专卖网', 1, 'Shou Lie Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2570, '狩猎弓弩专卖', 1, 'Shou Lie Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2571, '狩猎弓弩麻醉箭', 1, 'Shou Lie Gong Nu Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2572, '手枪式折叠三用弩', 1, 'Shou Qiang Shi Zhe Die San Yong Nu');
INSERT INTO `sensitive_words` VALUES (2573, '三利达弓弩专卖网', 1, 'San Li Da Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2574, '三利达弓弩直营', 1, 'San Li Da Gong Nu Zhi Ying');
INSERT INTO `sensitive_words` VALUES (2575, '三利达弓弩配件', 1, 'San Li Da Gong Nu Pei Jian');
INSERT INTO `sensitive_words` VALUES (2576, '三步倒药箭批发', 1, 'San Bu Dao Yao Jian Pi Fa');
INSERT INTO `sensitive_words` VALUES (2577, '三步倒弩箭专卖', 1, 'San Bu Dao Nu Jian Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2578, '三步倒麻醉弩箭销售', 1, 'San Bu Dao Ma Zui Nu Jian Xiao Shou');
INSERT INTO `sensitive_words` VALUES (2579, '三步倒麻醉箭专卖', 1, 'San Bu Dao Ma Zui Jian Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2580, '三步倒麻醉箭', 1, 'San Bu Dao Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2581, '三步倒捕狗药', 1, 'San Bu Dao Bu Gou Yao');
INSERT INTO `sensitive_words` VALUES (2582, '军用弓弩专卖网', 1, 'Jun Yong Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2583, '军用弓弩专卖店', 1, 'Jun Yong Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2584, '军用弓弩批发', 1, 'Jun Yong Gong Nu Pi Fa');
INSERT INTO `sensitive_words` VALUES (2585, '军用弓弩公司', 1, 'Jun Yong Gong Nu Gong Si');
INSERT INTO `sensitive_words` VALUES (2586, '供应三利达弓弩麻醉箭', 1, 'Gong Ying San Li Da Gong Nu Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2587, '供应三步倒麻醉箭', 1, 'Gong Ying San Bu Dao Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2588, '供应秦氏弓弩', 1, 'Gong Ying Qin Shi Gong Nu');
INSERT INTO `sensitive_words` VALUES (2589, '供应弩用麻醉箭', 1, 'Gong Ying Nu Yong Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2590, '供应弩捕狗箭', 1, 'Gong Ying Nu Bu Gou Jian');
INSERT INTO `sensitive_words` VALUES (2591, '供应麻醉箭三步倒', 1, 'Gong Ying Ma Zui Jian San Bu Dao');
INSERT INTO `sensitive_words` VALUES (2592, '供应麻醉箭批发', 1, 'Gong Ying Ma Zui Jian Pi Fa');
INSERT INTO `sensitive_words` VALUES (2593, '供应麻醉箭', 1, 'Gong Ying Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2594, '供应军用弩折叠弩', 1, 'Gong Ying Jun Yong Nu Zhe Die Nu');
INSERT INTO `sensitive_words` VALUES (2595, '供应军用弓弩专卖', 1, 'Gong Ying Jun Yong Gong Nu Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2596, '供应精品弓弩', 1, 'Gong Ying Jing Pin Gong Nu');
INSERT INTO `sensitive_words` VALUES (2597, '供应弓弩麻醉箭', 1, 'Gong Ying Gong Nu Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2598, '供应弓弩', 1, 'Gong Ying Gong Nu');
INSERT INTO `sensitive_words` VALUES (2599, '供应钢珠弓弩', 1, 'Gong Ying Gang Zhu Gong Nu');
INSERT INTO `sensitive_words` VALUES (2600, '弓弩商城专卖', 1, 'Gong Nu Shang Cheng Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2601, '弓弩商城', 1, 'Gong Nu Shang Cheng');
INSERT INTO `sensitive_words` VALUES (2602, '弓弩亲兄弟货到付款', 1, 'Gong Nu Qin Xiong Di Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2603, '弓弩批发', 1, 'Gong Nu Pi Fa');
INSERT INTO `sensitive_words` VALUES (2604, '弓弩免定金货到付款', 1, 'Gong Nu Mian Ding Jin Huo Dao Fu Kuan');
INSERT INTO `sensitive_words` VALUES (2605, '弓弩麻醉箭', 1, 'Gong Nu Ma Zui Jian');
INSERT INTO `sensitive_words` VALUES (2606, '弓弩麻醉镖', 1, 'Gong Nu Ma Zui Biao');
INSERT INTO `sensitive_words` VALUES (2607, '弓弩论坛 ', 1, 'Gong Nu Lun Tan');
INSERT INTO `sensitive_words` VALUES (2608, '钢珠弓弩专卖网', 1, 'Gang Zhu Gong Nu Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2609, '钢珠弓弩专卖店', 1, 'Gang Zhu Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2610, '打狗弓弩三步倒', 1, 'Da Gou Gong Nu San Bu Dao');
INSERT INTO `sensitive_words` VALUES (2611, '麻醉弓弩专卖店', 1, 'Ma Zui Gong Nu Zhuan Mai Dian');
INSERT INTO `sensitive_words` VALUES (2612, '出售军刀', 1, 'Chu Shou Jun Dao');
INSERT INTO `sensitive_words` VALUES (2613, '出售军刺', 1, 'Chu Shou Jun Ci');
INSERT INTO `sensitive_words` VALUES (2614, '出售弹簧刀', 1, 'Chu Shou Dan Huang Dao');
INSERT INTO `sensitive_words` VALUES (2615, '出售三棱刀', 1, 'Chu Shou San Leng Dao');
INSERT INTO `sensitive_words` VALUES (2616, '出售跳刀', 1, 'Chu Shou Tiao Dao');
INSERT INTO `sensitive_words` VALUES (2617, '军刀网', 1, 'Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2618, '南方军刀网', 1, 'Nan Fang Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2619, '户外军刀网', 1, 'Hu Wai Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2620, '三棱军刺专卖', 1, 'San Leng Jun Ci Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2621, '出售开山刀军刺', 1, 'Chu Shou Kai Shan Dao Jun Ci');
INSERT INTO `sensitive_words` VALUES (2622, '西点军刀网', 1, 'Xi Dian Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2623, '军刀专 卖', 1, 'Jun Dao Zhuan   Mai');
INSERT INTO `sensitive_words` VALUES (2624, '戈博军刀', 1, 'Ge Bo Jun Dao');
INSERT INTO `sensitive_words` VALUES (2625, '阿兰德龙户外', 1, 'A Lan De Long Hu Wai');
INSERT INTO `sensitive_words` VALUES (2626, '出售军品军刀', 1, 'Chu Shou Jun Pin Jun Dao');
INSERT INTO `sensitive_words` VALUES (2627, '勃朗宁军刀', 1, 'Bo Lang Ning Jun Dao');
INSERT INTO `sensitive_words` VALUES (2628, '军刀军品网', 1, 'Jun Dao Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2629, '阿兰得龙野营刀具网', 1, 'A Lan De Long Ye Ying Dao Ju Wang');
INSERT INTO `sensitive_words` VALUES (2630, '出售军刺军刀', 1, 'Chu Shou Jun Ci Jun Dao');
INSERT INTO `sensitive_words` VALUES (2631, '警用刀具出售', 1, 'Jing Yong Dao Ju Chu Shou');
INSERT INTO `sensitive_words` VALUES (2632, '折刀专卖网', 1, 'Zhe Dao Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2633, '阳江军品军刀网', 1, 'Yang Jiang Jun Pin Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2634, '野营刀专卖', 1, 'Ye Ying Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2635, '砍刀精品折刀专卖', 1, 'Kan Dao Jing Pin Zhe Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2636, '匕首蝴蝶甩刀专卖', 1, 'Bi Shou Hu Die Shuai Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2637, '军刀专卖军刺', 1, 'Jun Dao Zhuan Mai Jun Ci');
INSERT INTO `sensitive_words` VALUES (2638, '军刀专卖刀具批发', 1, 'Jun Dao Zhuan Mai Dao Ju Pi Fa');
INSERT INTO `sensitive_words` VALUES (2639, '军刀图片砍刀', 1, 'Jun Dao Tu Pian Kan Dao');
INSERT INTO `sensitive_words` VALUES (2640, '军刀网军刀专卖', 1, 'Jun Dao Wang Jun Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2641, '军刀价格军用刀具', 1, 'Jun Dao Jia Ge Jun Yong Dao Ju');
INSERT INTO `sensitive_words` VALUES (2642, '军品军刺网', 1, 'Jun Pin Jun Ci Wang');
INSERT INTO `sensitive_words` VALUES (2643, '军刀军刺甩棍', 1, 'Jun Dao Jun Ci Shuai Gun');
INSERT INTO `sensitive_words` VALUES (2644, '阳江刀具批发网', 1, 'Yang Jiang Dao Ju Pi Fa Wang');
INSERT INTO `sensitive_words` VALUES (2645, '北方先锋军刀', 1, 'Bei Fang Xian Feng Jun Dao');
INSERT INTO `sensitive_words` VALUES (2646, '正品军刺出售', 1, 'Zheng Pin Jun Ci Chu Shou');
INSERT INTO `sensitive_words` VALUES (2647, '野营军刀出售', 1, 'Ye Ying Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2648, '开山刀砍刀出售', 1, 'Kai Shan Dao Kan Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2649, '仿品军刺出售', 1, 'Fang Pin Jun Ci Chu Shou');
INSERT INTO `sensitive_words` VALUES (2650, '军刀直刀专卖', 1, 'Jun Dao Zhi Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2651, '手工猎刀专卖', 1, 'Shou Gong Lie Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2652, '自动跳刀专卖', 1, 'Zi Dong Tiao Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2653, '军刀电棍销售', 1, 'Jun Dao Dian Gun Xiao Shou');
INSERT INTO `sensitive_words` VALUES (2654, '军刀甩棍销售', 1, 'Jun Dao Shuai Gun Xiao Shou');
INSERT INTO `sensitive_words` VALUES (2655, '美国军刀出售', 1, 'Mei Guo Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2656, '极端武力折刀', 1, 'Ji Duan Wu Li Zhe Dao');
INSERT INTO `sensitive_words` VALUES (2657, '防卫棍刀户外刀具', 1, 'Fang Wei Gun Dao Hu Wai Dao Ju');
INSERT INTO `sensitive_words` VALUES (2658, '阿兰德龙野营刀', 1, 'A Lan De Long Ye Ying Dao');
INSERT INTO `sensitive_words` VALUES (2659, '仿品军刺网', 1, 'Fang Pin Jun Ci Wang');
INSERT INTO `sensitive_words` VALUES (2660, '野营砍刀户外军刀', 1, 'Ye Ying Kan Dao Hu Wai Jun Dao');
INSERT INTO `sensitive_words` VALUES (2661, '手工猎刀户外刀具', 1, 'Shou Gong Lie Dao Hu Wai Dao Ju');
INSERT INTO `sensitive_words` VALUES (2662, '中国户外刀具网', 1, 'Zhong Guo Hu Wai Dao Ju Wang');
INSERT INTO `sensitive_words` VALUES (2663, '西点军品军刀网', 1, 'Xi Dian Jun Pin Jun Dao Wang');
INSERT INTO `sensitive_words` VALUES (2664, '野营开山刀军刺', 1, 'Ye Ying Kai Shan Dao Jun Ci');
INSERT INTO `sensitive_words` VALUES (2665, '三利达弓弩军刀', 1, 'San Li Da Gong Nu Jun Dao');
INSERT INTO `sensitive_words` VALUES (2666, '尼泊尔军刀出售', 1, 'Ni Bo Er Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2667, '防卫野营砍刀出售', 1, 'Fang Wei Ye Ying Kan Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2668, '防卫著名军刀出售', 1, 'Fang Wei Zhu Ming Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2669, '防卫棍刀出售', 1, 'Fang Wei Gun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2670, '防卫甩棍出售', 1, 'Fang Wei Shuai Gun Chu Shou');
INSERT INTO `sensitive_words` VALUES (2671, '防卫电棍出售', 1, 'Fang Wei Dian Gun Chu Shou');
INSERT INTO `sensitive_words` VALUES (2672, '军刺野营砍刀出售', 1, 'Jun Ci Ye Ying Kan Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2673, '著名精品折刀出售', 1, 'Zhu Ming Jing Pin Zhe Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2674, '战术军刀出售', 1, 'Zhan Shu Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2675, '刺刀专卖网', 1, 'Ci Dao Zhuan Mai Wang');
INSERT INTO `sensitive_words` VALUES (2676, '户外军刀出售', 1, 'Hu Wai Jun Dao Chu Shou');
INSERT INTO `sensitive_words` VALUES (2677, '阳江刀具直销网', 1, 'Yang Jiang Dao Ju Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2678, '冷钢刀具直销网', 1, 'Leng Gang Dao Ju Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2679, '防卫刀具直销网', 1, 'Fang Wei Dao Ju Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2680, '极端武力直销网', 1, 'Ji Duan Wu Li Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2681, '刀具直销网', 1, 'Dao Ju Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2682, '军刀直销网', 1, 'Jun Dao Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2683, '直刀匕首直销网', 1, 'Zhi Dao Bi Shou Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2684, '军刀匕首直销网', 1, 'Jun Dao Bi Shou Zhi Xiao Wang');
INSERT INTO `sensitive_words` VALUES (2685, '折刀砍刀军品网', 1, 'Zhe Dao Kan Dao Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2686, '野营刀具军品网', 1, 'Ye Ying Dao Ju Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2687, '阳江刀具军品网', 1, 'Yang Jiang Dao Ju Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2688, '冷钢刀具军品网', 1, 'Leng Gang Dao Ju Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2689, '防卫刀具军品网', 1, 'Fang Wei Dao Ju Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2690, '极端武力军品网', 1, 'Ji Duan Wu Li Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2691, '军用刀具军品网', 1, 'Jun Yong Dao Ju Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2692, '军刀直刀军品网', 1, 'Jun Dao Zhi Dao Jun Pin Wang');
INSERT INTO `sensitive_words` VALUES (2693, '折刀砍刀专卖', 1, 'Zhe Dao Kan Dao Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2694, '野营刀具专卖', 1, 'Ye Ying Dao Ju Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2695, '阳江刀具专卖', 1, 'Yang Jiang Dao Ju Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2696, '冷钢刀具专卖', 1, 'Leng Gang Dao Ju Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2697, '防卫刀具专卖', 1, 'Fang Wei Dao Ju Zhuan Mai');
INSERT INTO `sensitive_words` VALUES (2698, '出售美军现役军刀', 1, 'Chu Shou Mei Jun Xian Yi Jun Dao');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `id` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountId` int(11) NOT NULL,
  `expireAt` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('011e97f3ad684fd1a6105d30a46dc352', 1, 1537500004472);
INSERT INTO `session` VALUES ('021658b062b342028e67abab8289a6c7', 1, 1543419871822);
INSERT INTO `session` VALUES ('04b22e2b3bed41599cd6ec84a9939e3d', 1, 1537620393868);
INSERT INTO `session` VALUES ('0553e01927594191aecbea4734d65f03', 1, 1546440583412);
INSERT INTO `session` VALUES ('0686fea319544c5889297853adccff2f', 2, 1546504071891);
INSERT INTO `session` VALUES ('0860daf6c03f4bb185271337f79cbc1b', 1, 1537620560070);
INSERT INTO `session` VALUES ('0975152e537a4199844cad7b3be331de', 1, 1528868094891);
INSERT INTO `session` VALUES ('0d9d8c71ed054b99a5b48366975011fd', 3, 1538028341109);
INSERT INTO `session` VALUES ('0de7cc9d86654df6965c257cb9c01f37', 3, 1551520144199);
INSERT INTO `session` VALUES ('12fcfc2d36fb4b54a3085b39d3704efd', 3, 1547453915655);
INSERT INTO `session` VALUES ('1c93297a83784880a08e62776d00d1a3', 1, 1541568564924);
INSERT INTO `session` VALUES ('20e15901ab8b466e858bc0656f4b215b', 1, 1531720330380);
INSERT INTO `session` VALUES ('221d23bbce224ba0b4b754aaf502f965', 1, 1543420739822);
INSERT INTO `session` VALUES ('23e4beff26a34c6fa46d6c36110e5af9', 1, 1537499980450);
INSERT INTO `session` VALUES ('26ad5ba5c3ce4571bcad836da2f68e76', 1, 1537500068692);
INSERT INTO `session` VALUES ('2e83a52f569446cfbc8e555032d1b7fd', 1, 1529390174632);
INSERT INTO `session` VALUES ('30a8985192f24ce294716359e868bf78', 1, 1555503001331);
INSERT INTO `session` VALUES ('32e7d6353973485da166d709d44100f9', 3, 1543054240170);
INSERT INTO `session` VALUES ('33a2423839d749e7bb609907fbadcda0', 3, 1551521028153);
INSERT INTO `session` VALUES ('34dd4a9093a64391a35f69a05d60cb61', 1, 1527037041382);
INSERT INTO `session` VALUES ('3565f886a4614f51b09797b7b745f92e', 1, 1540179387318);
INSERT INTO `session` VALUES ('37f84bdb4c6941a39b05350e1d1ebd24', 1, 1545392737537);
INSERT INTO `session` VALUES ('3908ab2c8fca4db48c4f0a67ca6cc3da', 1, 1526017667329);
INSERT INTO `session` VALUES ('39506ba4fc2c49099f95a44b0a758456', 1, 1528703964628);
INSERT INTO `session` VALUES ('3959f8e4d0a54b5bbcd60fc43e0dd770', 1, 1528977835196);
INSERT INTO `session` VALUES ('398a8bcfbf664c2da90f43a569c4b5fd', 3, 1541565659054);
INSERT INTO `session` VALUES ('3b5fb7e2ae32479e95a333d7f2961691', 1, 1549437776964);
INSERT INTO `session` VALUES ('3be7044eb0b24f8d9acdb294c9deab37', 1, 1546329490003);
INSERT INTO `session` VALUES ('3cbf8e1c040549fe9276e7c5e73a371f', 1, 1531804211435);
INSERT INTO `session` VALUES ('410a30902f5045bc97dbd9b913dfc905', 1, 1545498018366);
INSERT INTO `session` VALUES ('430b5da844ce473e9f3f7edd80f05537', 1, 1528734542302);
INSERT INTO `session` VALUES ('44c5310bf2174861bf03be3c3458cb5c', 1, 1531143705817);
INSERT INTO `session` VALUES ('44e2b139b5874215a54f4ed2da49b78f', 1, 1558699500029);
INSERT INTO `session` VALUES ('45558eb8e3c944c9ab737e7af45b59ec', 1, 1529984290931);
INSERT INTO `session` VALUES ('47cf0f71bd6e49f998789f883239465f', 1, 1548168063029);
INSERT INTO `session` VALUES ('4a08190c613349459be84d5b746f9fd8', 1, 1530793395995);
INSERT INTO `session` VALUES ('4d0f9a58d62f49af8ec106d366c3bfd4', 1, 1563162453510);
INSERT INTO `session` VALUES ('4d75c58c797240649e36cd0362a42202', 1, 1529509364118);
INSERT INTO `session` VALUES ('4d8706b876224bcc90378b42d9cbb382', 1, 1543420377159);
INSERT INTO `session` VALUES ('52ce6666e7de499890b72da17a007b30', 1, 1558831327726);
INSERT INTO `session` VALUES ('5447caf69c484f8d9dcd093248e80741', 1, 1548740952258);
INSERT INTO `session` VALUES ('597be02bd55d40349667cf9c333dd4b9', 1, 1529301342104);
INSERT INTO `session` VALUES ('5f205bc108d34768b74f8eb2f4d037bf', 1, 1528945032090);
INSERT INTO `session` VALUES ('5f310a91742344f1a71684523dc955c6', 1, 1543420498635);
INSERT INTO `session` VALUES ('5fe04df586aa498b8305e42252b68f54', 1, 1619454238258);
INSERT INTO `session` VALUES ('629832586189460e9e80663b5efcec6e', 1, 1545452889670);
INSERT INTO `session` VALUES ('66a1a936e0b74c54867fe8975532b194', 1, 1532493163206);
INSERT INTO `session` VALUES ('73d3fb3683ef4b1da8f3fafb3ff3d7cd', 1, 1529469453206);
INSERT INTO `session` VALUES ('7585e3f9da2848ca8f9f8fe7d55bc842', 1, 1536834340521);
INSERT INTO `session` VALUES ('76316c4c2f4248808c6b599c03a1fd1f', 1, 1530791964027);
INSERT INTO `session` VALUES ('7961183b6e674910835e70efd9b8af94', 1, 1525251405079);
INSERT INTO `session` VALUES ('7b5a08e6ee184330811b93faaf1d2410', 1, 1546476150509);
INSERT INTO `session` VALUES ('7cf57ab9ad1841ba922db4bd8e326df9', 1, 1560502497278);
INSERT INTO `session` VALUES ('7d057b79b6184421929914f2514564fd', 3, 1547717578861);
INSERT INTO `session` VALUES ('7e3037bf5cbb4616b677f2ed5389ff7b', 3, 1547047222155);
INSERT INTO `session` VALUES ('84c53635fc67483a9809148c0647a8a8', 1, 1525242085682);
INSERT INTO `session` VALUES ('8790a908a022489980c2f0b3afd07291', 1, 1531108542002);
INSERT INTO `session` VALUES ('892dfe57faf94aa3900eb294ca37f110', 1, 1531104714187);
INSERT INTO `session` VALUES ('89313f34aa4e45dfb1615bb02eb5b1b2', 1, 1536834302760);
INSERT INTO `session` VALUES ('8a94fc633611488abd5a268858d7e65b', 1, 1536041262529);
INSERT INTO `session` VALUES ('90d9cae3cd8e4c978356ae53ac95aad8', 3, 1547544720080);
INSERT INTO `session` VALUES ('916a0482811e4c4e82d39a14e93f4bd5', 1, 1560402080264);
INSERT INTO `session` VALUES ('9170c4860b534ae4b89d6c229f09e248', 1, 1556879474884);
INSERT INTO `session` VALUES ('9439af6cc4c74afabb4e154052107182', 1, 1545555462189);
INSERT INTO `session` VALUES ('944c8efad5ee4480a209775b761aea46', 1, 1554371838656);
INSERT INTO `session` VALUES ('946ae77da0284a6ebb338778fe5b7888', 1, 1528734499924);
INSERT INTO `session` VALUES ('9c039f29fcef4378a1551c64ee0e7443', 1, 1547453846920);
INSERT INTO `session` VALUES ('9c90a3865bab4db79cb08a2f79b3a8f3', 1, 1529301059326);
INSERT INTO `session` VALUES ('9f49e603c6324aeeb009dbeb35798a6e', 1, 1545414467235);
INSERT INTO `session` VALUES ('9fe5adcd19074bb699c23a4a13ba6022', 1, 1538023795165);
INSERT INTO `session` VALUES ('a0513b4b5e874c319d800818b72f9bce', 1, 1554879272964);
INSERT INTO `session` VALUES ('a2c582b1b81b48198679f1a58d91800c', 3, 1554208040644);
INSERT INTO `session` VALUES ('a32de02c2cfe42c3afe8efc5081a129b', 3, 1547110160981);
INSERT INTO `session` VALUES ('a35ebf6f33e14c36992b7a1dafbe6123', 1, 1543419924049);
INSERT INTO `session` VALUES ('a3c6c63f694a4c7a8e438222af8f408a', 3, 1546880740368);
INSERT INTO `session` VALUES ('a4f8f4c9d1974aa9ac311cf4e73ff1e6', 1, 1530804592100);
INSERT INTO `session` VALUES ('a990e8dac11243979f4968e4a152448c', 1, 1531887919018);
INSERT INTO `session` VALUES ('ad416af578724d4a827c23f2f275e5fe', 1, 1558363460343);
INSERT INTO `session` VALUES ('add95df8960445c894b1389cf693e417', 1, 1543419826455);
INSERT INTO `session` VALUES ('af23cbd60fcd49f1a3ad8f9fbbdc2c01', 3, 1543547599953);
INSERT INTO `session` VALUES ('af3d6ab0c9f1446db3a44bdcf1ce147f', 9, 1525321633446);
INSERT INTO `session` VALUES ('b3683b23f15f4bae8fb178b3736ef91a', 3, 1554951146122);
INSERT INTO `session` VALUES ('b6e786a752a24c868ef76a5d9d7ab908', 1, 1530010383610);
INSERT INTO `session` VALUES ('b80c7b2d2e85450b8d9af4c0149a1ab3', 1, 1558864662724);
INSERT INTO `session` VALUES ('ba3e6afe59d84f6d8a1225831dcf1582', 1, 1545670379897);
INSERT INTO `session` VALUES ('bb9f91bdf48d4ffba0669c175a40480e', 1, 1528977558572);
INSERT INTO `session` VALUES ('bc8fb990ffab4ef9a15a15dd2dfd2969', 1, 1529934000549);
INSERT INTO `session` VALUES ('bd597039e36b412ba35e51f38f6bc0ee', 5, 1556879427964);
INSERT INTO `session` VALUES ('be7ddede69da47ac95f99aeb672c2f05', 1, 1529398632560);
INSERT INTO `session` VALUES ('c0806e5b7a564724810a4de397b01dcc', 3, 1554111250114);
INSERT INTO `session` VALUES ('c2ed4d3b98814a3ea86259511b0fc523', 1, 1528425292500);
INSERT INTO `session` VALUES ('c43077d842a84d448db6f5cf76a931d0', 1, 1543214953915);
INSERT INTO `session` VALUES ('c86d25ec055c497eaae0d3226062e391', 1, 1547544659810);
INSERT INTO `session` VALUES ('c89d13e9a8f34a3fb623e9d437b6ac25', 3, 1546324964014);
INSERT INTO `session` VALUES ('c8a8a02087394db7bf6c438258643c10', 1, 1545706724908);
INSERT INTO `session` VALUES ('c8e6690b269c427eafb6a728ff85c523', 1, 1550994128887);
INSERT INTO `session` VALUES ('ca09775ecdc9482fb5e0b14d7a750b95', 3, 1540360745388);
INSERT INTO `session` VALUES ('ca9d87f2284647eb9dcd26f2819ebc3a', 3, 1546410393325);
INSERT INTO `session` VALUES ('cc87e456fb934fe78bb66c3c20ec11db', 1, 1556940949384);
INSERT INTO `session` VALUES ('d492f3ae51864dd4b46674e9230c5101', 3, 1547732880681);
INSERT INTO `session` VALUES ('d4eb4c43cddc4e29960a514a64fa684a', 3, 1538189781689);
INSERT INTO `session` VALUES ('d6178dd150454dc98b7040a3e89df74e', 1, 1539773489612);
INSERT INTO `session` VALUES ('d876b9dda2f04e68b2e8b911a5f61e7a', 1, 1539268715820);
INSERT INTO `session` VALUES ('d9104126c4cc479497501af35edc3a30', 1, 1549262547639);
INSERT INTO `session` VALUES ('d9c4d4d7d0c744ce8ecbb49b53a2adee', 3, 1546944019514);
INSERT INTO `session` VALUES ('ddfcef4403cc4900b9bd1b814adb14c5', 1, 1555679185275);
INSERT INTO `session` VALUES ('df39a37536cf43c09f7e878183bbcd0f', 3, 1547453948477);
INSERT INTO `session` VALUES ('e0a58e1a8a3b4dcf93db37093296d3e7', 1, 1531458555567);
INSERT INTO `session` VALUES ('e0c2108c057a4498b09b60340da009b4', 1, 1548657714115);
INSERT INTO `session` VALUES ('e53505fcedf24275bf5239f599466c00', 4, 1545706693210);
INSERT INTO `session` VALUES ('e960f0a526434a5db17984a6f3717e92', 3, 1545415563858);
INSERT INTO `session` VALUES ('e9a94fd82c81432e8b924ab6255af895', 1, 1546349085337);
INSERT INTO `session` VALUES ('e9b5712ee61d47368cc79000354bb995', 1, 1528993184577);
INSERT INTO `session` VALUES ('ed0880dfff954cb294ccf94f77a56ec5', 1, 1556933320679);
INSERT INTO `session` VALUES ('ee34a1166b1e449b8167adf142d4df99', 1, 1537500127461);
INSERT INTO `session` VALUES ('ee83facf02ea45e39457874647433b9a', 3, 1556246396235);
INSERT INTO `session` VALUES ('f1180527572a4a1e872f0e7b98848344', 1, 1528968843645);
INSERT INTO `session` VALUES ('f348582c8d054f0cbe077194675dc2ef', 1, 1545456989824);
INSERT INTO `session` VALUES ('f489f7f623bc4a08815b386459ead030', 3, 1550539280144);
INSERT INTO `session` VALUES ('f538e022c9134baea27f1c5a5374cf4e', 1, 1528951222466);
INSERT INTO `session` VALUES ('f74afef49f6f4984a0dd7470b0bcfa35', 3, 1549415924338);
INSERT INTO `session` VALUES ('f95a30ab3517403bad04f82f495b22c3', 1, 1554817697281);
INSERT INTO `session` VALUES ('f9d6b8f03a0e4d5984e96498ee0d52f5', 1, 1559890854824);
INSERT INTO `session` VALUES ('fa06203c76cf4264b8218f88f5e2f910', 3, 1556769926516);
INSERT INTO `session` VALUES ('fec972cc39914cae9842965482d8cff7', 1, 1561554218595);

-- ----------------------------
-- Table structure for task_run_log
-- ----------------------------
DROP TABLE IF EXISTS `task_run_log`;
CREATE TABLE `task_run_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时任务名称',
  `createAt` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upload_counter
-- ----------------------------
DROP TABLE IF EXISTS `upload_counter`;
CREATE TABLE `upload_counter`  (
  `uploadType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `counter` int(11) NOT NULL,
  `descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uploadType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求的IP地址',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip所在地区',
  `addressJson` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果json',
  `url` varchar(336) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求的页面路径',
  `method` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `client` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客户端',
  `requestTime` datetime(0) NULL DEFAULT NULL COMMENT '请求时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21022 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES (21002, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"code\":0,\"data\":{\"ip\":\"127.0.0.1\",\"country\":\"XX\",\"area\":\"\",\"region\":\"XX\",\"city\":\"内网IP\",\"county\":\"内网IP\",\"isp\":\"内网IP\",\"country_id\":\"xx\",\"area_id\":\"\",\"region_id\":\"xx\",\"city_id\":\"local\",\"county_id\":\"local\",\"isp_id\":\"local\"}}', 'http://127.0.0.1:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 12:41:47');
INSERT INTO `visitor` VALUES (21003, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 12:42:13');
INSERT INTO `visitor` VALUES (21004, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 13:00:52');
INSERT INTO `visitor` VALUES (21005, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/login/captcha', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 13:01:12');
INSERT INTO `visitor` VALUES (21006, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 13:01:21');
INSERT INTO `visitor` VALUES (21007, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 13:01:12');
INSERT INTO `visitor` VALUES (21008, '127.0.0.1', 'XX/内网IP/XX[内网IP]', '{\"area\":\"\",\"areaId\":\"\",\"city\":\"内网IP\",\"cityId\":\"local\",\"country\":\"XX\",\"countryId\":\"xx\",\"county\":\"内网IP\",\"countyId\":\"local\",\"createTime\":1560314499000,\"id\":68832667423997952,\"ip\":\"127.0.0.1\",\"isp\":\"内网IP\",\"ispId\":\"local\",\"region\":\"XX\",\"regionId\":\"xx\"}', 'http://127.0.0.1:1013/login/doLogin', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-12 13:01:20');
INSERT INTO `visitor` VALUES (21009, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:02:41');
INSERT INTO `visitor` VALUES (21010, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:03:29');
INSERT INTO `visitor` VALUES (21011, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:03:16');
INSERT INTO `visitor` VALUES (21012, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login/captcha', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:03:29');
INSERT INTO `visitor` VALUES (21013, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/article/15', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:03:23');
INSERT INTO `visitor` VALUES (21014, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login/doLogin', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-06-25 21:03:39');
INSERT INTO `visitor` VALUES (21015, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-12 21:34:41');
INSERT INTO `visitor` VALUES (21016, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-12 21:35:42');
INSERT INTO `visitor` VALUES (21017, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-14 11:47:15');
INSERT INTO `visitor` VALUES (21018, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-14 11:47:14');
INSERT INTO `visitor` VALUES (21019, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login/captcha', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-14 11:47:15');
INSERT INTO `visitor` VALUES (21020, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/article/14', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-14 11:47:14');
INSERT INTO `visitor` VALUES (21021, '0:0:0:0:0:0:0:1', 'XX', '{}', 'http://localhost:1013/login/doLogin', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-07-14 11:47:28');

SET FOREIGN_KEY_CHECKS = 1;
