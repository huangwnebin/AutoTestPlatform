/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.200_3306
Source Server Version : 50721
Source Host           : 192.168.10.200:3306
Source Database       : adminlte-admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-20 11:15:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `deptName` varchar(100) NOT NULL COMMENT '部门名称',
  `deptDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('yfb44429b597d754c4180c6b40cdfb0f565', '研发部', 'yfb');
INSERT INTO `sys_dept` VALUES ('djcpt329b597d754c4180c6b40cdfb0f565', '基础平台部', 'jcpt');
INSERT INTO `sys_dept` VALUES ('nes44429b597d754c4180c6b40cdfb0f565', '未分组', 'wfz');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '用户',
  `title` varchar(300) DEFAULT NULL COMMENT '日志',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `params` text COMMENT '参数',
  `createTime` datetime DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('ffbe58fb038d4e99b1bc8abac5ff4f44', 'admin', '用户登录成功', '/login/doLogin', '', '2018-04-15 11:38:37');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `menuName` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` varchar(50) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `deep` int(11) DEFAULT NULL COMMENT '深度',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `resource` varchar(50) DEFAULT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', null, 'fa fa-cogs', '1', '1', '01', null);
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '1', '/system/user/list/1', 'fa-user-circle-o', '1', '2', '0101', 'user');
INSERT INTO `sys_menu` VALUES ('d2bc30feb5474a1bb7e02d48d39a3f8a', '查看用户列表', '2', null, null, '0', '3', '010100', 'listUser');
INSERT INTO `sys_menu` VALUES ('a73802e513cc4465883530ec8074abbb', '新增用户', '2', null, null, '1', '3', '010101', 'addUser');
INSERT INTO `sys_menu` VALUES ('4253190001c1480fb0d631d64d150535', '编辑用户', '2', null, null, '2', '3', '010102', 'editUser');
INSERT INTO `sys_menu` VALUES ('649b484b58414d91aefa5a26143e6557', '删除用户', '2', null, null, '3', '3', '010103', 'deleteUser');

INSERT INTO `sys_menu` VALUES ('3', '角色管理', '1', '/system/role/list/1', 'fa-users', '2', '2', '0102', 'role');
INSERT INTO `sys_menu` VALUES ('1db9105008404a3485b6fac30dba3c0e', '查看角色列表', '3', null, null, '0', '3', '010200', 'listRole');
INSERT INTO `sys_menu` VALUES ('60dda993d87647f5989c15f14f866df9', '新增角色', '3', null, null, '1', '3', '010201', 'addRole');
INSERT INTO `sys_menu` VALUES ('686630c7cb624cc786dcdc9958971a6b', '编辑角色', '3', null, null, '2', '3', '010202', 'editRole');
INSERT INTO `sys_menu` VALUES ('b4e7232189b14cf3ba160cf7b0d3bf37', '删除角色', '3', null, null, '3', '3', '010203', 'deleteRole');
INSERT INTO `sys_menu` VALUES ('a5ebf29168234406939856bc6890c86b', '角色授权', '3', null, null, '4', '3', '010204', 'authRole');
INSERT INTO `sys_menu` VALUES ('f899f3d3baec4571b1c786717f9906fd', '批量删除角色', '3', null, null, '5', '3', '010205', 'deleteBatchRole');

INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', '/system/menu/list/1', 'fa-list', '3', '2', '0103', 'menu');
INSERT INTO `sys_menu` VALUES ('488ef1eff57b4827acade7c0744278ce', '查看菜单列表', '4', null, null, '0', '3', '010300', 'listMenu');
INSERT INTO `sys_menu` VALUES ('3f26102ef0e04c3c9328cb97067cc5fa', '创建菜单', '4', null, null, '1', '3', '010301', 'addMenu');
INSERT INTO `sys_menu` VALUES ('dc5f478d98ed4297a8ae638fe90df050', '编辑菜单', '4', null, null, '3', '3', '010302', 'editMenu');
INSERT INTO `sys_menu` VALUES ('0c9b5fc8b44b41d1871a8fc8300247ec', '删除菜单', '4', null, null, '4', '3', '010303', 'deleteMenu');

