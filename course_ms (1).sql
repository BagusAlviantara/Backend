-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2022 at 02:44 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_ms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(5) NOT NULL,
  `employee_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `day` varchar(25) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_schedule`
--

INSERT INTO `class_schedule` (`id`, `employee_id`, `product_id`, `day`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Senin', '14:00:00', '15:30:00', '2022-08-25 05:13:47', '2022-08-25 05:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `name_employee` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `department` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_id`, `name_employee`, `address`, `gender`, `phone`, `department`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alviantara', 'Jalan Noja II', 'Laki-Laki', '081246431155', 'Data Analyst - Teacher', '2022-08-16 03:08:37', '2022-08-16 03:08:37'),
(2, 4, 'Dyah Kusuma', 'Jalan Gatot Subroto Timur', 'Perempuan', '082563790191', 'Front End Developer ', '2022-08-16 04:17:42', '2022-08-16 05:16:33'),
(3, 3, 'Bagus Alviantara', 'Jalan Kenangan Indah', 'Laki-Laki', '082222222222', 'Data Engineer - Teacher', '2022-08-16 05:10:34', '2022-08-16 05:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedule`
--

CREATE TABLE `employee_schedule` (
  `id` int(5) NOT NULL,
  `employee_id` int(5) NOT NULL,
  `day` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `start_break` time NOT NULL,
  `end_break` time NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_schedule`
--

INSERT INTO `employee_schedule` (`id`, `employee_id`, `day`, `start_time`, `end_time`, `start_break`, `end_break`, `created_at`, `updated_at`) VALUES
(1, 2, 'Senin', '10:00:00', '17:00:00', '12:30:00', '13:30:00', '2022-08-25 05:21:10', '2022-08-25 05:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(5) NOT NULL,
  `schedule_id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(5) NOT NULL,
  `category_id` int(5) NOT NULL,
  `code_product` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(25) NOT NULL,
  `days_period` int(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `code_product`, `name`, `description`, `price`, `days_period`, `created_at`, `updated_at`) VALUES
(1, 1, 'WEB01', 'Web Design HTML5, CSS, Javascript Beginner 1.0', 'Pembelajaran dimulai dengan menulis program HTML5 dan CSS hingga membuat website interaktif menggunakan javascript', 1400000, 90, '2022-08-10 06:50:51', '2022-08-15 12:51:06'),
(2, 1, 'PMP01', 'PHP MYSQL PROGRAMMING', 'Pembelajaran di mulai dari materi pengertian PHP dan MYSQL serta dilanjutkan dengan mengoneksikan database menggunakan PHP programming.', 1200000, 90, '2022-08-15 13:45:17', '2022-08-15 13:45:17'),
(3, 4, 'CON01', 'Construct 2D', 'Pembelajaran dimulai dengan perkenalan tentang aplikasi Construct hingga membuat game sederhana interaktif menggunakan perintah drag and drop', 1500000, 90, '2022-08-15 13:58:05', '2022-08-15 13:58:05'),
(4, 4, 'UNI01', 'UNITY 3D', 'Pembelajaran dimulai dengan pengenalan UNITY ', 1500000, 90, '2022-08-15 14:17:47', '2022-08-15 14:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(5) NOT NULL,
  `code_category` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `code_category`, `name`, `created_at`, `updated_at`) VALUES
(1, 'WPO01', 'WEB PROGRAMMING', '2022-08-10 04:39:43', '2022-08-10 04:39:43'),
(2, 'MOB01', 'MOBILE APP', '2022-08-14 23:58:15', '2022-08-14 23:58:15'),
(3, 'ROB01', 'ROBOTICS', '2022-08-14 23:55:50', '2022-08-14 23:55:50'),
(4, 'GAM01', 'GAME PROGRAMMING', '2022-08-14 23:57:15', '2022-08-14 23:57:15'),
(5, 'COD01', 'CODING JUNIOR', '2022-08-14 23:58:28', '2022-08-14 23:58:28'),
(6, 'APP01', 'APP PROGRAMMING', '2022-08-15 12:37:19', '2022-08-15 12:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `code_unit` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order_unit` int(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `product_id`, `code_unit`, `name`, `order_unit`, `created_at`, `updated_at`) VALUES
(1, 1, 'WD01', 'Introduction HTML5', 1, '2022-08-15 13:55:11', '2022-08-15 13:55:11'),
(2, 1, 'WD02', 'Formatting and Style', 2, '2022-08-15 21:34:35', '2022-08-15 21:45:59'),
(3, 1, 'WD03', 'Colors', 3, '2022-08-15 21:47:48', '2022-08-15 21:49:25'),
(4, 1, 'WD04', 'Links', 4, '2022-08-15 21:49:51', '2022-08-15 21:49:51'),
(5, 1, 'WD05', 'Images', 5, '2022-08-15 21:52:27', '2022-08-15 21:52:27'),
(6, 1, 'WD06', 'Tables', 6, '2022-08-15 21:54:05', '2022-08-15 21:54:05'),
(7, 1, 'WD07', 'Lists', 7, '2022-08-15 21:54:40', '2022-08-15 21:54:40'),
(8, 1, 'WD08', 'Forms', 8, '2022-08-15 22:09:02', '2022-08-15 22:09:02'),
(9, 1, 'WD09', 'Introduction CSS', 9, '2022-08-15 22:11:54', '2022-08-15 22:11:54'),
(10, 1, 'WD10', 'Backgrounds', 10, '2022-08-15 22:14:37', '2022-08-15 22:14:37'),
(11, 1, 'WD11', 'Borders', 11, '2022-08-15 22:28:13', '2022-08-15 22:28:13'),
(12, 2, 'PHP01', 'Introduction PHP', 1, '2022-08-15 22:40:51', '2022-08-15 22:40:51'),
(13, 2, 'PHP02', 'Variables', 2, '2022-08-15 22:49:01', '2022-08-15 22:49:01'),
(14, 2, 'PHP03', 'Echo / Print', 3, '2022-08-15 22:49:29', '2022-08-15 22:53:52'),
(15, 2, 'PHP04', 'Data Types', 4, '2022-08-15 22:49:50', '2022-08-15 22:49:50'),
(16, 2, 'PHP05', 'Operators and Math', 5, '2022-08-15 22:50:32', '2022-08-15 22:50:32'),
(17, 2, 'PHP06', 'Conditionals', 6, '2022-08-15 22:50:52', '2022-08-15 22:50:52'),
(18, 2, 'PHP07', 'Loops', 7, '2022-08-15 22:51:10', '2022-08-15 22:51:10'),
(19, 2, 'PHP08', 'Functions', 8, '2022-08-15 22:51:25', '2022-08-15 22:51:25'),
(20, 2, 'PHP09', 'Arrays', 9, '2022-08-15 22:51:43', '2022-08-15 22:51:43'),
(21, 2, 'PHP10', 'Forms', 10, '2022-08-15 22:51:52', '2022-08-15 22:51:52'),
(22, 2, 'PHP11', 'Object Oriented Programming', 11, '2022-08-16 06:17:24', '2022-08-16 06:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `name_student` varchar(50) NOT NULL,
  `phone_parent` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `name_student`, `phone_parent`, `address`, `age`, `gender`, `created_at`, `update_at`) VALUES
(1, 6, 'Sang Putu Yoga', '082233782901', 'Jalan Dalung Permai Raya, Mengwi', 21, 'Male', '2022-08-25 05:09:39', '2022-08-25 05:09:39');

-- --------------------------------------------------------

--
-- Table structure for table `student_bookings`
--

CREATE TABLE `student_bookings` (
  `id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `schedule_id` int(5) NOT NULL,
  `status_book` int(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `id` int(5) NOT NULL,
  `schedule_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_course`
--

INSERT INTO `student_course` (`id`, `schedule_id`, `student_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-08-25 05:24:56', '2022-08-25 05:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `student_reports`
--

CREATE TABLE `student_reports` (
  `id` int(5) NOT NULL,
  `unit_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `schedule_id` int(5) NOT NULL,
  `description` varchar(300) NOT NULL,
  `score` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `phone`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, '', '', 'alviantara12.kw@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$pBkoF4nIfqd9aKGedsA4mg$ICfGao227ugQ5tQBq5R+lJimUqaaB7GCU4jPn1yMHyU', 'Admin', '2022-07-28 05:48:10', '2022-08-15 12:28:43'),
(2, '', '', 'alviantara12@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$s8ZhogWib44r8smdiRy7cQ$+kY1t4o1lV9y6YlXNoHP/KPrCU1yy/ti3rC3lT40gpQ', 'User', '2022-08-08 06:12:12', '2022-08-15 12:28:03'),
(3, '', '', 'alviantara123@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$WmRUOsJjf87TTMUnt4LNJg$pg7wrAsRj8TrPVSnajM4nz7/I9YrxH1scvzztSkw0/A', 'Admin', '2022-08-08 06:35:48', '2022-08-15 12:29:40'),
(4, '', '', 'dyah123@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$JdI6HyBWbmO10plgZgwtQw$vbyYqlH3sZNBE8V5vk92p/vVa6W20fWTN6vcDPdJyAk', 'Admin', '2022-08-08 07:10:11', '2022-08-15 12:30:10'),
(5, '', '', 'wahyu@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$1CEkcz4UDAbZnZxVC1BsuQ$QzleuToNBdbn4UMGPcFX3uJcKTb7oTd9+8jUlvvk9go', 'User', '2022-08-09 03:27:04', '2022-08-15 12:30:37'),
(6, '', '', 'yoga@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$QgZBXt/SIJlaMN09/uxa+Q$aJ3hWhfYylPSDTSLx874zKXi5RzNfLV5+d0T8hdcoZc', 'Student', '2022-08-09 03:28:11', '2022-08-15 12:27:47'),
(7, '', '', 'alvin@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$I81fyGiwzpQRIq8ASC31Ow$8Rdg0I46a+irimm6TTAF4OyYecDzMKFiOfpVdD6ElRU', 'Admin', '2022-08-15 12:18:02', '2022-08-15 12:18:02'),
(8, 'Komang Yudi Utama', '082277218291', 'yudiutama@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$mZHgJx2XsZrMOkFPnD/hdw$vrfqwdSh4/t6rWYCXwUz4RlAtuwiwSUST2YndXj31vE', 'Admin', '2022-08-25 04:54:09', '2022-08-25 04:54:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_schedule_ibfk_1` (`employee_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_product` (`code_product`),
  ADD KEY `products_ibfk_1` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_category` (`code_category`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_unit` (`code_unit`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_ibfk_1` (`user_id`);

--
-- Indexes for table `student_bookings`
--
ALTER TABLE `student_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `student_course`
--
ALTER TABLE `student_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_reports`
--
ALTER TABLE `student_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_reports_ibfk_2` (`student_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_bookings`
--
ALTER TABLE `student_bookings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_course`
--
ALTER TABLE `student_course`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_reports`
--
ALTER TABLE `student_reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD CONSTRAINT `class_schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_schedule_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  ADD CONSTRAINT `employee_schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_units`
--
ALTER TABLE `product_units`
  ADD CONSTRAINT `product_units_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_bookings`
--
ALTER TABLE `student_bookings`
  ADD CONSTRAINT `student_bookings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_bookings_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_reports`
--
ALTER TABLE `student_reports`
  ADD CONSTRAINT `student_reports_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_reports_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_reports_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
