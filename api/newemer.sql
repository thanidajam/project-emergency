-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 02:10 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newemer`
--

-- --------------------------------------------------------

--
-- Table structure for table `emergency`
--

CREATE TABLE `emergency` (
  `EID` int(11) NOT NULL,
  `E_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `E_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `E_date` datetime NOT NULL,
  `Pic` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `lat` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lng` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Send_emer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Rec_emer` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emergency`
--

INSERT INTO `emergency` (`EID`, `E_type`, `E_name`, `E_date`, `Pic`, `lat`, `lng`, `Location`, `Phone`, `Status`, `Code`, `Send_emer`, `Rec_emer`) VALUES
(1, 'B', 'รถชน', '2022-01-19 11:17:46', '/emer_projectnew/api/emergency/emergency86911.jpg', '37.4220069', '-122.0839954', 'ตึกสำนักงานอธิการบดี', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(2, 'B', 'รถล้ม', '2022-02-11 15:21:00', '/emer_projectnew/api/emergency/emergency53303.jpg', '37.4220069', '-122.0839954', 'หอประชุมมทร.ธัญบุรี', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(3, 'A', '', '2022-01-25 15:42:10', '/emer_projectnew/api/emergency/emergency92075.jpg', '37.4220069', '-122.0839954', 'หอประชุมมทร.ธัญบุรี', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(4, 'A', 'หมดสติ', '2021-04-14 11:23:01', '/emer_projectnew/api/emergency/emergency63137.jpg', '37.4220069', '-122.0839954', 'โรงอาหารกลาง', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(5, 'C', 'หัวแตก', '2021-05-15 12:29:49', '/emer_projectnew/api/emergency/emergency87999.jpg', '37.4220069', '-122.0839954', 'ตึกคณะวิศวกรรมศาสตร์', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(6, 'C', 'ไฟช็อต', '2021-06-24 14:26:14', '/emer_projectnew/api/emergency/emergency7129.jpg', '37.4220069', '-122.0839954', 'กองอำนวยการ', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(7, 'C', 'จมน้ำ', '2021-07-15 15:30:36', '/emer_projectnew/api/emergency/emergency35326.jpg', '37.4220069', '-122.0839954', 'สระว่ายน้ำ', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(8, 'A', 'หมดสติ', '2021-08-01 12:33:08', '/emer_projectnew/api/emergency/emergency37320.jpg', '37.4220069', '-122.0839954', 'คณะวิทยาศาสตร์', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(9, 'B', 'รถล้ม', '2021-10-11 11:35:13', '/emer_projectnew/api/emergency/emergency19545.jpg', '37.4220069', '-122.0839954', 'คณะศิลปศาสตร์', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(10, 'A', 'เป็นลม', '2021-11-15 15:36:05', '/emer_projectnew/api/emergency/emergency92873.jpg', '37.4220069', '-122.0839954', 'คณะศิลปศาสตร์', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(11, 'A', 'เป็นลมหมดสติ', '2021-12-21 14:38:04', '/emer_projectnew/api/emergency/emergency19892.jpg', '37.4220069', '-122.0839954', 'อาคารเรียนรวม 13 ชั้น', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(12, 'B', 'รถชนกัน', '2021-12-15 12:39:20', '/emer_projectnew/api/emergency/emergency13295.jpg', '37.4220069', '-122.0839954', 'ตึกภาควิชานาฎดุริยางคศิลป์', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(13, 'n', 'ปวดท้องอาหารเป็นพิษ', '2021-11-18 12:40:38', '/emer_projectnew/api/emergency/emergency66157.jpg', '37.4220069', '-122.0839954', 'ตึกคณะวิทยาศาตร์และเทคโนโลยี', '0820214875', 'T', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(15, 'B', 'รถชน', '2021-01-20 16:12:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะวิศวกรรมศาสตร์', '0859698215', 'T', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(16, 'B', 'รถชน', '2021-02-16 09:22:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะบริหารธุรกิจ', '0859698215', 'T', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(17, 'B', 'รถชน', '2021-03-10 11:45:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'ตึกสำนักงานอธิการบดี', '0859698215', 'T', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(18, 'B', 'รถชน', '2021-03-24 12:08:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'ตึกคณะวิศวกรรมศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(19, 'B', 'รถชน', '2021-04-15 13:47:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะเทคโนโลยีสารสนเทศ', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(20, 'B', 'รถชน', '2021-05-24 13:29:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะศิลปศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(21, 'B', 'รถชน', '2021-06-15 15:43:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะศิลปกรรมศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(22, 'B', 'รถชน', '2021-07-02 13:49:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'ตึกคณะวิศวกรรมศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(23, 'B', 'รถชน', '2021-08-16 11:39:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะวิทยาศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(24, 'B', 'รถชน', '2021-09-01 15:29:50', '/emer_projectnew/api/emergency/emergency86911.jpg', '', '', 'คณะวิทยาศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(25, 'A', 'เป็นลม', '2021-01-27 15:12:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'คณะศิลปศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(26, 'A', 'เป็นลม', '2021-02-28 11:22:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'ตึกคณะวิศวกรรมศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(27, 'A', 'เป็นลม', '2021-03-12 12:20:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'ตึกสำนักงานอธิการบดี', '0859698215', 'T', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(28, 'A', 'เป็นลม', '2021-03-31 10:25:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'คณะศิลปศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(29, 'A', 'เป็นลม', '2021-04-10 10:23:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'คณะศิลปศาสตร์', '085969815', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(30, 'A', 'เป็นลม', '2021-05-09 10:12:50', '/emer_projectnew/api/emergency/emergency92075.jpg', '', '', 'คณะศิลปศาสตร์', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(31, 'C', 'ปวดท้องอาหารเป็นพิษ', '2021-01-18 14:42:50', '/emer_projectnew/api/emergency/emergency66157.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(32, 'C', 'ปวดท้องอาหารเป็นพิษ', '2021-02-26 13:32:50', '/emer_projectnew/api/emergency/emergency66157.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(33, 'C', 'ปวดท้องอาหารเป็นพิษ', '2021-03-13 15:01:50', '/emer_projectnew/api/emergency/emergency66157.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(34, 'C', 'หัวแตก', '2021-04-05 16:22:50', '/emer_projectnew/api/emergency/emergency87999.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(35, 'C', 'หัวแตก', '2021-05-22 15:22:50', '/emer_projectnew/api/emergency/emergency87999.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '085969821', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(36, 'C', 'หัวแตก', '2021-06-26 11:22:50', '/emer_projectnew/api/emergency/emergency87999.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(37, 'C', 'หัวแตก', '2021-07-03 14:52:50', '/emer_projectnew/api/emergency/emergency87999.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(38, 'C', 'ไฟช็อต', '2021-08-22 11:38:50', '/emer_projectnew/api/emergency/emergency7129.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(39, 'C', 'จมน้ำ', '2021-09-17 16:43:50', '/emer_projectnew/api/emergency/emergency35326.jpg', '', '', 'อาคารเรียนรวม 13 ชั้น', '0859698215', 'T', '', 'นภสร สุขใจ', 'บุญมี ธรรมรงค์'),
(40, 'A', '', '2022-02-11 17:04:22', '', '37.4220012', '-122.0840024', 'ตึกคณะวิทยาศาตร์และเทคโนโลยี', '0820214875', 'F', '', 'ฐนิดา ทาบุเรศ', 'บุญมี ธรรมรงค์'),
(41, 'A', '', '2021-08-02 11:53:13', '/emer_projectnew/api/emergency/emergency92075.jpg\r\n', '', '', '', '0820214877', 'F', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(42, 'B', '', '2021-04-22 14:23:13', '', '', '', 'สระว่ายน้ำ', '0888898889', 'F', '', 'นภสร  สุขใจ', 'บุญมี ธรรมรงค์'),
(107, 'C', '', '2022-02-20 05:42:47', '', '37.4220047', '-122.0839995', 'null', '0850214875', 'n', '', 'ฐนิดา ทาบุเรศ', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `first_aid`
--

CREATE TABLE `first_aid` (
  `FID` int(11) NOT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Text` text COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `Media` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `first_aid`
--

INSERT INTO `first_aid` (`FID`, `Code`, `Title`, `Text`, `Status`, `Media`) VALUES
(1, 'T001', 'หมดสติแต่หายใจ', '1. ตรวจดูการหายใจ โดยดันศรีษะไปด้านหลัง เชยคางขึ้นดูการหายใจ\r\nผู้ป่วยหมดสติกล้ามเนื้อจะคลายตัวลิ้นอาจตกไปอุดกั้นทางเดินหายใจได้ ดังนั้นผู้ป่วยจะหายใจได้ไม่นาน ให้เปิดทางเดินหายใจโดยดันหน้าผากไปด้านหลังให้หน้าแหงนขึ้น และดึงคางมองดูการเคลื่อนไหวของส่วนหน้าอก การฟังเสียงลมหายใจ และความรู้สึกโดยเอียงหน้าเข้าใกล้ปาก-จมูกของผู้ป่วยเพื่อสัมผัสว่าเขายังมีลมหายใจอยู่หรือไม่\r\n2. จับผู้ป่วยให้อยู่ในท่าพักฟื้น (ตะแคงข้าง) จับศรีษะให้เอียงไปด้านข้าง \r\nการจัดให้ผู้ป่วยอยู่ในท่าพลิกตะแคงตัวโดยให้ศรีษะแหงนไปด้านหลังเพื่อเปิดทางเดินหายใจโดยทำให้มั่นใจว่าลิ้นผู้ป่วย จะไม่ตกไปด้านหน้ามาอุดกั้นทางเดินหายใจป้องกันการสำลักน้ำลายหรือเสมหะการอาเจียนและเลือดไหล\r\n3. เรียกรถพยาบาลให้เร็วเท่าที่จะทำได้ หรือให้ผู้อื่นแจ้ง\r\n', 'T', 'post_20170517095620.jpg'),
(2, 'T002', 'หมดสติแต่ไม่หายใจ', '1. ปลุก\r\nเมื่อพบผู้ป่วยหมดสติ อย่าเพิ่งตกใจ ให้ประเมินความปลอดภัยของสถานที่เกิดเหตุก่อนเป็นอันดับแรก โดยตรวจดูบริเวณรอบๆ ก่อนเข้าไปช่วยเหลือ เช่น สายไฟฟ้าที่ช็อตอยู่จุดใด บริเวณนั้นใกล้แหล่งน้ำหรือไม่ มีรถสัญจรหรือเปล่า จะได้ไม่เกิดอันตรายซ้ำ หลังจากนั้นให้ปลุกเรียกผู้ป่วยด้วยการตบไหล่ ทั้งสองข้างและเรียกเสียงดังๆ ว่า “คุณคะๆ/คุณครับๆ” หากไม่รู้สึกตัวและไม่หายใจ ให้รีบทำตามขั้นตอนต่อไปโดยทันที ส่วนกรณีที่ผู้ป่วยรู้สึกตัวและหายใจเองได้ ให้จับตัวผู้ป่วยให้อยู่ในท่านอนตะแคง และทำการปฐมพยาบาลตามอาการที่เจอ ซึ่งจะกล่าวในภายหลัง\r\n2. โทร\r\nรีบโทรขอความช่วยเหลือที่สายด่วน 1669 โดยแจ้งอาการผู้ป่วย สถานที่เกิดเหตุ ชื่อและเบอร์โทรศัพท์ของผู้แจ้งเพื่อให้เจ้าเหน้าที่ติดต่อกลับหากที่หาที่เกิดเหตุไม่เจอ รวมถึงแจ้งรายละเอียดของผู้ป่วย เช่น อาการ สถานที่ที่พบ เส้นทางที่เดินทางมาได้สะดวก หากอยู่เพียงลำพัง อย่าทิ้งผู้ป่วยไปไหน ให้เปิดลำโพงโทรศัพท์ เพื่อสื่อสารและรับฟังคำแนะนำจากเจ้าหน้าที่กู้ชีพ หากอยู่หลายคนให้ผู้อื่นเป็นคนโทร.แจ้ง หากแถวนั้นไม่มีเครื่อง AED ให้แจ้งเจ้าหน้าที่นำเครื่อง AED มาด้วย ตัวอย่างการแจ้งเหตุทางโทรศัพท์ : \"พบผู้ป่วยหมดสติไม่หายใจ เป็นผู้ชายอายุประมาณ 50 ปี ที่ป้ายรถเมล์หน้าโรงเรียนเอบีซี ผมผู้พบเหตุ ชื่อนายต้น เบอร์ติดต่อ 08X-XXX-XXXX และให้นำเครื่อง AED มาด้วย\"\r\n3. ปั๊ม\r\nการกดหน้าอกสามารถช่วยเพิ่มโอกาสการรอดชีวิตของผู้ป่วยที่หัวใจหยุดเต้นขณะที่รอหน่วยปฏิบัติการกู้ชีพ โดยให้คุกเข่าบริเวณข้างลำตัวผู้ป่วยในระดับไหล่ จัดท่าผู้ป่วยนอนหงายเพื่อเปิดทางเดินหายใจโดยการ ดันหน้าผาก - ดึงคางขึ้น และตรวจสอบการหายใจโดยการเอียงหูฟังแนบที่จมูกผู้ป่วย จากนั้นให้เริ่มช่วยฟื้นคืนชีพ (CPR) ด้วยการกดหน้าอก โดยวางสันมือข้างที่ถนัดตรงครึ่งล่างกระดูกหน้าอก และวางมืออีกข้างทับประสานกันไว้ เริ่มการกดหน้าอกด้วยความลึกอย่างน้อย 5 เซนติเมตร ในอัตราเร็ว 100 - 120 ครั้งต่อนาที ข้อแนะนำ : หากมีโอกาสได้เรียนให้พยายามซ้อมทำบ่อยๆ เวลาทำจริงเราจะทำได้ด้วยความแรงและน้ำหนักที่ถูกต้อง\r\n', 'T', 'Chest-compression.jpg'),
(3, 'T003', 'โรคลมแดด', '1. ผิวของคนที่เป็นโรคลมแดดอาจจะร้อนหรือแดงและอาจจะแห้งหรือชุ่ม ผู้ป่วยอาจจะเริ่มมีความรู้สึกตัวลดลงและมีอาการแสดงเช่นรู้สึกเหมือนจะอาเจียนอุณหภูมิในร่างกายเพิ่มขึ้น \r\n2. โทร 1669 เร็วที่สุดเท่าที่จะทำได้หรือให้คนอื่นช่วยโรคลมแดดเป็นภัยคุกคามถึงชีวิต \r\n3. ย้ายผู้ป่วยไปยังสถานที่ที่มีอากาศเย็นกว่าถอดหรือขยับเสื้อผ้าให้หลวมเพื่อให้รู้สึกสบายและเย็นขึ้นใช้พัดพัดให้เย็นถ้าผู้ป่วยรู้สึกตัวให้จิบน้ำเย็นให้เขาดื่มช้าๆเฝ้าดูสภาวะการเปลี่ยนแปลงของผู้ป่วย \r\n4. ถ้าจําเป็นต้องให้ความเย็นเป็นระยะ ๆ อย่างต่อเนื่องให้ประยุกต์การให้ความเย็นหรือใช้ถุงความเย็น (cold pack) ห่อในเสื้อบริเวณข้อต่อข้อเท้าขาหนีบคอและรักแร้ความเกี่ยวเนื่องกับการปฐมพยาบาล\r\n', 'T', '1_Thumbnail.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `email` varchar(100) NOT NULL,
  `key` varchar(200) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset_temp`
--

INSERT INTO `password_reset_temp` (`email`, `key`, `expDate`) VALUES
('bitboss.123@gmail.com', 'a8eed26ea214008bd9deaf910ea405aa8361e1a594', '2022-02-12 13:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` int(11) NOT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `image` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `Token` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `Code`, `Username`, `Password`, `Name`, `Email`, `Phone`, `Type`, `image`, `Token`) VALUES
(1, 'A001', 'Admin', 'Admin', 'Admin', 'bitboss.123@gmail.com', '0888888888', 'A', 'AnnThongprasom.png', ''),
(6, 'S002', '116110905015-2', '174980', 'พบธรรม กุนราช', 'pobtumkunratch@gmail.com', '0928475800', 'S', '/emer_projectnew/api/user/image92039.jpg', 'dRCHH1xPTP6y8LJP5BUEmh:APA91bEE4cUROU7IYBUFtr9pI-GAxXO04TFvDYAgMmqKRoXqOwXtw51fKrMoAO7XeR2pJHt1guvOmz8Fqo_9LJ-6lYqrmtXvbFs1NO0TBlHZIF_aLmE7dxNahKB2FY3yiVRhPPEPofWo'),
(7, 'S001', '116110905043-4', '04042542', 'ฐนิดา ทาบุเรศ', 'thanidajam2542@gmail.com', '0820214875', 'S', '/emer_projectnew/api/user/avatar3575.jpg', 'eeqWCqzCSmqfVFlP_eOHQM:APA91bHxx9zssOjKGdUJlFO2rqa4tKxndj6qHkzY-BjeRm1asIkhYQMevaMLRb1hA-6aa74P19SWMIW2IybcKavwg1dT0yjEuajEKkzD3YXu-hviMf2yFRLrZglscEUBYTYAySkFO9CH'),
(10, 'D001', 'boonmee', 'boonmee123', 'บุญมี ธรรมรงค์', 'boonmee@gmail.com', '0612894000', 'D', '/emer_projectnew/api/user/edit39edit94edit76image86085.jpg', 'cfvfz-HpQYmSd51TJIK6Ta:APA91bHvEOufAJtC-1W7IkgSklkLxTlS4sRHViXUjXOwjz5ihynLPNOfCbj7Zj7eJ3G0g8ie7XXK9yYLZ5EpROuD79crhh9ryH2GP6tvGvjHO50AKeLOXx_SKC1Hm4sgkFK6D7tXj4Eq'),
(12, 'S003', '116110905010-3', '463461', 'นภสร สุขใจ', 'bitboss.123@gmail.com', '0800591456', 'S', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emergency`
--
ALTER TABLE `emergency`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `first_aid`
--
ALTER TABLE `first_aid`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emergency`
--
ALTER TABLE `emergency`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `first_aid`
--
ALTER TABLE `first_aid`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