INSERT INTO `sys_menu` VALUES ('5', '部门管理', '1', '/system/dept/list/1', 'fa-graduation-cap', '4', '2', '0104', 'dept');
INSERT INTO `sys_menu` VALUES ('4e816a9854714d24b0413d929d637a2b', '查看部门列表', '22e38e885f9b40b9aae6a36deb78e89c', null, null, '0', '3', '010400', 'listDept');
INSERT INTO `sys_menu` VALUES ('3fb6a7a5935b4efabf3de82e7e1baeb6', '新增部门', '22e38e885f9b40b9aae6a36deb78e89c', null, null, '1', '3', '010401', 'addDept');
INSERT INTO `sys_menu` VALUES ('363a778e78a346a68210b2590163a943', '编辑部门', '22e38e885f9b40b9aae6a36deb78e89c', null, null, '2', '3', '010402', 'editDept');
INSERT INTO `sys_menu` VALUES ('79d78b8357174cac8f44abd275dec597', '删除部门', '22e38e885f9b40b9aae6a36deb78e89c', null, null, '3', '3', '010403', 'deleteDept');

INSERT INTO `sys_menu` VALUES ('6', '操作日志', '1', '/system/log/list/1', 'fa-info-circle', '5', '2', '0105', 'log');
INSERT INTO `sys_menu` VALUES ('5d3dd56c16ff4e32aecae1b3228159c7', '查看日志列表', '5', null, null, '0', '3', '010500', 'listLog');

INSERT INTO `sys_menu` VALUES ('7', '系统配置', '1', '/system/setting/page', ' fa-cog', '6', '2', '0106', 'setting');
INSERT INTO `sys_menu` VALUES ('0818e1c76bbd44eba3a698547ec4e637', '查询系统设置', '10', null, null, '0', '3', '010600', 'listSetting');
INSERT INTO `sys_menu` VALUES ('915c309ebe5047b68645b3eb777dd8c9', '操作系统设置', '10', null, null, '1', '3', '010601', 'doSetting');

INSERT INTO `sys_menu` VALUES ('8', '系统监控', '1', '/system/monitor/list', 'fa-eye', '7', '2', '0107', null);
INSERT INTO `sys_menu` VALUES ('42dd5ae31e3a43b3a197440e8ec19a94', '监控列表', 'f5a20c82110b4a3ea9e30ca01a038680', null, null, '1', '3', '010701', 'monitorList');


INSERT INTO `sys_menu` VALUES ('9', '接口自动化测试', '0', null, 'fa fa-graduation-cap', '1', '1', '09', null);
INSERT INTO `sys_menu` VALUES ('3622778e78336a68210b2590163af943', '项目管理', '9', '/u/project/list/1', 'fa-pencil-square ', '2', '2', '0901', 'role');
INSERT INTO `sys_menu` VALUES ('488ef1wwf57b4827acad47c0744278ce', '用例管理', '9', '/u/testcase/list/1', 'fa-sitemap ', '3', '2', '0903', 'menu');
INSERT INTO `sys_menu` VALUES ('f899f223baec4571b1c786717f9906fd', '测试报告', '9', '/u/testcase/list/1', 'fa-line-chart', '4', '2', '0904', 'dept');


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(300) DEFAULT NULL COMMENT '角色描述',
  `roleState` int(2) DEFAULT '1' COMMENT '状态,1-启用,-1禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('6a2994e4788a44f0973b5ca6ac4b6d73', '普通用户', '', '1', '2018-04-12 18:41:40');
INSERT INTO `sys_role` VALUES ('b1f9ce5543a049be9f169a3f5e6b72a8', '管理员', '管理员', '1', '2017-09-14 15:02:16');
INSERT INTO `sys_role` VALUES ('21f45e5543a049be9f169a3f5e6b72a8', '超级管理员', '超级管理员', '1', '2017-09-14 15:02:16');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `roleId` varchar(50) NOT NULL COMMENT '角色主键',
  `menuId` varchar(50) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('11b76a04dd8c459f8f4d68a06763b802', '21f45e5543a049be9f169a3f5e6b72a8', '1');
