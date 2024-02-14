-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Feb 14, 2024 at 08:12 PM
-- Server version: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- PHP Version: 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school5`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('7f37adbdfe58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`course_id`, `course_name`, `department_id`) VALUES
(9, 'Science 6 (General)', 2),
(10, 'Science 7 (Life)', 2),
(11, 'Science 8 (Earth)', 2),
(12, 'Science 9 (Physical)', 2),
(13, 'General Biology', 2),
(14, 'General Chemistry', 2),
(15, 'General Physics', 2),
(28, 'Pre-School Numbers', 18),
(29, 'Pre-School Letters', 18),
(30, 'Pre-School Bible', 18),
(31, 'Pre-School Science', 18),
(32, 'Pre-School Language', 18),
(33, 'Pre-School Spelling', 18),
(34, 'Pre-School Social Skills', 18),
(35, 'Pre-School Art', 18),
(36, 'Pre-School Music', 18),
(37, 'Pre-School Gym', 18),
(38, 'Pre-School Health', 18),
(39, 'Pre-School Computers', 18),
(40, 'KDG Bible', 19),
(41, 'Kdg - Math', 19),
(42, 'Kdg - Science', 19),
(43, 'Kdg - Language Arts', 19),
(44, 'Kdg - Reading', 19),
(45, 'Kdg - History', 19),
(46, 'Kdg - Music', 19),
(47, 'Kdg - Art', 19),
(48, 'Kdg - Gym', 19),
(49, '1st Grade Bible', 20),
(50, '1st Grade Math', 20),
(51, '1st Grade Science', 20),
(52, '1st Grade Computers', 20),
(53, '1st Grade Reading', 20),
(54, '1st Grade English', 20),
(55, '1st Grade Spelling', 20),
(56, '1st Grade Gym', 20),
(57, '1st Grade Art', 20),
(58, '1st Grade Music', 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departments`
--

CREATE TABLE `tbl_departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_departments`
--

INSERT INTO `tbl_departments` (`department_id`, `department_name`) VALUES
(1, 'Bible'),
(2, 'Science'),
(3, 'Math'),
(4, 'English'),
(5, 'Fine Arts'),
(6, 'History / Social Studies'),
(7, 'Foreign Languages'),
(8, 'Health / PE'),
(9, 'Literature'),
(10, 'Computers'),
(11, 'Performing Arts'),
(12, 'Career and Technical Education'),
(13, 'Business Education'),
(14, 'Technology Education'),
(15, 'Special Education'),
(16, 'Guidance Counseling'),
(17, 'Library / Media Center'),
(18, 'Pre-School'),
(19, 'Kindergarten'),
(20, '1st Grade'),
(21, '2nd Grade'),
(22, '3rd Grade'),
(23, '4th Grade'),
(24, '5th Grade'),
(25, 'Administration'),
(26, 'Office'),
(27, 'Facilities'),
(28, 'Student Services'),
(29, 'Counseling');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enrollments`
--

CREATE TABLE `tbl_enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faculty`
--

CREATE TABLE `tbl_faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_fname` varchar(45) NOT NULL,
  `faculty_lname` varchar(45) NOT NULL,
  `faculty_dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gender`
--

CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_gender`
--

