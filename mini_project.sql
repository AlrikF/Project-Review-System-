-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2019 at 09:21 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Abstract_upload_path` (IN `group_id1` INT, IN `abstract_path` VARCHAR(200))  BEGIN
    IF ((SELECT count(*) FROM group_review1 WHERE Group_id=group_id1 )>0)
     Then
       
            UPDATE group_review1 SET Project_report=abstract_path WHERE Group_id=group_id1;

     
     Else
       
            Insert Into group_review1 (Group_id,Project_report) Values (group_id1,abstract_path);

     END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Abstract_upload_path2` (IN `group_id2` INT, IN `abstract_path` VARCHAR(200))  BEGIN
    IF ((SELECT count(*) FROM group_review2 WHERE Group_id=group_id2 )>0)
     Then
       
            UPDATE group_review2 SET Project_report=abstract_path WHERE Group_id=group_id2;

     
     Else
       
            Insert Into group_review2 (Group_id,Project_report) Values (group_id2,abstract_path);

     END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Co_ordinator_select_date` (IN `week_num` INT, IN `from_d` DATE, IN `to_d` DATE)  BEGIN
    IF ((SELECT count(*) FROM weekly_date WHERE Week_no=week_num )>0)
     Then
       
            UPDATE weekly_date SET From_date=from_d ,To_date=to_d where Week_no=week_num;
	END IF;
     
     IF NOT ((SELECT count(*) FROM weekly_date WHERE Week_no=week_num )>0)
     Then
            Insert Into weekly_date(Week_no,From_date,To_date) Values (week_num,from_d,to_d);

     END IF;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `group_info`
--

CREATE TABLE `group_info` (
  `grp_id` int(11) NOT NULL,
  `proj_platform` varchar(40) DEFAULT NULL,
  `proj_area` varchar(30) DEFAULT NULL,
  `Guide_id` int(11) DEFAULT NULL,
  `Reviewer_id` int(11) DEFAULT NULL,
  `Group_password` int(11) NOT NULL,
  `Problem_title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_info`
--

INSERT INTO `group_info` (`grp_id`, `proj_platform`, `proj_area`, `Guide_id`, `Reviewer_id`, `Group_password`, `Problem_title`) VALUES
(1, 'TensorFlow', 'Machine Learning', 1, 2, 1234, 'OCT Image generator'),
(3, 'Opencv', 'Image Processing', 1, 4, 1234, 'Object  detection'),
(4, 'BeautifulSoup', 'Webscraping', 1, 2, 1234, 'Webscraping bot'),
(5, 'ReactJS', 'Frontend', 1, 2, 1234, 'Frontend project '),
(7, NULL, NULL, 1, 4, 1234, NULL),
(12, NULL, NULL, 1, 1, 1234, NULL),
(13, NULL, NULL, 1, 4, 1234, NULL),
(21, NULL, NULL, 1, 4, 1234, NULL),
(23, NULL, NULL, 7, 4, 1234, NULL),
(45, NULL, NULL, 9, 8, 1234, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_review1`
--

