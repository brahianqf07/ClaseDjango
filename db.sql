-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.41 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db2921881
CREATE DATABASE IF NOT EXISTS `db2921881` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db2921881`;

-- Volcando estructura para tabla db2921881.app_categoria
CREATE TABLE IF NOT EXISTS `app_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.app_categoria: ~5 rows (aproximadamente)
INSERT INTO `app_categoria` (`id`, `nombre`, `desc`) VALUES
	(1, 'obrero', NULL),
	(2, 'mensajero', NULL),
	(3, 'ingeniero', NULL),
	(4, 'contratista', NULL),
	(5, 'Ejecutivo', 'tal o pascual');

-- Volcando estructura para tabla db2921881.app_empleado
CREATE TABLE IF NOT EXISTS `app_empleado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `Indentificacion` varchar(11) NOT NULL,
  `fecha_ingreso` datetime(6) NOT NULL,
  `edad` int unsigned NOT NULL,
  `salario` decimal(9,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Indentificacion` (`Indentificacion`),
  KEY `app_empleado_categoria_id_62aa196a_fk_app_categoria_id` (`categoria_id`),
  CONSTRAINT `app_empleado_categoria_id_62aa196a_fk_app_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `app_categoria` (`id`),
  CONSTRAINT `app_empleado_chk_1` CHECK ((`edad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.app_empleado: ~1 rows (aproximadamente)
INSERT INTO `app_empleado` (`id`, `nombre`, `Indentificacion`, `fecha_ingreso`, `edad`, `salario`, `estado`, `imagen`, `categoria_id`) VALUES
	(1, 'brahian', '123', '2025-04-23 15:03:23.139957', 20, 122222.00, 1, '', 1);

-- Volcando estructura para tabla db2921881.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db2921881.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db2921881.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_permission: ~32 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add empleado', 7, 'add_empleado'),
	(26, 'Can change empleado', 7, 'change_empleado'),
	(27, 'Can delete empleado', 7, 'delete_empleado'),
	(28, 'Can view empleado', 7, 'view_empleado'),
	(29, 'Can add Categoria', 8, 'add_categoria'),
	(30, 'Can change Categoria', 8, 'change_categoria'),
	(31, 'Can delete Categoria', 8, 'delete_categoria'),
	(32, 'Can view Categoria', 8, 'view_categoria');

-- Volcando estructura para tabla db2921881.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_user: ~1 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$1000000$EHSO9w7qumvXtILvbv5a5V$vw9qoefQGP4ErmMmtXL68yPXN6MCVQO5baHmg6TX//Q=', '2025-04-23 15:02:46.416785', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-04-09 14:11:03.727853');

-- Volcando estructura para tabla db2921881.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_user_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db2921881.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla db2921881.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.django_admin_log: ~6 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-04-11 14:19:47.704347', '1', 'Categoria object (1)', 1, '[{"added": {}}]', 8, 1),
	(2, '2025-04-11 14:20:28.895177', '2', 'Categoria object (2)', 1, '[{"added": {}}]', 8, 1),
	(3, '2025-04-11 14:22:05.606148', '3', 'Categoria object (3)', 1, '[{"added": {}}]', 8, 1),
	(4, '2025-04-11 14:22:23.038038', '4', 'Categoria object (4)', 1, '[{"added": {}}]', 8, 1),
	(5, '2025-04-11 14:32:13.743194', '5', 'Categoria object (5)', 1, '[{"added": {}}]', 8, 1),
	(6, '2025-04-23 15:03:23.140798', '1', 'brahian', 1, '[{"added": {}}]', 7, 1);

-- Volcando estructura para tabla db2921881.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.django_content_type: ~8 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(8, 'app', 'categoria'),
	(7, 'app', 'empleado'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');

-- Volcando estructura para tabla db2921881.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.django_migrations: ~19 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-04-09 13:59:49.606635'),
	(2, 'auth', '0001_initial', '2025-04-09 13:59:50.139590'),
	(3, 'admin', '0001_initial', '2025-04-09 13:59:50.276100'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2025-04-09 13:59:50.282950'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-09 13:59:50.290452'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2025-04-09 13:59:50.380871'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2025-04-09 13:59:50.439241'),
	(8, 'auth', '0003_alter_user_email_max_length', '2025-04-09 13:59:50.458320'),
	(9, 'auth', '0004_alter_user_username_opts', '2025-04-09 13:59:50.464616'),
	(10, 'auth', '0005_alter_user_last_login_null', '2025-04-09 13:59:50.516973'),
	(11, 'auth', '0006_require_contenttypes_0002', '2025-04-09 13:59:50.520026'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2025-04-09 13:59:50.526377'),
	(13, 'auth', '0008_alter_user_username_max_length', '2025-04-09 13:59:50.587100'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2025-04-09 13:59:50.646831'),
	(15, 'auth', '0010_alter_group_name_max_length', '2025-04-09 13:59:50.664781'),
	(16, 'auth', '0011_update_proxy_permissions', '2025-04-09 13:59:50.672145'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2025-04-09 13:59:50.731679'),
	(18, 'sessions', '0001_initial', '2025-04-09 13:59:50.767989'),
	(19, 'app', '0001_initial', '2025-04-11 14:06:42.472182');

-- Volcando estructura para tabla db2921881.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db2921881.django_session: ~2 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('rgpw9etbst5v64dtj2fxi96m1hzpmyvp', '.eJxVjDsOwjAQBe_iGlmOE_8o6TmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIsBnH63RDSg-sO6A711mRqdV1mlLsiD9rltRE_L4f7d1Cgl2-trU6jHRGBkZJjzQZoyNZ5UJ5NYnJjdhOS0zqrKQQgjyYo79F5A1q8PweqOG8:1u2WCu:-mZG0NU7gVlTjiuZbSAUgdR7-bByrs0HP53hiKzmuwA', '2025-04-23 14:15:12.289264'),
	('vvgynkeguck1arft4a4m71ygsbkuhq3c', '.eJxVjDsOwjAQBe_iGlmOE_8o6TmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIsBnH63RDSg-sO6A711mRqdV1mlLsiD9rltRE_L4f7d1Cgl2-trU6jHRGBkZJjzQZoyNZ5UJ5NYnJjdhOS0zqrKQQgjyYo79F5A1q8PweqOG8:1u7bcc:yc9GfvUyzuE10Ebly3VGcWl60L6Ik5X7hybo-EGnSbg', '2025-05-07 15:02:46.420146');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
