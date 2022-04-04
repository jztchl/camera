-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 06:31 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camera`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_booking`
--

CREATE TABLE `app_booking` (
  `id` bigint(20) NOT NULL,
  `bookingdatefrom` date NOT NULL,
  `bookingdateto` date NOT NULL,
  `bookeduser_id` bigint(20) NOT NULL,
  `productid_id` bigint(20) NOT NULL,
  `sellerid_id` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_booking`
--

INSERT INTO `app_booking` (`id`, `bookingdatefrom`, `bookingdateto`, `bookeduser_id`, `productid_id`, `sellerid_id`, `status`, `amount`) VALUES
(2, '2022-02-07', '2022-02-15', 6, 12, 3, 'cancelled', ''),
(3, '2022-02-21', '2022-02-24', 6, 12, 3, 'cancelled', ''),
(4, '2022-02-13', '2022-02-23', 6, 7, 3, 'cancelled', ''),
(5, '2022-03-01', '2022-03-09', 6, 9, 3, 'active', '1500'),
(6, '2022-03-23', '2022-03-25', 6, 9, 3, 'active', '1500'),
(7, '2022-02-20', '2022-02-22', 6, 9, 3, 'active', '3000'),
(8, '2022-04-04', '2022-05-07', 6, 12, 3, 'active', '2360');

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE `app_product` (
  `id` bigint(20) NOT NULL,
  `productdes` varchar(500) NOT NULL,
  `pimage` varchar(100) NOT NULL,
  `sellerid_id` bigint(20) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productprice` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `condition` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`id`, `productdes`, `pimage`, `sellerid_id`, `productname`, `productprice`, `brand`, `condition`) VALUES
(7, 'dddddddddddddddddd', 'images/cannon_eos_80d.jpg', 3, 'Cannon EOS 80D', '590', 'Cannon', 'best'),
(9, 'dddddddddddddddddd', 'images/nikon_d3500_with_kit.jpg', 3, 'Nikon D3500 with kit', '1500', 'Nikon', 'good as new'),
(12, 'dddddddddddddddddd', 'images/cannon_eos_1500d_dvfYJlN.jpg', 3, 'Cannon EOS 1500D', '590', 'Cannon', 'good as new'),
(13, 'dddddddddddddddddd', 'images/cannon_eos_80d_JYu8ite.jpg', 5, 'Cannon EOS 80D', '553', 'Cannon', 'good as new');

-- --------------------------------------------------------

--
-- Table structure for table `app_seller`
--

CREATE TABLE `app_seller` (
  `id` bigint(20) NOT NULL,
  `vname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `image` varchar(100) NOT NULL,
  `authN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_seller`
--

INSERT INTO `app_seller` (`id`, `vname`, `username`, `email`, `password`, `phone`, `image`, `authN`) VALUES
(3, 'APPU KUTTAN', 'appu', 'appu@gmail.com', '123', '9876543210', 'images/male_sel1.jpg', 'Approved'),
(5, 'Shyam', 'shyam', 'Shyam@gmail.com', '123', '9876543210', 'images/male1_A8M9UWQ.jpg', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `image` varchar(100) NOT NULL,
  `authN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `name`, `username`, `email`, `password`, `phone`, `image`, `authN`) VALUES
