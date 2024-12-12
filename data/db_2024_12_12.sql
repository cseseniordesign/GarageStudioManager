-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 15, 2024 at 06:21 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservations`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `alerts`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert_signups`
--

CREATE TABLE `alert_signups` (
  `id` int(11) NOT NULL,
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `alert_signups`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `text` varchar(10000) DEFAULT NULL,
  `header` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `announcements`
--

-- --------------------------------------------------------

--
-- Table structure for table `attended_orientations`
--

CREATE TABLE `attended_orientations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_attended` datetime DEFAULT NULL,
  `university_status` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attended_orientations`
--

-- --------------------------------------------------------

--
-- Table structure for table `check_ins`
--

CREATE TABLE `check_ins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `university_status` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `expired` varchar(4) DEFAULT NULL,
  `visit_reason` varchar(255) DEFAULT NULL,
  `studio_used` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `check_ins`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_types`
--

CREATE TABLE `email_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_types`
--

INSERT INTO `email_types` (`id`, `name`) VALUES
(1, 'Promotional'),
(2, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `primary_phone_number` varchar(45) DEFAULT NULL,
  `secondary_phone_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `emergency_contacts`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `service_space_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `max_signups` int(11) DEFAULT NULL,
  `imagedata` longblob DEFAULT NULL,
  `imagemime` varchar(255) DEFAULT NULL,
  `unl_events_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `trainer_confirmed` tinyint(4) DEFAULT 0,
  `is_private` tinyint(1) DEFAULT 0,
  `hrc_feed` tinyint(1) NOT NULL DEFAULT 0,
  `hrc_parking` tinyint(1) NOT NULL DEFAULT 1,
  `event_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_authorizations`
--

CREATE TABLE `event_authorizations` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_authorizations`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_signups`
--

CREATE TABLE `event_signups` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `attended` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_signups`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `description`, `service_space_id`) VALUES
(1, 'New Member Orientation', 1),
(2, 'Machine Training', 1),
(3, 'Advanced Skill-Based Workshop', 1),
(4, 'Creation Workshop', 1),
(5, 'General Workshop', 1),
(6, 'Free Event', 1),
(7, 'RSVP Only Event', 1),
(8, 'Tour', 1),
(9, 'Conference', 4),
(10, 'Scheduling', 1),
(11, 'HRC Training', 1),
(12, 'New Member Orientation', 8),
(13, 'Machine Training', 8),
(14, 'General Workshop', 8),
(15, 'Woodshop', 8),
(16, 'Metalshop', 8),
(17, 'Digital Fabrication', 8);

-- --------------------------------------------------------

--
-- Table structure for table `expiration_reminders`
--

CREATE TABLE `expiration_reminders` (
  `ID` int(11) NOT NULL,
  `first_reminder` int(11) NOT NULL,
  `second_reminder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expiration_reminders`
--

INSERT INTO `expiration_reminders` (`ID`, `first_reminder`, `second_reminder`) VALUES
(1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `streetaddress` varchar(255) DEFAULT NULL,
  `streetaddress2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `additionalinfo` varchar(255) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT NULL,
  `unl_events_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `streetaddress`, `streetaddress2`, `city`, `state`, `zip`, `additionalinfo`, `service_space_id`, `unl_events_id`) VALUES
(1, 'Nebraska Innovation Studio', '2021 Transformation Drive', 'Suite 2220', 'Lincoln', 'NE', '68588-6200', NULL, 1, 11632),
(2, 'Nebraska Innovation Campus', '', '', '', '', '', '', 4, NULL),
(3, 'NIC Conference Center, 2nd floor ', '', '', '', '', '', '', 1, NULL),
(4, 'NIC Conference Center, 2nd floor ', '', '', '', '', '', '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maker_requests`
--

CREATE TABLE `maker_requests` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `requestor_name` varchar(255) NOT NULL,
  `requestor_email` varchar(255) NOT NULL,
  `requestor_phone` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maker_requests`
--

-- --------------------------------------------------------

--
-- Table structure for table `maker_requests`
--

CREATE TABLE `material_prices` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `category` varchar(255) NOT NULL,
    `subcategory` varchar(255) DEFAULT NULL,
    `name` varchar(255) NOT NULL,
    `price_cents` int(11) NOT NULL,
    `price_per_unit` varchar(255) DEFAULT NULL,
    `service_space_id` int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maker_requests`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'Super User'),
(2, 'Manage Users'),
(3, 'Manage Resources'),
(4, 'Manage Emails'),
(5, 'Manage Space Hours'),
(6, 'Manage Events'),
(7, 'See Agenda'),
(8, 'User Access'),
(9, 'Events Admin Read-only'),
(10, 'Sub-Super User');

-- --------------------------------------------------------

--
-- Table structure for table `preset_emails`
--

CREATE TABLE `preset_emails` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` varchar(10000) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preset_emails`
--

INSERT INTO `preset_emails` (`id`, `name`, `subject`, `body`) VALUES
(1, 'New Members', 'NIS New Member Account Activation', '<p>Thank you for attending New Member Orientation!</p><p>To activate your user account please go to: http://innovationstudio-manager.unl.edu/login/ (Bookmark this link for future use) then enter the following:</p><p>User Name:</p><p>Temp Password: Welcome123</p><p>After logging in you must: Click on &ldquo;My Account&rdquo; on far right side of red banner.</p><p>Go to &ldquo;Add Vehicle&rdquo; Add your vehicle information. You can add up to 3 vehicles.</p><p>You must park in the lot shown on the attached map. If any vehicle information changes you must update your account before attending NIS. FAILURE TO DO SO WILL RESULT IN UP TO A $60 TICKET EVERY TIME YOU PARK.</p><p>TRAININGS AND RESERVATIONS You are now able to sign up for any trainings or workshops via this webpage by clicking on the VIEW TRAININGS, VIEW WORKSHOPS, VIEW FULL CALENDAR tabs on the main page or under the MANAGE YOUR STUDIO drop down tab. After you have been through required equipment training you will be able to reserve that equipment on the RESERVE EQUIPMENT tab on the main page or the drop-down tab.  Not all equipment requires training or reservations.</p><p>RENEWING YOUR MEMBERSHIP To renew your membership you must do so in person. We accept credit cards and UNL N Cards or cost object numbers. No checks or cash are accepted. Renew as soon as you enter the studio or you will receive a parking ticket.</p><p>Thank you and welcome aboard!</p><p>Your Studio Staff</p>'),
(2, 'Snow Day', 'Snow Day', 'NIS is closed due to inclement weather.  All active memberships have been extended by one day. \r\n \r\nYour NIS Staff'),
(3, 'Wood Lathe Workshop', 'Wood Lathe Worskhop', '<p>Wood Lathe Worskhops are set up for Monday x/xx &amp; x/xx, from 530pm-830pm.</p><p>This workshop has a fee of&nbsp;$75.00 on top of your membership fee. In order to register you must stop into the studio and pre-pay using a credit card or NCard (NU only). You will then receive&nbsp;a sign up code.&nbsp;There are 6 spots per 2 session workshop.</p><p>Pre-requisite trainings: None.</p><p>In this two part Workshop you will learn the anatomy of a wood lathe, carbide vs high speed steel tools, the basics of spindle turning, and the basics of bowl turning. After this workshop you will be able to make reservations and use the small wood lathes.</p><p>All materials are included. You will take&nbsp;home your finished projects.</p><p>&nbsp;</p><p>Your NIS Staff</p>'),
(5, 'Purge', 'Material Storage Purge', '<p>NIS will be purging all material storage on Wednesday X/X/X at 12pm. Active members are allowed to store one project at a time.</p><p>Any unlabeled materials or materials belonging to expired members will be discarded on Wednesday X/X/X.</p><p>Any usable discarded material will be available for free at 5pm on Wednesday X/X/X.</p><p>Your NIS Staff</p>'),
(6, 'Openings in Metal Lathe/Mill/Tormach CNC Mill', 'Openings in Metal Lathe/Mill/Tormach CNC Mill', ''),
(7, 'TIG Welding Workshop ', 'TIG Welding Workshop ', ''),
(8, 'Sporting Event Parking Information', 'Parking Information', '<p>There are volleyball and football games Thursday and Saturday this week. The parking lot in which our members park will be paid event parking both days. In order to avoid paying for parking you must stop in the studio and grab a red parking permission tag from the sign in table, then proceed to the parking lot, show the tag to the attendant, and park without paying fees. Thanks for your understanding! Your NIS staff</p>'),
(9, 'Studio Use Reminder', 'Studio Use Reminder', '<p>Dear NIS Members,</p><p>We are experiencing a large increase in the number of people using the Studio. As we see this continue to increase we wanted to remind you of two very important expectations for using The Studio.</p><p>Make a reservation when you are planning to use tables or equipment. Reservations help us track usage and more importantly make sure equipment and tables are not double booked.</p><p>Clean up after yourself. We need everyone to plan for an appropriate amount of time to clean up after themselves to leave things cleaner than you found them. This applies to specific areas as well as project storage.</p><p>Thank you,</p><p>Your NIS Staff</p>');

-- --------------------------------------------------------

--
-- Table structure for table `preset_events`
--

CREATE TABLE `preset_events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `max_signups` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `preset_events`
--

INSERT INTO `preset_events` (`id`, `event_name`, `description`, `event_type_id`, `max_signups`, `duration`) VALUES
(1, 'Metal: Basic Lathe Training', 'Cost:  $100\r\nPlease be aware that this class is based on the basic safety and operations of a manual lathe.  It is not project specific class. \r\nWEEK 1\r\nIntro to Clausing Lathe controls.\r\nDiscussion of General Lathe safety.\r\n1) No long sleave shirts\r\n2) No jewelry, watches, rings\r\n3) Long hair tied up or put under a ball cap.\r\nIntro to basic digital readout functions.\r\nTightening material into lathe jaws.\r\nHow to setting height for cutting tool.\r\nMachine face cuts into steel\r\nMachine turning cuts into steel\r\nWEEK 2\r\nReview of Lathe machine controls.\r\nReview of Basic Lathe Safety\r\nTaking multiple facing and turning cuts into steel bar working to dimensions.\r\nSetting up and using parting tool.\r\nWEEK 3\r\nReview of Lathe machine controls\r\nReview of Basic Lathe Safety\r\nDrill and tap a series of holes to size in Steel bar.\r\n1) Center drill hole \r\n2) Drill series of Holes to specific size\r\n3) Tap series of Hole to specific size', 2, 2, 120),
(2, 'Adobe Illustrator One-on-One Open Hours', 'Cost:  Free with active membership\r\nLearn Illustrator from the experts in a one on one setting.  Whether you know nothing, know something or think you know it all you will gain valuable skills when navigating Illustrator for your laser, vinyl cutter or silk screen projects.  ', 5, 10, 60),
(3, 'Throwing Wheel Basics: Session 1', 'Open to active members. \r\nCost: $25\r\nLearn the basics of using the throwing wheel in this hands-on, two-session workshop on Sept. 25 and Oct. 2 , from 5:30 p.m. to 8:30 p.m. In the workshop you will learn how to operate the wheel, how to center clay, and you will make a cylinder and a bowl.  We will also discuss the kiln firing process and glazing techniques.\r\nOnce you pay for the workshop you will be given a code to sign up. This will cover both sessions. You do not need to sign up for the second session.', 4, 5, 90),
(4, 'Hand Building with Clay ', 'Cost:  Free with active membership \r\nSpend 2 hours on 2 separate days with resident sculptor ______ hand sculpting a project of your choice. \r\nIn class 1 you will sculpt something small, with _____ guidance, to build your basic skills. \r\nIn class 2 you will sculpt a project of your choosing, so show up with your ideas and _______ will Swayze you through your project from start to finish.\r\nPlease sign up for both sessions of this workshop.', 5, 5, 120),
(5, 'Advanced Silk Screen Workshop: Using multiple colors', 'Cost:  Free with active membership \r\nBefore taking this workshop you must have completed silkscreen training or already be familiar with the silkscreening process.\r\nIn this 1.5 hour workshop we will cover more advanced silk screen printing methods. \r\nYou will learn how to use multiple screens to create a final image with multiple colors.  You will also learn how to create graphic files with multiple colors using Adobe Illustrator.  Please be sure to bring a blank t-shirt to the workshop.', 5, 4, 90),
(6, 'Woodworking Session 1:  Wood Lathes', 'Cost: $75.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up.\r\nIn this two part Workshop you will learn the anatomy of a wood lathe, carbide vs high speed steel tools, the basics of spindle turning, and the basics of bowl turning.  After this workshop you will be able to make reservations and use the small wood lathes. \r\nSession 1 \r\nWe will begin in the classroom and go over the anatomy of the wood lathe and how they work.  Following that you\'ll learn the basics of spindle turning by turning a pen and a bottle stopper on the lathe.\r\nSession 2\r\nIn session 2 we will go over bowl turning basics from rough logs to finished bowl and you will turn a shallow dish.', 4, 6, 180),
(7, 'New Member Orientation', '-Attending a New Member Orientation is required in order to gain access to Innovation Studio.\r\n-At the 1-hour orientation session you\'ll take a tour of the Studio and become familiar with our policies,   procedures, and practices.  \r\n-MAKE SURE YOU PARK WHERE DIRECTED. You will receive an email with a parking map attached confirming your signup.  \r\n-Please arrive at least five minutes early.\r\n-Our main entrance, 2021 Transformation Drive, Suite 1500, Entrance B, is located on the North-west end of the Innovation Commons building on 19th St. just off Transformation Drive.   \r\n-Studio membership payment is accepted in the forms of credit cards and NCards. Checks or cash are not accepted.  Please be prepared with your preferred form of payment on the day of your New Member Orientation.  \r\nPlease note that this Orientation is for people who are ready to become a member.  If you are interested in learning more about the studio before joining, feel free to email us at innovationstudio@unl.edu, take a virtual tour at https://nebraskainnovationcampus.com/,  or call us at 402.472.5114.\r\n', 1, 30, 60),
(8, 'Tour of Nebraska Innovation Studio', 'Cost: None\r\nHave you heard about Innovation Studio but do not know enough about it to sign up as a member?  Not sure you are ready to commit?  Wondering what the studio offers to its members?  Spend 30 minutes with our staff to learn all you need to know.  We will walk through the entire studio, show you our equipment, tell you how to use the studio, and answer any other questions you may have to help you with your decision.  The studio is located at 2021 Transformation Drive, Suite 1500 Entrance B.  (On the NW corner of Innovation Campus at 19th & Transformation Drive-you can see Devaney Center from our door.)\r\n', 8, 20, 30),
(9, 'Epilog Laser Cutter Training', 'Cost:  Free with active membership\r\nThis 1-hour training is required before gaining access to the Epilog Fusion 40, 32, 32 Pro & 24 laser cutters. Learn the basics of generating a file to send to the lasers, how to operate the lasers, the differences between the three, and the basic use of the rotary tool.\r\n', 2, 6, 60),
(10, '3D Printer Training #1 – Ultimaker', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the Ultimaker 2+ and 3-Extended printers.  We will review the printer software and demonstrate how to upload your files and operate the equipment.  This training does not cover design software. You must complete this training before taking the Formlab & Markforged training.\r\n', 2, 6, 60),
(11, '3D Printer Training #2 – Formlab & Markforged', 'Cost:  Free with active membership\r\nIn order to use the Formlab & Markforged 3d printers you must have already completed the Ultimaker 3d training.  This 1 hour training is required before gaining access to the Formlab & Markforged 3d printers.  We will review the printer software, review the different types of material for each printer, and demonstrate how to upload yourc files and operate the equipment.  This training does not cover design software.\r\n', 2, 6, 60),
(12, 'Wood: Band Saw, Scroll Saw, & Drill Press Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the band saws, scroll saw & drill press for wood.  In this training you will make several cuts using both saws and learn the basics of drilling with our press, the different drill bits we have available and what materials they are used with to ensure you are operating these machines safely and effectively. \r\n', 2, 6, 60),
(13, 'Wood: Jointer & Planer Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the wood jointer & planer. In this training you will gain an understanding of the cut settings and operational limitations of each piece of equipment and ensure you are operating these machines safely and effectively.\r\n', 2, 6, 60),
(14, 'Wood: Drum, Belt, Disc, & Spindle Sander Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the drum, belt, disc & spindle sanders for wood.  In this training you will gain an understanding of how to select the correct sander for the job and ensure you are operating these machines safely and effectively. \r\n', 2, 6, 60),
(15, 'Wood: Table Router, Hoffman Router, Mortising Machine Training', 'Cost:  Free with active membership\r\nThis one hour training is required before gaining access to the table router, Hoffman router, and Mortising machine for wood.  In jthis training you will review the hand routers and cut with table and Hoffman routers in order to gain an understanding of how to select the correct router for your project and ensure you are operating these machines safely and effectively.   You will also learn how to safely operate the mortising machine and cut a mortise.\r\n', 2, 6, 60),
(16, 'Wood: Table, Miter, & Panel Saw Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the table saw, miter saw and panel saws. In this training you will become familiar with the operation of the panel saw and make several cuts on both the miter and table saws. You will leave with a basic understanding of their operation and ensure you are operating these machines safely and effectively.\r\n', 2, 4, 60),
(17, 'Wood: Carvey Desktop CNC Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to the Carvey Desktop CNC router and must be completed before taking the Shopbot CNC router training.  In this training you will learn how to use the Easel software to create and set up your file, set up the machine and cut your project using materials ranging from plywood, hardwood, plastics, and many others.  This machine has a 12” x 8” x 2.75” work area and is designed for smaller, more detailed projects than the Shopbot CNC.\r\n', 2, 6, 60),
(18, 'Wood: Shopbot CNC Router Training', 'Cost:  Free with active membership\r\nIn this training you will learn to code tool paths for the router in VCarve Pro as well as how to operate the CNC router.  Allowable materials are wood, foam & certain composites.\r\n', 2, 4, 90),
(19, 'Woodshop One on One', 'Cost:  Free with active membership\r\nThis 30 minute training allows you to consult with an instructor on your specific project.  During this training you may choose up to three pieces of woodshop equipment to train on.  In this training you will learn the basics and practice using this equipment to ensure you are operating these machines safely and effectively.\r\n', 2, 1, 30),
(20, 'Vinyl Cutter & Heat Press Training', 'Cost:  Free with active membership \r\nThis 1 hour training is required before gaining access to the vinyl cutter and vinyl heat press.  Learn the basics of generating a file in Illustrator and Graphtec Studio as well as how to load your vinyl, cut your file and create your finished vinyl transfer.   You will also learn how to set up the vinyl cutter for the heat press and operate the heat press correctly and effectively.\r\n', 2, 6, 30),
(21, 'Screen Print Training', 'Cost:  Free with active membership \r\nThis 1 hour required training will guide you through the creation and application of a silkscreen.  You will learn how to print your image, apply emulsion, set up your screen, apply ink, clean and remove your image from the screen, and operate our 4 station press.  \r\n', 2, 6, 60),
(22, 'Embroidery Machine Training', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to our Baby Lock 6 needle embroidery machine.  You will learn how to thread the machine, how to operate the machine, and how to use stock images and create text that you can then embroider on a shirt, towel or hat.\r\nYou may sign up for the advanced software training after completing this training.  This software will allow you to design & create your own images to embroider on your object.\r\n', 2, 6, 60),
(23, 'Long Arm Quilter Training', 'Cost:  Free with active membership\r\nThis 3 hour training will give you the basic operating skills for our long arm quilting machine. \r\nIn this course you will learn to:\r\nLoad a quilt on the long arm quilting machine\r\nThread the machine, change thread and wind bobbins\r\nAlign a pantograph for quilting and quilt using a pantograph design\r\nNoodle around doing a bit of free motion quilting from the front of machine\r\nWhat to bring:\r\nExcitement for learning the basics of long arming. Supplies will be provided - we will use small panel quilt tops which will be donated to Quilts for Kids, a charity which provides area hospitals with quilts for children who are receiving treatment.\r\nPlease arrive 10 minutes early as we will start promptly. \r\n', 2, 4, 180),
(24, 'Metal Shop Equipment Orientation', 'Cost:  Free with active membership\r\nOur brand new metal shop is full of useful equipment and is set up to meet as many of your metal working needs as possible.  This 1.5 hour shop orientation will give you an overview of what the equipment can do, the types of material that can be used, some of the new personal protection & safety requirements, and allow you to ask questions about how the metal shop and the equipment use will function.  This is not equipment specific training, this is an opportunity to get the wheels turning for your metal projects.  You will be able to sign up for trainings separately.\r\n', 2, 10, 90),
(25, 'Metalshop One on One', 'Cost:  Free with active membership\r\nThis 30-60 minute training allows you to receive an overview of all equipment or to train on specific equipment. You may choose from media blaster, grinders & sanders, horizontal, vertical, and cold saws, shear, brake, ironworker, virtual reality welder, welders, tube bender, media blaster, english wheel, and slip roller. Plasma Cutter & Fiber Laser, mills & lathes, are separate trainings.\r\n', 2, 1, 60),
(26, 'Metal: CNC Plasma Cutter Training', 'Cost:  Free with active membership\r\nIn this training you will learn to code tool paths for the plasma cutter in the SheetCam software, operate the CNC plasma cutter using the Mach3 software, select your cutting consumables, as well as how to operate the CNC router safely and efficiently.  Allowable materials are steel and stainless steel. Aluminum is not permitted.  Check out the SOP on our website.\r\n', 2, 4, 60),
(27, 'Metal: CNC Fiber Laser Training', 'Cost:  Free with active membership\r\nIn this 1 hour training you will learn to code tool paths for the fiber laser using the FabCreator software, gain a brief introduction to VCarve and the tube fab plugin for Solidworks, as well as operate the CNC fiber laser safely and efficiently to cut, engrave, and raster metals.  Allowable materials are cold rolled steel, stainless steel, aluminum, titanium, copper and brass.  Maximum material dimensions are 50” x 25” sheet or 2” square, round, or rectangular tube.\r\n', 2, 6, 60),
(28, 'Metal: Basic Milling Machine Training', 'Cost:  $100\r\nPayment must be made in person, at the studio, prior to being allowed to sign up for this training.  Limit 2 members per training session.  This is a 5 week, 2 hours per session, one session per week training.\r\nThis training is required before gaining supervised access to our Bridgeport knee mills.  This class will introduce you to basic milling machine operations.  You will then be able to work with one of our machinists on specific projects in a supervised environment.  \r\nThe weekly sessions will cover the following:\r\nWEEK 1\r\n1)	Intro to Bridgeport series 1 milling machine, controls.\r\n2)	How to install and remove milling cutters.\r\n3)	How to check square and adjust vice and tram on milling machine.\r\n4)	Intro to basic digital readout functions.\r\n5)	Set up a repeatable stop.\r\n6)	Taking off vice and using hold down clamps for larger parts.\r\nWeek 2\r\n1)	Review of milling machine controls.\r\n2)	Review of checking square of vice.\r\n3)	Review of installing and removing milling cutters.\r\n4)	Discussion and example of climb and conventional milling.\r\n5)	Setting up stock to mill in machine.\r\na)	Deburr the stock material.  \r\nb)	Use layout line to setup part in milling machine vice.\r\nc)	Pick correct parallels to machine the part.\r\nd)	Install correct milling cutter and set correct speed for size of milling cutter. \r\ne)	Take face and edge cuts on Plastic to the correct dimensions.\r\n6)	Repeat step 4 for Aluminum.\r\n7)	Repeat step 4 for Cold Rolled Steel.\r\nWeek 3  \r\n1)	Review of milling machine controls.\r\n2)	Review of checking square of vice.\r\n3)	How to tram in head to table on milling machine.\r\n4)	How to use an edge finder to find 0,0 point on part,  set digital readout to 0,0\r\n5)	Drilling holes in Plastic, Aluminum, Steel\r\na)	How to determine drill speed for various types of materials.\r\nb)	Use of a center drill to start holes.\r\nc)	Discussion that drill bits have webs and to drill larger holes need to step up the drill sizes.\r\n6)	From drawing locate and drill holes of various sizes in Plastic.\r\n7)	Repeat step 6 for Aluminum.\r\n8)	Repeat step 6 for Cold Rolled Steel.\r\nWEEK 4\r\n1)	Review of milling machine controls.\r\n2)	Review of checking square of vice.\r\n3)	Basic theory on machining a slot.\r\n4)	Using center cutting milling cutters to plunge into material.\r\n5)	Using drills to remove most of material in slot.\r\n6)	Machine slot into plastic.\r\na)	From drawing determine size of cutter to use.\r\nb)	Set a second datum on digital readout to aid in machining pocket accurately.\r\nc)	Machine slot into Plastic.\r\n7)	Repeat step 6 with Aluminum.\r\n8)	Repeat step 6 with Cold Rolled Steel.\r\n9)	Machine pocket into Plastic.\r\na)	Determine type and size of milling cutter to use.\r\nb)	Rough cut pocket to size.\r\nc)	Finish cut pocket to size.\r\n10)	Repeat Step 9 for Aluminum.\r\n11)	Repeat Step 9 for Cold Rolled Steel.\r\nWEEK 5\r\n1)	Review of milling machine controls.\r\n2)	Review of checking square of vice.\r\n3)	Set 0,0 point on part using edge finder and digital readout.\r\n4)	Drilling and Tapping Basics in Plastic.\r\na)	Determine the correct size of drill for tapping threads.\r\nb)	Position table to drill hole in correct location.\r\nc)	Center drill and the drill hole. \r\nd)	Tap hole into part.\r\ne)	Repeat for 3 sizes of tapped hole, 10-32, ¼-20, 3/8-16. \r\n5)	Repeat step 4 for Aluminum.\r\n6)	Repeat step 4 for Cold Rolled Steel.\r\n7)	Drill and tapping a bolt circle using a second datum in Plastic.\r\n8)	Repeat Step 7 for Aluminum.\r\n9)	Repeat Step 7 for Cold Rolled Steel.\r\n', 2, 2, 120),
(29, 'Woodworking Session: Wood Lathes Part 2', 'For full description see session 1 on XX/XX/XX.\r\nYou need to sign up for session 1 but not session 2.', 4, 0, 180),
(30, 'Pottery Mug Making Workshop ', 'Cost: $20.00\r\nPayment must be made in person or on the phone prior to being allowed to sign up for this training.  If you\'re interested in signing up, please stop in ASAP to reserve your spot.\r\n\r\nIn this two-part Workshop on consecutive Monday nights, you will make and glaze a custom-made mug. In Session 1, you will use the slab roller and mug templates to make a mug. Add custom decorations to transform the mug into a one-of-a-kind masterpiece. In Session 2,  we will add glaze your mug. \r\n\r\nThe cost of the workshop includes clay and glaze. \r\n', 4, 4, 90),
(31, 'HRC Workshop', 'Robotics Workshop', 7, NULL, 90),
(32, 'Throwing Wheel Basics: Session 2', 'For full description see session 1 on XX/XX/XX.\r\nYou need to sign up for session 1 but not session 2.', 4, 0, 90),
(33, 'Metal: Metalworking Jack-O-Lantern', 'Cost: $40.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up. Long pants are required! Must be at least 18 years old.\r\n\r\nIn this two and a half-hour workshop, you will work with our resident Machinist Elijah Paulson creating a Jack-O-Lantern in the metal shop. This workshop will teach you the basics of the slip roller, rod bender, band saw, sheet metal brake, and Spot Welding with a MIG welder. You will also get a software and CNC Fiber Laser Demo. Materials are included in the cost of the workshop. Since we will be welding, long pants are required!\r\n', 4, 2, 120),
(34, 'Metal: Metalworking Turkey-O-Lantern', 'Cost: $40.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up. Long pants are required! Must be at least 18 years old.\r\n\r\nIn this two part workshop, you will work with our resident Machinist Elijah Paulson creating a Turkey-O-Lantern/Jack-O-Turkey in the metal shop. The two hour long sessions will teach you the basics of the slip roller, rod bender, band saw, sheet metal brake, and Spot Welding with a MIG welder. You will also get a software and CNC Fiber Laser Demo. Materials are included in the cost of the workshop. Since we will be welding, long pants are required!', 4, 2, 120),
(35, '3D Modeling: Solidworks Basics', 'Cost: $40.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up. \r\n\r\nIn this three part workshop, you will get a \"BASIC\" overview of 3D modeling using Solidworks. The models created in Solidworks can be used for 3D printing, lasering parts, and many other applications. The two hour sessions will focus on building a 3d model, using the sheet metal tool, dimensional drawings, assemblies, and exporting to STL or DXF. ', 5, 8, 120),
(36, 'Metal: Snowman ', 'Cost: $50.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up. Long pants are required! Must be at least 18 years old.\r\n\r\nIn this five hour workshop (broken up into two classes), you will work with our resident Machinist Elijah Paulson creating a Snowman in the metal shop. This workshop will teach you the basics of the slip roller, rod bender, band saw, sheet metal brake, and Spot Welding with a MIG welder. You will also get a software and CNC Fiber Laser Demo. Materials are included in the cost of the workshop. Decorating the snowman will NOT be done in the workshop, however links and files for buying or 3D printing possible decorations will be provided. Since we will be welding, long pants are required!', 4, 2, 150),
(37, 'Textiles: Embroidery Machine', 'Cost:  Free with active membership\r\nThis 1 hour training is required before gaining access to our Baby Lock 6 needle embroidery machine and Baby Lock 10 needle machine.  You will learn how to thread the machine, how to operate the machine, and how to use images and create text that you can then embroider on fabric. The training includes an overview of the Embrilliance software. \r\n\r\n', 2, 5, 60),
(38, 'Metal: Metal Working Flower', 'Cost: $50.00\r\nPayment must be made in person or over the phone prior to being allowed to sign up for this training.  You will then receive a sign up code that you will enter when signing up. Long pants are required! Must be at least 18 years old.\r\n\r\nIn this five hour workshop (broken up into two classes), you will work with our resident Machinist Elijah Paulson creating a flower in the metal shop. This workshop will teach you the basics of the rod bender and media blaster. You will also get a software and CNC Fiber Laser Demo. Materials are included in the cost of the workshop. ', 4, 4, 120),
(39, '3D Scanner - Creaform', 'Cost: Free with active membership.\r\nIn this 1 hour training you will learn how to use the Creaform 3D Scanner and the VX Element software to scan and save your objects. You will understand the limitations of the scanner, as well as best practices and processes to prepare you file to either 3D print or import your file into CAD software for future modification or use.', 2, 4, 60),
(40, 'Metal: CNC Milling Machine Training (Tormach)', 'Cost:  $100\r\nPayment must be made in person, at the studio, prior to being allowed to sign up for this training.  Limit 2 members per training session.  This is a 5 week, 2 hours per session, one session per week training.\r\nThe basic milling training or approved previous milling experience is a prerequisite for this training.\r\nThis training is required before gaining supervised access to our Tormach CNC mill.  This class will introduce you to basic CNC milling machine operations.  You will then be able to work with one of our machinists on specific projects in a supervised environment.  \r\n', 2, 2, 120),
(41, 'Universal Robot Training', 'Universal Robots\' CORE Certification curriculum offers a comprehensive three-day program giving participants the skills they need to excel in robot operations. Covering installation, programming, troubleshooting, optimization and more, this intensive course equips individuals with the skills they need to navigate the world of collaborative and industrial robotics. \r\n\r\nTraining begins promptly at 9am for each of the three days required.', 2, 4, 30);

-- --------------------------------------------------------

--
-- Table structure for table `preset_events_has_resources`
--

CREATE TABLE `preset_events_has_resources` (
  `preset_events_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `preset_events_has_resources`
--

INSERT INTO `preset_events_has_resources` (`preset_events_id`, `resources_id`) VALUES
(1, 772),
(2, 791),
(2, 792),
(2, 793),
(2, 794),
(2, 795),
(2, 796),
(2, 797),
(3, 776),
(3, 777),
(3, 778),
(3, 779),
(3, 827),
(6, 735),
(6, 736),
(6, 737),
(6, 738),
(6, 748),
(6, 749),
(7, 817),
(9, 12),
(9, 30),
(9, 732),
(9, 782),
(9, 818),
(10, 14),
(10, 49),
(10, 733),
(10, 742),
(10, 812),
(10, 813),
(10, 821),
(10, 822),
(10, 824),
(10, 825),
(11, 739),
(11, 740),
(11, 811),
(12, 17),
(12, 18),
(12, 751),
(13, 37),
(13, 38),
(14, 16),
(14, 39),
(14, 741),
(14, 835),
(15, 50),
(15, 752),
(15, 814),
(16, 10),
(16, 11),
(16, 19),
(17, 734),
(18, 8),
(20, 23),
(20, 775),
(21, 51),
(22, 743),
(22, 840),
(23, 47),
(26, 757),
(27, 815),
(28, 770),
(29, 28),
(29, 735),
(29, 736),
(29, 737),
(29, 738),
(29, 748),
(29, 749),
(37, 743),
(37, 840),
(39, 841),
(40, 834);

-- --------------------------------------------------------

--
-- Table structure for table `preset_events_has_resource_reservations`
--

CREATE TABLE `preset_events_has_resource_reservations` (
  `id` int(11) NOT NULL,
  `preset_events_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `preset_events_has_resource_reservations`
--

INSERT INTO `preset_events_has_resource_reservations` (`id`, `preset_events_id`, `resource_id`) VALUES
(13, 11, 739),
(14, 11, 811),
(15, 11, 740),
(30, 23, 47),
(36, 26, 757),
(37, 21, 51),
(41, 18, 8),
(60, 10, 813),
(61, 10, 733),
(62, 7, 817),
(64, 31, 817),
(66, 6, 735),
(67, 6, 736),
(68, 6, 737),
(69, 6, 738),
(70, 6, 748),
(71, 6, 749),
(72, 3, 776),
(73, 3, 777),
(74, 3, 778),
(75, 3, 779),
(76, 3, 827),
(83, 32, 776),
(84, 32, 777),
(85, 32, 778),
(86, 32, 779),
(87, 32, 827),
(88, 29, 735),
(89, 29, 736),
(90, 29, 737),
(91, 29, 738),
(92, 29, 748),
(93, 29, 749),
(115, 22, 743),
(120, 33, 815),
(121, 33, 767),
(122, 33, 768),
(123, 34, 791),
(124, 34, 815),
(125, 34, 767),
(126, 34, 768),
(127, 36, 791),
(128, 36, 815),
(129, 36, 767),
(130, 36, 768),
(131, 20, 775),
(132, 20, 23),
(133, 37, 840),
(134, 37, 743),
(137, 1, 772),
(139, 27, 791),
(140, 27, 792),
(141, 27, 815),
(142, 38, 791),
(143, 38, 815),
(144, 39, 841),
(148, 28, 770),
(150, 40, 834),
(151, 9, 12),
(152, 9, 818),
(153, 9, 782),
(154, 9, 732),
(155, 9, 30);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `additional_date_1` datetime DEFAULT NULL,
  `additional_date_2` datetime DEFAULT NULL,
  `is_training` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `recurring_reference_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reservations`
--

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `service_space_id` int(11) DEFAULT NULL,
  `minutes_per_reservation` int(11) DEFAULT NULL,
  `needs_authorization` tinyint(1) DEFAULT NULL,
  `needs_approval` tinyint(1) DEFAULT NULL,
  `is_reservable` tinyint(1) DEFAULT NULL,
  `max_reservations_per_slot` int(11) DEFAULT NULL,
  `time_slot_type` varchar(255) DEFAULT 'exact',
  `min_minutes_per_reservation` int(11) DEFAULT NULL,
  `max_minutes_per_reservation` int(11) DEFAULT NULL,
  `increment_minutes_per_reservation` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `available_app_wide` tinyint(1) DEFAULT 0,
  `max_reservations_per_user` mediumint(9) DEFAULT NULL,
  `INOP` tinyint(1) DEFAULT 0,
	`is_24_hour` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `name`, `category_id`, `description`, `service_space_id`, `minutes_per_reservation`, `needs_authorization`, `needs_approval`, `is_reservable`, `max_reservations_per_slot`, `time_slot_type`, `min_minutes_per_reservation`, `max_minutes_per_reservation`, `increment_minutes_per_reservation`, `resource_class_id`, `available_app_wide`, `max_reservations_per_user`, `INOP`) VALUES
(8, 'CNC Router', 6, '', 1, NULL, 1, 0, 1, 3, 'range', 30, 240, 30, 1, 0, 2, 0),
(9, 'Drill Press', 3, 'Metal', 1, 60, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(10, 'Miter Saw', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(11, 'Table Saw', 6, '', 1, NULL, 1, 0, 0, 5, 'range', 0, 60, 30, 1, 0, NULL, 0),
(12, 'Laser Cutter Fusion 32 CO2', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 150, 30, 1, 0, 2, 0),
(14, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(15, 'Edge Sander', 6, '', 1, 60, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(16, 'Disc Sander', 6, '', 1, 60, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(17, 'Scroll Saw', 6, '', 1, 180, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(18, 'Band Saw', 6, '', 1, 180, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(19, 'Panel Saw', 6, '', 1, 60, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(22, '3D Scanner', 4, '', 1, 60, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 2, 0),
(23, 'Vinyl Cutter', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 120, 30, 1, 0, 2, 0),
(24, 'Sewing Machine Industrial Textiles', 5, '', 1, 60, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, NULL, 0),
(28, 'Wood Lathe', 6, '3520B', 1, NULL, 1, 0, 1, NULL, 'range', 30, 240, 30, 1, 0, NULL, 0),
(30, 'Laser Cutter Mini 24 CO2', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 150, 30, 1, 0, 2, 0),
(31, 'Festool Hand Planer', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(32, 'Festool Track Saw', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(33, 'Festool Router', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(34, 'Domino Joiner', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(35, 'Festool Rotex Sander', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(36, 'Festool Random Orbital Sander', 6, '', 1, 60, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(37, 'Jointer', 6, 'Wood Jointer', 1, NULL, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(38, 'Planer', 6, 'Wood planer', 1, NULL, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(39, 'Spindle Sander', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(45, 'The Garage Conference Room', NULL, 'A 20\' by 25\' conference room. Currently filled with boxes and construction. Could comfortably seat up to 40 without tables, perhaps 20 with tables. More details to come.', 3, NULL, 0, 0, 1, 5, 'range', 15, 240, 15, NULL, 0, NULL, 0),
(46, 'George S. Round Conference Room', NULL, 'A 15\' by 18\' conference room on the interior of the 12th and Q space. Could seat 30 comfortably without tables, maybe 15 with tables.', 3, NULL, 0, 0, 1, 5, 'range', 15, 240, 15, NULL, 0, NULL, 0),
(47, 'Long Arm Quilter', 5, 'Members may reserve 1 hour the day before actual quilting occurs, and the next 2 full days to allow completion of your quilt.', 1, 30, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(49, '3D printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(50, 'Table Router', 6, '', 1, 60, 1, 0, 0, 5, 'exact', 0, NULL, NULL, 1, 0, NULL, 0),
(51, 'Screen Printing Equipment', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, NULL, 0),
(52, 'Crop Row 1', NULL, 'A row of crops, can hold 272 plants.', 4, NULL, 0, 0, 1, 5, 'range', 10, 60, 10, NULL, 0, NULL, 0),
(53, 'Crop Row 2', NULL, 'Better than Crop Row 1, soil more moist.', 4, NULL, 0, 0, 1, 5, 'range', 10, 60, 10, NULL, 0, NULL, 0),
(54, 'Red Van', NULL, 'Owned by University Communication', 3, NULL, 0, 0, 1, 5, 'range', 60, 480, 60, NULL, 0, NULL, 0),
(57, 'Crop Plot 1', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(58, 'Crop Plot 2', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(59, 'Crop Plot 3', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(60, 'Crop Plot 4', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(61, 'Crop Plot 5', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(62, 'Crop Plot 6', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(63, 'Crop Plot 7', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(64, 'Crop Plot 8', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(65, 'Crop Plot 9', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(66, 'Crop Plot 10', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(67, 'Crop Plot 11', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(68, 'Crop Plot 12', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(69, 'Crop Plot 13', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(70, 'Crop Plot 14', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(71, 'Crop Plot 15', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(72, 'Crop Plot 16', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(73, 'Crop Plot 17', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(74, 'Crop Plot 18', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(75, 'Crop Plot 19', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(76, 'Crop Plot 20', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(77, 'Crop Plot 21', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(78, 'Crop Plot 22', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(79, 'Crop Plot 23', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(80, 'Crop Plot 24', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(81, 'Crop Plot 25', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(82, 'Crop Plot 26', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(83, 'Crop Plot 27', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(84, 'Crop Plot 28', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(85, 'Crop Plot 29', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(86, 'Crop Plot 30', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(87, 'Crop Plot 31', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(88, 'Crop Plot 32', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(89, 'Crop Plot 33', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(90, 'Crop Plot 34', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(91, 'Crop Plot 35', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(92, 'Crop Plot 36', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(93, 'Crop Plot 37', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(94, 'Crop Plot 38', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(95, 'Crop Plot 39', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(96, 'Crop Plot 40', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(97, 'Crop Plot 41', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(98, 'Crop Plot 42', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(99, 'Crop Plot 43', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(100, 'Crop Plot 44', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(101, 'Crop Plot 45', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(102, 'Crop Plot 46', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(103, 'Crop Plot 47', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(104, 'Crop Plot 48', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(105, 'Crop Plot 49', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(106, 'Crop Plot 50', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(107, 'Crop Plot 51', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(108, 'Crop Plot 52', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(109, 'Crop Plot 53', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(110, 'Crop Plot 54', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(111, 'Crop Plot 55', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(112, 'Crop Plot 56', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(113, 'Crop Plot 57', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(114, 'Crop Plot 58', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(115, 'Crop Plot 59', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(116, 'Crop Plot 60', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(117, 'Crop Plot 61', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(118, 'Crop Plot 62', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(119, 'Crop Plot 63', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(120, 'Crop Plot 64', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(121, 'Crop Plot 65', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(122, 'Crop Plot 66', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(123, 'Crop Plot 67', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(124, 'Crop Plot 68', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(125, 'Crop Plot 69', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(126, 'Crop Plot 70', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(127, 'Crop Plot 71', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(128, 'Crop Plot 72', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(129, 'Crop Plot 73', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(130, 'Crop Plot 74', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(131, 'Crop Plot 75', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(132, 'Crop Plot 76', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(133, 'Crop Plot 77', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(134, 'Crop Plot 78', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(135, 'Crop Plot 79', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(136, 'Crop Plot 80', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(137, 'Crop Plot 81', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(138, 'Crop Plot 82', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(139, 'Crop Plot 83', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(140, 'Crop Plot 84', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(141, 'Crop Plot 85', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(142, 'Crop Plot 86', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(143, 'Crop Plot 87', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(144, 'Crop Plot 88', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(145, 'Crop Plot 89', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(146, 'Crop Plot 90', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(147, 'Crop Plot 91', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(148, 'Crop Plot 92', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(149, 'Crop Plot 93', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(150, 'Crop Plot 94', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(151, 'Crop Plot 95', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(152, 'Crop Plot 96', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(153, 'Crop Plot 97', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(154, 'Crop Plot 98', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(155, 'Crop Plot 99', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(156, 'Crop Plot 100', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(157, 'Crop Plot 101', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(158, 'Crop Plot 102', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(159, 'Crop Plot 103', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(160, 'Crop Plot 104', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(161, 'Crop Plot 105', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(162, 'Crop Plot 106', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(163, 'Crop Plot 107', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(164, 'Crop Plot 108', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(165, 'Crop Plot 109', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(166, 'Crop Plot 110', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(167, 'Crop Plot 111', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(168, 'Crop Plot 112', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(169, 'Crop Plot 113', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(170, 'Crop Plot 114', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(171, 'Crop Plot 115', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(172, 'Crop Plot 116', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(173, 'Crop Plot 117', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(174, 'Crop Plot 118', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(175, 'Crop Plot 119', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(176, 'Crop Plot 120', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(177, 'Crop Plot 121', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(178, 'Crop Plot 122', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(179, 'Crop Plot 123', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(180, 'Crop Plot 124', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(181, 'Crop Plot 125', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(182, 'Crop Plot 126', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(183, 'Crop Plot 127', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(184, 'Crop Plot 128', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(185, 'Crop Plot 129', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(186, 'Crop Plot 130', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(187, 'Crop Plot 131', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(188, 'Crop Plot 132', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(189, 'Crop Plot 133', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(190, 'Crop Plot 134', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(191, 'Crop Plot 135', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(192, 'Crop Plot 136', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(193, 'Crop Plot 137', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(194, 'Crop Plot 138', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(195, 'Crop Plot 139', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(196, 'Crop Plot 140', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(197, 'Crop Plot 141', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(198, 'Crop Plot 142', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(199, 'Crop Plot 143', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(200, 'Crop Plot 144', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(201, 'Crop Plot 145', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(202, 'Crop Plot 146', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(203, 'Crop Plot 147', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(204, 'Crop Plot 148', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(205, 'Crop Plot 149', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(206, 'Crop Plot 150', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(207, 'Crop Plot 151', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(208, 'Crop Plot 152', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(209, 'Crop Plot 153', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(210, 'Crop Plot 154', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(211, 'Crop Plot 155', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(212, 'Crop Plot 156', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(213, 'Crop Plot 157', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(214, 'Crop Plot 158', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(215, 'Crop Plot 159', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(216, 'Crop Plot 160', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(217, 'Crop Plot 161', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(218, 'Crop Plot 162', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(219, 'Crop Plot 163', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(220, 'Crop Plot 164', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(221, 'Crop Plot 165', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(222, 'Crop Plot 166', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(223, 'Crop Plot 167', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(224, 'Crop Plot 168', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(225, 'Crop Plot 169', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(226, 'Crop Plot 170', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(227, 'Crop Plot 171', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(228, 'Crop Plot 172', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(229, 'Crop Plot 173', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(230, 'Crop Plot 174', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(231, 'Crop Plot 175', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(232, 'Crop Plot 176', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(233, 'Crop Plot 177', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(234, 'Crop Plot 178', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(235, 'Crop Plot 179', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(236, 'Crop Plot 180', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(237, 'Crop Plot 181', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(238, 'Crop Plot 182', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(239, 'Crop Plot 183', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(240, 'Crop Plot 184', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(241, 'Crop Plot 185', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(242, 'Crop Plot 186', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(243, 'Crop Plot 187', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(244, 'Crop Plot 188', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(245, 'Crop Plot 189', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(246, 'Crop Plot 190', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(247, 'Crop Plot 191', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(248, 'Crop Plot 192', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(249, 'Crop Plot 193', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(250, 'Crop Plot 194', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(251, 'Crop Plot 195', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(252, 'Crop Plot 196', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(253, 'Crop Plot 197', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(254, 'Crop Plot 198', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(255, 'Crop Plot 199', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(256, 'Crop Plot 200', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(257, 'Crop Plot 201', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(258, 'Crop Plot 202', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(259, 'Crop Plot 203', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(260, 'Crop Plot 204', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(261, 'Crop Plot 205', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(262, 'Crop Plot 206', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(263, 'Crop Plot 207', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(264, 'Crop Plot 208', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(265, 'Crop Plot 209', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(266, 'Crop Plot 210', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(267, 'Crop Plot 211', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(268, 'Crop Plot 212', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(269, 'Crop Plot 213', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(270, 'Crop Plot 214', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(271, 'Crop Plot 215', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(272, 'Crop Plot 216', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(273, 'Crop Plot 217', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(274, 'Crop Plot 218', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(275, 'Crop Plot 219', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(276, 'Crop Plot 220', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(277, 'Crop Plot 221', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(278, 'Crop Plot 222', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(279, 'Crop Plot 223', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(280, 'Crop Plot 224', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(281, 'Crop Plot 225', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(282, 'Crop Plot 226', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(283, 'Crop Plot 227', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(284, 'Crop Plot 228', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(285, 'Crop Plot 229', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(286, 'Crop Plot 230', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(287, 'Crop Plot 231', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(288, 'Crop Plot 232', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(289, 'Crop Plot 233', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(290, 'Crop Plot 234', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(291, 'Crop Plot 235', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(292, 'Crop Plot 236', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(293, 'Crop Plot 237', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(294, 'Crop Plot 238', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(295, 'Crop Plot 239', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(296, 'Crop Plot 240', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(297, 'Crop Plot 241', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(298, 'Crop Plot 242', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(299, 'Crop Plot 243', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(300, 'Crop Plot 244', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(301, 'Crop Plot 245', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(302, 'Crop Plot 246', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(303, 'Crop Plot 247', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(304, 'Crop Plot 248', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(305, 'Crop Plot 249', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(306, 'Crop Plot 250', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(307, 'Crop Plot 251', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(308, 'Crop Plot 252', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(309, 'Crop Plot 253', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(310, 'Crop Plot 254', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(311, 'Crop Plot 255', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(312, 'Crop Plot 256', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(313, 'Crop Plot 257', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(314, 'Crop Plot 258', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(315, 'Crop Plot 259', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(316, 'Crop Plot 260', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(317, 'Crop Plot 261', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(318, 'Crop Plot 262', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(319, 'Crop Plot 263', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(320, 'Crop Plot 264', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(321, 'Crop Plot 265', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(322, 'Crop Plot 266', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(323, 'Crop Plot 267', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(324, 'Crop Plot 268', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(325, 'Crop Plot 269', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(326, 'Crop Plot 270', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(327, 'Crop Plot 271', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(328, 'Crop Plot 272', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(329, 'Crop Plot 273', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(330, 'Crop Plot 274', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(331, 'Crop Plot 275', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(332, 'Crop Plot 276', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(333, 'Crop Plot 277', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(334, 'Crop Plot 278', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(335, 'Crop Plot 279', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(336, 'Crop Plot 280', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'exact', NULL, NULL, NULL, 2, 0, NULL, 0),
(337, 'Crop Plot 281', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(338, 'Crop Plot 282', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(339, 'Crop Plot 283', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(340, 'Crop Plot 284', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(341, 'Crop Plot 285', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(342, 'Crop Plot 286', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(343, 'Crop Plot 287', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(344, 'Crop Plot 288', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(345, 'Crop Plot 289', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(346, 'Crop Plot 290', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(347, 'Crop Plot 291', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(348, 'Crop Plot 292', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(349, 'Crop Plot 293', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(350, 'Crop Plot 294', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(351, 'Crop Plot 295', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(352, 'Crop Plot 296', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(353, 'Crop Plot 297', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(354, 'Crop Plot 298', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(355, 'Crop Plot 299', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(356, 'Crop Plot 300', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(357, 'Crop Plot 301', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(358, 'Crop Plot 302', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(359, 'Crop Plot 303', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(360, 'Crop Plot 304', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(361, 'Crop Plot 305', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(362, 'Crop Plot 306', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(363, 'Crop Plot 307', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(364, 'Crop Plot 308', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(365, 'Crop Plot 309', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(366, 'Crop Plot 310', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(367, 'Crop Plot 311', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(368, 'Crop Plot 312', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(369, 'Crop Plot 313', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(370, 'Crop Plot 314', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(371, 'Crop Plot 315', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(372, 'Crop Plot 316', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(373, 'Crop Plot 317', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(374, 'Crop Plot 318', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(375, 'Crop Plot 319', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(376, 'Crop Plot 320', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(377, 'Crop Plot 321', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(378, 'Crop Plot 322', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(379, 'Crop Plot 323', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(380, 'Crop Plot 324', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(381, 'Crop Plot 325', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(382, 'Crop Plot 326', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(383, 'Crop Plot 327', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(384, 'Crop Plot 328', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(385, 'Crop Plot 329', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(386, 'Crop Plot 330', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(387, 'Crop Plot 331', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(388, 'Crop Plot 332', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(389, 'Crop Plot 333', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(390, 'Crop Plot 334', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(391, 'Crop Plot 335', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(392, 'Crop Plot 336', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(393, 'Crop Plot 337', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(394, 'Crop Plot 338', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(395, 'Crop Plot 339', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(396, 'Crop Plot 340', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(397, 'Crop Plot 341', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(398, 'Crop Plot 342', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(399, 'Crop Plot 343', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(400, 'Crop Plot 344', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(401, 'Crop Plot 345', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(402, 'Crop Plot 346', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(403, 'Crop Plot 347', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(404, 'Crop Plot 348', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(405, 'Crop Plot 349', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(406, 'Crop Plot 350', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(407, 'Crop Plot 351', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(408, 'Crop Plot 352', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(409, 'Crop Plot 353', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(410, 'Crop Plot 354', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(411, 'Crop Plot 355', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(412, 'Crop Plot 356', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(413, 'Crop Plot 357', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(414, 'Crop Plot 358', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(415, 'Crop Plot 359', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(416, 'Crop Plot 360', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(417, 'Crop Plot 361', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(418, 'Crop Plot 362', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(419, 'Crop Plot 363', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(420, 'Crop Plot 364', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(421, 'Crop Plot 365', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(422, 'Crop Plot 366', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(423, 'Crop Plot 367', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(424, 'Crop Plot 368', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(425, 'Crop Plot 369', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(426, 'Crop Plot 370', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(427, 'Crop Plot 371', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(428, 'Crop Plot 372', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(429, 'Crop Plot 373', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(430, 'Crop Plot 374', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(431, 'Crop Plot 375', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(432, 'Crop Plot 376', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(433, 'Crop Plot 377', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(434, 'Crop Plot 378', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(435, 'Crop Plot 379', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(436, 'Crop Plot 380', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(437, 'Crop Plot 381', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(438, 'Crop Plot 382', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(439, 'Crop Plot 383', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(440, 'Crop Plot 384', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(441, 'Crop Plot 385', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(442, 'Crop Plot 386', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(443, 'Crop Plot 387', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(444, 'Crop Plot 388', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(445, 'Crop Plot 389', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(446, 'Crop Plot 390', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(447, 'Crop Plot 391', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(448, 'Crop Plot 392', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(449, 'Crop Plot 393', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(450, 'Crop Plot 394', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(451, 'Crop Plot 395', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(452, 'Crop Plot 396', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(453, 'Crop Plot 397', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(454, 'Crop Plot 398', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(455, 'Crop Plot 399', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(456, 'Crop Plot 400', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(457, 'Crop Plot 401', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(458, 'Crop Plot 402', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(459, 'Crop Plot 403', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(460, 'Crop Plot 404', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(461, 'Crop Plot 405', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(462, 'Crop Plot 406', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(463, 'Crop Plot 407', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(464, 'Crop Plot 408', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(465, 'Crop Plot 409', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(466, 'Crop Plot 410', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(467, 'Crop Plot 411', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(468, 'Crop Plot 412', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(469, 'Crop Plot 413', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(470, 'Crop Plot 414', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(471, 'Crop Plot 415', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(472, 'Crop Plot 416', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(473, 'Crop Plot 417', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(474, 'Crop Plot 418', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(475, 'Crop Plot 419', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(476, 'Crop Plot 420', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(477, 'Crop Plot 421', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(478, 'Crop Plot 422', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(479, 'Crop Plot 423', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(480, 'Crop Plot 424', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(481, 'Crop Plot 425', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(482, 'Crop Plot 426', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(483, 'Crop Plot 427', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(484, 'Crop Plot 428', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(485, 'Crop Plot 429', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(486, 'Crop Plot 430', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(487, 'Crop Plot 431', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(488, 'Crop Plot 432', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(489, 'Crop Plot 433', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(490, 'Crop Plot 434', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(491, 'Crop Plot 435', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(492, 'Crop Plot 436', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(493, 'Crop Plot 437', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(494, 'Crop Plot 438', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(495, 'Crop Plot 439', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(496, 'Crop Plot 440', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(497, 'Crop Plot 441', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(498, 'Crop Plot 442', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(499, 'Crop Plot 443', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(500, 'Crop Plot 444', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(501, 'Crop Plot 445', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(502, 'Crop Plot 446', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(503, 'Crop Plot 447', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(504, 'Crop Plot 448', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(505, 'Crop Plot 449', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(506, 'Crop Plot 450', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(507, 'Crop Plot 451', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(508, 'Crop Plot 452', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(509, 'Crop Plot 453', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(510, 'Crop Plot 454', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(511, 'Crop Plot 455', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(512, 'Crop Plot 456', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(513, 'Crop Plot 457', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(514, 'Crop Plot 458', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(515, 'Crop Plot 459', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(516, 'Crop Plot 460', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(517, 'Crop Plot 461', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(518, 'Crop Plot 462', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(519, 'Crop Plot 463', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(520, 'Crop Plot 464', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(521, 'Crop Plot 465', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(522, 'Crop Plot 466', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(523, 'Crop Plot 467', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(524, 'Crop Plot 468', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(525, 'Crop Plot 469', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(526, 'Crop Plot 470', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(527, 'Crop Plot 471', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(528, 'Crop Plot 472', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(529, 'Crop Plot 473', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(530, 'Crop Plot 474', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(531, 'Crop Plot 475', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(532, 'Crop Plot 476', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0);
INSERT INTO `resources` (`id`, `name`, `category_id`, `description`, `service_space_id`, `minutes_per_reservation`, `needs_authorization`, `needs_approval`, `is_reservable`, `max_reservations_per_slot`, `time_slot_type`, `min_minutes_per_reservation`, `max_minutes_per_reservation`, `increment_minutes_per_reservation`, `resource_class_id`, `available_app_wide`, `max_reservations_per_user`, `INOP`) VALUES
(533, 'Crop Plot 477', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(534, 'Crop Plot 478', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(535, 'Crop Plot 479', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(536, 'Crop Plot 480', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(537, 'Crop Plot 481', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(538, 'Crop Plot 482', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(539, 'Crop Plot 483', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(540, 'Crop Plot 484', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(541, 'Crop Plot 485', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(542, 'Crop Plot 486', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(543, 'Crop Plot 487', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(544, 'Crop Plot 488', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(545, 'Crop Plot 489', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(546, 'Crop Plot 490', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(547, 'Crop Plot 491', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(548, 'Crop Plot 492', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(549, 'Crop Plot 493', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(550, 'Crop Plot 494', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(551, 'Crop Plot 495', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(552, 'Crop Plot 496', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(553, 'Crop Plot 497', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(554, 'Crop Plot 498', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(555, 'Crop Plot 499', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(556, 'Crop Plot 500', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(557, 'Crop Plot 501', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(558, 'Crop Plot 502', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(559, 'Crop Plot 503', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(560, 'Crop Plot 504', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(561, 'Crop Plot 505', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(562, 'Crop Plot 506', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(563, 'Crop Plot 507', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(564, 'Crop Plot 508', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(565, 'Crop Plot 509', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(566, 'Crop Plot 510', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(567, 'Crop Plot 511', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(568, 'Crop Plot 512', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(569, 'Crop Plot 513', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(570, 'Crop Plot 514', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(571, 'Crop Plot 515', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(572, 'Crop Plot 516', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(573, 'Crop Plot 517', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(574, 'Crop Plot 518', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(575, 'Crop Plot 519', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(576, 'Crop Plot 520', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(577, 'Crop Plot 521', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(578, 'Crop Plot 522', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(579, 'Crop Plot 523', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(580, 'Crop Plot 524', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(581, 'Crop Plot 525', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(582, 'Crop Plot 526', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(583, 'Crop Plot 527', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(584, 'Crop Plot 528', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(585, 'Crop Plot 529', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(586, 'Crop Plot 530', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(587, 'Crop Plot 531', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(588, 'Crop Plot 532', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(589, 'Crop Plot 533', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(590, 'Crop Plot 534', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(591, 'Crop Plot 535', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(592, 'Crop Plot 536', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(593, 'Crop Plot 537', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(594, 'Crop Plot 538', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(595, 'Crop Plot 539', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(596, 'Crop Plot 540', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(597, 'Crop Plot 541', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(598, 'Crop Plot 542', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(599, 'Crop Plot 543', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(600, 'Crop Plot 544', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(601, 'Crop Plot 545', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(602, 'Crop Plot 546', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(603, 'Crop Plot 547', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(604, 'Crop Plot 548', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(605, 'Crop Plot 549', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(606, 'Crop Plot 550', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(607, 'Crop Plot 551', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(608, 'Crop Plot 552', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(609, 'Crop Plot 553', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(610, 'Crop Plot 554', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(611, 'Crop Plot 555', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(612, 'Crop Plot 556', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(613, 'Crop Plot 557', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(614, 'Crop Plot 558', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(615, 'Crop Plot 559', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(616, 'Crop Plot 560', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(617, 'Crop Plot 561', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(618, 'Crop Plot 562', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(619, 'Crop Plot 563', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(620, 'Crop Plot 564', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(621, 'Crop Plot 565', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(622, 'Crop Plot 566', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(623, 'Crop Plot 567', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(624, 'Crop Plot 568', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(625, 'Crop Plot 569', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(626, 'Crop Plot 570', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(627, 'Crop Plot 571', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(628, 'Crop Plot 572', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(629, 'Crop Plot 573', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(630, 'Crop Plot 574', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(631, 'Crop Plot 575', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(632, 'Crop Plot 576', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(633, 'Crop Plot 577', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(634, 'Crop Plot 578', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(635, 'Crop Plot 579', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(636, 'Crop Plot 580', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(637, 'Crop Plot 581', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(638, 'Crop Plot 582', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(639, 'Crop Plot 583', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(640, 'Crop Plot 584', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(641, 'Crop Plot 585', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(642, 'Crop Plot 586', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(643, 'Crop Plot 587', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(644, 'Crop Plot 588', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(645, 'Crop Plot 589', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(646, 'Crop Plot 590', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(647, 'Crop Plot 591', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(648, 'Crop Plot 592', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(649, 'Crop Plot 593', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(650, 'Crop Plot 594', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(651, 'Crop Plot 595', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(652, 'Crop Plot 596', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(653, 'Crop Plot 597', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(654, 'Crop Plot 598', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(655, 'Crop Plot 599', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(656, 'Crop Plot 600', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(657, 'Crop Plot 601', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(658, 'Crop Plot 602', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(659, 'Crop Plot 603', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(660, 'Crop Plot 604', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(661, 'Crop Plot 605', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(662, 'Crop Plot 606', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(663, 'Crop Plot 607', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(664, 'Crop Plot 608', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(665, 'Crop Plot 609', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(666, 'Crop Plot 610', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(667, 'Crop Plot 611', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(668, 'Crop Plot 612', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(669, 'Crop Plot 613', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(670, 'Crop Plot 614', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(671, 'Crop Plot 615', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(672, 'Crop Plot 616', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(673, 'Crop Plot 617', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(674, 'Crop Plot 618', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(675, 'Crop Plot 619', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(676, 'Crop Plot 620', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(677, 'Crop Plot 621', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(678, 'Crop Plot 622', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(679, 'Crop Plot 623', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(680, 'Crop Plot 624', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(681, 'Crop Plot 625', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(682, 'Crop Plot 626', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(683, 'Crop Plot 627', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(684, 'Crop Plot 628', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(685, 'Crop Plot 629', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(686, 'Crop Plot 630', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(687, 'Crop Plot 631', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(688, 'Crop Plot 632', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(689, 'Crop Plot 633', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(690, 'Crop Plot 634', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(691, 'Crop Plot 635', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(692, 'Crop Plot 636', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(693, 'Crop Plot 637', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(694, 'Crop Plot 638', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(695, 'Crop Plot 639', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(696, 'Crop Plot 640', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(697, 'Crop Plot 641', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(698, 'Crop Plot 642', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(699, 'Crop Plot 643', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(700, 'Crop Plot 644', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(701, 'Crop Plot 645', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(702, 'Crop Plot 646', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(703, 'Crop Plot 647', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(704, 'Crop Plot 648', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(705, 'Crop Plot 649', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(706, 'Crop Plot 650', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(707, 'Crop Plot 651', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(708, 'Crop Plot 652', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(709, 'Crop Plot 653', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(710, 'Crop Plot 654', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(711, 'Crop Plot 655', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(712, 'Crop Plot 656', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(713, 'Crop Plot 657', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(714, 'Crop Plot 658', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(715, 'Crop Plot 659', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(716, 'Crop Plot 660', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(717, 'Crop Plot 661', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(718, 'Crop Plot 662', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(719, 'Crop Plot 663', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(720, 'Crop Plot 664', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(721, 'Crop Plot 665', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(722, 'Crop Plot 666', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(723, 'Crop Plot 667', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(724, 'Crop Plot 668', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(725, 'Crop Plot 669', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(726, 'Crop Plot 670', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(727, 'Crop Plot 671', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(728, 'Crop Plot 672', NULL, NULL, 5, NULL, 0, 0, 1, 1, 'range', NULL, NULL, NULL, 2, 0, NULL, 0),
(729, 'Microscope', NULL, 'To scope things', 6, NULL, 0, 0, 1, 5, 'range', 30, 360, 30, NULL, 0, NULL, 0),
(731, 'Microscope', NULL, '', 7, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, NULL, 1, NULL, 0),
(732, 'Laser Cutter Fusion Pro 36 CO2/FIBER', 4, '100 watt CO2 50 watt Fiber', 1, NULL, 1, 0, 1, 5, 'range', 30, 150, 30, 1, 0, 2, 0),
(733, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(734, ' - ', 6, 'Carvey Desktop CNC Router', 1, NULL, 1, 0, 0, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(735, 'Wood Lathe-Mini #1', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(736, 'Wood Lathe-Mini #2', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(737, 'Wood Lathe-Mini #3', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(738, 'Wood Lathe-Mini #4', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(739, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(740, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(741, 'Drum Sander ', 6, '', 1, NULL, 1, 0, 0, 5, 'range', 15, 60, 15, 1, 0, NULL, 0),
(742, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 1),
(743, 'Embroidery Machine', 5, '6 needle embroidery machine', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(744, ' Miter Saw', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(745, 'Domino Joiner', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(746, 'Virtual Welding Trainer #0148', 3, '', 1, 60, 1, 0, 1, 5, 'range', 30, 60, 30, 1, 0, 2, 0),
(747, 'Virtual Welding Trainer #0149', 3, '', 1, 1, 1, 0, 1, 5, 'exact', 30, 60, 30, 1, 0, 2, 0),
(748, 'Wood Lathe-Mini #5', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(749, 'Wood Lathe-Mini #6', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(750, '3D Scanner', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(751, 'Drill Press', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(752, 'Dovetail Joining Machine', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(753, 'Media Blaster', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(754, 'Slip Roller: 36\"', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(755, 'Band Saw: Horizontal', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(756, 'Band Saw: Vertical', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(757, 'CNC Plasma Cutter', 3, '48\" x 48\" Plasma Cutter & Engraver', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(758, 'Cold Saw', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(759, 'Brake 72\" Finger & Box', 3, '12ga steel, 16ga SS max', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(760, 'Shear 48\" Hydraulic', 3, '1/4\" max thickness steel', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(761, 'Tube & Pipe Bender', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(762, 'Tube Expander, Reducer & Rod Bender', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(763, 'Serger', 5, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 180, 30, 1, 0, NULL, 0),
(764, 'Disc Sander', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(765, 'Belt Sander: Ellis', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(767, 'Welder #1 MIG TIG', 3, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 1),
(768, 'Welder #2 MIG TIG', 3, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(769, 'Plasma Cutter Manual', 3, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(770, 'Mill #1', 3, 'Bridgeport Knee Mill', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(772, 'Lathe #1:', 3, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 1),
(774, 'Ironworker', 3, 'Punch, notch, shear, bend metal rod, plate, angle, tube', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(775, 'Heat Press', 1, 'Vinyl & ink image heat press', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, NULL, 0),
(776, 'Throwing Wheel #1', 1, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(777, 'Throwing Wheel #2', 1, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(778, 'Throwing Wheel #3', 1, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(779, 'Throwing Wheel #4', 1, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(782, 'Laser Cutter Fusion Pro 32 CO2', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 150, 30, 1, 0, 2, 0),
(783, 'Big Room Table #01', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(784, 'Big Room Table #02 ', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(785, 'Big Room Table #03', 2, '. ', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(786, 'Big Room Table #04', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(787, 'Big Room Table #05', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(788, 'Big Room Table #06', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(789, 'Big Room Table #07', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(790, 'Big Room Table #08 ', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(791, 'Computer #1', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(792, 'Computer #2', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(793, 'Computer #3', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(794, 'Computer #4', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(795, 'Computer #5 ', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(796, 'Computer #6', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, 2, 0),
(797, 'Computer #7', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 120, 15, 1, 0, NULL, 0),
(804, 'Big Room Table #09', 2, 'Table #9 in large work area', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(805, 'Big Room Table #10', 2, 'Table #10 in large work area', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(806, 'Sewing Machine #1', 5, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(807, 'Sewing Machine #2', 5, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(808, 'Electronics Workbench #1', 4, '', 1, NULL, 0, 0, 1, 5, 'range', 15, 180, 15, 1, 0, 2, 0),
(809, 'Electronics Workbench #2', 4, '', 1, NULL, 0, 0, 1, 5, 'exact', 15, 180, 15, 1, 0, 2, 0),
(810, 'Bench Grinder', 3, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(811, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(812, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(813, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(814, 'Mortiser', 6, 'Mortiser', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(815, 'CNC Fiber Laser Cutter', 3, 'Cuts up to 2\"Dx80\"L square & round tube,  and 25x50x1/4\" steel stainless steel, & aluminum sheet', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(816, 'Belt Sander: Baileigh', 3, 'Adjustable Belt Sander', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(817, 'Classroom ', 2, 'COVID capacity - 13\r\nNormal capacity - 42', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 15, 1, 0, NULL, 0),
(818, 'Laser Cutter Fusion Pro 32 CO2/FIBER', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 150, 15, 1, 0, 2, 0),
(819, 'Sewing Machine #3', 5, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(820, 'Sewing Machine #4', 5, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 180, 30, 1, 0, NULL, 0),
(821, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(822, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(823, 'Big Room Table #11', 2, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(824, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(825, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 3, 0),
(826, 'Large Format Printer/Scanner', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(827, 'Throwing Wheel #5', 1, '', 1, NULL, 0, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(831, 'Kiln: Medium', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 60, 420, 60, 1, 0, 6, 0),
(832, 'Kiln: Small ', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 60, 420, 60, 1, 0, 6, 0),
(833, 'Kiln: Large', 1, '', 1, NULL, 1, 0, 1, 5, 'range', 60, 420, 60, 1, 0, 6, 0),
(834, 'Tormach CNC Mill', 3, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, 2, 0),
(835, 'Belt Sander', 6, '', 1, NULL, 1, 0, 0, 5, 'exact', NULL, NULL, NULL, 1, 0, NULL, 0),
(836, '3d Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 20, 0),
(837, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 20, 0),
(838, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'exact', 30, 420, 30, 1, 0, 10, 0),
(839, '3D Printer', 4, '', 1, NULL, 1, 0, 1, 5, 'exact', 30, 420, 30, 1, 0, 5, 0),
(840, 'Embroidery Machine', 5, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 240, 30, 1, 0, NULL, 0),
(841, '3D Scanner', 4, 'Creaform Handheld 3D Scanner', 1, NULL, 1, 0, 1, 5, 'range', 30, 180, 30, 1, 0, 2, 0),
(842, 'CNC Router', 6, '', 1, NULL, 1, 0, 1, 5, 'range', 30, 420, 30, 1, 0, 1, 0),
(843, 'Virtual Welding Trainer AR TIG', 3, '', 1, 1, 1, 0, 1, 5, 'exact', 30, 60, 30, 1, 0, 2, 0),
(844, 'Virtual Welding Trainer AR MIG', 3, '', 1, 1, 1, 0, 1, 5, 'exact', 30, 60, 30, 1, 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `resource_approvers`
--

CREATE TABLE `resource_approvers` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_authorizations`
--

CREATE TABLE `resource_authorizations` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `authorized_date` datetime DEFAULT NULL,
  `authorized_event` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resource_authorizations`
--

-- --------------------------------------------------------

--
-- Table structure for table `resource_classes`
--

CREATE TABLE `resource_classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resource_classes`
--

INSERT INTO `resource_classes` (`id`, `name`) VALUES
(1, 'Innovation Studio Tool'),
(2, 'Plant Phenotyping Crop Plot');

-- --------------------------------------------------------

--
-- Table structure for table `resource_fields`
--

CREATE TABLE `resource_fields` (
  `id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resource_fields`
--

INSERT INTO `resource_fields` (`id`, `field_name`, `resource_class_id`) VALUES
(1, 'Model', 1),
(5, 'Greenhouse', 2),
(6, 'Plot Number', 2);

-- --------------------------------------------------------

--
-- Table structure for table `resource_field_data`
--

CREATE TABLE `resource_field_data` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_field_id` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resource_field_data`
--

INSERT INTO `resource_field_data` (`id`, `resource_id`, `resource_field_id`, `data`) VALUES
(1, 8, 1, 'ShopBot PRSalpha 96\" x 48\" '),
(2, 9, 1, 'Clausing 20'),
(3, 10, 1, 'Festool Kapex KS 120 EB'),
(4, 11, 1, 'Saw Stop 10\" Industrial Grade Cabinet Saw'),
(5, 12, 1, 'Epilog'),
(7, 14, 1, 'Ultimaker 2+ Connect #3'),
(8, 15, 1, 'Jet '),
(9, 16, 1, 'Jet '),
(10, 17, 1, 'Delta'),
(11, 18, 1, 'Laguna'),
(12, 19, 1, 'Safety Speed'),
(14, 22, 1, 'Next Engine'),
(15, 23, 1, 'Graphtec Cutting Plotter CE6000-60'),
(16, 24, 1, 'JUKI DDL 5550'),
(18, 28, 1, 'Powermatic '),
(19, 30, 1, 'Epilog'),
(20, 31, 1, 'HL850'),
(21, 32, 1, 'TS75EQ'),
(22, 33, 1, 'OF1400'),
(23, 34, 1, 'DF 500 Festool'),
(24, 35, 1, 'RO125 FEQ'),
(25, 36, 1, 'ETS125 EQ'),
(26, 37, 1, 'PowerMatic'),
(27, 38, 1, 'Felder'),
(28, 39, 1, 'Jet'),
(29, 47, 1, 'APQS Millennium '),
(31, 49, 1, 'Ultimaker 2+ Connect #4'),
(32, 50, 1, 'General 40-200'),
(33, 51, 1, 'Dark Room, Light Table, 4-Color Press'),
(36, 57, 5, '1'),
(37, 57, 6, '1'),
(38, 58, 5, '1'),
(39, 58, 6, '2'),
(40, 59, 5, '1'),
(41, 59, 6, '3'),
(42, 60, 5, '1'),
(43, 60, 6, '4'),
(44, 61, 5, '1'),
(45, 61, 6, '5'),
(46, 62, 5, '1'),
(47, 62, 6, '6'),
(48, 63, 5, '1'),
(49, 63, 6, '7'),
(50, 64, 5, '1'),
(51, 64, 6, '8'),
(52, 65, 5, '1'),
(53, 65, 6, '9'),
(54, 66, 5, '1'),
(55, 66, 6, '10'),
(56, 67, 5, '1'),
(57, 67, 6, '11'),
(58, 68, 5, '1'),
(59, 68, 6, '12'),
(60, 69, 5, '1'),
(61, 69, 6, '13'),
(62, 70, 5, '1'),
(63, 70, 6, '14'),
(64, 71, 5, '1'),
(65, 71, 6, '15'),
(66, 72, 5, '1'),
(67, 72, 6, '16'),
(68, 73, 5, '1'),
(69, 73, 6, '17'),
(70, 74, 5, '1'),
(71, 74, 6, '18'),
(72, 75, 5, '1'),
(73, 75, 6, '19'),
(74, 76, 5, '1'),
(75, 76, 6, '20'),
(76, 77, 5, '1'),
(77, 77, 6, '21'),
(78, 78, 5, '1'),
(79, 78, 6, '22'),
(80, 79, 5, '1'),
(81, 79, 6, '23'),
(82, 80, 5, '1'),
(83, 80, 6, '24'),
(84, 81, 5, '1'),
(85, 81, 6, '25'),
(86, 82, 5, '1'),
(87, 82, 6, '26'),
(88, 83, 5, '1'),
(89, 83, 6, '27'),
(90, 84, 5, '1'),
(91, 84, 6, '28'),
(92, 85, 5, '1'),
(93, 85, 6, '29'),
(94, 86, 5, '1'),
(95, 86, 6, '30'),
(96, 87, 5, '1'),
(97, 87, 6, '31'),
(98, 88, 5, '1'),
(99, 88, 6, '32'),
(100, 89, 5, '1'),
(101, 89, 6, '33'),
(102, 90, 5, '1'),
(103, 90, 6, '34'),
(104, 91, 5, '1'),
(105, 91, 6, '35'),
(106, 92, 5, '1'),
(107, 92, 6, '36'),
(108, 93, 5, '1'),
(109, 93, 6, '37'),
(110, 94, 5, '1'),
(111, 94, 6, '38'),
(112, 95, 5, '1'),
(113, 95, 6, '39'),
(114, 96, 5, '1'),
(115, 96, 6, '40'),
(116, 97, 5, '1'),
(117, 97, 6, '41'),
(118, 98, 5, '1'),
(119, 98, 6, '42'),
(120, 99, 5, '1'),
(121, 99, 6, '43'),
(122, 100, 5, '1'),
(123, 100, 6, '44'),
(124, 101, 5, '1'),
(125, 101, 6, '45'),
(126, 102, 5, '1'),
(127, 102, 6, '46'),
(128, 103, 5, '1'),
(129, 103, 6, '47'),
(130, 104, 5, '1'),
(131, 104, 6, '48'),
(132, 105, 5, '1'),
(133, 105, 6, '49'),
(134, 106, 5, '1'),
(135, 106, 6, '50'),
(136, 107, 5, '1'),
(137, 107, 6, '51'),
(138, 108, 5, '1'),
(139, 108, 6, '52'),
(140, 109, 5, '1'),
(141, 109, 6, '53'),
(142, 110, 5, '1'),
(143, 110, 6, '54'),
(144, 111, 5, '1'),
(145, 111, 6, '55'),
(146, 112, 5, '1'),
(147, 112, 6, '56'),
(148, 113, 5, '1'),
(149, 113, 6, '57'),
(150, 114, 5, '1'),
(151, 114, 6, '58'),
(152, 115, 5, '1'),
(153, 115, 6, '59'),
(154, 116, 5, '1'),
(155, 116, 6, '60'),
(156, 117, 5, '1'),
(157, 117, 6, '61'),
(158, 118, 5, '1'),
(159, 118, 6, '62'),
(160, 119, 5, '1'),
(161, 119, 6, '63'),
(162, 120, 5, '1'),
(163, 120, 6, '64'),
(164, 121, 5, '1'),
(165, 121, 6, '65'),
(166, 122, 5, '1'),
(167, 122, 6, '66'),
(168, 123, 5, '1'),
(169, 123, 6, '67'),
(170, 124, 5, '1'),
(171, 124, 6, '68'),
(172, 125, 5, '1'),
(173, 125, 6, '69'),
(174, 126, 5, '1'),
(175, 126, 6, '70'),
(176, 127, 5, '1'),
(177, 127, 6, '71'),
(178, 128, 5, '1'),
(179, 128, 6, '72'),
(180, 129, 5, '1'),
(181, 129, 6, '73'),
(182, 130, 5, '1'),
(183, 130, 6, '74'),
(184, 131, 5, '1'),
(185, 131, 6, '75'),
(186, 132, 5, '1'),
(187, 132, 6, '76'),
(188, 133, 5, '1'),
(189, 133, 6, '77'),
(190, 134, 5, '1'),
(191, 134, 6, '78'),
(192, 135, 5, '1'),
(193, 135, 6, '79'),
(194, 136, 5, '1'),
(195, 136, 6, '80'),
(196, 137, 5, '1'),
(197, 137, 6, '81'),
(198, 138, 5, '1'),
(199, 138, 6, '82'),
(200, 139, 5, '1'),
(201, 139, 6, '83'),
(202, 140, 5, '1'),
(203, 140, 6, '84'),
(204, 141, 5, '1'),
(205, 141, 6, '85'),
(206, 142, 5, '1'),
(207, 142, 6, '86'),
(208, 143, 5, '1'),
(209, 143, 6, '87'),
(210, 144, 5, '1'),
(211, 144, 6, '88'),
(212, 145, 5, '1'),
(213, 145, 6, '89'),
(214, 146, 5, '1'),
(215, 146, 6, '90'),
(216, 147, 5, '1'),
(217, 147, 6, '91'),
(218, 148, 5, '1'),
(219, 148, 6, '92'),
(220, 149, 5, '1'),
(221, 149, 6, '93'),
(222, 150, 5, '1'),
(223, 150, 6, '94'),
(224, 151, 5, '1'),
(225, 151, 6, '95'),
(226, 152, 5, '1'),
(227, 152, 6, '96'),
(228, 153, 5, '1'),
(229, 153, 6, '97'),
(230, 154, 5, '1'),
(231, 154, 6, '98'),
(232, 155, 5, '1'),
(233, 155, 6, '99'),
(234, 156, 5, '1'),
(235, 156, 6, '100'),
(236, 157, 5, '1'),
(237, 157, 6, '101'),
(238, 158, 5, '1'),
(239, 158, 6, '102'),
(240, 159, 5, '1'),
(241, 159, 6, '103'),
(242, 160, 5, '1'),
(243, 160, 6, '104'),
(244, 161, 5, '1'),
(245, 161, 6, '105'),
(246, 162, 5, '1'),
(247, 162, 6, '106'),
(248, 163, 5, '1'),
(249, 163, 6, '107'),
(250, 164, 5, '1'),
(251, 164, 6, '108'),
(252, 165, 5, '1'),
(253, 165, 6, '109'),
(254, 166, 5, '1'),
(255, 166, 6, '110'),
(256, 167, 5, '1'),
(257, 167, 6, '111'),
(258, 168, 5, '1'),
(259, 168, 6, '112'),
(260, 169, 5, '1'),
(261, 169, 6, '113'),
(262, 170, 5, '1'),
(263, 170, 6, '114'),
(264, 171, 5, '1'),
(265, 171, 6, '115'),
(266, 172, 5, '1'),
(267, 172, 6, '116'),
(268, 173, 5, '1'),
(269, 173, 6, '117'),
(270, 174, 5, '1'),
(271, 174, 6, '118'),
(272, 175, 5, '1'),
(273, 175, 6, '119'),
(274, 176, 5, '1'),
(275, 176, 6, '120'),
(276, 177, 5, '1'),
(277, 177, 6, '121'),
(278, 178, 5, '1'),
(279, 178, 6, '122'),
(280, 179, 5, '1'),
(281, 179, 6, '123'),
(282, 180, 5, '1'),
(283, 180, 6, '124'),
(284, 181, 5, '1'),
(285, 181, 6, '125'),
(286, 182, 5, '1'),
(287, 182, 6, '126'),
(288, 183, 5, '1'),
(289, 183, 6, '127'),
(290, 184, 5, '1'),
(291, 184, 6, '128'),
(292, 185, 5, '1'),
(293, 185, 6, '129'),
(294, 186, 5, '1'),
(295, 186, 6, '130'),
(296, 187, 5, '1'),
(297, 187, 6, '131'),
(298, 188, 5, '1'),
(299, 188, 6, '132'),
(300, 189, 5, '1'),
(301, 189, 6, '133'),
(302, 190, 5, '1'),
(303, 190, 6, '134'),
(304, 191, 5, '1'),
(305, 191, 6, '135'),
(306, 192, 5, '1'),
(307, 192, 6, '136'),
(308, 193, 5, '1'),
(309, 193, 6, '137'),
(310, 194, 5, '1'),
(311, 194, 6, '138'),
(312, 195, 5, '1'),
(313, 195, 6, '139'),
(314, 196, 5, '1'),
(315, 196, 6, '140'),
(316, 197, 5, '1'),
(317, 197, 6, '141'),
(318, 198, 5, '1'),
(319, 198, 6, '142'),
(320, 199, 5, '1'),
(321, 199, 6, '143'),
(322, 200, 5, '1'),
(323, 200, 6, '144'),
(324, 201, 5, '1'),
(325, 201, 6, '145'),
(326, 202, 5, '1'),
(327, 202, 6, '146'),
(328, 203, 5, '1'),
(329, 203, 6, '147'),
(330, 204, 5, '1'),
(331, 204, 6, '148'),
(332, 205, 5, '1'),
(333, 205, 6, '149'),
(334, 206, 5, '1'),
(335, 206, 6, '150'),
(336, 207, 5, '1'),
(337, 207, 6, '151'),
(338, 208, 5, '1'),
(339, 208, 6, '152'),
(340, 209, 5, '1'),
(341, 209, 6, '153'),
(342, 210, 5, '1'),
(343, 210, 6, '154'),
(344, 211, 5, '1'),
(345, 211, 6, '155'),
(346, 212, 5, '1'),
(347, 212, 6, '156'),
(348, 213, 5, '1'),
(349, 213, 6, '157'),
(350, 214, 5, '1'),
(351, 214, 6, '158'),
(352, 215, 5, '1'),
(353, 215, 6, '159'),
(354, 216, 5, '1'),
(355, 216, 6, '160'),
(356, 217, 5, '1'),
(357, 217, 6, '161'),
(358, 218, 5, '1'),
(359, 218, 6, '162'),
(360, 219, 5, '1'),
(361, 219, 6, '163'),
(362, 220, 5, '1'),
(363, 220, 6, '164'),
(364, 221, 5, '1'),
(365, 221, 6, '165'),
(366, 222, 5, '1'),
(367, 222, 6, '166'),
(368, 223, 5, '1'),
(369, 223, 6, '167'),
(370, 224, 5, '1'),
(371, 224, 6, '168'),
(372, 225, 5, '1'),
(373, 225, 6, '169'),
(374, 226, 5, '1'),
(375, 226, 6, '170'),
(376, 227, 5, '1'),
(377, 227, 6, '171'),
(378, 228, 5, '1'),
(379, 228, 6, '172'),
(380, 229, 5, '1'),
(381, 229, 6, '173'),
(382, 230, 5, '1'),
(383, 230, 6, '174'),
(384, 231, 5, '1'),
(385, 231, 6, '175'),
(386, 232, 5, '1'),
(387, 232, 6, '176'),
(388, 233, 5, '1'),
(389, 233, 6, '177'),
(390, 234, 5, '1'),
(391, 234, 6, '178'),
(392, 235, 5, '1'),
(393, 235, 6, '179'),
(394, 236, 5, '1'),
(395, 236, 6, '180'),
(396, 237, 5, '1'),
(397, 237, 6, '181'),
(398, 238, 5, '1'),
(399, 238, 6, '182'),
(400, 239, 5, '1'),
(401, 239, 6, '183'),
(402, 240, 5, '1'),
(403, 240, 6, '184'),
(404, 241, 5, '1'),
(405, 241, 6, '185'),
(406, 242, 5, '1'),
(407, 242, 6, '186'),
(408, 243, 5, '1'),
(409, 243, 6, '187'),
(410, 244, 5, '1'),
(411, 244, 6, '188'),
(412, 245, 5, '1'),
(413, 245, 6, '189'),
(414, 246, 5, '1'),
(415, 246, 6, '190'),
(416, 247, 5, '1'),
(417, 247, 6, '191'),
(418, 248, 5, '1'),
(419, 248, 6, '192'),
(420, 249, 5, '1'),
(421, 249, 6, '193'),
(422, 250, 5, '1'),
(423, 250, 6, '194'),
(424, 251, 5, '1'),
(425, 251, 6, '195'),
(426, 252, 5, '1'),
(427, 252, 6, '196'),
(428, 253, 5, '1'),
(429, 253, 6, '197'),
(430, 254, 5, '1'),
(431, 254, 6, '198'),
(432, 255, 5, '1'),
(433, 255, 6, '199'),
(434, 256, 5, '1'),
(435, 256, 6, '200'),
(436, 257, 5, '1'),
(437, 257, 6, '201'),
(438, 258, 5, '1'),
(439, 258, 6, '202'),
(440, 259, 5, '1'),
(441, 259, 6, '203'),
(442, 260, 5, '1'),
(443, 260, 6, '204'),
(444, 261, 5, '1'),
(445, 261, 6, '205'),
(446, 262, 5, '1'),
(447, 262, 6, '206'),
(448, 263, 5, '1'),
(449, 263, 6, '207'),
(450, 264, 5, '1'),
(451, 264, 6, '208'),
(452, 265, 5, '1'),
(453, 265, 6, '209'),
(454, 266, 5, '1'),
(455, 266, 6, '210'),
(456, 267, 5, '1'),
(457, 267, 6, '211'),
(458, 268, 5, '1'),
(459, 268, 6, '212'),
(460, 269, 5, '1'),
(461, 269, 6, '213'),
(462, 270, 5, '1'),
(463, 270, 6, '214'),
(464, 271, 5, '1'),
(465, 271, 6, '215'),
(466, 272, 5, '1'),
(467, 272, 6, '216'),
(468, 273, 5, '1'),
(469, 273, 6, '217'),
(470, 274, 5, '1'),
(471, 274, 6, '218'),
(472, 275, 5, '1'),
(473, 275, 6, '219'),
(474, 276, 5, '1'),
(475, 276, 6, '220'),
(476, 277, 5, '1'),
(477, 277, 6, '221'),
(478, 278, 5, '1'),
(479, 278, 6, '222'),
(480, 279, 5, '1'),
(481, 279, 6, '223'),
(482, 280, 5, '1'),
(483, 280, 6, '224'),
(484, 281, 5, '1'),
(485, 281, 6, '225'),
(486, 282, 5, '1'),
(487, 282, 6, '226'),
(488, 283, 5, '1'),
(489, 283, 6, '227'),
(490, 284, 5, '1'),
(491, 284, 6, '228'),
(492, 285, 5, '1'),
(493, 285, 6, '229'),
(494, 286, 5, '1'),
(495, 286, 6, '230'),
(496, 287, 5, '1'),
(497, 287, 6, '231'),
(498, 288, 5, '1'),
(499, 288, 6, '232'),
(500, 289, 5, '1'),
(501, 289, 6, '233'),
(502, 290, 5, '1'),
(503, 290, 6, '234'),
(504, 291, 5, '1'),
(505, 291, 6, '235'),
(506, 292, 5, '1'),
(507, 292, 6, '236'),
(508, 293, 5, '1'),
(509, 293, 6, '237'),
(510, 294, 5, '1'),
(511, 294, 6, '238'),
(512, 295, 5, '1'),
(513, 295, 6, '239'),
(514, 296, 5, '1'),
(515, 296, 6, '240'),
(516, 297, 5, '1'),
(517, 297, 6, '241'),
(518, 298, 5, '1'),
(519, 298, 6, '242'),
(520, 299, 5, '1'),
(521, 299, 6, '243'),
(522, 300, 5, '1'),
(523, 300, 6, '244'),
(524, 301, 5, '1'),
(525, 301, 6, '245'),
(526, 302, 5, '1'),
(527, 302, 6, '246'),
(528, 303, 5, '1'),
(529, 303, 6, '247'),
(530, 304, 5, '1'),
(531, 304, 6, '248'),
(532, 305, 5, '1'),
(533, 305, 6, '249'),
(534, 306, 5, '1'),
(535, 306, 6, '250'),
(536, 307, 5, '1'),
(537, 307, 6, '251'),
(538, 308, 5, '1'),
(539, 308, 6, '252'),
(540, 309, 5, '1'),
(541, 309, 6, '253'),
(542, 310, 5, '1'),
(543, 310, 6, '254'),
(544, 311, 5, '1'),
(545, 311, 6, '255'),
(546, 312, 5, '1'),
(547, 312, 6, '256'),
(548, 313, 5, '1'),
(549, 313, 6, '257'),
(550, 314, 5, '1'),
(551, 314, 6, '258'),
(552, 315, 5, '1'),
(553, 315, 6, '259'),
(554, 316, 5, '1'),
(555, 316, 6, '260'),
(556, 317, 5, '1'),
(557, 317, 6, '261'),
(558, 318, 5, '1'),
(559, 318, 6, '262'),
(560, 319, 5, '1'),
(561, 319, 6, '263'),
(562, 320, 5, '1'),
(563, 320, 6, '264'),
(564, 321, 5, '1'),
(565, 321, 6, '265'),
(566, 322, 5, '1'),
(567, 322, 6, '266'),
(568, 323, 5, '1'),
(569, 323, 6, '267'),
(570, 324, 5, '1'),
(571, 324, 6, '268'),
(572, 325, 5, '1'),
(573, 325, 6, '269'),
(574, 326, 5, '1'),
(575, 326, 6, '270'),
(576, 327, 5, '1'),
(577, 327, 6, '271'),
(578, 328, 5, '1'),
(579, 328, 6, '272'),
(580, 329, 5, '1'),
(581, 329, 6, '273'),
(582, 330, 5, '1'),
(583, 330, 6, '274'),
(584, 331, 5, '1'),
(585, 331, 6, '275'),
(586, 332, 5, '1'),
(587, 332, 6, '276'),
(588, 333, 5, '1'),
(589, 333, 6, '277'),
(590, 334, 5, '1'),
(591, 334, 6, '278'),
(592, 335, 5, '1'),
(593, 335, 6, '279'),
(594, 336, 5, '1'),
(595, 336, 6, '280'),
(596, 337, 5, '2'),
(597, 337, 6, '281'),
(598, 338, 5, '2'),
(599, 338, 6, '282'),
(600, 339, 5, '2'),
(601, 339, 6, '283'),
(602, 340, 5, '2'),
(603, 340, 6, '284'),
(604, 341, 5, '2'),
(605, 341, 6, '285'),
(606, 342, 5, '2'),
(607, 342, 6, '286'),
(608, 343, 5, '2'),
(609, 343, 6, '287'),
(610, 344, 5, '2'),
(611, 344, 6, '288'),
(612, 345, 5, '2'),
(613, 345, 6, '289'),
(614, 346, 5, '2'),
(615, 346, 6, '290'),
(616, 347, 5, '2'),
(617, 347, 6, '291'),
(618, 348, 5, '2'),
(619, 348, 6, '292'),
(620, 349, 5, '2'),
(621, 349, 6, '293'),
(622, 350, 5, '2'),
(623, 350, 6, '294'),
(624, 351, 5, '2'),
(625, 351, 6, '295'),
(626, 352, 5, '2'),
(627, 352, 6, '296'),
(628, 353, 5, '2'),
(629, 353, 6, '297'),
(630, 354, 5, '2'),
(631, 354, 6, '298'),
(632, 355, 5, '2'),
(633, 355, 6, '299'),
(634, 356, 5, '2'),
(635, 356, 6, '300'),
(636, 357, 5, '2'),
(637, 357, 6, '301'),
(638, 358, 5, '2'),
(639, 358, 6, '302'),
(640, 359, 5, '2'),
(641, 359, 6, '303'),
(642, 360, 5, '2'),
(643, 360, 6, '304'),
(644, 361, 5, '2'),
(645, 361, 6, '305'),
(646, 362, 5, '2'),
(647, 362, 6, '306'),
(648, 363, 5, '2'),
(649, 363, 6, '307'),
(650, 364, 5, '2'),
(651, 364, 6, '308'),
(652, 365, 5, '2'),
(653, 365, 6, '309'),
(654, 366, 5, '2'),
(655, 366, 6, '310'),
(656, 367, 5, '2'),
(657, 367, 6, '311'),
(658, 368, 5, '2'),
(659, 368, 6, '312'),
(660, 369, 5, '2'),
(661, 369, 6, '313'),
(662, 370, 5, '2'),
(663, 370, 6, '314'),
(664, 371, 5, '2'),
(665, 371, 6, '315'),
(666, 372, 5, '2'),
(667, 372, 6, '316'),
(668, 373, 5, '2'),
(669, 373, 6, '317'),
(670, 374, 5, '2'),
(671, 374, 6, '318'),
(672, 375, 5, '2'),
(673, 375, 6, '319'),
(674, 376, 5, '2'),
(675, 376, 6, '320'),
(676, 377, 5, '2'),
(677, 377, 6, '321'),
(678, 378, 5, '2'),
(679, 378, 6, '322'),
(680, 379, 5, '2'),
(681, 379, 6, '323'),
(682, 380, 5, '2'),
(683, 380, 6, '324'),
(684, 381, 5, '2'),
(685, 381, 6, '325'),
(686, 382, 5, '2'),
(687, 382, 6, '326'),
(688, 383, 5, '2'),
(689, 383, 6, '327'),
(690, 384, 5, '2'),
(691, 384, 6, '328'),
(692, 385, 5, '2'),
(693, 385, 6, '329'),
(694, 386, 5, '2'),
(695, 386, 6, '330'),
(696, 387, 5, '2'),
(697, 387, 6, '331'),
(698, 388, 5, '2'),
(699, 388, 6, '332'),
(700, 389, 5, '2'),
(701, 389, 6, '333'),
(702, 390, 5, '2'),
(703, 390, 6, '334'),
(704, 391, 5, '2'),
(705, 391, 6, '335'),
(706, 392, 5, '2'),
(707, 392, 6, '336'),
(708, 393, 5, '2'),
(709, 393, 6, '337'),
(710, 394, 5, '2'),
(711, 394, 6, '338'),
(712, 395, 5, '2'),
(713, 395, 6, '339'),
(714, 396, 5, '2'),
(715, 396, 6, '340'),
(716, 397, 5, '2'),
(717, 397, 6, '341'),
(718, 398, 5, '2'),
(719, 398, 6, '342'),
(720, 399, 5, '2'),
(721, 399, 6, '343'),
(722, 400, 5, '2'),
(723, 400, 6, '344'),
(724, 401, 5, '2'),
(725, 401, 6, '345'),
(726, 402, 5, '2'),
(727, 402, 6, '346'),
(728, 403, 5, '2'),
(729, 403, 6, '347'),
(730, 404, 5, '2'),
(731, 404, 6, '348'),
(732, 405, 5, '2'),
(733, 405, 6, '349'),
(734, 406, 5, '2'),
(735, 406, 6, '350'),
(736, 407, 5, '2'),
(737, 407, 6, '351'),
(738, 408, 5, '2'),
(739, 408, 6, '352'),
(740, 409, 5, '2'),
(741, 409, 6, '353'),
(742, 410, 5, '2'),
(743, 410, 6, '354'),
(744, 411, 5, '2'),
(745, 411, 6, '355'),
(746, 412, 5, '2'),
(747, 412, 6, '356'),
(748, 413, 5, '2'),
(749, 413, 6, '357'),
(750, 414, 5, '2'),
(751, 414, 6, '358'),
(752, 415, 5, '2'),
(753, 415, 6, '359'),
(754, 416, 5, '2'),
(755, 416, 6, '360'),
(756, 417, 5, '2'),
(757, 417, 6, '361'),
(758, 418, 5, '2'),
(759, 418, 6, '362'),
(760, 419, 5, '2'),
(761, 419, 6, '363'),
(762, 420, 5, '2'),
(763, 420, 6, '364'),
(764, 421, 5, '2'),
(765, 421, 6, '365'),
(766, 422, 5, '2'),
(767, 422, 6, '366'),
(768, 423, 5, '2'),
(769, 423, 6, '367'),
(770, 424, 5, '2'),
(771, 424, 6, '368'),
(772, 425, 5, '2'),
(773, 425, 6, '369'),
(774, 426, 5, '2'),
(775, 426, 6, '370'),
(776, 427, 5, '2'),
(777, 427, 6, '371'),
(778, 428, 5, '2'),
(779, 428, 6, '372'),
(780, 429, 5, '2'),
(781, 429, 6, '373'),
(782, 430, 5, '2'),
(783, 430, 6, '374'),
(784, 431, 5, '2'),
(785, 431, 6, '375'),
(786, 432, 5, '2'),
(787, 432, 6, '376'),
(788, 433, 5, '2'),
(789, 433, 6, '377'),
(790, 434, 5, '2'),
(791, 434, 6, '378'),
(792, 435, 5, '2'),
(793, 435, 6, '379'),
(794, 436, 5, '2'),
(795, 436, 6, '380'),
(796, 437, 5, '2'),
(797, 437, 6, '381'),
(798, 438, 5, '2'),
(799, 438, 6, '382'),
(800, 439, 5, '2'),
(801, 439, 6, '383'),
(802, 440, 5, '2'),
(803, 440, 6, '384'),
(804, 441, 5, '2'),
(805, 441, 6, '385'),
(806, 442, 5, '2'),
(807, 442, 6, '386'),
(808, 443, 5, '2'),
(809, 443, 6, '387'),
(810, 444, 5, '2'),
(811, 444, 6, '388'),
(812, 445, 5, '2'),
(813, 445, 6, '389'),
(814, 446, 5, '2'),
(815, 446, 6, '390'),
(816, 447, 5, '2'),
(817, 447, 6, '391'),
(818, 448, 5, '2'),
(819, 448, 6, '392'),
(820, 449, 5, '2'),
(821, 449, 6, '393'),
(822, 450, 5, '2'),
(823, 450, 6, '394'),
(824, 451, 5, '2'),
(825, 451, 6, '395'),
(826, 452, 5, '2'),
(827, 452, 6, '396'),
(828, 453, 5, '2'),
(829, 453, 6, '397'),
(830, 454, 5, '2'),
(831, 454, 6, '398'),
(832, 455, 5, '2'),
(833, 455, 6, '399'),
(834, 456, 5, '2'),
(835, 456, 6, '400'),
(836, 457, 5, '2'),
(837, 457, 6, '401'),
(838, 458, 5, '2'),
(839, 458, 6, '402'),
(840, 459, 5, '2'),
(841, 459, 6, '403'),
(842, 460, 5, '2'),
(843, 460, 6, '404'),
(844, 461, 5, '2'),
(845, 461, 6, '405'),
(846, 462, 5, '2'),
(847, 462, 6, '406'),
(848, 463, 5, '2'),
(849, 463, 6, '407'),
(850, 464, 5, '2'),
(851, 464, 6, '408'),
(852, 465, 5, '2'),
(853, 465, 6, '409'),
(854, 466, 5, '2'),
(855, 466, 6, '410'),
(856, 467, 5, '2'),
(857, 467, 6, '411'),
(858, 468, 5, '2'),
(859, 468, 6, '412'),
(860, 469, 5, '2'),
(861, 469, 6, '413'),
(862, 470, 5, '2'),
(863, 470, 6, '414'),
(864, 471, 5, '2'),
(865, 471, 6, '415'),
(866, 472, 5, '2'),
(867, 472, 6, '416'),
(868, 473, 5, '2'),
(869, 473, 6, '417'),
(870, 474, 5, '2'),
(871, 474, 6, '418'),
(872, 475, 5, '2'),
(873, 475, 6, '419'),
(874, 476, 5, '2'),
(875, 476, 6, '420'),
(876, 477, 5, '2'),
(877, 477, 6, '421'),
(878, 478, 5, '2'),
(879, 478, 6, '422'),
(880, 479, 5, '2'),
(881, 479, 6, '423'),
(882, 480, 5, '2'),
(883, 480, 6, '424'),
(884, 481, 5, '2'),
(885, 481, 6, '425'),
(886, 482, 5, '2'),
(887, 482, 6, '426'),
(888, 483, 5, '2'),
(889, 483, 6, '427'),
(890, 484, 5, '2'),
(891, 484, 6, '428'),
(892, 485, 5, '2'),
(893, 485, 6, '429'),
(894, 486, 5, '2'),
(895, 486, 6, '430'),
(896, 487, 5, '2'),
(897, 487, 6, '431'),
(898, 488, 5, '2'),
(899, 488, 6, '432'),
(900, 489, 5, '2'),
(901, 489, 6, '433'),
(902, 490, 5, '2'),
(903, 490, 6, '434'),
(904, 491, 5, '2'),
(905, 491, 6, '435'),
(906, 492, 5, '2'),
(907, 492, 6, '436'),
(908, 493, 5, '2'),
(909, 493, 6, '437'),
(910, 494, 5, '2'),
(911, 494, 6, '438'),
(912, 495, 5, '2'),
(913, 495, 6, '439'),
(914, 496, 5, '2'),
(915, 496, 6, '440'),
(916, 497, 5, '2'),
(917, 497, 6, '441'),
(918, 498, 5, '2'),
(919, 498, 6, '442'),
(920, 499, 5, '2'),
(921, 499, 6, '443'),
(922, 500, 5, '2'),
(923, 500, 6, '444'),
(924, 501, 5, '2'),
(925, 501, 6, '445'),
(926, 502, 5, '2'),
(927, 502, 6, '446'),
(928, 503, 5, '2'),
(929, 503, 6, '447'),
(930, 504, 5, '2'),
(931, 504, 6, '448'),
(932, 505, 5, '2'),
(933, 505, 6, '449'),
(934, 506, 5, '2'),
(935, 506, 6, '450'),
(936, 507, 5, '2'),
(937, 507, 6, '451'),
(938, 508, 5, '2'),
(939, 508, 6, '452'),
(940, 509, 5, '2'),
(941, 509, 6, '453'),
(942, 510, 5, '2'),
(943, 510, 6, '454'),
(944, 511, 5, '2'),
(945, 511, 6, '455'),
(946, 512, 5, '2'),
(947, 512, 6, '456'),
(948, 513, 5, '2'),
(949, 513, 6, '457'),
(950, 514, 5, '2'),
(951, 514, 6, '458'),
(952, 515, 5, '2'),
(953, 515, 6, '459'),
(954, 516, 5, '2'),
(955, 516, 6, '460'),
(956, 517, 5, '2'),
(957, 517, 6, '461'),
(958, 518, 5, '2'),
(959, 518, 6, '462'),
(960, 519, 5, '2'),
(961, 519, 6, '463'),
(962, 520, 5, '2'),
(963, 520, 6, '464'),
(964, 521, 5, '2'),
(965, 521, 6, '465'),
(966, 522, 5, '2'),
(967, 522, 6, '466'),
(968, 523, 5, '2'),
(969, 523, 6, '467'),
(970, 524, 5, '2'),
(971, 524, 6, '468'),
(972, 525, 5, '2'),
(973, 525, 6, '469'),
(974, 526, 5, '2'),
(975, 526, 6, '470'),
(976, 527, 5, '2'),
(977, 527, 6, '471'),
(978, 528, 5, '2'),
(979, 528, 6, '472'),
(980, 529, 5, '2'),
(981, 529, 6, '473'),
(982, 530, 5, '2'),
(983, 530, 6, '474'),
(984, 531, 5, '2'),
(985, 531, 6, '475'),
(986, 532, 5, '2'),
(987, 532, 6, '476'),
(988, 533, 5, '2'),
(989, 533, 6, '477'),
(990, 534, 5, '2'),
(991, 534, 6, '478'),
(992, 535, 5, '2'),
(993, 535, 6, '479'),
(994, 536, 5, '2'),
(995, 536, 6, '480'),
(996, 537, 5, '2'),
(997, 537, 6, '481'),
(998, 538, 5, '2'),
(999, 538, 6, '482'),
(1000, 539, 5, '2'),
(1001, 539, 6, '483'),
(1002, 540, 5, '2'),
(1003, 540, 6, '484'),
(1004, 541, 5, '2'),
(1005, 541, 6, '485'),
(1006, 542, 5, '2'),
(1007, 542, 6, '486'),
(1008, 543, 5, '2'),
(1009, 543, 6, '487'),
(1010, 544, 5, '2'),
(1011, 544, 6, '488'),
(1012, 545, 5, '2'),
(1013, 545, 6, '489'),
(1014, 546, 5, '2'),
(1015, 546, 6, '490'),
(1016, 547, 5, '2'),
(1017, 547, 6, '491'),
(1018, 548, 5, '2'),
(1019, 548, 6, '492'),
(1020, 549, 5, '2'),
(1021, 549, 6, '493'),
(1022, 550, 5, '2'),
(1023, 550, 6, '494'),
(1024, 551, 5, '2'),
(1025, 551, 6, '495'),
(1026, 552, 5, '2'),
(1027, 552, 6, '496'),
(1028, 553, 5, '2'),
(1029, 553, 6, '497'),
(1030, 554, 5, '2'),
(1031, 554, 6, '498'),
(1032, 555, 5, '2'),
(1033, 555, 6, '499'),
(1034, 556, 5, '2'),
(1035, 556, 6, '500'),
(1036, 557, 5, '2'),
(1037, 557, 6, '501'),
(1038, 558, 5, '2'),
(1039, 558, 6, '502'),
(1040, 559, 5, '2'),
(1041, 559, 6, '503'),
(1042, 560, 5, '2'),
(1043, 560, 6, '504'),
(1044, 561, 5, '2'),
(1045, 561, 6, '505'),
(1046, 562, 5, '2'),
(1047, 562, 6, '506'),
(1048, 563, 5, '2'),
(1049, 563, 6, '507'),
(1050, 564, 5, '2'),
(1051, 564, 6, '508'),
(1052, 565, 5, '2'),
(1053, 565, 6, '509'),
(1054, 566, 5, '2'),
(1055, 566, 6, '510'),
(1056, 567, 5, '2'),
(1057, 567, 6, '511'),
(1058, 568, 5, '2'),
(1059, 568, 6, '512'),
(1060, 569, 5, '2'),
(1061, 569, 6, '513'),
(1062, 570, 5, '2'),
(1063, 570, 6, '514'),
(1064, 571, 5, '2'),
(1065, 571, 6, '515'),
(1066, 572, 5, '2'),
(1067, 572, 6, '516'),
(1068, 573, 5, '2'),
(1069, 573, 6, '517'),
(1070, 574, 5, '2'),
(1071, 574, 6, '518'),
(1072, 575, 5, '2'),
(1073, 575, 6, '519'),
(1074, 576, 5, '2'),
(1075, 576, 6, '520'),
(1076, 577, 5, '2'),
(1077, 577, 6, '521'),
(1078, 578, 5, '2'),
(1079, 578, 6, '522'),
(1080, 579, 5, '2'),
(1081, 579, 6, '523'),
(1082, 580, 5, '2'),
(1083, 580, 6, '524'),
(1084, 581, 5, '2'),
(1085, 581, 6, '525'),
(1086, 582, 5, '2'),
(1087, 582, 6, '526'),
(1088, 583, 5, '2'),
(1089, 583, 6, '527'),
(1090, 584, 5, '2'),
(1091, 584, 6, '528'),
(1092, 585, 5, '2'),
(1093, 585, 6, '529'),
(1094, 586, 5, '2'),
(1095, 586, 6, '530'),
(1096, 587, 5, '2'),
(1097, 587, 6, '531'),
(1098, 588, 5, '2'),
(1099, 588, 6, '532'),
(1100, 589, 5, '2'),
(1101, 589, 6, '533'),
(1102, 590, 5, '2'),
(1103, 590, 6, '534'),
(1104, 591, 5, '2'),
(1105, 591, 6, '535'),
(1106, 592, 5, '2'),
(1107, 592, 6, '536'),
(1108, 593, 5, '2'),
(1109, 593, 6, '537'),
(1110, 594, 5, '2'),
(1111, 594, 6, '538'),
(1112, 595, 5, '2'),
(1113, 595, 6, '539'),
(1114, 596, 5, '2'),
(1115, 596, 6, '540'),
(1116, 597, 5, '2'),
(1117, 597, 6, '541'),
(1118, 598, 5, '2'),
(1119, 598, 6, '542'),
(1120, 599, 5, '2'),
(1121, 599, 6, '543'),
(1122, 600, 5, '2'),
(1123, 600, 6, '544'),
(1124, 601, 5, '2'),
(1125, 601, 6, '545'),
(1126, 602, 5, '2'),
(1127, 602, 6, '546'),
(1128, 603, 5, '2'),
(1129, 603, 6, '547'),
(1130, 604, 5, '2'),
(1131, 604, 6, '548'),
(1132, 605, 5, '2'),
(1133, 605, 6, '549'),
(1134, 606, 5, '2'),
(1135, 606, 6, '550'),
(1136, 607, 5, '2'),
(1137, 607, 6, '551'),
(1138, 608, 5, '2'),
(1139, 608, 6, '552'),
(1140, 609, 5, '2'),
(1141, 609, 6, '553'),
(1142, 610, 5, '2'),
(1143, 610, 6, '554'),
(1144, 611, 5, '2'),
(1145, 611, 6, '555'),
(1146, 612, 5, '2'),
(1147, 612, 6, '556'),
(1148, 613, 5, '2'),
(1149, 613, 6, '557'),
(1150, 614, 5, '2'),
(1151, 614, 6, '558'),
(1152, 615, 5, '2'),
(1153, 615, 6, '559'),
(1154, 616, 5, '2'),
(1155, 616, 6, '560'),
(1156, 617, 5, '2'),
(1157, 617, 6, '561'),
(1158, 618, 5, '2'),
(1159, 618, 6, '562'),
(1160, 619, 5, '2'),
(1161, 619, 6, '563'),
(1162, 620, 5, '2'),
(1163, 620, 6, '564'),
(1164, 621, 5, '2'),
(1165, 621, 6, '565'),
(1166, 622, 5, '2'),
(1167, 622, 6, '566'),
(1168, 623, 5, '2'),
(1169, 623, 6, '567'),
(1170, 624, 5, '2'),
(1171, 624, 6, '568'),
(1172, 625, 5, '2'),
(1173, 625, 6, '569'),
(1174, 626, 5, '2'),
(1175, 626, 6, '570'),
(1176, 627, 5, '2'),
(1177, 627, 6, '571'),
(1178, 628, 5, '2'),
(1179, 628, 6, '572'),
(1180, 629, 5, '2'),
(1181, 629, 6, '573'),
(1182, 630, 5, '2'),
(1183, 630, 6, '574'),
(1184, 631, 5, '2'),
(1185, 631, 6, '575'),
(1186, 632, 5, '2'),
(1187, 632, 6, '576'),
(1188, 633, 5, '2'),
(1189, 633, 6, '577'),
(1190, 634, 5, '2'),
(1191, 634, 6, '578'),
(1192, 635, 5, '2'),
(1193, 635, 6, '579'),
(1194, 636, 5, '2'),
(1195, 636, 6, '580'),
(1196, 637, 5, '2'),
(1197, 637, 6, '581'),
(1198, 638, 5, '2'),
(1199, 638, 6, '582'),
(1200, 639, 5, '2'),
(1201, 639, 6, '583'),
(1202, 640, 5, '2'),
(1203, 640, 6, '584'),
(1204, 641, 5, '2'),
(1205, 641, 6, '585'),
(1206, 642, 5, '2'),
(1207, 642, 6, '586'),
(1208, 643, 5, '2'),
(1209, 643, 6, '587'),
(1210, 644, 5, '2'),
(1211, 644, 6, '588'),
(1212, 645, 5, '2'),
(1213, 645, 6, '589'),
(1214, 646, 5, '2'),
(1215, 646, 6, '590'),
(1216, 647, 5, '2'),
(1217, 647, 6, '591'),
(1218, 648, 5, '2'),
(1219, 648, 6, '592'),
(1220, 649, 5, '2'),
(1221, 649, 6, '593'),
(1222, 650, 5, '2'),
(1223, 650, 6, '594'),
(1224, 651, 5, '2'),
(1225, 651, 6, '595'),
(1226, 652, 5, '2'),
(1227, 652, 6, '596'),
(1228, 653, 5, '2'),
(1229, 653, 6, '597'),
(1230, 654, 5, '2'),
(1231, 654, 6, '598'),
(1232, 655, 5, '2'),
(1233, 655, 6, '599'),
(1234, 656, 5, '2'),
(1235, 656, 6, '600'),
(1236, 657, 5, '2'),
(1237, 657, 6, '601'),
(1238, 658, 5, '2'),
(1239, 658, 6, '602'),
(1240, 659, 5, '2'),
(1241, 659, 6, '603'),
(1242, 660, 5, '2'),
(1243, 660, 6, '604'),
(1244, 661, 5, '2'),
(1245, 661, 6, '605'),
(1246, 662, 5, '2'),
(1247, 662, 6, '606'),
(1248, 663, 5, '2'),
(1249, 663, 6, '607'),
(1250, 664, 5, '2'),
(1251, 664, 6, '608'),
(1252, 665, 5, '2'),
(1253, 665, 6, '609'),
(1254, 666, 5, '2'),
(1255, 666, 6, '610'),
(1256, 667, 5, '2'),
(1257, 667, 6, '611'),
(1258, 668, 5, '2'),
(1259, 668, 6, '612'),
(1260, 669, 5, '2'),
(1261, 669, 6, '613'),
(1262, 670, 5, '2'),
(1263, 670, 6, '614'),
(1264, 671, 5, '2'),
(1265, 671, 6, '615'),
(1266, 672, 5, '2'),
(1267, 672, 6, '616'),
(1268, 673, 5, '2'),
(1269, 673, 6, '617'),
(1270, 674, 5, '2'),
(1271, 674, 6, '618'),
(1272, 675, 5, '2'),
(1273, 675, 6, '619'),
(1274, 676, 5, '2'),
(1275, 676, 6, '620'),
(1276, 677, 5, '2'),
(1277, 677, 6, '621'),
(1278, 678, 5, '2'),
(1279, 678, 6, '622'),
(1280, 679, 5, '2'),
(1281, 679, 6, '623'),
(1282, 680, 5, '2'),
(1283, 680, 6, '624'),
(1284, 681, 5, '2'),
(1285, 681, 6, '625'),
(1286, 682, 5, '2'),
(1287, 682, 6, '626'),
(1288, 683, 5, '2'),
(1289, 683, 6, '627'),
(1290, 684, 5, '2'),
(1291, 684, 6, '628'),
(1292, 685, 5, '2'),
(1293, 685, 6, '629'),
(1294, 686, 5, '2'),
(1295, 686, 6, '630'),
(1296, 687, 5, '2'),
(1297, 687, 6, '631'),
(1298, 688, 5, '2'),
(1299, 688, 6, '632'),
(1300, 689, 5, '2'),
(1301, 689, 6, '633'),
(1302, 690, 5, '2'),
(1303, 690, 6, '634'),
(1304, 691, 5, '2'),
(1305, 691, 6, '635'),
(1306, 692, 5, '2'),
(1307, 692, 6, '636'),
(1308, 693, 5, '2'),
(1309, 693, 6, '637'),
(1310, 694, 5, '2'),
(1311, 694, 6, '638'),
(1312, 695, 5, '2'),
(1313, 695, 6, '639'),
(1314, 696, 5, '2'),
(1315, 696, 6, '640'),
(1316, 697, 5, '2'),
(1317, 697, 6, '641'),
(1318, 698, 5, '2'),
(1319, 698, 6, '642'),
(1320, 699, 5, '2'),
(1321, 699, 6, '643'),
(1322, 700, 5, '2'),
(1323, 700, 6, '644'),
(1324, 701, 5, '2'),
(1325, 701, 6, '645'),
(1326, 702, 5, '2'),
(1327, 702, 6, '646'),
(1328, 703, 5, '2'),
(1329, 703, 6, '647'),
(1330, 704, 5, '2'),
(1331, 704, 6, '648'),
(1332, 705, 5, '2'),
(1333, 705, 6, '649'),
(1334, 706, 5, '2'),
(1335, 706, 6, '650'),
(1336, 707, 5, '2'),
(1337, 707, 6, '651'),
(1338, 708, 5, '2'),
(1339, 708, 6, '652'),
(1340, 709, 5, '2'),
(1341, 709, 6, '653'),
(1342, 710, 5, '2'),
(1343, 710, 6, '654'),
(1344, 711, 5, '2'),
(1345, 711, 6, '655'),
(1346, 712, 5, '2'),
(1347, 712, 6, '656'),
(1348, 713, 5, '2'),
(1349, 713, 6, '657'),
(1350, 714, 5, '2'),
(1351, 714, 6, '658'),
(1352, 715, 5, '2'),
(1353, 715, 6, '659'),
(1354, 716, 5, '2'),
(1355, 716, 6, '660'),
(1356, 717, 5, '2'),
(1357, 717, 6, '661'),
(1358, 718, 5, '2'),
(1359, 718, 6, '662'),
(1360, 719, 5, '2'),
(1361, 719, 6, '663'),
(1362, 720, 5, '2'),
(1363, 720, 6, '664'),
(1364, 721, 5, '2'),
(1365, 721, 6, '665'),
(1366, 722, 5, '2'),
(1367, 722, 6, '666'),
(1368, 723, 5, '2'),
(1369, 723, 6, '667'),
(1370, 724, 5, '2'),
(1371, 724, 6, '668'),
(1372, 725, 5, '2'),
(1373, 725, 6, '669'),
(1374, 726, 5, '2'),
(1375, 726, 6, '670'),
(1376, 727, 5, '2'),
(1377, 727, 6, '671'),
(1378, 728, 5, '2'),
(1379, 728, 6, '672'),
(1380, 732, 1, 'Epilog'),
(1381, 733, 1, 'Ultimaker 3 Extended'),
(1382, 734, 1, 'Carvey'),
(1383, 735, 1, 'Jet'),
(1384, 736, 1, 'Jet'),
(1385, 737, 1, 'Turncrafter'),
(1386, 738, 1, 'Turncrafter'),
(1387, 739, 1, 'Formlabs Form 3 #1 - Brave Duck'),
(1388, 740, 1, 'Markforged Mark 2'),
(1389, 741, 1, 'Powermatic'),
(1390, 742, 1, 'Ultimaker 2+ Extended'),
(1391, 743, 1, 'Baby Lock 6 needle'),
(1392, 744, 1, 'Bosch'),
(1393, 745, 1, 'DS 700XL Festool'),
(1394, 746, 1, 'Lincoln Virtual Reality MIG TIG Stick'),
(1395, 747, 1, 'Lincoln Virtual Reality MIG TIG Stick'),
(1396, 748, 1, 'Turncrafter'),
(1397, 749, 1, 'Turncrafter'),
(1398, 750, 1, 'Artec Eva'),
(1399, 751, 1, 'Nova'),
(1400, 752, 1, 'Hoffmann PU2'),
(1401, 753, 1, 'Allsource'),
(1402, 754, 1, 'Dayton'),
(1403, 755, 1, 'Ellis'),
(1404, 756, 1, 'Baileigh'),
(1405, 757, 1, 'Lonestar Trooper 48\" x 48\"'),
(1406, 758, 1, 'Scotchman'),
(1407, 759, 1, 'National'),
(1408, 760, 1, 'National'),
(1409, 761, 1, 'Baileigh'),
(1410, 762, 1, 'Huth'),
(1411, 763, 1, 'BabyLock'),
(1412, 764, 1, 'Baileigh'),
(1413, 765, 1, 'Ellis'),
(1415, 767, 1, 'Miller'),
(1416, 768, 1, 'Miller'),
(1417, 769, 1, 'Hypotherm'),
(1418, 770, 1, 'Bridgeport'),
(1419, 771, 1, 'Bridgeport'),
(1420, 772, 1, 'Clausing Colchester 13\"'),
(1422, 774, 1, 'Scotchman'),
(1423, 775, 1, 'Elna'),
(1424, 776, 1, ''),
(1425, 777, 1, ''),
(1426, 778, 1, ''),
(1427, 779, 1, ''),
(1430, 782, 1, 'Epilog'),
(1431, 783, 1, ''),
(1432, 784, 1, ''),
(1433, 785, 1, ''),
(1434, 786, 1, ''),
(1435, 787, 1, ''),
(1436, 788, 1, ''),
(1437, 789, 1, ''),
(1438, 790, 1, ''),
(1439, 791, 1, ''),
(1440, 792, 1, ''),
(1441, 793, 1, ''),
(1442, 794, 1, ''),
(1443, 795, 1, ''),
(1444, 796, 1, ''),
(1445, 797, 1, ''),
(1452, 804, 1, ''),
(1453, 805, 1, ''),
(1454, 806, 1, 'Babylock'),
(1455, 807, 1, 'Babylock'),
(1456, 808, 1, ''),
(1457, 809, 1, ''),
(1458, 810, 1, 'Jet'),
(1459, 811, 1, 'Formlabs Form 3 #2 - Velvet Kudu'),
(1460, 812, 1, 'Ultimaker 2+ Connect #2'),
(1461, 813, 1, 'Ultimaker 2+ Connect #1'),
(1462, 814, 1, 'Powermatic'),
(1463, 815, 1, 'Fablight'),
(1464, 816, 1, 'Baileigh'),
(1465, 817, 1, ''),
(1466, 818, 1, 'Epilog'),
(1467, 819, 1, 'Babylock'),
(1468, 820, 1, 'Babylock'),
(1469, 821, 1, 'Ultimaker 2+ Connect #5'),
(1470, 822, 1, 'Ultimaker 2+ Connect #6'),
(1471, 823, 1, ''),
(1472, 824, 1, 'Ultimaker 2+ Connect #7'),
(1473, 825, 1, 'Ultimaker 2+ Connect #8'),
(1474, 826, 1, 'Canon imagePROGRAF GP-4000'),
(1475, 827, 1, ''),
(1479, 831, 1, ''),
(1480, 832, 1, ''),
(1481, 833, 1, ''),
(1482, 834, 1, 'Coolest');

-- --------------------------------------------------------

--
-- Table structure for table `resource_hours`
--

CREATE TABLE `resource_hours` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  `one_off` tinyint(1) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resource_hours`
--

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schema_migrations`
--

-- --------------------------------------------------------

--
-- Table structure for table `service_spaces`
--

CREATE TABLE `service_spaces` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url_name` varchar(255) DEFAULT NULL,
  `imagedata` blob DEFAULT NULL,
  `imagemime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `service_spaces`
--

INSERT INTO `service_spaces` (`id`, `name`, `url_name`, `imagedata`, `imagemime`) VALUES
(1, 'Innovation Studio', NULL, NULL, NULL);
INSERT INTO `service_spaces` (`id`, `name`, `url_name`, `imagedata`, `imagemime`) VALUES
(3, 'University Communication', 'ucomm', 0xffd8ffe10ffe4578696600004d4d002a00000008000b010f00020000000600000092011000020000000a00000098011200030000000100010000011a000500000001000000a2011b000500000001000000aa0128000300000001000200000131000200000007000000b20132000200000014000000ba0213000300000001000100008769000400000001000000ce882500040000000100000670000000004170706c65006950686f6e65205345000000004800000001000000480000000131312e302e320000323031373a31303a32372030393a31343a3030000020829a00050000000100000254829d0005000000010000025c8822000300000001000200008827000300000001006400009000000700000004303232319003000200000014000002649004000200000014000002789101000700000004010203009201000a000000010000028c9202000500000001000002949203000a000000010000029c9204000a00000001000002a4920700030000000100050000920900030000000100180000920a000500000001000002ac9214000300000004000002b4927c00070000036a000002bc929100020000000438393400929200020000000438393400a00000070000000430313030a00100030000000100010000a00200040000000100000fc0a00300040000000100000bd0a21700030000000100020000a30100070000000101000000a40200030000000100000000a40300030000000100000000a405000300000001001d0000a40600030000000100000000a43200050000000400000626a43300020000000600000646a4340002000000230000064c00000000000000010000001e0000000b00000005323031373a31303a32372030393a31343a303000323031373a31303a32372030393a31343a30300000001d0f000005ec00001ed400000d8d00001448000009d90000000000000001000000530000001407df05e708a905324170706c6520694f530000014d4d000e000100090000000100000009000200070000022e000000bc0003000700000068000002ea0004000900000001000000010005000900000001000000800006000900000001000000860007000900000001000000010008000a0000000300000352000900090000000100001113000e00090000000100000000001400090000000100000004001700090000000100000000001900090000000100000000001f000900000001000000000000000062706c69737430304f11020072008700640052005d005500520050005100670047003c003c003b0037002a00d200750043003a004f009000800074009900ac0035002c002900280028002000d8011a0136001e004700700081006e005c0087003200310033003300300029002601950036001d003a0081005c0095007c0093003900520056005300520091009b010c01340018001a006d0061008200830078004b0002011a010901c30031010d016500320019001b006c00a4006a007a007b005500f002f5037303e9029301ab01c00034001a001e007a008b0072005d007e005e00810222037c0290025b02160298010002b10032006e007e007a005c009a0059000801310167006e0054008103ca010b02c200330093009a007800630082005000a000dd00540055004200d700620032001d001f002c003800470077007b0048008e00e6003a0030002f007601a800800074008e00ee00b50095007c004b0042007a009300360031002d0070019d004f005600b200450118010f0115011d01bb00d0004e0026001e002c003a01950045007f00c900c300ac00a300c700ed00630023002700210022002b0000017d003900720004014d0122012101de0087007d002f00290022001b001b00730042003e002e0020006200b000e6001301ab0024010e01230021001d001b0061004b0034002a0027002a0034001d0031005e00d200f300220020001c001d000008000000000000020100000000000000010000000000000000000000000000020c62706c6973743030d4010203040506070855666c6167735576616c75655974696d657363616c655565706f63681001130000606fd80d42a9123b9aca0010000811171d272d2f383d000000000000010100000000000000090000000000000000000000000000003fffffe84c000017f9000002a5000077cffffffc7200002141000000530000001400000053000000140000000b000000050000000b000000054170706c65006950686f6e65205345206261636b2063616d65726120342e31356d6d20662f322e320000000f00010002000000024e00000000020005000000030000072a00030002000000025700000000040005000000030000074200050001000000010000000000060005000000010000075a000700050000000300000762000c0002000000024b000000000d0005000000010000077a00100002000000025400000000110005000000010000078200170002000000025400000000180005000000010000078a001d00020000000b00000792001f0005000000010000079e0000000000000028000000010000003000000001000016180000006400000060000000010000002a0000000100000543000000640000d3dc000000970000000e000000010000000e0000000100000000000000010000000000000001000094eb00000074000094eb00000074323031373a31303a323700000000000a0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffdb008400010101010101020101020302020203040303030304050404040404050605050505050506060606060606060707070707070808080808090909090909090909090101010102020204020204090605060909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909ffdd00040014ffc000110800f0014003012200021101031101ffc401a20000010501010101010100000000000000000102030405060708090a0b100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9fa0100030101010101010101010000000000000102030405060708090a0b1100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00e153584bb01c4a24f4e73fcab36f34ad2f513e7dd440bff78707f315f853a57c4cf8b1e00987f67ea973085e764a588ffbe5b35ef5e13fdb4fc63a648a9e30b3fb7447ab239423f0e94395ceb8c2c7ea04ba5ada7cf6b700e3f85fafe639a725dcab1f96d093ee3eed7cd5e07fdaebe0ef88d96deee7fece99ce3170bb47fdf7d2be95d3fc49a17882d04da15ec52a11c323071fa567d74294bb8c1657b261a275887518f988af31bbb08a29e4374cac4b1cb6704f3e95e8175a6de48e58cac47aa1c7f2af1b96eec6db5078e752c41239e6bcacd9be547ad95db98b174ba28180c5cfa2826be09fda2356934df18456b6368efba05393c0ea6bef78f57b60710c43f2af827f6a7d43537f1ddafd9e3c2fd917ff004235e4e02a5ea24cf4b18928368f9e277d7f515313471c687d79fe75b7a4c17f669b67995bfdec67f3ae5e3b5f10dde0b315cfe15b761e1a9e5976ddcf93df2d5f44ec7849ddea7a2db4b1cf8469013f5cd581a45b44fe7220ddd735d4f873c35a1c16aad712671e95d1dec3a02c26381583638606b8e7515cea54d58f377876f38aa3716b14e32e3e65e8470456f5cc891310c8c57b1159924f1b2e6300d47387b33199a7b7c871e628ee3a8fa8ff000a6ba45a844108dc3d2ac4d2cb9c671f4ac99c6f6f30b156e8083cd1ce84a05cb5d22d6d49f25563c9e79abde5c2bf7df3f415cffdb678885986e1ea3afe22a55bb593e646cd0d969686abc166f289630c240301871f9fb5226a4d6ee22b9455ec1c720ff8554491f39a42dbfe570307ae6a5b28e963bb765da5b83e94ff003140e6b945592db2d6ee0af5d84e7f2f4abb16a968e36b16dc3aae306a1b08c4dd6917a8accbc83cc6f3e06db2af00fa8f43ed5136a50e3e58f3f53559f5571f71547e19a4997b110bb3293138db20eabfe1ea2a1983b2e4d665f5c497432ee432fdd238c562bea3206f26e7effaf635ac5912b2352e36e30580fc6b8cbed222b999a49ae4b0f619ad19ee140e4d733e7dda5c3c934ea53a2a8007e3d6ba60fa1cf3b1685947a7c25ec0b34ab9c16e87db15c05e78935c7bc36ad37943b61476edcd772d7f0ff7b3f4ae4359d3d6fdc496e0824f3fe35adfb91cc8e7ae2feff508cc72caf83f2e7773f9562d87c3db6ba90dc4d6a6e9b9259893fccd7a25ad8db5bfcde56e3c1cb9e323bf15a63509e35f2d24545f4154a561348e421b07b468fecd16633fbb2b8e40f415a5e144bdd2b539ed4a1312e594e3a568fdb00383213f415660b82ce372b329ebcf6aadd6a34d1d7493f9e3e5e41ae2b504916e8e17f3ade8af36bb4316e541f741ebb7b571fac5d1fb4f26886e13d89847f39248fce94855192c2b04dd1ce5734d378f9ad4c2e8b3a99815222c49c48bd2a769edc1e14fe26b98d56e5cc28411c48bdea43720ff0018aa8c585d6c7fffd0fcbf8ec34053f67f1a69467427e628369c7f2ae27c59f097e00ebf2997436bbd27e519127cdf377fba318fc2bf707c53f04fe1feb0a7cfb0556ea767cb9fa62be4ef891fb34785adb4bbcd5b4f2f10b789a4d8dce768ce32315c0b3186ccf72793d78abad51f8b7af7c09ba47793c3f749771ae71bbe5623b74ff0ae0a2d37e267c3f9cdde9325dd8b21cee898ede3e87f98afd18f0afc1dd5fe24f8a2c7c1de03865b8d5b526296d6e31b9d802700e40ed583f11be0d7c58f859ad5c7867c71a64f67796ff7e0b85f9802320e0f622ba397a9e5fb467ce3e12fdb1fe2b7874259f880c5a8c287e66236c98fa8e33f515f5a69de37b2d6ed22d55f23ed2a25da792370ce335f237887c33a35e646aba5847eef1fca6b734cf19e9169047a524be5985420dfc74e3ad7063e9f3451e8e02a25267d636de24b489f7c3d4766e457c7ff00b4978b659fc5f6ad1aa802d80c819fe235da43e220e9ba19430f50735f2e7c73d6d5fc436aee58fee7fa9af3b0d42d24cf4abd6bc6c611f125d3fdd931f4e29d05f9965123b1ddeb9e6bcb86b7175dbf99a9975269997cb90a7d2bd5944e047d71e1abe7fb201bb7fd7ad6a6a5addb5a6d47192dee3fc6be7fd18dec96bb5e5761ecd56ae742fb510cb200c01fbf5e7d486a76c5e87b525f7da41251971fdeacdb848a425b3b4fa8af2ab16d7b4e70b15e2ecfeeb1dc3f5aea86b2af6f8b961bcf5d99a5b21a8366a4ccf1fde3bc0fc0d54fb45b3f0339f43c5644134817c9b649663ea724d741a7f83bc6fafb08b48d1aeae58f411c4ec7f4150eac63bb3aa865b5ea3b53837e89b2834d08395519aa52b862197e423baf15b9e31f87df113e1c5b5bde78eb48bad2d2ef3e48ba89a32f8eebb80c8ae09753327dc5fceb5a55a325783b8b1980ad8797257838bf3563792f6e118f98770c1e475fca9cb73e6fdd39ac4b7bd792754638078e2bf647c2ff00f04f0fd9e343f87fe1af1f7c73f8a3fd872f892c135182c60b49259c42e4af257e5ea08ae2cc333a38549d57b9f45c27c138fce672a7828ddafd4fc92569319c5433a24b82c4061d083cd7ece41f063fe096fe101b6f756f15789e44ea22823b7463ec5ce6b76dbe21ff00c13bbc1e00f097c20bcd51d7a3ea97fc1c772b1835f315f8e7071d8fdaf2afa2c712e25abd36bfedd97ea923f116082f59bcb01a407a32293f9815db695f0d7c79af158f46d26f2e4bf4f2e1639fc857ecdafedb3e02f0d8d9f0e7e0f784f4adbf75e685ae5c7fdf640af41f83bfb7d7c7af18fc5ff0bf83ad5348d274fbfd52dade586c34f862cc724815977609e9ef5e4d5f11295ed047e8b82fa1966fc8ea626e9257fb2bf57f91fcfcf8a340d5bc23aa3e89e22b77b5bb8fefc5270ebecc3b1fad71b733c12215603f1afaeffe0a37ad5a1fdb3fc7819c2635194609c701cd7c1775e26d2601f34f1f1fed66bf41ca3152af423565bb3f933c40c868e579954c1516da8db7df631b5b82face733f98f2c47dfa7d6a4d3bfb42f63df041953dcd54b9f1c6868a55a4dd9f4526b05be215ada91159f98d1f618c63e9cd7b74e2cf85723d0e3d2f567e5f09f53529d1e4eb7172a3db35e5327c447707640c7fde6aa0fe3bd4dbfd5428bf524d6dc92667cc8f5b92cb4db6755b99c90c7191c81f5abc2db434fba19bf4af089bc59ae5c028cca01ec16aa1d6f5a906d6b97c7b7147b261ce8fa0bed3a5c5f761e9ea69b27886d6dc70b127d6be7796e2f65e6699dbeac7fc6a8c91971f31cfd6abd9317b43dcaefc57682f12779a3c60ab018e01ef5c46bbe35d263b8204f9e7f841ae1618c8048ae67538f33126aa348995576b1d9cde3bd381db1891ff000c565cbe3b8d89f2e07fc4815c4f93819a6320515a7299739d35df8cef2e142242aa01079627a5556f176af82aab1afe049fe758491ee6c01529b6909e14fe54ec0a6ee7ffd1fb56e6d2d8c442819af2ff001a680d7de1ebf8ca96592265c0f422bdc5ec5044304135bde10f0dd87893c4569e1ed5509b6bb956293070769eb8359d4cba0e48faca78c9383b9f157ec8ff000cb46d07f696f09dfdbdb32c96f7636b31e9956cd7a77fc144a254fda075685ed44be75b5a92cddb082bf607c0bfb317c20f067886dfc49a35837db6d5b7c52bc8cc54818ce338af55d7be0a7c2bf14eba7c4de25d12d6fefdc00669d03b617a0e7238af725838f2f2a3e3fdbda47f21fe28f85b6fe3aba36763a2a996731a2fd9a362f9271c01c64fd2be0cfda4be16f87bc156fe1bb2b5b1363a84b653fdbd5b72b99e3bc9e3cbab746d8aa31815fe85fe03f02783743d72c574ad32d6d824f1e0470a2ff10f415fc55ffc166e38a1fdb7bc5f6b0aed58b51bc000180333bb741f5af92cfb0ee9461cafa9eee57554e52bae87e399d36face42da7dc3211ef5f31fc6bf11f8a6c35cb613289d3ca393dfafb57d652fdec1e2be57f8d6b9d62d893ff002ccfe86b8e84ddf53aaa46eb43c721f88764488efa2785bf315d669de29d3ee8a9b6990fb679fc8d7996a70a496ce1c027deb89b1b7cea0880e39cf1ed5ea41dce4774cfbcbc33afb188043f9577926ac268d51ce73eb5f17e83a8dddab0f22565efc138af518fc4ba8fd9d10b02704e48ae2a90bb3b60dd8fa83c116da7eade32d2b4cbcc3c13dd451c8b9e0ab38047eb5fbd1f126c7f623fd9e7c777df0f349f846bae5e694c91c975a86a1214918a2b16088bc0e7a66bf9b0f851e21d525f897a0abc9f29d42dc1007fd345afdebfdb418afed2be28c1eb3447f3863afcd7c41c756c3c20e94ac7f677d11783f2eceb1d56863e1cc96be677b1fed89e15f0f9c7803e13784349c7dd77b56b961f8c8d51dcff00c1423f68e54f2bc3f73a668883a0d3f4eb6871f43b09af870b73d6938afc7aa6758997c533fd2ccbfc1fe1dc3ab430c9fab6ff0053f41751d7bc47fb7d7ecffe24f85bf11af0ea9e3cf0ca49ad68175285f3678547fa45af0067681bd47d6bf9cbd5fc6f1e8f7d3e997dfbbb8b6768a44da72aca70457eb5fc2df891af7c27f885a57c42f0cc9b2ef4bb85994767507e6461dd5d7208f435e13ff0562fd9dfc3fe16f881a4fed37f0960ff008a3be22c22f10463e5b7bb3feba16c742af918fa57e89c019fdaa7d5eabdcfe2cfa5ef8394e9d18e6797c2c9745f8afd7ef3f3bacfc7b672de03107249f40057f427fb583e3c0df0822feef832d4fe72c86bf99bd1a194ea11e10f51fcc57f4bff00b5c9f2fc31f09e0feef82ec7f5792be83c48d30f13f27fa17a6f3d77eebf267c5fbe9bb9bd6a366c7151ee3debf0b4cff5dfa1296f4e6be81fd93e2173fb4a781e2c75d66d7f4901af9e38afa73f63183ed3fb53f8122edfdaf01fc8e6b7a1f1a3c5cf25cb84aaff00baff0023f2b7fe0a49786f7f6d5f1f4ac73ff132987fe3ed5f0b385eb5f707ede16f6fa8fed77e3bbc6c9ddaa4fdfd1dabe46fecdb41d533f5afea5e187fec503fc12f18a7cd9fd7feba1c6305271e94d08a7a576df61b65fb918a9e3b745e8a3f2afa38ccfcb1c2e71115bb3f0149fc2ad8b2b961c44c7f0aee12200715288eafda07b33898f4cbc63f731f5c55c4d26e9ba802bae58719cd3b69f4a3da1292394fec7971cb0a649a3aff00139fcabab31939aab24673c8a39996a28c48b4a8557924d73f7fa5dab4dcae7f1aef634f94d73f770ef94e2a39ddca7056393fb05b838082a3fb24433851f956f35b93519831c8aa7208c0c616e17a629ec9f2e2b40c47a1a8fcae3dea5c8b503fffd2fbabed2ed1fca718a821f18dff00845c7886cb6bcd67fbe40ff74b2f4071588eee109391c571fe2094be9770a73811b7f2afa09504da3b55476d0fa1fe157edbdf16bc61f14344f0a6a115945677d74b14a238ceedade8c58e2ac7ed73fb497c6df87bf12aebc3be13d6decac9638dd11113237af3f3104d7c1df00afeec7c71f0c1f2f00ea118393d39afa17f6ffba583e2baa646e96d6dcf3e9822bd9ad868a8ab1f391aadbd4f18d47f699f8f5a8dd5bbcde30d4d0ef46fddcc539ddfece2bf1bff006ddd735df117c61bed57c49752dedec97172659e762d23b1998e598f24e2bee9f13eb171a5c76d716c4677283907b357e70fed3fafb788fe20dcea6c154c93ce4aa9c81f3fad7c2f1151972c5f667d3e5534a4edd8f96a6073835f26fc6d63fdb16c07fcf33fcebeb69c8c66be4af8d84ff6b5b1ff006187eb5f3d496a7a4e5a1f3f5eb318596b96b0523568d4f7247e95d5dd12226ae66c813ab44179f9abd1a6ce59ad51e8766863237fa0ef5d7c0db9628c1c02a7f9d7130c815802dd3d6badb6b9841843381f29efef59db53aa72b1eb9f0aadd13e21e85264f17f6fff00a316bf7dff006d363ff0d29e26e78f3213ff009023afe7d7e1f6b363a778d748bcba995238aee1766240002b824d7f4f5af6b7fb16fed6fac78d3c69f0df5ed62ebc4f61a2c9ab49014856d11ad62442b9059c824715f97f893869d484144fedbfa1ae7f87cbf1d5abe21e9b69aee7e72163bb22909c9cd516b95ce3d693ed43a66bf0d92b687fad14aa29454a3d4ba5b6f06becff00825a5e8ffb4d7c10f13fec61e2f753737e926a9e199643feab508972f0a93d04ca3803f8857c40f722b77c27e2ed63c19e25b1f16787e636f7da74e971048bd55e320835d383c4ba3514e27cef17f0dd2cd72fa982aabe25a7af43f2a352f0beb3e08f1bddf84bc410982fb4eb836f346c30432363a57f469fb55784fc55afe9bf0c63d034cbabd11f8334e19b785e4193bce3e506be45ff00829d7c29d1bc69a7f87bf6ebf86b6aaba6f8a5045adc110e2db53871e72903a073f30f635dafec79ff000543fda87c69f17fc07f046db54365a0add5a588890479fb3a3aaec276648238eb5faee6d29e678184e9adb73fcccf0f634b8278a2bc310d26dae552babeead749ecd9e2d7f6379a65dc961a844f04f0b1478e405595875041e41155074fa57befed50fe67ed1de377f5d66eff00f461af01afc7eb53e49b8763fd3ec833578dc153c538d9c927635347d22f75dd5ad744d3407b8bc95208949c02f2305519edc9afd5efd9d7f625f895f04fe3a786fe20fc53d5f40d26d344bc4b8b88a4d4a1f3805078d99ebcf4afcd9f831119fe2ef86211fc5aad98ff00c8cb5e39ff000548f1f78b2c3f6ddf1ce9fa56a134102deb7c88d819e9fd2be838732878badc91dcfc53c7af126a70f60954bda124f9b4e67db4574ba9f23fed777d0eadfb4bf8cf50b77124536a733aba9c8652c4820f70457ce42304569df5e5e6a776f7da84ad3cd27de773927b75a6c7113d6bfa4b29c1ca861e34a4f547f8bdc759ed1cc734ab8ca17e593d2fb997e464d4c96c4f15f487c23d0f41bbf04bea9a8693f6d7826612ca76f1b98ed1f3302781d8715e906fbc2ba6a074d1218c6472de5fff005ebd4535b367c8f2b6af63e364b39241f2a93f415761d1afa5e12191b3e8a6bed5835eb3113496f616b105cf0cea09fa715245e2bb86e896707fbcf9c7e4294aac56ec6a8cdec8f8f21f0a6b92e04765337fc00d5d1e05f15b018d3e61938e571c9fad7d8373af94b15b98b54b232eec18551f207ae7a1ae7352d7756b9b176b0bc8a7994828888465b3c649f7ac962e9b764ca96127bb3e6e4f861e3593a5830fa903fad48df08bc68ff7a045fab8af6dd2f5ed765f9fc45a97d9c2b10c90a02dc7a135627d6743958eed42f9b19c6368fe9575312a214e937d4f1687e0d78a8afced0a7d589fe9555fe09eb0ce4cb770a7e04d7b5c5a87858dbbacf2decb2646d3e66001df23bd672bf846e25d8d6d732127f8a63fd0d61f5cec9fdc6eb0fd1c91e3c3e0948adfbfd4107ae17ffaf50cdf0834e873e76a5d3d02ff008d7e8dfecf1fb22f8cff00691d5e4d1fe16f84eeb579a300b8844926c53c6588ce33ef4bf1a3f62ff147ecf3e289341f8a1a15ce9d77180c21b95652430e0e0f515cab358b972ec76acbe4a3747e3eea9a5269faa5cd843219638642aac7b803dab25e12a722bd13c456a96fabde8518533c98e3df15c55cae0e09af46153995ce49c2da1fffd3fb6ee6dd429f2d871c5675b680baedd2e912384fb49f2b76338dfc66bf01e2ff0082947eda3a17c9e24f0641301d73693c64fe44d76be1bff82bff00c46f0f6a16f7de2df87a0881d5d84524b1e769cff1a1afa2963e83774ce9f66ed63fa33f877fb17e99e15f18e99e2efed97964d3a759c208c00c57b6735ec9f1abf64cd0be3b78ba3f14eb1aa4b6463892209122b7099e4963ef5f8a9e19ff0083863e10978e3f11780757b5e407314f14981ea010a4d7bb47ff0007047ec9aaa3cad27584e07fad8957f913d2bb679a526be23c6fa9cd3d8fbfac7fe099ff0009357bab5b4d6b58bf950ca80edd8bd48f635fccbffc14fbe0ff0086fe017ed91e33f849e129659b4ed1ef76c2d31064c491a49c9181d58d7ecd699ff05f0fd962629776e4c263656c5c6f4e873d421afc1ffdbf3f696f0d7ed63fb52f8b3e3df8495134fd7a78a489637deb848910e1b03392be95f399dd68d4a768b3d6cba2e32d4f8baea4c0af94fe364a1751b5723f81bf9d7d39733eeaf983e3614fb6da9233946fe75f2d15a9ed1f3c5c5e33e536f5ae6a32e9a9c654ff00157432bc7f37cb5896c03eb30a377615dd4d1cd2776665dea77314ec8bdbeb578dfddc6b693e47ce1f8f4c1c563eae816f9c2f63fd6afcb776373058d9dbc6eb2c0ae25666c862cd9181db02b4a4937b0ebb36e2d46e5cf515fb41ff00047eb891fc45f15558ff00cc93a87f4afc66b4b0ff0047174ce1473c60f6afd98ff82403c0de26f8a6913648f04ea39e3d8578fc5105f52a9e87e8de10d56b8870d67f68efcb12dcd3949c5347a1ab91a0239afe50a8bde68ffa01c1d44a8c6fd915f69c6680a6be88f8d3f02f5bf83e7c3f7b781a4b0f11e956fa9da4c460112a02e9f546c8fa62bc35e255144a938e8ccf079a51c4439e8caeaed7dc7d91fb27eb3e1af88fa27887f645f89522ff0061f8ea12b6524a7e5b6d5101f22419e81fee37d457e74fec9df097c43f07ff00e0a1de1cf863e2a81e1bcd1f5c8e175618242ca003cd7a6d85edd69b7f16a360e629e07592375382aca72083ea08afd4d8bc11a57ed09f16fe11feda7e1d8d57578755b4d13c511c63a5dab288a7603a0994039f5afb2e14cedd053a327a34cfe4afa4678591c757a19b505ef464afeabfcd7e28f877f696904dfb4078ce4f5d66f3ff004735787f7af60fda065337c72f17ca3beb179ffa39abc82be5318ff7b23fa4f8255b28c3a7fcabf23d83f67d844ff1cfc2111e776b1663ff00232d7c8bff00053694de7edc3e3c97d350907e4c6beccfd9920fb47ed0fe0a84f39d66d3ff00468af8abfe0a18e2f3f6ccf1ecdeba9cc3f276afbef0e63fed68fe45fa6a56ff0084851f2ffdb91f102db66afdb5b91dab52ded06315bf63a5f98f822bfa057a9fe4a4b53d1fe1afc29f1678e3c1b6ade1f781156560fe74a23e5b91f515f58689fb00fc5ebfb58eeee35af0fdb46fd0c9a8a31e99e8a0d7ea97fc132bfe09a0ff00b46fecc92fc47d0fc65a2699a94370d1ae9d7b388a52aa8a77924e0024f1915fa1dfb347fc128fe3afc69f0fdfeb0f77a45a58d8de49668d3b3b194c7c17431a95284f46cf35e455c6c9d6f6705a9f4385cba8ba3ed2a4cfe669bf638f115a247e7788b4d9438dc0c0279411923a88fdab52c7f63e67651a8789a0873e96970dd3f015fd82e87ff043ef893a5e98b6a75cd1c48b9e76cc7a9cff0076b96d6bfe0899f1eb5332e970eb1a2ac436912ee9464e7a636e78ad7da6217d823eab82dbda1fc9bc7fb1b69b34373712f89ca35b47e60436322990e71b532fd4f5e715cfb7c0bd2fc1da9e9de6decf3add5dc3149e642a9b5770248c3b64fb57f5b9ff000e1af8bb7101f37c53a445275e1266fe95f19fc7cff823f7c52f84fe2af017863c4be21d3a6bbf17788574db3f251cc71a850c25909c1ea71b40fc6b3757157f7a3645cf0b8151bc6a5d9f82d7ff00b337c3ff00edc3a6c17faade49712808608a10a779eb82c4e077e2b99d43f67ef86d692490c73ea6fe59c162d0a8e0ff00ba6bfae3b4ff00837cfc7cacb34ff116c2393bb47672e47ae09715c0fc58ff008205eb3e04f873acf8ee6f8856f3be976af73e52d8b0dfb3923264e33eb8a7cb8cb2b2052cb6cf99bb9fca0cff0009be11c51344906a8ee3f88dcc607e422e94cd2fe1a7c38b2ba12fd8eea60a4104dd7f8257d99aefecfd71a4789e4d07c4bad35bdb392229a28548623d493806abdafecf3e109f477d6dbc4b7cb6e99cb3451a72a71e9d2bae8e4f99d5f812fbc9faee550b5eff0071fa4dff00049cfdb7be1dfec59e24d503e8735cd9eb502c32c714c5a5dc872846e18eb9e3deb1bfe0aa5fb50d9fed4bf10ae3c783c23369b696f6e96b6ef7864127eed33bbe5daa7939c735f9eff03ae3c2ff000e3c7ba7f8ce1d52e277d3ef84f009446524f25c150eb8e8c460d7efa7fc14ebc45f1dbf688fd86b4af8cfe28d33c3da378761b97ba89b4d9435c38923288b203f439039cf5af9dc5e558ba3270a92566fd753d5a38ec0ced2a71775a7c8fe0cfc59749737b2c83070ee0ffdf46bcdee883c576fad1533c851b20bb1fd4d71f71b73c57d2e1d5a28f02bb4e4cfffd4ed64ba4b9187553f500d733ace9da2dc594915d58c1282ad92f1a9edf4aae6fdc8dbdaa3bb9da7b730af258151f88af4ea56573be31d0f99fe1c7c3cf877ad7c56f0fd96ada058dc452ea512c8af0290cace010463a57eaaff00c147bf61dfd99741fd97ad3c7fa078234bb1bd37714466b78046d862c0f2b8eb5f0cfc33f867e2bb7f891a2df9d8122be85cfcfd83826bfa15fdbafe19ebbf107fe09fd6b6fe1a884b746fe06009038576cf26bd2ab3a52a77d343c04a6a76b9fc496bbfb367c14ba8199f4df28a839d8ec33fad7cc1e22f0ae9be15be9740f0fb3456b01c46a4e700f35fb3fe20fd97be32c504c3fb337e471b5d4ff5afcacf8d5e16d67c1df106ff0040f10406deea129bd09191950474f6af9fc7d4a4e9fb96b9eb6129cf9ecd9e132417c3189b81ea2be6ff008d91ea22e6d30c87e56ea3dc57d4320e7dabe73f8d2aa66b4cfa35780a5a9ebb47cc523dd8caed563f5aa5a69235cb7372b81bc6456f3c71e4ed35916aa0ebb02b74de2bb22d1ced6a636b007f6849df93c7e26abd8a67505ff76b435818d465523a31fe755ac949d453fddad2835b17885a5cef7cb0b608a7d5abf5cbfe08fa3cbf17fc5519ce7c11a8ff00215f90ba84ed05ac51faeeafd71ff823c92de31f8a6c7fe848d47f90af1b899ffb0d4f43f41f09b4e21c2ff88f5556cd5d8dc0154540ed5a3020208afe529fc4cff7fb0b2fdc46fd91fb5ff179f4df8e3f0c747fd9d6711ffc249a178434dd7fc3fd04928583fd2ed8773bd00651ea2bf16e6674664906194e083d4115eabfb787c77f117ece3fb5bfc14f89fe1b98c7269de16d29a400f0d1ec5dc0fa8c75f6af5bfdacfc13e1c8f5fd37e357c38507c2de3cb7fed3b4f2feec33b7fc7c5bf1d0c726703d08afa3ccb2c9fd5a188e8cfe73f0cf8df0d4b3cc4e4eddaf26fe6fb7afe67c84ac0b7e35f7d7fc13f3e3fd8fc19f8d36ba2f8b8ac9e1bf104b15bde249ca472abe609fd8c6f8e7d0d7c083218d4e242a4321e41e0fd2be6e8d59424a51e87f4267993d1c7e12a60ebaf7649a3d3be34dc2dd7c60f144f1b6e57d56f08239c8333d79a67f1a8e59e59dda5998b331c924e4927b9a1093f4a75aa73c9c89ca32d583c1d3c2a77e4495fd0fa2ff00649884ff00b4bf81a1f5d62d7f47cd7c15fb723fdabf6b7f1ccbd7fe26971ffa31abf41bf6358fccfda9fc0a87fe82d09fc8935f9d9fb5fca6eff6a1f1acfd436ab71ffa31abf46f0e23fed47f117d36676cb22bcbff006e3e75b688678ed5d3d98da85bd01ac8b58c035b2ade5dbb93fdd3fcabf7e4cff288fdc6ff008275d96a7aafc329608e7648c328c06c0fb83b57f721ff0004e8b0bbd2ff00664d32c2ea669445348a9b8e76ae14ed1e8339e2bf896ff8267d9447e1e013dc4d023baffab4dcb9da3ef75c57f703fb04c76d1fc02856da737005edc02c7d46d18af99c1e223fda8e99fa063308d6451ade67da748082481dbad325963810c9330551d49e0573fa6788747bebabc8a0b88c9b797cb6c38ea114ff005afb5a9349a47e6a91d257e5bfedc3796f71fb577ecefe1d9580693c43713818cffab8876afd331aee8a7a5e43ff007f17fc6bf15ff6d6f1ae94ff00f053afd9cf4592fe05b5b637b7521322ed53b58658e7033b78cd72661552a4ec6b43e23f6f6bcbfe33f849bc7ff0cb57f0147742ca4d6a03669332960ad2f00e0104d6f1f88be015e1b5ab11ff006de3ff001af33f893f153e1fd84ba0c526b964a25d5a0463e7c78002bb1cfcdd38aa9e2a0a1a3d4cfadcfc39f18ffc109bc61e30b7bbb7bdf1e5880cccf6ec6d652c8c7a13f3d798df7fc1bebf16f58d263d32e7e2c5a244136954b09318f6fde0cfe35fd30587c44f00ea818e9badd8cfb065b65c46d8fae1a96ebe21f802c01377add84417aeeb88c63f36ae6f6925674ea5975d44f5e87f9b0fed1bf036fbf672f8d3aefc157d4175497c3974f6ad76886312b2b1f98292719cf4cd79678a7e2578f2ebe1b6b3a1ea1a95c4ba6dac7726381a4631290b8c85ce335fdf1e8bfb267fc13efe2b58cff127e207877c37ac6afabdcdcdc5c5e5c4a86494999f049f3076c62bf22bf6ebf80ffb137c39ff00824778dfe26781bc31a127896786e120b88191ae51a4be64057e6278418e9d2be7e7896ea28cbaf5b9df431292b1fe7e426692d9198e4919ac598b6eeb5d2c90452ac221223dca38359fa8e997364034a410dd0839e95ef527a1d4ddd1ffd5ccbb4214cf66dbe31d7d41f4354a0bb767451d9866bdf3c43f15be1ddfaecd174b82d948e76dba216f6c8278af9e0ce67bbf3235e19f38038e4fa57af8ca0a0af744e5f8e75aeb95af53e87f02dc95f14e9a7fe9e23ffd0857f47ff10edd6eff0061db476ed749ff00a30d7f365e0586f478934e6f29cffa44783b4e3ef0afd7dfdacfe287c40d13f63683c2fe1a8ae803720e608dcbe724839519c66b8e8439e9ce3164622ea51763e70d634c8991b815fcb5ff00c14221169fb50ebd18e32b01ff00c862bf5053c7bfb486c324abad3227de6f2242bb719273b6bf357f685f849f1bbe387c74d52e7c0de1cd63c4f70b1c225365692dc32e100c3796a769fad7ce54c04a8ae79c95bd4f628d6e7f752773e089b701f2d7ce7f17434d2db06edbabf5bf4cff00827b7edb3a8c4ad69f097c52e081d74d9c7f3515c97c46ff00824fff00c142fc451c0ba17c16f144cdf364fd8ca819ff00788ae09669878ef35f79d90a355fd967e1fcd68132d9ac3b48f3af41fef8afd63ff8736ffc14d2ed2378be0df884099b6a6e85572738c60bfad7c99f1d7f631fda53f657f88365e16f8fde13bbf0cea12c88160bad9bcee008e158f5041ae8c366787a8f969cd37e4caab82ab1d65167c87adffc84e5ff0078d47a5c4af70653c902b6bc57a7cb69accf14c36904e4631dcd50d2517cd38f4aefa4d74154858e86fac2ef513696b628649657d88a3a9662001f89afdb7ff8256fc17f8aff000df5df89babf8f3c3f7fa4db5c782b5058e6b9859118900e03118e95f91fe0e1147e27d0770f98df45ff00a1ad7f515fb5d7ed2bf1c744f88fae7c28d2fc45750f875aced6d8d8aedf2fca92d622c9d3383939e6be338eb3afab61fd9b5a4b43fa2be8d5e1ccb3ccd955a52b4e9b4d744fbdf73f3b02e3915a301c73543e9572123a1afe7293bbb9fed5d0a6e34d41ee90bff057cf05f8cbc4bf133e1cdcf86f4bbabe8a1f07698aef044ce14985782541af5cff00827278fdbf683f817e24fd89bc6afe5f883492faa7873cee1d6ea153e65bf3c8f35015c7f780afbbff00648fdadfe3578c3e2bf84fe117896f2d6f74365fb118a5b4819841142db544853771b4739afe6fa2f8c1e20f813fb65ea5f13bc2d2b413e99ae492e50e3e559327a7f2afd6b87ab471f837814b657bf99fe6df8b192e2b8538863c415e76e792564eead7d1f74d1f7d5cdadcd95ecb6576863961628eac305594e0823d41a8ebec0fdaa744f0f78bd742fda77e1da28d03c7f6ff00699163fbb6fa8a81f6a878e065be751e86be3fed5f95e3b0d2a355d367fa0fc17c4b4b35cba9e2e9bdd6bea14a07534dc8e4538641ae647d2b67d5dfb1147e67ed5fe0653ce35243f92b1afcdbfda6e0b8bbfda1fc617288cc0ea971ce0e0fef0d7d8df077e27ea3f06fe2668ff13747b78aeee7479bcf8e2989d8c70461b6f38e7b57e917c24f8bbf0aff006969bc65a6788fe17f8774dbab5d0350d4c5edb46fe689e34c86f98e33b9b39f5afb6e0fce2184abcef57d8fe4afa4f787b8ccf70aa3493e48ad64aced677d9b47f3590c441c3718ab374e12c6561d91bf956a6ac436ad7440c7ef9fff00423585a99dba6dc1ff00a66dfcabfa2f075bdad38d4ee7f8ff009f657f52c5d4c2defcadabf7b1fd4b7fc1387c51f0aecbf616fec4bcd2522f132ea5e72ea4a3e66831831b92d8c0ec00afe8cff629fdb8bf67ff000efc0f8fc35ac5fc915f69d7137da12384b0fde36e523079c8fd6bf95cff00827ecb10fd9d16298065defc1e4753dbf0afadbe1e4f2d8e8ba95ed943b61de03320c0040ef8fad7cc568fb0c4cb110f88f6e8e29d5c1c70951fbbb9fd3cdeff00c148bf664b38cc935dde95e99fb31e7f5ad7d27f6cbf80be1fd26e7c4be26be7b283529fed106e81999a29117664283c91dabf9b4f0e6b56371a4482f5d339180e47a76cd7d81fb5ed9699f09be1a787bc5335eb111e936baae10f96136267612339076f35ad1cfeb54d5a5a1c2b23a1cca3295ae7edafc32fdb3bf664f8b763e2ad4fc25ad45f66f052a49ac4b710b4296c8e85c33161c8c03923a57e21fed0ff00b647ec9be28ff82b17c1cf883a778d7479bc2ba2e8f7cb79a80706da399d64da8ed8c6e3918e38afc78ff827ff00ed2979e3bf86ff00b56cbafdf08aebc41e127d41029dbb9a2b80a42afb2c807d2bf12f5ad61df5ab052c7912d7b13a8eaaf66f47b9e1d5a54e13928bbd8ff48d9bfe0a71ff0004e64bd96cbfe161f87d5a3e03fde5247a613915f287c7bff82abfec3c9f133c2de14f0febfa4dfe9f04bfda173aa448b2c31b0491161dbb3258ee07dabf84182ff71259b9c55db0b9ccc6ea539119e3eb535f035252bf3d97a238e9b4f467fa1fc1ff000519ff00827a6b5e177b2d0fe25e81a35f4d1a66530a8746241fb8d1ed27b77c66bc7b46fdbd7f654d3b44f14dbf8abe36784b5cd48da1fece1369b0c10db4c0361c85cb4eb92b9048381ef5fc131d4ae1a4796362cc391cff002af2ef187885238d649bce8a4cf2c0655811f7491c738ac31780a952519295adf89ad18c61170dcfee83f62efdb4fe0fdd69e07c5df8a5e02b8d0a1b4904561f608ad2eda6209693cc773b54be5950ae7071d857c17ff0536fda2ff65897fe08ab79e19f875e21d0afbc4f7ed6a5ed6cda16bb50d70f23e428de001d735fc8b8f100bdbb0f16e5555fe218cd701f10f562bf09ef909387882ffdf4d5e24f87a6ea26ea75ec57b38ee8f9a9b5199d5181c600fe554daea5dc5f71e7ad5353b62507d290bf735f7f46924ac632ab2ee7ffd6fe8e7c3dff0004d3b8f0ff0088e196e74ab3b9b34e4fcaa79c7b8ad6d53f61ab997c5f6be25b9d1ada08ede52ed124408618c01c0c71d4715fb44218c36e0b8352ed19cf35f9fd5ca71751dd56773ebb0b9fd2a6b95d24d1f9f5a7787f4286ff004fb19bc3d1186da58c11f66038520039db5f57fc52d4fc3fe17f87b77aaded819a08d3688618c16cb70303f1af57c29ea291e349176480303d88c8ad728e17c4528d452ad7e65dbfe0979a67f4712e0e34f9794f80be2878bbc1137c36d7aca0d3a58674d31e4c34583ca1eff857e377fc1253e30d868df1ebe2add48cb169b73ac4511699954a9284719e70315fd037ed49a7ebedf027c4f27839618af4d8c81dda30ec610a7781d39db9c67a57f113fb3b7c07f8d9f15fe3b7c41b9f86fa6dd4da741a988ae2ee28dde2864646601f61cf2057954f852b53a156857aba4ada9e94333a35aa41c22d7ab3fb96f197c74f851e00d057c45e29d6adeded0b050ca4c8496e9f2c619bf4ac5d77f680f861a1e8961e20d4af9a2b5d49905bb344e0b6ff00ba7046467af23a57f3d9f0bbc2bfb442783f4bf0adafc3ed46e752b357b77b994ce0bced2031cdf3af08a07233d3bd7f465a27830eb1e08d253c7ca915fc76d17da50e191650a3760b7607bd7c4e6d91e29c3d9616d2f95bf53d0c4e4b84c34235abd4ba6f64f53e738be3d7c3f8b58d22d6dafe39a46bbf2fcb0c03665760a706bf8e4ff83a234d58ff006cdf08cc4a16b89ed4ed5e7811a005b9ea4d7f67fe33f871fb31691ab41e25f1b6a9a259cb612aceb25d4d6f0b298cee077165e98afe1ebfe0e58f8dff00067e28fed85e0fb9f853e24d37c426096dbcf6b0b98ee117684182d19201e0d570170de2f075272c4c6d7b5859ce3b0952305856f4bee7f2d1f1ff0047b7d2fc706de08bcbdd0239e060962493d6bc6b498b6dc62bdeff0068e9566f1dc77048512da46c02f4c64d784e94ca2f36ab71c726bf62cba6f915cf1336a518c9f2f647d17f0e74d6ff0084934b908c817509ff00c7c57ef1fed9c01fda2759f786cbff004922afc50f8671dbff006b69eceebfebe2ee3aee1ef5fb9dfb63f843c5b3fc79d5753b7d2eee4b6920b2292ac321461f65886430183f9d7e75e2636e1147f677d08ea4619ad57276d3f43e435abb128c66a3934ed4ad8edb9b792323aee461fce9ca580da6bf16b33fd4e55e2f667d6dfb11ae3f6a0f0a1ee2794ffe4092bf16be307c3d8ef7e297892f860b4d7f33f23d58d7ed0fec40e7fe1a77c305bb3dc1fcade4afca8f89371bbc7bad38ef772ffe846bf51f0ce3fbf91fc07f4e19ff00b1d1f97e6cfd05ff00826af89ed7e277c2dd7ff62df1bdcaff00c4c41bbf0fc921ff0051a8c20989549e825198cfd457976afa5ea1a16a571a36ab1343756923432c6dc32ba1dac08f622be30f855e2ed5bc01e34b2f1768933417165324a8e87041560723dc6335fb31fb55695a67c4af0f787ff6adf0746a2cfc5918875648feec1aac2a04b903a0986245f5c9a7e22645c953eb105a338fe877e2bfb4a7fd938a96ab4ff27fa1f10e4eecd4c0e4541d29467b57e568ff00441c897b735f75fec3ac22b8f891739ff57e0ed479fa8515f096481cd7dd1fb177eef43f8af75ff3cfc1f77ff8f328aedcbafeda27c4f8812b64f887fdd67e286a5213a8ce7fe9a3ff00335cfeb336dd2a7ff70d6ade48bf6c98e7ac8dfccd73fae3ff00c4b255f5007e640afeadcaf4c3c17923fc11e349df35aeff00bcff0033f71ff63af8b5e13f0b7c19b6f0ede6ad676b74ed2131ccf86fbcdee3b57d10ff0019db49f0938d0bfe26519f367f2ad8e7cc20aa81904f4afc9af0668b1587c3fd175f4b68bf7933f992900b15f9c7d6bea4f8217b7ade0bb73b7682f3f4f4329c7f2ac6ae5ca73bc99e6d1c638c6c8f7abefda8f5af0de8f1cde20d16e2c22b86d91890c649207a1e457db3fb507c6e93e34fecb7268fe270f0a691a23c5e6a484492a2a991031e802f4c0ed5f8e1fb525d5c2c5a05a313fbc9d8ff0021fd6beedf8ab1410fc03d76c66ce24d34c5c1c1cb205e3debab2fca28c2a38db40c5e3a728e8f53f183f66ef8ede25f8649e2cb0f0fac2f1f89f459f48b9332ee2b0cd246e4a7230d941cf35c9ea776edae588279f2e43fad7e8d7c4afd8cbe0b7ecf9fb09783be3de9a935e78a3c6d2cb0c92ddcb95b68a165204118c00c79058e7835f98ba95daffc24168a0f02d9ce7d72d5d15a9c13e68ad59e4a8b4b53d3adae491915b97531b1b78adc9f99fe66fc6b8dd1dc4b2c7193c122ad6bf7d22df641e959ddec4c744d9d21b9c03cf6af32f88fe228f49d32c964fbb3df44841381c86ff1abf71ac8899213200f26768ee71d6be7ff008b1ab25c788b42b0b87de82ed59933df04824536ee5533d36ee680dec9b70309dabcabe2a4de57c2f68d7fe5a794a7f1615d32df99aeeea44208543fcab8ff008a50dc4fe008a1423e69a0047b6726b99fc475a868780e46c00534d6c2e972184f1f30ef9e2b2268648ce0d7b70ab1e8ce195368ffd7fec7b59ff8287fec77e1fc9d4bc7ba5923b44e65ff00d001af17d6ff00e0b07fb0f68f31820f105cdeb038ff0047b4908fcd80afe06bc45ff0508f84ec9b34ef0fdc313fc4648a2fead5e4f7bfb7ce921bfe259a0c5bdba192e1dc9fc11456f1c16162b599d0dcded03fbccb8ff82e07ece8be2092c34cd2755bbb677548e56892244c7de662589209f415eadf11ff00e0a6d6fe1bfd99b51fda0bc2be18f3cda322c56d75701038760b925467be6bfcea6f3f6cff008c5ad6a76da37863c3ca6e6f58adbc515a4d33c847276063f363d856feadf193fe0a0fe2cd4ec3e17496bac59c9a9a3cb6d61244b6c922458dcc15f8c2f145f0f04d42ec3d9d47e47f505f157fe0bdbfb49f8c744bef0c787fc2fa1e9b6f7d0490b3fefae1c2c80a9c64819c1f4afc3cf09ffc14dff6c6fd91bc43e27b1f823e22b7d213c53711dede96b54918caaa5415dff7460d7c3d0fc06fdb47c79e28d53c1ba95fad85ee956697b709737c40f2e4ddb7688b209f94f15f2968b77aa5e787249efe6696749244676258ee4383c9c9ae0c63a538b8f2fde75e1e1522f9ae7eaaf8abfe0b2dff000522f183b45ac7c59d5e056ce56d3cbb71ff008e2e6be1ef8fbfb767ed5fe2db6857c43f133c5178242db83eab7080fd423015f3b5aa994ef95998fd6b86f8a51236971468833938fcabc7584a6b647a3ede4f7393f107c50f197890997c43aadddf31ce4dd5d4d313f5dee6bce9358105c24b6fb564560432819041f5ac57770bf30e455232a2c45d47ef474ef5b428476487372b5d9d3fc4ad6e6d7354b5b898e4a5ac71f5f4cd79abeab2404c44038f5ad8d4e56b891080770519ae22f4b0b8607a8ae9c2d28af7458eaee4b98f62f0478c3c5715da41a0a890c2eb71b48c8ca1041cfd6bf48b48ff0082baff00c142fc291c7a7c7ae5c4b6d02aa468e0c8a154600e4b70057e7f7c0cd3c2c17dabca386db12fe1c9af7648e077c902b0cc727c3621af6d1bd8f6786b8df32ca79bea35396fbe89fe773ed7d37fe0b81fb63d945bfc4963a7df22fde373670b03f5df11af54d37fe0b59e37be811fc55e00f0c6a1bc02dbf4db7c9fc5556bf21fe30cd15b787adece21ccd2e78f451ffd7af3ad37ece8214bb62a840048eb5e3d5e0bc04a3751b7ccfd0707e3ff0011527fc48bff00b76df958fe893e1eff00c15efc203574d6ec3e137876cb53891c45756d6ed0c91975284aec9319c13dabf2d7c55ac36b3e21bed6a12552ea679403e8c735e51f0eb4356d1ee35e494158a4f24263939ef9aeee6388ff000ae9c9b8630f84a8ead2b9e471af8c39a67985585c728d93bdd5eff8b645a54e37b1afd47fd8d7f695f867e19f03f887e077ed02d72fe14d6e34915edb6b4d6d7311cc73441ceddc3953ea0d7e55696db598d6c5d5c98a032805b1ce075aefcdf29862e8ba533e6781b8cebe4b8e863686b6dd6d73f7221f0dff00c13a75bff9067c49d76c09ed73a7c7201f8a355d4f80bfb226afc681f1b2d2227a0bcd3e68ff0032a4d7e0cff6c4463e7721f420d521ad3c67f77211f426bf34abe1953fb335f77fc13faeb07f4d2cc62929c67f7c1fe713f7f47ec79f0eb52e7c37f18fc29759e82592580ffe3c0d7bafc33f81517c04f85bf143c41ac78bbc3daac7a9786a6b4b64d3ef92595a42ead8d8707a0f7afe676dfc51a82bf950ddc8ac06701cf4fceb6a0f1a789a2e23be9bbff1135cb1f0dea539295392fc4f5719f4c78e370d2c2e2b9f965a3f760dfe0d0eb89375cca73fc6dfceb0f5c931a730eb9641ff008f8a7f9ce4927a9e6b2b597cd9aae7acb18ffc7c57eb784a4e9d38c1f43f8533ec747138da95e1b49b7f89f65df78df55d2be14e896366ebb177b3038ce39e99fad7d65f04fc730d9fc38d2a6d41a34699246e7827f78c7815f35fc25b9d6a7f0e5adb2e9163abdbb4636f9b27ccb8ea3054806be8297e175b789a5b3babcd3e0b5fb2c5b2386293e542c4938db8f5a9facfbfca8ca141f25ce8fc68fe08f8d1a9e971cbab49632e9d2e1505bbb072581ea40f4afd06f86fe2df13eb8ede1bf13e95a75de9f1e56399d2512b8cf05b0e17a7b57cbfe03f0d4fe1eb74b7b465558f8033923f13935f52f832f75c8e649242aa3fbc7d2bae851729394de8294acad15a93ff00c14efc57e051ff0004edd3bc0b71a743f6ed235788d85c05c34293b334a8a72786c015fcb5f892e8ac9a72ab1e2dbd7d58d7ef8ffc152bc41bff0066bb2d39a404c9a9c2703be15abf9f0f10ceed7b67121fbb6c9fcebb313caeca28f3a71926f98eb7c377b2c9788eb3baa273c31ea3f1aabaef892fd2e99a2ba7f4e18d7036fac496fa8318f0108db81d3eb5512e44f3bb373c9ae6f65a99a7a58b9abf8db57d324b6bc9a776c36d0c4e76e7a9acdd63579ef7528356bc937cd09ca3103d31f8f5ac0f189b76d2cdc4c7062e9cf06b09f524d42d9658b858c2e79cf6a5282be86b4e5a1eac9e2dbcb65232bfbf43bb8fc2abf8abc573eabe1cb682eb6e16ee355da3ae149ae260944c232dd02f14fd6a6920d2ac5231f7eed89ff80a7ff5eb2fab1b2afa92dc6a8db76a702b19e577c96ef533fda6502464247620706926b80e0aba2a93c7a62ad5165fb44f73ffd0e07f66efd8e3f64bd1bf6eff008abf0d75af09d9dde8ba459584fa6db5eab4cb079a3e72bbc9ea7d735eedf113e14fecfbf0f3fe0a1bf07ad7c27e1dd26d34dbad335559a18ece3f29dd14142e98c311d89e9507c344d4d7fe0a67f1321895e7371e1ed3a4c6df438a9ff688f0ff00885bf6e5f8238b3292dc26ab1a07e01fdd026bdd8e161183d36669ed66dad7a1f457ed35e10f036b5fb58fc094d2aeac74d537fa9aec82048863ecb9fe118fce9bf187e065b41fb7b7c2c8345bcf3966d13596790052010232a31ef5e8daff00ecb5e1bf883f1e3e176b3f117c4c741bbb0d4af0da5bc281cca5edf072cc4607d33543c6be02d174ff00db43e1d681aa6a524b72963abaa38257e54da38fad5621439a4979134e13514df99f2c788be0f6a7a67ed7bf12d6f21478e0f09594bbb85072661903d78e6bf950f0ce95a95cf86af16c6de4949bdb90a2352d9f9cfa66bfb67d5fc1be178ff69ef1f59bb34bbbc256f92d2124e4cbef5fca5782be38d9f867c38be144b3063d3ae6ee181768dc079cc482c3af3d335f3f99c5dbdd5d4f4f0924b49bb1f3bf87be10fc49d56057b7d267507bc8360ffc7b152fc41fd9c7c78da6c135d9822cb6dd9bb7312dc76afb034ff8ff00a54f0013dbbc649e9cd53f12fc69f0114b69f54f38bc6dbd23551862304027b7e55f312957dac7b51861ff0098f5ff0000ff00c11c7e11c7e0fb2f147c4af17df4f73756e93c96b671c712a1750c537b6e2719c6715f347c64fd90be04fc36d43ecde12b396611ff001dccad23123f21fa57bee89fb7e7893c7de36b0f84de1bb086da5b9818c52ceccc3f763a6063920715c7fc4eff0084b2f6eda6f11dc4723ff7625da3f9935f3f818e39576f112d3a23e931f5b02f0ea3878ebd59f0c5f781fc3f632916367147f4415ce5cfc3df0c5f9ff4cd3e1909ee5057bb6a1a748653c5514b1e8248d78e33d0d7d65395ba9f17575dcf5ef04fec1cfabfecad71fb4968f7b6b6ba6db6b51e8e6c02baca6598a81206195db96e7bd7ae6a1ff04a1f8fd17c67b8f81be1c167a8eb76da4c5acb08ae02c66da63b570d205f9b2795afb8be11c16cdff04a6d52051f28f1cd9e4039e77c55faede0d96d6cbfe0a49aaea570db161f00591627a0025524d78f89cdeac26d2e87b987caa954844fe34be237ec29f1975cf07c5f10dec678b47b7d4df45170aaaea6f836c30e036eddbb81c60d79378b3f61df8fbe16d62ebc3bab68b790dee99124f7504b6d2abc5137dd790053b54e3863c57f5b7fb4df8063f017c01bff000cc0a1613f16e3b98bb02971224ab8ff00beabde65bb173ff0526f889e0797e68f5df00470ed3dda38f8e3e8c6ae9f104edb0ab64304ed73f89cf06fc33f17e8114935e45981860153952dfcabaebad26fd2321a33c0afe8cf4cf0b691e09ff826ef83345beb385af3c47e3d8d0b3c6a5cc515ce1972467042608e95e9ff00f0547f885fb30fc314d77e00c1f0cac23f116a1a4457365addac30c4609263904aaa86c80a4641ef5d90cfacd4546f738279168db958fe586cad654cee535a442860afdce2bfab6d13f63cff0082775afc38f84da07c53f0edcd9788be2269d6e96f75632cca1ee4c28ccd210c554b16e3e5c66be12f02ff00c12db40f1a7edbbe2efd9d353d6a4b4f0f78521fb735e84469dede40a625e7e50d86f98f4e3a574473ca526e2f4b10f24ab14a4b53f0f27b78597381598d6501e4815fb8ff00b587fc131fe147c3ef81d71fb42fece9e321e2ed074eba16b7aac1774677f964abc6403b5880c08079c8af0ef19ffc12e7c7be1ad1be1aeaba7eb76776ff0013a48a1b0886f430492c4250252411800e3233514f31a32578b22a65b5a2ecd1f8fba8bc70ea0c22006140a2def0eec66bf60bc61ff043ff00db3f49b892e2cf4eb6d407adb5d44d9fc1ca1af89b5afd87bf680f0d784af7e20dfe8b72344d3ee24b4b8bd09ba18e6864f29d19d49c10fc7d6b7a78da72d232396a60aac778b3e6f4b8ca8c566eaf313044a7bcd17fe862bd4ee3e0cfc47b5d153c47fd9d31d3dce16e7cb710920e387236f5e3ad71779e00f1b5f4905b58d84b3bf9c8711e09e0d7646699c8e0d1f68fc37786cbc3160f11284c2a78f715f42787f53b9930de790171d4d7ce5e1cf879f1a34ad16d52ebc2da9796912e185b48c3a7b035d54175e24d14ff00c4e2c2ead40ea2589e3ffd080ab850bea8e955ada33edbf0e78aedada2ccf2e5c7527dabd7b4ef8b3a3dadb849e505bd14d7e6258fc55b31e2293c38565f3923f30b9fb801ec4fad7709e327032ac33f5ae88504c258b6b6367fe0a1ff0010acbc43f0a74ab1b5937037e1b078fba86bf20bc457a21be46eb8b6403ea457de3f1c7c47e1fd5b4c86db5cbc4430333a4650c9b8e3a719c7e35f0d6a7ae784ed757ba6d757e5748fcbf949c0c1f4e94ab594924734e6e5ab383fb4c6ca70769a92d2eb6e4935d3a5f7c2dbc5c25c2a13eaccbfceb4f4ff000ef81f51e2db515527a7ef14ff003a7ed11c8e2d1e77e20861d4b4a96090e0edc8fa8af3fd0df1a6607d315f5137c2fd32ea36fb26a01815f63fc8d794f87fe1adebc77b6f14cb9b799a339ef8e73fad5268a461d94dc01b7a28a9b5e98793a54001e6599ff2502ba3d3fc17ae4e58db2ab85e3ef0edc77ac8f13d85d69b7da669f7ebb2458e6623af04802b48d996af72b2eb7791a08436557a02062b3e499ee2432c872c6acf96ac3a8ad0d3658ad2e019d5648dbef03e9ed4b90d536f46cfffd1fbdbc19a6786f46ff82ab78d6eada3506ebc2163c9ff00624f4e9557f6b9bbb187f6cef809a8248136deea51851801b741d2aa588b583fe0abbabd848c4453f8260903af392b3e31557f6c8b2861fdae3f67dbeb342522d5ef849bf1c86b7af65e223caeddce88c363b9fdaab54963f8bff092e6cf28cbaf3ae4719dd0b5796fc6b3ae43fb7cfc22bc898817163acc657be04686bd17f6bcd5dadfe22fc27bc85163f2bc47c6067ac4c2bc8be3a78cda4fdb6fe0fde5f16dde5eaf14781c0cc2b91c55caaca4e565d88718a4aece9b56d56c22fdaebc776779701245f06db3907ae37cc3b57f1cd7facc162f73ae42bbe017d70e0371c195b35fd86eb16fa7df7ed63e30778c79afe118324f04aef97d6bf922f8ada2e8567a1cd1d81203cd72cfb47ddc4ac33c7bd7162a93ea5a9ad91daf87f5fd2351b686ed2106275071e86b33c71a978649b766464619ec08af0ff02f88ce8fa7c704df3458e1fd7de9ff00107c77e1f856dda6b85079ec49fc85791381bc66733e29f1adbf823e27f867c7ba5b6dfb14e3791c7ca186e1ff007c935f78789fe2a68de28904ba6c824f33047be79afc94f88be32b0f125a476d661888589de5768e4638af4bf0d7c53bdbbf07c36da4d84f73a8c11ac219572858700e7fa57157c229352ea8eda18b6935dcfb6ee2e2ee7721217627fbaa4ff2aae16e776248dd7ea08fe753788ff614ff0082a17c03f87f6bfb466b9653d9686d02dedc324d14df6581c06533c2096404119e0e33cd57f859fb527ed4fade8b2789bc67e0a8f5cf0d22b85d4e4d2e410928707f7f1aec38ee735c918dfe1699bcd35f1267eb2fc3ed3f5ab7ff0082506a70784ada6bab93e3fb0791214691d51a5883310b9200f5afd3cf13eb1a8e9dfb737c434887fc7afc275997b309154903f4afe68bc39ff059cf8b3fb3fc72e99fb3b687a7e930c92896fe1b843736972400a1963254a30f556e457a0fc2aff82ab7c54d63e28f8bfe3efc42d3ad759d4fc69a0cba14d1a16b78ad6275daa6151bbee63a1ebeb5e3d7caebca6da5a1ede1733a1084537a9fd02feda7e30d3fc47fb1b7c2ef88b631973e24f10f87aee6dbce65911558fe6bcd79678bbe2c8f0bff00c175f42f024b1e22d73415b3773c72f68eca3df256bf2e67ff00828a784bc4bfb25fc3cfd9c35ed2eee3bef066b363792df87478e5b6b5999f6aa70c182b60738e2a87c78fdb67e0f78cff00e0ab7f0fbf6acf0cdfc967e16b2bdd3a2bab9bc8cc2d0c69198e62eb96f95413c8cf15cd87cb6a45b8c9773b31199539a528cbb1fa7bfb696903e1cf843e057c1c61e5326b7737f2274fbf78029c7fc08d6bff00c15cfc21fb295eea9abf8a7c4be2892c7e25da6956c2cf4a66c457116ec2754233b4b1e1fb578a7fc1403e2e695f1e7f6b4f86de26f837709e23f0b5945638d46cb325bef96ef7b8dc3805540ce7a554ff0082e17ec9bf177c5575adfed7be0996c27f0f683a5daa5d6e9ff7cab1128d88f04372e31839ae7c3a69d3e676dcd31524d4ecaf6b1fa347f66ef1bfc5ed27f670f1ef86e4b64d3fc176b6b777e2672b21430c44796a01dc7e5f515e03f08fe3d7c2f93fe0a79f1334dd47524b583c4f66ba359dc4bf2235cc0a8ac9f3630490c173d48f7ac8f1ff008e7c6ba078fbf634d3bc3d7b35ac1a9d95b25ea452322ca8d04190ea0e18727839ac2ff8523f0b7e367fc1413f680d33e2068ff685f0ee976fa958c90c8f0ba5c98431753191f3123f3a98c5f3be6db52b9972a51df43c5fe3aeb9adfec81fb33f8c3f62af1ee85792dd7886fe5bfd335a8b6fd8ae21796371d4ee0e026197a835db7fc1482eb52d03f64af80d71a54f2db5d5adb472452c2e51d1d6ce2c15652083cf506a8f89fe31df7ed01ff0478d47e2b7c588fedda9f86354fb25adcc83f7d882748958b1e4928e558f7c73cd727ff056af885a5f837f64cf8177b7abb926d383aa938e96901c7d79ad29daf14f7b99d56d26d3d2c7d13e31f8e5f18fe1f7fc12abc1df133c33e21bcb7f10cf790c6f7e5fcc9dd1a6972acd26ec82001cd79afec63afea9f1dbf60ef8d1f0df5f94ddea31b5cea609c6e67b88fcf2d81eb2464f1dcd657c51d6ad7c49ff00046df869ab582948afae2da50a7a8cbce706b95ff823df8a20d23e3c6b7f0fb5001adbc47a4488d1b7dd668183608ef952c2b55463cb55a5aa664ab4b9e9a6f468ec7f6d078fe07ffc13c7e187c0087115eeb4915e5daf46da8be7b93f592403f0afc84f86b6287c4b6b800ed706bf467fe0ac5e3a8bc63fb4c0f06e9ec3ec5e14b086c6341d16471e64800f6ca8fc2be10f86760cbafc0fd42b0af5f256dd27525d4f2b38b2aca11d91fd15fecfff0010348f01780dfc5fe209163b2d22d1eea6673c04850b9ebec2bf9f8fda2bfe0e04fdacbe32e83ae7c37d1ed340d0fc39ab4ed6f04b169b1497b15a96d8079f2063b997924007d2bd1bfe0a09fb55e99f0bbf659b9f849e1fbf4fedef1384b478a371e6456a7991980e46e1f28fad7f32da86aee751b5b380edd8ca7f11d2bdec2579461cb167958f5193573fa6efdaa7f6f1fd953c53f0ebc35fb2b7ecb3f0f348d260d2b4db63aaf8b2fad07f69ea172a80ccc921cba2bc9b8e5b248e3815f9ed71e2296184fd9258e6c0fe07193f86735f9f16be34f11d9ea075b9024b71b447c8e36fe15bc3e2fdf118bdb153ea54e2babeb4efa9e6ac3a5b1ec5e3cb8d53519da49a27c13c1c135f36f89ee3ed1aacf19c964dabcfb0af41b5f8a9a449859a39a1cfa1c8fd0d79649e26f0fb789ee24d491e58246ce53aff003ae66ef2b9adf4b1cf5cc10aa323a649ac196de11f749535eb97579f0c6f631b2e26b727bb03ff00d7acaff846bc2d7ed8b1d5e339ecd8ff00114e3725c51e5b2cfa820db6770e9f4623f91aedbc1961e23b977b8875496d941f9c062771f5eb5adff0ac35299c7d82e609f278c362bd4f4af863e2ad3f4e4b6b7b70ef8f98ab0e49a53aae28d28d24e5a9c6c3aef89f4891bfb2af649225382cc03127bd33c44dad6b17f63aadd3f9edf6462c54608cbf71dba56ddc782bc5ba2ca669aca4551d70091fa53afb58b54d5ad426219a1b540d9ebf33124115952af24ee7b12a34651b3386175328c06fcea78ef2edbe58c073e98cd74dad68ba7ea570b71a54a88eff007973c1f715ab6775a5787e0034a0649b6912190007d095af4635d58f21e1a57f7763ffd2fd0ebad1a2b4ff0082985a6a31a93f6af07ba138ebb26f5a9ff6b6d1d5ff00686f82b752ae48d6ae541eb8cc15d6788ef34dff008783f852e6c9808e7f0cde4673c0cac80e39aa9fb63ea16d6df1b3e0bcd148063c412863918c184d7bf287bb2f53683d8f9fff00e0a41e23d6fc2337c3dbaf0b40b2ea36fae472c424e572c36f2076c126bc4fe26eabaa788bf683f865e25beb86fb5dabde80610235cbc237715ecdff000510bf825d5bc0f791b09522d6a0190723383c57cc5f157c457fe1ff008ade01d4f4f83ed128b8bb2158120ee8c8eddab5847df92f4339dac8f51d5a3fed0fda235e9b518dae676f0e44be717712ecdeff002ee0dd39f4afe657e2ad858783fc3daac36c0917f3dc342acc5cc69e6b6464f3c1afe87e2f1978e2efe3c6ada9ecb7b492e3418e220aeef9448fd0649cf35f845f1bbc27a45ef858437fa9325f47717091c463fbc8f212c5b9c800f4e2a7368c62af1eeccb0f7968cf11f85afa0cfe1a8609ca33a8e738355fe21f873c357021648d3249ec0d73da3f821f48d62cbc257320b75d42142925a9dc48724e58bf7e3b579af8f66d1ede48ed6d753d421f29d932e8ae0ede3b30af9a94d1dea0d98fe35f096829a4348005db96e31d00cd781781eeef6d7c43a745692b221bb88e01207320aeefc6fe6c5e1f8ee6d7576bdde4831346c8c063939e47eb5e61e0eb81078974b5b9388bed50e483c81bc75a52d623a6ed247f65dfb4cfed35e17f865fb537c5bf861f16fc5274ed135ff84b676ba558dd3bb5b49a84b036d089caac8d9eb819f5af5efd9f7e36f8bfe185bfec8dfb2de8d0d9b784be217846e7fb66d25815fce78e0de0863d32492dfdecf35f30fed6bfb287c3bfda67f6d8f8837df1221be16be1af85961ad69d35ab9895ae6088ed0cc54abae3a8af50f079b75fda47f6188b23fe453bedbf85b0e95f9dd550b69bf53f45a729df5d96c50fd9a7f655f811e3bfd86fe3e6917fe15d32f6f348d7fc5306977135bc6f7107d950b44b14846e5d98f9403c57c9be12fd827f67fd0ffe08d50fed5575a34ebe36fece6d412e9279006125e79681e2c94388f81c57e937ec25ab4763f0d7c63e149bfd5f89fe26f8af4b2a7a319ad67603f35ab7f1aeced3e1cffc12efc57f0626c467c21e17d0a1990f1b5ee5bcd6cfb9cd651c7d583e54f7b1d13c0529c54a515a5cfca0fdbbff00e09d3f0eff0065ff00d9cbc0bf1dbc0bac6a379378aa7b0b59ed2e551d6292f6012028c8037dfe307b57827eda9ff0497f8d3f0365f87de1db3d774ed6eebe21ea91e99a722892dcc7732461c094b8202f38c826bfa41fda93c1f67f197f66ff00067c3a923131d2754f05dc85c0384b8daa4fe40d617fc140eeb4ef19fc51fd9b35088811c5e3f61163fe98131ffecb5e851ce6b26a2ddf53cdaf925169cad6d11fcc57c12f869ff050af833f1c358fd9b74886f2fdfc06239b5db3b268eee0b4b6906e126efeee08e57a563f8e7f683fda63c43f057e21f867c5c6f17c2fa84b98673148914c5e5c3a893ee32865031ce0d7f421f019507fc1507f6bcba5fe1f0ddbaffe40ac2d2fe1a2fc4dff008212ebda2c51096e2dedf50d46118c9dd6b7ed2f1f829ad2a6669b4e71ec73c72b7aaa72eff81fce5fc1ff00dbd7e3d4baaf84356f126bb71a9de7800aff00619bbdb2ada840142a861cae140c1cf4afb8fe14ff00c14e3e29fc3ffda6b55fda6b5386db52d43c450adb6af66c9e55bdcc4aaaa000b9d8c368208cf39e39afd05f885fb34fc0af16ff00c1467f67bf86badf84f4e3a36b9e0333ea76b142b0a5ccc90b11249e56d2ce081f31e6bc3fe027fc13bbe007c73fda57e392f8df50b8f0df81be1aea33431c366e14a202ed969240e4246884f424d753c4e165ab56dce4fab62a16e595f639ff00dabffe0a99e15fda03f6789ff67cf869e09b5f08586a3729737de5488518a3f9844688880177c1627938af13ff0082a47ed79f067f699fd993e1a7827e1d9bafed0f06d97937c9730f96aacb0c31e6360c430250fe15a5fb73ff00c13dfe18fc13f82ba37ed45fb35f8bdbc5de06d5ae85a349285f32277dc108740a194b29520a820d7cc1f0e7fe09c1fb4d7ed1ff00b396a7f1dfe15da59dee8f6a6ea392292e44539fb2a8791951861863a60e49a9c350c334a707a262c557c5f33a738ead743f522dfe33fc2cf167fc1207e17fc3bf09ebd677fad68f2c115f58c32033c0e8662c1d3a8c6e19fad4bff04b26137ed89a2a775b4bc3ff00908d7f365f0257f68cbf1a8d87c11d1b50d6a2d3b6dc5f47656ef71e4ab1da19d503100918ce2bdb74ff00dabbe38fc22d723bcd4ed6eb46d4e0c8f3364b6932e782037cac2b4ad819a73e4d798ce9e393e47356e53f5f7f6f1bd847ed75e3d9267da17537072718c2ad7e687c47fda72dbe1dc1259f861b75db290250090a7dbd3eb5e53f10bf69ad77e2ec875dd4e6906a17a0c9712cd2179266e9b893c93c77af973577b8d76516f39ca13f367bd7a1956027ecd29e9638b32c7c5d5728f53cf3c67e3df117c45f12b6bfacc8d3dcc98fbc4b1cfd4d55b0b256d4629353831b4873cfcd853cff008d3fec6ba3f898c4c30bbb8278186e86ba4b3b27bcbd92e37ee24145c0f9541ea493d4e2bd78c147dd4798e4e4eecef16d2da7bd910708141155ae34b8c9da9f8fa5241205ba6dc48c281c55f92e479a61cf04640ae69c15ce8523967d392ddc4ac039439c57257ba646d70d28eadce7eb5e8b3af9aad19e33e9587a8584b15b43b170dce7d7d694742668e3a6d2912dc348793c8f4c561b5a5b97dadc1aeba590456a44bc31e95ccc92e652bd71deb477b19e84115acf6932cf6d232e0ff0b11fc8d7b0e9be38d62dad92dedafa6824419c87273f9e6bcbd70a77038c76a6990890b721aa1ebb951763d964f899e3bb772d1ea5f68238db2a03f9115c67883c60be23d49afb525105c18d14b22e3257ae47bd71e970c1b69cff00f5eb3f5091646041393d735719f464d47d51aebaf4b12b5bb3fc9d79ebf852af88a666db2bef0bc29f4ae477aec2922ef1db3dab3cc6c18347c56d1688e67d0fffd3fbff00e22e9cebfb7bf812286de480cba15fe3e6c93861cfe158dfb6c86d13e237c21ba0c25917c46d907278f24f1e9d699fb43fc5cf0a785ff6f7f87fafddde20b7b7d0b518a42a779566230085cf26be44fdba3f69af0beb7e27f026b1605cc7a46b82e1a49bf771ed28467825b1f857d0d4b28c8d61b2b1e73fb717c62f15c9a8786a1d6b49680a6b76c76c2376d1ce08c139ce2b9cf1d7c6cd0dfe3178034cd70359d8c724dbd997e663e4678c73d78e6be4bfda7ff6add23c7179a64de1c71753586a315cfee10a21299017cc6f98f5af89fe2afc6ef10ea7a9d9f8975268ec1ec1de64fb37cf32e54e727279238a7fda74a1cdd5e86553075276b6c7ea0fc6afda4fc35e12f8d17f368173f6532e8f1a451cc7186f31be76039e73c2f5afc0df889af788edbc37a86b3a8cef3dd4d7b29f33273f3b13803d2b56cfe3d43e26d52ebc4f6b6ce6ee77752d780caf9273bf9e01f4f4acbb643ad6a518d76475b591cb48781b4752467806bc5c7e632aacecc2e0d411ec7e0bf18786ecfc57a1d86bf6ff006996eb4bb7589d8e0c52f2437bfbd7cb5f12b45d727bb43a5ab5dfda1e57458417c61c8c363a1c8afa0ffe1647ecf9a2eb1677460bdd42fed614863f25036367400b1c6ee7b2d6bfc42f8ebe08d03c3096de1dd08d86a5365b6dcb077894f7655f9431eb8eb5c4a0f735968ec7c07abe8be2fd174e8a0d7ed258a71248583a9c05206de7deb8e48ae198b3028457bd7863e28693ad78c5746f1c195ad7503b6794f3b73c0603b6da93e27f817c41f0cb585b278e3bcb0b91e65a5d2f292c67a107a67d454eb6ba125aea7e8fd87fc1683f6b67fd9b2f3f679d4e2d22efed5a41d117599606fb7ad994f2f6960db5db6700b0f7eb5f587ec7ff00f0567fd96bc05f0efe1d43fb4cf822ff0052f1b7c23b19ec3c3dac69ee195a1910a05742e982570a490c3b8afe761efa6930648235cfa64573b77acdbdd5f9b7b21b303a75191c1af1eb6534677d2d73daa59c578b577748fe9dff00637fdbc3e0a47e06f090f13ebd6fa46bf75f18a5f10de594ec5041a7df2488657908d9b17ccc3735f6efed5ff15fc0ff0013fe01fed71ace897d6bade9505e685676ff00669d5a396282de004c6f19395dc4f238afe2c6232229695f915bba7788f56b4b59b4db2bb9e286e4012c71c8cab200720328386fc735c157208b778b3d0a3c43251e59a3fd0cbe0c6afe1bd5fe37df7817565654b1f02784f5c552d951f64f3b6e01fee90327bd7e7e7c56f1ac9e29d17f636f12c370d2aeb1e38b99cb38c16592695bb67a66bf9c0f835fb66feda7e03f145cf8b7c21e25bd9efafb485d0a49b510b719d3d73b21065c90a993b71c8af63f13fedd5f1ab49f09fc1ff002e9565327c17d446a5a7ddc3b83ce0104a4c0b11cf2090075ae359155854e65a9d72cf28ce9f2bd19fbfdf01646ff0087937ed8f3e080ba04383f480d7b57ec2dabe9b71fb137c2ef869acb28b6f1c1f10e92ca7a3bc82e1947fe3a6be22d07fe0abffb076b56de37f891e06f066afa27c52f893a60d3b510c9e65bcd28899158ca24da15739c8404e0645793f853f6a8f87de05fd993f6651e1bd7ed67d57c23e3e235bb38e41e75ac3752cb1e655e30a564ebd2b8aae166f4716b647653c5413ba927bb3f427c7da0b687ff00058af817e1f9339d2fc0b71011ef1a4a9fd2bcafe02691258e87fb6f6a16f29dd77797e549fe13e45c0e3f3af61f8afae5aea5ff0005c9f84f0d84b1cf0bf82ef64578d830233372082457867ece3e215d67c15fb6dc76aaed2db6a5a8a6dda727115c72075238ac69df935edfa9a54b73e9dff43f22fc5ffb63783750ff008251e99fb19da25ea78cf4dd5d2f1a76897ecb243e7c921dae189042b0182bd6bfa29ff825bd945f0fbf618f85bf09f5e50d7de3cd3f57be7cf0483973c7ba3815f86de35fd98be0a5affc128fc29fb5269fa7c91f8c351d58594972267f2e58de7953062276e70a0022bf77b42f0c78f3c07f1a7f665f0de89a4ddc9e1fd1fc33736d7d77144cd6f04d7169185591c0c292538cfad77635d3f66e14fabd4e1cbfda2aaa5516cb43f922fd8b3f6b1f8d5fb0bfed7fac7853e152d905d7b5b4d0f518af60f3774097a5004c302ac327906bf7f7fe0ba3fb6cf86be0de8f73fb2deade07b2d627f1c786e49a1d5dca09eca6794c60aab46c481b7390c0f35fcfe7ed0de0a8fc23ff000563d77c2f126c483c790955e9c4b76928fcc357df9ff071b46fa87ed81e0ab151b8a7865381e9f6994d7555a30a93a2fb9cd4eb4a9c6b2ec6dffc1447f640f817e17ff8275fc0bf887e02f0d59691e2dd7134f82eb51b65292cfe6da6f6f330704b39049c66bea7b9ff00822b7ec2ff000e3c13e0ff000a7c6cf8a379a0f8d3c490462dde79ade34b9ba6552c90c2ebc85660a32f93c773527fc14be30bff0004fefd9a74cceddd75a48c0eff00e8883fad6d7fc169f4d8b56f8f7fb3dda8b848a48264211f3f37fa55b8e0807d2a618bab6e484ad793379e128fc738ded147e217ed7dff0004cbf89dfb3dfed85a0fecec2fe1d4d3c5d25b8d175260628e54924f280907cdb595f87c64771585fb4eff00c13f7f68cfd8f354d1f49f8bda740175f95e0b092ce759d27910a82a318218ee18040cd7f44fff00053fb2b9d47fe0a31fb35450c66448eee32cc0671fe98879fcabe82ff82cdfc3b8bc6ff067c11e30b35124fe18f19698cf8e4ac77722c4d9fc4a9ad239ed58a8736b76d321e414a4e6e1a5b547f175f137e117c54f833af0d1fe2a787eff00c3d7570bbe28afa0684ba038ca6e1f30cf71915e6325c08f9072735fd0a7fc1c71ad4abf1ebe1a68b18c81e1fb872d9e99b8c7f4afe739a7201933ed5ed60313eda9f3b478398615509f2277359aeb1919ce2ab5d6a3344b1dc2b10573efd6b352505f27eefad4b135bc85a3b8fbac339f4aea5a1c57b9c85d497534ed230ddcd46d1cb19cb8f9eba0d4045092900ca0c104f5ac6732b36f7c9c74a6e4ccd211d49033ec08a8c9546c9e4e6a56478c06c7538fc698d1868c32751d6a2c53644ac8e777e38acbbc232080783573193cfe14b70aa63dbd7be68b19b3024281828ef4c2a49c8ff38ab3346adc8e82a2e80fe15ba96842dcffd4fca4f8b1f1efc4dabf8f6c3c437f73168f716b1491a3c2fe6ba23f5ddc9c935f36f8cbe225c6b93a98e7b9bc937f98d25cb16df8f45ec39f5ae2a1f0d5ede88fcc8d9dbaee60768feb5d9e97e13315c2413485c11c84ed5cd3af52773dd8d08c12b1e73aaeabaff88596c6e64d801ca43180a01fa0a6dbf81b50bc2b1defc9bf8c3f5fae2be8b83c39636b711bc51a82a78cf2c4fa9a9752b2b78ef91e560b9f53c53541fda61eda3d0f0183e1ce95a3ce7e5f38819e9815e69e22d227962b8b28b285c118fad7d23aa795f69711c85ce0805483f8578cebf7d756f31109dbec473454691a415cf23d1fc1ebf0fb4e8668985c6a37a865f3d80c5bae4a808bcfce71f7bb76ae7efb465bb25ee2432b3724bf2493f5acff0010e97e26b8f142ea4d36d850e5407278f42bf5ade860d4a4077152c7d3ad4f3e86696a7956a5e135b5d6c6b2846d11ecf2f1dfd735ed1e11f88d18f0ecbf0ebc7b1c777a34eac60691b125aca149578dfb0cf057a1ac3974f2a4b5c36077cd70de27f0c41a95b2a40e63dd904e3a8fa74a50a8c895347092dbab484c6495ec7ad640f0fc31ce6e625c13d48aedadbc38f691ac2d3b10a31f30c0c55e974b8a3c7920b63bd0dea2686f84b45f0bb5a5cdff008ae475485a354443cb6ece4e3a9c63b57ac697e32f853a1aeed2f4796561c0662aa4fe793fad7cff002f85b599f55fed08ae01453c06078aeb343f0ede6a9ab41a6a480c93c8b18246141638c93e94d221a3e91b6f8d50c7a4dc5dd8e95058c6aa5164625e42c7a05f7af99ed7e285fc3e2a31dcc41cb1de5f393c76c7a56c6b718927fecc42560b525140ee41c163f535e7f3786dd7553ab44e09dbb429aa7d8850ec7defe08f04f86fc5f7561f127e1cdf2462d5b76a160c46e43820b20eb8cf6af9f357bf93fe109f1a1619586f622bff007d13583f0686a76df11b4e3148620ee4384c8dcbb4f07d457a0f89f57b0d4be1578874816b1c335adeec7993efca1dcb0dfeebd05675526547991f3ffc32fda37e2dfc28f1bd87c4af87be20d434cd774d8da2b5bc8a7632431bfde44de5b0873caf435f76fecb7ff056cfda5ff666f89fabfc4586e6dfc4cbe2325b57b1d4e3c457658962ccd1e0abe58f3c8e4820d7e60c9a55c2e52dc061edd6a2fecb9626d922907deb1ab83a53569235a58cab07eec8fdf9fda6bfe0b2165fb62f843c23f05756f87f6de11f0b69facdaea37f1e9b3ef6730be71126c4555f998e3a93debf51752ff82d7f833c47fb50f84ac7e1178be1d2fe1de6c2cb54b0d674ff0025c0672934897193b0c60ae7276e0715fc74f86b4b96e3558521ce54ee3f41d6a9cd7b2c12ba23672c783ce79ae1fec2a0d28db43ba39ed7bf33dcfdb3fdbc2fbc11ac7fc1656d7c49e01d4ed757d2bc43ade817d0dd594a93c2ed29855b0e848cee539ef5f41ffc1c313b7fc3677865e2cac89e1a85430f469e5afe77bc3d7c9a4df43acdbeeb7bbb59164865898ab46ea72aca472083c823bd7bbf8dfe3778cfe39789348bdf887e20bcd7afed218ecd66bd95a591230e484dec49c0cf1571ca9c1c2cf4884b348cd54baf88fe993fe0a917eba5fec79fb30d86ddeed7da5a807febda119fd6b7ff00e0b13716d75fb597ecff00a45c3796ed244c8c3d7edb08c7e35f897fb5dffc1413e277ed01e01f047c20f1569b61669f0f278e5b2bcb4deaf279512468244624646d072319afd85f0eff00c1433fe09bdfb61daf817c59fb5dc177e1df1b7833ca9219c89becde6c4cae48921dd98ddd436c750474cd7853c2d4a76a8d5d5dec7b90c553a97a6a5d11f407fc14435c922ff82a0fece7a504dcb24a9939208cdd1f4fa57dabe3dd42dfe39fc50f8bff00b33dd8f367d360f0feb16a8c7bfcae4afd1e11f9d7e397c5ff00db27e097ed61ff000554f8437df0cef7ed7a3f87ae60b78f516531472ca5de57003e0ec190031ea6bebbf0dfc5b8fc31ff0005c9d7bc2266ff0047f13f85aded060e55a582159d31ebc2b7e75e757c2c9c23756766cf4a8e262a72d74d11f9b7ff0007165c87fda5bc0d1e40f2bc38df5f9ae5ff00c2bf9e777e011d07b66bf7effe0e1a9c5c7ed4fe148b39f2bc3ab91f5b890d7e05470c613e639ef815f4b904bfd95367cc7107fbcb4572e581f41d7fc29d22b1019b1f375a984657084637530808d83c81c0cd7aed9e2a316f5db728eabd4d316e91612a33cb7156af9479981c2818c7ad65465ba7f77fad2be81645979d648877d99e077359be64ae338238ad4b1848ba909fe0527f4ab71206050f402a3da25b8f91b31950b154233818e2a5163732a8dcc00615a6d1c6912c69c6de6a2d81972724638fad672a9d8d153ee632e8f7f20c2a1207a55bb6f0c5f4f877fdda9ce49ebf954a19e0f99188e71537db6f2252a1c8efd69fb49740f6503fffd5fc6eba8da27daea3d3818a7cd6ff00634499b193d38e7f1ad66449ed9d0c872393dfff00af5c85f5e2c2c13ccca9c8e39a67b8f5449a8ea92411aec080e782b5c8ea57d35c39128073d73dbe94f9b50494f9316179e71eded58f7f344242a849651c9f4a425039fd63545b4c80986c70cbd7f115e6ba8eaa97019a640e3d57835d9ea4ab34257800725bbfe75c2cd0ac7ba271c91c13deb96a7666b1d0e5ee60b79f2d01c1ee5b83cff3acb9e21002633b76f435b37716f05c2eef4dbed588f33c719392fb7ae4715815a1892b4b3a941cfae7fad4525bc4d0866f98af1c74abeb7105c361d41c7502a3096c3f78c0800f19ff000a7715918135a5bcdf7c918fbb9e2a07d3c6cf9c1c9c74e9f8d740d0348fe647fe20d5325e46d8ff002e38269b91328ad8c036f2a304dc30bdab91f126b7abf87de0bbd19196447dc8ea33823a71cfeb5e9b2b42f8f350314cf3db8ace6b65b82114704f19a51a81281e756dad5d5f5b2fda6061238dcc48c6e6ee6b452deed9301791dabb09b4f7824f31c6f22a8dd1de9b9d769edeb57ceba19f2f438f9bc57acf812ee0d774b03ed11b128586e19c639152f80f55f11f8f2db58f0aa7931c9a938bd9a694950823206154039c96e2b625b3fb47128c851cf702b89d5fc4a3c29315d30a9372be4ca00c3ec241e0fa702b58d9ee632d0f71d2ff0067495407d4f535dc7b26d007fdf4d5df69df00fc391329b9bb8a523af99303fa0ff1af996dafed6e30b1cafcfd735df685a68b784eb9a9b916d0745fefb765149d85b9eb3e30f0cf82bc2568da7411c66770007b7ca367d0364f1eb5e513681a7e9ba744f15a43756a5b1bee1373ab9e4a97520fd2bcb3e20f8af5bbd8e6d511cc58e1707ee8cf415e8df023e20e9d1a8d0be21fefb4cd4936492b758dbf858fa63d6945cafa1328a5a333ef349f086d2d3d8bc258fdeb79b23fef9707f9d60f87be1ed85978a2db52d26fe428d32318e68f071bb38ca922ba8f8d3f0a355f045fa5fd8486e34cb8f9e09d0e55d4f2391c6477af29f0f6af7961e21d393cc660d3a646780335a394ad612847a1b1f132e58f8eef210c40127f4159eba84c711330c773eb53f8e6ea2b9f195ece0757eb58f0bc2586d6c01eb5149a4b51cd6a5ebff11ea1a6c5f6ed3c98a68b051e33b597dc11debb9f865fb41fc5bf03f8df4ef8a9e17d6af2dbc49a53e6cef59fcc95005da065f7646d2460f18af2bd453e5099c93d87614ed3769901c6028a2a284b743a73947667d57fb447ed43f1a3f6b0f155878d3e375f47a8ea7a7da2d924c912424c48c586e0800272c79c57cf7248bbb807ae063d69ab2f9443b1c96efd68fb4189b24e08ec47535853a5182e58e88d6a5694df349ea3ddd849e4e73b4726a227955079f7ed4924d951bd467b9a8be505813ce3ad045ca779918c8f7cd670c43be51c83c0156eee7f36448a3396da78f7aaad1a0c2b1fbbc91ef4ec05cb056db3c80670833f8d584731b7f3a669ce05bc99380e4673f5a99a22a1dc64648c62b9a5b9d10d8099094418e858d44a3f741718e6a52b8c38ebf76a5116e2c43631d2a5450fa996738273939aaef838c9e0d6c490a23089802c791554c485c6ee4e79157d0991ffd9, 'image/jpeg');
INSERT INTO `service_spaces` (`id`, `name`, `url_name`, `imagedata`, `imagemime`) VALUES
(4, 'Plant Phenotyping Demo', 'pp_demo', NULL, NULL),
(5, 'Plant Phenotyping', 'plant', NULL, NULL),
(6, 'Honke_Demo', 'honke', NULL, NULL);
INSERT INTO `service_spaces` (`id`, `name`, `url_name`, `imagedata`, `imagemime`) VALUES
(7, 'College of Engineering', 'engineering', 0xffd8ffe000104a46494600010201004800480000ffe1181f4578696600004d4d002a000000080007011200030000000100010000011a00050000000100000062011b0005000000010000006a012800030000000100020000013100020000001e000000720132000200000014000000908769000400000001000000a4000000d0000afc8000002710000afc800000271041646f62652050686f746f73686f7020435333204d6163696e746f736800323030393a30353a32362031363a30373a3533000003a00100030000000100010000a0020004000000010000012ca003000400000001000000c80000000000000006010300030000000100060000011a0005000000010000011e011b0005000000010000012601280003000000010002000002010004000000010000012e0202000400000001000016e90000000000000048000000010000004800000001ffd8ffe000104a46494600010200004800480000ffed000c41646f62655f434d0001ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108006b00a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f4e7da59bdcfb19556c206e78d350d3abb7b3f790c665278cba3ef1ffa550baa37760e48ff0084aff2d2b1db580a486312164f55b295177bed757fdcaa3f0ffd2aa15f51c4b4d82acdc6b0d4f355a1ae69db637e9d5645becb19fb8b1db587380f1207deb17eacb43b17a8de3fed4754cdb3fe9b59ff007c4ef6858168e2f07b5fb653ff0072a8fc3ff4aa6fb653ff0072e8fbc7fe955825aa25a8fb23b9571f83d07db68ffb9747de3ff4aa5f6ea3fee5e3fde3ff004aae74b144b11f623dcab8cf67a3fb763ffdccc7fbc7fe954bedf8dff7331fef1ffa5573458140b3c91fbbc7b94719ecf51fb4317fee6e3fde3ff4aa6fda18bff7371bef1ffa5572c58a25897dde3fbc55ee1ecf57fb4717fee6e37f9c3ff4aa5fb4713fee6e37f9cdff00d2ab932c512c47eed1fde2af70f67aefda589ff73b1bfce6ff00e954bf6961ff00dcec6ff39bff00a55723b144b12fbb47f78a3dc3d9ebff0069e1ff00dcec6ff39bff00a552fda985ff0073f17fce6ffe955c79afc944d611fbb47f78abdd3d9ec0f57e9ede7a8e20f8bdbffa595b6bacf5363c822244023bff0059cbcf3228058ed3b2f44ff0ff00d8fe2a2cd8843868dddfe0ba1232bd1fffd0f47ce138b903f96cff00d14b3035697512e6e1e4b9bcb5ec3f77a4b25f6ec64b41707096b888feaeefeb297190226fbac90d53d2dfd357fd66fe5581f5306ffab78f6ffa6bb2ac3f3bed6ffdf16fd360dbeb76602ff9346efe0b0bea43a81f553a6562d61b3d27b9cddc2417db6d9ee6ff00693ef51e48ad1d7daa25aad3a8bbd236b6b75801000689264c7b63f7154bb3fa6e2388ea390dc42d1b8b2c7343e3e1b9db7fcc47dc88357a8570959c0012e21a240926049fa2dd7f39ca2caadb6c1556d2eb0f61e1fbdfd554faae77d5feb989574ec5ea58f5b597b6eb36cbdc03058d76d6c3f75dbdecfe73ff003057f01f878f48c5e9e4574970369dff00a57692e758efcdf70f4f657ecff44a19735c26b87caff82f1881fd241d7adc6e898345f936fe92eb85461a5ec6fb1f66d76cf7fe67f38a8e2f57c2cbd297b2d3dfd27027e753b6d89bfc63cfec4c4d207db047fdb57ae12ea2b1656002dde0193db58dcde108e69ea6d71c51d3f96cfa30b2971da1e03bf74e87ee7291afc42e031f3faad0e355192e7b582435e43db03c1b76ff00faa5b9d37eb15471d872aefb35e6779da452449dae6b9dea31bedfa6a61cc57cc298ce3ad41b7a12c4db16551f5afa73de6bb2c64b5c5bea1f635c01fe72bb3f4943d8efec2d5ab3312e6ee65836fef1fa3ff6e37757ff0049491cb03b15a6046e162c4db15caf16eb803556eb01e1cd12dff3fe8259b8df60c4b32b2ecaea65604b0b86ed486ff53ba71c911b940892d22c512c46a6ca6f687d4e0e044fcbfd7f7548b1112bd46a8a6a5954b0cc05dbff0087fec7f15c8bebf695d77f87fec7f1507307e5faafc7d5ffd1f48cc8fb3e4023702f6023c8fa4173b6dd5398e7388690d6b5ed1f48c1d8d7bc7eebdbf47fc22e96f00d57823702f6c8f956b9a65f8ecc96bacd8eab1f24fab00bb616fb2a73fdaef7eeb5eeaead9f4ff49ff0884a55036401afcdb286ed8bbf43d33a83cd936578d90ed83961f4deef7ff29bed62f1fc6686d1547b4ec6ea343c792f52eab7df7743eb192d1b6b38f93739cee4b3d3b5b453f9adf6eef7b7f7d79bb7a675214d6e18b6b9858d2d735bb810402d3ed4d8cb8e375e5fdd5f1001fa27e97d5ba8e2e6d25b9770a03836da4dae0db1aef69add2e5d3f5be8bd1466dc063ee2c6164bec703cfa4edfb7e0b8c6576d19549bd8ea01b1bfceb76cebdbd4ff00beaeb3aef55e9edcfc869ba1ce7386d0d7f67bb737e8fd26fee3958c15ad9af362cdbe9f83530fa66063e4efa6af4ad7904d8db5c1c27df3b67f3ffe9a3ddd2e8fb2bebadd6d0ef537bed63839e4967bdadddf419eeaff00eda43a32b15c69cf0e6973bd9ea473b3415bf6377fb7ddfce2b7eb535e3936bab0771d8d71da63f3bdee1f9beef7aaf9a5738915bf090243d538cf87f9712e80a89dfece85c1cbbb3eb7646364655b7d02c6dacaec2768243855e931c5eeaf632eb99feb5a587881f43ed7098d59060882d76e6ebf9ffbca39ccb33336f3881f94d66965950360dd0df6b4b377d09fce57715d6bad607d4fadadab639f631cc1a01ec68b87bacf77a9bda9b9ac465206a8d8f11fd56489d0346d65b438bdef697968dc1fc924496b00fdcf62b989d372733a3938f6561ce2eadb5d92d101f2f9b59ea7d269ff00469afb302eea6f392e6d95398ffb3d4c79647b41a9ff00bcc73acff04abd56e562746b3269cabb1edacc9ac387a73b9cd739d8f6b5f5b5db5adddf413b148d6a77089815f635db51a31df896b1a72697b584b758d9babb5ac70fcc723b76d0e7df896160aee68ac349daee5cfdc016bacff06c720d7bb2f0efea16da3d5616bed6edd5eeb1cf05ecf4ff00475b59e9ef562cc5c86b2e692dbdf8cea88731dba7d615ec631cedafb7dcff007ffa37b11bf05d5e2dfafeb5752aecb0e3b5b47a60970658f6b6c0d3fa4b76fb7d26d5b5ccf77adeabff00e296a63fd716de0e0750a1d4d991fa2de61a1ae746cdce86effccfd13aafd27efae73aae560e4e6babc2c77559557a8dca68ac0dc07b8fbaa2f6dde9fe9fd47aad4dbbf2b185cff4da2faeddc748dbb763bddedf7b595b5385710f021657a0f9176bea79753d7fecc1c763d990c2d07da4b3ded76cfa3fe0d7706b5c4f436b29fae9456c76e165b7378882faeedccfecd9ed5dfba9735bbdcd2d68e5ce1035d3e91536235123c4b1e4d483dc34df5fb4ae9bfc3ff63f8ac2bea3554eb6e1e956d12e7bfdad038f717c2ddff0ff00d8fe2866375f54406eff00ffd2effafe43717a466dce121ae60fa459ab8d2c6bb7321dedddf43fc27d05ccf4dead5750ea5e8edd973ad6dbeb12c21a2a66fb9eefcc63ecb1d5ff00995ffd6f5bebed2ebbeaaf51ad8d2e26dc63b5a24c36ec57ba07f55ab83e8df6ae91d55bd4ee2e6e374fc7731bbdaedbb8d6f6d6ecada3d8df7b6df536fe9ac50ceccc478b490a31f39246de4f57f59b36aa7eab755adb6bb2eebb1ec659611b43439b6105db46cf57f47b762e5adebb8982daf16c63df632aa816d6018fd1b1daeedbf9a8fd67eb132ee859f80fa0b2eb697bb7b4fb499b5df45c37ff00da859797d3acb7272b3a58ca6aa6b7b1f66e8712d66254c1b5befb1b92eab7d5ff0009ff00189d02784709b24d24817af65ba8e4e2752aaabcfab5b6b3686490c21c1b5bf7376977d16fd1da83d3317a58b458400d0d26d2f739d325c1ae735e5dbddea3bf756a61fd55ea399d0b707d74db8f7decc8fb5914ed69632bfb41f443dbe8fa81f5b7d2f5564b71a8aedc8aebb5b7d0cdb532c66f1b9c05791ea45a1bed7bdcff00d1fe8fd2fd1ff389fad6bbf88fd8b48ecef518781434d5535ac1c87f816805ccb2d76efa5f9e87761e1e48fb43839849683e999644435ad6eddbed86b3fc1ffdb8aab732dbba955631fb4b9c046e2d07786b7e97f34dbaaf4fdafb1069cacf18de960576dd45cd696dcc6170fd1b5f533d0dcd6edf59eff7fb944211123326ff00adf2fcdaaed6ab674ba753562e7e7e3d20868b01971f7173aba5dfa49f6ff9aaedbd431bd3706e431d6805a2b0483b9bf4d9b9f0dfa4b068afeb53726fbfec36586e87173c3185ce0d657f9d655b1bfa3fdc4cde9fd7c641b2fe9ed6545eeb1e5d7d5201f77d1163ff00cd4f33c4450c801f3e2fa70acd6de889a2c699b282f643b63cb438ceef1fa1f47daaadd9587874b9d6b3d3a48f51e5b51757fd670adaff00dcfdd58f974fd63ca22cab0ab630f3bb26a3301cd3b4b1edfdf45cf6f5fcbc5b71bf6606b2c6399ea0c9a5c46e047ef37f7908e5c62c7b9127c4851742ac2e9bd4182ea58d35d92e0e6b8d12013c56e357bb77e6fa691e854371edb83af6349630b8d9bbdc3f46c86bc3bdccdedd8f58f6d5d5fecf8b58e9b797d0f7be5a5ae0e0e059b5aeacd9f4bf3d5b197962afb4df836b1f4d226988b6196b2aafda19bb6bdfbfdffe8abdff00e0de9fc70274313e5f8a813dcadfb27a7d996ecbc4cb2cbc879b5cd7b6d686b87a71e9b5cc755bb73bf3d032fa4d8fc7dbf6e658d0297b5bb4ee2da07d9ea2df7bfe830ec59bf6ebda331a71ac61ca6398c0d6966c2435ad7436bfcdd899bfb4c32b7fd9322c63711f8af2e6d9b5ce717bbd7fe69df47d4478a1bd85711aa74faf62e70b733a9e35ada9d5eebd8e6b9cdb184175e1cc735bf49bfd6576bfaeedeabd233707aa9f4b3acc7b3d0c96c8aed781beb0e6ff00da5c9decf6ff0080b1ff00e8573873eea3a63309f8d2e7556546c738b480e3637e8babff008458ff00ac376ecd8e88dcd2e1ac76fa4d7212e1975f15d0991f93d7744bb3f23eae753fb6e45b66364d0ff45b6975bef07f4990c2fdf77d36ecf4dbfcefd35ed1ff006a3fb1fc5786bbaae133a354c64bad0d22d6346c35c1f4eb6ed739b57ba5f7535d165ffa3fd35bfa65ee5fe1ff00b1fc54788cc99990ab3e91fd55d33623adbfffd3ef7eb1582be9198e276fe92ad609d4be81c3571efe9d91982d0eaad7d791b3d4019e9348ac6d60f56e7d0fd9fe97dffa5f62ee7a89230f29c1db76b9a4bbc00f48bbc3f35713775dc8b08f4036a63b50f7439f1db7cfb772a9cc884642729481ae10200717a4f17cd25357eb6e16457f567a864dcda810c6b4416bac05f6555fb1cc6bb6eefcff00d2ab9f5846163f42c965f946f0c6d6e1562b6b639ae6babf49e373b63bd27ecfcefdcf62c5facf956ddd13305af75876d63dc74136d5f99f47fe8a5d7ac03a564bec21a2ad96003592d73432a6ff005bff0052218728e2c2220913c928fae72e9eda09d0af95d6312bfabd855556655cfcab999b78bb73da68aac34b9b36fe8bdb91fe069fd1fda3fe33df6306b8e934cb9963c59f6e70f49ae79bac78ca76bb86d7b6bf4ebd9fe8fd8b27231ea761b5ae73b66374ac72c22769b6e7fafab776d6faacad8c5bfea32b6b69008d2009681a7d2dbed4ee7320e181048e39132ff16193fe8e654646fc92bdad7faac7b5b6577eddec0d2c043437e8ec77b3d46b7f4bb7fcc50a2bc9634575d75866ae76d2f92f3abec15fd06faaff00d259b506ab2a6542ad5e691e9b9d20eac3e97e9086fd3f6a9fab4f76827c25d323b3be8aa52991703d0fe5e94db65b5641d453bfe6e80a36b2f611faa831c4bc8fc21527518373dce7d1597705e771307cd8e562b0da99b696068274680e2278fcf7fe726823cffc155accb08f73f15cc24c11be3fefaeff00aa526df4900bf1ec6fc5ed27f10a5b9c1c36bb6c760d09cbad8265cd8e48db03e28fd07d8ab28453d3838bc5160ddee32644fddb589df5e0905e197d646c01e1c6637fe6169fcdf52cff003d11c6d125d6068f19109edf5aa603610007b353db5e784f8137a02743d122d10fb308fd364d73c1dce9fc4d89a69690e667e403d89dc47cc3bd8acd60be9becf53dd40612d6ff002deda7ddb47e66f6b905cf693ac7c4871281d2891ba162fddb5cdce0e247b8bdadd403ecdbb0d7b79517d38d698b1f4d83b87b413ff82296e69e403f1684d0d3a866df0fefd12b535b23a4747b30b298fae98734381ac8aa4b776df53d0fe7d8ddff00ccaf50ff000ffd8fe2bcd5d2c6b9cd21848edcfdebd2bfc3ff0063f8abbcacee2627f47fee94ff00ffd4eefeb45eec7e83d46c60974b1804c7d334d5ff007f5e74db1dbe371dad0034797d105e577df5cde19f56fa8389db1651a9d39b31979c8c8adc0b86d20032ed6440f0dcb3f9ebe38f6e1fdaa575c31d1b2819322a0d275ff0d4fe72b1978d564b5f8f7b05b56fd44b9a0913b7df5fbbdaefccdc85f5830b2eae82722ca320b729cc6d01ac2f90c7b2f73eed87f57ab6b3f43edf7a7c4ea14e532b3bd94db6b779a5e65e0c9dd537d5d9eb3bfe2d33832470e3980470ca52b1fa3c5c1c32ff009a8457f496bfd8326ca00ad94fa4d0d7b0b2968653fbb63fe97b37bd1461f51637637abd9a68d3e8b0998fa3ed77bddaa317b24c9dc468660347f29db7faa9d9652618d73091a363e8e839734b77261cd9240032e21fd61197f57f4a3fbb14d35bd1eb6d68b0f51aac749019663344ff005deddaefa4958dfaca3dd5d986f6b4490d0e68fed6ef67b55d2e6869dc46ddb33238e3711fcaf7a7711b800e064e8d71691a8eec0d77d1fdd484e4752227ce31534abc9facc1d2fc4c5b0b752c6bdb5bb5fed1456f50eaad01cfe94e20ebedbab275f25618ea4b01915874183b5ae93c69b7e93d4cdb8ee710d21c0ba0edf23f9fb5a367d2fec25c43ac63ff003bfef914d7afa8e73e18fe99733b971b6a0d83e2ef62b14fab640763bea822373d8e9f2dd4bddfda4ff686ba4b6041120eb04cb5bba3f94126b83dbb9d6b5f5bbda035c0363f92424483d00f2e2526f4c377196bb8e47b4ed3b9a76bb6edf729d8f7e9b2d731f10030b4348f9b7f47f47f3100da1d264024e87c87d196bbf9281665e2566b0ec8ac3dd2e6d65c09740fa51fbbb528990f9490b812364fb5c2ac9a6abe3ed41a0b8343dcc2db1992d735f2d73fdf5fd1ff0044a2e3901c5a2c0d133b76be0796ef59db93639c9cf70a3a7d17643ccedb1d53eaac37fd259758daaaff00c137ad2c7fab9d5ae6d9f69b28c06cfe898d06f7f9bdfb1cca9bfbbb7d6b14bc19a75636ea400a367773c0b8377389249d000e1ff54e2856e553501eadbb6481f4bb91206c6ef7ae95bf56ba4066dc875d94e92775969673a1686637a5ed72bb45189880370e8ab1c34403531ad23fb63de9f1e54fe9480f2453c93703a9e654463e1e5091adb7edc6af513ff6a87aaffeab2a5e9dfe1ffb1fc57377da0871264c724ae93fc3ff0063f8ab58b1461757af753fffd5f48cc656e65955f4579555ae0ef49e3703b4363731cc7b3daf66e594f662b346fd5fa9c06a36b6affc82df7f6e3e69bfcd4d3c1fa55f553817660b8017740f540000de2a768386fb9aaad8de9af2d367d55a9e5bab4baaa0c7f5658ba9ff00353fdc9da29e6bed58f047fcdc10753ecabff2291cda3ff9dd1fe6d5ff00915d2fdc9fee4dfd5ff57f053cd0cda46a3eaec1f26d5ff91516e462098fab6d1220c329d473fbaba7fb92fb92fd5ff554f3232714191f57003e21957fe4549b99434437eaf40f00cabff22ba4fb92fb90fd5ff554f37f6bc788ff009bda1e46cabff2290cac61a0fabc20f3ecabff0022ba4efd92fb91f47f554f34ec8c576aefab81c78d6ba8ff00df541b6e03276fd5a636798aa913dff717509bee4470f4a53887af64b843ba45c40e012d297ed9b8ff00de35bff416e7dc9bee474538a3aadc7fef19ff00f4149b9f73bfef1dc3e26bfee5b3f7247e4968a731960b86db7a6b1ad3c87ed23f06396857bdcff50c06c40824f7f36b54bfcd4ede3b7c9253ffd9ffed3ac850686f746f73686f7020332e30003842494d04040000000000071c020000020000003842494d0425000000000010e8f15cf32fc118a1a27b67adc564d5ba3842494d03ea000000001db03c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c6520436f6d70757465722f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d486f72697a6f6e74616c5265733c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a09093c61727261793e0a0909093c646963743e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d486f72697a6f6e74616c5265733c2f6b65793e0a090909093c7265616c3e37323c2f7265616c3e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a090909093c696e74656765723e303c2f696e74656765723e0a0909093c2f646963743e0a09093c2f61727261793e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d4f7269656e746174696f6e3c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a09093c61727261793e0a0909093c646963743e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d4f7269656e746174696f6e3c2f6b65793e0a090909093c696e74656765723e313c2f696e74656765723e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a090909093c696e74656765723e303c2f696e74656765723e0a0909093c2f646963743e0a09093c2f61727261793e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d5363616c696e673c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a09093c61727261793e0a0909093c646963743e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d5363616c696e673c2f6b65793e0a090909093c7265616c3e313c2f7265616c3e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a090909093c696e74656765723e303c2f696e74656765723e0a0909093c2f646963743e0a09093c2f61727261793e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d566572746963616c5265733c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a09093c61727261793e0a0909093c646963743e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d566572746963616c5265733c2f6b65793e0a090909093c7265616c3e37323c2f7265616c3e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a090909093c696e74656765723e303c2f696e74656765723e0a0909093c2f646963743e0a09093c2f61727261793e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d566572746963616c5363616c696e673c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a09093c61727261793e0a0909093c646963743e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d566572746963616c5363616c696e673c2f6b65793e0a090909093c7265616c3e313c2f7265616c3e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a090909093c696e74656765723e303c2f696e74656765723e0a0909093c2f646963743e0a09093c2f61727261793e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e7375625469636b65742e70617065725f696e666f5f7469636b65743c2f6b65793e0a093c646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d41646a757374656450616765526563743c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d41646a757374656450616765526563743c2f6b65793e0a09090909093c61727261793e0a0909090909093c7265616c3e302e303c2f7265616c3e0a0909090909093c7265616c3e302e303c2f7265616c3e0a0909090909093c7265616c3e3733343c2f7265616c3e0a0909090909093c7265616c3e3537363c2f7265616c3e0a09090909093c2f61727261793e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030392d30352d32365432303a33353a32395a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e303c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d41646a75737465645061706572526563743c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e50616765466f726d61742e504d41646a75737465645061706572526563743c2f6b65793e0a09090909093c61727261793e0a0909090909093c7265616c3e2d31383c2f7265616c3e0a0909090909093c7265616c3e2d31383c2f7265616c3e0a0909090909093c7265616c3e3737343c2f7265616c3e0a0909090909093c7265616c3e3539343c2f7265616c3e0a09090909093c2f61727261793e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030392d30352d32365432303a33353a32395a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e303c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d50617065724e616d653c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d50617065724e616d653c2f6b65793e0a09090909093c737472696e673e6e612d6c65747465723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030332d30372d30315431373a34393a33365a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e313c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d556e61646a757374656450616765526563743c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d556e61646a757374656450616765526563743c2f6b65793e0a09090909093c61727261793e0a0909090909093c7265616c3e302e303c2f7265616c3e0a0909090909093c7265616c3e302e303c2f7265616c3e0a0909090909093c7265616c3e3733343c2f7265616c3e0a0909090909093c7265616c3e3537363c2f7265616c3e0a09090909093c2f61727261793e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e303c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d556e61646a75737465645061706572526563743c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e504d556e61646a75737465645061706572526563743c2f6b65793e0a09090909093c61727261793e0a0909090909093c7265616c3e2d31383c2f7265616c3e0a0909090909093c7265616c3e2d31383c2f7265616c3e0a0909090909093c7265616c3e3737343c2f7265616c3e0a0909090909093c7265616c3e3539343c2f7265616c3e0a09090909093c2f61727261793e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e74696e676d616e616765723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030382d30352d33305431343a31333a32335a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e303c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e7070642e504d50617065724e616d653c2f6b65793e0a09093c646963743e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e63726561746f723c2f6b65793e0a0909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a0909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6974656d41727261793c2f6b65793e0a0909093c61727261793e0a090909093c646963743e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e5061706572496e666f2e7070642e504d50617065724e616d653c2f6b65793e0a09090909093c737472696e673e5553204c65747465723c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e636c69656e743c2f6b65793e0a09090909093c737472696e673e636f6d2e6170706c652e7072696e742e706d2e506f73745363726970743c2f737472696e673e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e6d6f64446174653c2f6b65793e0a09090909093c646174653e323030332d30372d30315431373a34393a33365a3c2f646174653e0a09090909093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e7374617465466c61673c2f6b65793e0a09090909093c696e74656765723e313c2f696e74656765723e0a090909093c2f646963743e0a0909093c2f61727261793e0a09093c2f646963743e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e41504956657273696f6e3c2f6b65793e0a09093c737472696e673e30302e32303c2f737472696e673e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e707269766174654c6f636b3c2f6b65793e0a09093c66616c73652f3e0a09093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e747970653c2f6b65793e0a09093c737472696e673e636f6d2e6170706c652e7072696e742e5061706572496e666f5469636b65743c2f737472696e673e0a093c2f646963743e0a093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e41504956657273696f6e3c2f6b65793e0a093c737472696e673e30302e32303c2f737472696e673e0a093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e707269766174654c6f636b3c2f6b65793e0a093c66616c73652f3e0a093c6b65793e636f6d2e6170706c652e7072696e742e7469636b65742e747970653c2f6b65793e0a093c737472696e673e636f6d2e6170706c652e7072696e742e50616765466f726d61745469636b65743c2f737472696e673e0a3c2f646963743e0a3c2f706c6973743e0a3842494d03ed000000000010004800000001000100480000000100013842494d042600000000000e000000000000000000003f8000003842494d040d000000000004000000783842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d040a00000000000100003842494d271000000000000a000100000000000000013842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d040800000000003800000001000002400000024000000008000000e00100001780010000009d00000024a00000000157000000019e01000023a0000000169c013842494d041e000000000004000000003842494d041a00000000035b000000060000000000000000000000c80000012c00000013004200750069006c00640069006e00670073002d004f00740068006d0065007200330030003000000001000000000000000000000000000000000000000100000000000000000000012c000000c800000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e67000000c800000000526768746c6f6e670000012c00000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e67000000c800000000526768746c6f6e670000012c0000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d042800000000000c000000013ff00000000000003842494d04140000000000040000000f3842494d040c00000000170500000001000000a00000006b000001e00000c8a0000016e900180001ffd8ffe000104a46494600010200004800480000ffed000c41646f62655f434d0001ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108006b00a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00f4e7da59bdcfb19556c206e78d350d3abb7b3f790c665278cba3ef1ffa550baa37760e48ff0084aff2d2b1db580a486312164f55b295177bed757fdcaa3f0ffd2aa15f51c4b4d82acdc6b0d4f355a1ae69db637e9d5645becb19fb8b1db587380f1207deb17eacb43b17a8de3fed4754cdb3fe9b59ff007c4ef6858168e2f07b5fb653ff0072a8fc3ff4aa6fb653ff0072e8fbc7fe955825aa25a8fb23b9571f83d07db68ffb9747de3ff4aa5f6ea3fee5e3fde3ff004aae74b144b11f623dcab8cf67a3fb763ffdccc7fbc7fe954bedf8dff7331fef1ffa5573458140b3c91fbbc7b94719ecf51fb4317fee6e3fde3ff4aa6fda18bff7371bef1ffa5572c58a25897dde3fbc55ee1ecf57fb4717fee6e37f9c3ff4aa5fb4713fee6e37f9cdff00d2ab932c512c47eed1fde2af70f67aefda589ff73b1bfce6ff00e954bf6961ff00dcec6ff39bff00a55723b144b12fbb47f78a3dc3d9ebff0069e1ff00dcec6ff39bff00a552fda985ff0073f17fce6ffe955c79afc944d611fbb47f78abdd3d9ec0f57e9ede7a8e20f8bdbffa595b6bacf5363c822244023bff0059cbcf3228058ed3b2f44ff0ff00d8fe2a2cd8843868dddfe0ba1232bd1fffd0f47ce138b903f96cff00d14b3035697512e6e1e4b9bcb5ec3f77a4b25f6ec64b41707096b888feaeefeb297190226fbac90d53d2dfd357fd66fe5581f5306ffab78f6ffa6bb2ac3f3bed6ffdf16fd360dbeb76602ff9346efe0b0bea43a81f553a6562d61b3d27b9cddc2417db6d9ee6ff00693ef51e48ad1d7daa25aad3a8bbd236b6b75801000689264c7b63f7154bb3fa6e2388ea390dc42d1b8b2c7343e3e1b9db7fcc47dc88357a8570959c0012e21a240926049fa2dd7f39ca2caadb6c1556d2eb0f61e1fbdfd554faae77d5feb989574ec5ea58f5b597b6eb36cbdc03058d76d6c3f75dbdecfe73ff003057f01f878f48c5e9e4574970369dff00a57692e758efcdf70f4f657ecff44a19735c26b87caff82f1881fd241d7adc6e898345f936fe92eb85461a5ec6fb1f66d76cf7fe67f38a8e2f57c2cbd297b2d3dfd27027e753b6d89bfc63cfec4c4d207db047fdb57ae12ea2b1656002dde0193db58dcde108e69ea6d71c51d3f96cfa30b2971da1e03bf74e87ee7291afc42e031f3faad0e355192e7b582435e43db03c1b76ff00faa5b9d37eb15471d872aefb35e6779da452449dae6b9dea31bedfa6a61cc57cc298ce3ad41b7a12c4db16551f5afa73de6bb2c64b5c5bea1f635c01fe72bb3f4943d8efec2d5ab3312e6ee65836fef1fa3ff6e37757ff0049491cb03b15a6046e162c4db15caf16eb803556eb01e1cd12dff3fe8259b8df60c4b32b2ecaea65604b0b86ed486ff53ba71c911b940892d22c512c46a6ca6f687d4e0e044fcbfd7f7548b1112bd46a8a6a5954b0cc05dbff0087fec7f15c8bebf695d77f87fec7f1507307e5faafc7d5ffd1f48cc8fb3e4023702f6023c8fa4173b6dd5398e7388690d6b5ed1f48c1d8d7bc7eebdbf47fc22e96f00d57823702f6c8f956b9a65f8ecc96bacd8eab1f24fab00bb616fb2a73fdaef7eeb5eeaead9f4ff49ff0884a55036401afcdb286ed8bbf43d33a83cd936578d90ed83961f4deef7ff29bed62f1fc6686d1547b4ec6ea343c792f52eab7df7743eb192d1b6b38f93739cee4b3d3b5b453f9adf6eef7b7f7d79bb7a675214d6e18b6b9858d2d735bb810402d3ed4d8cb8e375e5fdd5f1001fa27e97d5ba8e2e6d25b9770a03836da4dae0db1aef69add2e5d3f5be8bd1466dc063ee2c6164bec703cfa4edfb7e0b8c6576d19549bd8ea01b1bfceb76cebdbd4ff00beaeb3aef55e9edcfc869ba1ce7386d0d7f67bb737e8fd26fee3958c15ad9af362cdbe9f83530fa66063e4efa6af4ad7904d8db5c1c27df3b67f3ffe9a3ddd2e8fb2bebadd6d0ef537bed63839e4967bdadddf419eeaff00eda43a32b15c69cf0e6973bd9ea473b3415bf6377fb7ddfce2b7eb535e3936bab0771d8d71da63f3bdee1f9beef7aaf9a5738915bf090243d538cf87f9712e80a89dfece85c1cbbb3eb7646364655b7d02c6dacaec2768243855e931c5eeaf632eb99feb5a587881f43ed7098d59060882d76e6ebf9ffbca39ccb33336f3881f94d66965950360dd0df6b4b377d09fce57715d6bad607d4fadadab639f631cc1a01ec68b87bacf77a9bda9b9ac465206a8d8f11fd56489d0346d65b438bdef697968dc1fc924496b00fdcf62b989d372733a3938f6561ce2eadb5d92d101f2f9b59ea7d269ff00469afb302eea6f392e6d95398ffb3d4c79647b41a9ff00bcc73acff04abd56e562746b3269cabb1edacc9ac387a73b9cd739d8f6b5f5b5db5adddf413b148d6a77089815f635db51a31df896b1a72697b584b758d9babb5ac70fcc723b76d0e7df896160aee68ac349daee5cfdc016bacff06c720d7bb2f0efea16da3d5616bed6edd5eeb1cf05ecf4ff00475b59e9ef562cc5c86b2e692dbdf8cea88731dba7d615ec631cedafb7dcff007ffa37b11bf05d5e2dfafeb5752aecb0e3b5b47a60970658f6b6c0d3fa4b76fb7d26d5b5ccf77adeabff00e296a63fd716de0e0750a1d4d991fa2de61a1ae746cdce86effccfd13aafd27efae73aae560e4e6babc2c77559557a8dca68ac0dc07b8fbaa2f6dde9fe9fd47aad4dbbf2b185cff4da2faeddc748dbb763bddedf7b595b5385710f021657a0f9176bea79753d7fecc1c763d990c2d07da4b3ded76cfa3fe0d7706b5c4f436b29fae9456c76e165b7378882faeedccfecd9ed5dfba9735bbdcd2d68e5ce1035d3e91536235123c4b1e4d483dc34df5fb4ae9bfc3ff63f8ac2bea3554eb6e1e956d12e7bfdad038f717c2ddff0ff00d8fe2866375f54406eff00ffd2effafe43717a466dce121ae60fa459ab8d2c6bb7321dedddf43fc27d05ccf4dead5750ea5e8edd973ad6dbeb12c21a2a66fb9eefcc63ecb1d5ff00995ffd6f5bebed2ebbeaaf51ad8d2e26dc63b5a24c36ec57ba07f55ab83e8df6ae91d55bd4ee2e6e374fc7731bbdaedbb8d6f6d6ecada3d8df7b6df536fe9ac50ceccc478b490a31f39246de4f57f59b36aa7eab755adb6bb2eebb1ec659611b43439b6105db46cf57f47b762e5adebb8982daf16c63df632aa816d6018fd1b1daeedbf9a8fd67eb132ee859f80fa0b2eb697bb7b4fb499b5df45c37ff00da859797d3acb7272b3a58ca6aa6b7b1f66e8712d66254c1b5befb1b92eab7d5ff0009ff00189d02784709b24d24817af65ba8e4e2752aaabcfab5b6b3686490c21c1b5bf7376977d16fd1da83d3317a58b458400d0d26d2f739d325c1ae735e5dbddea3bf756a61fd55ea399d0b707d74db8f7decc8fb5914ed69632bfb41f443dbe8fa81f5b7d2f5564b71a8aedc8aebb5b7d0cdb532c66f1b9c05791ea45a1bed7bdcff00d1fe8fd2fd1ff389fad6bbf88fd8b48ecef518781434d5535ac1c87f816805ccb2d76efa5f9e87761e1e48fb43839849683e999644435ad6eddbed86b3fc1ffdb8aab732dbba955631fb4b9c046e2d07786b7e97f34dbaaf4fdafb1069cacf18de960576dd45cd696dcc6170fd1b5f533d0dcd6edf59eff7fb944211123326ff00adf2fcdaaed6ab674ba753562e7e7e3d20868b01971f7173aba5dfa49f6ff9aaedbd431bd3706e431d6805a2b0483b9bf4d9b9f0dfa4b068afeb53726fbfec36586e87173c3185ce0d657f9d655b1bfa3fdc4cde9fd7c641b2fe9ed6545eeb1e5d7d5201f77d1163ff00cd4f33c4450c801f3e2fa70acd6de889a2c699b282f643b63cb438ceef1fa1f47daaadd9587874b9d6b3d3a48f51e5b51757fd670adaff00dcfdd58f974fd63ca22cab0ab630f3bb26a3301cd3b4b1edfdf45cf6f5fcbc5b71bf6606b2c6399ea0c9a5c46e047ef37f7908e5c62c7b9127c4851742ac2e9bd4182ea58d35d92e0e6b8d12013c56e357bb77e6fa691e854371edb83af6349630b8d9bbdc3f46c86bc3bdccdedd8f58f6d5d5fecf8b58e9b797d0f7be5a5ae0e0e059b5aeacd9f4bf3d5b197962afb4df836b1f4d226988b6196b2aafda19bb6bdfbfdffe8abdff00e0de9fc70274313e5f8a813dcadfb27a7d996ecbc4cb2cbc879b5cd7b6d686b87a71e9b5cc755bb73bf3d032fa4d8fc7dbf6e658d0297b5bb4ee2da07d9ea2df7bfe830ec59bf6ebda331a71ac61ca6398c0d6966c2435ad7436bfcdd899bfb4c32b7fd9322c63711f8af2e6d9b5ce717bbd7fe69df47d4478a1bd85711aa74faf62e70b733a9e35ada9d5eebd8e6b9cdb184175e1cc735bf49bfd6576bfaeedeabd233707aa9f4b3acc7b3d0c96c8aed781beb0e6ff00da5c9decf6ff0080b1ff00e8573873eea3a63309f8d2e7556546c738b480e3637e8babff008458ff00ac376ecd8e88dcd2e1ac76fa4d7212e1975f15d0991f93d7744bb3f23eae753fb6e45b66364d0ff45b6975bef07f4990c2fdf77d36ecf4dbfcefd35ed1ff006a3fb1fc5786bbaae133a354c64bad0d22d6346c35c1f4eb6ed739b57ba5f7535d165ffa3fd35bfa65ee5fe1ff00b1fc54788cc99990ab3e91fd55d33623adbfffd3ef7eb1582be9198e276fe92ad609d4be81c3571efe9d91982d0eaad7d791b3d4019e9348ac6d60f56e7d0fd9fe97dffa5f62ee7a89230f29c1db76b9a4bbc00f48bbc3f35713775dc8b08f4036a63b50f7439f1db7cfb772a9cc884642729481ae10200717a4f17cd25357eb6e16457f567a864dcda810c6b4416bac05f6555fb1cc6bb6eefcff00d2ab9f5846163f42c965f946f0c6d6e1562b6b639ae6babf49e373b63bd27ecfcefdcf62c5facf956ddd13305af75876d63dc74136d5f99f47fe8a5d7ac03a564bec21a2ad96003592d73432a6ff005bff0052218728e2c2220913c928fae72e9eda09d0af95d6312bfabd855556655cfcab999b78bb73da68aac34b9b36fe8bdb91fe069fd1fda3fe33df6306b8e934cb9963c59f6e70f49ae79bac78ca76bb86d7b6bf4ebd9fe8fd8b27231ea761b5ae73b66374ac72c22769b6e7fafab776d6faacad8c5bfea32b6b69008d2009681a7d2dbed4ee7320e181048e39132ff16193fe8e654646fc92bdad7faac7b5b6577eddec0d2c043437e8ec77b3d46b7f4bb7fcc50a2bc9634575d75866ae76d2f92f3abec15fd06faaff00d259b506ab2a6542ad5e691e9b9d20eac3e97e9086fd3f6a9fab4f76827c25d323b3be8aa52991703d0fe5e94db65b5641d453bfe6e80a36b2f611faa831c4bc8fc21527518373dce7d1597705e771307cd8e562b0da99b696068274680e2278fcf7fe726823cffc155accb08f73f15cc24c11be3fefaeff00aa526df4900bf1ec6fc5ed27f10a5b9c1c36bb6c760d09cbad8265cd8e48db03e28fd07d8ab28453d3838bc5160ddee32644fddb589df5e0905e197d646c01e1c6637fe6169fcdf52cff003d11c6d125d6068f19109edf5aa603610007b353db5e784f8137a02743d122d10fb308fd364d73c1dce9fc4d89a69690e667e403d89dc47cc3bd8acd60be9becf53dd40612d6ff002deda7ddb47e66f6b905cf693ac7c4871281d2891ba162fddb5cdce0e247b8bdadd403ecdbb0d7b79517d38d698b1f4d83b87b413ff82296e69e403f1684d0d3a866df0fefd12b535b23a4747b30b298fae98734381ac8aa4b776df53d0fe7d8ddff00ccaf50ff000ffd8fe2bcd5d2c6b9cd21848edcfdebd2bfc3ff0063f8abbcacee2627f47fee94ff00ffd4eefeb45eec7e83d46c60974b1804c7d334d5ff007f5e74db1dbe371dad0034797d105e577df5cde19f56fa8389db1651a9d39b31979c8c8adc0b86d20032ed6440f0dcb3f9ebe38f6e1fdaa575c31d1b2819322a0d275ff0d4fe72b1978d564b5f8f7b05b56fd44b9a0913b7df5fbbdaefccdc85f5830b2eae82722ca320b729cc6d01ac2f90c7b2f73eed87f57ab6b3f43edf7a7c4ea14e532b3bd94db6b779a5e65e0c9dd537d5d9eb3bfe2d33832470e3980470ca52b1fa3c5c1c32ff009a8457f496bfd8326ca00ad94fa4d0d7b0b2968653fbb63fe97b37bd1461f51637637abd9a68d3e8b0998fa3ed77bddaa317b24c9dc468660347f29db7faa9d9652618d73091a363e8e839734b77261cd9240032e21fd61197f57f4a3fbb14d35bd1eb6d68b0f51aac749019663344ff005deddaefa4958dfaca3dd5d986f6b4490d0e68fed6ef67b55d2e6869dc46ddb33238e3711fcaf7a7711b800e064e8d71691a8eec0d77d1fdd484e4752227ce31534abc9facc1d2fc4c5b0b752c6bdb5bb5fed1456f50eaad01cfe94e20ebedbab275f25618ea4b01915874183b5ae93c69b7e93d4cdb8ee710d21c0ba0edf23f9fb5a367d2fec25c43ac63ff003bfef914d7afa8e73e18fe99733b971b6a0d83e2ef62b14fab640763bea822373d8e9f2dd4bddfda4ff686ba4b6041120eb04cb5bba3f94126b83dbb9d6b5f5bbda035c0363f92424483d00f2e2526f4c377196bb8e47b4ed3b9a76bb6edf729d8f7e9b2d731f10030b4348f9b7f47f47f3100da1d264024e87c87d196bbf9281665e2566b0ec8ac3dd2e6d65c09740fa51fbbb528990f9490b812364fb5c2ac9a6abe3ed41a0b8343dcc2db1992d735f2d73fdf5fd1ff0044a2e3901c5a2c0d133b76be0796ef59db93639c9cf70a3a7d17643ccedb1d53eaac37fd259758daaaff00c137ad2c7fab9d5ae6d9f69b28c06cfe898d06f7f9bdfb1cca9bfbbb7d6b14bc19a75636ea400a367773c0b8377389249d000e1ff54e2856e553501eadbb6481f4bb91206c6ef7ae95bf56ba4066dc875d94e92775969673a1686637a5ed72bb45189880370e8ab1c34403531ad23fb63de9f1e54fe9480f2453c93703a9e654463e1e5091adb7edc6af513ff6a87aaffeab2a5e9dfe1ffb1fc57377da0871264c724ae93fc3ff0063f8ab58b1461757af753fffd5f48cc656e65955f4579555ae0ef49e3703b4363731cc7b3daf66e594f662b346fd5fa9c06a36b6affc82df7f6e3e69bfcd4d3c1fa55f553817660b8017740f540000de2a768386fb9aaad8de9af2d367d55a9e5bab4baaa0c7f5658ba9ff00353fdc9da29e6bed58f047fcdc10753ecabff2291cda3ff9dd1fe6d5ff00915d2fdc9fee4dfd5ff57f053cd0cda46a3eaec1f26d5ff91516e462098fab6d1220c329d473fbaba7fb92fb92fd5ff554f3232714191f57003e21957fe4549b99434437eaf40f00cabff22ba4fb92fb90fd5ff554f37f6bc788ff009bda1e46cabff2290cac61a0fabc20f3ecabff0022ba4efd92fb91f47f554f34ec8c576aefab81c78d6ba8ff00df541b6e03276fd5a636798aa913dff717509bee4470f4a53887af64b843ba45c40e012d297ed9b8ff00de35bff416e7dc9bee474538a3aadc7fef19ff00f4149b9f73bfef1dc3e26bfee5b3f7247e4968a731960b86db7a6b1ad3c87ed23f06396857bdcff50c06c40824f7f36b54bfcd4ede3b7c9253ffd9003842494d042100000000005500000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001300410064006f00620065002000500068006f0074006f00730068006f0070002000430053003300000001003842494d04060000000000070004000000010100ffe10fd0687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520342e312d633033362034362e3237363732302c204d6f6e2046656220313920323030372032323a31333a34332020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f2220786d6c6e733a7861703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a7861704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d6c6e733a746966663d22687474703a2f2f6e732e61646f62652e636f6d2f746966662f312e302f2220786d6c6e733a657869663d22687474703a2f2f6e732e61646f62652e636f6d2f657869662f312e302f2220786d6c6e733a70686f746f73686f703d22687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f222064633a666f726d61743d22696d6167652f6a70656722207861703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f7020435333204d6163696e746f736822207861703a437265617465446174653d22323030392d30352d32365431363a30373a35332d30353a303022207861703a4d6f64696679446174653d22323030392d30352d32365431363a30373a35332d30353a303022207861703a4d65746164617461446174653d22323030392d30352d32365431363a30373a35332d30353a303022207861704d4d3a446f63756d656e7449443d22757569643a323132363238344639453442444531314237393041324239333532443643394222207861704d4d3a496e7374616e636549443d22757569643a32323236323834463945344244453131423739304132423933353244364339422220746966663a4f7269656e746174696f6e3d22312220746966663a585265736f6c7574696f6e3d223732303030302f31303030302220746966663a595265736f6c7574696f6e3d223732303030302f31303030302220746966663a5265736f6c7574696f6e556e69743d22322220746966663a4e61746976654469676573743d223235362c3235372c3235382c3235392c3236322c3237342c3237372c3238342c3533302c3533312c3238322c3238332c3239362c3330312c3331382c3331392c3532392c3533322c3330362c3237302c3237312c3237322c3330352c3331352c33333433323b32303938333131464445433145373338463039433535304645444339393046462220657869663a506978656c5844696d656e73696f6e3d223330302220657869663a506978656c5944696d656e73696f6e3d223230302220657869663a436f6c6f7253706163653d22312220657869663a4e61746976654469676573743d2233363836342c34303936302c34303936312c33373132312c33373132322c34303936322c34303936332c33373531302c34303936342c33363836372c33363836382c33333433342c33333433372c33343835302c33343835322c33343835352c33343835362c33373337372c33373337382c33373337392c33373338302c33373338312c33373338322c33373338332c33373338342c33373338352c33373338362c33373339362c34313438332c34313438342c34313438362c34313438372c34313438382c34313439322c34313439332c34313439352c34313732382c34313732392c34313733302c34313938352c34313938362c34313938372c34313938382c34313938392c34313939302c34313939312c34313939322c34313939332c34313939342c34313939352c34313939362c34323031362c302c322c342c352c362c372c382c392c31302c31312c31322c31332c31342c31352c31362c31372c31382c32302c32322c32332c32342c32352c32362c32372c32382c33303b3744364130313537383430343939313330384637353335414334313930453641222070686f746f73686f703a436f6c6f724d6f64653d2233222070686f746f73686f703a49434350726f66696c653d22735247422049454336313936362d322e31222070686f746f73686f703a486973746f72793d22223e203c7861704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22757569643a4443453037383637424332464444313141424441463535433246414541463533222073745265663a646f63756d656e7449443d22757569643a4442453037383637424332464444313141424441463535433246414541463533222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2277223f3effe20c584943435f50524f46494c4500010100000c484c696e6f021000006d6e74725247422058595a2007ce00020009000600310000616373704d5346540000000049454320735247420000000000000000000000010000f6d6000100000000d32d4850202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001163707274000001500000003364657363000001840000006c77747074000001f000000014626b707400000204000000147258595a00000218000000146758595a0000022c000000146258595a0000024000000014646d6e640000025400000070646d6464000002c400000088767565640000034c0000008676696577000003d4000000246c756d69000003f8000000146d6561730000040c0000002474656368000004300000000c725452430000043c0000080c675452430000043c0000080c625452430000043c0000080c7465787400000000436f70797269676874202863292031393938204865776c6574742d5061636b61726420436f6d70616e790000646573630000000000000012735247422049454336313936362d322e31000000000000000000000012735247422049454336313936362d322e31000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a20000000000000f35100010000000116cc58595a200000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf64657363000000000000001649454320687474703a2f2f7777772e6965632e636800000000000000000000001649454320687474703a2f2f7777772e6965632e63680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064657363000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d207352474200000000000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d20735247420000000000000000000000000000000000000000000064657363000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e3100000000000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e31000000000000000000000000000000000000000000000000000076696577000000000013a4fe00145f2e0010cf140003edcc0004130b00035c9e0000000158595a2000000000004c09560050000000571fe76d6561730000000000000001000000000000000000000000000000000000028f0000000273696720000000004352542063757276000000000000040000000005000a000f00140019001e00230028002d00320037003b00400045004a004f00540059005e00630068006d00720077007c00810086008b00900095009a009f00a400a900ae00b200b700bc00c100c600cb00d000d500db00e000e500eb00f000f600fb01010107010d01130119011f0125012b01320138013e0145014c0152015901600167016e0175017c0183018b0192019a01a101a901b101b901c101c901d101d901e101e901f201fa0203020c0214021d0226022f02380241024b0254025d02670271027a0284028e029802a202ac02b602c102cb02d502e002eb02f50300030b03160321032d03380343034f035a03660372037e038a039603a203ae03ba03c703d303e003ec03f9040604130420042d043b0448045504630471047e048c049a04a804b604c404d304e104f004fe050d051c052b053a05490558056705770586059605a605b505c505d505e505f6060606160627063706480659066a067b068c069d06af06c006d106e306f507070719072b073d074f076107740786079907ac07bf07d207e507f8080b081f08320846085a086e0882089608aa08be08d208e708fb09100925093a094f09640979098f09a409ba09cf09e509fb0a110a270a3d0a540a6a0a810a980aae0ac50adc0af30b0b0b220b390b510b690b800b980bb00bc80be10bf90c120c2a0c430c5c0c750c8e0ca70cc00cd90cf30d0d0d260d400d5a0d740d8e0da90dc30dde0df80e130e2e0e490e640e7f0e9b0eb60ed20eee0f090f250f410f5e0f7a0f960fb30fcf0fec1009102610431061107e109b10b910d710f511131131114f116d118c11aa11c911e81207122612451264128412a312c312e31303132313431363138313a413c513e5140614271449146a148b14ad14ce14f01512153415561578159b15bd15e0160316261649166c168f16b216d616fa171d17411765178917ae17d217f7181b18401865188a18af18d518fa19201945196b199119b719dd1a041a2a1a511a771a9e1ac51aec1b141b3b1b631b8a1bb21bda1c021c2a1c521c7b1ca31ccc1cf51d1e1d471d701d991dc31dec1e161e401e6a1e941ebe1ee91f131f3e1f691f941fbf1fea20152041206c209820c420f0211c2148217521a121ce21fb22272255228222af22dd230a23382366239423c223f0241f244d247c24ab24da250925382568259725c725f726272657268726b726e827182749277a27ab27dc280d283f287128a228d429062938296b299d29d02a022a352a682a9b2acf2b022b362b692b9d2bd12c052c392c6e2ca22cd72d0c2d412d762dab2de12e162e4c2e822eb72eee2f242f5a2f912fc72ffe3035306c30a430db3112314a318231ba31f2322a3263329b32d4330d3346337f33b833f1342b3465349e34d83513354d358735c235fd3637367236ae36e937243760379c37d738143850388c38c839053942397f39bc39f93a363a743ab23aef3b2d3b6b3baa3be83c273c653ca43ce33d223d613da13de03e203e603ea03ee03f213f613fa23fe24023406440a640e74129416a41ac41ee4230427242b542f7433a437d43c044034447448a44ce45124555459a45de4622466746ab46f04735477b47c04805484b489148d7491d496349a949f04a374a7d4ac44b0c4b534b9a4be24c2a4c724cba4d024d4a4d934ddc4e254e6e4eb74f004f494f934fdd5027507150bb51065150519b51e65231527c52c75313535f53aa53f65442548f54db5528557555c2560f565c56a956f75744579257e0582f587d58cb591a596959b85a075a565aa65af55b455b955be55c355c865cd65d275d785dc95e1a5e6c5ebd5f0f5f615fb36005605760aa60fc614f61a261f56249629c62f06343639763eb6440649464e9653d659265e7663d669266e8673d679367e9683f689668ec6943699a69f16a486a9f6af76b4f6ba76bff6c576caf6d086d606db96e126e6b6ec46f1e6f786fd1702b708670e0713a719571f0724b72a67301735d73b87414747074cc7528758575e1763e769b76f8775677b37811786e78cc792a798979e77a467aa57b047b637bc27c217c817ce17d417da17e017e627ec27f237f847fe5804780a8810a816b81cd8230829282f4835783ba841d848084e3854785ab860e867286d7873b879f8804886988ce8933899989fe8a648aca8b308b968bfc8c638cca8d318d988dff8e668ece8f368f9e9006906e90d6913f91a89211927a92e3934d93b69420948a94f4955f95c99634969f970a977597e0984c98b89924999099fc9a689ad59b429baf9c1c9c899cf79d649dd29e409eae9f1d9f8b9ffaa069a0d8a147a1b6a226a296a306a376a3e6a456a4c7a538a5a9a61aa68ba6fda76ea7e0a852a8c4a937a9a9aa1caa8fab02ab75abe9ac5cacd0ad44adb8ae2daea1af16af8bb000b075b0eab160b1d6b24bb2c2b338b3aeb425b49cb513b58ab601b679b6f0b768b7e0b859b8d1b94ab9c2ba3bbab5bb2ebba7bc21bc9bbd15bd8fbe0abe84beffbf7abff5c070c0ecc167c1e3c25fc2dbc358c3d4c451c4cec54bc5c8c646c6c3c741c7bfc83dc8bcc93ac9b9ca38cab7cb36cbb6cc35ccb5cd35cdb5ce36ceb6cf37cfb8d039d0bad13cd1bed23fd2c1d344d3c6d449d4cbd54ed5d1d655d6d8d75cd7e0d864d8e8d96cd9f1da76dafbdb80dc05dc8add10dd96de1cdea2df29dfafe036e0bde144e1cce253e2dbe363e3ebe473e4fce584e60de696e71fe7a9e832e8bce946e9d0ea5beae5eb70ebfbec86ed11ed9cee28eeb4ef40efccf058f0e5f172f1fff28cf319f3a7f434f4c2f550f5def66df6fbf78af819f8a8f938f9c7fa57fae7fb77fc07fc98fd29fdbafe4bfedcff6dffffffee000e41646f626500640000000001ffdb0084000604040405040605050609060506090b080606080b0c0a0a0b0a0a0c100c0c0c0c0c0c100c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010707070d0c0d18101018140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc000110800c8012c03011100021101031101ffdd00040026ffc401a20000000701010101010000000000000000040503020601000708090a0b0100020203010101010100000000000000010002030405060708090a0b1000020103030204020607030402060273010203110400052112314151061361227181143291a10715b14223c152d1e1331662f0247282f12543345392a2b26373c235442793a3b33617546474c3d2e2082683090a181984944546a4b456d355281af2e3f3c4d4e4f465758595a5b5c5d5e5f566768696a6b6c6d6e6f637475767778797a7b7c7d7e7f738485868788898a8b8c8d8e8f82939495969798999a9b9c9d9e9f92a3a4a5a6a7a8a9aaabacadaeafa110002020102030505040506040803036d0100021103042112314105511361220671819132a1b1f014c1d1e1234215526272f1332434438216925325a263b2c20773d235e2448317549308090a18192636451a2764745537f2a3b3c32829d3e3f38494a4b4c4d4e4f465758595a5b5c5d5e5f5465666768696a6b6c6d6e6f6475767778797a7b7c7d7e7f738485868788898a8b8c8d8e8f839495969798999a9b9c9d9e9f92a3a4a5a6a7a8a9aaabacadaeafaffda000c03010002110311003f00f514d770c2caafc8b38254223b9201009f843788c556fe9083f926ff0091137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff3462aefd2107f2cdff2226ff9a31577e9083f926ff91137fcd18abbf4841fcb37fc889bfe68c55dfa420fe49bfe444dff003462aefd2107f24dff002226ff009a31577e9083f926ff0091137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff3462aefd2107f2cdff2226ff9a31577e9083f966ff91137fcd18abbf4841fc937fc889bfe68c55dfa420fe59bfe444dff003462aefd2107f2cdff002226ff009a31577e9083f926ff0091137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff3462aefd2107f24dff2226ff9a31577e9083f966ff91137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff003462aefd2107f24dff002226ff009a31577e9083f926ff0091137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff3462aefd2107f24dff2226ff9a31577e9083f926ff91137fcd18abbf4841fc937fc889bfe68c55dfa420fe59bfe444dff003462aefd2107f24dff002226ff009a31577e9083f926ff0091137fcd18abbf4841fc937fc889bfe68c55dfa420fe49bfe444dff3462adc77b04b2889798720b00f1ba6c0807ed28f1c5511bd3df157ffd0f5049ff1d283fe30cdff00128b154bb56f33d8e9774b6d711cceec8240630a450923bb2ff2e5d8f04a62c3094c02865f3ce947fdd371ff00029ff35e1fcacbbc23c50bc79d34b3fee99ffe053fe6bc3f969792f881dfe33d33fdf53ffc0a7fcd783f2b2f25f10285ff009fb47b2b1babd962b8f46d2192e25a2a5784485da80b8de8304b4f202d3e204b3ca7f9bde5cf34690355b0b5bd8ad8c8f1059e3895ea94a9a24ae29bff003631d3c88b5330139ff1ae97fefa9ffe053fe6bc3f95977847881dfe36d2bfdf33ff00c0a7fcd787f2b2ef0be206bfc6da57fbe67ff814ff009af1fcacbbc2f881dfe38d27fdf371ff00029ff35e3f9597785f1435fe3ad27fdf571ff029ff0035e3f949f785f1435fe3bd23fdf371ff00029ff35e1fca4fbc2f8a16ff008f748ff7cdc7fc0a7fcd78fe4e7de17c50d7f8fb48ff007cdcff00c0c7ff0035e3f939f785f1435ff2b0346ff7cdcffc0c7ff35e1fc9cbc91e306bfe560e8dfef9b9ff00818ffe6bc7f272f25f183bfe561e8dfef9b9ff00818ffe6bc3f939f92f8c169fcc5d1bfe59eebfe023ff00aa983f253ef0be3077fcac6d17fe59ee7fe023ff00aa987f2593bc2f8c1aff009591a27fbe2ebfe023ff00aa98fe467de17c60d7fcac9d13fdf175ff00011ffd54c7f233ef08f183bfe565689fef8baff808ff00eaa63f919f78fc7c17c60eff009597a1ff00be2ebfe023ff00aa98fe467de3f1f05f1e2d7fcacbd0bfe59eebfe023ffaa98fe467de3f1f05f1e2d7fcacdd07fe59eebfe023ff00aa98fe467de3f1f05f1e2eff009599a17fcb3dd7fc047ff5531fc8e4ef0be3c5aff959ba0ffcb3ddff00c047ff005531fc8cfbe2be345dff002b3f40ff00967bbff808ff00eaa61fc8cfbe2be3c5aff95a1a07fcb3ddff00c047ff005531fc8e4ef0be3c5aff0095a5e5ff00f967bbff00808ffeaa63f909f7c57c78b47f34bcbfff002cf77ff0117fd54c7f213ef8af8f15a7f357cbdff2cf79ff000117fd54c7f213ef8af8f15a7f363cbc3adb5e7fc045ff005570fe427df147e622a6df9c1e5a5eb6b7bff22e2ffaab8ff27cfbe2bf988f9a63e5afcc1d1fcc3a83d8d941731cd1c466669d6355e2aca87757735ab8cab369658c59219433091a0c81f7d460ff008c337fc4a2cc76d4562aff00ffd1f5049ff1d283fe30cdff00128b1561de788f96b309ff009775ff0089be66e97e9f8b8f979a4c90ed9936c15826d91b4b8c786d520f3ec9f57f2379865e94d3e751f375e1ff001b65598fa531e690fe4adb7a5f977a79a7f7b24f27df295ff8d7278fe9099f3671c726c5a2b855a2b8a1695c2ab4a61558531558530aad2986d8ad299255853155a53142c298aad29855614c2ad14c50b4a62ad14c2ab4a62ad70c2ad70c50d70c55a298aad298aad31e1b55a63c6d5698f1b429b455186d50d2c1841432dfca28b8799ee4ff00cb9483fe4ac5987da1f40feb3760fa9eb0ff00f1d283fe30cdff00128b34ee6227157fffd2f5049ff1d283fe30cdff00128b1562de704aeab19ff8a17fe26f99ba6fa7e2d1939a50a9990c1771c8a5ae38ab0efcdf9bd0fcb7d70ffbf228e2ff00839906579b924735df95507a5f977a10a5395b97ff0083919bf8e590e4112e6cab8e4d0d15c55a2b8aad2b850b4ae2ab4a61558570aad2b855695c55694c2c5614c92ad298aad298a1694c55694c2ab4a62ad14c55694c2868a636ad70c55ae18ab5c3155a530ab463c50d7a78daad31e36ab4c78aa9490d70dab2afcac8f8f98ee0ff00cb9bff00c9d8f3135c7d03dedb839bd31ffe3a507fc619bfe25166a5cb44e2afffd3f5049ff1d283fe30cdff00128b15639e6a5aea51ff00c615ff00893665e9be969c9cd280b97b06f862ad71c55e7ff9ecfe9fe5adf7f97716a9ff0025797fc6b95663b328a7fe42b6f47c91a0c74e96301ff8240dfc72e8f26279a78532486b8e2ad15c2ab4ae2ab4ae155ac98a144b52a1b66f03f3c5569fb61475debf2f1c36a9d68de59b9bfa4b2560b5ece47c4c3fc91ff1b663e5d488f2dcb38e3279b18d5af9acb56bbb5445782295d23a921a8ac40df7cae3a93d52718538f57b46fef2b11f7151f78cbe3a989e7b303028a468651ca37571e2a41fd5978903c9890d94c285a5324ad18f155a53143453155a531568a62ad70c6d5ae186d5af4f1b56bd3c6d5a31e3685a63c6d5af4f155a63c55618abdb0dab28fcb688a6bd70694ff457ff009391e626b8fa07bdbb00dde84fff001d183fe30cdff128b356e4a2bb62afffd4f5049ff1d283fe30cdff00128b1563fe67a7e914f110a9ff00866ccbd3fd2d3939a509b81e397305d4ed8abb8e15799ffce433f0fcbc09fefdbeb71ff02aedfc329cbd19459c79621f4fcb3a4253ecd95b0ff922b97041e69894c3685a530dab4531b42d2986d5b8ade59a458a252eedd1460320059502d22f3eebcbe55934c88426edaf3d56b875600288f88f841fb5f6b3027aea3b7272a3a6b081d3fcd106a57315a456d38ba928123e1cb906f0e35db043b4e12d87341d2483d034fd12cec42dc6a4c8d29fb29d514b014ff5ce1cdabe839231e1f9a6efa8c92205847a71f453dc8fe198864e40877be46f37eabaa5979df5d369752c3fe9f71b2b1e27f787f64ed86322ccc417597e62ebf0516e562ba4efc97837fc12edff000b93132c0e10c934ff00cccd11c28b98a6b4905016039afceabf17fc2e4c646a384b29d3fcd76d7601b1bf8ae47742416fa41a3e64475121d6da658fbc27116b2a40f5a22bee9bfe072f8ea8750c0e345c17b653d3d39454fecb7c27ee397c72c65c8b031215cc7963168c78daad298ab5c324ad70c50d70c55a31e2ad7a78ab5c3156bd3c16ab4a61568c78dab5c69d3ae2ac97f2f8b7e9b9ea76fab37fc9c4cc2d68f47c5bb0f3676fff001d283fe30cdff128b35ee4227b62afffd5f5049ff1d283fe30cdff00128b1562be6f768f5ab635a46f0ac6e0fbbb1afe199380d45aa7cd2d67f40292494dcb3374a9048fc32d948446ec2aca83de9796131fc692d1582efc49ee72b8e7b3b72ff73fd667c1b6e8f87e305aa08a9e34f0cb632b0c087947fce494bc7ca5a65b8eb35fd69fea44dff3565797984c79bd4b4e83d2d36ce2a53d38224a7faa8065c82ae530a1cd138b796e38931422ae47ce995e4ca21cd94624a0c5fd9b75938ffac08c8c75303d5271c91d656f6f72431b88c454a9e2c0b93e017233d54472651c44a6b198234f4a0091af7a10598ff94dd4e6164c929737261011611e7cf22ea3e6ed63495897d3d3ede2985ddd31a2a1765a2a8dcb39a7d9ff0086cc79891fa5b8480e68ed1f4fd1bcbf6089a6c00cd511cf3b90d2acb27c3f17f921fe1e198f74091cd68c8f923c4f25c6aec2e119841d2a68bf1500a7f9238e4ef8a5b8fa59014364e55fe223b5680f6d80cbd83e48f3dffca6baef6ff4fb8ff93872419a1350b6b7484c888b1b2b84f858904107a824f8665e7c5188062e2e1c9291a283b7b3371ce8eb194a7daad0d6be00f86558f14a7c9b6790479a9b432c529461fbc46e3b6fb8db6a640ecc81b4c6cfcc7e62d34f086ee5403fdd327c6bff0002f5a6224506112f53d1b55b3d474fb691678a4b96890cf1a30a872a390e3d46f97020b8721451b73aa1d321fac3dd1b7814a872e7e01c8d0541af7cb06494791470da3acfcd2b344245f4ee62a54c90b0fe15197c7547a86071a6b0eab612804c9e993da4dbf1e997c73c4b03028b0aac39290ca7a106a32eb43bd3c6d8b5e9e36aad6fa7dddc9a5bc2f29ff24123efe9919648c79964224bb55d36e34ab78a7bf021499ca26f52081cbe2a569950d4c09ab64719a4246639503c6c1d0f46535197837c9ae9bf4f0ab463c6d5698f1b55a63c5591f90529ac4c7fe5ddbfe4e2662eb3e81ef6cc5cd9b3ff00c7460ff8c337fc4e2cd739289c55ffd6f5049ff1d283fe30cdff00128b1562fe79859dc38e822a311d47dba1fbce64e1171af36a9f3492f0b42f1c5e8868589f88eebba9e47ad76c8e4990771e94c45f5dd2f764374234a98d9aa7d23c4800fda27a0ad38e6178beae5e9feb7fb293656c9be9d74ad1549a221e0a15680d3c333f1640621a6437793ffce4e37a769e5a82bf1492dc4c57c0008abfaf2339d94c424363f9e5e6380225c45ea2a803e17f0f6756cac679379c013fb2ff009c8186a16eecdc0eedc54ffc459726352581c0598e95f9fbe43bb11e9d74b25b8b9fdca2aab12cefb2aee06ee7f6b96512f51b65c242df3079facecac6e5f45d2e1e51dbfab0cf705a56352a07c238ff00378e5f0d30ab699663c9e51a8fe64f9da7d62e6da3648edc4b2a011db8278af2eec1bc32d1862030e32c3ee3cf7f9811476ceb3cbca48cb495b64ebcd80fd8f0192e08a2cb2ef27f9ef5ee0f26a974d1a816e7988ca1ac9f6f65e229be6b75d190fa0717a5c9c355ba7cff00989a9c3ab0b1b65766242caf5a10bbba3ee5aa4fc3fecbf6731b4d8aa26522dd399ba09add7e6ebe9b732c77d092e5d4b3305ab465b829fb48c03396c961c5e20bfc7f5532ca62693db5fcf9f28c3742d2fb9432fa811a31c815a91c9b8b28aaa7da6f8bece5820692276f1bf3b98e5f376b93a3738defa768dd4d5594bb1e40f7188e4da965cdf4771070f478484862c18953407f648dbaff00365d3ca6428b4431089b0bacc7a0f2c533fa2cc1685c120f7ec0d363874d9844da33e3321b294d256f4b2b871ea5790e877ed9027d56d807a515ac17a421d5832971f1f5a7c276ae64eae564168d28a051d169713a5bc88590b7d5aac2869eac6493e3f6972bfcb022c7f47fd9354f2112a48afbcc5ae35d2e98f7cd2e9d2005a26f8ab4351bb548a1195511d5bb151dd5a08f51822faf5b7a9146adc4cd19e346f03435ef840356dc48268a6f65e78f31db001e61751d68526504efb755e2d844cb138a259258fe655ac2409239addb7e7242dc9411d7e13c4e4e39886a96067da7f98ee02c524ea2e6060188fb0e4115d9a847fc2e648d448071ce30cc34af37f92444ad2d9c90cc3fe5a0071f3e55e3ff000b94cf34cf56c84229f1f33faf08360b17a5fb2ca43edf46d9872ca5cb8611dec13f335f56bdd32da54d42585a29851004311251fed295dcff00b2ccdd1c44e26dc5d57a4ecf21d27f326eed65e37b012ca7899adcf063c4fed29f84e42394c4b3386debba06a30eada3daea10b168e7524161c4d4315351f319b3c53b882e1ce34691c63cb2d83463c6d5698f1b5641e465a6ad31ff008a1bfe26998bacfa7e2db8b9b3093fe3a507fc619bfe25166039089ed8abffd7f5049ff1d283fe30cdff00138b15639e6a3caee4818831cb6b4a134a1e4fbd46e2bff1ae5d8f2000ff0047d4d731658b0ba9b50857e20a226fde7a838860f1d6809ea09fdac84a7e20fe6c6fd5c4c80e1287736cb77c5157fbb8c153508c50710a06fd5ce438e264470fa7f1e9fe92d1a4f34bd22084abccc5bd12cd4276a9df6029d49ff81cb0c638e3b7f9a888322f17ff009c9c99a4d63cba8c77f4a7723dd9d47f0cab1f22d93fa9e47df2b7256b74c92a9456c97175173e544911942920f2076e9be1835657d2de44d4a3bbf24c325c451a5dab88792a700cb1b2d0540fb541f6732f1c760e1cca433dc922e485414f52a7e2af7ccce1d9a2d219fd627990bce8bc451a9d4d7f0c88982484989a57b49e679a286448fd0aab36c7dabd7c331f551021290078a9b3112481d118b143098c9b54b89e590c4cdd189a029423a7c25bf6b34190895d9e08c63e9feb717adcf8d84bbcc1a0e877d7725cdec4f24c63447ea17e03541f09ec69fec732747c7c0230a1bfd5fcefe77a64d594812b2c0fccba2d9daeadf598dde6927494f294fd97240eb4f0cd86a21c3c23c98619d92a172be8aa42410ca370db301f2ed9831362dcd4568d68669249bb5ba8765a956e24d0b83fe4e51a8c9400fe7320136d6a13c0a943ce48848dc7ec8e217635a9cc4d2cfcfaa94baeb4565b8f42dd5cb4718699988a73201a2d3e7c732e1a81567bd52eb949a2710cac494fd9a920577cc812b62cf3cbde5a8ee74bb3bd170e1a536d218989e2042cc1c0eff1afd9fe5cce8643c35f8f4b83920388b07d53c93e6cd3645bed423865b7818f39e0714e2cd45aa9e2ddff0097289c5b7111748c82f02e893da99389793908d94efb0dc353db18e4f418b3940f1892f836d0dd8af211cea4fb74c98af08f7f17f9c837e20f72db8b28174881c0a4b24cfcdf7a151b0ad720623804bcd9099e3215dfce7e60d1f4f8e486e16f235501209c0247c20d01d9fe1aff00360f50692012ba3f31ebd1a35c472325c3b19aeedd6b2430f23f628d5eff00f03f6700916ee015ba6da57e665edb4aad7300257632dbb18dfee248c3c77cd1e15722cdacbf31a0f31d949a614f5909471348a5258e45a9a6c78b065cbb0fa45c5a32d9352791eab6e2df55bc840f86399d457ad031a6532e6e547907b6fe51cbeb792605ff007ccf3c7ff0dcbfe36cd8e98fa1c1ce3d4598fa797db53463c6d5698f0daa79e4d5a6a927fc606ff89a662eabe9f8b662e6cadffe3a507fc619bfe25166137a27157fffd0f5049ff1d283fe30cdff00128b15487cd3006944be9abd22e2d5a56953d2be1f6b2cc5c984d84c5a6c92ddc2b2c8ca2d9a66998ee80441951581d986ebfeae43c291065229e21d11de4cd216f677d5aea645de967130064110623d46069c59ff0065b312103b4cfa647fd3c5b36aa5fa438b9be96449a496053cda492a0f235aaf870419440ca590924f0b7c00117877fce42ea4b7fe65d09d0718fea65912a0901a4ee47cb3618c8e1b0e39fade6a4e56e4ac6634c92ad8a421ebcfd3f89413bf4dcf6eb928b4e57bd7910c89f9776a824e49f5c97e33b1a826bb7d199f839070b2256d71c12e81562183ee0f43befd333251240680505c9a5d3ae544e12ee45510cf21feedb8b1ad4f5a81f6735d9e5284aa3172718121b953f2fadfb5ca4577372238c6f3a37156151d0115dd7ed6475794f8175eaae2e15c51f5f9276679a4bb48cb51919e48e3269f18a22f1dd79165cd163c371e2aff003bfddff9bc4e699b77a93005643cd38f2451c77ec58852402d993a7d6c4c8180f5fd3ff13c3f4fa5ae78b6a276613e739e37960b7894a7c0ec54f1a20a8e4db54bb7f95fb3995384ac4a5ddfe9bfe258e322e83139a732b990fed6e3f86574e58662211a7dac2f6e5d242c88b3515cf16df7a0ae3abd0c447889e212fe168c59cca54426f6d6c2f6481bd40c6e158fa476a063405cff00934f8734023b98fd3c1fceff007ae412c67cd124514ef1461d6e399fac3d41e6dd29507b66cb4d097f122ed27bfd3352b0282f6da5b73254c7ea290180eb43dfae66a82cbbcbfe7dd2b4ed2adb4fbeb7bb89a150ab70212f130776e25594934a8e3f67ed65d098a71320f5157f3079bbcb5ab797ef21b2d46292e24506380d524628eac78ab85276c3290a5c60db07e4c8bd6a5bf1194396be39ad9978cc8cad4a7ab19edfe529fb54ff005970aa617e6e0c56f1ac84dab2288428628580dcad457954fc58d9aa450e69a47e51bcd434fb1d42d25884b1c25f84ca4032702aadc857a370cb7980e31a122c76ce3bbd2d2ef4fbc60b7211a09b8fc60b06e5d4631970d8ef6c31e2a28892e2de4b1d391923e503c8b3536775670d47fa3ece3628268d952d2d843e75b18e3678a06b891447523628dc6a3bd065f800e3ae8e3ea09e00511e61529af6a0b5ad277dfd89ae559854cb7e23710f61fc906e7e52b85ee97b27e31a1ccbd31f4b8da8fa9e8263cc8b685a63c6d5a31e36a9cf94969a94bff185bfe24b98fa93e9f8b662e6c964ff008e941ff1866ff8945986de89c55fffd1f5049ff1d283fe30cdff00128b154af5c72b380778cc63928fb4284ef4fdacb310d9849e745a28a5d4249a505e0596384aa8af26a3290b5e25aa7314cfc3e67f1fd1675c4119a3f996df49d2eead6e9849751718a381be22a89180e4b01d2bfb3fcd987aad788995f3fe67f47fa4db186c290ba3c37535bc56465e4aedea4c23f863a101c4648ad5becf2fd9ca31629ce2013fe97e89370229e39f9f1a65c41e7ed2b4b8d39dc47a75ba8863dfe362c4aaf8e6df1c78614e2ddced834ba36b31ff0079633ad3ad637fe991a2e4710ef40cb15c26cf13a9ff002948fd785545072a5539d1c54578814563563e192835657b7793f56b083c8d670cb38e7f599c848aaea28ec284af2f8b6fe6ccdc738c46fc9c29824ecc7ae7cd9a1567896f0b4aaac591636a81befd07866678d0e4d3c1252d275eb1bcbc30dbce3d5e0b246655a0f8549fb241ae6076966c6311be2dff009adda784b8826af756e9a8b2492340c78f08bd26e437049a53a7c5983a4d563380097abf9dfef5bf262971d8445acab777514c2e3d69982cb182849654668e9b745e5ff02b9478d1c503188e08d707d5f4ff00c549b0e33220945ea575145271b4b9803ad4342cea0f23bd287c6b95f6760c7c24cc9feb7fd22b9a52e4184f9dee6384c76b0fef1e78dfd59c10430460788dbecd4ff37c4d9b0c92390891fa6b8611ff008afeb30c43876ebfc4c61a2923897923558752ac001ed5194972c14e7f4c2145fa87acd7605427006941b952a58edfeae4f519632851d9a71e23195b2fd2da1b2b784dcbaaa2c4099031a8e7f12aab75dbfe133473df21a6e258bead15bc173717571224ef2bd614048a003b75e999a2ced1d828e48bf3b6a535fdb69cb48ca21728621fb52015e447ed6d99a4506b81dd1fa212ba2a0762b4b4b4f7feef5373f857250dc3565e6f33bb0f0eb3381095e37d28e2fb31224d8efd0e031d99e33bb36d3f4bd22f344d56fee2468ae6d113ea91063c4b052191a8b4fb43fc9c800db296e85d3f4217da46ab7f1dd2c434e45916dda85a40c68d4dc538e1532a2881a7dd4be5dfd2312078ad7d2894d6acad2f324d3c3f97fcac09b465bf9d5b40d06c56f6c5a5864056dfd2900919391019d585054abffc2ff365b1938f38eec62fb58b6d56f6e350b65648ae1cb0470030d8020d09c8cb9b7439287a95dc9ae0649b79412ddfcc113caaac62e2d1b37ec9e5c6a3e86cbb0b4671b04d7cef1e9eb7a1e2012e416fac0018faacea195cb1d8715fd95c8ccefbae206bc9e89f90337a9a3eaf01eb1dcc6f4ff5e323fe34ccad31d8b56a07a9ea4506645b8ed18e9d76c6d69a10bb7d952df204e3c41349a796405d4e6426922c479a7ed0ab29dc751946720c7e2cf18dd90c9ff1d283fe30cdff00128b315b913db157ffd2f5049ff1d283fe30cdff00128b15635e70d42fac6eede7558cd8d2313312438ab90d4143cb6e3f0e4259250dff00856812c1ff0045db4de65945a2fa536a53da7c4cdc846ab1c93cb44ee5e18d51bfd6fb58e1c42f8ab7ff0072a4ed4ab6d26936d36ad75a98370c2473ea3a064470ae5401e25fe3e3f65113966a8010c9296407eaf47fc75b87d200645e5ef46e25536d0d21789421a0454a054a28af2e91fdae1c73284f8a5e9e491b078afe6f82df9fb671935f4aded87dd13377cd843938a7994d9586e3a64c2a1ee0a906bb8f0c6d8bcdff00316ca5bab8b18e0b73255672c156a3ec802b8094863e66f37c96d6ba45b47f53b0b2b8e6089123691a49d9d99893ca815b8aae1f136a5e117689d23cb9aa5c5e2c57e12aacfe94b13c7cb8b2114603ed74cc7a9095c373fcd666408a29cc3e4bbf82f9ae2394a4300a47313434e27ed20f8b2e9649186e05d7ae3fcd6b1100f36537ba188d16592492f1f8a290cc6bf6940e2086d91bf679673f09e432e1e018bf1fef9ccf4f3bb57d574fbdb6b60b66cf2b212662dc53f74ab508ae9515e47fe6ae595609f1ccf10e1fe0ff003ff9dc2d92d86cc4a6b1d5a41e94f14bb26ebf112fc46e4961bff92cd9b98d44538e77425af976ea1f39db5eb22dbc4b1ceccb23355c9d94229f6cb31e6a2054b7f26128ecf56b67e5670d77d80dc5464e79aba16221e6aed0da32106388970430e0b5607b74c880399f50fe74949280bbd3b4b21217b588465cd140e20911f2db8d3288e9ae5c4599c882bcf2668177592689cb814e6b2b0fc2a465b0f0e22ba7fba5e392193c97a6a5b9589a4897ad5b83b6fd454ad6987f2c246ecaf8e517a7e83656b622d98994053189375213d5f5c2800ed49332230a0d73959b49352fcb9d01dee2f2132a5d4923dceee0a191cf235f86bc6b919e3b0cf1ce8a83796b5bb2b7bcb6b330b4571c54b1720b38f1242d1be2f872984254dd39c6d2f3a2f98ad61ba8574d67176abc8a3292ae0d49500ff364c408419c4f557b6835dfd0cd653d8cd007ba84191178008a1dc965effb5feafc391e12178813b14bbcc767ac6aba4d8cb6f612ca637689230839c70c72111061ec87be4e3134d7396e95f9327b9d0b5165bf845bc9e95c44d15ca91b4f09515069d6bf0b6464376dbb1b2a8b9b6ff0cb5afa51fd6d2f04827dbd5f4cc454affa9c87fc1646995eea3aab5a47e65b292d22305b7d62d1d6304900164e5bf705b3221427b38f324c37649f980a916a370aa28395b353fd68194fe2987503d49d31f4a97903f345bc8faedbfad109b4bd4a511df0e21ca8446e0eabfb542df66b954644020364e20916fa3b4ff3a2ea9651dee997104d6928ac7340aa47b8f1561fcadf1662cb34ef77223a78747997e6afe66f9a3ca3e62b3d4ec1e399ee2ccc3c2e539a0fde9ab00a57e2192c532519714400a1e47ff9c82d7358bb8b4ed6e91cd70e12dee6d178af263b2bc7b951fe5aff00b2c394102ed8e311ba219b7e5e5edf4bf9d3acc534ef245269026556351cbd5b75a8c96195846a2001d9ebf27fc74a0ff8c337fc4a2cb9c644f6c55fffd3f5049ff1d283fe30cdff00128b15790fe746a6d6dafdb4225fb7691916e7e25a9965f8c8d8aeca7e25cd5ebb88cb6eefc70b6e3aa79e1f396ad6fab4b7a6e2332a22855e5d5e9c7d652001eafa5f07dafda6e5f6f28c5aac938d5faa5fc5fcdfe8b230887ad7946e624f2e0d52ef8b49772c8fe8caa4bf093651c7a96e03e3ccd3b0e23ea635d1303e69b0800b5d341964297065962468c092240ebb90159559f231cd107845da4c6c5be75d6a6b8b9fcd6d3dae1cb4a96507372493b5b13d4fcf33f0df00b68973280d57f30aeacaea782dc7ab246ec839001450d373df31ce4903cdb86314804fcc3f3031a3c50126a4fc2c3a7c9b0f8d25f0a2985f6b13cd69617770238fd7596a28db05f002be19646648dda65116941d4e21a94919fd89a35d94f52e17c727b31a4ff43bcb3f59af1e4a456c499051436c0f40ce09cae79b80ec3d4a216ca62d434f9ecfd515647a14e340d4fda15e9bd330354279237c3c33e197ab8bea6dc75135688b5bb0cf2412ab05566456563f01aedbf607210889423cb8ff009ffceff8632248250d6f35256582592e9f90089c854c487d32c0484d230e9f137da91fe2e399583156e40e2ff65fe991292b5c5c01728ec8f248ea14395630b1a8dd680fc2b5ff002732298da47e7190b79934469178482d1c15fe6a9352bed97621bb5cd9259b72b28979f1a28df253e5cad886a3f33f97429ab30686b1bc92256ac0d3e1f6a8ca35119ff00df87e9fc7a5313de846d56cae6ea09ada6536d5732c446ea550af255d8fda398025281e02271c9fd1f541b79efd137b3bbd14cf1477d7d123bf32d6ecae7e0084f2fbf2d8e232de7fe6add7242ddfe8ff005227b4ba5b9570494e54643e3dcf16ff002b33b144f536d5240ea3aadcd9f2ff004192e225824ba32c6f10fddc442c878bb29aa965ff005bf672c33a348a489bf3174a7bab8d31ed6ee3ba426270510a86e9f695c8a611305262cc20b7fad4c5564588000fc47ed83b71503ed36333481baebbb69626e4596706bc6643d78352a47f959184ad3208ad4f4c9acb4b966b94465474047daa736540dd3aab95c89982699014903ea7a7248526b989245019d1dd55a87a6c48eb96db0a5b1c5a65d3cd34d1437318a0e642483ecf4aefe189a482507fa27ca5741e4fa9dbd137938fc0147bd08a6011894f892ef4b2ff0042f2dac505e584287e3d8ab33ad577e8c4ee0e18c05d844a648476b3a2596a8eb25c19159b82b32b6f4557e3d41fe6c128d9dd309988d9e77f98de5db6d26d2c6e6de6924a5dac64381b0656dea29e19130a6c192d0fe52f3bebbe5abbfac69b3d23723eb16aff00145281d997c7fcb5f8b2b9c04b9b742663c9917e6bf9e748f35e91a5ddda2b417707a91ddda49bb254a302ac36743f171ff88e518f198c9bb264128aafe56e8ed17a5ac5c22b46e58408dc83874a71700a1f1fb4adf6735fda1aa00f006188eef70fcacb9b79bf35af68acd3ae8cea67fd9216e61056a77246d991a2248d8fa596a48203d95ffe3a507fc619bfe27166c1c34576c55fffd4f5049ff1d283fe30cdff00128b157cbfff0039432ddffcaccd3e2b70cc468b1baaad6a585c5cf81037cc6cc0732af36d47563696161146152e4c463be71bb3b8e24250fd98c06fb5f69b30a38c1049e5c5e86ce2a7d09e44d5ec60fca7b1bfd5944179a9add24574eacccc5393736735f4fe04fdae2b994220c370937d134d1cc11dbc4e5ebfb8d54d49ad4fee9078f864e118c4001656f13d61797e6faa8fd8b2807dd68bfd732a3c8341e6580ea11f3bfbc7ad434cc7e7f1573108ddc88bb569e3b3d40582412dd5ef1e527a7408aae79577dda81b18c6f749ee653afda70d1f4707f775497ed900ee48ef4cba23934498c0b3b896ff0052ba12c496f693437133bc8aa162494723bf535f878fda6cb0d0e6802d1da2a4975a75f3dbc88f4432171caaaadf083b8eed8642c16b32e120165f0dd245e548e16e3cc2b7a6f527600f7dbc70c318e1b1d51227896d8eb57675dbe8ae6781994f2b4121152a0f12b41c695cc23a1c709121c8e2950b421b8b9b5376f05a5b891aea6e76a0c9e9462395b8056046c0a7d8fe5fd9cb84a23995e1b09df98bcdf651bf382312490dbc7eb176229201c82a13b05ff9ab252900c4449627e61f37c17baee957b2466de1b781a224b732cd4353b6c00cbb0640c32419358f9ab4b9218a92854a519d815a3f65dfb9c992096145894b7d6e2eeedda54e06426bf36396f1b1e14f7cbad17acd38649086755646af5415072a331293311a0bf5dd562b3b832bbaa058a43b95047c341bb114eb98f906e5b23c90fe58d6d2eeec05b812816eadc790635a005b62dd725886e58cd916ad776f258d091cce9ba9af1deb506265c9486e81c9e7974e8fe70d5e60ecd1bcbce32fd77f6ed9380448b25f395e3c70e97344c4bc7700aa8150d54e8c7f641fe6c196361963a4d7cb3a9a738cdcabb2488e258d681e3e454b10bfb5c7fe6aca71b292e8e7b968eee2f55d8a88498c927e1fac271602a766aa71ff0025b230bb652e4c63cf6ba7a8979c26e6e582ab0a8f4f882869506bd57fe6f5fdbba42cb5dd05686ee58fca9aa9b70b118622f0c71280aa78d7e15dfc32d94683006d20d0f59d56e343f303ccdfbf82243055147d97249a002bb646374ce50000a5fa76a37773e4dd4a495b84b1ce9c5d47034e29928b02291de45bfbab9d2ee85ccd2398a681e36666269c5852a49dab802a13f32c03e5dd9cb986e606ab1a9d815fe386636650e6c03eb210549db29b6e32a57d3ef347bb256f679228948aa2c658b8f1041f848ff2b2bcbc43e965190eaf6ed1e374d2217691d122548eda03cbe140b40ce06cf403fcaf87f6b399c84199ae6e5c477337fc87b99a4f3edd2b5cbdcb3699726666000aadcdb7a640ad56aacff0f145cdce8a207215b3466f7bde9ffe3a307fc619bfe27166c1c74576c55fffd5f5049ff1d283fe30cdff00128b157817e7e683ab5f79ff004dbeb206448f4e863685509a9f5ee2a4b8741c68dd3fe6acd6eb734048464ce269e773f9225b9d4ad6d6e21292a45713428c12921568d4b3d09f84f2fe6ca639e3e1937fc4cec5a61aaead7b6efa5e85a859dc1bb9219190432d553772c682abf1a7ecff009399f832c7f2e65d1a8caf26c97dceadade9ced4927b62aac1be22b40fbb28a1fdacc0812793944da596d7b7371f98e6ebe296436b10f8419188fab20da9d73718fe90e1cb99641a0f9011bccccd796aff00a26e6268d432d4c52c9170370e4d14ac6fca6e3feae63917f0f57fa5f537c66024d2e887586d4ef7411e8476b74da7c71cd579ae45aa88d667936024987f7bf0fa6bfb3c733ff2b1386321f570789fe9fd4d11ce788df2b7b7d9f913cb1abf92743b1bf7586ef4ab5885f0ead09259e4a7ec991e56e3cbe25e39871d9b32804dbcabf30dbf2e74bd1f56d3341d21644904121d5a47792495ca09800ec7ecf1fb4abfccbf0e5a071736174c705b1b382de66b578277468d83728e302542c1786dcfe2ff0080ff00679562ca058b4e681910405593d75b49e296270fe991182a41341efdb7cc6811c5cdba52d9bb4b4896ea26bdb196dede225a6b88e01cd29b96f8881d7ed7f938c671268cb9a38bb974c2f758d5b54b3b2b69647b29658ae8569eab49248449b0a84707fe095972cd4e6c71a32eeff72d71340a9da7913cd9e9ccbe9223dc7c2c1f9b00a3a100d02ec33167da188f240243a6fc9ef325d4b048f7b6b02c49c69fbc6ad46ed4a01911da701c814145ff00ca9fd5dd228df5f8618e2fd98a027e21d5be26eb83f950740821a6fc938c3179bcc32bb31ab70845493f37c87f2a126abfd92882e7fcb3b4b1b36b44d76e7f7b32caf3247f12f0461c4056df916f8bfd5cbc6ae557e9bfeb33f08d7352ff0095456574bebdc6bb76dea752f17c54f7ab9cc79f699079061c25a8bf27f4d8588875cba8ea29511536f03c586d911daa7b91c25a7fc9c89cf25f3048682839a38201edfde64bf953c9784a1a7fcae9125674f30a19a5dd99848acdee58139747b4bc8a38176a5e42f345d7059756b7b9540a117d49140e2366a04fb54fdacb076a8ae451c054acff002dfced6b7b0b453fc0f222c8d15c9278161ca81a84ed821da302685ee9a29c268da80b5d626d345c7a905bc96766365a9378a8569ccf1789d1de0e3c97d3978f2fdd665e69881a27906c376585def95bce32ff00bd7657b30a53e22ce283e44e5035d03fc41ab84a9fe81f353c325bfd4efda1968248b8cbc580d8576f7c9fe723fce4514458f903ce0d14915be99710c3382b2876f495d4f50dc98572275d11fc4bc256cbf965e6a810afe8c97875291caa47ce81f2235d03fc49a2a11f94b5bb4b5be492c2ee112c482803d0913210071277cb23a889e525a292cfe5db9a30960ba00eec1849434f10c32632f9a374249a4475a348ea4766a7eaa64b8d36a56fa54f6b32cf6776d0ca86aaea3715dbc70ca57b109e27a0d9f9d6eee346b5d23d26835069f95f6a31ccc126846e23f45eaa8dc47f3f16fe5cc5fcae326e9bf1e69134f44ff9c5bd52f2e7f31355865bf92f205d32e1e1e7b2f1fadc01485214a77fe6e5fe4f1f8b2618440ec16677abb7d3f27fc74a0ff8c337fc4a2cb9ad13db157fffd6f5049ff1d283fe30cdff00128b15798fe6a4c91f986dc3452c87ea686b19551fdec9e3f2cd1f68c719c838bf9bfefa5fd1641e7d7664935bb0be4b09a4b5b78ae21b88ccea923994a14e26ac00ac7f16511c98063e13dffd24a1edb469a4d75357ba329912ab15b27111a25180150dcd8a87fb5cb07e7a31c7e1c47a6d8988bb4e6686c5c30b8b45922eadea82569efc9fdf2b1da32fe6c5971979e684a87f38b51582d44d1c11c821b78d1980091205e2a86bf08cde67c93184180b97a58479bd86d21d5a7430258b599b8528b27178d9598501a55cafc5fe4e538659e46a718c632f4cbf9deaf4b22f238fcbfe6bd3351bab18ae4585b317bb2bb49209e597e2a3854e29fc9fb59bdc30ca3008c8c78a3e8e287fa9c63fd2fe268e28f1727a579a27d77cbbf971089f50935194dc4725c5cce02c8f6fcf8d3e127bbf1f8be2e0b9810165ba45e452db1d4e1f28e8c213f563ea4d3489f6a44facbbc94e5e11c0917c58336618e06458f57a079b0dbeab61301a3347221492de604111bc52066fb27ab5387d9cd31d5891e4e44324811ba2b517b1bcd2e6863b29ade4b940209958b282c41a956af6cab164c7c57c1fe964d520793b50b4b5d4f4796ca78a681ae555279e12ac0a9239d035681f270c6232128e397fa65e02974169a4db5e3ea2c2582e6ddef2dd8c7c784b6ef72d244189eaa9f6e3ff0059bf672ed463e22470ca43eae7fc49e128e8f54d3660cd04c5f81e2f401883e06876cc09e2844ee27142b09a16fb12965a7c4405a8f9fc595d63fe92ab016840533311dcba549ede387861de55a7163f67eb14e3d8238fbe95c7c3877aa1d9f4a552ad791827a8a303f71187c11deb61a5b4b276052e223ee7e2fc31f0bcd361146d0103fd2235e5b9ad057e8c1e08ef4d8541a796dd248c8eedb9fe18f823bc2d852bbf2fbdd47e934b1aa9ebdcfe2a7251c75c8c5894be2f278b741135d2cea0ecaf5a807fcaf6fd9cb250beb14522e3f2e7a7224d6f3244f090cbc429208f0d97e2ff006586102083c514ec97cbe513696522db4ef1aa4b0fa08b23200d2ccb51b13551cbf97ed7c59950b971598faa2ca73e236d8f2e6ac07ef6eae2b5eb1ca08ebdc3015cc5f0bfa8c2dbfd09ac00c629c54ff32a827e6435323e08fe8ada97e8cf332821a67527a3c6e87ee5718f843cbfd32db71af9a61605cfd62bb10f103f82b30c07105055cb6bb716f2b3e9ebc20e32d548463c5c1a056ea72dc38b9eff00c2b6a11dedd3900da5cc43f9b8b11f7d32af08a2db961575ac909907fc5917227efae11192d20e5f2e695720b36991316ff8a117efdb25c7907592f0aed1bc93a1b6af0fa562b6570dcd05daab1f4c3a32b3842dc09553f0e6469b36433009dad3114411cd92fe44791edfcbbe7fd46e0dfc9a95d5de9111fac48a538ab4d1f24a7261d5573753f4cc4472a3feea2c448c8d97bc3ffc74a0ff008c337fc4a2c9a513db157fffd7f5049ff1d283fe30cdff00128b157997e68586b777e64b7fa95aac96e2d1035c3ccb1a86f565aaf1a339da9fb39a8d768679a6083c23fe92563b0f95b537a1b8bc82ddb6a882169cd3fd691e315ff9e79547b1e3fc452985bf94f4c5ff007aaeefaec93520c8b0a7cb8c02334ff659950ecfc51e8a9945a5f972ce307ea312a2efce650e76efca52c7323c3c7017518adbc67c9faa5b597e796bd7720e5152ed51529fb45294ed4a64b519e38f1891e4c62f50bef3afab1bc0907d5d250c8d2f305954a9abd6aa053303076a5e688036e2feb227c8be76b1d57584f37c33d95ddc4f6b3de0821b7ba776531b371a942400c17ecff26749acd41f0e44d7d2e3e31bb36fcc8d5fcd37faf3e89737b1cfa6416cd7165c512206381033a10bf69e32ac9fec728d3e9c7871feab3390da55f96f737316a324f272996d2de58ada314eb34c08515ff28b7fc166a7b5bd2047cdba02c5bd29d9cd934051d418c81402a0d3a9dcf7cd08ef6425bda1aca6296cd035c977b790c6642b4a8a0715e20d2aaeb96ea3178732014ce5baafee0962c50034af2422bee6a06562721d58f11526b7d3aa1dd615a9d9bd3240fc3be26523d4af114447169a89449238c13528a38d69b7d9ef90942fa95b5396e745894faf750464ed47655ad3c436118c9e56b61b89fcbacca16f2d59fb00f17cea77c3e0cba82bb2bb697a64e84ab238a56a8d1814fa0e11b2d206e341b131b7a6c20ad7e25214efeea69844ca0a8c3a3451a34664136db33f22df7a15c9788aa6fa2f38c51025589aac92b023e4477c0322aa2e8e547c3ea1703aaa8fe34c1c7e4aac96b7955fef02ff0094013f81c7629b5fe86a0afcd24007ed2f1a7b78e15b6bd2d45e8bebca8ddcd2a3f5b62295ab84bf8b4f955e62c5e5b74466a9218ca1abb91fc9995a7e533fd156a31aa8357998edb2f0603ef476cc7b0adacfadab502864a7da25ebf772c7655eda8eb2bd628d40e84b56bf45706caa4757d5436f1c6ca47ec549fd670eddeaa8bacdc88f94d6aea7d830fd780856975b0c7fb820f4dd80fd78f0ab86afc8ff00bcc1a9d4ab027f860e15b5e754878f26b793fd88070f0a6d56d35ab68eea19b83811c8adc4a83500d48a7be4b1931903dc516cc3f2b2547f35dcfa501483f47b2a39047d8b85a29a8ecaeb9bd86719320204a3e997d5fd29a23121ea4fff001d283fe30cdff128b32d289ed8abffd0f5049ff1d283fe30cdff00128b15627e730c7558a8a0fee1772694f8df2255815ff9c6c2dcba440cacbb093711d7e8f88e6ab3f6a4206a2388ff00b15499fce1aacee3d161146d4a5050fd258f2cc03da39a7c88805424f7725c7ef2799a57eedceb523e9db30a7c47727890f3dd16748ff3435d90f6338503c79a8cdf76a1ad3c7df14066eccb2db4d00ab7acaea1501e4c48238a9f16cd1e904a59635fce8acb9179bf956d6e1fce7610caa3d480cb733a83555241e24115af5f873aeed49f0e197f4bd3fe99ab18dd907e815d5fcf9aedb5bd7843f598adaad40259cfa63fd8f2e59959b51e10c51fe798c3fd8b5c45da33f2f2d956dee39948e449897ad09e4a855450783166cd3f6f6d28fb9bb09d997b4b12a82f2a576345524f89eb9cff0015b625fa7c26defaf659ae8482e4432c6889c578229881dd8fc744557ff5733b57bc607be0ca52079260de901f14ec68410bbd413d2bb9cc13162b3d6b41cb94d21045680d083d6bedb60e216ab81b27fde5256e5d17916ef4a8a8ef92b0aa17316993d629ed9a607e23cd15c5078ef4eb84640114866d17cbd2208c68f108d0d580893af8ed960d44bbcad22ad6cf4cb663259e9b1424d393a22a1207c8e094cc86e944adc92c57eac815abc4b10771b9c883e486a59ae084348d536038b753daa401d0e1dd2be39ef1528ec838edd59bdba6c31123d556b34edf12caa0f435da9f3ae25548cf7118ab4a48242815402bdfb60ba56bd6998ff784ff0030e5faa94c78bcd5c92dd07353407a1a554fdf82d2dddddc86caa68ccb756a2a29404b9af6ccbd37d33fea2554dcccdc47a9c875a0515cc4b42265b5ba8ec63bf776104eef1a1d87c71d095e9f6a87fd9664474d396339072ff64b68462805192476ebfb54a663d77aac0f1bd4ac60549d9850edb6ddbb64b642f4325680053427e200500fc70809683161574037ee2a29f70c368532b6c694546a1df6a9afcf0daa9b2431d78a28535076e9f763c4aa71d239035bc65597ac8a0d457bd70c6441b090699efe524b3bf99ae9659647a59b92aed51532c5bd3367a1cb294c83dcc8cc97aac9ff001d283fe30cdff138b36cc5138abfffd1f5049ff1d283fe30cdff00128b15603f9bb71e869b3103e29618e2e5d36691abefd330b5f3e1c455e3323d61556552187256d8d41db39b9008548e6e1f0d0229a57a120f89df070d8b56e59eaff1719546c8a2b4f9eddf22363b95611a24889f98de6173f655ee054ef4fdf28f7ce83b585e188f34066c35516bea5d54ff00a3a348b5ad0955277dba669341633c3faeb3e45e69f977a91ff95976ff00583c4dd724e12720ca490dc5969c98d3e1fb3f1675bda188e48088fe7c1ab1ecc9743d46de2b9d7b52f5592737123a920fc414b3afc355ee729ed494bc7c407f3bfdf2318f4946f936f6dfea77109755916e58920fc3f1805687f686d985ed042432c4ff000f0b2c3c9908337d6128aac92f7150411e3b0ec3342234dab6f5a7125b1b7884a81658667505b89aa3a0a11df94999d908969a07f9b2943fdf281cd4e395c23908e240549431f0a54ef4e55f7f8b35f2f20aabf5a9a32814d54d437a816a6a3b6e36a6480ae8ae324cff000c952877e0a154d0741518936ab584c1c7ee9e3e278920ec0edbf5c110a8a8a5918aba86069df6dbb9d85699680557c72c615855b91f8b88a93b9ef4a61e15b5f198431765766d95431f11b9eb86202aee4f5ac61b835579006829f3db1e142d69ed284caff677eb42491b61e1055b59f4f6219cd09a014f8ab5f9d76c14adc7796a247a2728e868005e551ec06c7fd961a002b435088a398e162f1a9695410ccbdfa74ae4847b9970a2b4bb886f612f20eb4601579d108d9b95388aff002fdacc98696f9b68c27abb5089a5b7923b75559ade586e14cbba32a86a730a46c4b665e3c108823f9c1978483bbbeb8b565460b7170c5808e1014fc22bb2b3723944b443a160712733dfc2fe49b566942535568d6bd6ad0540a7d197e2818e0902c0c4849bd57720a4a2adb1aefd477a9cd3d3171374371282686854576fa310ab58b0705cee01a725c2ad02b4e1526836dea3bf85724ae8d6107e0ddff50efe1880ad99101ebbd2a280024e1aa42c6b95d852a7a506e7a7b530a59afe4f5c07f345d4750596c5c91504d3d68876ccfecfbe33eeff007d1487ae49ff001d283fe30cdff138b374a89c55ffd2f5049ff1d283fe30cdff00128b1578ff00e7cea502df5969bc7f7d3c48eeff001502891c28257df966abb4b2d011ef57934f2ccee2242028d8104eebf3ae68a45422a348d47a4bf6796fe9ec29d46fdcff00c1642e90af015e4a011180caa80827e64814db23490c3748ac9f981e61f4cd07a97146ed4130ed515ce93b54d638fbd8c593c922cb04b138630b868d914716e0c3e21b50f16e5fb39a3c729c24240ef14d5a16db48d26cefedef6d74f4d3a7b7a4914b1963c6643c83d0b3966aff00ab99a7b4b29909150004a24fcbeb861ea5beaf307981320648e4353d6adf0d397fad967f299c878a405ffa5620572525f20f98d24325a6b088cbc5842a8c895a9d989241a0cb751dad0ca471c5631a1b220f937ce12034d51259455c906553cbd88a0ed94c75787f9a9dd083cbdf9896d388e0d459f891422e0f10c7a03ccd09ff0082c90d5e12288dbf9a9b354ac6cff32f4f9bd46bb170dc4c854ca9254034dc353c7071e9bb98eed49aff00e63470191acd648811c87d5d181aedd8f2c90c7a7e40ad94acf9abce762d4b8b7f4d937a3c05481eec029ef967e5b11e4bc45131fe6779983032471915e9c1d3e8eb80e871f795e2298597e6a7a429776ce1cf5910ab54104746e072b3a0df62bc48f8bf337420c4319a86bb7a600a7fc136567433e8bc4112bf995e5c30b2fa92a54d0aa4752074a866db11a39af10568bf307cad22b2c976e85a810b23569efc4532274b93b92085ff00e35f28dc0ff8e82a90db55192bb77e4b4c8fe5b20e8b611b6dac6937ac12deea19a46af120d4ad766f96573c72037090984304ed0810295e3f6da83afe3ff1be560da57c5148a4bc04445c802a7627c761e2312a888aea768c89fe3b62557d35048a035a903270cd21d5989c90f716919f8feb722f5aa73247c756d977dffe35f872f8eae4cfc52837d3a49e18de0778ee630de93c80d2a790e678712a6adf6b2d86b77dc2f8aaf7ebaadcf9624d096f230af3a4b6731476646113445483f6b7f8bed7fadf0e5b1d6c40a23663295a0a4b7d5163431b58a49081493d062c481b9e2afb0cc13285f26054da3d40b7231d91de80c7eaa93f35e9ff000dc721c71f34155823bd9650a6185c2f508b2835eedcaa06d8f103dec695a40d1fc25016dc85e4d4a1dbad4e0dd2b404047aa49e23e0009dcf42295031a50b02c6c8cf196627ed9e4e00f11d7b649564ff00a2618d9aeae4c24296e3ea354f1ee77e9938d94b32fc86b9b09fcdf7c6ca59648869ee5b90fddd4cf15083403966c3450909591d1407b949ff001d283fe30cdff128b36ca89c55ffd3f5049ff1d283fe30cdff00128b157877e7d953e6cb21210156c632b526a4b4d3568075fb39a0ed6de607f455e672001e31c987f3d176e940a093d7fe239aa35485786540511502295fddc7cc97a83bf2e3d2b8251dacaa2ccb6deb4443f221c16352106f41df7c61669205b0cf2dcc62f3af98a8c010d72016e9fdf6743dac6b1c7facc63c9994112b7268c96969fccc16a401c89a5734223dea888034703c6cbfb996a5e8dc431f607c3fe1b2679514a10faaaeae050c684ad178fc07c49e9b0fd9c1606caab0cb3132431a30a8e65e84d48ed5e9ff000390e0b09a5ce5c948914f23f114e22bb518771d3044514ae8edd559782324656aca452adf203ad4e127743ae55a5ab07ac6454f2d87c0294ea30814a510924aa811e91c6c6a14292d523c00a74ff88e36ab59ab6ee96f1f3d81624f1a86af6606a708552f4dcc89c2d5500a1f59f7f8812282bf0d77c36555268ad6e814b8b48a46938a86645a93b034aad724252ef28589a2e9a0a45fa3200c29f0889001ee790e59678933d4ad21cf96b4396e0a1d3e1e6c6ac7828ad476a530f8d303ea28e15c9e50f2f3cc0ad840687882cbb8d855b88daa300cd3ef29e10984565120448608fd22df0295534aec0d40e382a47aa400aa2dec603c02a06908f50fc2a3a6e78fdaebcbed61b3d555a19e362f021789623491c6c08a53624531215b170cea59416df88049e9d0529bff00d73913cd6d4c5dbc64d48a1dd77ff26be3da98296d4a4b99b9072a183d1d054568db0ef5dce1add6d55a5bd2ec63644a1343fcabd7e2c8ef69b53f5591b8bc8d45dcf11d491bfb61a2c6d631499a3a46caa2a7929a120545492a49c262ab0d22e4a6421943160adb115a1ed4ef8404aff5f4f4e48ce58814a167f8bbf1dc7be2014f0a56facd8962b0c6f24dcbd38adede33333313f0d38d6b97434f291a017813cd3fcafe72bd3149fa2dada020a869fd385c0a7dae058b0e44e648d0cd408f546d97e516a7723fdceeb2f144e18496564a0035ff008b5b96ff00eaae66434711cd0c834ffcb2f2369d319fea1f5d9f8aa7a978deb1010003e1345edfcb9911c718f20b4cf7ca4d18d4648d15511603c55450001d05001968564eff00f1d283fe30cdff00128b26a89c55ffd4f5049ff1d283fe30cdff00128b157837fce403f0f3a5910ca0fe8e8f9726a507af36e00ab6683b5637907f57fe295e71f5e9284a4a19c37140a360dd0934dce6b04290bd2e7d5e065902464fc6145431dfab53e206983877a54ced2cade6866b8bae50e9d6c39dc5c4919740ab56af1aaaa85a7da6ff0053ed371cc9d0e9bc599e13f4abcbed3ccb63a7f9ab54bbb71f5db5bc9df84c54c64249296e411ff6a87f6b3a4d5e97c5855f09621e9ced3237a5eac6c29f00464641ca94dc13bffc2e7339716486d2890c83beae91801a590d17e2a91cbe335dff00d6072a913cd69a536e844c54c8f41c39bd4906be07e1ff0081c22f956c9a5ea2e820b89087001049723913d450d5856bfe7cb08a55f58480ad5576d9155b930a501a2ee472fb3feae20850d859a3e41abebb900a87663c6b4ea400361fb386412a81d4a95f4dbe16a5797d9e9bd77c110a1b786060aeab23ba0eaa79023a1ad4fbf2c318da147d26491e38a19518d259279240aa9b5283a12bb7f9ae4c81cca156da4b696326252e55a8a81aa4bec3e95a602292888a188cd1b4a920727d35e4e0040bbf8d77c4725b5e5d0825635e319f503962e58548eb92bd90b60b9823e6d1a23228078a0e4cacc7626bbe0e214ad0b9e65b8b50851c81ef4a5683a537c5563b5cb28442be9015dea371bfd9af4c0090a0d2d8ac080ccdc798525d5411f09dfec8ebfe4f2fd9c2644aa29dfd3b7668d7d26d8805b857b53957ad30004a5a6b85a0327046527a1e9b6e724421462847355e25d1e808342154d482ddb010516e9ad9848259018db896043151f0ee28281686b9288ef640a9cb35ba224cf3a7af2eee395154b6c79d40fb34ff0057fcac2405a43dfeaca67105908e5964feecf2e4189d883b6f4fe5cb2388cb765c0dadaf9cafa586d6c74f6924f851a428f6eaac46ce4b851c0532fc3a4323ba08a65e9f94bad4f6b0ade6af0dac88793adbac92ee4824737295e9fc99943400278b6e4c9f4afcbbf2969ceb29b77bc9900a35dbfaaa1a942c10fc353fecb32618211e411653c4b1d3e121adede18997ec948d148edb1032de10adbbb0effc724aa2d2ef5ad705aa8492ae1426be4d70dabcd4dbf70dff00134c42595bff00c7460ff8c337fc4a2c9a1158abffd5f5049ff1d283fe30cdff00128b15796fe6c7e557993ce1e618b50d36ead20b58eca3b668ee1a4572e92c9213f04527c3491735faad34b24811dcac561ff9c7af392f22f7da7b5482a3d59e800f9c1d7304f65e4e862a8db3fc84f310be8a5bcb8b068a36a9f4e49799524720098471f87ece01d959395c590a671ae7e5ec97ba1cba1c363632e9b32f0920966962f841a8de38ddba8cdce3c4202a2384312f26baff009c56d55a7e76716976c01aaf2bbbd9cd3fe7a45c7fe1732232a6062574ff00f38edf9a303a49a56a5a441283f1334b714a5294e22d9972ad4c0658f0cb92c6349c69ff00925f990d6e1754bad21ee450196196e08600ed5536ebc78ff939a89f656fe93fe999da322fc8bf32a44ead3d89918d4112cb4f7049818d321fc9b93be2aa43f21bcd6fbcb796209e5f62496809e94e5030d8fb613d9992f9850aa9f919e6d57f50dfd8b481aa1899361dc01e8fc35c07b33272f4aa222fc99f37c618adce9e095e283d49c8143b31fdd6e70ff264fbc2b49f927e68f40c46f2c909249911a5249fe6a345d77c4767641fcdff00648506fc96f3b84f4a2b9d33d35002564b80dd4f2a9109ebd7fd6c97f274c9e615727e49f9b84659ae34e699f629ea4fc00de946f46bb7fab8ff002764be612b53f243ce10c61219b4b40afcc057b85e5ece4455389ecfca4f38a8544fc94f399e465beb275614f4bd59a95eb527d1a9df232ecdc9d0c55645f923e6dab34f7b672124f14596755029d36871fe4d9ff455147f253cc2aa04371643e0e0dc9e5dc0ff009e541b7f938ff26e4ef0aa769f929e698a58da4bbb3648d48e025980248a0040846c3243b367fd14529bfe4a79c00a417d67102fc9a934e49141f09e50b77fe5e3847674faf0ad2262fc9ff387d5fd37bcb10fb8e4b24db827bfee4576c07b3b27785a5a7f25fcd2d50f7364d4af026498f535e863db11d9d3ef0b4b1ff277cecae0c573a6ec4b234924eec095a1eb0d08ae4bf93e7de13482b8fc98fcc533b3c175a5046d856499766a02580b63c8d0773921a095515d92f1ff0038fdf9873de1babbd62c4f0f862804933a50904924c09ff03c1bfd6cb468a85048a643a57fce3ae94d09975f95aeef9d8b4a21b8912022b5144e0b97434a00dd264cb3cb7f953a0796cb368f630c12b92cf33c92cb2127bf29391cbc4698a7cda1df36dcd29feb37f4c3452a4de5dbeecf17dedff34e3c2516b1bcb7a91e9245f7b7fcd3828a6d61f2cea5fefc8bef6ff9a71e12b6b7fc2da97fbf21ff00826ff9a71e12b6b5bcaba99fdb83ef7ff9a71e12aa2de4dd4986d243ff0004ff00f34e1e1422bcbbe5fd5b4ed4e5b8b9680dbb4263511b3b3f22ca6a792280bf0ff95840294fdffe3a307fc619bfe27164908aaed8abffd6f4eddc771ebc53c4e89c15d1b9a961472a7b32ff002e2a95ddeb9a842c445e94d4ebfbb651f47ef1b1549ae3cefe6288fc3a6c6fff00063f89c34a8393f31bcca9ff004a743fec9f1a5526fccdf328ff00a52a7fc13e34ab0fe69798c75d153fe09b1a5587f35bcc43fe94a9ff0006d8d2b5ff002b5bcc1ff5644ff826fe98ab5ff2b67cc1ff005654ff00827fe98abbfe56cebfff005654ff00827fe98d2bbfe56cf983feaca9ff0004dfd31a577fcad8f307fd5993fe09f1a56ffe56bf983feacabff04f8d2b87e6c6bfdf4651fec9f1a55dff002b5f5eff00ab3afded8d2bbfe56bebbff5675fbdb1a56ffe56b6b9ff005675fbdb1a56ff00e56b6b7ff5685fbdb1a577fcad5d6ffeacebf7b634adff00cad5d6ff00ead0bf7b634aeff95a9adffd5a17ef6c695aff0095abadff00d5a17ef6c695bff95a9adffd5a17ef6c695dff002b535bff00ab42fded8d2ac3f9afadd7fe390bf7be2aeff95afadffd5a17ef6c695dff002b5f5bff00ab42fded8d2b63f35b5bff00ab42fded8d2b63f3575bff00ab42fded8d2b63f34b5c3ff4a85fbdbfae34ab87e67ebc761a42fdedfd71a55e3f32f5f3ff004a85ff0086feb8d2aa2fe62f981bfe952bff000dfd71a5574f3e7985c81fa2d47fc17f5c695196fe6cd765601aca34f7218ffc6d8d2a6f69a9ea139a48f0c24fd9ac6e7fe3718151b0c1766e9669e48d8223228442bf6ca9eeeffcb8aa33b62aff00ffd7f534b189168715427e8e8f7e943855c74d84f500fdd8aad3a4c07aa8fb862ad7e87b4ee8bf70c55afd09675feed7ee18ab4742b13feeb5fb862ad7e80b0ff7d2fdc31577e80b0ff7d2fdc3156bfc3fa7ff00bed71b577f87f4eef12fdc3156ff00c3fa70ff00752fdc31b577e80d3ffdf4bf70c6d5dfa034ff00f7d2fdc31577e80d3ffdf4bf70c55dfa034fff007d2fdc302b7fa034eff7d2fdc31577e80d3bfdf6bf70c2aefd03a7ff00be97ee1815afd0561fefa5fb862adfe81b0ff7d2fdc31577e81b0ff7d2fdc3156ff4169ffefa5fb862aefd05a7ff00be97ee18aad3e5fd3ebfddae2ad7f87b4eff007dafdc30ab7fe1fd3bfdf4bf70c6d5dfa034ff00f7d2fdc3156ff40d803b46bf70c0adfe83b1ff007dafdc30dab6345b11d235fb862ab868f67fefb1f70c55b1a5da8fd81f70c55bfd1b00e8a3ee18aae16110e8062871b14c52898d78803c302aec55ffd9, 'image/jpeg');
INSERT INTO `service_spaces` (`id`, `name`, `url_name`, `imagedata`, `imagemime`) VALUES
(8, 'Engineering Garage', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_space_requests`
--

CREATE TABLE `service_space_requests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `cas_ticket` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `space_hours`
--

CREATE TABLE `space_hours` (
  `id` int(11) NOT NULL,
  `service_space_id` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  `one_off` tinyint(1) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `space_hours`
--

-- --------------------------------------------------------

--
-- Table structure for table `studio_spaces`
--

CREATE TABLE `studio_spaces` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `studio_spaces`
--

INSERT INTO `studio_spaces` (`id`, `name`, `service_space_id`) VALUES
(1, 'Woodshop', 1),
(2, 'Metalshop', 1),
(4, 'Digital Fabrication', 1),
(5, 'Textiles', 1),
(6, 'Ceramics', 1),
(7, 'Prototyping', 1),
(8, 'Art Studio', 1),
(9, 'Classroom', 1),
(10, 'General Work Area', 1),
(11, 'Engineering Garage', 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
	`user_nuid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT '$2a$12$RGRjbe3xauqpFLf3eMskVOITvZgrHsDdZ/0zr03zxFNQM3k3HFOHS',
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `university_status` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_expiry` datetime DEFAULT NULL,
  `space_status` varchar(255) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT NULL,
  `creation_method` varchar(255) DEFAULT NULL,
  `is_super_admin` tinyint(1) DEFAULT 0,
  `is_trainer` int(11) DEFAULT 0,
  `imagedata` longblob DEFAULT NULL,
  `imagemime` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `expiration_date` datetime DEFAULT NULL,
  `general_email_status` tinyint(1) DEFAULT 1,
  `promotional_email_status` tinyint(1) DEFAULT 1,
  `date_of_birth` datetime DEFAULT NULL,
  `primary_emergency_contact_id` int(11) DEFAULT NULL,
  `secondary_emergency_contact_id` int(11) DEFAULT NULL,
	`user_agreement_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_has_permissions`
--

CREATE TABLE `user_has_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `service_space_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_has_permissions`
--

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vehicles`
--

-- --------------------------------------------------------

--
-- Table structure for table `projects`
-- 

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `bin_id` varchar(255) DEFAULT NULL,
  `last_checked_in` datetime DEFAULT NULL,
  `last_checked_out` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projects`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_teammates`
--
CREATE TABLE `project_teammates` (
  `id` int(11) NOT NULL,
  `teammate_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_owner` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_teammates`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_logs`
--
CREATE TABLE `project_logs` (
    `id` int(11) NOT NULL,
    `checkout_user_id` int(11),
    `project_id` int(11),
    `project_title` varchar(255),
    `checked_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `is_checking_in` boolean
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_logs`
--

-- --------------------------------------------------------

--
-- Table structure for table `tool_logs`
--
CREATE TABLE `tool_logs` (
    `id` int(11) NOT NULL,
    `checkout_user_id` int(11),
    `tool_id` int(11),
    `tool_name` varchar(255),
    `checked_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `is_checking_in` boolean
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tool_logs`
--

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alert_signups`
--
ALTER TABLE `alert_signups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attended_orientations`
--
ALTER TABLE `attended_orientations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_ins`
--
ALTER TABLE `check_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_types`
--
ALTER TABLE `email_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_trainer_id` (`trainer_id`);

--
-- Indexes for table `event_authorizations`
--
ALTER TABLE `event_authorizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_signups`
--
ALTER TABLE `event_signups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expiration_reminders`
--
ALTER TABLE `expiration_reminders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maker_requests`
--
ALTER TABLE `maker_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preset_emails`
--
ALTER TABLE `preset_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preset_events`
--
ALTER TABLE `preset_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_type_id_idx` (`event_type_id`);

--
-- Indexes for table `preset_events_has_resources`
--
ALTER TABLE `preset_events_has_resources`
  ADD PRIMARY KEY (`preset_events_id`,`resources_id`),
  ADD KEY `fk_preset_events_has_resources_resources1_idx` (`resources_id`),
  ADD KEY `fk_preset_events_has_resources_preset_events1_idx` (`preset_events_id`);

--
-- Indexes for table `preset_events_has_resource_reservations`
--
ALTER TABLE `preset_events_has_resource_reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_approvers`
--
ALTER TABLE `resource_approvers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_authorizations`
--
ALTER TABLE `resource_authorizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_classes`
--
ALTER TABLE `resource_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_fields`
--
ALTER TABLE `resource_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_field_data`
--
ALTER TABLE `resource_field_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_hours`
--
ALTER TABLE `resource_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indexes for table `service_spaces`
--
ALTER TABLE `service_spaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_space_requests`
--
ALTER TABLE `service_space_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `space_hours`
--
ALTER TABLE `space_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studio_spaces`
--
ALTER TABLE `studio_spaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `primary_emergency_contact_id` (`primary_emergency_contact_id`),
  ADD KEY `secondary_emergency_contact_id` (`secondary_emergency_contact_id`);

--
-- Indexes for table `user_has_permissions`
--
ALTER TABLE `user_has_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_teammates`
-- 
ALTER TABLE `project_teammates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_logs`
--
ALTER TABLE `project_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tool_logs
--
ALTER TABLE `tool_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alert_signups`
--
ALTER TABLE `alert_signups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=632;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `attended_orientations`
--
ALTER TABLE `attended_orientations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `check_ins`
--
ALTER TABLE `check_ins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7702;

--
-- AUTO_INCREMENT for table `email_types`
--
ALTER TABLE `email_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1303;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8305;

--
-- AUTO_INCREMENT for table `event_authorizations`
--
ALTER TABLE `event_authorizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2458;

--
-- AUTO_INCREMENT for table `event_signups`
--
ALTER TABLE `event_signups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28103;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expiration_reminders`
--
ALTER TABLE `expiration_reminders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maker_requests`
--
ALTER TABLE `maker_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `preset_emails`
--
ALTER TABLE `preset_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `preset_events`
--
ALTER TABLE `preset_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `preset_events_has_resource_reservations`
--
ALTER TABLE `preset_events_has_resource_reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136300;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=845;

--
-- AUTO_INCREMENT for table `resource_approvers`
--
ALTER TABLE `resource_approvers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_authorizations`
--
ALTER TABLE `resource_authorizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54514;

--
-- AUTO_INCREMENT for table `resource_classes`
--
ALTER TABLE `resource_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resource_fields`
--
ALTER TABLE `resource_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resource_field_data`
--
ALTER TABLE `resource_field_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1493;

--
-- AUTO_INCREMENT for table `resource_hours`
--
ALTER TABLE `resource_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service_spaces`
--
ALTER TABLE `service_spaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_space_requests`
--
ALTER TABLE `service_space_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=792398;

--
-- AUTO_INCREMENT for table `space_hours`
--
ALTER TABLE `space_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `studio_spaces`
--
ALTER TABLE `studio_spaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4679;

--
-- AUTO_INCREMENT for table `user_has_permissions`
--
ALTER TABLE `user_has_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=603;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=971;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_teammates
--
ALTER TABLE `project_teammates`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_logs
--
ALTER TABLE `project_logs`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tool_logs
--
ALTER TABLE `tool_logs`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FK_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preset_events`
--
ALTER TABLE `preset_events`
  ADD CONSTRAINT `event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preset_events_has_resources`
--
ALTER TABLE `preset_events_has_resources`
  ADD CONSTRAINT `fk_preset_events_has_resources_preset_events1` FOREIGN KEY (`preset_events_id`) REFERENCES `preset_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_preset_events_has_resources_resources1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`primary_emergency_contact_id`) REFERENCES `emergency_contacts` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`secondary_emergency_contact_id`) REFERENCES `emergency_contacts` (`id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `owner_user_id` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_teammates`
--
ALTER TABLE `project_teammates`
  ADD CONSTRAINT `teammate_id` FOREIGN KEY (`teammate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
