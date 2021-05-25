/*
 Navicat Premium Data Transfer

 Source Server         : 本地8.0.23
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_bluejay_system

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/05/2021 17:01:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_sys_admin_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_admin_token`;
CREATE TABLE `tb_sys_admin_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '获取token的来源',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '令牌值',
  `expires` int(16) NULL DEFAULT NULL COMMENT '过期时间(秒)',
  `exp_status` tinyint(1) NULL DEFAULT NULL COMMENT '0正常 1禁用 2过期',
  `disable_start_date` datetime(6) NULL DEFAULT NULL COMMENT '禁用开始时间',
  `disable_end_date` datetime(6) NULL DEFAULT NULL COMMENT '禁用结束时间',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统令牌数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_admin_token
-- ----------------------------
INSERT INTO `tb_sys_admin_token` VALUES (2, 'admin', '74c4112b-d97c-453f-96bd-c9dca80d51b7', 2592000, 0, NULL, NULL, '2021-05-19 22:07:57.156215', '2021-05-19 22:07:57.156215');
INSERT INTO `tb_sys_admin_token` VALUES (3, 'admin', '8fd06308-8d7a-43e3-a2aa-38c0cd317e95', 2592000, 0, NULL, NULL, '2021-05-21 13:56:24.258592', '2021-05-21 13:56:24.258592');
INSERT INTO `tb_sys_admin_token` VALUES (4, 'admin', 'c67c507c-e69d-4d4c-b855-f57e01d77494', 2592000, 0, NULL, NULL, '2021-05-21 14:47:42.217662', '2021-05-21 14:47:42.217662');
INSERT INTO `tb_sys_admin_token` VALUES (5, 'admin', '44e657ed-75b7-47af-a7cb-714cae556a0a', 2592000, 0, NULL, NULL, '2021-05-24 22:38:58.528186', '2021-05-24 22:38:58.528186');
INSERT INTO `tb_sys_admin_token` VALUES (6, 'admin', 'b2c73a80-2bb8-4f39-bb5b-d34dfe8e6c5c', 2592000, 0, NULL, NULL, '2021-05-24 22:40:46.993091', '2021-05-24 22:40:46.993091');
INSERT INTO `tb_sys_admin_token` VALUES (7, 'admin', '372a53c3-9634-4c8c-9ce3-c043a5642e3d', 2592000, 0, NULL, NULL, '2021-05-24 22:41:06.267963', '2021-05-24 22:41:06.267963');

-- ----------------------------
-- Table structure for tb_sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_authority`;
CREATE TABLE `tb_sys_authority`  (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限码',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0正常 1停用',
  `create_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_authority
-- ----------------------------
INSERT INTO `tb_sys_authority` VALUES (1, '系统设置', 'system:sys_settings', 0, '2021-05-11 14:05:49.519742', '2021-05-19 09:14:20.162763');
INSERT INTO `tb_sys_authority` VALUES (2, '菜单管理', 'system:menu_admin', 0, '2021-05-11 14:07:33.037578', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (3, '用户管理', 'system:user_admin', 0, '2021-05-11 14:08:20.574955', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (6, '新增用户', 'system:sysuser:add', 0, '2021-05-17 09:33:23.149811', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (7, '查询用户', 'system:sysuser:query', 0, '2021-05-17 09:33:44.824247', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (8, '修改用户', 'system:sysuser:edit', 0, '2021-05-17 09:34:05.855442', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (9, '删除用户', 'system:sysuser:remove', 0, '2021-05-17 09:34:13.885826', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (10, '新增角色', 'system:sysrole:add', 0, '2021-05-17 09:33:23.149811', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (11, '查询角色', 'system:sysrole:query', 0, '2021-05-17 09:33:44.824247', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (12, '修改角色', 'system:sysrole:edit', 0, '2021-05-17 09:34:05.855442', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (13, '删除角色', 'system:sysrole:remove', 0, '2021-05-17 09:34:13.885826', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (14, '新增菜单', 'system:sysmenu:add', 0, '2021-05-17 09:36:12.568225', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (15, '修改菜单', 'system:sysmenu:edit', 0, '2021-05-17 09:36:22.962545', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (16, '查询菜单', 'system:sysmenu:query', 0, '2021-05-17 09:36:34.738005', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (17, '删除菜单', 'system:sysmenu:remove', 0, '2021-05-17 09:36:41.962213', '2021-05-17 18:02:13.797461');
INSERT INTO `tb_sys_authority` VALUES (20, '字典管理', 'system:sysdict:list', 0, '2021-05-18 00:00:47.521393', '2021-05-18 16:02:34.439409');
INSERT INTO `tb_sys_authority` VALUES (21, '修改字典', 'system:sysdict:edit', 0, '2021-05-18 14:00:43.381109', '2021-05-18 16:02:15.383916');
INSERT INTO `tb_sys_authority` VALUES (22, '删除字典', 'system:sysdict:remove', 0, '2021-05-18 14:01:10.608328', '2021-05-18 16:02:23.472115');
INSERT INTO `tb_sys_authority` VALUES (23, '新增字典', 'system:sysdict:add', 0, '2021-05-18 14:01:17.081335', '2021-05-18 16:02:26.547944');
INSERT INTO `tb_sys_authority` VALUES (24, '导出字典', 'system:sysdict:export', 0, '2021-05-18 14:01:30.874440', '2021-05-18 16:02:28.610824');
INSERT INTO `tb_sys_authority` VALUES (25, '字典数据', 'system:sysdictdata:list', 0, '2021-05-18 16:52:07.051873', '2021-05-18 16:52:07.051873');
INSERT INTO `tb_sys_authority` VALUES (26, '修改字典项', 'system:sysdictdata:edit', 0, '2021-05-19 09:08:37.040156', '2021-05-19 09:08:37.040156');
INSERT INTO `tb_sys_authority` VALUES (27, '删除字典项', 'system:sysdictdata:remove', 0, '2021-05-19 09:09:01.035733', '2021-05-19 09:09:01.035733');
INSERT INTO `tb_sys_authority` VALUES (28, '新增字典项', 'system:sysdictdata:add', 0, '2021-05-19 09:09:19.130003', '2021-05-19 09:09:19.130003');
INSERT INTO `tb_sys_authority` VALUES (29, '令牌管理', 'system:systoken:list', 0, '2021-05-19 09:22:44.152905', '2021-05-19 09:22:44.152905');
INSERT INTO `tb_sys_authority` VALUES (30, '令牌续期', 'system:sysadmintoken:renewal', 0, '2021-05-19 17:41:58.689739', '2021-05-19 17:41:58.689739');
INSERT INTO `tb_sys_authority` VALUES (31, '令牌禁用', 'system:sysadmintoken:disable', 0, '2021-05-19 17:42:09.223284', '2021-05-19 17:42:09.223284');
INSERT INTO `tb_sys_authority` VALUES (32, '令牌下线', 'system:sysadmintoken:down', 0, '2021-05-19 17:42:39.229363', '2021-05-19 17:42:39.229363');
INSERT INTO `tb_sys_authority` VALUES (33, '令牌上线', 'system:sysadmintoken:up', 0, '2021-05-19 17:42:44.103592', '2021-05-19 17:42:44.103592');
INSERT INTO `tb_sys_authority` VALUES (34, '服务接口管理', 'system:serviceapi', 0, '2021-05-19 23:28:53.786220', '2021-05-19 23:28:53.786220');
INSERT INTO `tb_sys_authority` VALUES (35, '接口管控', 'system:apigovern', 0, '2021-05-19 23:32:45.306167', '2021-05-21 11:31:08.808401');

-- ----------------------------
-- Table structure for tb_sys_authority_map_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_authority_map_resource`;
CREATE TABLE `tb_sys_authority_map_resource`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `authority_id` int(32) NULL DEFAULT NULL COMMENT '权限id',
  `resource_id` int(32) NULL DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_authority_map_resource
-- ----------------------------
INSERT INTO `tb_sys_authority_map_resource` VALUES (1, 1, 1);
INSERT INTO `tb_sys_authority_map_resource` VALUES (2, 2, 2);
INSERT INTO `tb_sys_authority_map_resource` VALUES (3, 3, 3);
INSERT INTO `tb_sys_authority_map_resource` VALUES (5, 14, 5);
INSERT INTO `tb_sys_authority_map_resource` VALUES (6, 17, 6);
INSERT INTO `tb_sys_authority_map_resource` VALUES (7, 15, 7);
INSERT INTO `tb_sys_authority_map_resource` VALUES (8, 6, 8);
INSERT INTO `tb_sys_authority_map_resource` VALUES (9, 8, 9);
INSERT INTO `tb_sys_authority_map_resource` VALUES (10, 9, 10);
INSERT INTO `tb_sys_authority_map_resource` VALUES (11, 7, 11);
INSERT INTO `tb_sys_authority_map_resource` VALUES (13, 3, 13);
INSERT INTO `tb_sys_authority_map_resource` VALUES (18, 16, 18);
INSERT INTO `tb_sys_authority_map_resource` VALUES (19, 10, 19);
INSERT INTO `tb_sys_authority_map_resource` VALUES (20, 11, 20);
INSERT INTO `tb_sys_authority_map_resource` VALUES (21, 12, 21);
INSERT INTO `tb_sys_authority_map_resource` VALUES (22, 13, 22);
INSERT INTO `tb_sys_authority_map_resource` VALUES (23, 20, 27);
INSERT INTO `tb_sys_authority_map_resource` VALUES (24, 21, 28);
INSERT INTO `tb_sys_authority_map_resource` VALUES (25, 22, 30);
INSERT INTO `tb_sys_authority_map_resource` VALUES (26, 23, 31);
INSERT INTO `tb_sys_authority_map_resource` VALUES (27, 24, 32);
INSERT INTO `tb_sys_authority_map_resource` VALUES (28, 25, 29);
INSERT INTO `tb_sys_authority_map_resource` VALUES (29, 26, 33);
INSERT INTO `tb_sys_authority_map_resource` VALUES (30, 27, 34);
INSERT INTO `tb_sys_authority_map_resource` VALUES (31, 28, 35);
INSERT INTO `tb_sys_authority_map_resource` VALUES (32, 29, 36);
INSERT INTO `tb_sys_authority_map_resource` VALUES (34, 30, 37);
INSERT INTO `tb_sys_authority_map_resource` VALUES (36, 31, 38);
INSERT INTO `tb_sys_authority_map_resource` VALUES (38, 32, 39);
INSERT INTO `tb_sys_authority_map_resource` VALUES (40, 33, 40);
INSERT INTO `tb_sys_authority_map_resource` VALUES (42, 34, 41);
INSERT INTO `tb_sys_authority_map_resource` VALUES (43, 35, 42);

-- ----------------------------
-- Table structure for tb_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_dict`;
CREATE TABLE `tb_sys_dict`  (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `is_system` tinyint(1) NULL DEFAULT 0 COMMENT '是否为系统内置 0是 1否',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0正常 1停用',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_dict
-- ----------------------------
INSERT INTO `tb_sys_dict` VALUES (1, 'appConfig', '系统配置', NULL, 0, 0, '2021-05-16 19:00:58.291781', '2021-05-18 14:30:46.492365');
INSERT INTO `tb_sys_dict` VALUES (4, 'sys_status', '系统通用状态', NULL, 0, 0, '2021-05-17 12:41:23.388993', '2021-05-18 14:30:49.332320');
INSERT INTO `tb_sys_dict` VALUES (6, 'sys_user_gender', '系统用户性别', NULL, 0, 0, '2021-05-17 17:15:12.006981', '2021-05-18 14:30:52.345019');
INSERT INTO `tb_sys_dict` VALUES (8, 'exp_status', '到期状态', NULL, 0, 0, '2021-05-19 10:44:37.493274', '2021-05-19 10:44:37.493274');

-- ----------------------------
-- Table structure for tb_sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_dict_item`;
CREATE TABLE `tb_sys_dict_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_id` int(11) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典值',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` tinyint(2) NULL DEFAULT 0 COMMENT '排序值 越小越靠前 从0开始 升序',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '字典状态 0正常 1禁用',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_dict_item
-- ----------------------------
INSERT INTO `tb_sys_dict_item` VALUES (1, 1, 'https://gitee.com/mydearzwj/image/raw/master/img/go-admin.png', 'sysAppLogo', '系统logo', '系统LOGO', 0, 0, '2021-05-18 14:37:55.882875', '2021-05-18 15:07:53.757657');
INSERT INTO `tb_sys_dict_item` VALUES (2, 1, '蓝鸟API管理系统', 'sysAppName', '系统名称', '系统名称', 0, 0, '2021-05-18 14:38:12.309370', '2021-05-18 15:07:58.119989');
INSERT INTO `tb_sys_dict_item` VALUES (3, 4, '0', NULL, '正常', '正常', 0, 0, '2021-05-18 14:39:37.704070', '2021-05-18 15:08:12.320862');
INSERT INTO `tb_sys_dict_item` VALUES (4, 4, '1', NULL, '隐藏', '隐藏', 0, 0, '2021-05-18 14:39:46.022045', '2021-05-19 09:14:54.384263');
INSERT INTO `tb_sys_dict_item` VALUES (5, 6, '0', NULL, '女', '女', 0, 0, '2021-05-18 14:40:14.496322', '2021-05-18 15:08:27.751561');
INSERT INTO `tb_sys_dict_item` VALUES (6, 6, '1', NULL, '男', '男', 0, 0, '2021-05-18 14:40:22.187536', '2021-05-18 15:08:27.760659');
INSERT INTO `tb_sys_dict_item` VALUES (7, 4, '2', NULL, '禁用', '禁用', 0, 0, '2021-05-19 09:15:05.634952', '2021-05-19 09:15:05.634952');

-- ----------------------------
-- Table structure for tb_sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_resource`;
CREATE TABLE `tb_sys_resource`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源标题',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源名称',
  `component` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件名称',
  `parent_id` int(32) NOT NULL DEFAULT 0 COMMENT '父资源id 为0则为最高层',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源跳转路径',
  `is_frame` tinyint(1) NULL DEFAULT 2 COMMENT '是否外链 1是 2否',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '资源类型 1目录 2菜单 3按钮 4接口',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'icon路径',
  `sort` tinyint(1) NULL DEFAULT NULL COMMENT '排序值 从0开始 越小越靠前',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0正常 1停用',
  `create_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_resource
-- ----------------------------
INSERT INTO `tb_sys_resource` VALUES (1, '系统设置', 'sys_settings', 'Layout', 0, '/upms', 1, 1, 'example', 0, 0, '2021-05-11 14:09:39.075690', '2021-05-21 13:41:40.161909');
INSERT INTO `tb_sys_resource` VALUES (2, '菜单管理', 'menu_admin', '/menu/index', 1, 'menu', 1, 2, 'tree-table', 1, 0, '2021-05-11 14:10:25.725081', '2021-05-21 13:41:40.178702');
INSERT INTO `tb_sys_resource` VALUES (3, '用户管理', 'user_admin', '/sysuser/index', 1, '/sysuser', 1, 2, 'user', 0, 0, '2021-05-11 14:12:13.744556', '2021-05-21 13:41:40.188736');
INSERT INTO `tb_sys_resource` VALUES (5, '增加菜单按钮', 'menu_add', NULL, 2, '/sys/menu/add', 1, 3, '', 0, 0, '2021-05-11 14:22:06.096318', '2021-05-21 13:41:40.190961');
INSERT INTO `tb_sys_resource` VALUES (6, '删除菜单按钮', 'menu_del', NULL, 2, '/sys/menu/del', 1, 3, '', 0, 0, '2021-05-11 14:22:26.072748', '2021-05-21 13:41:40.193000');
INSERT INTO `tb_sys_resource` VALUES (7, '修改菜单按钮', 'menu_edit', NULL, 2, '/sys/menu/update', 1, 3, '', 0, 0, '2021-05-11 14:24:09.899897', '2021-05-21 13:41:40.194815');
INSERT INTO `tb_sys_resource` VALUES (8, '新增用户按钮', 'user_add', NULL, 3, '/sys/user/add', 1, 3, '', 0, 0, '2021-05-11 14:24:52.500029', '2021-05-21 13:41:40.196906');
INSERT INTO `tb_sys_resource` VALUES (9, '修改用户按钮', 'user_update', NULL, 3, '/sys/user/update', 1, 3, '', 0, 0, '2021-05-11 14:25:18.845752', '2021-05-21 13:41:40.198711');
INSERT INTO `tb_sys_resource` VALUES (10, '删除用户按钮', 'user_remove', NULL, 3, '/sys/user/disable', 1, 3, '', 0, 0, '2021-05-11 14:26:40.170170', '2021-05-21 13:41:40.201002');
INSERT INTO `tb_sys_resource` VALUES (11, '查询用户按钮', 'user_query', NULL, 3, '/sys/user/enable', 1, 3, '', 0, 0, '2021-05-11 14:27:29.032492', '2021-05-21 13:41:40.203602');
INSERT INTO `tb_sys_resource` VALUES (13, '角色权限', 'Roles', '/role/index', 1, 'role', 1, 2, 'peoples', 2, 0, '2021-05-15 16:31:44.043611', '2021-05-21 13:41:40.205747');
INSERT INTO `tb_sys_resource` VALUES (18, '查询菜单按钮', 'menu_query', NULL, 2, '/uaa/sys/resource/query', 1, 3, '', 1, 0, '2021-05-17 09:38:37.981592', '2021-05-21 13:41:40.207544');
INSERT INTO `tb_sys_resource` VALUES (19, '新增角色按钮', 'role_add', NULL, 13, '/uaa/sys/role/add', 1, 3, '', 0, 0, '2021-05-17 09:42:41.984938', '2021-05-21 13:41:40.209407');
INSERT INTO `tb_sys_resource` VALUES (20, '查询角色按钮', 'role_query', NULL, 13, '/uaa/sys/role/query', 1, 3, '', 1, 0, '2021-05-17 09:43:12.725178', '2021-05-21 13:41:40.211342');
INSERT INTO `tb_sys_resource` VALUES (21, '修改角色按钮', 'role_edit', NULL, 13, '/uaa/sys/role/update', 1, 3, '', 2, 0, '2021-05-17 09:43:29.814118', '2021-05-21 13:41:40.214065');
INSERT INTO `tb_sys_resource` VALUES (22, '删除角色按钮', 'role_remove', NULL, 13, '/uaa/sys/role/remove', 1, 3, '', 3, 0, '2021-05-17 09:43:36.322794', '2021-05-21 13:41:40.215996');
INSERT INTO `tb_sys_resource` VALUES (27, '字典管理', 'Dict', '/dict/index', 1, 'dict', 1, 2, 'dict', 4, 0, '2021-05-18 00:00:47.514644', '2021-05-21 13:41:40.218348');
INSERT INTO `tb_sys_resource` VALUES (28, '修改字典按钮', 'editDict', NULL, 27, '/sys/dict/edit', 1, 3, '', 0, 0, '2021-05-18 14:03:46.101771', '2021-05-21 13:41:40.220493');
INSERT INTO `tb_sys_resource` VALUES (29, '字典数据', 'DictData', '/dict/data', 1, 'dict/data/:dictId', 1, 2, 'dict', 5, 1, '2021-05-18 16:52:07.042528', '2021-05-21 13:41:40.222495');
INSERT INTO `tb_sys_resource` VALUES (30, '删除字典按钮', 'removeDict', '', 27, '/sys/dict/remove', 1, 3, '', 1, 0, '2021-05-18 16:54:44.824999', '2021-05-21 13:41:40.224820');
INSERT INTO `tb_sys_resource` VALUES (31, '新增字典按钮', 'addDict', NULL, 27, '/sys/dict/add', 1, 3, '', 2, 0, '2021-05-18 16:55:16.078796', '2021-05-21 13:41:40.226816');
INSERT INTO `tb_sys_resource` VALUES (32, '导出字典按钮', 'exportDict', NULL, 27, '/sys/dict/export', 1, 3, '', 3, 0, '2021-05-18 16:55:46.397494', '2021-05-21 13:41:40.228825');
INSERT INTO `tb_sys_resource` VALUES (33, '修改字典项按钮', 'editDictItem', NULL, 29, NULL, 1, 3, '', 1, 0, '2021-05-19 09:10:40.450025', '2021-05-21 13:41:40.231006');
INSERT INTO `tb_sys_resource` VALUES (34, '删除字典项按钮', 'removeDictItem', NULL, 29, NULL, 1, 3, '', 2, 0, '2021-05-19 09:10:40.548132', '2021-05-21 13:41:40.232976');
INSERT INTO `tb_sys_resource` VALUES (35, '新增字典项按钮', 'addDictItem', NULL, 29, NULL, 1, 3, '', 0, 0, '2021-05-19 09:10:53.593361', '2021-05-21 13:41:40.235196');
INSERT INTO `tb_sys_resource` VALUES (36, '令牌管理', 'SysToken', '/systoken/index', 1, '/systoken', 1, 2, 'pass', 2, 0, '2021-05-19 09:22:44.143936', '2021-05-21 13:41:40.237671');
INSERT INTO `tb_sys_resource` VALUES (37, '令牌续期', 'TokenRenewal', NULL, 36, '/sys/admin/token3', 1, 3, '', 0, 0, '2021-05-19 17:43:38.670944', '2021-05-21 13:41:40.239385');
INSERT INTO `tb_sys_resource` VALUES (38, '令牌禁用', 'TokenDisable', NULL, 36, '/sys/admin/token2', 1, 3, '', 1, 0, '2021-05-19 17:43:40.826408', '2021-05-21 13:41:40.241681');
INSERT INTO `tb_sys_resource` VALUES (39, '令牌下线', 'TokenDown', NULL, 36, '/sys/admin/token1', 1, 3, '', 2, 0, '2021-05-19 17:43:41.642733', '2021-05-21 13:41:40.243412');
INSERT INTO `tb_sys_resource` VALUES (40, '令牌上线', 'TokenUp', NULL, 36, '/sys/admin/token', 1, 3, '', 3, 0, '2021-05-19 17:43:42.428900', '2021-05-21 13:41:40.245303');
INSERT INTO `tb_sys_resource` VALUES (41, '服务接口管理', 'ServiceApi', 'Layout', 0, '/service/api', 1, 1, 'druid', 1, 0, '2021-05-19 23:27:21.896369', '2021-05-21 13:41:40.247412');
INSERT INTO `tb_sys_resource` VALUES (42, '接口治理', 'ApiGovern', NULL, 41, 'http://localhost:9975/', 0, 2, 'bug', 0, 0, '2021-05-19 23:32:45.294632', '2021-05-21 13:50:28.970820');

-- ----------------------------
-- Table structure for tb_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_role`;
CREATE TABLE `tb_sys_role`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
  `is_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否为管理员 0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0正常 1停用',
  `create_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_role
-- ----------------------------
INSERT INTO `tb_sys_role` VALUES (1, '系统管理员', 'sys_admin', 1, 0, '2021-05-11 10:44:41.245261', '2021-05-17 11:30:47.974084');

-- ----------------------------
-- Table structure for tb_sys_role_map_authority
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_role_map_authority`;
CREATE TABLE `tb_sys_role_map_authority`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `role_id` int(32) NULL DEFAULT NULL COMMENT '角色id',
  `authority_id` int(32) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_role_map_authority
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user`;
CREATE TABLE `tb_sys_user`  (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录时的账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别 0女 1男',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0正常 1停用',
  `salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `create_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_user
-- ----------------------------
INSERT INTO `tb_sys_user` VALUES (1, 'admin', 'b13139f428996193792858db1fe27f2e', '18426437484', '978608372@qq.com', 'limOpsx', 1, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic4.zhimg.com%2F50%2Fv2-9c9a26c864f32d9ef58fd27ed0bde0ea_hd.jpg&refer=http%3A%2F%2Fpic4.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623760979&t=fa476eda210b24b4802086fbedb20c9e', 0, '99fbc52225204d63bd1b71d1803c88aa', '2021-05-11 10:24:35.476425', '2021-05-16 20:43:15.409198');

-- ----------------------------
-- Table structure for tb_sys_user_map_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user_map_role`;
CREATE TABLE `tb_sys_user_map_role`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL COMMENT '用户id',
  `role_id` int(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_user_map_role
-- ----------------------------
INSERT INTO `tb_sys_user_map_role` VALUES (1, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
