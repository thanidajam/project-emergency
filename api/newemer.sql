-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2021 at 08:59 AM
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
  `Status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `Send_emer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Rec_emer` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emergency`
--

INSERT INTO `emergency` (`EID`, `E_type`, `E_name`, `E_date`, `Pic`, `lat`, `lng`, `Status`, `Send_emer`, `Rec_emer`) VALUES
(1, 'A', 'รถล้ม', '2020-02-18 18:20:55', 'accident.png', '0.3', '0.5', 'T', '', ''),
(2, 'C', 'กระดูกหักบริเวณนิ้วมือ', '2021-08-11 09:50:55', '476194.jpg', '0.6', '63.2', 'T', '', ''),
(3, 'A', 'เป็นลมหมดสติ', '2021-10-01 15:51:11', 'Image1.png', 'โรงอาหารกลาง', '', 'T', '', ''),
(4, 'C', 'เกิดอุบัติเหตุ', '2020-03-11 15:51:11', 'accident.png', 'คณะวิทยาศาสตร์', '', 'F', '', ''),
(5, 'C', 'เจ็บป่วย', '2021-12-21 09:51:11', 'Image1.png', '1.2', '0.22', 'F', '', '');

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
  `image` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `Code`, `Username`, `Password`, `Name`, `Email`, `Phone`, `Type`, `image`) VALUES
(1, 'A001', 'Admin', 'Admin', 'Admin', 'Admin@gmail.com', '0888888888', 'A', 'AnnThongprasom.png'),
(6, 'S002', '116110905015-2', '174980', 'พบธรรม กุนราช', 'pobtumkunratch@gmail.com', '0928475800', 'S', '/emer_projectnew/api/user/image92039.jpg'),
(7, 'S001', '116110905043-4', '04042542', 'ฐนิดา ทาบุเรศ', 'thanidajam2542@gmail.com', '0820214875', 'S', '/emer_projectnew/api/user/avatar3575.jpg'),
(10, 'D001', 'boonmee', 'boonmee123', 'บุญมี ธรรมรงค์', 'boonmee@gmail.com', '0612897500', 'D', '/emer_projectnew/api/user/image86085.jpg');

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
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `first_aid`
--
ALTER TABLE `first_aid`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
