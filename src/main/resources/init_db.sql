CREATE DATABASE `taxi`;

CREATE TABLE `cars`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT,
    `model`           varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `manufacturer_id` bigint unsigned NOT NULL,
    `is_deleted`      bit(1)                                                        NOT NULL DEFAULT b'0',
    PRIMARY KEY (`id`) USING BTREE,
    KEY               `FK_manufacturer_id` (`manufacturer_id`) USING BTREE,
    CONSTRAINT `FK_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `cars_drivers` (
                                `car_id` bigint unsigned NOT NULL,
                                `driver_id` bigint unsigned NOT NULL,
                                PRIMARY KEY (`car_id`,`driver_id`) USING BTREE,
                                KEY `driver_id` (`driver_id`) USING BTREE,
                                KEY `car_id` (`car_id`) USING BTREE,
                                CONSTRAINT `car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                CONSTRAINT `driver_id` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `drivers` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                           `license_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                           `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                           `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                           `is_deleted` bit(1) NOT NULL DEFAULT b'0',
                           PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `manufacturers` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                                 `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                                 `is_deleted` bit(1) NOT NULL DEFAULT b'0',
                                 PRIMARY KEY (`id`) USING BTREE
);
