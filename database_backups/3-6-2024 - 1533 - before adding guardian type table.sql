-- Adminer 4.8.1 MySQL 11.2.2-MariaDB-1:11.2.2+maria~ubu2204 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `alembic_version` (`version_num`) VALUES
('9d19dcf89f04');

DROP TABLE IF EXISTS `tbl_comments`;
CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `author_id` (`author_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_comments_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `tbl_employees` (`employee_id`),
  CONSTRAINT `tbl_comments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_comments` (`comment_id`, `comment_text`, `student_id`, `author_id`, `timestamp`) VALUES
(1,	'Test Comment',	44,	13,	'2024-02-19 16:37:10'),
(2,	'Extremely involved in enviornemtal causes and actions',	14,	13,	'2024-02-19 16:40:42');

DROP TABLE IF EXISTS `tbl_courses`;
CREATE TABLE `tbl_courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `tbl_courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `tbl_departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_courses` (`course_id`, `course_name`, `department_id`) VALUES
(9,	'Science 6 (General)',	2),
(10,	'Science 7 (Life)',	2),
(11,	'Science 8 (Earth)',	2),
(12,	'Science 9 (Physical)',	2),
(13,	'General Biology',	2),
(14,	'General Chemistry',	2),
(15,	'General Physics',	2),
(28,	'Pre-School Numbers',	18),
(29,	'Pre-School Letters',	18),
(30,	'Pre-School Bible',	18),
(31,	'Pre-School Science',	18),
(32,	'Pre-School Language',	18),
(33,	'Pre-School Spelling',	18),
(34,	'Pre-School Social Skills',	18),
(35,	'Pre-School Art',	18),
(36,	'Pre-School Music',	18),
(37,	'Pre-School Gym',	18),
(38,	'Pre-School Health',	18),
(39,	'Pre-School Computers',	18),
(40,	'KDG Bible',	19),
(41,	'Kdg - Math',	19),
(42,	'Kdg - Science',	19),
(43,	'Kdg - Language Arts',	19),
(44,	'Kdg - Reading',	19),
(45,	'Kdg - History',	19),
(46,	'Kdg - Music',	19),
(47,	'Kdg - Art',	19),
(48,	'Kdg - Gym',	19),
(49,	'1st Grade Bible',	20),
(50,	'1st Grade Math',	20),
(51,	'1st Grade Science',	20),
(52,	'1st Grade Computers',	20),
(53,	'1st Grade Reading',	20),
(54,	'1st Grade English',	20),
(55,	'1st Grade Spelling',	20),
(56,	'1st Grade Gym',	20),
(57,	'1st Grade Art',	20),
(58,	'1st Grade Music',	20);

DROP TABLE IF EXISTS `tbl_departments`;
CREATE TABLE `tbl_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_departments` (`department_id`, `department_name`) VALUES
(1,	'Bible'),
(2,	'Science'),
(3,	'Math'),
(4,	'English'),
(5,	'Fine Arts'),
(6,	'History / Social Studies'),
(7,	'Foreign Languages'),
(8,	'Health / PE'),
(9,	'Literature'),
(10,	'Computers'),
(11,	'Performing Arts'),
(12,	'Career and Technical Education'),
(13,	'Business Education'),
(14,	'Technology Education'),
(15,	'Special Education'),
(16,	'Guidance Counseling'),
(17,	'Library / Media Center'),
(18,	'Pre-School'),
(19,	'Kindergarten'),
(20,	'1st Grade'),
(21,	'2nd Grade'),
(22,	'3rd Grade'),
(23,	'4th Grade'),
(24,	'5th Grade'),
(25,	'Administration'),
(26,	'Office'),
(27,	'Facilities'),
(28,	'Student Services'),
(29,	'Counseling'),
(31,	'Athletics'),
(32,	'Home Economics'),
(33,	'Shop');

DROP TABLE IF EXISTS `tbl_employees`;
CREATE TABLE `tbl_employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_fname` varchar(45) NOT NULL,
  `employee_lname` varchar(45) NOT NULL,
  `employee_dept_id` int(11) NOT NULL,
  `employee_title_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `employee_dept_id` (`employee_dept_id`),
  KEY `employee_title_id` (`employee_title_id`),
  CONSTRAINT `tbl_employees_ibfk_1` FOREIGN KEY (`employee_dept_id`) REFERENCES `tbl_departments` (`department_id`),
  CONSTRAINT `tbl_employees_ibfk_2` FOREIGN KEY (`employee_title_id`) REFERENCES `tbl_titles` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_employees` (`employee_id`, `employee_fname`, `employee_lname`, `employee_dept_id`, `employee_title_id`) VALUES
(1,	'Kelly',	'Utlak',	26,	15),
(2,	'Kay',	'Winton',	26,	14),
(3,	'William',	'Taylor',	25,	9),
(4,	'Dirk',	'Pearce',	25,	8),
(5,	'Linda',	'Ricker',	25,	5),
(6,	'Ann',	'Lowe',	20,	12),
(7,	'Mitch',	'Domer',	4,	12),
(8,	'Lisa',	'Domer',	28,	23),
(9,	'Ken',	'Anderson',	25,	17),
(10,	'Darren',	'Melugin',	1,	11),
(11,	'Laura',	'Distel',	26,	14),
(12,	'Robert',	'Gillespie',	2,	12),
(13,	'Gary',	'Johnson',	16,	10),
(14,	'Shelva',	'Johnson',	5,	12),
(15,	'Shirley',	'Walker',	5,	12),
(16,	'Dennis',	'Meers',	8,	12),
(17,	'Rose',	'Corbin',	21,	12),
(18,	'Eileen',	'Raich',	22,	12),
(19,	'Monica',	'Miller',	23,	12),
(20,	'Cory',	'Burkett',	23,	12),
(21,	'Cindy',	'Chase',	23,	12),
(22,	'Susan',	'Clark',	24,	12),
(23,	'Rebecca',	'Barns',	15,	12),
(24,	'Stan',	'Zurowski',	25,	7),
(25,	'William',	'White',	25,	1),
(26,	'Bruce',	'Whitski',	25,	4),
(27,	'Lois',	'Gillespie',	10,	12),
(28,	'Philip',	'Partee',	6,	12),
(29,	'Joanie',	'Holmes',	6,	12),
(30,	'Dawn',	'Cunningham',	4,	12),
(31,	'Aimee',	'Copeland',	4,	12),
(32,	'Vera',	'Jariga',	7,	12),
(33,	'Anita',	'Ponzer',	7,	12),
(34,	'Karen',	'Sommer',	32,	12),
(35,	'Dennis',	'Hoert',	33,	12),
(36,	'Frank',	'Schritz',	2,	12),
(37,	'Kenneth',	'Rhodes',	6,	12),
(38,	'Deborah',	'Sherman',	4,	12),
(39,	'Toni',	'Merlino',	4,	12),
(40,	'Mary',	'Olsen',	5,	12),
(41,	'Susan',	'Newcommer',	5,	12),
(42,	'Mark',	'Taylor',	5,	12),
(43,	'Pauline',	'Kettinring',	5,	12),
(44,	'Mark',	'Culchar',	5,	12),
(45,	'David',	'Short',	5,	12),
(46,	'David',	'Hawk',	2,	12),
(47,	'Rebecca',	'Wright',	21,	12),
(48,	'Donna',	'Rutter',	22,	12),
(49,	'Cathy',	'Beam',	3,	12),
(50,	'Kathy',	'Stouffer',	3,	12),
(51,	'Aleatha',	'Ziegler',	28,	23);

DROP TABLE IF EXISTS `tbl_enrollments`;
CREATE TABLE `tbl_enrollments` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `section_id` (`section_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_enrollments_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `tbl_sections` (`section_id`),
  CONSTRAINT `tbl_enrollments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_gender`;
CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(20) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_gender` (`gender_id`, `gender_name`) VALUES
(1,	'Male'),
(2,	'Female');

DROP TABLE IF EXISTS `tbl_grade_levels`;
CREATE TABLE `tbl_grade_levels` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(20) NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_grade_levels` (`grade_id`, `grade_name`) VALUES
(1,	'PK3'),
(2,	'PK4'),
(3,	'KDG'),
(4,	'1'),
(5,	'2'),
(6,	'3'),
(7,	'4'),
(8,	'5'),
(9,	'6'),
(10,	'7'),
(11,	'8'),
(12,	'9'),
(13,	'10'),
(14,	'11'),
(15,	'12');

DROP TABLE IF EXISTS `tbl_guardian_type`;
CREATE TABLE `tbl_guardian_type` (
  `guardian_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `guardian_type_name` varchar(50) NOT NULL,
  `guardian_type_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guardian_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_parents`;
CREATE TABLE `tbl_parents` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_fname` varchar(45) DEFAULT NULL,
  `parent_lname` varchar(45) DEFAULT NULL,
  `parent_email` varchar(100) NOT NULL,
  `parent_password` varchar(255) NOT NULL,
  PRIMARY KEY (`parent_id`),
  UNIQUE KEY `parent_email` (`parent_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_parents` (`parent_id`, `parent_fname`, `parent_lname`, `parent_email`, `parent_password`) VALUES
(1,	'Carol',	'Zelenka',	'czelenka@gmail.com',	'1234'),
(2,	'James',	'Zalenka',	'JZ@jztools.com',	'1234');

DROP TABLE IF EXISTS `tbl_parent_student`;
CREATE TABLE `tbl_parent_student` (
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`parent_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_parent_student_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tbl_parents` (`parent_id`),
  CONSTRAINT `tbl_parent_student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_sections`;
CREATE TABLE `tbl_sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`),
  KEY `course_id` (`course_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `tbl_sections_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  CONSTRAINT `tbl_sections_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `tbl_grade_levels` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_fname` varchar(45) DEFAULT NULL,
  `student_lname` varchar(45) DEFAULT NULL,
  `student_gender_id` int(11) DEFAULT NULL,
  `grade_level_id` int(11) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_gender_id` (`student_gender_id`),
  KEY `grade_level_id` (`grade_level_id`),
  CONSTRAINT `tbl_student_ibfk_12` FOREIGN KEY (`grade_level_id`) REFERENCES `tbl_grade_levels` (`grade_id`),
  CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`student_gender_id`) REFERENCES `tbl_gender` (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `tbl_student` (`student_id`, `student_fname`, `student_lname`, `student_gender_id`, `grade_level_id`, `student_age`) VALUES
(11,	'Jeremy',	'Stitch',	1,	9,	11),
(12,	'Quinton',	'Kocher',	1,	14,	18),
(13,	'Lander',	'Busse',	1,	13,	17),
(14,	'Badge',	'Busse',	1,	11,	14),
(15,	'Daniel',	'Beresky',	1,	14,	18),
(16,	'David',	'Beresky',	1,	11,	14),
(17,	'Derek',	'Beresky',	1,	9,	12),
(26,	'Ron',	'Allen',	1,	14,	18),
(27,	'William',	'Arthur',	1,	14,	17),
(29,	'Jeff',	'Bania',	1,	11,	14),
(31,	'Thomas',	'Brown',	1,	5,	8),
(34,	'Jeff',	'Clay',	1,	12,	14),
(37,	'Greg',	'Hochstetler',	1,	2,	5),
(39,	'Tim',	'Johnson',	1,	14,	18),
(40,	'Eric',	'Johnson',	1,	13,	17),
(41,	'Jerry',	'King',	1,	12,	15),
(42,	'James',	'Lambright',	1,	13,	17),
(43,	'Heath',	'Lambright',	1,	9,	12),
(44,	'Rod',	'Linville',	1,	3,	6),
(45,	'Brent',	'Lowe',	1,	10,	13),
(46,	'Rex',	'Lowe',	1,	13,	17),
(47,	'Brian',	'Miller',	1,	14,	18),
(49,	'Frank',	'Oren',	1,	13,	17),
(51,	'Matthew',	'Patsch',	1,	12,	15),
(53,	'Chris',	'Ricker',	1,	13,	17),
(54,	'Alan',	'Ripper',	1,	7,	10),
(55,	'Adam',	'Ripper',	1,	9,	12),
(58,	'Tim',	'Scheutzow',	1,	14,	18),
(59,	'Jim',	'Surratt',	1,	1,	4),
(61,	'George',	'Vermilyea',	1,	14,	18),
(64,	'Michael',	'Winter',	1,	13,	17),
(65,	'David',	'Winter',	1,	11,	14),
(69,	'Bill',	'Bixby',	1,	2,	5),
(71,	'Justin',	'Brenenstuhl',	1,	4,	7),
(74,	'Bruce',	'Collier',	1,	12,	15),
(75,	'Matthew',	'Hoert',	1,	5,	8),
(76,	'Chad',	'Hoert',	1,	12,	15),
(77,	'Joshua',	'Hoert',	1,	7,	10),
(78,	'Zach',	'Misenko',	1,	10,	13),
(79,	'Adam',	'Misenko',	1,	9,	12),
(80,	'Seth',	'Misenko',	1,	5,	8),
(83,	'Rob',	'Cook',	1,	1,	4),
(90,	'Shawn',	'Gebbie',	1,	10,	13),
(92,	'Christopher',	'Conwill',	1,	11,	14),
(93,	'David',	'Conwill',	1,	9,	12),
(94,	'David',	'Gillespie',	1,	13,	17),
(99,	'John Mark',	'Hershberger',	1,	2,	5),
(103,	'Kurt',	'Kramer',	1,	3,	6),
(104,	'Kenton',	'Kramer',	1,	11,	14),
(105,	'Tommy',	'Lamborn',	1,	8,	11),
(106,	'David',	'Lamborn',	1,	6,	9),
(107,	'Michael',	'Leach',	1,	4,	7),
(113,	'Jonathan',	'Sommer',	1,	11,	14),
(116,	'Timothy',	'McQuerry',	1,	12,	15),
(117,	'Todd',	'Meridith',	1,	1,	4),
(121,	'Sean',	'Miller',	1,	2,	5),
(122,	'Reed',	'Monegan',	1,	3,	6),
(124,	'Steve',	'Nowack',	1,	9,	12),
(125,	'Matthew',	'Oates',	1,	5,	8),
(127,	'Kevin',	'Payne',	1,	14,	18),
(129,	'Rick',	'Powers',	1,	14,	18),
(130,	'Joshua',	'Powers',	1,	12,	15),
(132,	'Ryan',	'Roberts',	1,	11,	14),
(133,	'Darin',	'Rosenvold',	1,	13,	17),
(135,	'Jeff',	'Roth',	1,	11,	14),
(136,	'Jonathan',	'Roth',	1,	9,	12),
(137,	'John',	'Sebestyen',	1,	14,	18),
(138,	'David',	'Snyder',	1,	4,	7),
(139,	'Timothy',	'Work',	1,	12,	14),
(140,	'Andrew',	'Male',	1,	12,	15),
(144,	'William',	'Surgeon',	1,	14,	18),
(146,	'Ben',	'toot',	1,	12,	15),
(147,	'Michael',	'Smith',	1,	1,	4),
(149,	'Robert',	'Ward',	1,	2,	5),
(150,	'Bob',	'Weinerheimer',	1,	3,	6),
(151,	'Jeff',	'Williams',	1,	5,	8),
(152,	'Bo',	'Wilson',	1,	10,	13),
(153,	'Bill',	'Wilson',	1,	12,	15),
(154,	'Brian',	'Wolf',	1,	4,	7),
(157,	'Jay',	'Hardback',	1,	10,	13),
(158,	'Joe',	'Phillips',	1,	10,	13),
(159,	'Linden',	'Phillips',	1,	13,	17),
(161,	'Tom',	'Smith',	1,	10,	13),
(162,	'Thomas',	'Ellison',	1,	9,	12),
(163,	'Ben',	'Legg',	1,	9,	12),
(164,	'Marty',	'Walker',	1,	9,	12),
(166,	'Bobby',	'Scandlon',	1,	8,	11),
(167,	'Patrick',	'Scandlon',	1,	9,	12),
(168,	'Willard',	'Scandlon',	1,	12,	15),
(169,	'Austin',	'Scandlon',	1,	9,	12),
(170,	'Jimmy',	'Myers',	1,	8,	11),
(175,	'Tony',	'Dulgar',	1,	9,	12),
(176,	'Clifford',	'Phillips',	1,	4,	7),
(177,	'Scott',	'Phillips',	1,	1,	4),
(181,	'Rodge',	'Campbel',	1,	9,	12),
(182,	'Matthew',	'Perkins',	1,	12,	14),
(183,	'Leroy',	'Meadows',	1,	2,	5),
(185,	'John',	'Mullins',	1,	5,	8),
(186,	'Clifford',	'Roop',	1,	4,	9),
(187,	'Timothy',	'Roop',	1,	1,	4),
(189,	'Kim',	'Roose',	1,	13,	17),
(193,	'Michael',	'Tanner',	1,	12,	15),
(194,	'Michael',	'Vanek',	1,	9,	12),
(198,	'Paul',	'Brentlinger',	1,	3,	6),
(199,	'Paul',	'DeHart',	1,	14,	18),
(200,	'Nate',	'DeHart',	1,	12,	15),
(201,	'Nate',	'Wolf',	1,	10,	13),
(202,	'Grant',	'Steyer',	1,	10,	13),
(203,	'Todd',	'Steyer',	1,	8,	11),
(204,	'Teddy',	'Guyulas',	1,	12,	15),
(205,	'Tommy',	'Guyulas',	1,	10,	13),
(206,	'Wyatt',	'Cravatas',	1,	7,	10),
(207,	'Michael',	'Deuring',	1,	3,	5),
(208,	'Aaron',	'Hicks',	1,	4,	7),
(209,	'Doug',	'Dougherty',	1,	5,	8),
(211,	'Matthew',	'Honaker',	1,	3,	9),
(213,	'Andrew',	'Konya',	1,	5,	8),
(215,	'Fred',	'Leach',	1,	11,	14),
(216,	'Cole',	'Morgan',	1,	9,	12),
(217,	'Keeler',	'North',	1,	12,	14),
(218,	'Jason',	'Routzon',	1,	4,	7),
(219,	'Jim',	'Shimer',	1,	5,	8),
(220,	'Kevin',	'Tinter',	1,	1,	4),
(221,	'Daniel',	'Tousley',	1,	12,	16),
(223,	'Paul',	'Tousley',	1,	14,	18),
(224,	'Adam',	'Whitney',	1,	12,	14),
(226,	'Seth',	'Whitney',	1,	10,	13),
(227,	'Wesley',	'Loudermilk',	1,	12,	15),
(231,	'Wesley',	'Ziegler',	1,	11,	14),
(232,	'Charles',	'Ziegler',	1,	5,	11),
(233,	'David',	'Mullins',	1,	12,	14),
(234,	'Scott',	'Severence',	1,	13,	17),
(235,	'Jason',	'Stephens',	1,	12,	14),
(238,	'Brad',	'Seivers',	1,	3,	6),
(239,	'Zach',	'Oswold',	1,	8,	11),
(240,	'Wes',	'Boggs',	1,	7,	10),
(241,	'Matthew',	'Strang',	1,	7,	10),
(243,	'David',	'Meisner',	1,	13,	17),
(244,	'Wyatt',	'Henderson',	1,	8,	11),
(245,	'Adam',	'Wonus',	1,	8,	11),
(246,	'Matthew',	'McCleese',	1,	6,	9),
(247,	'Cameron',	'Vogle',	1,	8,	11),
(248,	'Bodie',	'Hillwig',	1,	5,	8),
(249,	'Kevin',	'Pesheck',	1,	12,	15),
(250,	'Ian',	'Pesheck',	1,	9,	12),
(251,	'Christian',	'Pesheck',	1,	7,	10),
(252,	'Andy',	'Zywick',	1,	14,	18),
(253,	'John',	'Zywick',	1,	14,	18),
(254,	'David',	'Brown',	1,	14,	18),
(255,	'Andrew',	'Stefan',	1,	11,	14),
(256,	'Matthew',	'Stefan',	1,	5,	11),
(257,	'Christopher',	'Brown',	1,	9,	12),
(259,	'Ben',	'Olsen',	1,	10,	13),
(261,	'Bryce',	'Sedio',	1,	9,	12),
(262,	'Jared',	'Wills',	1,	9,	12),
(263,	'Nick',	'WIlls',	1,	7,	10),
(264,	'Casey',	'O\'Brian',	1,	8,	11),
(265,	'Shawn',	'O\'Brian',	1,	9,	12),
(266,	'Jason',	'Linden',	1,	11,	14),
(267,	'Perry',	'Cohen',	1,	10,	13),
(268,	'Austin',	'Stephanos',	1,	10,	13),
(269,	'Steven',	'Roque',	1,	9,	12),
(270,	'Nathan',	'Roque',	1,	7,	10),
(272,	'Geoffry',	'Martel',	1,	7,	10),
(273,	'Gregory',	'Martel',	1,	8,	11),
(274,	'Grant',	'Martel',	1,	12,	15),
(277,	'Eric',	'Clinton',	1,	11,	14),
(278,	'J\'mark',	'Boliver',	1,	8,	11),
(279,	'J\'Herne',	'Boliver',	1,	13,	17),
(280,	'Mark',	'Zurowski',	1,	8,	11),
(281,	'Matthew',	'Zurowski',	1,	13,	17),
(282,	'Michael',	'Zurowski',	1,	11,	14),
(283,	'Duncan',	'McCord',	1,	9,	12),
(284,	'Malcom',	'McCord',	1,	10,	13),
(285,	'Angus',	'McCord',	1,	7,	10),
(286,	'Clay',	'Parris',	1,	10,	13),
(287,	'Kendall',	'Virginia',	1,	9,	12),
(288,	'Mathias',	'Uribe',	1,	11,	14),
(289,	'Nicholas',	'Uribe',	1,	13,	17),
(290,	'Michael',	'Stolzenberg',	1,	10,	13),
(291,	'Harris',	'Stolzenberg',	1,	14,	18),
(292,	'Philip',	'Mashki',	1,	9,	12),
(293,	'Philip',	'Mahi',	1,	9,	12),
(294,	'Florian',	'France',	1,	10,	14),
(295,	'Julian',	'France',	1,	8,	11),
(297,	'Donny',	'harmison',	1,	11,	14),
(299,	'Donny',	'MPMS',	1,	9,	12),
(300,	'Chris',	'Keope',	1,	9,	12),
(301,	'Jake',	'Carner',	1,	10,	13),
(302,	'Jake',	'Jurowski',	1,	10,	13),
(303,	'Robbie',	'MPMS',	1,	10,	14),
(304,	'Phillip',	'Green',	1,	10,	13),
(305,	'Shawn',	'Green',	1,	9,	12),
(306,	'shawn',	'gray',	1,	10,	13),
(307,	'Brandon',	'Knight',	1,	10,	13),
(308,	'Phillip',	'Wilsie',	1,	11,	14),
(309,	'Caleb',	'Hollo',	1,	12,	14),
(310,	'Jared',	'Grey',	1,	10,	13),
(311,	'Redmond',	'Gerard',	1,	13,	17),
(312,	'Tom',	'Holland',	1,	12,	14),
(313,	'Lucas',	'Judy',	1,	9,	12),
(314,	'Lucas',	'Benentt',	1,	11,	14),
(315,	'Jared',	'Enting',	1,	11,	14),
(316,	'Jared',	'MPMS',	1,	9,	12),
(317,	'Frank',	'Panstingal',	1,	11,	14),
(318,	'Adrian',	'Wilson',	1,	11,	14),
(319,	'Cory',	'Saddler',	1,	11,	14),
(320,	'Nick',	'Markley',	1,	12,	15),
(321,	'Telo ',	'Grove',	1,	7,	10),
(324,	'Danny',	'Bevan',	1,	10,	13),
(328,	'Josh',	'Green',	1,	9,	12),
(329,	'Garett',	'Stewart',	1,	9,	12),
(331,	'Mark',	'Bazemore',	1,	12,	15),
(332,	'John',	'McVicker',	1,	11,	14),
(333,	'Frank',	'DeCapio',	1,	9,	12),
(334,	'Mark',	'Sunde',	1,	8,	11),
(335,	'Jeremy',	'Morningstar',	1,	9,	12),
(336,	'Jordan',	'Zolman',	1,	10,	13),
(338,	'Mason',	'Cooley',	1,	10,	13),
(339,	'Connor',	'masonfriend',	1,	10,	13),
(340,	'Greg',	'Kinitis',	1,	12,	15),
(341,	'Adam',	'Johnson',	1,	7,	10),
(342,	'Justin',	'Bonheim',	1,	8,	11),
(343,	'Blake',	'Bonheim',	1,	5,	8),
(344,	'Andrew',	'Sherer',	1,	13,	17),
(345,	'Mark',	'Zuiderveen',	1,	13,	17),
(346,	'Jim',	'Ringer',	1,	14,	18),
(347,	'Jason',	'Mascari',	1,	14,	18),
(348,	'brent',	'Davis',	1,	14,	18),
(349,	'Danny',	'Kyper',	1,	13,	17),
(350,	'Danny',	'Webster',	1,	11,	15),
(351,	'clay',	'Febus',	1,	14,	18),
(352,	'Brian',	'clayfriend',	1,	14,	18),
(353,	'David',	'Farley',	1,	9,	12),
(354,	'Tyler',	'Andrew',	1,	7,	10),
(355,	'Brian',	'Vickers',	1,	10,	13),
(356,	'Anthony',	'PIasano',	1,	9,	12),
(357,	'Zach',	'Arnold',	1,	10,	13),
(358,	'Brandon',	'Kaskey',	1,	8,	11),
(359,	'Jimmy',	'Kaskey',	1,	9,	12),
(360,	'Jimmy',	'Guess',	1,	10,	13),
(361,	'Eric',	'Guillentine',	1,	11,	14),
(362,	'Joshua',	'Mullins',	1,	11,	14),
(363,	'Nathan',	'Cunningham',	1,	12,	16),
(364,	'Seth',	'Cunningham',	1,	10,	13),
(365,	'Benny',	'Cunningham',	1,	9,	12),
(367,	'Alexi',	'Ivanovich',	1,	8,	12),
(368,	'Ivan',	'Demitrovich',	1,	9,	12),
(369,	'Dale',	'Berskin',	1,	10,	13),
(370,	'Matt',	'Carper',	1,	10,	13),
(371,	'Jack',	'Carper',	1,	10,	13),
(372,	'Austin',	'Oh',	1,	10,	13),
(373,	'Ryan',	'Hornack',	1,	11,	14),
(374,	'Shawn',	'Baisden',	1,	6,	9),
(375,	'Jimmy',	'Meyers',	1,	6,	9),
(376,	'Jimmy',	'Murphy',	1,	14,	18),
(377,	'Brad',	'Brock',	1,	14,	18),
(378,	'Randy',	'Richner',	1,	14,	18),
(381,	'Andrew',	'Witzak',	1,	10,	13),
(383,	'Kyle',	'Bruffy',	1,	10,	14),
(384,	'Alex',	'dakota',	1,	9,	12),
(385,	'Danny',	'Dakota',	1,	6,	9),
(386,	'David',	'Calif',	1,	13,	11),
(387,	'Jeremy',	'playfirstbase',	1,	10,	13),
(388,	'David',	'Jamison',	1,	8,	11),
(389,	'Barry',	'Horvath',	1,	6,	9),
(390,	'Marc',	'Berry',	1,	9,	12),
(391,	'Marc',	'Calif',	1,	11,	14),
(392,	'Troy',	'Berry',	1,	8,	11),
(393,	'Kyle',	'Chippewa',	1,	10,	14),
(394,	'Matthew',	'Lacrosse',	1,	12,	15),
(395,	'Derwin',	'Loverink',	1,	13,	16),
(396,	'Peter',	'Loverink',	1,	8,	11),
(397,	'Aiden',	'Loverink',	1,	6,	9),
(398,	'Gordy',	'Sanders',	1,	13,	17),
(399,	'Nico',	'White',	1,	11,	14),
(400,	'Tommy',	'Brady',	1,	10,	13),
(401,	'Aaron',	'Green',	1,	6,	9),
(405,	'Mike',	'Long',	1,	13,	17),
(406,	'Mike',	'Cole',	1,	6,	9),
(407,	'Jordan',	'Grills',	1,	8,	11),
(408,	'Johnny',	'McDougal',	1,	14,	18),
(409,	'Steve',	'Brown',	1,	13,	17),
(410,	'Greg',	'Streme',	1,	11,	14),
(411,	'Abdul',	'Gassed',	1,	11,	14),
(412,	'Greg ',	'Cornelius',	1,	10,	14),
(414,	'Bobby',	'Pembridge',	1,	8,	11),
(415,	'Tim',	'Miskimen',	1,	8,	11),
(416,	'Ryan',	'O\'Callaghan',	1,	9,	12),
(417,	'Eric',	'O\'Callaghan',	1,	11,	14),
(419,	'Codi',	'Schmidt-McPhee',	1,	14,	18),
(420,	'Ty',	'Sheridin',	1,	11,	14),
(421,	'Jacob seth',	'Loughland',	1,	11,	14),
(422,	'Seth',	'Clearwater',	1,	12,	14),
(423,	'Thomas',	'Brodi-Sanger',	1,	13,	17),
(424,	'Mickey',	'Matson',	1,	11,	13),
(425,	'Brett',	'Portage',	1,	9,	12),
(426,	'Brett',	'Nau',	1,	11,	14),
(427,	'David',	'Wright',	1,	8,	11),
(428,	'Frankie',	'Suthard',	1,	13,	17),
(429,	'Cody',	'Suthard',	1,	9,	12),
(430,	'Jase',	'Suthard',	1,	7,	10),
(431,	'Philip',	'Smith-bros',	1,	14,	18),
(432,	'Reshet',	'Moti',	1,	10,	13),
(433,	'CJ',	'Scout',	1,	8,	11),
(434,	'Caleb',	'Scout',	1,	7,	10),
(435,	'Chris',	'Scout',	1,	8,	11),
(437,	'Misha',	'Hotel',	1,	8,	11),
(438,	'Matty',	'Aussie',	1,	14,	18),
(439,	'Julian',	'Aussie',	1,	12,	15),
(440,	'Mikey',	'Argy',	1,	10,	13),
(441,	'Sandro',	'Argy',	1,	10,	13),
(442,	'Jeremy',	'Kocher',	1,	10,	13),
(443,	'Zach',	'Kocher',	1,	8,	11),
(444,	'Gregory',	'Petek',	1,	11,	14),
(445,	'Thomas',	'Petek',	1,	11,	14),
(446,	'Mark',	'Regowski',	1,	11,	14),
(447,	'Randall',	'Bolinger',	1,	11,	14),
(448,	'Eric',	'Larson',	1,	10,	9),
(449,	'Steven',	'Larson',	1,	6,	9),
(450,	'Carter',	'Bratton',	1,	10,	13),
(451,	'Rotem',	'Mathias',	1,	13,	17),
(452,	'Erick',	'Johnson',	1,	14,	18),
(454,	'Jacob',	'Wetterling',	1,	9,	12),
(455,	'Tom',	'Daley',	1,	12,	15),
(456,	'Tom',	'Danley',	1,	12,	15),
(457,	'Brig',	'Miller',	1,	8,	11),
(458,	'Dillon',	'Weisler',	1,	8,	11),
(459,	'Jaden',	'Henline',	1,	10,	13),
(463,	'Ryan',	'McManus',	1,	8,	11),
(464,	'Jacob',	'Miracle',	1,	8,	11),
(465,	'Aiden',	'Bryant',	1,	13,	17),
(466,	'Bo',	'Folger',	1,	7,	10),
(467,	'Tyler',	'Folger',	1,	9,	12),
(468,	'Lucas',	'Folger',	1,	10,	14),
(469,	'Cort',	'Oregon',	1,	11,	14),
(470,	'David',	'Whitewolf',	1,	8,	11),
(471,	'Ralph',	'Marachio',	1,	13,	17),
(472,	'Devon',	'Sawa',	1,	14,	18),
(473,	'Greg',	'Xenon',	1,	11,	14),
(474,	'Robert',	'Irwin',	1,	12,	16),
(475,	'Drilon',	'Sadiku',	1,	1,	9),
(476,	'Drin',	'Sadiku',	1,	12,	14),
(477,	'Lucas',	'Wallencheck',	1,	12,	16),
(478,	'Brian',	'Clouds',	1,	9,	12),
(479,	'Charlie',	'Bandan',	1,	10,	13),
(480,	'Tyler',	'VA',	1,	8,	11),
(481,	'Grayson',	'DC',	1,	13,	16),
(482,	'Tanner',	'VA',	1,	9,	12),
(483,	'Taylor',	'Starr',	1,	8,	11),
(484,	'Hunter',	'Starr',	1,	8,	11),
(485,	'Thomas',	'Tex',	1,	9,	12),
(486,	'Robert',	'Burroughs',	1,	5,	9),
(487,	'David',	'Anthony',	1,	4,	7),
(488,	'William',	'Blakeney',	1,	9,	12),
(489,	'Philip',	'Model',	1,	12,	15),
(490,	'Scott',	'Allen',	1,	10,	13),
(491,	'Scott',	'Drummond',	1,	10,	13),
(492,	'Ron',	'Drummond',	1,	12,	16),
(493,	'Brett',	'Klauss',	1,	10,	13),
(494,	'Jason',	'Klauss',	1,	9,	12),
(496,	'Zach',	'Garner',	1,	10,	13),
(497,	'Keegan',	'Garner',	1,	7,	10),
(498,	'Zach',	'Mesinko',	1,	10,	13),
(499,	'Adam',	'Mesinko',	1,	8,	11),
(500,	'Danny',	'Chambers',	1,	8,	11),
(501,	'Danny',	'Honeycutt',	1,	7,	10),
(502,	'Danny',	'Winton',	1,	8,	11),
(503,	'Lars',	'Eckburg',	1,	11,	14),
(509,	'Duke',	'Gains',	1,	10,	13),
(510,	'Jeff',	'Mohler',	1,	14,	18),
(511,	'Andrew',	'Mohler',	1,	11,	14),
(512,	'Nathan',	'Mohler',	1,	14,	18),
(513,	'Jacob',	'Mohler',	1,	12,	15),
(514,	'Martin',	'Mohler',	1,	8,	11),
(515,	'Randall',	'Mohler',	1,	6,	8),
(516,	'Jeremy',	'Reeder',	1,	7,	10),
(517,	'Ben',	'Hawley',	1,	7,	10),
(518,	'Joshua',	'Robb',	1,	13,	17),
(519,	'JJ',	'Robb',	1,	9,	12),
(520,	'Joey',	'Robb',	1,	6,	8),
(521,	'Ilia',	'Malinin',	1,	13,	17),
(522,	'Simon',	'Brown',	1,	8,	11),
(523,	'Tyler',	'Kobel',	1,	9,	12),
(524,	'Mario',	'Roulette',	1,	8,	11),
(525,	'Rick',	'Dancer',	1,	9,	12),
(526,	'Gabriel',	'Silva',	1,	14,	17),
(527,	'Joshua',	'Kontour',	1,	9,	12),
(528,	'Evan',	'Kontour',	1,	13,	17),
(529,	'Joshua',	'Dundr',	1,	9,	12),
(530,	'David',	'Merk',	1,	10,	13),
(531,	'Charles',	'Ridley',	1,	14,	18),
(532,	'Johnathan',	'Ridley',	1,	12,	16),
(533,	'Paul',	'Ridley',	1,	10,	13),
(534,	'Michael',	'Slayton',	1,	6,	9),
(535,	'Christian',	'Slayton',	1,	12,	15),
(536,	'Levi',	'McCoaughey',	1,	12,	15),
(537,	'Livingston',	'McConaughey',	1,	7,	10),
(538,	'William',	'Vance',	1,	11,	15),
(539,	'Andrew',	'Miller',	1,	6,	9),
(540,	'Bradley',	'Little',	1,	6,	9),
(541,	'Curtis',	'Post',	1,	8,	11),
(542,	'Scout',	'Beachovich',	1,	7,	10),
(543,	'Deven',	'Jackson',	1,	13,	17),
(544,	'Casey',	'Likes',	1,	13,	17),
(545,	'Eitan',	'Yahalomi',	1,	9,	12),
(546,	'Rizkallah',	'Saliba',	1,	14,	18),
(547,	'Austin',	'Saliba',	1,	13,	17),
(548,	'David',	'Saliba',	1,	13,	17),
(549,	'Neil',	'Rutter',	1,	5,	7),
(550,	'John',	'Skyview',	1,	11,	13),
(551,	'Timothy',	'Bair',	1,	11,	13),
(552,	'David',	'Bair',	1,	8,	10),
(553,	'Michael',	'Weber',	1,	11,	14),
(554,	'Dean',	'Howard',	1,	12,	15),
(555,	'Brandon',	'DelToro',	1,	14,	18),
(556,	'Aaron',	'Favri',	1,	12,	14),
(557,	'Carson',	'Glasier',	1,	11,	13),
(558,	'Connor',	'Glasier',	1,	13,	15);

DROP TABLE IF EXISTS `tbl_titles`;
CREATE TABLE `tbl_titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(100) NOT NULL,
  `title_description` text DEFAULT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_titles` (`title_id`, `title_name`, `title_description`) VALUES
(1,	'Superintendent',	'Supervises all aspects of school operations'),
(4,	'Principal',	'Supervises the Teachers and Staff of all the school.'),
(5,	'Assistant - Principal - Primary School',	'In charge of the Primary School'),
(7,	'Assistant Principal - Lower School',	'In charge of all aspects of the Lower School'),
(8,	'Assistant Principal - Middle School',	'In charge of all aspects of the Middle School'),
(9,	'Assistant Principal - High School',	'In charge of all aspects of the High School'),
(10,	'Guidance Councilor',	'Provides personal, career and academic guidance to students and parents'),
(11,	'Campus Pastor',	'Provides spiritual guidance to the student body -- in charge of chapels and other spiritual life functions of the school'),
(12,	'Faculty',	'Teachers classes in the specified department'),
(13,	'Office Administrator',	'In charge of the school or department office'),
(14,	'Secretary',	'Provides customer service functions to the students, faculty, staff, visitors and parents'),
(15,	'Accountant',	'Handles the finances of the school'),
(16,	'Lunchroom Helper',	'Assists in the running of the lunchroom and foodservice'),
(17,	'Athletic Director',	'In charge of all aspects of the school\'s athletic program'),
(18,	'Facilities Manager',	'In charge of the physical plant of the school'),
(19,	'Janitor',	'Assists in the upkeep and maintenance of the physical plant of the school'),
(22,	'Coach',	'Directs a specific Inter-scholastic athletic team'),
(23,	'Librarian',	'Responsible for the smooth operation of the library / Media Center');

-- 2024-03-06 20:33:01