INSERT INTO `tbl_gender` (`gender_id`, `gender_name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grade_levels`
--

CREATE TABLE `tbl_grade_levels` (
  `grade_id` int(11) NOT NULL,
  `grade_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_grade_levels`
--

INSERT INTO `tbl_grade_levels` (`grade_id`, `grade_name`) VALUES
(1, 'PK3'),
(2, 'PK4'),
(3, 'KDG'),
(4, '1'),
(5, '2'),
(6, '3'),
(7, '4'),
(8, '5'),
(9, '6'),
(10, '7'),
(11, '8'),
(12, '9'),
(13, '10'),
(14, '11'),
(15, '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sections`
--

CREATE TABLE `tbl_sections` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `student_fname` varchar(45) DEFAULT NULL,
  `student_lname` varchar(45) DEFAULT NULL,
  `student_gender_id` int(11) DEFAULT NULL,
  `grade_level_id` int(11) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `student_fname`, `student_lname`, `student_gender_id`, `grade_level_id`, `student_age`) VALUES
(11, 'Jeremy', 'Stitch', 1, 9, 11),
(12, 'Quinton', 'Kocher', 1, 14, 18),
(13, 'Lander', 'Busse', 1, 13, 17),
(14, 'Badge', 'Busse', 1, 11, 14),
(15, 'Daniel', 'Beresky', 1, 14, 18),
(16, 'David', 'Beresky', 1, 11, 14),
(17, 'Derek', 'Beresky', 1, 9, 12),
(26, 'Ron', 'Allen', 1, 14, 18),
(27, 'William', 'Arthur', 1, 14, 17),
(29, 'Jeff', 'Bania', 1, 11, 14),
(31, 'Thomas', 'Brown', 1, 5, 8),
(34, 'Jeff', 'Clay', 1, 12, 14),
(37, 'Greg', 'Hochstetler', 1, 2, 5),
(39, 'Tim', 'Johnson', 1, 14, 18),
(40, 'Eric', 'Johnson', 1, 13, 17),
(41, 'Jerry', 'King', 1, 12, 15),
(42, 'James', 'Lambright', 1, 13, 17),
(43, 'Heath', 'Lambright', 1, 9, 12),
(44, 'Rod', 'Linville', 1, 3, 6),
(45, 'Brent', 'Lowe', 1, 10, 13),
(46, 'Rex', 'Lowe', 1, 13, 17),
(47, 'Brian', 'Miller', 1, 14, 18),
(49, 'Frank', 'Oren', 1, 13, 17),
(51, 'Matthew', 'Patsch', 1, 12, 15),
(53, 'Chris', 'Ricker', 1, 13, 17),
(54, 'Alan', 'Ripper', 1, 7, 10),
(55, 'Adam', 'Ripper', 1, 9, 12),
(58, 'Tim', 'Scheutzow', 1, 14, 18),
(59, 'Jim', 'Surratt', 1, 1, 4),
(61, 'George', 'Vermilyea', 1, 14, 18),
(64, 'Michael', 'Winter', 1, 13, 17),
(65, 'David', 'Winter', 1, 11, 14),
(69, 'Bill', 'Bixby', 1, 2, 5),
(71, 'Justin', 'Brenenstuhl', 1, 4, 7),
(74, 'Bruce', 'Collier', 1, 12, 15),
(75, 'Matthew', 'Hoert', 1, 5, 8),
(76, 'Chad', 'Hoert', 1, 12, 15),
(77, 'Joshua', 'Hoert', 1, 7, 10),
(78, 'Zach', 'Misenko', 1, 10, 13),
(79, 'Adam', 'Misenko', 1, 9, 12),
(80, 'Seth', 'Misenko', 1, 5, 8),
(83, 'Rob', 'Cook', 1, 1, 4),
(90, 'Shawn', 'Gebbie', 1, 10, 13),
(92, 'Christopher', 'Conwill', 1, 11, 14),
(93, 'David', 'Conwill', 1, 9, 12),
(94, 'David', 'Gillespie', 1, 13, 17),
(99, 'John Mark', 'Hershberger', 1, 2, 5),
(103, 'Kurt', 'Kramer', 1, 3, 6),
(104, 'Kenton', 'Kramer', 1, 11, 14),
(105, 'Tommy', 'Lamborn', 1, 8, 11),
(106, 'David', 'Lamborn', 1, 6, 9),
(107, 'Michael', 'Leach', 1, 4, 7),
(113, 'Jonathan', 'Sommer', 1, 11, 14),
(116, 'Timothy', 'McQuerry', 1, 12, 15),
(117, 'Todd', 'Meridith', 1, 1, 4),
(121, 'Sean', 'Miller', 1, 2, 5),
(122, 'Reed', 'Monegan', 1, 3, 6),
(124, 'Steve', 'Nowack', 1, 9, 12),
(125, 'Matthew', 'Oates', 1, 5, 8),
(127, 'Kevin', 'Payne', 1, 14, 18),
(129, 'Rick', 'Powers', 1, 14, 18),
(130, 'Joshua', 'Powers', 1, 12, 15),
(132, 'Ryan', 'Roberts', 1, 11, 14),
(133, 'Darin', 'Rosenvold', 1, 13, 17),
(135, 'Jeff', 'Roth', 1, 11, 14),
(136, 'Jonathan', 'Roth', 1, 9, 12),
(137, 'John', 'Sebestyen', 1, 14, 18),
(138, 'David', 'Snyder', 1, 4, 7),
(139, 'Timothy', 'Work', 1, 12, 14),
(140, 'Andrew', 'Male', 1, 12, 15),
(144, 'William', 'Surgeon', 1, 14, 18),
(146, 'Ben', 'toot', 1, 12, 15),
(147, 'Michael', 'Smith', 1, 1, 4),
(149, 'Robert', 'Ward', 1, 2, 5),
(150, 'Bob', 'Weinerheimer', 1, 3, 6),
(151, 'Jeff', 'Williams', 1, 5, 8),
(152, 'Bo', 'Wilson', 1, 10, 13),
(153, 'Bill', 'Wilson', 1, 12, 15),
(154, 'Brian', 'Wolf', 1, 4, 7),
(157, 'Jay', 'Hardback', 1, 10, 13),
(158, 'Joe', 'Phillips', 1, 10, 13),
(159, 'Linden', 'Phillips', 1, 13, 17),
(161, 'Tom', 'Smith', 1, 10, 13),
(162, 'Thomas', 'Ellison', 1, 9, 12),
(163, 'Ben', 'Legg', 1, 9, 12),
(164, 'Marty', 'Walker', 1, 9, 12),
(166, 'Bobby', 'Scandlon', 1, 8, 11),
(167, 'Patrick', 'Scandlon', 1, 9, 12),
(168, 'Willard', 'Scandlon', 1, 12, 15),
(169, 'Austin', 'Scandlon', 1, 9, 12),
(170, 'Jimmy', 'Myers', 1, 8, 11),
(175, 'Tony', 'Dulgar', 1, 9, 12),
(176, 'Clifford', 'Phillips', 1, 4, 7),
(177, 'Scott', 'Phillips', 1, 1, 4),
(181, 'Rodge', 'Campbel', 1, 9, 12),
(182, 'Matthew', 'Perkins', 1, 12, 14),
(183, 'Leroy', 'Meadows', 1, 2, 5),
(185, 'John', 'Mullins', 1, 5, 8),
(186, 'Clifford', 'Roop', 1, 4, 9),
(187, 'Timothy', 'Roop', 1, 1, 4),
(189, 'Kim', 'Roose', 1, 13, 17),
(193, 'Michael', 'Tanner', 1, 12, 15),
(194, 'Michael', 'Vanek', 1, 9, 12),
(198, 'Paul', 'Brentlinger', 1, 3, 6),
(199, 'Paul', 'DeHart', 1, 14, 18),
(200, 'Nate', 'DeHart', 1, 12, 15),
(201, 'Nate', 'Wolf', 1, 10, 13),
(202, 'Grant', 'Steyer', 1, 10, 13),
(203, 'Todd', 'Steyer', 1, 8, 11),
(204, 'Teddy', 'Guyulas', 1, 12, 15),
(205, 'Tommy', 'Guyulas', 1, 10, 13),
(206, 'Wyatt', 'Cravatas', 1, 7, 10),
(207, 'Michael', 'Deuring', 1, 3, 5),
(208, 'Aaron', 'Hicks', 1, 4, 7),
(209, 'Doug', 'Dougherty', 1, 5, 8),
(211, 'Matthew', 'Honaker', 1, 3, 9),
(213, 'Andrew', 'Konya', 1, 5, 8),
(215, 'Fred', 'Leach', 1, 11, 14),
(216, 'Cole', 'Morgan', 1, 9, 12),
(217, 'Keeler', 'North', 1, 12, 14),
(218, 'Jason', 'Routzon', 1, 4, 7),
(219, 'Jim', 'Shimer', 1, 5, 8),
(220, 'Kevin', 'Tinter', 1, 1, 4),
(221, 'Daniel', 'Tousley', 1, 12, 16),
(223, 'Paul', 'Tousley', 1, 14, 18),
(224, 'Adam', 'Whitney', 1, 12, 14),
(226, 'Seth', 'Whitney', 1, 10, 13),
(227, 'Wesley', 'Loudermilk', 1, 12, 15),
(231, 'Wesley', 'Ziegler', 1, 11, 14),
(232, 'Charles', 'Ziegler', 1, 5, 11),
(233, 'David', 'Mullins', 1, 12, 14),
(234, 'Scott', 'Severence', 1, 13, 17),
(235, 'Jason', 'Stephens', 1, 12, 14),
(238, 'Brad', 'Seivers', 1, 3, 6),
(239, 'Zach', 'Oswold', 1, 8, 11),
(240, 'Wes', 'Boggs', 1, 7, 10),
(241, 'Matthew', 'Strang', 1, 7, 10),
(243, 'David', 'Meisner', 1, 13, 17),
(244, 'Wyatt', 'Henderson', 1, 8, 11),
(245, 'Adam', 'Wonus', 1, 8, 11),
(246, 'Matthew', 'McCleese', 1, 6, 9),
(247, 'Cameron', 'Vogle', 1, 8, 11),
(248, 'Bodie', 'Hillwig', 1, 5, 8),
(249, 'Kevin', 'Pesheck', 1, 12, 15),
(250, 'Ian', 'Pesheck', 1, 9, 12),
(251, 'Christian', 'Pesheck', 1, 7, 10),
(252, 'Andy', 'Zywick', 1, 14, 18),
(253, 'John', 'Zywick', 1, 14, 18),
(254, 'David', 'Brown', 1, 14, 18),
(255, 'Andrew', 'Stefan', 1, 11, 14),
(256, 'Matthew', 'Stefan', 1, 5, 11),
(257, 'Christopher', 'Brown', 1, 9, 12),
(259, 'Ben', 'Olsen', 1, 10, 13),
(261, 'Bryce', 'Sedio', 1, 9, 12),
(262, 'Jared', 'Wills', 1, 9, 12),
(263, 'Nick', 'WIlls', 1, 7, 10),
(264, 'Casey', 'O\'Brian', 1, 8, 11),
(265, 'Shawn', 'O\'Brian', 1, 9, 12),
(266, 'Jason', 'Linden', 1, 11, 14),
(267, 'Perry', 'Cohen', 1, 10, 13),
(268, 'Austin', 'Stephanos', 1, 10, 13),
(269, 'Steven', 'Roque', 1, 9, 12),
(270, 'Nathan', 'Roque', 1, 7, 10),
(272, 'Geoffry', 'Martel', 1, 7, 10),
(273, 'Gregory', 'Martel', 1, 8, 11),
(274, 'Grant', 'Martel', 1, 12, 15),
(277, 'Eric', 'Clinton', 1, 11, 14),
(278, 'J\'mark', 'Boliver', 1, 8, 11),
(279, 'J\'Herne', 'Boliver', 1, 13, 17),
(280, 'Mark', 'Zurowski', 1, 8, 11),
(281, 'Matthew', 'Zurowski', 1, 13, 17),
(282, 'Michael', 'Zurowski', 1, 11, 14),
(283, 'Duncan', 'McCord', 1, 9, 12),
(284, 'Malcom', 'McCord', 1, 10, 13),
(285, 'Angus', 'McCord', 1, 7, 10),
(286, 'Clay', 'Parris', 1, 10, 13),
(287, 'Kendall', 'Virginia', 1, 9, 12),
(288, 'Mathias', 'Uribe', 1, 11, 14),
(289, 'Nicholas', 'Uribe', 1, 13, 17),
(290, 'Michael', 'Stolzenberg', 1, 10, 13),
(291, 'Harris', 'Stolzenberg', 1, 14, 18),
(292, 'Philip', 'Mashki', 1, 9, 12),
(293, 'Philip', 'Mahi', 1, 9, 12),
(294, 'Florian', 'France', 1, 10, 14),
(295, 'Julian', 'France', 1, 8, 11),
(297, 'Donny', 'harmison', 1, 11, 14),
(299, 'Donny', 'MPMS', 1, 9, 12),
(300, 'Chris', 'Keope', 1, 9, 12),
(301, 'Jake', 'Carner', 1, 10, 13),
(302, 'Jake', 'Jurowski', 1, 10, 13),
(303, 'Robbie', 'MPMS', 1, 10, 14),
(304, 'Phillip', 'Green', 1, 10, 13),
(305, 'Shawn', 'Green', 1, 9, 12),
(306, 'shawn', 'gray', 1, 10, 13),
(307, 'Brandon', 'Knight', 1, 10, 13),
(308, 'Phillip', 'Wilsie', 1, 11, 14),
(309, 'Caleb', 'Hollo', 1, 12, 14),
(310, 'Jared', 'Grey', 1, 10, 13),
(311, 'Redmond', 'Gerard', 1, 13, 17),
(312, 'Tom', 'Holland', 1, 12, 14),
(313, 'Lucas', 'Judy', 1, 9, 12),
(314, 'Lucas', 'Benentt', 1, 11, 14),
(315, 'Jared', 'Enting', 1, 11, 14),
(316, 'Jared', 'MPMS', 1, 9, 12),
(317, 'Frank', 'Panstingal', 1, 11, 14),
(318, 'Adrian', 'Wilson', 1, 11, 14),
(319, 'Cory', 'Saddler', 1, 11, 14),
(320, 'Nick', 'Markley', 1, 12, 15),
(321, 'Telo ', 'Grove', 1, 7, 10),
(324, 'Danny', 'Bevan', 1, 10, 13),
(328, 'Josh', 'Green', 1, 9, 12),
(329, 'Garett', 'Stewart', 1, 9, 12),
(331, 'Mark', 'Bazemore', 1, 12, 15),
(332, 'John', 'McVicker', 1, 11, 14),
(333, 'Frank', 'DeCapio', 1, 9, 12),
(334, 'Mark', 'Sunde', 1, 8, 11),
(335, 'Jeremy', 'Morningstar', 1, 9, 12),
(336, 'Jordan', 'Zolman', 1, 10, 13),
(338, 'Mason', 'Cooley', 1, 10, 13),
(339, 'Connor', 'masonfriend', 1, 10, 13),
(340, 'Greg', 'Kinitis', 1, 12, 15),
(341, 'Adam', 'Johnson', 1, 7, 10),
(342, 'Justin', 'Bonheim', 1, 8, 11),
(343, 'Blake', 'Bonheim', 1, 5, 8),
(344, 'Andrew', 'Sherer', 1, 13, 17),
(345, 'Mark', 'Zuiderveen', 1, 13, 17),
(346, 'Jim', 'Ringer', 1, 14, 18),
(347, 'Jason', 'Mascari', 1, 14, 18),
(348, 'brent', 'Davis', 1, 14, 18),
(349, 'Danny', 'Kyper', 1, 13, 17),
(350, 'Danny', 'Webster', 1, 11, 15),
(351, 'clay', 'Febus', 1, 14, 18),
(352, 'Brian', 'clayfriend', 1, 14, 18),
(353, 'David', 'Farley', 1, 9, 12),
(354, 'Tyler', 'Andrew', 1, 7, 10),
(355, 'Brian', 'Vickers', 1, 10, 13),
(356, 'Anthony', 'PIasano', 1, 9, 12),
(357, 'Zach', 'Arnold', 1, 10, 13),
(358, 'Brandon', 'Kaskey', 1, 8, 11),
(359, 'Jimmy', 'Kaskey', 1, 9, 12),
(360, 'Jimmy', 'Guess', 1, 10, 13),
(361, 'Eric', 'Guillentine', 1, 11, 14),
(362, 'Joshua', 'Mullins', 1, 11, 14),
(363, 'Nathan', 'Cunningham', 1, 12, 16),
(364, 'Seth', 'Cunningham', 1, 10, 13),
(365, 'Benny', 'Cunningham', 1, 9, 12),
(367, 'Alexi', 'Ivanovich', 1, 8, 12),
(368, 'Ivan', 'Demitrovich', 1, 9, 12),
(369, 'Dale', 'Berskin', 1, 10, 13),
(370, 'Matt', 'Carper', 1, 10, 13),
(371, 'Jack', 'Carper', 1, 10, 13),
(372, 'Austin', 'Oh', 1, 10, 13),
(373, 'Ryan', 'Hornack', 1, 11, 14),
(374, 'Shawn', 'Baisden', 1, 6, 9),
(375, 'Jimmy', 'Meyers', 1, 6, 9),
(376, 'Jimmy', 'Murphy', 1, 14, 18),
(377, 'Brad', 'Brock', 1, 14, 18),
(378, 'Randy', 'Richner', 1, 14, 18),
(381, 'Andrew', 'Witzak', 1, 10, 13),
(383, 'Kyle', 'Bruffy', 1, 10, 14),
(384, 'Alex', 'dakota', 1, 9, 12),
(385, 'Danny', 'Dakota', 1, 6, 9),
(386, 'David', 'Calif', 1, 13, 11),
(387, 'Jeremy', 'playfirstbase', 1, 10, 13),
(388, 'David', 'Jamison', 1, 8, 11),
(389, 'Barry', 'Horvath', 1, 6, 9),
(390, 'Marc', 'Berry', 1, 9, 12),
(391, 'Marc', 'Calif', 1, 11, 14),
(392, 'Troy', 'Berry', 1, 8, 11),
(393, 'Kyle', 'Chippewa', 1, 10, 14),
(394, 'Matthew', 'Lacrosse', 1, 12, 15),
(395, 'Derwin', 'Loverink', 1, 13, 16),
(396, 'Peter', 'Loverink', 1, 8, 11),
(397, 'Aiden', 'Loverink', 1, 6, 9),
(398, 'Gordy', 'Sanders', 1, 13, 17),
(399, 'Nico', 'White', 1, 11, 14),
(400, 'Tommy', 'Brady', 1, 10, 13),
(401, 'Aaron', 'Green', 1, 6, 9),
(405, 'Mike', 'Long', 1, 13, 17),
(406, 'Mike', 'Cole', 1, 6, 9),
(407, 'Jordan', 'Grills', 1, 8, 11),
(408, 'Johnny', 'McDougal', 1, 14, 18),
(409, 'Steve', 'Brown', 1, 13, 17),
(410, 'Greg', 'Streme', 1, 11, 14),
(411, 'Abdul', 'Gassed', 1, 11, 14),
(412, 'Greg ', 'Cornelius', 1, 10, 14),
(414, 'Bobby', 'Pembridge', 1, 8, 11),
(415, 'Tim', 'Miskimen', 1, 8, 11),
(416, 'Ryan', 'O\'Callaghan', 1, 9, 12),
(417, 'Eric', 'O\'Callaghan', 1, 11, 14),
(419, 'Codi', 'Schmidt-McPhee', 1, 14, 18),
(420, 'Ty', 'Sheridin', 1, 11, 14),
(421, 'Jacob seth', 'Loughland', 1, 11, 14),
(422, 'Seth', 'Clearwater', 1, 12, 14),
(423, 'Thomas', 'Brodi-Sanger', 1, 13, 17),
(424, 'Mickey', 'Matson', 1, 11, 13),
(425, 'Brett', 'Portage', 1, 9, 12),
(426, 'Brett', 'Nau', 1, 11, 14),
(427, 'David', 'Wright', 1, 8, 11),
(428, 'Frankie', 'Suthard', 1, 13, 17),
(429, 'Cody', 'Suthard', 1, 9, 12),
(430, 'Jase', 'Suthard', 1, 7, 10),
(431, 'Philip', 'Smith-bros', 1, 14, 18),
(432, 'Reshet', 'Moti', 1, 10, 13),
(433, 'CJ', 'Scout', 1, 8, 11),
(434, 'Caleb', 'Scout', 1, 7, 10),
(435, 'Chris', 'Scout', 1, 8, 11),
(437, 'Misha', 'Hotel', 1, 8, 11),
(438, 'Matty', 'Aussie', 1, 14, 18),
(439, 'Julian', 'Aussie', 1, 12, 15),
(440, 'Mikey', 'Argy', 1, 10, 13),
(441, 'Sandro', 'Argy', 1, 10, 13),
(442, 'Jeremy', 'Kocher', 1, 10, 13),
(443, 'Zach', 'Kocher', 1, 8, 11),
(444, 'Gregory', 'Petek', 1, 11, 14),
(445, 'Thomas', 'Petek', 1, 11, 14),
(446, 'Mark', 'Regowski', 1, 11, 14),
(447, 'Randall', 'Bolinger', 1, 11, 14),
(448, 'Eric', 'Larson', 1, 10, 9),
(449, 'Steven', 'Larson', 1, 6, 9),
(450, 'Carter', 'Bratton', 1, 10, 13),
(451, 'Rotem', 'Mathias', 1, 13, 17),
(452, 'Erick', 'Johnson', 1, 14, 18),
(454, 'Jacob', 'Wetterling', 1, 9, 12),
(455, 'Tom', 'Daley', 1, 12, 15),
(456, 'Tom', 'Danley', 1, 12, 15),
(457, 'Brig', 'Miller', 1, 8, 11),
(458, 'Dillon', 'Weisler', 1, 8, 11),
(459, 'Jaden', 'Henline', 1, 10, 13),
(463, 'Ryan', 'McManus', 1, 8, 11),
(464, 'Jacob', 'Miracle', 1, 8, 11),
(465, 'Aiden', 'Bryant', 1, 13, 17),
(466, 'Bo', 'Folger', 1, 7, 10),
(467, 'Tyler', 'Folger', 1, 9, 12),
(468, 'Lucas', 'Folger', 1, 10, 14),
(469, 'Cort', 'Oregon', 1, 11, 14),
(470, 'David', 'Whitewolf', 1, 8, 11),
(471, 'Ralph', 'Marachio', 1, 13, 17),
(472, 'Devon', 'Sawa', 1, 14, 18),
(473, 'Greg', 'Xenon', 1, 11, 14),
(474, 'Robert', 'Irwin', 1, 12, 16),
(475, 'Drilon', 'Krane', 1, 6, 9),
(476, 'Drin', 'Krane', 1, 11, 14),
(477, 'Lucas', 'Wallencheck', 1, 12, 16),
(478, 'Brian', 'Clouds', 1, 9, 12),
(479, 'Charlie', 'Bandan', 1, 10, 13),
(480, 'Tyler', 'VA', 1, 8, 11),
(481, 'Grayson', 'DC', 1, 13, 16),
(482, 'Tanner', 'VA', 1, 9, 12),
(483, 'Taylor', 'Starr', 1, 8, 11),
(484, 'Hunter', 'Starr', 1, 8, 11),
(485, 'Thomas', 'Tex', 1, 9, 12),
(486, 'Robert', 'Burroughs', 1, 5, 9),
(487, 'David', 'Anthony', 1, 4, 7),
(488, 'William', 'Blakeney', 1, 9, 12),
(489, 'Philip', 'Model', 1, 12, 15),
(490, 'Scott', 'Allen', 1, 10, 13),
(491, 'Scott', 'Drummond', 1, 10, 13),
(492, 'Ron', 'Drummond', 1, 12, 16),
(493, 'Brett', 'Klauss', 1, 10, 13),
(494, 'Jason', 'Klauss', 1, 9, 12),
(496, 'Zach', 'Garner', 1, 10, 13),
(497, 'Keegan', 'Garner', 1, 7, 10),
(498, 'Zach', 'Mesinko', 1, 10, 13),
(499, 'Adam', 'Mesinko', 1, 8, 11),
(500, 'Danny', 'Chambers', 1, 8, 11),
(501, 'Danny', 'Honeycutt', 1, 7, 10),
(502, 'Danny', 'Winton', 1, 8, 11),
(503, 'Lars', 'Eckburg', 1, 11, 14),
(509, 'Duke', 'Gains', 1, 10, 13),
(510, 'Jeff', 'Mohler', 1, 14, 18),
(511, 'Andrew', 'Mohler', 1, 11, 14),
(512, 'Nathan', 'Mohler', 1, 14, 18),
(513, 'Jacob', 'Mohler', 1, 12, 15),
(514, 'Martin', 'Mohler', 1, 8, 11),
(515, 'Randall', 'Mohler', 1, 6, 8),
(516, 'Jeremy', 'Reeder', 1, 7, 10),
(517, 'Ben', 'Hawley', 1, 7, 10),
(518, 'Joshua', 'Robb', 1, 13, 17),
(519, 'JJ', 'Robb', 1, 9, 12),
(520, 'Joey', 'Robb', 1, 6, 8),
(521, 'Ilia', 'Malinin', 1, 13, 17),
(522, 'Simon', 'Brown', 1, 8, 11),
(523, 'Tyler', 'Kobel', 1, 9, 12),
(524, 'Mario', 'Roulette', 1, 8, 11),
(525, 'Rick', 'Dancer', 1, 9, 12),
(526, 'Gabriel', 'Silva', 1, 14, 17),
(527, 'Joshua', 'Kontour', 1, 9, 12),
(528, 'Evan', 'Kontour', 1, 13, 17),
(529, 'Joshua', 'Dundr', 1, 9, 12),
(530, 'David', 'Merk', 1, 10, 13),
(531, 'Charles', 'Ridley', 1, 14, 18),
(532, 'Johnathan', 'Ridley', 1, 12, 16),
(533, 'Paul', 'Ridley', 1, 10, 13),
(534, 'Michael', 'Slayton', 1, 6, 9),
(535, 'Christian', 'Slayton', 1, 12, 15),
(536, 'Levi', 'McCoaughey', 1, 12, 15),
(537, 'Livingston', 'McConaughey', 1, 7, 10),
(538, 'William', 'Vance', 1, 11, 15),
(539, 'Andrew', 'Miller', 1, 6, 9),
(540, 'Bradley', 'Little', 1, 6, 9),
(541, 'Curtis', 'Post', 1, 8, 11),
(542, 'Scout', 'Beachovich', 1, 7, 10),
(543, 'Deven', 'Jackson', 1, 13, 17),
(544, 'Casey', 'Likes', 1, 13, 17),
(545, 'Eitan', 'Yahalomi', 1, 9, 12),
(546, 'Rizkallah', 'Saliba', 1, 14, 18),
(547, 'Austin', 'Saliba', 1, 13, 17),
(548, 'David', 'Saliba', 1, 13, 17),
(549, 'Neil', 'Rutter', 1, 5, 7),
(550, 'John', 'Skyview', 1, 11, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_titles`
--

CREATE TABLE `tbl_titles` (
  `title_id` int(11) NOT NULL,
  `title_name` varchar(100) NOT NULL,
  `title_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tbl_enrollments`
--
ALTER TABLE `tbl_enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `faculty_dept_id` (`faculty_dept_id`);

--
-- Indexes for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `tbl_grade_levels`
--
ALTER TABLE `tbl_grade_levels`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `tbl_sections`
--
ALTER TABLE `tbl_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_gender_id` (`student_gender_id`),
  ADD KEY `grade_level_id` (`grade_level_id`);

--
-- Indexes for table `tbl_titles`
--
ALTER TABLE `tbl_titles`
  ADD PRIMARY KEY (`title_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_enrollments`
--
ALTER TABLE `tbl_enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_grade_levels`
--
ALTER TABLE `tbl_grade_levels`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_sections`
--
ALTER TABLE `tbl_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;

--
-- AUTO_INCREMENT for table `tbl_titles`
--
ALTER TABLE `tbl_titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD CONSTRAINT `tbl_courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `tbl_departments` (`department_id`);

--
-- Constraints for table `tbl_enrollments`
--
ALTER TABLE `tbl_enrollments`
  ADD CONSTRAINT `tbl_enrollments_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `tbl_sections` (`section_id`),
  ADD CONSTRAINT `tbl_enrollments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`);

--
-- Constraints for table `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  ADD CONSTRAINT `tbl_faculty_ibfk_1` FOREIGN KEY (`faculty_dept_id`) REFERENCES `tbl_departments` (`department_id`);

--
-- Constraints for table `tbl_sections`
--
ALTER TABLE `tbl_sections`
  ADD CONSTRAINT `tbl_sections_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  ADD CONSTRAINT `tbl_sections_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `tbl_grade_levels` (`grade_id`);

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `tbl_student_ibfk_12` FOREIGN KEY (`grade_level_id`) REFERENCES `tbl_grade_levels` (`grade_id`),
  ADD CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`student_gender_id`) REFERENCES `tbl_gender` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