(6, 'Ram', 'ram', 'ram@yahoo.com', '456', '9876543210', 'images/male1.jpg', ''),
(7, 'Samuel', 'sam', 'sam@gmail.com', '123', '9876543210', 'images/male2.jpg', ''),
(8, 'vasu', 'vasu', 'vasujj00@gmail.com', '54321', '', '', ''),
(9, 'vishnu', 'vishnukm', 'kmvishnu625@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9876543210', 'images/male2_4aqDbSQ.jpg', 'Approved'),
(10, 'Abhin', 'abhin009', 'abhinpradeepan@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9876543210', 'images/download_1.jpg', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

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
(25, 'Can add seller', 7, 'add_seller'),
(26, 'Can change seller', 7, 'change_seller'),
(27, 'Can delete seller', 7, 'delete_seller'),
(28, 'Can view seller', 7, 'view_seller'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add booking', 10, 'add_booking'),
(38, 'Can change booking', 10, 'change_booking'),
(39, 'Can delete booking', 10, 'delete_booking'),
(40, 'Can view booking', 10, 'view_booking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '123', NULL, 0, 'thambi', '', '', '', 0, 0, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'app', 'booking'),
(9, 'app', 'product'),
(7, 'app', 'seller'),
(8, 'app', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-01 04:27:05.744103'),
(2, 'auth', '0001_initial', '2022-02-01 04:27:11.915594'),
(3, 'admin', '0001_initial', '2022-02-01 04:27:13.665560'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-01 04:27:13.884291'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-01 04:27:13.946780'),
(6, 'app', '0001_initial', '2022-02-01 04:27:15.728041'),
(7, 'app', '0002_rename_product_product_productdes_and_more', '2022-02-01 04:27:19.212071'),
(8, 'app', '0003_delete_booking', '2022-02-01 04:27:19.399461'),
(9, 'contenttypes', '0002_remove_content_type_name', '2022-02-01 04:27:20.540399'),
(10, 'auth', '0002_alter_permission_name_max_length', '2022-02-01 04:27:21.619603'),
(11, 'auth', '0003_alter_user_email_max_length', '2022-02-01 04:27:22.244448'),
(12, 'auth', '0004_alter_user_username_opts', '2022-02-01 04:27:22.291363'),
(13, 'auth', '0005_alter_user_last_login_null', '2022-02-01 04:27:22.650802'),
(14, 'auth', '0006_require_contenttypes_0002', '2022-02-01 04:27:22.681855'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2022-02-01 04:27:22.713128'),
(16, 'auth', '0008_alter_user_username_max_length', '2022-02-01 04:27:23.463167'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2022-02-01 04:27:24.150647'),
(18, 'auth', '0010_alter_group_name_max_length', '2022-02-01 04:27:24.853652'),
(19, 'auth', '0011_update_proxy_permissions', '2022-02-01 04:27:24.962828'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2022-02-01 04:27:25.650360'),
(21, 'sessions', '0001_initial', '2022-02-01 04:27:26.212531'),
(22, 'app', '0004_booking', '2022-02-01 04:38:33.968495'),
(23, 'app', '0005_product_brand_product_condition', '2022-02-07 03:36:31.467277'),
(24, 'app', '0006_booking_status_alter_product_productdes', '2022-02-07 03:36:33.994690'),
(25, 'app', '0007_seller_authn', '2022-02-11 04:18:12.225233'),
(26, 'app', '0008_booking_amount', '2022-02-15 05:55:40.037952'),
(27, 'app', '0009_alter_booking_amount', '2022-02-15 05:55:40.069334'),
(28, 'app', '0010_remove_booking_amount', '2022-02-15 05:55:40.434502'),
(29, 'app', '0011_booking_amount', '2022-02-15 05:56:22.777296'),
(30, 'app', '0012_user_authn', '2022-03-23 03:38:00.582829');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4i4luolnmpzzsw37b5u7y5jodg3zbkbr', 'eyJhZG0iOjEsInVzZSI6OX0:1nZo9h:8JhtYHouT5OtQrMaHQjc1ZXYUL8Dp_y_4Ftgekj_Oos', '2022-04-14 06:19:37.715793'),
('cndvwos3a7qnebjzpwoqi4hk0r3wwwab', 'eyJ1c2UiOjZ9:1nGvb4:e0OJOEQD9DcCzcNmz3sYbX2OXFworEjM0WERLzp3kwU', '2022-02-21 04:25:50.682558'),
('iuy1qq8pqv7a66xqgl9fvhlu5ttclshr', 'eyJhZG0iOjEsInVzZSI6Nn0:1nJq2n:GACp7uw0B6ACGevDJ1m5x485Nkne2Xm7vbClq8zdXXE', '2022-03-01 05:06:29.139161'),
('l7kj7480egch5fnhjq028grr1rt1iwo7', 'eyJ1c2UiOjV9:1nFrjn:Rs05NiJIj6WW13OkbxXqJ5HyjSCrGhUUXTCs3qzFPcE', '2022-02-18 06:06:27.297130'),
('nv1fee8aq1uuswpb92dzczzrnvlmdrtb', 'eyJzZWwiOjF9:1nF8Np:TsqGcwvMxfB8yq4Ufsr3IBmlJKjfrvkPA3jgtGGXr-E', '2022-02-16 05:40:45.959686');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_booking`
--
ALTER TABLE `app_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_booking_bookeduser_id_9f5dea61_fk_app_user_id` (`bookeduser_id`),
  ADD KEY `app_booking_productid_id_b1caae07_fk_app_product_id` (`productid_id`),
  ADD KEY `app_booking_sellerid_id_1b733f26_fk_app_seller_id` (`sellerid_id`);

--
-- Indexes for table `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_product_sellerid_id_7c150d90_fk_app_seller_id` (`sellerid_id`);

--
-- Indexes for table `app_seller`
--
ALTER TABLE `app_seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_booking`
--
ALTER TABLE `app_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `app_seller`
--
ALTER TABLE `app_seller`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_booking`
--
ALTER TABLE `app_booking`
  ADD CONSTRAINT `app_booking_bookeduser_id_9f5dea61_fk_app_user_id` FOREIGN KEY (`bookeduser_id`) REFERENCES `app_user` (`id`),
  ADD CONSTRAINT `app_booking_productid_id_b1caae07_fk_app_product_id` FOREIGN KEY (`productid_id`) REFERENCES `app_product` (`id`),
  ADD CONSTRAINT `app_booking_sellerid_id_1b733f26_fk_app_seller_id` FOREIGN KEY (`sellerid_id`) REFERENCES `app_seller` (`id`);

--
-- Constraints for table `app_product`
--
ALTER TABLE `app_product`
  ADD CONSTRAINT `app_product_sellerid_id_7c150d90_fk_app_seller_id` FOREIGN KEY (`sellerid_id`) REFERENCES `app_seller` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
