-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 03:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `name`) VALUES
(1, 'Sports'),
(2, 'Science'),
(3, 'Technology');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qid` int(11) NOT NULL,
  `question` text NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `answer_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `question`, `level`, `cat_id`, `answer_id`) VALUES
(1, 'After how many Year’s FIFA World Cup is held?', 'Beginner', 1, '3'),
(2, 'Which Country won the first FIFA World Cup?', 'Beginner', 1, '6'),
(3, 'Who won the first ICC World Cup?', 'Beginner', 1, '10'),
(4, 'What is the 100m World Record of Usain Bolt?', 'Beginner', 1, '14'),
(5, 'Who has the Highest Number of Gold Medals in Olympic History?', 'Intermediate', 1, '19'),
(6, 'Who is known as the Flying Sikh?', 'Intermediate', 1, '23'),
(7, 'What is the Women’s World Record of the 100-Meter Dash?', 'Intermediate', 1, '28'),
(8, 'Which Female has the Most Olympic Gold Medals in Olympic History?', 'Professional', 1, '31'),
(9, 'When was the first FIFA World Cup held?', 'Professional', 1, '33'),
(10, 'Which Sport is Valentino Rossi Known for?', 'Professional', 1, '38'),
(11, 'Which among the following temperature scale is based upon absolute zero?', 'Beginner', 2, '43'),
(12, 'The pulling sensation when we stand near a running train can be explained on the basis of', 'Beginner', 2, '46'),
(13, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Beginner', 2, '50'),
(14, 'Which of the following is a non metal that remains liquid at room temperature?', 'Beginner', 2, '54'),
(15, 'Which of the following metals forms an amalgam with other metals?', 'Intermediate', 2, '58'),
(16, 'Chemical formula for water is', 'Intermediate', 2, '62'),
(17, 'The gas usually filled in the electric bulb is', 'Intermediate', 2, '65'),
(18, 'Which of the gas is not known as green house gas?', 'Professional', 2, '72'),
(19, 'The hardest substance available on earth is', 'Professional', 2, '75'),
(20, 'Which of the following is used as a lubricant?', 'Professional', 2, '77'),
(21, 'What is part of a database that holds only one type of information?', 'Beginner', 3, '82'),
(22, '\'OS\' computer abbreviation usually means ?', 'Beginner', 3, '87'),
(23, '\'.MOV\' extension refers usually to what kind of file?', 'Beginner', 3, '90'),
(24, 'Which is a type of Electrically-Erasable Programmable Read-Only Memory?', 'Beginner', 3, '93'),
(25, 'Who developed Yahoo?', 'Intermediate', 3, '98'),
(26, 'What does the term PLC stand for?', 'Intermediate', 3, '103'),
(27, '\'.INI\' extension refers usually to what kind of file?', 'Intermediate', 3, '106'),
(28, 'Who created Pretty Good Privacy (PGP)?', 'Professional', 3, '109'),
(29, 'Who co-founded Hotmail in 1996 and then sold the company to Microsoft?', 'Professional', 3, '115'),
(30, 'In what year was the \"@\" chosen for its use in e-mail addresses?', 'Professional', 3, '118');

-- --------------------------------------------------------

--
-- Table structure for table `ques_option`
--

CREATE TABLE `ques_option` (
  `qo_id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ques_option`
--

INSERT INTO `ques_option` (`qo_id`, `qid`, `options`) VALUES
(1, 1, '2 Years'),
(2, 1, '3 Years'),
(3, 1, '4 Years'),
(4, 1, 'Every year'),
(5, 2, 'Argentina'),
(6, 2, 'Uruguay'),
(7, 2, 'Itlay'),
(8, 2, 'Brazil'),
(9, 3, 'India'),
(10, 3, 'West Indies'),
(11, 3, 'England'),
(12, 3, 'Austalia'),
(13, 4, '14.35 Sec'),
(14, 4, '9.58 Sec'),
(15, 4, '9.05 Sec'),
(16, 4, '8.59 Sec'),
(17, 5, 'Larisa Latynina'),
(18, 5, 'Mark Spitz'),
(19, 5, 'Michael Phelps'),
(20, 5, 'Saina Nehwal'),
(21, 6, 'Michael Johnson'),
(22, 6, 'Usain Bolt'),
(23, 6, 'Milkha Sing'),
(24, 6, 'Carl Lewis'),
(25, 7, '12.11 Sec'),
(26, 7, '10.67 Sec'),
(27, 7, '10.45 Sec'),
(28, 7, '10.49 Sec'),
(29, 8, 'Birgit Fischer'),
(30, 8, 'Marit Bjørgen'),
(31, 8, 'Larisa Latynina'),
(32, 8, 'Jenny Thompson'),
(33, 9, '1930'),
(34, 9, '1921'),
(35, 9, '1976'),
(36, 9, '1953'),
(37, 10, 'Swiming'),
(38, 10, 'Motorcycle Racing'),
(39, 10, 'Cycling'),
(40, 10, 'Formula One'),
(41, 11, 'Celsius'),
(42, 11, 'Fahrenheit'),
(43, 11, 'Kelvin'),
(44, 11, 'Rankine'),
(45, 12, 'Archimedes Principle'),
(46, 12, 'Bernoulli’s law'),
(47, 12, 'Avogadro’s Hypothesis'),
(48, 12, 'None'),
(49, 13, 'Oxygen'),
(50, 13, 'Hydrogen sulphide'),
(51, 13, 'Carbon dioxide'),
(52, 13, 'Nitrogen'),
(53, 14, 'Phosphorous'),
(54, 14, 'Bromine'),
(55, 14, 'Chlorine'),
(56, 14, 'Helium'),
(57, 15, 'Tin'),
(58, 15, 'Mercury'),
(59, 15, 'Lead'),
(60, 15, 'Zinc'),
(61, 16, 'NaAlO2'),
(62, 16, 'H2O'),
(63, 16, 'Al2O3'),
(64, 16, 'CaSiO3'),
(65, 17, 'nitrogen'),
(66, 17, 'hydrogen'),
(67, 17, 'carbon dioxide'),
(68, 17, 'oxygen'),
(69, 18, 'Methane'),
(70, 18, 'Nitrous oxide'),
(71, 18, 'Carbon dioxide'),
(72, 18, 'Hydrogen'),
(73, 19, 'Gold'),
(74, 19, 'Iron'),
(75, 19, 'Diamond'),
(76, 19, 'Silver'),
(77, 20, 'Graphite'),
(78, 20, 'Silica'),
(79, 20, 'Iron Oxide'),
(80, 20, 'Oil'),
(81, 21, 'Report'),
(82, 21, 'Field'),
(83, 21, 'Record'),
(84, 21, 'File'),
(85, 22, 'Order of Significance'),
(86, 22, 'Open Software'),
(87, 22, 'Operating System'),
(88, 22, 'Optical Sensor'),
(89, 23, 'Image file'),
(90, 23, 'Animation/movie file'),
(91, 23, 'Audio file'),
(92, 23, 'MS Office document'),
(93, 24, 'Flash'),
(94, 24, 'Flange'),
(95, 24, 'Fury'),
(96, 24, 'FRAM'),
(97, 25, 'Dennis Ritchie & Ken Thompson'),
(98, 25, 'David Filo & Jerry Yang'),
(99, 25, 'Vint Cerf & Robert Kahn'),
(100, 25, 'Steve Case & Jeff Bezos'),
(101, 26, 'Programmable Lift Computer'),
(102, 26, 'Program List Control'),
(103, 26, 'Programmable Logic Controller'),
(104, 26, 'Piezo Lamp Connector'),
(105, 27, 'Image file'),
(106, 27, 'System file'),
(107, 27, 'Hypertext related file'),
(108, 27, 'Image Color Matching Profile file'),
(109, 28, 'Phil Zimmermann'),
(110, 28, 'Tim Berners-Lee'),
(111, 28, 'Marc Andreessen'),
(112, 28, 'Ken Thompson'),
(113, 29, 'Shawn Fanning'),
(114, 29, 'Ada Byron Lovelace'),
(115, 29, 'Sabeer Bhatia'),
(116, 29, 'Ray Tomlinson'),
(117, 30, '1976'),
(118, 30, '1972'),
(119, 30, '1980'),
(120, 30, '1984');

-- --------------------------------------------------------

--
-- Table structure for table `user_ans`
--

CREATE TABLE `user_ans` (
  `uid` int(11) NOT NULL,
  `uname` varchar(200) NOT NULL,
  `qid` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `ques_option`
--
ALTER TABLE `ques_option`
  ADD PRIMARY KEY (`qo_id`);

--
-- Indexes for table `user_ans`
--
ALTER TABLE `user_ans`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ques_option`
--
ALTER TABLE `ques_option`
  MODIFY `qo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `user_ans`
--
ALTER TABLE `user_ans`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `Foreign key` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
