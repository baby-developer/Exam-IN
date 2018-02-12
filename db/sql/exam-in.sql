-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2018 at 02:07 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam-in`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` smallint(100) NOT NULL,
  `user_id` smallint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `cid` smallint(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(255) DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`cid`, `first_name`, `last_name`, `email`, `phone`, `message`) VALUES
(1, 'asdasdas', 'dasdasd', 'asdasd@sadfsa.com', 8388607, 'asdasdsad');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feedback` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `name`, `email`, `feedback`) VALUES
(1, 'Sujit Singh', 'sujitkuma2rsin2gh29@gmail.com', 'Really love your website');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` smallint(100) NOT NULL,
  `user_id` smallint(100) NOT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `user_id`, `specialization`, `qualification`) VALUES
(1, 2, NULL, NULL),
(2, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` smallint(100) NOT NULL,
  `user_id` smallint(100) NOT NULL,
  `interest` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `user_id`, `interest`) VALUES
(5, 9, ''),
(6, 11, ''),
(7, 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `test_attempted`
--

CREATE TABLE `test_attempted` (
  `attempt_id` smallint(6) NOT NULL,
  `result_id` smallint(50) NOT NULL,
  `question_id` smallint(50) NOT NULL,
  `answer` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_attempted`
--

INSERT INTO `test_attempted` (`attempt_id`, `result_id`, `question_id`, `answer`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 3),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 1, 5, 4),
(6, 2, 10, 3),
(7, 2, 11, 2),
(8, 2, 12, 4),
(9, 2, 13, 2),
(10, 2, 14, 3),
(11, 3, 6, 1),
(12, 3, 7, 1),
(13, 3, 8, 1),
(14, 3, 9, 1),
(15, 4, 10, 3),
(16, 4, 11, 2),
(17, 4, 12, 4),
(18, 4, 13, 1),
(19, 4, 14, 2),
(20, 5, 1, 1),
(21, 5, 2, 3),
(22, 5, 3, 1),
(23, 5, 4, 4),
(24, 5, 5, 0),
(25, 6, 10, 3),
(26, 6, 11, 2),
(27, 6, 12, 4),
(28, 6, 13, 0),
(29, 6, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_bank`
--

CREATE TABLE `test_bank` (
  `test_id` smallint(100) NOT NULL,
  `staff_id` smallint(100) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `test_stream` varchar(50) NOT NULL,
  `test_subject` varchar(50) NOT NULL,
  `number_of_questions` int(30) NOT NULL,
  `neg_marks` tinyint(5) DEFAULT NULL,
  `test_time` tinyint(100) DEFAULT NULL,
  `test_visibility` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_bank`
--

INSERT INTO `test_bank` (`test_id`, `staff_id`, `test_name`, `test_stream`, `test_subject`, `number_of_questions`, `neg_marks`, `test_time`, `test_visibility`) VALUES
(7, 2, 'Class-Test 4', 'MCA-CET', 'Computer Awareness', 5, 1, 60, 0),
(8, 1, 'Tutorial Test 1', 'MBA-CET', 'Computer Awareness', 4, 2, 40, 0),
(9, 2, 'Mock Test 1', 'MCA', 'Sets', 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `question_id` tinyint(4) NOT NULL,
  `test_id` tinyint(100) NOT NULL,
  `question` varchar(100) NOT NULL,
  `option_1` varchar(100) NOT NULL,
  `option_2` varchar(100) NOT NULL,
  `option_3` varchar(100) NOT NULL,
  `option_4` varchar(100) NOT NULL,
  `correct_option` tinyint(5) NOT NULL,
  `marks` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`question_id`, `test_id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `correct_option`, `marks`) VALUES
(1, 7, 'asdasdasd', 'asdasd', 'asdasd', 'asdasdsd', 'asdasdasd', 1, 5),
(2, 7, 'asdasd', 'sadasd', 'dasdsd', 'dassdaasd', 'dxzsadaws', 3, 3),
(3, 7, 'khgjh', 'gj', 'hg', 'jhgj', 'hgjhjhg', 1, 4),
(4, 7, 'sdfdsfdsf', 'qsdfsdfsd', 'sdfsdfsd', 'sdfsdfsdf', 'dsfsdfsd', 4, 2),
(5, 7, 'sfsdfsdf', 'sdfsdfsfsgfd', 'fgdfhgsdf', 'ssfdhdfg', 'FDGDFGD', 2, 5),
(6, 8, 'asdasdsads', 'asdsadsadasd', 'sdfsdfsdfsdf', 'sdfsdsdgdfbvcb', 'cxbvncvnvn', 3, 3),
(7, 8, 'asdasdas ddscxzvxcbv', 'bvcvcnvbcbvcb', ' sadas cxcvcxbvas', 'dgfsfdgdfgcxbcv', 'zzzxcxv dsgdfg', 3, 4),
(8, 8, 'asda Sd sadfvdsv', 'SAdASd sadxzc', 'asdasgfsdv', 'dsfsdfsdf', 'asdasfsdvsdv', 1, 5),
(9, 8, 'ASdsac', 'asdasc sad', 'asdascsa ', 'asd asczxcas', 'asdsacsa', 4, 2),
(10, 9, 'A __________ is an ordered collection of objects.', 'Relation', 'Function', 'Set', 'Proposition', 3, 4),
(11, 9, 'The set O of odd positive integers less than 10 can be expressed by _____________.', '{1, 2, 3}', '{1, 3, 5, 7, 9}', '{1, 2, 5, 9}', '{1, 5, 7, 9, 11}', 2, 4),
(12, 9, 'Power set of empty set has exactly _________ subset.', 'One ', 'Two', 'Zero', 'Three', 1, 4),
(13, 9, 'What is the Cartesian product of A = {1, 2} and B = {a, b}?', '{(1, a), (1, b), (2, a), (b, b)}', '{(1, 1), (2, 2), (a, a), (b, b)}', '{(1, a), (2, a), (1, b), (2, b)}', '{(1, 1), (a, a), (2, a), (1, b)}', 3, 4),
(14, 9, 'What is the cardinality of the set of odd positive integers less than 10?', '10', '5', '3', '20', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `test_result`
--

CREATE TABLE `test_result` (
  `result_id` smallint(6) NOT NULL,
  `stud_id` smallint(50) NOT NULL,
  `test_id` smallint(50) NOT NULL,
  `attempted` tinyint(50) NOT NULL,
  `not_attempted` tinyint(50) NOT NULL,
  `right_answers` tinyint(50) NOT NULL,
  `wrong_answers` tinyint(50) NOT NULL,
  `marks_obtained` tinyint(100) NOT NULL,
  `total_marks` tinyint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_result`
--

INSERT INTO `test_result` (`result_id`, `stud_id`, `test_id`, `attempted`, `not_attempted`, `right_answers`, `wrong_answers`, `marks_obtained`, `total_marks`) VALUES
(1, 6, 7, 5, 0, 3, 2, 12, 19),
(2, 6, 9, 5, 0, 2, 3, 5, 20),
(3, 6, 8, 4, 0, 1, 3, -1, 14),
(4, 6, 9, 5, 0, 3, 2, 10, 20),
(5, 6, 7, 4, 1, 4, 0, 14, 19),
(6, 7, 9, 4, 1, 2, 2, 6, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` smallint(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `user_type` tinyint(5) NOT NULL,
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `email`, `password`, `hash`, `user_type`, `active`) VALUES
(1, 'Sujit', 'Singh', 'Baby-Dev', 'sujitkumarsingh29@gmail.com', '$2y$10$R2z5mnHfRI.EL.1tXFdGBOZQ12SCZyKHi2IyO7cWEvd6GBlZoXn8S', '19f3cd308f1455b3fa09a282e0d496f4', 0, 1),
(2, 'Shubham', 'Shripurkar', 'Bumquest', 'shirpurkar.shubham@gmail.com', '$2y$10$DWBo6pSsAIWwGRlFvIYUDO6mLGChMRigvtMyA.CnG2Hl1b3MROYve', '7dcd340d84f762eba80aa538b0c527f7', 1, 1),
(9, 'Sneha', 'Joglekar', 'snehaj', 'snehajoglekar123@gmail.com', '$2y$10$mAskjcEBp2lQTWe0dhih1epUBddThkQEiYC.JklcsJ3Rc0XxehF76', '1ff8a7b5dc7a7d1f0ed65aaa29c04b1e', 2, 1),
(10, 'Anup', 'Chatlawar', 'Anup_321', 'anupcha2299@gmail.com', '$2y$10$wahcArvn8DBaAP1q4NIcbufnh05P.NPibAACoAxzW.Avc57wW4pKO', '94f6d7e04a4d452035300f18b984988c', 1, 1),
(11, 'Francis', 'Lepcha', 'francislp21', 'francislp21@gmail.com', '$2y$10$7GZNfxMoUM4urCH/FvvDBeQH.pkQoXgqr50c1FVeRYqAdm.ya8Pvq', 'fbd7939d674997cdb4692d34de8633c4', 2, 1),
(12, 'Rupash', 'Rauth', 'Rups_420', 'rupsr420@gmail.com', '$2y$10$xAmAg6/Q1lZ99S8fV4eMveboW6fgiWhQMecG.VwzAmOWo0erQFZ0y', '5dd9db5e033da9c6fb5ba83c7a7ebea9', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`);

--
-- Indexes for table `test_attempted`
--
ALTER TABLE `test_attempted`
  ADD PRIMARY KEY (`attempt_id`);

--
-- Indexes for table `test_bank`
--
ALTER TABLE `test_bank`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` smallint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `cid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` smallint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stud_id` smallint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test_attempted`
--
ALTER TABLE `test_attempted`
  MODIFY `attempt_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `test_bank`
--
ALTER TABLE `test_bank`
  MODIFY `test_id` smallint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `question_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `test_result`
--
ALTER TABLE `test_result`
  MODIFY `result_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` smallint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