CREATE TABLE `group_review1` (
  `Group_id` int(11) NOT NULL,
  `Reviewer_comments` varchar(200) DEFAULT NULL,
  `Guide_comments` varchar(200) DEFAULT NULL,
  `Project_report` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_review1`
--

INSERT INTO `group_review1` (`Group_id`, `Reviewer_comments`, `Guide_comments`, `Project_report`) VALUES
(1, NULL, NULL, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\3D OCT REPORT GENERATOR.docx'),
(3, NULL, NULL, 'wolf.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `group_review2`
--

CREATE TABLE `group_review2` (
  `Group_id` int(11) NOT NULL,
  `Reviewer_comments` varchar(200) DEFAULT NULL,
  `Guide_comments` varchar(200) DEFAULT NULL,
  `Project_report` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_review2`
--

INSERT INTO `group_review2` (`Group_id`, `Reviewer_comments`, `Guide_comments`, `Project_report`) VALUES
(1, NULL, NULL, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\JSP.docx');

-- --------------------------------------------------------

--
-- Table structure for table `log_report`
--

CREATE TABLE `log_report` (
  `grp_id` int(11) DEFAULT NULL,
  `activity_planned` varchar(200) DEFAULT NULL,
  `activity_status` enum('pending','completed','rescheduled') DEFAULT NULL,
  `Guide_Status` enum('Not Approved','Approved') DEFAULT 'Not Approved'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review1`
--

CREATE TABLE `review1` (
  `stu_id` int(11) DEFAULT NULL,
  `bg_and_topic` int(11) DEFAULT NULL,
  `proj_scope` int(11) DEFAULT NULL,
  `lit_survey` int(11) DEFAULT NULL,
  `proj_planning` int(11) DEFAULT NULL,
  `presentation_skills` int(11) DEFAULT NULL,
  `q_and_a` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review1`
--

INSERT INTO `review1` (`stu_id`, `bg_and_topic`, `proj_scope`, `lit_survey`, `proj_planning`, `presentation_skills`, `q_and_a`) VALUES
(2, 1, 1, 1, 1, 1, 1),
(17, 2, 2, 2, 2, 2, 2),
(2, 1, 1, 1, 1, 1, 1),
(17, 3, 3, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `review2`
--

CREATE TABLE `review2` (
  `stu_id` int(11) DEFAULT NULL,
  `bg_and_topic` int(11) DEFAULT NULL,
  `proj_scope` int(11) DEFAULT NULL,
  `lit_survey` int(11) DEFAULT NULL,
  `proj_planning` int(11) DEFAULT NULL,
  `presentation_skills` int(11) DEFAULT NULL,
  `q_and_a` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sign`
--

CREATE TABLE `sign` (
  `Staff_id` int(11) NOT NULL,
  `Path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sign`
--

INSERT INTO `sign` (`Staff_id`, `Path`) VALUES
(1, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\wolf.jpg'),
(1, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\mount.jpg'),
(1, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\wolf.jpg'),
(1, 'D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent\\Images\\th.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(20) DEFAULT NULL,
  `job` enum('guide','reviewer','Co-ordinator') DEFAULT NULL,
  `staff_password` varchar(20) NOT NULL,
  `Staff_sign` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`s_id`, `s_name`, `job`, `staff_password`, `Staff_sign`) VALUES
(1, 'Raj', 'guide', '1234', ''),
(2, 'Ravi', 'reviewer', '1234', ''),
(4, 'Mendonca', 'reviewer', '1234', ''),
(5, 'Erwin', 'Co-ordinator', '1234', ''),
(7, '7', 'guide', '1234', ''),
(8, '8', 'reviewer', '1234', ''),
(9, '9', 'guide', '1234', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_alloted`
--

CREATE TABLE `staff_alloted` (
  `grp_id` int(11) NOT NULL DEFAULT 0,
  `g_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `stu_name` varchar(20) DEFAULT NULL,
  `stu_email` varchar(30) DEFAULT NULL,
  `sign` blob DEFAULT NULL,
  `Group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`roll_no`, `stu_name`, `stu_email`, `sign`, `Group_id`) VALUES
(2, 'Sameer', 'sammyjojo@gmail.com', NULL, 1),
(17, 'Alrik', 'alrik.fernandes@gmail.com', NULL, 1),
(20, NULL, NULL, NULL, 13),
(21, NULL, NULL, NULL, 13),
(22, NULL, NULL, NULL, 13),
(23, NULL, NULL, NULL, 7),
(34, NULL, NULL, NULL, 7),
(45, NULL, NULL, NULL, 7),
(46, NULL, NULL, NULL, 23),
(47, NULL, NULL, NULL, 23),
(48, NULL, NULL, NULL, 23),
(49, NULL, NULL, NULL, 23),
(56, NULL, NULL, NULL, 7),
(90, NULL, NULL, NULL, 45),
(91, NULL, NULL, NULL, 45),
(92, NULL, NULL, NULL, 45),
(93, NULL, NULL, NULL, 45),
(98, NULL, NULL, NULL, 21),
(99, NULL, NULL, NULL, 21),
(100, NULL, NULL, NULL, 21),
(101, NULL, NULL, NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `weekly_date`
--

CREATE TABLE `weekly_date` (
  `Week_no` int(11) NOT NULL,
  `From_date` date DEFAULT NULL,
  `To_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekly_date`
--

INSERT INTO `weekly_date` (`Week_no`, `From_date`, `To_date`) VALUES
(1, '2019-10-12', '2019-10-14'),
(2, '2019-10-15', '2019-10-18'),
(3, '2019-10-15', '2019-10-16'),
(6, '2019-09-03', '2019-10-01'),
(5, '2019-10-10', '2019-10-23'),
(4, '2019-10-01', '2019-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_log`
--

CREATE TABLE `weekly_log` (
  `Group_id` int(11) NOT NULL,
  `Week_no` int(11) NOT NULL,
  `Date_of_log` date DEFAULT NULL,
  `Topics` varchar(200) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekly_log`
--

INSERT INTO `weekly_log` (`Group_id`, `Week_no`, `Date_of_log`, `Topics`, `remarks`) VALUES
(1, 1, '2019-09-28', 'Machine Learning', 'Great'),
(1, 2, '2019-09-28', 'Artificial Intelligence ', 'Seems like a daunting task ahead'),
(1, 3, '2019-10-06', 'Frontend changes', 'Good progress'),
(1, 4, '2019-10-08', 'Functionality', 'Good'),
(1, 5, '2019-10-13', 'A lot of topics were discussed', 'Good progress'),
(1, 6, '2019-10-13', 'Good progress', 'Something'),
(1, 7, '2019-10-14', 'Done', 'Sehr Gut');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group_info`
--
ALTER TABLE `group_info`
  ADD PRIMARY KEY (`grp_id`),
  ADD KEY `g_id` (`Guide_id`),
  ADD KEY `r_id` (`Reviewer_id`);

--
-- Indexes for table `group_review1`
--
ALTER TABLE `group_review1`
  ADD PRIMARY KEY (`Group_id`);

--
-- Indexes for table `group_review2`
--
ALTER TABLE `group_review2`
  ADD PRIMARY KEY (`Group_id`);

--
-- Indexes for table `log_report`
--
ALTER TABLE `log_report`
  ADD KEY `grp_id` (`grp_id`);

--
-- Indexes for table `review1`
--
ALTER TABLE `review1`
  ADD KEY `stu_id` (`stu_id`);

--
-- Indexes for table `review2`
--
ALTER TABLE `review2`
  ADD KEY `stu_id` (`stu_id`);

--
-- Indexes for table `sign`
--
ALTER TABLE `sign`
  ADD KEY `Staff_id` (`Staff_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll_no`),
  ADD KEY `student_ibfk_1` (`Group_id`);

--
-- Indexes for table `weekly_log`
--
ALTER TABLE `weekly_log`
  ADD PRIMARY KEY (`Group_id`,`Week_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_info`
--
ALTER TABLE `group_info`
  ADD CONSTRAINT `group_info_ibfk_1` FOREIGN KEY (`Guide_id`) REFERENCES `staff` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_info_ibfk_2` FOREIGN KEY (`Reviewer_id`) REFERENCES `staff` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_review1`
--
ALTER TABLE `group_review1`
  ADD CONSTRAINT `group_review1_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `group_info` (`grp_id`) ON DELETE CASCADE;

--
-- Constraints for table `group_review2`
--
ALTER TABLE `group_review2`
  ADD CONSTRAINT `group_review2_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `group_info` (`grp_id`) ON DELETE CASCADE;

--
-- Constraints for table `log_report`
--
ALTER TABLE `log_report`
  ADD CONSTRAINT `Log_report_ibfk_1` FOREIGN KEY (`grp_id`) REFERENCES `group_info` (`grp_id`);

--
-- Constraints for table `review1`
--
ALTER TABLE `review1`
  ADD CONSTRAINT `Review1_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE;

--
-- Constraints for table `review2`
--
ALTER TABLE `review2`
  ADD CONSTRAINT `Review2_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`roll_no`);

--
-- Constraints for table `sign`
--
ALTER TABLE `sign`
  ADD CONSTRAINT `sign_ibfk_1` FOREIGN KEY (`Staff_id`) REFERENCES `staff` (`s_id`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `group_info` (`grp_id`) ON DELETE CASCADE;

--
-- Constraints for table `weekly_log`
--
ALTER TABLE `weekly_log`
  ADD CONSTRAINT `weekly_log_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `group_info` (`grp_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
