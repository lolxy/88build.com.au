-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2017-05-30 11:17:16
-- Vol : 1
DROP TABLE IF EXISTS `bul_ad`;
CREATE TABLE `bul_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `bul_asset`;
CREATE TABLE `bul_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `bul_auth_access`;
CREATE TABLE `bul_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/userinfo_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/user/userinfo','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/userdefault','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/cancelban','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/ban','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/add_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/add','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/edit_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/edit','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/delete','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/toggle','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/listorders','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/slide/index','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/extension/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/copy','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/add_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/add','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/edit_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/edit','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/delete','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/check','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/move','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/recommend','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/top','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/listorders','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','portal/adminpost/index','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','comment/commentadmin/check','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','comment/commentadmin/delete','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','comment/commentadmin/index','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/content/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/password','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/password_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/setting/avatar','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/content/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','comment/commentadmin/index','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','comment/commentadmin/delete','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','comment/commentadmin/check','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/default','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/userdefault','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/userinfo','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/user/userinfo_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/password','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/password_post','admin_url');
INSERT INTO bul_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/setting/avatar','admin_url');
DROP TABLE IF EXISTS `bul_auth_rule`;
CREATE TABLE `bul_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','注册邮件模板','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','会员管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','普通会员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','添加会员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('162','Demo','admin_url','demo/adminindex/index','','','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('163','Demo','admin_url','demo/adminindex/last','','','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('166','Admin','admin_url','admin/mailer/test','','群发邮件','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('167','Admin','admin_url','admin/setting/upload','','上传设置','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('168','Admin','admin_url','admin/setting/upload_post','','上传设置提交','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('169','Portal','admin_url','portal/adminpost/copy','','文章批量复制','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('170','Admin','admin_url','admin/menu/backup_menu','','备份菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('171','Admin','admin_url','admin/menu/export_menu_lang','','导出后台菜单多语言包','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('172','Admin','admin_url','admin/menu/restore_menu','','还原菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('173','Admin','admin_url','admin/menu/getactions','','导入新菜单','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('174','Admin','admin_url','admin/setting/avatar','','上传头像','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('175','Admin','admin_url','admin/user/zxsf','','装修师傅管理','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('176','Admin','admin_url','admin/user/superadmin','','超级管理员','1','');
INSERT INTO bul_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('177','Admin','admin_url','admin/maier/test','','邮件发送','1','');
DROP TABLE IF EXISTS `bul_comments`;
CREATE TABLE `bul_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  `score` smallint(2) DEFAULT '5' COMMENT '评分：1-5分',
  `is_anony` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否匿名评论，1：实名；2：匿名',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('1','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','4','0','刘师傅','ddd@qq.com','2017-05-27 20:56:02','测试评论','1','0','0-1','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('2','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','2','0','165492531_qq_com','165492531@qq.com','2017-05-27 22:19:05','121212','1','0','0-2','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('3','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','2','0','165492531_qq_com','165492531@qq.com','2017-05-27 22:20:01','121223333','1','0','0-3','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('4','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','2','0','165492531_qq_com','165492531@qq.com','2017-05-27 22:20:45','1212122','1','0','0-4','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('5','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','lolxy2010','lolxy2010@163.com','2017-05-27 22:34:32','test','1','0','0-5','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('6','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','2','lolxy2010','lolxy2010@163.com','2017-05-27 22:34:50','12121111','1','3','0-3-6','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('7','posts','2','index.php?g=portal&amp;m=article&amp;a=index&amp;id=2&amp;cid=7','6','0','lolxy2010','lolxy2010@163.com','2017-05-27 23:09:32','ceshi ','1','0','0-7','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('8','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4','6','4','lolxy2010','lolxy2010@163.com','2017-05-28 01:57:18','123','1','1','0-1-8','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('9','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 02:39:03','测试积分','1','0','0-9','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('10','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:04:40','五星好评','1','0','0-10','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('11','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:06:13','111','1','0','0-11','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('12','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:09:50','11111','1','0','0-12','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('13','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:11:25','11','1','0','0-13','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('14','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:12:50','1122','1','0','0-14','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('15','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:13:58','11111','1','0','0-15','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('16','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 03:15:20','1111','1','0','0-16','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('17','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:23:41','我i的啊时代开始','1','0','0-17','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('18','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:27:54','12121221','1','0','0-18','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('19','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:30:25','1111','1','0','0-19','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('20','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:30:52','1111','1','0','0-20','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('21','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:31:19','1111','1','0','0-21','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('22','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','lolxy2010','lolxy2010@163.com','2017-05-28 09:32:35','1111','1','0','0-22','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('23','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 09:36:33','12121','1','0','0-23','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('24','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 09:36:52','323232','1','0','0-24','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('25','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 09:46:53','1111','1','0','0-25','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('26','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 09:48:16','11111','1','0','0-26','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('27','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:02:04','1111','1','0','0-27','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('28','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:02:15','1111','1','0','0-28','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('29','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','6','陈师傅','lolxy2010@163.com','2017-05-28 10:02:51','1111','1','27','0-27-29','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('30','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:05:06','1111','1','0','0-30','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('31','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:14:57','1111','1','0','0-31','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('32','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:16:03','1111','1','0','0-32','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('33','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:16:40','1111','1','0','0-33','1','2','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('34','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:17:35','1111','1','0','0-34','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('35','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:18:16','12嗡嗡嗡','1','0','0-35','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('36','users','3','://','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:20:49','11111','1','0','0-36','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('37','users','3','://','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:22:56','11111','1','0','0-37','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('38','users','3','://','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:23:25','11111','1','0','0-38','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('39','users','3','://','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:23:43','11111','1','0','0-39','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('40','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:25:03','111','1','0','0-40','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('41','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:25:46','111','1','0','0-41','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('42','users','3','index.php?g=user&amp;m=info&amp;a=index&amp;id=3','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:28:39','1111','1','0','0-42','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('43','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','6','陈师傅','lolxy2010@163.com','2017-05-28 10:28:58','1111','1','25','0-25-43','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('44','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:29:31','1111','1','0','0-44','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('45','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:35:16','111','1','0','0-45','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('46','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:35:57','111','1','0','0-46','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('47','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:37:25','1111','1','0','0-47','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('48','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','6','陈师傅','lolxy2010@163.com','2017-05-28 10:40:30','1111','1','8','0-1-8-48','1','','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('49','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:40:48','11111222','1','0','0-49','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('50','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:49:40','1111','1','0','0-50','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('51','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:52:51','1111','1','0','0-51','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('52','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:53:10','1111','1','0','0-52','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('53','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:54:47','111','1','0','0-53','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('54','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:57:14','1111','1','0','0-54','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('55','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 10:59:48','1111','1','0','0-55','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('56','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:00:30','11111','1','0','0-56','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('57','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:02:52','1111','1','0','0-57','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('58','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:04:15','111','1','0','0-58','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('59','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:07:00','111','1','0','0-59','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('60','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:13:49','·1111','1','0','0-60','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('61','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:17:20','11112222','1','0','0-61','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('62','users','4','index.php?g=user&amp;m=info&amp;a=index&amp;id=4&amp;cid=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:18:21','1111','1','0','0-62','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('63','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:20:03','11111','1','0','0-63','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('64','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:20:44','222','1','0','0-64','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('65','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:21:23','1111','1','0','0-65','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('66','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:22:56','1111','1','0','0-66','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('67','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:23:37','1','1','0','0-67','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('68','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:26:33','111','1','0','0-68','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('69','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','6','0','陈师傅','lolxy2010@163.com','2017-05-28 11:28:29','1111','1','0','0-69','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('70','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','1','0','胡先生','604749526@qq.com','2017-05-28 11:29:55','1111踩踩踩','1','0','0-70','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('71','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','1','0','胡先生','604749526@qq.com','2017-05-28 11:30:53','111','1','0','0-71','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('72','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','1','0','胡先生','604749526@qq.com','2017-05-28 11:33:16','121212','1','0','0-72','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('73','users','7','index.php?g=user&amp;m=info&amp;a=index&amp;id=7','1','0','胡先生','604749526@qq.com','2017-05-28 11:33:28','烦烦烦方法','1','0','0-73','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('74','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','1','0','胡先生','604749526@qq.com','2017-05-28 11:38:41','1111dddd','1','0','0-74','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('75','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','1','0','胡先生','604749526@qq.com','2017-05-28 11:40:03','1111','1','0','0-75','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('76','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','1','0','胡先生','604749526@qq.com','2017-05-28 11:42:41','21212','1','0','0-76','1','3','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('77','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 12:07:42','333333','1','0','0-77','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('78','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 12:08:18','1212','1','0','0-78','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('79','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 12:25:02','1111','1','0','0-79','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('80','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 12:29:02','11111','1','0','0-80','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('81','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 12:30:49','11111','1','0','0-81','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('82','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2&amp;cid=1','6','0','陈师傅','lolxy2010@163.com','2017-05-28 13:42:45','12121','1','0','0-82','1','5','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('83','users','6','index.php?g=user&amp;m=info&amp;a=index&amp;id=6','6','0','陈师傅','lolxy2010@163.com','2017-05-28 16:44:48','wo yao ping ','1','0','0-83','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('84','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:02:08','1212121','1','0','0-84','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('85','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:02:40','我要匿名评价','1','0','0-85','1','1','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('86','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:03:55','我要匿名评价','1','0','0-86','1','4','1');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('87','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:07:14','我要匿名评价1','1','0','0-87','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('88','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:11:35','12121','1','0','0-88','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('89','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:16:53','121我','1','0','0-89','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('90','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:19:28','1221','1','0','0-90','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('91','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:20:15','1111','1','0','0-91','1','5','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('92','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:20:32','的啊实打实','1','0','0-92','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('93','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:22:02','1111','1','0','0-93','1','5','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('94','users','2','index.php?g=user&amp;m=info&amp;a=index&amp;id=2','6','0','陈师傅','lolxy2010@163.com','2017-05-28 18:22:39','111','1','0','0-94','1','4','0');
INSERT INTO bul_comments ( `id`, `post_table`, `post_id`, `url`, `uid`, `to_uid`, `full_name`, `email`, `createtime`, `content`, `type`, `parentid`, `path`, `status`, `score`, `is_anony` ) VALUES  ('95','users','2','user/info/index/id/2.html','6','0','陈师傅','lolxy2010@163.com','2017-05-29 23:36:43','1111','1','0','0-95','1','5','0');
DROP TABLE IF EXISTS `bul_common_action_log`;
CREATE TABLE `bul_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('1','6','posts2','Portal-Article-do_like','1','1495958449','127.0.0.1');
DROP TABLE IF EXISTS `bul_guestbook`;
CREATE TABLE `bul_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `bul_links`;
CREATE TABLE `bul_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.88bulid.com.au','墨尔本88建筑装修网','admin/20170523/5923f8397bf1e.png','_blank','墨尔本88建筑装修网','1','0','','0');
DROP TABLE IF EXISTS `bul_menu`;
CREATE TABLE `bul_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','0','所有留言','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','0','插件管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','注册邮件模板','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','0','用户组','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','会员管理','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','5');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','普通会员','','','2');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','139','Admin','User','add','','1','1','添加会员','','','1');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','109','Admin','Storage','index','','1','0','文件存储','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('166','126','Admin','Mailer','test','','1','1','群发邮件','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('167','109','Admin','Setting','upload','','1','1','上传设置','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('168','167','Admin','Setting','upload_post','','1','0','上传设置提交','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('169','7','Portal','AdminPost','copy','','1','0','文章批量复制','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('174','100','Admin','Menu','backup_menu','','1','0','备份菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('175','100','Admin','Menu','export_menu_lang','','1','0','导出后台菜单多语言包','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('176','100','Admin','Menu','restore_menu','','1','0','还原菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('177','100','Admin','Menu','getactions','','1','0','导入新菜单','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('187','110','Admin','Setting','avatar','','1','1','上传头像','','','0');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('188','139','Admin','User','zxsf','','1','1','装修师傅管理','','','3');
INSERT INTO bul_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('189','139','Admin','User','superadmin','','1','1','超级管理员','','','4');
DROP TABLE IF EXISTS `bul_nav`;
CREATE TABLE `bul_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('4','1','0','首页','','home','','1','0','0-4');
INSERT INTO bul_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('5','1','0','全部分类','','/categorylist/index','','1','0','0-5');
DROP TABLE IF EXISTS `bul_nav_cat`;
CREATE TABLE `bul_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航');
DROP TABLE IF EXISTS `bul_oauth_user`;
CREATE TABLE `bul_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `bul_options`;
CREATE TABLE `bul_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"88bulid\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.88bulid.com.au\\\" target=\\\"_self\\\" textvalue=\\\"88bulid\\\">88bulid<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662f88bulid\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp;88bulid.com.au<\\/p>\"}','1');
INSERT INTO bul_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('6','site_options','{\"site_name\":\"\\u58a8\\u5c14\\u672c88\\u5efa\\u7b51\\u88c5\\u4fee\\u7f51\",\"site_logo\":\"admin\\/20170523\\/5923c6eb35439.png\",\"site_erweima\":\"\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"mobile_tpl_enabled\":\"1\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"604749526@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"88\\u58a8\\u5c14\\u672c\\u5efa\\u7b51\\u88c5\\u4fee\\u7f51\",\"site_seo_keywords\":\"88\\u58a8\\u5c14\\u672c\\u5efa\\u7b51\\u88c5\\u4fee\\u7f51\",\"site_seo_description\":\"88\\u58a8\\u5c14\\u672c\\u5efa\\u7b51\\u88c5\\u4fee\\u7f51\",\"urlmode\":\"2\",\"html_suffix\":\"html\",\"comment_need_check\":\"1\",\"comment_time_interval\":\"10\"}','1');
INSERT INTO bul_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('7','cmf_settings','{\"banned_usernames\":\"\"}','1');
INSERT INTO bul_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('8','cdn_settings','{\"cdn_static_root\":\"\"}','1');
DROP TABLE IF EXISTS `bul_plugins`;
CREATE TABLE `bul_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_plugins ( `id`, `name`, `title`, `description`, `type`, `status`, `config`, `hooks`, `has_admin`, `author`, `version`, `createtime`, `listorder` ) VALUES  ('1','Mobileverify','手机验证码','手机验证码','0','1','{\"account_sid\":\"\",\"auth_token\":\"\",\"app_id\":\"\",\"template_id\":\"\",\"expire_minute\":\"30\"}','send_mobile_verify_code','1','ThinkCMF','1.0','0','0');
INSERT INTO bul_plugins ( `id`, `name`, `title`, `description`, `type`, `status`, `config`, `hooks`, `has_admin`, `author`, `version`, `createtime`, `listorder` ) VALUES  ('2','Comment','系统评论插件','系统评论插件','0','1','[]','comment','0','ThinkCMF','1.0','0','0');
DROP TABLE IF EXISTS `bul_posts`;
CREATE TABLE `bul_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','111','111','2017-05-21 10:40:33','<p>111</p>','111','111','1','1','2017-05-21 10:40:43','','0','1','','0','{\"thumb\":\"\",\"template\":\"\"}','12','0','0','0');
INSERT INTO bul_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','2','','','2017-05-27 21:56:53','<p>泳池工程案例</p>','泳池工程案例','','1','1','2017-05-27 22:45:31','','0','1','','1','{\"thumb\":\"\",\"template\":\"\"}','42','1','0','0');
INSERT INTO bul_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('3','6','','','2017-05-28 16:23:49','<p>1111</p>','1111','','1','1','2017-05-28 16:24:33','','0','1','','0','{\"thumb\":\"portal\\/20170528\\/592a893cbcd8a.jpg\",\"template\":\"\"}','37','0','0','0');
INSERT INTO bul_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('4','6','','','2017-05-28 16:24:42','<p>2222</p>','2222','','1','1','2017-05-28 16:25:12','','0','1','','0','{\"thumb\":\"portal\\/20170528\\/592a89544cc3f.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170528\\/592a895e73ec0.jpg\",\"alt\":\"2.jpg\"},{\"url\":\"portal\\/20170528\\/592a896106da4.jpg\",\"alt\":\"1.jpg\"},{\"url\":\"portal\\/20170528\\/592a896360e3f.jpg\",\"alt\":\"3.jpg\"}]}','60','0','0','0');
DROP TABLE IF EXISTS `bul_role`;
CREATE TABLE `bul_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
INSERT INTO bul_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('2','普通会员','','1','普通会员','1495160526','0','0');
INSERT INTO bul_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('3','装修师傅','','1','装修师傅','1495160537','0','0');
DROP TABLE IF EXISTS `bul_role_user`;
CREATE TABLE `bul_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('3','2');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('2','3');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('3','4');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('1','5');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('3','7');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('3','6');
INSERT INTO bul_role_user ( `role_id`, `user_id` ) VALUES  ('2','8');
DROP TABLE IF EXISTS `bul_route`;
CREATE TABLE `bul_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `bul_slide`;
CREATE TABLE `bul_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `user_id` int(11) NOT NULL,
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_slide ( `slide_id`, `slide_cid`, `user_id`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('1','1','0','轮播一','admin/20170523/5923c737bee0d.jpg','','','','1','0');
INSERT INTO bul_slide ( `slide_id`, `slide_cid`, `user_id`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('2','1','0','轮播二','admin/20170523/5923c7555a370.jpg','','','','1','0');
INSERT INTO bul_slide ( `slide_id`, `slide_cid`, `user_id`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('6','2','4','测试','admin/20170525/5926d884c1c92.jpg','','','','1','0');
DROP TABLE IF EXISTS `bul_slide_cat`;
CREATE TABLE `bul_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('1','首页轮播图','index_slide','首页轮播图（1920px*500px）','1');
INSERT INTO bul_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('2','装修师傅首页轮播图','user_index_slide','装修师傅首页轮播user_index_slide（1920px*500px）','1');
DROP TABLE IF EXISTS `bul_term_relationships`;
CREATE TABLE `bul_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `posts_id` bigint(20) NOT NULL COMMENT 'post文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','1','0','2','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('10','6','0','4','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('5','2','0','7','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('6','4','0','2','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','3','0','2','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','0','2','7','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('11','0','3','7','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('12','0','4','7','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('13','6','0','1','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('14','6','0','7','0','1');
INSERT INTO bul_term_relationships ( `tid`, `object_id`, `posts_id`, `term_id`, `listorder`, `status` ) VALUES  ('15','6','0','2','0','1');
DROP TABLE IF EXISTS `bul_terms`;
CREATE TABLE `bul_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('1','水','','article','','0','0','0-1','','','','userlist','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('2','电','','article','','0','0','0-2','','','','list_masonry','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('3','油漆','','article','','0','0','0-3','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('4','石膏板','','article','','0','0','0-4','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('5','室外搭建','','article','','0','0','0-5','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('6','花园建造','','article','','0','0','0-6','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('7','泳池','','article','','1','0','0-1-7','','','','userlist','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('8','厨房卫浴','','article','','1','0','0-1-8','','','','list_masonry','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('9','家用电','','article','','2','0','0-2-9','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('10','商用电','','article','','2','0','0-2-10','','','','list','article','0','1');
INSERT INTO bul_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('11','监控','','article','','2','0','0-2-11','','','','list','article','0','1');
DROP TABLE IF EXISTS `bul_user_favorites`;
CREATE TABLE `bul_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_user_favorites ( `id`, `uid`, `title`, `url`, `description`, `table`, `object_id`, `createtime` ) VALUES  ('1','6','泳池工程案例','/index.php?g=portal&amp;m=article&amp;a=index&amp;id=2&amp;cid=7','','posts','2','1495952328');
DROP TABLE IF EXISTS `bul_users`;
CREATE TABLE `bul_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:超级管理员 ;2:普通会员；3：装修师傅',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `work_time` date DEFAULT '0000-00-00' COMMENT '从业年限',
  `work_content` text COMMENT '工作内容',
  `service_area` text COMMENT '服务区域',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `comment_count` bigint(20) DEFAULT '0' COMMENT '评论数目',
  `user_hits` int(11) DEFAULT '0' COMMENT '浏览数',
  `user_love` int(11) DEFAULT '0' COMMENT '好评数',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('1','admin','###362114d24ef346160649dcbff5898d9c','胡先生','604749526@qq.com','','avatar/591eac871c1e5.png','0','2000-01-01','','127.0.0.1','2017-05-30 00:32:53','2017-05-19 10:10:22','','1','0','1','0','','0000-00-00','','','1','0','0','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('2','165492531_qq_com','###bef61f413162da2b054b2f6c8204fdb7','165492531_qq_com','165492531@qq.com','','avatar/591ead09366eb.png','0','2000-01-01','','127.0.0.1','2017-05-27 22:37:27','2017-05-19 10:21:15','','1','0','3','0','','0000-00-00','','','1','38','206','6');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('3','11111111_qq_com','###6b506f99cd7fc48be332818180ea0f58','刘师傅','11111111@qq.com','','','0','2000-01-01','','127.0.0.1','2017-05-21 12:20:18','2017-05-21 12:20:18','','1','0','2','0','','0000-00-00','','','1','17','5','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('4','lolxy','###bef61f413162da2b054b2f6c8204fdb7','刘师傅','ddd@qq.com','','','0','2000-01-01','','127.0.0.1','2017-05-27 20:55:48','2017-05-22 19:46:23','','1','0','3','0','','0000-00-00','','','1','22','13','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('5','useradmin','###362114d24ef346160649dcbff5898d9c','','admin@admin.com','','','0','2000-01-01','','127.0.0.1','2017-05-23 16:45:16','2017-05-23 16:44:33','','1','0','1','0','','0000-00-00','','','1','0','0','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('6','lolxy2010','###6b506f99cd7fc48be332818180ea0f58','陈师傅','lolxy2010@163.com','','','1','1960-01-06','1111','127.0.0.1','2017-05-29 23:36:34','2017-05-27 21:02:57','','1','0','3','0','15759555555','2012-05-23','111','111','1','1','44','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('7','test','###b7e369b688cb1423387fe395cdde2517','','test@qq.com','','','0','2000-01-01','','','2000-01-01 00:00:00','2017-05-27 21:48:09','','1','0','3','0','','0000-00-00','','','1','10','7','0');
INSERT INTO bul_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `work_time`, `work_content`, `service_area`, `comment_status`, `comment_count`, `user_hits`, `user_love` ) VALUES  ('8','test11','###88b80a63ac7d2587b760fb96c34781cf','','qqq@qq.com','','','0','2000-01-01','','','2000-01-01 00:00:00','2017-05-27 21:50:50','','1','0','2','0','','0000-00-00','','','1','0','13','0');
