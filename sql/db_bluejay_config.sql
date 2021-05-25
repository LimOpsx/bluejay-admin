/*
 Navicat Premium Data Transfer

 Source Server         : 本地8.0.23
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_bluejay_config

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/05/2021 17:13:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (9, 'application-dev.yaml', 'dev', '#屏蔽nacos不停更新的日志\nlogging:\n  level:\n    com:\n      alibaba:\n        nacos:\n          client:\n            naming: warn\n\n\nmybatis-plus:\n  global-config:\n    db-config:\n      table-prefix: tb_\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', 'bcd144fae2ed3e155d3e2bea455b377a', '2021-05-11 06:58:13', '2021-05-14 07:06:52', 'nacos', '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (12, 'bluejay-tc-gateway-dev.yaml', 'dev', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-cb-uaa\n          uri: lb://bluejay-cb-uaa\n          predicates:\n            - Path=/uaa/**\n          filters:\n            - StripPrefix=1\n        # - id: bluejay-uaa-core\n        #   uri: lb://bluejay-uaa-core\n        #   predicates:\n        #     - Path=/auth/**\n        #   filters:\n        #     - StripPrefix=1\n        # - id: bluejay-bc-system\n        #   uri: lb://bluejay-bc-system\n        #   predicates:\n        #     - Path=/system/**\n        #   filters:\n        #     - StripPrefix=1\n      #以下为 跨域配置\n      globalcors:\n        cors-configurations:\n          \'[/**]\': \n            allow-credentials: true # 允许携带认证信息\n            allowedOriginPatterns: \"*\"    # 允许跨域的源(网站域名/ip)，设置*为全部\n            allowedMethods: \"*\"   # 允许跨域的method， 默认为GET和OPTIONS，设置*为全部\n            allowedHeaders: \"*\"   # 允许跨域请求里的head字段，设置*为全部', '92eeffd913c99af6ef4314eb00aa64d8', '2021-05-11 08:51:13', '2021-05-14 08:22:20', 'nacos', '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (33, 'bluejay-cb-uaa-dev.yaml', 'dev', 'spring:\n  # sa-token配置\n  sa-token:\n    # token名称 (同时也是cookie名称)\n    token-name: satoken\n    # token有效期，单位s 默认30天, -1代表永不过期\n    timeout: 2592000\n    # token临时有效期 (指定时间内无操作就视为token过期) 单位: 秒\n    activity-timeout: -1\n    # 是否允许同一账号并发登录 (为true时允许一起登录, 为false时新登录挤掉旧登录)\n    allow-concurrent-login: false\n    # 在多人登录同一账号时，是否共用一个token (为true时所有登录共用一个token, 为false时每次登录新建一个token)\n    is-share: true\n    # token风格\n    token-style: uuid\n    # 是否输出操作日志\n    is-log: true\n    # 关闭banner\n    is-v: false\n    # 不从cookie读取token\n    isReadCookie: false\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-flow-rules\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', '76f2e818c11e83881f73f9c97b821c50', '2021-05-14 08:21:10', '2021-05-25 09:02:28', NULL, '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (43, 'bluejay-cb-ga-dev.yaml', 'dev', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-${spring.profiles.active}-flow-rules.json\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', '7a571746fe90cdbe27ed70771d4d5d9b', '2021-05-21 03:39:23', '2021-05-21 03:39:23', NULL, '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (46, 'bluejay-cb-uaa-param-flow-rules', 'SENTINEL_GROUP', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 07:24:00', '2021-05-21 07:24:00', NULL, '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', 'uaa模块流控规则', NULL, NULL, 'json', NULL);
INSERT INTO `config_info` VALUES (48, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":2,\"count\":1000.0,\"gmtModified\":1621928583591,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"maxQueueingTimeMs\":10,\"resource\":\"/sys/resource/routes\",\"strategy\":0}]', '1d02bfff2d66148fa0c5e758e4fabf8c', '2021-05-21 08:26:56', '2021-05-25 07:43:04', NULL, '127.0.0.1', '', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', NULL, NULL, NULL, 'text', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
INSERT INTO `config_tags_relation` VALUES (9, '1.0.0版本', NULL, 'application-dev.yaml', 'dev', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', 3);
INSERT INTO `config_tags_relation` VALUES (12, '1.0.0版本', NULL, 'bluejay-tc-gateway-dev.yaml', 'dev', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', 4);

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\r\n    username: root\r\n    password: 123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      connection-init-sql: SELECT 1\r\n      maximum-pool-size: 30\r\n      minimum-idle: 10\r\n      connection-timeout: 30000\r\n  redis:\r\n    url: localhost:3306\r\n    lettuce:\r\n      pool:\r\n        max-wait: 3000ms\r\n        max-active: 30\r\n        max-idle: 5', '1c674d3b4e5fadfcd6a29d304f5c7256', '2021-05-10 22:48:05', '2021-05-10 14:48:05', 'nacos', '0:0:0:0:0:0:0:1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 2, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\r\n    username: root\r\n    password: 123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      connection-init-sql: SELECT 1\r\n      maximum-pool-size: 30\r\n      minimum-idle: 10\r\n      connection-timeout: 30000\r\n  redis:\r\n    url: localhost:3306\r\n    lettuce:\r\n      pool:\r\n        max-wait: 3000ms\r\n        max-active: 30\r\n        max-idle: 5', '1c674d3b4e5fadfcd6a29d304f5c7256', '2021-05-10 22:49:12', '2021-05-10 14:49:12', 'nacos', '0:0:0:0:0:0:0:1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 3, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:3306\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5', '04705a954a0a78f73766baf4c6cea325', '2021-05-10 22:50:12', '2021-05-10 14:50:12', 'nacos', '0:0:0:0:0:0:0:1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 4, 'bluejay-uaa-user-dev.yaml', 'dev', '', '\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"', 'a92a1d0210f6d2f2cc8c9f3aa54427e2', '2021-05-11 14:56:19', '2021-05-11 06:56:20', 'nacos', '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 5, 'bluejay-uaa-user-dev.yaml', 'dev', '', '\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"', 'a92a1d0210f6d2f2cc8c9f3aa54427e2', '2021-05-11 14:56:44', '2021-05-11 06:56:45', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 6, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5', 'a035d63fc312e6197575f38201158ad7', '2021-05-11 14:57:02', '2021-05-11 06:57:02', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 7, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', 'dcb3395081d6f19bd456cf20361c8d09', '2021-05-11 14:57:20', '2021-05-11 06:57:21', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 8, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', 'dcb3395081d6f19bd456cf20361c8d09', '2021-05-11 14:57:31', '2021-05-11 06:57:31', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 9, 'application-dev.yaml', 'dev', '', 'management:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"', '8c6ad5b0b9f315939d8ed40a3fac84e7', '2021-05-11 14:58:13', '2021-05-11 06:58:13', 'nacos', '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 10, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', '4be4a612241549a8d3cdc6b8eb712119', '2021-05-11 14:58:20', '2021-05-11 06:58:21', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 11, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', '4be4a612241549a8d3cdc6b8eb712119', '2021-05-11 14:58:28', '2021-05-11 06:58:28', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 12, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'a', '0cc175b9c0f1b6a831c399e269772661', '2021-05-11 16:51:13', '2021-05-11 08:51:13', 'nacos', '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (5, 13, 'pigx-gateway-dev.yml', 'DEFAULT_GROUP', '', 'gateway:\n  encode-key: \'pigxpigxpigxpigx\'\n\nswagger:\n  ignore-providers:\n    - pigx-auth\n    - pigx-tx-manager\n\nribbon:\n  rule:\n    gray-enabled: true\n\n# 验证码相关配置参考： http://t.cn/A647jEdu\naj:\n  captcha:\n    cache-type: redis\n    water-mark: pig4cloud', 'c9c6c4268b5df12740d28d5aeffb49ea', '2021-05-11 21:45:27', '2021-05-11 13:45:27', 'nacos', '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (4, 14, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5', '5d5af8fa1df298a30b5c30098d490c98', '2021-05-11 23:33:06', '2021-05-11 15:33:07', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (9, 15, 'application-dev.yaml', 'dev', '', 'management:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"', '8c6ad5b0b9f315939d8ed40a3fac84e7', '2021-05-12 09:39:18', '2021-05-12 01:39:18', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 16, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5', '0363b846d36d41b474096c4ddc672ff5', '2021-05-12 09:39:28', '2021-05-12 01:39:28', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (9, 17, 'application-dev.yaml', 'dev', '', 'management:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', '8589179232f9a783b8b9d57bbf74ba88', '2021-05-12 09:41:05', '2021-05-12 01:41:06', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 18, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadUserByUsername\"', 'da66cd0c6c089ef83ffe50e2e71d5043', '2021-05-12 10:19:06', '2021-05-12 02:19:07', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 19, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'a', '0cc175b9c0f1b6a831c399e269772661', '2021-05-12 13:46:39', '2021-05-12 05:46:39', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 20, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user\n        - id: bluejay-uaa-core\n          uri: lb//bluejay-uaa-core\n          predicates:\n            - Path=/auth', '004f739dbdd6fd31a64dbc800c5ed15a', '2021-05-12 13:46:58', '2021-05-12 05:46:59', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 21, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth', '68fe1caffd10e02562b260fde9b47fe1', '2021-05-12 13:51:55', '2021-05-12 05:51:56', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 22, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**', '2e902db153d72a11ac0da3236f1ab94c', '2021-05-12 13:54:37', '2021-05-12 05:54:37', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (9, 23, 'application-dev.yaml', 'dev', '', 'mybatis-plus:\n  global-config:\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', '579a5445cf661063f34966b7e95b9c2c', '2021-05-12 14:02:11', '2021-05-12 06:02:12', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 24, 'bluejay-bc-system-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadByUsername\"', 'a67c922c37bd4bb76df2ff3a44d4e5d2', '2021-05-12 16:53:03', '2021-05-12 08:53:03', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (23, 25, 'bluejay-bc-system-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadByUsername\"', 'a67c922c37bd4bb76df2ff3a44d4e5d2', '2021-05-12 16:53:26', '2021-05-12 08:53:27', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (23, 26, 'bluejay-bc-system-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:', '09d9d7bc961e00003dca4b24db1bedb6', '2021-05-12 16:53:39', '2021-05-12 08:53:39', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 27, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1', 'ddfefcdeb407d1bfcda6c268d249452d', '2021-05-13 13:50:46', '2021-05-13 05:50:46', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 28, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-bc-system\n          uri: lb://bluejay-bc-system\n          predicates:\n            - Path=/system/**', '8d3ffab2fce88683e9e388eca6a24ea1', '2021-05-13 14:06:25', '2021-05-13 06:06:25', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 29, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-bc-system\n          uri: lb://bluejay-bc-system\n          predicates:\n            - Path=/system/**\n      #以下为 跨域配置\n      default-filters:\n        - DedupeResponseHeader=Access-Control-Allow-Origin, RETAIN_UNIQUE\n      globalcors:\n        cors-configurations:\n          \'[/**]\': \n            allow-credentials: true # 允许携带认证信息\n            allowedOrigins: \"*\"    # 允许跨域的源(网站域名/ip)，设置*为全部\n            allowedMethods: \"*\"   # 允许跨域的method， 默认为GET和OPTIONS，设置*为全部\n            allowedHeaders: \"*\"   # 允许跨域请求里的head字段，设置*为全部', 'e8f40ef317d768e74e8a1506ada6714e', '2021-05-13 14:20:19', '2021-05-13 06:20:20', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 30, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-bc-system\n          uri: lb://bluejay-bc-system\n          predicates:\n            - Path=/system/**\n      #以下为 跨域配置\n      globalcors:\n        cors-configurations:\n          \'[/**]\': \n            allow-credentials: true # 允许携带认证信息\n            allowedOrigins: \"*\"    # 允许跨域的源(网站域名/ip)，设置*为全部\n            allowedMethods: \"*\"   # 允许跨域的method， 默认为GET和OPTIONS，设置*为全部\n            allowedHeaders: \"*\"   # 允许跨域请求里的head字段，设置*为全部', 'e5155c26e7804a888a05e126837c4ee2', '2021-05-13 14:23:50', '2021-05-13 06:23:51', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 31, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-bc-system\n          uri: lb://bluejay-bc-system\n          predicates:\n            - Path=/system/**\n      #以下为 跨域配置\n      globalcors:\n        cors-configurations:\n          \'[/**]\': \n            allow-credentials: true # 允许携带认证信息\n            allowedOriginPatterns: \"*\"    # 允许跨域的源(网站域名/ip)，设置*为全部\n            allowedMethods: \"*\"   # 允许跨域的method， 默认为GET和OPTIONS，设置*为全部\n            allowedHeaders: \"*\"   # 允许跨域请求里的head字段，设置*为全部', '573d819c1bc5552239606597507f3cf7', '2021-05-13 17:23:09', '2021-05-13 09:23:09', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (9, 32, 'application-dev.yaml', 'dev', '', '#屏蔽nacos不停更新的日志\nlogging:\n  level:\n    com:\n      alibaba:\n        nacos:\n          client:\n            naming: warn\n\n\nmybatis-plus:\n  global-config:\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', 'b38819cfa15c9f60460f713b208517e5', '2021-05-14 15:05:51', '2021-05-14 07:05:52', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (9, 33, 'application-dev.yaml', 'dev', '', '#屏蔽nacos不停更新的日志\nlogging:\n  level:\n    com:\n      alibaba:\n        nacos:\n          client:\n            naming: warn\n\n\nmybatis-plus:\n  global-config:\n    db-config:\n      table-prefix: tr_\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"', '861776b2875dd313137c1cacca3b1d0a', '2021-05-14 15:06:52', '2021-05-14 07:06:52', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 34, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadByUsername\"', 'a67c922c37bd4bb76df2ff3a44d4e5d2', '2021-05-14 16:21:10', '2021-05-14 08:21:10', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (1, 35, 'bluejay-uaa-core-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5', '5d5af8fa1df298a30b5c30098d490c98', '2021-05-14 16:21:19', '2021-05-14 08:21:19', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (4, 36, 'bluejay-uaa-user-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadByUsername\"', 'a67c922c37bd4bb76df2ff3a44d4e5d2', '2021-05-14 16:21:19', '2021-05-14 08:21:19', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (23, 37, 'bluejay-bc-system-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:', '09d9d7bc961e00003dca4b24db1bedb6', '2021-05-14 16:21:19', '2021-05-14 08:21:19', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 38, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  security:\n    client_id: bluejay\n    client_secret: bluejay\n    scope: server\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n\nignoreUrls:\n  - \"/sys/user/loadByUsername\"', 'a67c922c37bd4bb76df2ff3a44d4e5d2', '2021-05-14 16:21:40', '2021-05-14 08:21:40', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (12, 39, 'bluejay-tc-gateway-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        - id: bluejay-uaa-user\n          uri: lb://bluejay-uaa-user\n          predicates:\n            - Path=/user/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-uaa-core\n          uri: lb://bluejay-uaa-core\n          predicates:\n            - Path=/auth/**\n          filters:\n            - StripPrefix=1\n        - id: bluejay-bc-system\n          uri: lb://bluejay-bc-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n      #以下为 跨域配置\n      globalcors:\n        cors-configurations:\n          \'[/**]\': \n            allow-credentials: true # 允许携带认证信息\n            allowedOriginPatterns: \"*\"    # 允许跨域的源(网站域名/ip)，设置*为全部\n            allowedMethods: \"*\"   # 允许跨域的method， 默认为GET和OPTIONS，设置*为全部\n            allowedHeaders: \"*\"   # 允许跨域请求里的head字段，设置*为全部', '0a6c67cf88416edc94a4ee6edd8f7959', '2021-05-14 16:22:20', '2021-05-14 08:22:20', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 40, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      maximum-pool-size: 30\n      minimum-idle: 10\n      connection-timeout: 30000\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', 'e96b3f4a0aea45c8fae6414f2d633bf0', '2021-05-18 14:19:49', '2021-05-18 06:19:49', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 41, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', '2b5b59a6dc4eaddce7ccbe0ad640b3d0', '2021-05-20 16:58:58', '2021-05-20 08:58:59', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 42, 'bluejay-cb-uaa-dev-flow-rules.json', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-20 17:00:50', '2021-05-20 09:00:51', 'nacos', '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 43, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost8848\n            dataId: ${spring.application.name}-${spring.profiles.active}-flow-rules.json\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', 'c5e971ace6d364b800f5dbdbd6a44cfa', '2021-05-20 17:02:57', '2021-05-20 09:02:57', 'nacos', '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 44, 'bluejay-cb-uaa-dev-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-20 17:23:55', '2021-05-20 09:23:55', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (38, 45, 'bluejay-cb-uaa-dev-flow-rules.json', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-20 17:24:00', '2021-05-20 09:24:00', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 46, 'sentinel-dashboard-param-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-20 18:33:46', '2021-05-20 10:33:47', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (40, 47, 'bluejay-cb-uaa-dev-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-20 18:33:50', '2021-05-20 10:33:50', 'nacos', '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 48, 'bluejay-cb-uaa-dev-param-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 09:18:54', '2021-05-21 01:18:55', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 49, 'bluejay-cb-ga-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-${spring.profiles.active}-flow-rules.json\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', '7a571746fe90cdbe27ed70771d4d5d9b', '2021-05-21 11:39:23', '2021-05-21 03:39:23', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 50, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-${spring.profiles.active}-flow-rules.json\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', '7a571746fe90cdbe27ed70771d4d5d9b', '2021-05-21 14:07:20', '2021-05-21 06:07:20', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 51, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-${spring.profiles.active}-flow-rules\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', 'd0975132798837d50aecdea8088632db', '2021-05-21 15:23:37', '2021-05-21 07:23:37', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 52, 'bluejay-cb-uaa-param-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 15:24:00', '2021-05-21 07:24:00', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (42, 53, 'bluejay-cb-uaa-dev-param-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 15:24:09', '2021-05-21 07:24:10', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 54, 'sentinel-dashboard-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 15:34:54', '2021-05-21 07:34:55', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 55, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 16:26:56', '2021-05-21 08:26:56', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 56, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-21 16:39:28', '2021-05-21 08:39:29', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 57, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\n    {\n        \"resource\": \"/sys/resoucre/routes\",\n        \"limitApp\": \"app\",\n        \"grade\": 1,\n        \"count\": 5,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', '65037ceb306334626b0d383801dc7c17', '2021-05-21 16:40:35', '2021-05-21 08:40:36', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (0, 58, 'dd-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"dd\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586456104,\"grade\":1,\"id\":5,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', '6eefe0e0b957475f60d8da2b5e7682b4', '2021-05-21 16:41:01', '2021-05-21 08:41:01', NULL, '127.0.0.1', 'I', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (51, 59, 'dd-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"dd\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586456104,\"grade\":1,\"id\":5,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', '6eefe0e0b957475f60d8da2b5e7682b4', '2021-05-21 16:43:52', '2021-05-21 08:43:52', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (51, 60, 'dd-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"dd\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586594665,\"grade\":1,\"id\":8,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', '929bbc96ffecf50883c162d315ec667d', '2021-05-21 16:45:23', '2021-05-21 08:45:23', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 61, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\n    {\n        \"app\":\"dd\",\n        \"resource\": \"/sys/resoucre/routes\",\n        \"limitApp\": \"app\",\n        \"grade\": 1,\n        \"count\": 5,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'f3556a2a83a7849987214a7786a14caa', '2021-05-21 16:46:46', '2021-05-21 08:46:47', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 62, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\n    {\n        \"app\":\"bluejay-cb-uaa\",\n        \"resource\": \"/sys/resoucre/routes\",\n        \"limitApp\": \"app\",\n        \"grade\": 1,\n        \"count\": 5,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'e61bac3bae4d77fc7a85f3e4c854b14f', '2021-05-21 16:47:30', '2021-05-21 08:47:30', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 63, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586842313,\"grade\":1,\"id\":17,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', '4ffbfad319faa6fa6c51845ed60973e1', '2021-05-21 16:50:05', '2021-05-21 08:50:05', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 64, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586842313,\"grade\":1,\"id\":17,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', '4ffbfad319faa6fa6c51845ed60973e1', '2021-05-21 16:50:31', '2021-05-21 08:50:32', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 65, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[\n    {\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586842313,\"grade\":1,\"id\":17,\"limitApp\":\"app\",\"resource\":\"/sys/resource/routes/\",\"strategy\":0}\n]', 'b76fe9735c670ec173f9d6a812ef271b', '2021-05-21 17:04:36', '2021-05-21 09:04:36', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (51, 66, 'dd-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"dd\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621586705730,\"grade\":1,\"id\":13,\"limitApp\":\"app\",\"resource\":\"/sys/resoucre/routes\",\"strategy\":0}]', 'd3e89ff233f548362121eb907c568f7d', '2021-05-21 17:06:08', '2021-05-21 09:06:08', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 67, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621587871361,\"grade\":1,\"id\":17,\"limitApp\":\"app\",\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', 'cd5519cc5be06e22c4341fe3323ca63f', '2021-05-21 17:06:19', '2021-05-21 09:06:19', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 68, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":4.0,\"gmtModified\":1621587871361,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', '682a9260610712e73c0b244df7d9f4be', '2021-05-21 17:06:38', '2021-05-21 09:06:39', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 69, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":2.0,\"gmtModified\":1621587991056,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', '38c3ae4efb6e3ea275d7e8e05fe42469', '2021-05-21 17:08:13', '2021-05-21 09:08:13', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 70, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":3.0,\"gmtModified\":1621587991056,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', '1112ec540c44b499494fbbb7b277ee60', '2021-05-21 17:09:23', '2021-05-21 09:09:23', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 71, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":2,\"count\":50.0,\"gmtModified\":1621588162889,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"maxQueueingTimeMs\":10,\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', 'cae0e7d77dbec7d487da951aa0271b0e', '2021-05-21 17:14:25', '2021-05-21 09:14:25', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (41, 72, 'sentinel-dashboard-param-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-24 17:08:12', '2021-05-24 09:08:12', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (47, 73, 'sentinel-dashboard-flow-rules', 'SENTINEL_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/sys/resoucre/routes\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 5,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '5a99ec608d8a67ec08d73ff68f9509e4', '2021-05-24 17:08:12', '2021-05-24 09:08:12', NULL, '127.0.0.1', 'D', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 74, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":500.0,\"gmtModified\":1621588465456,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"maxQueueingTimeMs\":10,\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', '1859c2802ed8fc07f66ec294106381f8', '2021-05-24 23:03:00', '2021-05-24 15:03:00', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 75, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":20.0,\"gmtModified\":1621868580366,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"maxQueueingTimeMs\":10,\"resource\":\"/sys/resource/routes/\",\"strategy\":0}]', '58e4e5f989f4d6393d3219c9e9357a43', '2021-05-25 10:42:38', '2021-05-25 02:42:39', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (48, 76, 'bluejay-cb-uaa-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"bluejay-cb-uaa\",\"clusterMode\":false,\"controlBehavior\":0,\"count\":20.0,\"gmtModified\":1621868580366,\"grade\":1,\"id\":17,\"limitApp\":\"default\",\"maxQueueingTimeMs\":10,\"resource\":\"/sys/resource/routes\",\"strategy\":0}]', '655aca2d9d0ce876bef7e1c3eb16f288', '2021-05-25 15:43:03', '2021-05-25 07:43:04', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');
INSERT INTO `his_config_info` VALUES (33, 77, 'bluejay-cb-uaa-dev.yaml', 'dev', '', 'spring:\n  cloud:\n    sentinel:\n      transport:\n        dashboard: localhost:9975\n      datasource:\n        flow:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ${spring.application.name}-flow-rules\n            groupId: SENTINEL_GROUP\n            namespace: 33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778\n            rule-type: flow\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/db_bluejay_system?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowMultiQueries=true&serverTimezone=UTC\n    username: root\n    password: 123456\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    hikari:\n      connection-init-sql: SELECT 1\n      connection-timeout: 60000\n      validation-timeout: 3000\n      idle-timeout: 60000\n      login-timeout: 5\n      max-lifetime: 60000\n      maximum-pool-size: 10\n      minimum-idle: 10\n      read-only: false\n  redis:\n    url: redis://localhost:6379\n    lettuce:\n      pool:\n        max-wait: 3000ms\n        max-active: 30\n        max-idle: 5\n', 'ff52a8c2f92fd91ab1aba92e5c64a342', '2021-05-25 17:02:27', '2021-05-25 09:02:28', NULL, '127.0.0.1', 'U', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '33bdbe04-62d0-4bbe-8a5e-ec74e9c6c778', '蓝鸟Api平台', 'BlueJay Api Platform', 'nacos', 1620649309196, 1620649309196);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
