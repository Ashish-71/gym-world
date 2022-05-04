-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 10:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(6, 'Cardio', 1),
(7, 'Bodybuilding', 1),
(8, 'Merchants', 1),
(9, 'Supplements', 1),
(10, 'Crossfit', 1),
(11, 'running', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(5, 'ashish soni', 'aashishsoni71001@gmail.com', '9737093206', 'ashish soni is not a developer he is a fake one', '2022-04-26 11:46:50'),
(6, 'ashish soni', 'aashishsoni71001@gmail.com', '8401082262', 'Hello fitness Center...', '2022-04-28 06:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`) VALUES
(3, 4, '52, PADMAVATI SOCIETY', 'AHMEDABAD', 382480, 'COD', 6456, 'pending', 1, '2fcbaade0543a7b0edfd', '', '', '2022-04-19 11:50:06'),
(4, 4, '52, PADMAVATI SOCIETY', 'AHMEDABAD', 382480, 'COD', 499, 'pending', 1, '67c8b0e3ddfed607ca44', '', '', '2022-04-27 01:30:12'),
(5, 4, '52, PADMAVATI SOCIETY', 'AHMEDABAD', 382480, 'COD', 110000, 'pending', 1, '6ec3e027325aa2b946a3', '', '', '2022-04-28 07:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 2, 1, 155800),
(2, 1, 1, 1, 8499),
(3, 2, 9, 1, 1560),
(4, 3, 10, 1, 6456),
(5, 4, 13, 1, 499),
(6, 5, 14, 1, 110000);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 1, 0, 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 9999, 8499, 10, '799153645_303b4a46-a701-4b43-b9c1-d98a2b53422f.jpg', 'Mauris dapibus tellus quis risus maximus molestie. Curabitur eget tortor tellus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus scelerisque quis nisi porta congue. Aenean sed maximus ligula. Vestibulum quis eros id ex condimentum lacinia. Nam interdum finibus odio, sit amet commodo erat varius sed. In at velit velit. Nullam vitae gravida mi. Donec aliquet nunc non ipsum bibendum, et elementum nibh lobortis. Fusce tempor elit at mauris luctus euismod. Donec eu massa eros. Aenean maximus vitae nisl ut sollicitudin. Aenean urna arcu, laoreet at ante eget, maximus mattis lacus. Mauris dapibus tellus quis risus maximus molestie. Curabitur eget tortor tellus.', 1, 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', '', 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 1),
(2, 1, 0, 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', 165800, 155800, 4, '942626953_iphone.jpg', 'Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 'Curabitur eget augue dolor. Curabitur id dapibus massa. Vestibulum at enim quis metus ultrices posuere vitae sit amet eros. Morbi et libero pellentesque, efficitur odio nec, congue lorem. Vestibulum faucibus, risus eget pretium efficitur, neque nulla eleifend purus, non venenatis lorem ligula vel nulla. Fusce finibus efficitur sapien vitae laoreet. Integer imperdiet justo sed tellus dictum, at egestas arcu finibus. Fusce et augue elit. Praesent tincidunt purus in purus dictum volutpat. Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 0, 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', '', 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', 1),
(3, 1, 0, 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 115900, 115900, 5, '567328558_samsung-galaxy-s10-plus-1tb-ceramic-white-12gb-ram-.jpg', 'Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 'Nullam a nunc et lorem ornare faucibus. Etiam tortor lacus, auctor eget enim at, tincidunt dignissim magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin tincidunt eros eget felis tempor, id volutpat ipsum lacinia. Donec scelerisque risus non purus scelerisque tristique. Mauris enim ligula, condimentum sed iaculis nec, porttitor eu nunc. Sed hendrerit vel arcu vitae iaculis. Phasellus vehicula molestie leo. Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 0, 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 1),
(4, 2, 0, 'SHEEN-SOLID TROUSER-OLIVE', 1999, 1200, 3, '697347005_2__1538219531_49.204.69.38_600x.jpg', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 0, 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 1),
(5, 2, 0, 'NATURE-LINEN SHIRT-GREEN', 2799, 2399, 8, '812581380_nature_green-0224_600x.jpg', 'a nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 0, 'NATURE-LINEN SHIRT-GREEN', 'NATURE-LINEN SHIRT-GREEN', 'T-Shirt, NATURE-LINEN SHIRT-GREEN', 1),
(6, 2, 0, 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 1999, 1500, 8, '931830512__8-(1)-E5x-104831-NJD.jpg', 'lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Duis in risus quis lectus dictum fringilla. Aenean tempor pellentesque velit id ullamcorper. Ut id aliquam odio. Morbi id pharetra libero, ut tempor nisi. Maecenas a lectus nec risus maximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex dictum nisl bibendum elementum non in turpis. In bibendum ipsum nunc, bibendum lacinia lacus maximus eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus aliquam lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 0, 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 1),
(7, 4, 0, 'Floral Print Polo T-shirt', 1900, 1350, 7, '309027777_Floral-Print-Polo-T-shirt.jpg', 'isl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 0, 'Floral Print Polo T-shirt', 'Floral Print Polo T-shirt', 'Floral Print Polo T-shirt', 1),
(8, 4, 0, 'Floral Embroidered Polo T-shirt', 1120, 1900, 10, '651584201_Floral-Embroidered-Polo-T-shirt.jpg', 'rius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 'Vestibulum in auctor turpis. Quisque hendrerit eget turpis et molestie. Phasellus nec nibh a lacus rhoncus eleifend. Donec suscipit id diam non mattis. Fusce eu luctus leo. Etiam eget dui libero. Etiam eros lorem, rhoncus et convallis eget, tempus vel tellus. Nam at diam quis nisl tincidunt aliquam. Quisque placerat magna non libero interdum varius vel id risus. Vivamus mollis maximus fermentum. Donec eget nulla dui. Sed ultricies malesuada metus, non feugiat purus fringilla ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer accumsan, tortor id eleifend varius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 1, 'Floral Embroidered Polo T-shirt', '', 'Floral Embroidered Polo T-shirt', 1),
(9, 4, 0, 'Floral Print Polo T-shirt Latest', 650, 1560, 10, '526258680_Floral-Print-Polo-T-shirt1.jpg', 's mus. Vestibulum eget posuere orci, eu ultrices sapien. Orc', 'aximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex d', 1, 'Floral Print Polo T-shirt Latest', '', 'Floral Print Polo T-shirt Latest', 1),
(11, 8, 0, 'Puma Gym Track', 500, 650, 2, '122846981_250199201_WhatsApp Image 2022-04-06 at 2.20.50 PM.jpeg', 'Puma Gym Track for fitness, jogging', 'Puma', 1, 'Puma track', '', '', 1),
(12, 8, 0, 'Nike T-shirt', 899, 499, 2, '183909882_WhatsApp Image 2022-04-06 at 10.58.16 AM (2).jpeg', 'New Arrivals', 'Nike T-shirt for women & Men', 1, 'Nike T-shirt', 'Nike T-shirt', 'Nike T-shirt', 1),
(13, 8, 0, 'Adidas Shorts', 899, 499, 1, '747032607_WhatsApp Image 2022-04-06 at 10.58.16 AM.jpeg', 'Adidas Shorts', 'Adidas Shorts', 0, 'Adidas Shorts', 'Adidas Shorts', 'Adidas Shorts', 1),
(14, 6, 2, 'Tredmill', 100000, 110000, 1, '410634435_Untitled (7).jpg', 'Use To Belly Fat', 'Adaptive Running Surface- 61 x 21 Inch<br>\r\nPerformance Monitoring Show all workout stats<br>\r\n7HP Heavy Duty AC Motor - Work continuous upto 72 Hrs<br>\r\nAuto Heat Dissipation System<br>\r\nEasy Quick Access Button Panel<br>\r\n20 Kmhr Max Running Speed<br>\r\nSimulate hill training with 15 Grade Auto Inclination<br>\r\nHydraulic Lift Assist', 1, 'Best Treadmill', '', '1', 1),
(15, 7, 0, 'STRENGTH', 5000, 10000, 1, '113029793_pngegg.png', 'Here this is a Body building machine', 'Machine', 1, 'Body Machine', 'Body Machine', 'Body Machine', 1),
(16, 6, 2, 'Slimming-Treadmill', 69900, 68900, 1, '642372682_Slimming-Treadmill.jpg', 'SLIMMING TREADMILL', '• ITALIAN PATENT DESIGN<br>\r\n• WALKING AND CLIMBING 2 IN 1 FEATURE – Fitness world presented this spacial 2 in 1 feature, It will help you to burn your body fat fast, SPEED RANGE: 1 to 15 km/H, Motor Power: 3.5 HP Peak MOTOR ( Industrial Grade)<br>\r\n• LCD MONITOR and PULSE GRIP: Monitors the Time, Distance, Calories, Inline, Speed Time, includes 9 workout programs that keep you challenged with your fitness goals<br>\r\n• The Fitness World Home Runner Motorized Treadmill comes with a 1-year warranty on motor', 0, 'SLIMMING TREADMILL', 'SLIMMING TREADMILL', 'SLIMMING TREADMILL', 1),
(17, 6, 2, 'Home-Runner-Treadmill', 57000, 55999, 1, '127815622_Home-Runner-Treadmill.jpg', 'HOME RUNNER', '• LCD MONITOR PULSE GRIP: Monitors the Time, Distance, Calories, Inline, Speed Time, includes 9 workout programs that keep you challenged with your fitness goals<br>\r\n• ITALIAN PATENT DESIGN – Sturdy, Quiet High Quality: : Solid steel construction with extra shock absorption system makes your indoor run or walk a steady and effective cardio workout while getting the best value from fitness world treadmills<br>\r\n• Online Installations Service: Free video-call-assisted installation<br>\r\n• SPEED RANGE: 1 to 9 km/H, Motor Power: 2 HP Peak MOTOR ( Industrial Grade)<br>\r\n• The Fitness Center Home Runner Motorized Treadmill comes with a 1-year warranty on moto', 0, 'HOME RUNNER', 'HOME RUNNER', 'Home-Runner-Treadmill', 1),
(18, 6, 2, '8-5555-treadmill', 55000, 54500, 1, '251937422_8-5555-treadmill.jpg', '8-5555-treadmill', 'Function & Features:<br>  \r\n•  Motor Power : 8 HP<br>\r\n•  Speed : 1-20 Kmph<br>\r\n•  Incline : 0%-20%<br>\r\n•  Running Surface : 1560×520 mm<br>\r\n•  Max User Weight : 180 Kg<br>\r\n•  Product Size : 2210*890*1665mm<br>\r\n•  N.W. : 201kg G.W.:265kg', 0, 'treadmill', 'treadmill', '8-5555-treadmill', 1),
(19, 6, 2, 'FW 2200 TREADMILL', 59663, 58663, 1, '880773967_FW 2200 TREADMILL.jpg', 'FW 2200 TREADMILL', '<b>Technical Specification</b><br>\r\n\r\n<br>Motor Power: 4 HP AC Motor Industrial Grade<br>\r\nSpeed Range: 01 to 14 Km/Hr<br>\r\nSpeed Range Adjustable: 0.1 Grade<br>\r\nElevation: 0 to 16 Auto incline<br>\r\nRunning Belt Area: 40cm to 124cm<br>\r\nPVC Antistatic Belt:  Right   <br>\r\nSpring Flex Technology:  Right   <br>\r\n10 elastomers shock absorbing system:  Right <br>\r\n\r\n<br><b>All-inclusive price </b>:-  Free Shipping, Express Delivery, and Free-Installation.', 0, 'FW 2200', 'FW 2200', 'FW 2200', 1),
(20, 6, 2, 'BETTLE TREADMILL', 60000, 59100, 1, '527661598_Bettle-Treadmill.jpg', 'BETTLE COMMERCIAL MOTORIZED', '<br><b>Technical Specifications</b></br>\r\n•	Characteristic : Single Display</br>\r\n•	Running area : 1550mm*590mm</br>\r\n•	Running belt thickness : 3mm</br>\r\n•	Maintenance-freeFree-lubrication</br>\r\n•	Screen size(back Screen) : 390mm*470mm</br>\r\n•	Motor power – 10 HP industrial Grade</br>\r\n•	Input Power voltage : AC220v+_10%(50hz or 60hz) </br>\r\n•	Speed : 1-20 km/h</br>\r\n•	Running board thickness: 25mm</br>\r\n•	Incline : 0%-20%</br>\r\n•	Max load weight : 200kg</br>\r\n•	Treadmill size: L : 2254mm*W:925mm*H:1768mm</br>\r\n•	N.W. : 225KG</br>\r\n•	Guarantee: 10 Years</br>', 0, 'BETTLE COMMERCIAL MOTORIZED TREADMILL', 'BETTLE COMMERCIAL MOTORIZED TREADMILL', 'BETTLE COMMERCIAL MOTORIZED TREADMILL', 1),
(21, 6, 2, 'Q7 DIGITAL', 67000, 66100, 1, '740891031_Q7-Digital.jpg', 'Q7 DIGITAL COMMERCIAL MOTORIZED TREADMILL', '<br><b> Technical Specifications </b><br>\r\n•	Motor Power: 10HP AC Industrial Grade<br>\r\n•	Speed range: 1-25km/h<br>\r\n•	Speed range increment: 0.1 Grade<br>\r\n•	Display Type: 15.6? TFT touch screen provide Wi-Fi, Media, USB Input (play & charge) <br>\r\n•	Elevation/incline: 0% to 15% (16 Levels) <br>\r\n•	Effective running surface: 24 x 65 Inch<br>\r\n•	PVC Antistatic belt: Yes<br>\r\n•	Cushioning system: Yes<br>\r\n•	Program: 36 pre-set programs + 3 user’s manual + 1 manual', 0, 'Q7 DIGITAL', 'Q7 DIGITAL', 'Q7 DIGITAL', 1),
(22, 6, 2, 'LUCCA DIGITAL', 78999, 75666, 1, '436512273_NEW-LUCCA.jpg', 'LUCCA DIGITAL', '<br><b> Technical Specifications </b><br>\r\n•	Motor Power: 10 HP AC Motor Industrial Grade<br>\r\n•	Speed Range: 1.5 to 25 Km/Hr<br>\r\n•	Speed Range Increment: 0.1 Grade<br>\r\n•	Display Type: 15? TFT Screen with Wifi<br>\r\n•	Elevation: 0% to 22 (23 Levels) <br>\r\n•	Decline: -3 Levels<br>\r\n•	Display Feedback: Speed, Time, Distance,\r\n•	Pulse, Calories, Incline, Decline, Cooldown<br>\r\n•	Effective Running Surface: 23.5 x 64 Inch<br>\r\n•	Belt: 3.1 mm<br>\r\n•	Cushioning System: 6-Point Elastomer Shock Absorber System<br>\r\n•	Programs: 13', 0, 'LUCCA DIGITAL COMMERCIAL MOTORIZED TREADMILL', 'LUCCA DIGITAL COMMERCIAL MOTORIZED TREADMILL', 'LUCCA DIGITAL COMMERCIAL MOTORIZED TREADMILL', 1),
(23, 6, 0, '5555 E', 34999, 33999, 1, '739226484_5555 E.jpg', '5555 E', '<br><b> Technical Specifications </b><br>\r\n•	Display: Time, distance, calories, speed, heart rate, etc. <br>\r\n•	. Pattern: Automatic and memory pattern combine<br>\r\n•	The main strength control: 1-20 grade, EMS self-power magnetic control system<br>\r\n•	Advantage: Flywheel adopt strong magnet precise adsorption resistance adjustment system<br>\r\n•	Power system: Self-power<br>\r\n•	Design: Super large foam armrest, more safe, soft & comfortable, super large pedal design and a storage box<br>\r\n•	Electromagnet controls self-power system, with high precision resistance<br>\r\n•	Machine size: 2050 x 660 x 1800 mm<br>\r\n•	Packing size: 2050 x 640 x 740 mm<br>\r\n•	N.W./G.W: 110 kg / 145 kg', 0, '5555 E', '5555 E', '', 1),
(24, 6, 3, 'TOREN Cycle', 56999, 55499, 1, '665415567_TOREN Cycle.jpg', 'TOREN', '<br><b> Technical Specifications </b><br>\r\n•	Display function: time distance speed calories heart rate and exercise mode<br>\r\n•	Mode: Combination of automatic mode and memory mode<br>\r\n•	The whole vehicle has the functions of hand-held heartbeat and heart rate recovery<br>\r\n•	Resistance control: Section 1-32EMS spontaneous electromagnetic control system<br>\r\n•	The flywheel adopts a precise adsorption resistance adjustment system with strong magnetic magnets<br>\r\n•	Power system: Self -generating type<br>\r\n•	Assembled Size: 2100 x 640 x 1800 mm<br>\r\n•	Packing Size: 2130 x 735 x 895 mm<br>\r\n•	N.W./G.W: 137 KG / 174 KG', 0, 'TOREN Cycle', 'TOREN', 'TOREN', 1),
(25, 6, 1, 'SPINER BMX PRO(YELLOW)', 58024, 57500, 1, '172464518_spiner-bmx-pro-yellow.jpg', 'SPINER BMX PRO', '<br><b> Product Specifications</b><br>\r\n•	Drive System: Manual<br>\r\n•	Resistance Type: Adjustable Wheel Clamp<br>\r\n•	Handle Bar: Vertically  Adjustable<br>\r\n•	Seat: Designed for Maximum Comfort with Horizontal & Vertical Adjustments<br>\r\n•	Fly Wheel: 23 KG Heavy Duty Flywheel for Smooth Motion & Realistic Pedalling<br>\r\n•	Transmission Mode: Super Silent Operation & Minimal Maintenance due to Poly V-Belt<br>\r\n•	Crank: 2 Piece, 17cm Length, Heavy Duty', 0, 'SPINER BMX PRO(YELLOW)', 'SPINER BMX PRO(YELLOW)', 'SPINER BMX PRO(YELLOW)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 6, 'cycle', 1),
(2, 6, 'treadmill', 1),
(3, 6, 'Bikes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(4, 'joshi devarsh', 'devarsh007', 'devarshjoshi2001@gmail.com', '9874561230', '2022-04-19 12:26:24'),
(6, 'ashish soni', 'ashsihsoni', 'aashishsoni71001@gmail.com', '8401082262', '2022-04-27 11:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(16, 1, 4, '2020-05-13 08:54:24'),
(17, 1, 6, '2020-05-15 12:53:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
