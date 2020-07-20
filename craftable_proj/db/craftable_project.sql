/*
 Navicat Premium Data Transfer

 Source Server         : WampServer
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 127.0.0.1:3306
 Source Schema         : craftable_project

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 20/07/2020 08:50:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `activations_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activations
-- ----------------------------

-- ----------------------------
-- Table structure for admin_activations
-- ----------------------------
DROP TABLE IF EXISTS `admin_activations`;
CREATE TABLE `admin_activations`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_activations_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_activations
-- ----------------------------

-- ----------------------------
-- Table structure for admin_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_email_deleted_at_unique`(`email`, `deleted_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'Administrator', 'Administrator', 'administrator@brackets.sk', '$2y$10$gfAmC4NrVUVwkvBOSSQqXuaCOZnzdu9/2P7XC/8P9/eMSH3SX7zUu', 'FwPkICxLiIe7P91ADgkU9FsEfUT8npOW7CLmRKxJPNQyCKR755rm3WA8pLRA', 1, 0, 'en', NULL, '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `admin_users` VALUES (2, 'Setha', 'Thay', 'sethathay@gmail.com', '$2y$10$pOsCiy/C./IgMtzkSY1FY.NDekHAHfUhf7mamnPtDgNiqDHAA/76u', 'AcIuo6L7SUWDlNtpRqZ1mozALpcItDtPVlqdpFfM1MKtpTCTDDGfpBEzyVx5', 1, 0, 'en', NULL, '2019-07-15 02:41:08', '2019-07-15 02:41:08');

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `order_column` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type`, `model_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2017_08_24_000000_create_activations_table', 1);
INSERT INTO `migrations` VALUES (2, '2017_08_24_000000_create_admin_activations_table', 1);
INSERT INTO `migrations` VALUES (3, '2017_08_24_000000_create_admin_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2017_08_24_000000_create_admin_users_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_07_18_000000_create_wysiwyg_media_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_07_15_023102_create_media_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_07_15_023102_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (8, '2019_07_15_023107_fill_default_admin_user_and_permissions', 1);
INSERT INTO `migrations` VALUES (9, '2019_07_15_023102_create_translations_table', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1);
INSERT INTO `model_has_roles` VALUES (1, 'Brackets\\AdminAuth\\Models\\AdminUser', 2);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'admin', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (2, 'admin.translation.index', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (3, 'admin.translation.edit', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (4, 'admin.translation.rescan', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (5, 'admin.admin-user.index', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (6, 'admin.admin-user.create', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (7, 'admin.admin-user.edit', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (8, 'admin.admin-user.delete', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');
INSERT INTO `permissions` VALUES (9, 'admin.upload', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrator', 'admin', '2019-07-15 02:31:05', '2019-07-15 02:31:05');

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `namespace` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` json NOT NULL,
  `metadata` json NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `translations_namespace_index`(`namespace`) USING BTREE,
  INDEX `translations_group_index`(`group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES (1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (4, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (5, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (6, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (7, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (8, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (9, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (10, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (11, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (12, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (19, 'brackets/admin-ui', 'admin', 'placeholder.search', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (20, 'brackets/admin-ui', 'admin', 'btn.search', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (22, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (23, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (24, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (25, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (26, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (27, 'brackets/admin-ui', 'admin', 'btn.new', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (28, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (29, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (30, 'brackets/admin-ui', 'admin', 'sidebar.content', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (31, 'brackets/admin-ui', 'admin', 'sidebar.settings', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (32, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (33, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (34, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (35, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (36, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (37, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (38, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (39, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (40, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (41, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (42, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (43, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (44, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (45, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (46, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (47, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (48, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (49, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (50, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (51, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (52, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (53, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (54, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (55, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (56, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (57, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (58, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (59, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (60, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (61, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (62, '*', '*', 'Manage access', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (63, '*', '*', 'Translations', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);
INSERT INTO `translations` VALUES (64, '*', '*', 'Configuration', '[]', NULL, '2019-07-15 02:31:09', '2019-07-15 02:31:09', NULL);

-- ----------------------------
-- Table structure for wysiwyg_media
-- ----------------------------
DROP TABLE IF EXISTS `wysiwyg_media`;
CREATE TABLE `wysiwyg_media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `wysiwygable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wysiwyg_media_wysiwygable_id_index`(`wysiwygable_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wysiwyg_media
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