INSERT INTO `sys_role_menu` VALUES ('5e0a6c9cff0643958fab11b9f8a8ea08', '21f45e5543a049be9f169a3f5e6b72a8', '2');
INSERT INTO `sys_role_menu` VALUES ('e29b230a3ff64ad49f74ca4b125ba3bf', '21f45e5543a049be9f169a3f5e6b72a8', '3');
INSERT INTO `sys_role_menu` VALUES ('d1b4dddd8d1e406798ea9300216262e1', '21f45e5543a049be9f169a3f5e6b72a8', '4');
INSERT INTO `sys_role_menu` VALUES ('f8cc1cc16e454dd7a1d52f6e514a18fa', '21f45e5543a049be9f169a3f5e6b72a8', '5');
INSERT INTO `sys_role_menu` VALUES ('ds2c1cc16e454dd7a1d52f6ffeea18fa', '21f45e5543a049be9f169a3f5e6b72a8', '6');
INSERT INTO `sys_role_menu` VALUES ('d32c1cc16e433444a1d52f6ffeea18fa', '21f45e5543a049be9f169a3f5e6b72a8', '7');
INSERT INTO `sys_role_menu` VALUES ('es2c1cc1344544b7a1d52f6ffeea18fa', '21f45e5543a049be9f169a3f5e6b72a8', '8');
INSERT INTO `sys_role_menu` VALUES ('f107a8e1de88458988be9b695c2e0158', '21f45e5543a049be9f169a3f5e6b72a8', '9');
INSERT INTO `sys_role_menu` VALUES ('0ecc3d807d83448499aacadd5cda5637', '21f45e5543a049be9f169a3f5e6b72a8', 'd2bc30feb5474a1bb7e02d48d39a3f8a');
INSERT INTO `sys_role_menu` VALUES ('e2804303f6114611aa65aff1b5f1b46c', '21f45e5543a049be9f169a3f5e6b72a8', 'a73802e513cc4465883530ec8074abbb');
INSERT INTO `sys_role_menu` VALUES ('ebb2062ec9ef49bab2224c87a8aa63b2', '21f45e5543a049be9f169a3f5e6b72a8', '4253190001c1480fb0d631d64d150535');
INSERT INTO `sys_role_menu` VALUES ('e3502b6645f64f01925b485f161c51e3', '21f45e5543a049be9f169a3f5e6b72a8', '649b484b58414d91aefa5a26143e6557');
INSERT INTO `sys_role_menu` VALUES ('r6e96d1955114103b1cb571e1c2b4f86', '21f45e5543a049be9f169a3f5e6b72a8', '1db9105008404a3485b6fac30dba3c0e');
INSERT INTO `sys_role_menu` VALUES ('91c2e8d5040747948409a634adf60271', '21f45e5543a049be9f169a3f5e6b72a8', '60dda993d87647f5989c15f14f866df9');
INSERT INTO `sys_role_menu` VALUES ('81eb2b402c384dd180521dfc337394a0', '21f45e5543a049be9f169a3f5e6b72a8', '686630c7cb624cc786dcdc9958971a6b');
INSERT INTO `sys_role_menu` VALUES ('713e3804f2fc46bfb9f232c4c4b5f902', '21f45e5543a049be9f169a3f5e6b72a8', 'b4e7232189b14cf3ba160cf7b0d3bf37');
INSERT INTO `sys_role_menu` VALUES ('7446e167ca8847939e2c1e70fa73d82c', '21f45e5543a049be9f169a3f5e6b72a8', 'a5ebf29168234406939856bc6890c86b');
INSERT INTO `sys_role_menu` VALUES ('58f5996eae5040379147e1d1e8ec6af2', '21f45e5543a049be9f169a3f5e6b72a8', 'f899f3d3baec4571b1c786717f9906fd');
INSERT INTO `sys_role_menu` VALUES ('4f038b4f8e614bd0b914152d97f81f9d', '21f45e5543a049be9f169a3f5e6b72a8', '488ef1eff57b4827acade7c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('32d9b502291642fd90fb607e857971f3', '21f45e5543a049be9f169a3f5e6b72a8', '3f26102ef0e04c3c9328cb97067cc5fa');
INSERT INTO `sys_role_menu` VALUES ('18443a9336684248a93c32c3f1f39496', '21f45e5543a049be9f169a3f5e6b72a8', 'dc5f478d98ed4297a8ae638fe90df050');
INSERT INTO `sys_role_menu` VALUES ('6ce360f268844051bec8d0954984e420', '21f45e5543a049be9f169a3f5e6b72a8', '0c9b5fc8b44b41d1871a8fc8300247ec');
INSERT INTO `sys_role_menu` VALUES ('8564cce7aaea4b77b968e3985784e6c7', '21f45e5543a049be9f169a3f5e6b72a8', '4e816a9854714d24b0413d929d637a2b');
INSERT INTO `sys_role_menu` VALUES ('40c0039fbe6047f7afb58f2b00a24c86', '21f45e5543a049be9f169a3f5e6b72a8', '3fb6a7a5935b4efabf3de82e7e1baeb6');
INSERT INTO `sys_role_menu` VALUES ('39acf71769434f738586530d99c16670', '21f45e5543a049be9f169a3f5e6b72a8', '363a778e78a346a68210b2590163a943');
INSERT INTO `sys_role_menu` VALUES ('4be3a4fa4373481e8220f5402fd835fb', '21f45e5543a049be9f169a3f5e6b72a8', '79d78b8357174cac8f44abd275dec597');
INSERT INTO `sys_role_menu` VALUES ('5038826d16ca4766a7178f442641c29d', '21f45e5543a049be9f169a3f5e6b72a8', '5d3dd56c16ff4e32aecae1b3228159c7');
INSERT INTO `sys_role_menu` VALUES ('468990cf0f994704870acdc5aeea401c', '21f45e5543a049be9f169a3f5e6b72a8', '0818e1c76bbd44eba3a698547ec4e637');
INSERT INTO `sys_role_menu` VALUES ('6f3dead181134af9a4f47b52a89624f9', '21f45e5543a049be9f169a3f5e6b72a8', '915c309ebe5047b68645b3eb777dd8c9');
INSERT INTO `sys_role_menu` VALUES ('7ff2e24e7e2440088dbaf38ae1d70ffc', '21f45e5543a049be9f169a3f5e6b72a8', '42dd5ae31e3a43b3a197440e8ec19a94');
INSERT INTO `sys_role_menu` VALUES ('633d29462c8e444b978b84e86909735f', '21f45e5543a049be9f169a3f5e6b72a8', '3622778e78336a68210b2590163af943');
INSERT INTO `sys_role_menu` VALUES ('4ab09fed55274315a8301967ff9b62b8', '21f45e5543a049be9f169a3f5e6b72a8', '488ef1wwf57b4827acad47c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('3bdf96df9dce4a8686706cdc647285ad', '21f45e5543a049be9f169a3f5e6b72a8', 'f899f223baec4571b1c786717f9906fd');


INSERT INTO `sys_role_menu` VALUES ('11b76a04838c459f8f4d68a06763b802', 'b1f9ce5543a049be9f169a3f5e6b72a8', '1');
INSERT INTO `sys_role_menu` VALUES ('5e0a6c9c570643958fab11b9f8a8ea08', 'b1f9ce5543a049be9f169a3f5e6b72a8', '2');
INSERT INTO `sys_role_menu` VALUES ('e29b230a32a64ad49f74ca4b125ba3bf', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3');
INSERT INTO `sys_role_menu` VALUES ('d1b47beb8d1e406798ea9300216262e1', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4');
INSERT INTO `sys_role_menu` VALUES ('f8cc1cc16e4544b7a1d52f6e514a18fa', 'b1f9ce5543a049be9f169a3f5e6b72a8', '5');
INSERT INTO `sys_role_menu` VALUES ('33eea8e1de88458988be9b695c2e0158', 'b1f9ce5543a049be9f169a3f5e6b72a8', '9');
INSERT INTO `sys_role_menu` VALUES ('334r3d807d83448499aacadd5cda5637', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'd2bc30feb5474a1bb7e02d48d39a3f8a');
INSERT INTO `sys_role_menu` VALUES ('12804303f6114611aa65aff1b5f1b46c', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'a73802e513cc4465883530ec8074abbb');
INSERT INTO `sys_role_menu` VALUES ('1bb2062ec9ef49bab2224c87a8aa63b2', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4253190001c1480fb0d631d64d150535');
INSERT INTO `sys_role_menu` VALUES ('23502b6645f64f01925b485f161c51e3', 'b1f9ce5543a049be9f169a3f5e6b72a8', '649b484b58414d91aefa5a26143e6557');
INSERT INTO `sys_role_menu` VALUES ('26e96d1955114103b1cb571e1c2b4f86', 'b1f9ce5543a049be9f169a3f5e6b72a8', '1db9105008404a3485b6fac30dba3c0e');
INSERT INTO `sys_role_menu` VALUES ('31c2e8d5040747948409a634adf60271', 'b1f9ce5543a049be9f169a3f5e6b72a8', '60dda993d87647f5989c15f14f866df9');
INSERT INTO `sys_role_menu` VALUES ('31eb2b402c384dd180521dfc337394a0', 'b1f9ce5543a049be9f169a3f5e6b72a8', '686630c7cb624cc786dcdc9958971a6b');
INSERT INTO `sys_role_menu` VALUES ('513e3804f2fc46bfb9f232c4c4b5f902', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'b4e7232189b14cf3ba160cf7b0d3bf37');
INSERT INTO `sys_role_menu` VALUES ('6446e167ca8847939e2c1e70fa73d82c', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'a5ebf29168234406939856bc6890c86b');
INSERT INTO `sys_role_menu` VALUES ('68f5996eae5040379147e1d1e8ec6af2', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'f899f3d3baec4571b1c786717f9906fd');
INSERT INTO `sys_role_menu` VALUES ('6f038b4f8e614bd0b914152d97f81f9d', 'b1f9ce5543a049be9f169a3f5e6b72a8', '488ef1eff57b4827acade7c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('72d9b502291642fd90fb607e857971f3', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3f26102ef0e04c3c9328cb97067cc5fa');
INSERT INTO `sys_role_menu` VALUES ('78443a9336684248a93c32c3f1f39496', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'dc5f478d98ed4297a8ae638fe90df050');
INSERT INTO `sys_role_menu` VALUES ('7ce360f268844051bec8d0954984e420', 'b1f9ce5543a049be9f169a3f5e6b72a8', '0c9b5fc8b44b41d1871a8fc8300247ec');
INSERT INTO `sys_role_menu` VALUES ('8064cce7aaea4b77b968e3985784e6c7', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4e816a9854714d24b0413d929d637a2b');
INSERT INTO `sys_role_menu` VALUES ('80c0039fbe6047f7afb58f2b00a24c86', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3fb6a7a5935b4efabf3de82e7e1baeb6');
INSERT INTO `sys_role_menu` VALUES ('89acf71769434f738586530d99c16670', 'b1f9ce5543a049be9f169a3f5e6b72a8', '363a778e78a346a68210b2590163a943');
INSERT INTO `sys_role_menu` VALUES ('8be3a4fa4373481e8220f5402fd835fb', 'b1f9ce5543a049be9f169a3f5e6b72a8', '79d78b8357174cac8f44abd275dec597');
INSERT INTO `sys_role_menu` VALUES ('a33d29462c8e444b978b84e86909735f', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3622778e78336a68210b2590163af943');
INSERT INTO `sys_role_menu` VALUES ('bab09fed55274315a8301967ff9b62b8', 'b1f9ce5543a049be9f169a3f5e6b72a8', '488ef1wwf57b4827acad47c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('bbdf96df9dce4a8686706cdc647285ad', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'f899f223baec4571b1c786717f9906fd');


INSERT INTO `sys_role_menu` VALUES ('d46e82e549674dd8ace014447cde2c4c', '6a2994e4788a44f0973b5ca6ac4b6d73', '9');
INSERT INTO `sys_role_menu` VALUES ('af1ac01b32c745c78bd76be55320885c', '6a2994e4788a44f0973b5ca6ac4b6d73', '3622778e78336a68210b2590163af943');
INSERT INTO `sys_role_menu` VALUES ('a2902ebf93864380afa099dc285e114e', '6a2994e4788a44f0973b5ca6ac4b6d73', '488ef1wwf57b4827acad47c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('8c6e917c832d4ec986bf04bcc9597ddc', '6a2994e4788a44f0973b5ca6ac4b6d73', 'f899f223baec4571b1c786717f9906fd');

-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `sysKey` varchar(50) NOT NULL COMMENT 'KEY',
  `sysName` varchar(50) NOT NULL COMMENT '名称',
  `sysValue` varchar(300) DEFAULT NULL COMMENT '值',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `sysDesc` varchar(300) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
INSERT INTO `sys_setting` VALUES ('1', 'systemName', '系统名称', 'luckincoffeeAuto', '0', null);
INSERT INTO `sys_setting` VALUES ('2', 'systemSubName', '系统简称', '接口测试平台', '1', null);
INSERT INTO `sys_setting` VALUES ('3', 'bottomCopyright', '许可说明', 'Copyright © 2018LuckinCoffee. All rights reserved.', '2', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `userState` int(2) NOT NULL DEFAULT '1' COMMENT '用户状态,1-启用,-1禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `userDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  `userImg` varchar(300) DEFAULT 'http://news.mydrivers.com/Img/20110518/04481549.png' COMMENT '头像',
  `deptId` varchar(50) DEFAULT NULL COMMENT '部门主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('45300712cbc343d3998a065164b72067', 'test', '4292bb58be34c59d28a0dcbd11932d49', '1', '2018-04-12 18:42:05', '', '/app/images/header.png', 'yfb44429b597d754c4180c6b40cdfb0f565');
INSERT INTO `sys_user` VALUES ('55444431f9f74dfbae585b87b0cde933', 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', '1', '2017-09-14 15:02:17', '', '/app/images/header.png', 'djcpt329b597d754c4180c6b40cdfb0f565');
INSERT INTO `sys_user` VALUES ('c79ba431f9f74dfbae585b87b0cde933', 'super', '786491ff91b798e6eebf68bf28ddd847', '1', '2017-09-14 15:02:17', '', '/app/images/header.png', 'djcpt329b597d754c4180c6b40cdfb0f565');


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '用户主键',
  `roleId` varchar(50) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('4530ddddcbc343d3998a065164b72067', '45300712cbc343d3998a065164b72067', '6a2994e4788a44f0973b5ca6ac4b6d73');
INSERT INTO `sys_user_role` VALUES ('cc57a825df4f4a15a417be1e58cc4ae7', '55444431f9f74dfbae585b87b0cde933', 'b1f9ce5543a049be9f169a3f5e6b72a8');
INSERT INTO `sys_user_role` VALUES ('b63941907fd046fab09ce0930489bbe2', 'c79ba431f9f74dfbae585b87b0cde933', '21f45e5543a049be9f169a3f5e6b72a8');

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `projectName` varchar(100) NOT NULL COMMENT '部门名称',
  `projectHost` varchar(100) DEFAULT NULL COMMENT '项目Host',
  `projectDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';



DROP TABLE IF EXISTS `testcase`;
CREATE TABLE `testcase` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `testcaseName` varchar(100) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `contenttype` varchar(100) NOT NULL,
  `createTime` datetime NOT NULL,
  `parameter` varchar(5000) NOT NULL,
  `path` varchar(100) NOT NULL,
  `projectId` varchar(50) DEFAULT NULL COMMENT '项目主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试用例表';

