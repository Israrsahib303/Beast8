-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2025 at 09:12 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `israrlia_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcasts`
--

CREATE TABLE `broadcasts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('offer','alert','update','info') NOT NULL DEFAULT 'info',
  `btn_text` varchar(50) DEFAULT NULL,
  `btn_link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `broadcasts`
--

INSERT INTO `broadcasts` (`id`, `title`, `message`, `type`, `btn_text`, `btn_link`, `is_active`, `created_at`) VALUES
(1, 'Hi', 'Jdjdjddjd', 'offer', 'Buy now', 'Test.com', 1, '2025-11-22 17:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `sort_order`, `is_active`) VALUES
(1, 'Streaming', 'streaming', 'netflix.svg', 0, 1),
(2, 'AI Tools', 'ai-tools', 'chatgpt.svg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_payments`
--

CREATE TABLE `email_payments` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','claimed','failed') NOT NULL DEFAULT 'pending',
  `claimed_by_user_id` int(11) DEFAULT NULL,
  `claimed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `raw_email_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_payments`
--

INSERT INTO `email_payments` (`id`, `txn_id`, `amount`, `status`, `claimed_by_user_id`, `claimed_at`, `created_at`, `raw_email_data`) VALUES
(1, '6911feeb27675b5dd1bb6e92', 1.00, 'claimed', 3, '2025-11-10 22:20:27', '2025-11-10 17:19:51', '---------- Forwarded message ---------\r\nFrom: NayaPay \r\nDate: Mon, Nov 10, 2025, 8:04 PM\r\nSubject: You got Rs. 1 from Muhammad Amir 🎉\r\nTo: \r\n\r\n\r\n[image: NayaPay]\r\nCha-Ching!\r\n\r\nMuhammad Amir\r\n\r\namirnazir@nayapay\r\n\r\n10 Nov 2025, 08:04 PM\r\nRs. 1\r\nAMOUNT DETAILS\r\n\r\nPrincipal Amount\r\n\r\nRs. 1\r\n\r\nService Fee (Incl. Tax)\r\n\r\nRs. 0\r\n\r\nAmount Received\r\n\r\nRs. 1\r\nTRANSACTION DETAILS\r\n\r\nTransaction ID\r\n\r\n6911feeb27675b5dd1bb6e92\r\n\r\nTransaction Time\r\n\r\n10 Nov 2025, 08:04 PM\r\nView your transactions \r\n[image: INSTAGRAM] [image: FACEBOOK]\r\n \r\n\r\n\r\nDo not reply to this email. Responses to this email are not monitored.\r\n\r\nNayaPay (Private) Limited is authorised and regulated by the State Bank of\r\nPakistan as an Electronic Money Institution.\r\n\r\n(021) 111-222-729  | www.nayapay.com | support@nayapay.com\r\n\r\nNayaPay, its employees or agents will never ask you for your password,\r\nMPIN, OTP or debit card PIN, via call, email, SMS, web links or social\r\nmedia. For security purposes, please do not share this sensitive\r\ninformation with anyone.\r\n'),
(2, '691220c65730075f55080ab4', 1.00, 'claimed', 3, '2025-11-10 22:31:18', '2025-11-10 17:30:03', '------=_Part_556362_1356262689.1762795718884\r\nContent-Type: multipart/alternative; \r\n	boundary=\"----=_Part_556363_208238450.1762795718884\"\r\n\r\n------=_Part_556363_208238450.1762795718884\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\n 1 Muhammad Amir 691220c65730075f55080ab4 10 Nov 2025, 10:28 PM amirnazir \r\n------=_Part_556363_208238450.1762795718884\r\nContent-Type: text/html;charset=UTF-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nNayaPay Email@font-face{font-family:\"DMSansMedium\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Medium.ttf\") format(\"truetype\");font-weight:500;font-style:normal}@font-face{font-family:\"DMSansBold\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Bold.ttf\") format(\"truetype\");font-weight:bold;font-style:normal}@media(min-width:600px){.logo{width:148px !important}.title-text{font-size:28px !important}.general-text{font-size:18px !important;line-height:24px !important}.general-text-2{font-size:16px !important;line-height:24px !important}.general-text-3{font-size:14px !important;line-height:normal !important}.summary-title{font-size:14px !important;line-height:normal !important}.summary-text{font-size:14px !important;line-height:normal !important}.summary-amount{font-size:18px !important;line-height:normal !important}.footer-text{font-size:10px !important}.heading-emoji{font-size:20px !important}} Cha-Ching!  Muhammad Amir  amirnazir@nayapay  10 Nov 2025, 10:28 PM  Rs. 1  AMOUNT DETAILS  Principal Amount  Rs. 1  Service Fee (Incl. Tax)  Rs. 0  Amount Received  Rs. 1  TRANSACTION DETAILS  Transaction ID  691220c65730075f55080ab4  Transaction Time  10 Nov 2025, 10:28 PM  View your transactions  Do not reply to this email. Responses to this email are not monitored.  NayaPay (Private) Limited is authorised and regulated by the State Bank of Pakistan as an Electronic Money Institution. (021) 111-222-729 | www.nayapay.com | support@nayapay.com NayaPay, its employees or agents will never ask you for your password, MPIN, OTP or debit card PIN, via call, email, SMS, web links or social media. For security purposes, please do not share this sensitive information with anyone. \r\n------=_Part_556363_208238450.1762795718884--\r\n\r\n------=_Part_556362_1356262689.1762795718884--\r\n'),
(3, '691236205730075f550d0eca', 1.00, 'claimed', 1, '2025-11-11 00:25:59', '2025-11-10 19:01:01', '------=_Part_624522_729757924.1762801185064\r\nContent-Type: multipart/alternative; \r\n	boundary=\"----=_Part_624523_584765163.1762801185064\"\r\n\r\n------=_Part_624523_584765163.1762801185064\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\n 1 Saddam Hussain 691236205730075f550d0eca 10 Nov 2025, 11:59 PM saddamhussainjut4u \r\n------=_Part_624523_584765163.1762801185064\r\nContent-Type: text/html;charset=UTF-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nNayaPay Email@font-face{font-family:\"DMSansMedium\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Medium.ttf\") format(\"truetype\");font-weight:500;font-style:normal}@font-face{font-family:\"DMSansBold\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Bold.ttf\") format(\"truetype\");font-weight:bold;font-style:normal}@media(min-width:600px){.logo{width:148px !important}.title-text{font-size:28px !important}.general-text{font-size:18px !important;line-height:24px !important}.general-text-2{font-size:16px !important;line-height:24px !important}.general-text-3{font-size:14px !important;line-height:normal !important}.summary-title{font-size:14px !important;line-height:normal !important}.summary-text{font-size:14px !important;line-height:normal !important}.summary-amount{font-size:18px !important;line-height:normal !important}.footer-text{font-size:10px !important}.heading-emoji{font-size:20px !important}} Cha-Ching!  Saddam Hussain  saddamhussainjut4u@nayapay  10 Nov 2025, 11:59 PM  Rs. 1  AMOUNT DETAILS  Principal Amount  Rs. 1  Service Fee (Incl. Tax)  Rs. 0  Amount Received  Rs. 1  TRANSACTION DETAILS  Transaction ID  691236205730075f550d0eca  Transaction Time  10 Nov 2025, 11:59 PM  View your transactions  Do not reply to this email. Responses to this email are not monitored.  NayaPay (Private) Limited is authorised and regulated by the State Bank of Pakistan as an Electronic Money Institution. (021) 111-222-729 | www.nayapay.com | support@nayapay.com NayaPay, its employees or agents will never ask you for your password, MPIN, OTP or debit card PIN, via call, email, SMS, web links or social media. For security purposes, please do not share this sensitive information with anyone. \r\n------=_Part_624523_584765163.1762801185064--\r\n\r\n------=_Part_624522_729757924.1762801185064--\r\n'),
(4, '31763189374194309763570154', 700.00, 'pending', NULL, NULL, '2025-11-15 06:51:02', '------=_Part_4639621_219100071.1763189379023\r\nContent-Type: multipart/alternative; \r\n	boundary=\"----=_Part_4639622_1847651700.1763189379023\"\r\n\r\n------=_Part_4639622_1847651700.1763189379023\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nThere is an incoming fund transfer of Rs. 700 from Raast-{accountNumber} to your NayaPay wallet.\r\n------=_Part_4639622_1847651700.1763189379023\r\nContent-Type: text/html;charset=UTF-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nNayaPay Email@font-face{font-family:\"DMSansMedium\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Medium.ttf\") format(\"truetype\");font-weight:500;font-style:normal}@font-face{font-family:\"DMSansBold\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Bold.ttf\") format(\"truetype\");font-weight:bold;font-style:normal}@media(min-width:600px){.logo{width:148px !important}.title-text{font-size:28px !important}.general-text{font-size:18px !important;line-height:24px !important}.general-text-2{font-size:16px !important;line-height:24px !important}.general-text-3{font-size:14px !important;line-height:normal !important}.summary-title{font-size:15px !important;line-height:normal !important}.summary-text{font-size:14px !important;line-height:normal !important}.summary-amount{font-size:18px !important;line-height:normal !important}.footer-text{font-size:10px !important}.heading-emoji{font-size:20px !important}}:root{color-scheme:light dark;supported-color-schemes:light dark}.body-bg-color{background-color:#fff !important}.trans-msg-bg-color{background-color:#f9f8f8 !important}.footer-bg-color{background-color:#fafafa !important}.footer,.footer td,.footer p,.footer span{color:#757575 !important;background-color:#fafafa !important}.footer-text a{color:#0666eb !important}@media(prefers-color-scheme:dark){*{color:#fff !important}.body-bg-color{background-color:#1f2124 !important}.trans-msg-bg-color{background-color:#757575 !important}.footer-bg-color{background-color:#1f1f1f !important}.footer,.footer td,.footer p,.footer span{background-color:#1f1f1f !important;color:#757575 !important}.footer-text a{color:#0666eb !important}}@media(prefers-color-scheme:light){.body-bg-color{background-color:#fff !important}.trans-msg-bg-color{background-color:#f9f8f8 !important}.footer-bg-color{background-color:#fafafa !important}.footer,.footer td,.footer p,.footer span{color:#757575 !important;background-color:#fafafa !important}.footer-text a{color:##0666eb !important}} Cha-Ching!  Liaquat Ali  JazzCash - Mobilink Microfinance Bank-8432  15 Nov 2025, 11:49 AM  Rs. 700  AMOUNT DETAILS  Amount Received  Rs. 700  Service Fee (Incl. Tax)  Rs. 0  Total Amount  Rs. 700  TRANSACTION DETAILS  Transaction ID  31763189374194309763570154  ADDITIONAL INFORMATION  Source Acc. Title  Liaquat Ali  Source Bank  JazzCash - Mobilink Microfinance Bank  Raast ID / IBAN  ●●●●8432  Destination Acc. Title  Liaqat Ali  Channel  Raast  View your transactionsDo not reply to this email. Responses to this email are not monitored. NayaPay (Private) Limited is authorised and regulated by the State Bank of Pakistan as an Electronic Money Institution.(021) 111-222-729 | www.nayapay.com | support@nayapay.comNayaPay, its employees or agents will never ask you for your password, MPIN, OTP or debit card PIN, via call, email, SMS, web links or social media. For security purposes, please do not share this sensitive information with anyone.\r\n------=_Part_4639622_1847651700.1763189379023--\r\n\r\n------=_Part_4639621_219100071.1763189379023--\r\n'),
(5, '691c2c28180b4d7a0b8e0421', 1.00, 'claimed', 2, '2025-11-18 15:11:42', '2025-11-18 10:11:22', '---------- Forwarded message ---------\r\nFrom: NayaPay \r\nDate: Tue, Nov 18, 2025, 1:19 PM\r\nSubject: You got Rs. 1 from Saddam Hussain 🎉\r\nTo: \r\n\r\n\r\n[image: NayaPay]\r\nCha-Ching!\r\n\r\nSaddam Hussain\r\n\r\nsaddamhussainjut4u@nayapay\r\n\r\n18 Nov 2025, 01:19 PM\r\nRs. 1\r\nAMOUNT DETAILS\r\n\r\nPrincipal Amount\r\n\r\nRs. 1\r\n\r\nService Fee (Incl. Tax)\r\n\r\nRs. 0\r\n\r\nAmount Received\r\n\r\nRs. 1\r\nTRANSACTION DETAILS\r\n\r\nTransaction ID\r\n\r\n691c2c28180b4d7a0b8e0421\r\nView your transactions \r\n[image: INSTAGRAM] [image: FACEBOOK]\r\n \r\n\r\n\r\nDo not reply to this email. Responses to this email are not monitored.\r\n\r\nNayaPay (Private) Limited is authorised and regulated by the State Bank of\r\nPakistan as an Electronic Money Institution.\r\n\r\n(021) 111-222-729  | www.nayapay.com | support@nayapay.com\r\n\r\nNayaPay, its employees or agents will never ask you for your password,\r\nMPIN, OTP or debit card PIN, via call, email, SMS, web links or social\r\nmedia. For security purposes, please do not share this sensitive\r\ninformation with anyone.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT 'Emoji, FontAwesome Class, or Image Path',
  `placement` enum('main','more') NOT NULL DEFAULT 'main',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `icon_color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`id`, `label`, `link`, `icon`, `placement`, `sort_order`, `is_active`, `parent_id`, `icon_color`) VALUES
(1, 'Dashboard', 'index.php', 'fas fa-home', 'main', 1, 1, 0, NULL),
(2, 'Smm panel Area', 'smm_order.php', 'fas fa-rocket', 'main', 2, 1, 0, '#6a50e9'),
(3, 'My subscriptions', 'sub_orders.php', 'fas fa-box-open', 'main', 3, 1, 0, NULL),
(4, 'Deposit', 'add-funds.php', 'fas fa-wallet', 'main', 4, 1, 0, NULL),
(5, 'Services', 'services.php', 'fas fa-bolt', 'more', 1, 1, 2, ''),
(6, 'My Downloads', 'downloads.php', 'fas fa-download', 'more', 2, 1, 0, NULL),
(7, '🤖 AI Tools', 'ai_tools.php', 'fas fa-robot', 'more', 3, 1, 16, '#6a50e9'),
(8, '💬 Support', 'tickets.php', 'fas fa-headset', 'more', 4, 1, 0, NULL),
(9, '💰 Earn', 'earn.php', 'fas fa-sack-dollar', 'more', 5, 1, 16, '#6a50e9'),
(10, '🛠️ Helper tools', 'tools.php', 'fas fa-tools', 'more', 6, 1, 16, '#6a50e9'),
(11, 'The Owner', 'about.php', 'fas fa-crown', 'more', 99, 1, 0, '#6366f1'),
(15, 'My orders', 'smm_history.php', 'fa-solid fa-clock-rotate-left', 'main', 0, 1, 2, '#6a50e9'),
(16, 'More features', 'earn.php', 'fa-brands fa-buromobelexperte', 'main', 100, 1, 0, '#6a50e9');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `duration_months` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','in_progress','completed','cancelled','expired') NOT NULL DEFAULT 'pending',
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `service_username` varchar(255) DEFAULT NULL,
  `service_password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `user_id`, `product_id`, `duration_months`, `unit_price`, `total_price`, `status`, `start_at`, `end_at`, `service_username`, `service_password`, `created_at`) VALUES
(11, 'SH-441781EE', 3, 1, 1, 700.00, 700.00, 'cancelled', '2025-11-09 18:23:59', '2025-11-11 15:54:28', 'Aliyon3@robtecko.cyou', '182829292', '2025-11-09 18:23:59'),
(12, 'SH-7D9F55BF', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-11 13:27:58', '2025-11-11 15:45:30', NULL, NULL, '2025-11-11 13:27:58'),
(13, 'SH-1392B505', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-11 13:28:06', '2025-11-11 14:01:35', NULL, NULL, '2025-11-11 13:28:06'),
(14, 'SH-C473BB9C', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-11 13:28:13', '2025-11-11 14:01:30', NULL, NULL, '2025-11-11 13:28:13'),
(15, 'SH-8D1F39A6', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-11 13:50:17', '2025-11-11 14:00:21', NULL, NULL, '2025-11-11 13:49:15'),
(16, 'SH-971B21B2', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-11 15:57:13', '2025-11-11 15:57:17', NULL, NULL, '2025-11-11 15:56:43'),
(17, 'SH-BDDD9A98', 3, 4, 12, 291.67, 3500.00, 'cancelled', '2025-11-11 16:21:50', '2025-11-11 16:21:58', NULL, NULL, '2025-11-11 16:21:21'),
(18, 'SH-FFFCF805', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-24 16:06:20', '2025-11-24 16:06:31', NULL, NULL, '2025-11-21 05:38:58'),
(19, 'SH-04CC4CDE', 3, 4, 6, 250.00, 1500.00, 'cancelled', '2025-11-24 16:06:26', '2025-11-24 16:06:34', NULL, NULL, '2025-11-21 05:52:17'),
(20, 'SH-6DEA83D5', 3, 4, 1, 350.00, 350.00, 'cancelled', '2025-11-21 06:17:10', '2025-11-24 15:43:49', 'Israrsahib6@gmail.com', 'Israriiii', '2025-11-21 06:09:40'),
(21, 'DL-C1B53A50', 3, 7, 0, 0.00, 500.00, 'cancelled', NULL, '2025-11-24 15:43:46', NULL, NULL, '2025-11-24 11:07:51'),
(22, 'DL-D84733D5', 3, 7, 0, 0.00, 500.00, 'cancelled', NULL, '2025-11-24 15:56:22', NULL, NULL, '2025-11-24 15:49:23'),
(23, 'DL-43E8B596', 3, 7, 0, 0.00, 500.00, 'completed', NULL, NULL, NULL, NULL, '2025-11-24 16:07:02'),
(24, 'SH-C7006CCB', 3, 4, 1, 350.00, 350.00, 'pending', NULL, NULL, NULL, NULL, '2025-11-25 07:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `screenshot_path` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `gateway_ref` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `method`, `amount`, `txn_id`, `screenshot_path`, `status`, `gateway_ref`, `admin_id`, `created_at`, `approved_at`) VALUES
(1, 3, 'SimAuto', 1000.00, NULL, NULL, 'approved', 'SIM_1762707768', NULL, '2025-11-09 17:02:48', '2025-11-09 17:02:48'),
(2, 3, 'SimAuto', 1000.00, NULL, NULL, 'approved', 'SIM_1762707773', NULL, '2025-11-09 17:02:53', '2025-11-09 17:02:53'),
(3, 3, 'JazzCash', 5000.00, '8888', 'ss_6910cd092e6221.97798088.jpeg', 'approved', NULL, 1, '2025-11-09 17:19:05', '2025-11-09 18:23:22'),
(4, 3, 'NayaPay-Auto', 1.00, '6911feeb27675b5dd1bb6e92', NULL, 'approved', 'email_payment_id:1', NULL, '2025-11-10 17:20:27', '2025-11-10 17:20:27'),
(5, 3, 'NayaPay-Auto', 1.00, '691220c65730075f55080ab4', NULL, 'approved', 'email_payment_id:2', NULL, '2025-11-10 17:31:18', '2025-11-10 17:31:18'),
(6, 1, 'NayaPay-Auto', 1.00, '691236205730075f550d0eca', NULL, 'approved', 'email_payment_id:3', NULL, '2025-11-10 19:25:59', '2025-11-10 19:25:59'),
(7, 3, 'JazzCash', 5000.00, '727272737', 'ss_69135c675efb87.67676012.jpg', 'approved', NULL, 2, '2025-11-11 15:55:19', '2025-11-11 15:55:49'),
(8, 3, 'JazzCash', 500.00, '8888', 'ss_691361b91474c5.13119760.jpg', 'pending', NULL, NULL, '2025-11-11 16:18:01', NULL),
(9, 2, 'NayaPay-Auto', 1.00, '691c2c28180b4d7a0b8e0421', NULL, 'approved', 'email_payment_id:5', NULL, '2025-11-18 10:11:42', '2025-11-18 10:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_path` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_auto` tinyint(1) NOT NULL DEFAULT 0,
  `auto_mail_server` varchar(255) DEFAULT NULL,
  `auto_email_user` varchar(255) DEFAULT NULL,
  `auto_email_pass` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `icon_path`, `account_name`, `account_number`, `note`, `min_amount`, `max_amount`, `is_active`, `is_auto`, `auto_mail_server`, `auto_email_user`, `auto_email_pass`, `created_at`) VALUES
(1, 'JazzCash', 'jazzcash.png', 'John Doe', '03001234567', 'Please send payment and upload screenshot.', 0.00, 0.00, 1, 0, NULL, NULL, NULL, '2025-11-09 16:21:18'),
(2, 'easyPaisa', 'easypaisa.png', 'Jane Smith', '03011234567', 'Note: Min deposit PKR 100.', 0.00, 0.00, 1, 0, '', '', '', '2025-11-09 16:21:18'),
(3, 'NayaPay', 'nayapay.png', 'Liaqat Ali', 'drliaqatali@nayapay', 'Please 2 3 minutes after sending payment', 1.00, 500000.00, 1, 1, 'test.israrliaqat.shop', 'payments@test.israrliaqat.shop', 'israriiii123@', '2025-11-09 16:21:18'),
(4, 'SadaPay', 'sadapay.png', 'SubHub Inc', 'subhub@sadapay', '', 0.00, 0.00, 1, 0, NULL, NULL, NULL, '2025-11-09 16:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `proof_link` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_digital` tinyint(1) DEFAULT 0,
  `download_link` text DEFAULT NULL,
  `file_size` varchar(50) DEFAULT '0 MB',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `icon`, `description`, `proof_link`, `category_id`, `is_active`, `created_at`, `is_digital`, `download_link`, `file_size`, `price`) VALUES
(1, 'Net-Flix Ultra 4K Screens', 'net-flix-ultra-4k-screens', 'net-flix-ultra-4k-screens-69126007908d3.jpeg', 'Ultra 4K Screens || Shared + Private|| No-Logout issues\r\nNo Cr@ck X\r\nOfficial Purchase\r\nReplacement Warranty\r\nInstant delivery\r\nNet_Flix', NULL, 1, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(2, 'ChatGPT Plus', 'chatgpt-plus', 'chatgpt-plus-6910e12098d07.png', 'Gmail ID &amp;amp; password directly on website order history page 💬📥\r\n\r\n⌛️ Complete Time: 0–1 Hrs (max 3 Hrs)\r\n\r\n✅ Send Order Number on Live Chat for Quick Delivery\r\n\r\n💎 Benefits: 👑 Unlock All Models &amp;amp; Features – Includes GPT-4, GPT-4 Turbo &amp;amp; GPT-5 (Agent Mode Supported)\r\n\r\n📜 Rule: This account can be used on up to 5 devices only. Adding more than 5 devices will result in account suspension and no replacement will be provided.', NULL, 2, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(3, 'Veo 3 ( FLOW) Unlimited videos', 'veo-3-flow-unlimited-videos', 'veo-3-flow-unlimited-videos-69125b08b36a7.jpeg', 'What&amp;#039;s Included in the plan?*:\r\n- ❄️ VEO 3.1 (45000) Credits)\r\n- ❄️ Veo 3.1 Fast Mode UNLIMITED\r\n- ❄️ 30TB Storage\r\n- ❄️ YouTube Premium \r\n- ❄️ 30 Days Warranty\r\n- ❄️ Gemini Advance\r\n- ❄️ Nano Bnana 🍌', NULL, 2, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(4, 'Canva Pro', 'canva-pro', 'canva-pro-69125f3ff04b5.jpeg', '30+ days replacement Gurantee\r\n\r\nSend order number on live chat for quick delivery\r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', NULL, 2, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(5, 'Capcut pro - Private Account', 'capcut-pro---private-account', 'capcut-pro---private-account-69125c036894c.png', '🔸 Your Personal Email Login\r\n🔸 Use on 2–3 Devices\r\n🔸 No Login or Logout Issues\r\n🔸 Faster &amp;amp; Secure Performance', NULL, 2, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(6, 'OPPLEX IPTV - IPTV PREMIUM ULTRA 4K-UHD PACKAGES', 'opplex-iptv---iptv-premium-ultra-4k-uhd-packages', 'opplex-iptv---iptv-premium-ultra-4k-uhd-packages-69125da85090d.jpeg', '✅ Good Server Speed\r\n✅ UNLIMITED LIVE TV CHANNELS\r\n✅ UNLIMITED MOVIES\r\n✅ UNLIMITED SEASONS\r\n✅ Login on 1 Device Only', NULL, 1, 1, '2025-11-09 16:21:18', 0, NULL, '0 MB', 0.00),
(7, 'Faceless YouTube Profits Course - Danny Why', 'gg', 'dl-69243c2eb72b1.jpg', '🔹 Build a faceless YouTube channel using AI  \r\n🔹 Learn from a top YouTube creator  \r\n🔹 Monetize content without showing your face  \r\n🔹 Master automation for growth and profits', NULL, 1, 1, '2025-11-24 11:06:22', 1, 'https://drive.google.com/drive/folders/1_JajX-gkMC22h3heF4_DY9VUfgiLjuVO', '500mb', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL COMMENT 'e.g., Shared, Private, Semi-Private',
  `duration_months` int(11) NOT NULL COMMENT 'e.g., 1, 3, 6, 12',
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `type`, `duration_months`, `price`, `original_price`, `is_active`) VALUES
(1, 4, 'Shared', 1, 350.00, 3000.00, 1),
(2, 4, 'Semi-Private', 12, 3500.00, 10000.00, 1),
(3, 4, 'Private', 6, 1500.00, 45000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `deposit_bonus` decimal(5,2) NOT NULL DEFAULT 0.00,
  `min_deposit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_uses` int(11) NOT NULL DEFAULT 0,
  `current_uses` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_updates`
--

CREATE TABLE `service_updates` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_name` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `type` enum('new','removed','enabled','price_increase','price_decrease') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_updates`
--

INSERT INTO `service_updates` (`id`, `service_id`, `service_name`, `category_name`, `rate`, `type`, `created_at`) VALUES
(2240, 36, 'TikTok Followers | Real Monetizable | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Cheapest ]', 489.2272, 'removed', '2025-11-26 11:00:06'),
(2241, 38, 'TikTok Followers | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Followers [ Cheapest ]', 423.5000, 'removed', '2025-11-26 11:00:06'),
(2242, 40, 'TikTok Followers | Real Monetizable | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Cheapest ]', 514.9760, 'removed', '2025-11-26 11:00:06'),
(2243, 41, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'TikTok » Followers [ Real Monitizable ]', 368.6760, 'removed', '2025-11-26 11:00:06'),
(2244, 42, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Followers [ Real Monitizable ]', 643.7200, 'removed', '2025-11-26 11:00:06'),
(2245, 43, 'TikTok Followers | Real Monitizable | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'TikTok » Followers [ Best Speed ]', 667.1280, 'removed', '2025-11-26 11:00:06'),
(2246, 44, 'TikTok Followers | Real Monitizable | Drop – No | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'TikTok » Followers [ Best Speed ]', 643.7200, 'removed', '2025-11-26 11:00:06'),
(2247, 47, 'TikTok Followers | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 471.0860, 'removed', '2025-11-26 11:00:06'),
(2248, 48, 'TikTok Followers | Real HQ Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 643.7200, 'removed', '2025-11-26 11:00:06'),
(2249, 383, 'TikTok Views | Drop – No | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Views [ Drop – 0% ]', 50.6349, 'new', '2025-11-26 14:00:04'),
(2250, 114, 'YouTube Likes | PAK 🇵🇰 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 347.3904, 'removed', '2025-11-26 23:00:05'),
(2251, 116, 'YouTube Likes | Kuwait 🇰🇼 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.7668, 'removed', '2025-11-26 23:00:05'),
(2252, 384, 'YouTube Subscribe | Non Drop | Speed 5K+ / DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Subscribe [ Non Drop ]', 7331.3856, 'new', '2025-11-27 13:00:04'),
(2253, 38, 'TikTok Followers | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Followers [ Cheapest ]', 423.5000, 'removed', '2025-11-28 19:00:03'),
(2254, 385, 'Instagram Views 5% Likes', 'Instagram » Views + Likes ( Real Profiles )', 2.9919, 'new', '2025-11-28 20:00:04'),
(2255, 386, 'Instagram Views 10% Likes', 'Instagram » Views + Likes ( Real Profiles )', 5.4605, 'new', '2025-11-28 20:00:04'),
(2256, 387, 'Instagram Views 20% Likes', 'Instagram » Views + Likes ( Real Profiles )', 10.3987, 'new', '2025-11-28 20:00:04'),
(2257, 388, 'Instagram Views 30% Likes', 'Instagram » Views + Likes ( Real Profiles )', 15.3366, 'new', '2025-11-28 20:00:04'),
(2258, 389, 'Instagram Views 40% Likes', 'Instagram » Views + Likes ( Real Profiles )', 20.2747, 'new', '2025-11-28 20:00:04'),
(2259, 390, 'Instagram Views 50% Likes', 'Instagram » Views + Likes ( Real Profiles )', 25.2126, 'new', '2025-11-28 20:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(253, 'promo_codes_enabled', '1'),
(451, 'site_name', 'Israr liaqat'),
(452, 'site_logo', 'logo.png'),
(453, 'site_favicon', 'favicon.png'),
(454, 'whatsapp_number', '+923097856447'),
(455, 'currency_symbol', 'PKR'),
(456, 'currency_conversion_rate', '280.00'),
(457, 'daily_spin_enabled', '1'),
(458, 'daily_spin_cooldown_hours', '24'),
(459, 'pwa_name', 'Israrliaqat.shop'),
(460, 'pwa_short_name', 'Israr Liaqat'),
(461, 'gemini_api_key', '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'),
(462, 'jarvis_personality', 'You are Jarvis, an AI assistant for Admin Israr. Be professional, cool, and slightly robotic like Iron Man&amp;amp;amp;#039;s assistant. Speak in Hinglish (mix of Hindi/Urdu and English).'),
(463, 'theme_primary', '#6700ff'),
(464, 'theme_hover', '#000000'),
(465, 'bg_color', '#1d1d1d'),
(466, 'card_color', '#000000'),
(467, 'text_color', '#000000'),
(468, 'text_muted_color', '#000000'),
(469, 'smtp_host', 'test.israrliaqat.shop'),
(470, 'smtp_port', '465'),
(471, 'smtp_user', 'payments@test.israrliaqat.shop'),
(472, 'smtp_pass', 'israriiii123@'),
(473, 'smtp_secure', 'ssl'),
(474, 'smtp_from_email', 'payments@test.israrliaqat.shop'),
(475, 'smtp_from_name', ''),
(477, 'google_login', '1'),
(478, 'google_client_id', '993444234982-3drotn8n7n1le42e6k6mqr1534usjekr.apps.googleusercontent.com'),
(479, 'google_client_secret', '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');

-- --------------------------------------------------------

--
-- Table structure for table `smm_categories`
--

CREATE TABLE `smm_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon_filename` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_categories`
--

INSERT INTO `smm_categories` (`id`, `name`, `icon_filename`, `sort_order`, `is_active`) VALUES
(1, 'TikTok » Likes [ Cheapest ]', 'TikTok.png', 0, 1),
(2, 'Canva Plus » Private', '', 0, 1),
(3, 'Chatgpt Plus » Private', '', 0, 1),
(4, 'TikTok » Accounts [ Real – UK / USA ]', 'TikTok.png', 0, 1),
(5, 'TikTok » Accounts [ Fresh – UK / USA ]', 'TikTok.png', 0, 1),
(6, 'TikTok » Accounts [ Real Monetized ]', 'TikTok.png', 0, 1),
(7, 'TikTok » Comments [ No Refill ]', 'TikTok.png', 0, 1),
(8, 'TikTok » Likes [ Drop – 0% ]', 'TikTok.png', 0, 1),
(9, 'TikTok » Likes [ Best Speed ]', 'TikTok.png', 0, 1),
(10, 'TikTok » Likes [ Real HQ Profiles ]', 'TikTok.png', 0, 1),
(11, 'TikTok » Likes [ No Notification ]', 'TikTok.png', 0, 1),
(12, 'TikTok » Likes [ Real USA 🇺🇸 ]', 'TikTok.png', 0, 1),
(13, 'TikTok » Likes [ Real PAK 🇵🇰 ]', 'TikTok.png', 0, 1),
(14, 'TikTok » Followers [ Cheapest ]', 'TikTok.png', 0, 1),
(15, 'TikTok » Followers [ Real Monitizable ]', 'TikTok.png', 0, 1),
(16, 'TikTok » Followers [ Best Speed ]', 'TikTok.png', 0, 1),
(17, 'TikTok » Followers [ Drop – 0% ]', 'TikTok.png', 0, 1),
(18, 'TikTok » Views [ Cheapest ]', 'TikTok.png', 0, 1),
(19, 'TikTok » Views [ Best Speed ]', 'TikTok.png', 0, 1),
(20, 'TikTok » Views [ Real Monitizable ]', 'TikTok.png', 0, 1),
(21, 'TikTok » Views + Likes [ No Refill ]', 'TikTok.png', 0, 1),
(22, 'TikTok » Views [ Live Stream ]', 'TikTok.png', 0, 1),
(23, 'TikTok » Saves [ Lifetime ]', 'TikTok.png', 0, 1),
(24, 'TikTok » Shares [ Lifetime ]', 'TikTok.png', 0, 1),
(25, 'TikTok » Battle Points [ Best Speed ]', 'TikTok.png', 0, 1),
(26, 'YouTube » Subscribe [ Non Drop ]', 'Youtube.png', 0, 1),
(27, 'YouTube » Subscribe [ No Refill ]', 'Youtube.png', 0, 1),
(28, 'YouTube » Views [ Cheapest ]', 'Youtube.png', 0, 1),
(29, 'YouTube » Views [ Best Speed ]', 'Youtube.png', 0, 1),
(30, 'YouTube » Views [ High Retention ]', 'Youtube.png', 0, 1),
(31, 'YouTube » Views [ Suggested ]', 'Youtube.png', 0, 1),
(32, 'YouTube » Views  [ Real Native Ads ]', 'Youtube.png', 0, 1),
(33, 'YouTube » Views  [ Real Google Ads ]', 'Youtube.png', 0, 1),
(34, 'YouTube » Views  [ Live Stream ]', 'Youtube.png', 0, 1),
(35, 'YouTube » Likes [ Cheapest ]', 'Youtube.png', 0, 1),
(36, 'YouTube » Likes [ Best Speed ]', 'Youtube.png', 0, 1),
(37, 'YouTube » Likes [ Targeted ]', 'Youtube.png', 0, 1),
(38, 'YouTube » Likes [ USA 🇺🇸 ]', 'Youtube.png', 0, 1),
(39, 'YouTube » Comments [ Cheapest ]', 'Youtube.png', 0, 1),
(40, 'YouTube » Comments [ Best Speed ]', 'Youtube.png', 0, 1),
(41, 'YouTube » Services [ Shorts ]', 'Youtube.png', 0, 1),
(42, 'Instagram » Followers [ Cheapest ]', 'Instagram.png', 0, 1),
(43, 'Instagram » Followers [ Best Speed ]', 'Instagram.png', 0, 1),
(44, 'Instagram » Views [ Cheapest ]', 'Instagram.png', 0, 1),
(45, 'Instagram » Views [ Best Speed ]', 'Instagram.png', 0, 1),
(46, 'Instagram » Views [ IGTV + Reels ]', 'Instagram.png', 0, 1),
(47, 'Instagram » Likes [ Cheapest ]', 'Instagram.png', 0, 1),
(48, 'Instagram » Likes [ Best Speed ]', 'Instagram.png', 0, 1),
(49, 'Instagram » Likes [ IND 🇮🇳 ]', 'Instagram.png', 0, 1),
(50, 'Instagram » Reach Impressions', 'Instagram.png', 0, 1),
(51, 'Instagram » Comments [ Lifetime ]', 'Instagram.png', 0, 1),
(52, 'Instagram » Saves [ Lifetime ]', 'Instagram.png', 0, 1),
(53, 'Instagram » Services [ For Stories ]', 'Instagram.png', 0, 1),
(54, 'Facebook » Followers [ Cheapest ]', 'Facebook.png', 0, 1),
(55, 'Facebook » Followers [ Page ]', 'Facebook.png', 0, 1),
(56, 'Facebook » Followers [ Profile ]', 'Facebook.png', 0, 1),
(57, 'Facebook » Followers + Likes', 'Facebook.png', 0, 1),
(58, 'Facebook » Followers [ Best Speed ]', 'Facebook.png', 0, 1),
(59, 'Facebook » Followers [ Real HQ ]', 'Facebook.png', 0, 1),
(60, 'Facebook » Post Likes [ Cheapest ]', 'Facebook.png', 0, 1),
(61, 'Facebook » Post Likes [ Best Speed ]', 'Facebook.png', 0, 1),
(62, 'Facebook » Post Reactions [ Cheapest ]', 'Facebook.png', 0, 1),
(63, 'Facebook » Post Reactions [ Refill ]', 'Facebook.png', 0, 1),
(64, 'Facebook » Post Reactions [ S2 ]', 'Facebook.png', 0, 1),
(65, 'Facebook » Views [ Cheapest ]', 'Facebook.png', 0, 1),
(66, 'Facebook » Views [ Best Speed ]', 'Facebook.png', 0, 1),
(67, 'Facebook » Views [ Live Stream ]', 'Facebook.png', 0, 1),
(68, 'Facebook » Watchtime [ 60k Minutes ]', 'Facebook.png', 0, 1),
(69, 'Facebook » Watchtime [ 600k Minutes ]', 'Facebook.png', 0, 1),
(70, 'Facebook » Watchtime [ 120k Minutes ]', 'Facebook.png', 0, 1),
(71, 'Facebook » Watchtime [ 180k Minutes ]', 'Facebook.png', 0, 1),
(72, 'Facebook » Comments [ Real Profiles ]', 'Facebook.png', 0, 1),
(73, 'X Twitter » Followers [ Best Speed ]', 'X.png', 0, 1),
(74, 'X Twitter » Impressions [ Best Speed ]', 'X.png', 0, 1),
(75, 'X Twitter » Profile Visit [ Fast ]', 'X.png', 0, 1),
(76, 'X Twitter » Poll Votes [ Refill ]', 'X.png', 0, 1),
(77, 'X Twitter » Views [ For Tweet ]', 'X.png', 0, 1),
(78, 'X Twitter » Views [ For Video ]', 'X.png', 0, 1),
(79, 'X Twitter » Views [ Lifetime ]', 'X.png', 0, 1),
(80, 'X Twitter » Likes [ No Refill ]', 'X.png', 0, 1),
(81, 'Spotify » Followers [ Lifetime ]', 'Spotify.png', 0, 1),
(82, 'Spotify » Plays [ Best Speed ]', 'Spotify.png', 0, 1),
(83, 'Spotify » Plays [ Premium ]', 'Spotify.png', 0, 1),
(84, 'Spotify » Plays [ Targeted ]', 'Spotify.png', 0, 1),
(85, 'Spotify » Monthly Listerners', 'Spotify.png', 0, 1),
(86, 'Spotify » Saves [ Refill ]', 'Spotify.png', 0, 1),
(87, 'Telegram » Members [ Cheapest ]', 'Telegram.png', 0, 1),
(88, 'Telegram » Members [ Best Speed ]', 'Telegram.png', 0, 1),
(89, 'Telegram » Members [ Premium - S1 ]', 'Telegram.png', 0, 1),
(90, 'Telegram » Post View [ Best Speed ]', 'Telegram.png', 0, 1),
(91, 'Telegram » Reactions [ Cheapest ]', 'Telegram.png', 0, 1),
(92, 'Telegram » Reactions [ Premium ]', 'Telegram.png', 0, 1),
(93, 'Telegram Reactions » [ Best Speed ]', 'Telegram.png', 0, 1),
(94, 'WhatsApp » Reactions [ Best Speed ]', 'Whatsapp.png', 0, 1),
(95, 'WhatsApp » Members / Followers', 'Whatsapp.png', 0, 1),
(96, 'Snapchat » Followers [ Refill ]', 'Snapchat.png', 0, 1),
(97, 'Website » Traffic [ Global ]', 'Website-Traffic.png', 0, 1),
(98, 'Website » Traffic [ USA 🇺🇸 ]', 'Website-Traffic.png', 0, 1),
(99, '⭐️ tiktok pak followers | s2 | non stop', '', 0, 1),
(100, '⭐️ tiktok likes hq | s2 | non stop', '', 0, 1),
(101, 'do not use', '', 0, 1),
(1339, 'TikTok views   hq likes', 'TikTok.png', 0, 1),
(1351, 'TikTok » Views + Likes [ Real Profiles ]', 'TikTok.png', 0, 1),
(1750, 'TikTok » Views + Likes [ Hidden ]', 'TikTok.png', 0, 1),
(1752, 'TikTok » Views + Likes [ Real HQ ]', 'TikTok.png', 0, 1),
(1784, 'TikTok » Views Likes Comments', 'TikTok.png', 0, 1),
(1807, 'TikTok » All in ONE [ Cheapest ]', 'TikTok.png', 0, 1),
(1808, 'TikTok » All in ONE [ Real Profiles ]', 'TikTok.png', 0, 1),
(1827, 'TikTok » Views [ Real For You ]', NULL, 0, 1),
(1828, 'TikTok » Views [ Drop – 0% ]', NULL, 0, 1),
(1829, 'TikTok » Views + Likes ( Hidden )', NULL, 0, 1),
(1830, 'TikTok » Views + Likes ( Real HQ )', NULL, 0, 1),
(1831, 'TikTok » All in ONE ( Cheapest )', NULL, 0, 1),
(1832, 'TikTok » All in ONE | Real Profiles', NULL, 0, 1),
(1834, 'TikTok » All in ONE ( Real Profiles )', NULL, 0, 1),
(1887, 'Instagram » Views + Likes ( Real Profiles )', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `smm_orders`
--

CREATE TABLE `smm_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `quantity` int(11) NOT NULL,
  `charge` decimal(10,4) NOT NULL COMMENT 'Customer ko kitne paise charge kiye',
  `comments` text DEFAULT NULL,
  `start_count` int(11) DEFAULT 0,
  `remains` int(11) DEFAULT 0,
  `status` enum('pending','in_progress','completed','cancelled','refunded','partial') NOT NULL DEFAULT 'pending',
  `provider_order_id` int(11) DEFAULT NULL COMMENT 'Wholesaler ka order ID',
  `last_refill_request_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_orders`
--

INSERT INTO `smm_orders` (`id`, `user_id`, `service_id`, `link`, `quantity`, `charge`, `comments`, `start_count`, `remains`, `status`, `provider_order_id`, `last_refill_request_at`, `created_at`, `updated_at`) VALUES
(10, 3, 156, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 50, 4.2872, NULL, 388, 0, 'completed', 3120434, NULL, '2025-11-22 11:22:17', '2025-11-22 12:35:03'),
(11, 3, 156, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 50, 4.2872, NULL, 0, 0, 'cancelled', 3120916, NULL, '2025-11-22 13:12:15', '2025-11-22 13:17:03'),
(12, 3, 189, 'Facebook.com', 20, 1.8153, NULL, 0, 20, 'cancelled', 3121015, NULL, '2025-11-22 13:35:09', '2025-11-22 13:50:03'),
(13, 3, 137, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 100, 15.3615, NULL, 0, 100, 'cancelled', 3121820, NULL, '2025-11-22 16:05:00', '2025-11-22 20:05:03'),
(14, 3, 146, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 1000, 2.0691, NULL, 0, 0, 'cancelled', 3121850, NULL, '2025-11-22 16:08:16', '2025-11-22 16:09:25'),
(15, 3, 144, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 10000, 4.1800, NULL, 0, 0, 'completed', 3121920, NULL, '2025-11-22 16:19:47', '2025-11-22 16:35:04'),
(16, 3, 156, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 100, 8.0055, NULL, 513, 0, 'completed', 3139150, NULL, '2025-11-25 18:25:11', '2025-11-25 18:35:04'),
(17, 3, 135, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 10, 1.8843, NULL, 0, 10, '', 3139232, NULL, '2025-11-25 18:39:43', '2025-11-26 03:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `smm_providers`
--

CREATE TABLE `smm_providers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `api_url` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `profit_margin` int(11) NOT NULL DEFAULT 50 COMMENT 'Profit percentage (e.g., 50)',
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_providers`
--

INSERT INTO `smm_providers` (`id`, `name`, `api_url`, `api_key`, `profit_margin`, `is_active`) VALUES
(5, 'Smm', 'https://dilsmmpanel.com/api/v2', 'ff1c79f7d582b5d82568624922398629e2484f99', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `smm_services`
--

CREATE TABLE `smm_services` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL COMMENT 'Provider ki original Service ID',
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `base_price` decimal(10,4) NOT NULL COMMENT 'Provider ki price (per 1000)',
  `service_rate` decimal(10,4) NOT NULL COMMENT 'Hamari price (profit ke baad)',
  `old_price` decimal(10,4) DEFAULT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `avg_time` varchar(100) DEFAULT NULL,
  `has_refill` tinyint(1) NOT NULL DEFAULT 0,
  `has_cancel` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `service_type` varchar(50) DEFAULT 'Default',
  `dripfeed` tinyint(1) NOT NULL DEFAULT 0,
  `last_synced_at` datetime DEFAULT NULL,
  `manually_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_services`
--

INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`, `service_type`, `dripfeed`, `last_synced_at`, `manually_deleted`) VALUES
(1, 5, 13893, 'TikTok Likes | Speed 100+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 0.4827, 0.5310, NULL, 10, 100, '32', 0, 1, '📈 Maximum order: 100 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 100+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(2, 5, 13912, 'TikTok Likes | Speed 50K+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 5.3508, 5.8859, NULL, 10, 5000000, '43', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n🚅 Speed: 50K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(3, 5, 13938, 'TikTok Likes | Speed 1000+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 1.9312, 2.1243, NULL, 10, 1000, '924', 0, 1, '📈 Maximum order: 1000 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1000+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(4, 5, 14588, 'TikTok Likes | Speed 500+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 0.9654, 1.0620, NULL, 10, 500, '51', 0, 1, '📈 Maximum order: 500 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 500+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(5, 5, 15039, 'TikTok Likes | Speed 100K+ / DAY | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Cheapest ]', 4.2216, 4.6437, NULL, 10, 5000000, '63', 0, 1, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(6, 5, 15046, 'TikTok Likes | Speed 50K+ / DAY | No Refill | ⛔🔥⚡️', 'TikTok » Likes [ Cheapest ]', 6.3756, 7.0132, NULL, 10, 1000000, '41', 0, 1, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(7, 5, 15047, 'TikTok Likes | Speed 100K+ / DAY | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Cheapest ]', 8.8712, 9.7584, NULL, 100, 1000000, '56', 0, 0, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(8, 5, 13701, 'Canva Plus | Private | 1+ Year | 1 Device |', 'Canva Plus » Private', 275.1725, 302.6898, NULL, 1, 1, '43', 0, 0, 'Enter Your Gmail in link Section\r\n\r\nYou will get Invitation mail in Gmail inbox 📥\r\n\r\n1+ year replacement Gurantee \r\n\r\nSend order number on live chat for quick delivery \r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', 0, 'Package', 0, NULL, 1),
(9, 5, 14845, 'Canva Plus | Private | 30+ Days | 1 Device |', 'Canva Plus » Private', 91.7241, 100.8965, NULL, 1, 1, '427', 0, 0, 'Enter Your Gmail in link Section\r\n\r\nYou will get Invitation mail in Gmail inbox 📥\r\n\r\n30+ days replacement Gurantee \r\n\r\nSend order number on live chat for quick delivery \r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', 0, 'Package', 0, NULL, 1),
(10, 5, 14610, 'Chatgpt Go | Private | 1 User | 12 Months | 🔥', 'Chatgpt Plus » Private', 965.5173, 1062.0690, NULL, 1, 1, '18', 0, 1, 'Enter Your Name in Link Section, we Will Share Login Details (Gmail, Password)\r\n\r\nChatGPT Go plan includes:\r\n\r\n⭐ Go deep on harder questions\r\n💬 Chat longer and upload more content\r\n🖼️ Make realistic images for your projects\r\n🧠 Store more context for smarter replies\r\n📅 Get help with planning and tasks\r\n⚙️ Explore projects, tasks, and custom GPTs', 0, 'Package', 0, NULL, 1),
(11, 5, 14472, 'TikTok Account | UK / USA | Non Monetized | 1000+ Real Followers | Read Description | 🔥', 'TikTok » Accounts [ Real – UK / USA ]', 1651.0346, 1816.1380, NULL, 1, 1, '189', 0, 0, '✅ 1000+ TikTok organic followers — all real users gained naturally through viral videos.\r\n\r\n✅ Ready-to-use TikTok accounts with active followers\r\n🕹️ Perfect for Gaming Incentive Campaigns\r\n🚀 Boosts your TikTok growth instantly\r\n💬 High engagement &amp;amp; real audience\r\n🔒 Safe and verified accounts\r\n🌍 Suitable for creators, influencers &amp;amp; agencies', 0, 'Package', 0, NULL, 0),
(12, 5, 13698, 'TikTok Account | USA 🇺🇸 | 100% Real | Read Description | 🔥', 'TikTok » Accounts [ Fresh – UK / USA ]', 229.3105, 252.2415, NULL, 1, 1, '309', 0, 0, 'Fresh TikTok account with zero followers — 100% organic, created without any trick or VPN\r\n\r\nUSA account 🇺🇸\r\n\r\nBest for Monetization\r\n\r\nDelivery time: 30 minutes to 5 hours\r\n\r\nAdd Gmail in the link box\r\n\r\nAfter order, contact on live chat', 1, 'Package', 0, NULL, 0),
(13, 5, 13699, 'TikTok Account | UK 🇬🇧 | 100% Real | Read Description | 🔥', 'TikTok » Accounts [ Fresh – UK / USA ]', 229.3105, 252.2415, NULL, 1, 1, '136', 0, 0, 'Fresh TikTok account with zero followers — 100% organic, created without any trick or VPN\r\n\r\nUK account 🇬🇧\r\n\r\nBest for Monetization\r\n\r\nDelivery time: 30 minutes to 5 hours\r\n\r\nAdd Gmail in the link box\r\n\r\nAfter order, contact on live chat', 1, 'Package', 0, NULL, 0),
(14, 5, 14473, 'TikTok Account | UK 🇬🇧 | Real Monetized | 50K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 24765.5173, 27242.0690, NULL, 1, 1, '136', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 50k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality UK-based accounts — no service-based profiles', 1, 'Package', 0, NULL, 0),
(15, 5, 14816, 'TikTok Account | USA 🇺🇸 | Real Monetized | 10K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 9558.6207, 10514.4827, NULL, 1, 1, '93', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 10k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality USA-based accounts — no service-based profiles', 1, 'Package', 0, NULL, 0),
(16, 5, 14817, 'TikTok Account | UK 🇬🇧 | Real Monetized | 10K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 9558.6207, 10514.4827, NULL, 1, 1, '112', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 10k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality UK-based accounts — no service-based profiles', 1, 'Package', 0, NULL, 0),
(17, 5, 15025, 'TikTok Comments | Random | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0–5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Comments [ No Refill ]', 299.2979, 329.2277, NULL, 10, 5000, '15', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n💬 Comments: Random + Emojis  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: TikTok video link', 1, 'Default', 0, NULL, 0),
(18, 5, 14488, '🆅🅸🅿 TikTok Likes | Premium | Real HQ Profiles | Drop – No | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Drop – 0% ]', 63.5592, 69.9151, NULL, 100, 20000000, '69', 0, 1, '⏱ Start: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop: 0% (2+ Years No Drop)\r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(19, 5, 14886, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Drop – 0% ]', 46.9658, 51.6624, NULL, 10, 1000000, '19', 1, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(20, 5, 13996, '🆅🅸🅿 TikTok Likes | Premium | Real HQ Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Best Speed ]', 79.4489, 87.3938, NULL, 10, 500000, '74', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(21, 5, 14414, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Best Speed ]', 25.1530, 27.6683, NULL, 100, 500000000, '19', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(22, 5, 14426, 'TikTok Likes | Real HQ Profiles | Speed 1M+ / DAY | Start Time 0-5 Minutes | 30 Days Refill | ✅🔥⚡', 'TikTok » Likes [ Best Speed ]', 25.2700, 27.7970, NULL, 10, 500000000, '16', 1, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1 Million+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: 30 Days Guarantee  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: If drop happens within 30 days, refill will be given. After 30 days, no refill.', 1, 'Default', 0, NULL, 0),
(23, 5, 14433, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Best Speed ]', 13.9650, 15.3615, NULL, 10, 100000, '16', 1, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(24, 5, 14542, 'TikTok Likes | Premium | USA 🇺🇸 | Real Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Best Speed ]', 44.4007, 48.8408, NULL, 10, 5000000, '14', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(25, 5, 14557, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Best Speed ]', 46.9658, 51.6624, NULL, 10, 1000000, '27', 1, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(26, 5, 14434, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Real HQ Profiles ]', 46.9658, 51.6624, NULL, 10, 100000, '20', 0, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(27, 5, 14945, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Real HQ Profiles ]', 46.9658, 51.6624, NULL, 10, 1000000, '31', 0, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(28, 5, 15041, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Likes [ Real HQ Profiles ]', 12.9360, 14.2296, NULL, 10, 100000, '36', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 100K+ / Day (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(29, 5, 15042, 'TikTok Likes | Real HQ Profiles | Drop – Yes | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡️', 'TikTok » Likes [ Real HQ Profiles ]', 16.7580, 18.4338, NULL, 10, 100000, '35', 0, 1, '⏳ Start Time: 0–5 Minutes (max 2 hour)\r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n📉 Drop: Yes Possible in Updates \r\n✅ Guarantee: Lifetime Refill / Refund\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(30, 5, 14841, 'TikTok Likes | Hidden | Speed 100K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'TikTok » Likes [ No Notification ]', 9.6426, 10.6069, NULL, 100, 1000000, '42', 0, 1, '⏱ Start: 0–50 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(31, 5, 14944, 'TikTok Likes | Hidden | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Likes [ No Notification ]', 8.8712, 9.7584, NULL, 10, 1000000, '35', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hours)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(32, 5, 14622, '🆅🅸🅿 TikTok Likes | USA 🇺🇸 | Real Profiles | Drop – No | Speed 100K+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐🔥⚡', 'TikTok » Likes [ Real USA 🇺🇸 ]', 48.9227, 53.8150, NULL, 10, 5000000, '28', 0, 1, '⏱ Start Time: 0–5 Minutes \r\n📍 Location: 100% Real USA\r\n🌟 Quality: 100% USA 🇺🇸 \r\n⚡ Speed: 100K+ Per DAY\r\n✅️ Refill: Yes Lifetime\r\n──────────────\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(33, 5, 14857, 'TikTok Likes | Premium | USA 🇺🇸 | Real Profiles | Speed 500K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Real USA 🇺🇸 ]', 31.4412, 34.5853, NULL, 10, 2147483647, '11', 0, 1, '⏱ Start Time: 0–5 Minutes \r\n📍 Location: 100% USA\r\n🌟 Quality: 100% USA 🇺🇸 \r\n⚡ Speed: 500K+ Per DAY\r\n⛔️ Refill: No Refill if Drop\r\n──────────────\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(34, 5, 14428, 'TikTok Likes | PAK 🇵🇰 | Real Active | Non Drop | Speed 1000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Likes [ Real PAK 🇵🇰 ]', 163.2708, 179.5979, NULL, 100, 1000, '54', 0, 1, '⏱ Start Time: 0–hour max\r\n📍 Location: 100% Pakistan\r\n🌟 Quality: 100% PAK 🇵🇰\r\n⚡ Speed: 500 to 1k+ / DAY\r\n✅️ Refill: Yes Lifetime\r\n──────────────\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(35, 5, 14102, 'TikTok Followers | Speed 5K+ / DAY | No Refill | ⛔🔥', 'TikTok » Followers [ Cheapest ]', 281.2348, 309.3583, NULL, 10, 10000000, '29', 0, 1, '⏱ Start: 1 hour (max 3 hours)  \r\n⚡ Speed: 5K / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill in Any Case\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Note: Cheapest service – drop can happen in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(36, 5, 14105, 'TikTok Followers | Real Monetizable | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Cheapest ]', 444.7520, 489.2272, NULL, 50, 1000000, '44', 1, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles\r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(37, 5, 14501, 'TikTok Followers | Speed 5K / DAY | No Refill | ⛔🔥', 'TikTok » Followers [ Cheapest ]', 249.9000, 274.8900, NULL, 10, 5000000, '13', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 5K / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill in Any Case\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Note: Cheapest service – drop can happen in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(38, 5, 14537, 'TikTok Followers | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Followers [ Cheapest ]', 385.0000, 423.5000, NULL, 100, 5000000, '28', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 10K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n⏳ Refill can take more than 24 hours.\r\n\r\n⛔️ This is the cheapest service, and drops can happen.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(39, 5, 15040, 'TikTok Followers | Real Monitizable | Speed 50K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Followers [ Cheapest ]', 274.4596, 301.9056, NULL, 50, 10000000, '73', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop\r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL', 1, 'Default', 0, NULL, 0),
(40, 5, 15043, 'TikTok Followers | Real Monetizable | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Cheapest ]', 468.1600, 514.9760, NULL, 50, 1000000, '79', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(41, 5, 14615, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'TikTok » Followers [ Real Monitizable ]', 335.1600, 368.6760, NULL, 50, 1000000, '106', 0, 1, '⏱ Start: 0-5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real Profiles Monitizable\r\n❌ Refill: No Refill Service \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 0, 'Default', 0, NULL, 0),
(42, 5, 14753, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Followers [ Real Monitizable ]', 585.2000, 643.7200, NULL, 50, 1000000, '455', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Yes Lifetime  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(43, 5, 14013, 'TikTok Followers | Real Monitizable | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'TikTok » Followers [ Best Speed ]', 606.4800, 667.1280, NULL, 50, 1000000, '894', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop: Yes Possible  \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(44, 5, 14558, 'TikTok Followers | Real Monitizable | Drop – No | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'TikTok » Followers [ Best Speed ]', 585.2000, 643.7200, NULL, 50, 1000000, '615', 1, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 0, 'Default', 0, NULL, 0),
(45, 5, 14577, 'TikTok Followers | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Followers [ Best Speed ]', 421.3440, 463.4784, NULL, 50, 5000000, '25', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in the future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(46, 5, 14836, 'TikTok Followers | Real HQ Profiles | Speed 50K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Followers [ Best Speed ]', 338.1000, 371.9100, NULL, 10, 1000000, '27', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in the future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(47, 5, 14848, 'TikTok Followers | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 428.2600, 471.0860, NULL, 10, 1000000, '60', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 10K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n⛔️ Refill: No Refill  \r\n📉 Drop Ratio: 0-1% Maximum\r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ 100% Non-Drop Service — never dropped before, but if it ever does in the future, no refill will be provided.', 0, 'Default', 0, NULL, 0),
(48, 5, 14849, 'TikTok Followers | Real HQ Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 585.2000, 643.7200, NULL, 50, 1000000, '404', 1, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop Ratio: 0-1% Maximum \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ 100% Non-Drop Service — never dropped before, but if it ever does in the future, free refill will be provided (lifetime guarantee).', 0, 'Default', 0, NULL, 0),
(49, 5, 14393, 'TikTok Video Views | Speed 10M+ / DAY | No Refill | ⛔️🔥⚡️', 'TikTok » Views [ Cheapest ]', 0.5852, 0.6437, NULL, 100, 2147483647, '3', 0, 1, '⏱ Start: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 10M+ / in 24 Hours \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be given.', 1, 'Default', 0, NULL, 0),
(50, 5, 14953, 'TikTok Views | Speed 1000+ / Hour | No Refill | ⛔️🔥⚡️', 'TikTok » Views [ Cheapest ]', 0.2520, 0.2772, NULL, 100, 1000, '2', 0, 1, '📈 Maximum order: 1000 Views\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1000+ / in 1 hour\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable\r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be provided.', 1, 'Default', 0, NULL, 0),
(51, 5, 15013, 'TikTok Video Views | Speed 1M+ / DAY | No Refill | ⛔️🔥', 'TikTok » Views [ Cheapest ]', 0.2772, 0.3049, NULL, 100, 2147483647, '14', 0, 1, '🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1M+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable\r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be provided.', 1, 'Default', 0, NULL, 0),
(52, 5, 15038, 'TikTok Video Views | Speed 5M+ / DAY | No Refill | ⛔🔥⚡️', 'TikTok » Views [ Cheapest ]', 0.9654, 1.0620, NULL, 100, 2147483647, '10', 0, 1, '⏱ Start: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 5M+ / in 24 Hours \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be given.', 1, 'Default', 0, NULL, 0),
(53, 5, 14296, 'TikTok Video Views | Speed 1M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Views [ Best Speed ]', 0.6572, 0.7229, NULL, 100, 2147483647, '6', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(54, 5, 14316, 'TikTok Views | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Views [ Best Speed ]', 2.6600, 2.9260, NULL, 50, 2147483647, '16', 0, 1, '✅ Always Working – Non Stop ⚡️\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: Currently no drops, but if drops happen in future updates, no refill will be given (No Refill Service).', 1, 'Default', 0, NULL, 0),
(55, 5, 14713, 'TikTok Video Views | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥', 'TikTok » Views [ Best Speed ]', 2.6600, 2.9260, NULL, 50, 2147483647, '5', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: Currently no drops, but if drops happen in future updates, no refill will be given (No Refill Service).', 1, 'Default', 0, NULL, 0),
(56, 5, 15006, 'Tiktok Real Sponsor | 10K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 862.9407, 949.2347, NULL, 1000, 1000, '2963', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(57, 5, 15007, 'Tiktok Real Sponsor | 20K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 20K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 1602.6044, 1762.8648, NULL, 1000, 1000, '4751', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(58, 5, 15008, 'Tiktok Real Sponsor | 30K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 30K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 2342.2675, 2576.4942, NULL, 1000, 1000, '0', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(59, 5, 15009, 'Tiktok Real Sponsor | 100K Views Package | 100% Real Monitizable | PAK 🇵🇰 | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 6040.5848, 6644.6432, NULL, 1000, 1000, '6109', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(60, 5, 15011, 'Tiktok Real Sponsor | 5K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 5K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 616.3861, 678.0247, NULL, 1000, 1000, '5640', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(61, 5, 15012, 'Tiktok Real Sponsor | 50K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 3575.0400, 3932.5440, NULL, 1000, 1000, '0', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(62, 5, 15017, 'Tiktok Real Sponsor | 100K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real For You ]', 6040.5848, 6644.6432, NULL, 1000, 1000, '4080', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1, 'Default', 0, NULL, 0),
(63, 5, 14580, 'TikTok | 100% Views | 5% Likes | 🔥', 'TikTok » Views + Likes ( Hidden )', 0.9666, 1.0632, NULL, 1000, 100000, '31', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 50 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 5% of views', 1, 'Default', 0, NULL, 0),
(64, 5, 14581, 'TikTok | 100% Views | 10% Likes | 🔥', 'TikTok » Views + Likes ( Hidden )', 1.2384, 1.3623, NULL, 1000, 100000, '20', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 100 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 10% of views', 1, 'Default', 0, NULL, 0),
(65, 5, 14582, 'TikTok | 100% Views | 30% Likes | 🔥', 'TikTok » Views + Likes ( Hidden )', 2.1176, 2.3294, NULL, 1000, 100000, '34', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 300 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 30% of views', 1, 'Default', 0, NULL, 0),
(66, 5, 14583, 'TikTok | 100% Views | 50% Likes | 🔥', 'TikTok » Views + Likes ( Hidden )', 2.7619, 3.0381, NULL, 1000, 100000, '42', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 500 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 50% of views', 1, 'Default', 0, NULL, 0),
(67, 5, 14715, 'TikTok Live Stream Views 15 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 41.4960, 45.6456, NULL, 10, 500000, '32', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(68, 5, 14716, 'TikTok Live Stream Views 30 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 82.9920, 91.2912, NULL, 10, 500000, '25', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(69, 5, 14717, 'TikTok Live Stream Views 60 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 165.9840, 182.5824, NULL, 10, 500000, '51', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(70, 5, 14718, 'TikTok Live Stream Views 90 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 248.9760, 273.8736, NULL, 10, 500000, '539', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(71, 5, 14719, 'TikTok Live Stream Views 120 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 331.9680, 365.1648, NULL, 10, 500000, '1542', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(72, 5, 14954, 'TikTok Saves | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Saves [ Lifetime ]', 4.1496, 4.5646, NULL, 10, 1000000, '12', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n✅️ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your video link / URL', 1, 'Default', 0, NULL, 0),
(73, 5, 14840, 'TikTok Shares | Non Drop | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Shares [ Lifetime ]', 8.3950, 9.2345, NULL, 10, 5000000, '14', 0, 1, '✅ Always Working – Non Stop 🔥\r\n\r\n⌛️ Start Time: 0–5 Minutes \r\n⚡ Speed: 500K+ / DAY \r\n❌ Cancel Button: 100% Working  \r\n🛡 Guarantee: Yes Lifetime\r\n📉 Drop Ratio: Non-Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(74, 5, 14431, 'TikTok PK Battle Points | Speed 5M / DAY | No Refill | ⛔️🔥⚡', 'TikTok » Battle Points [ Best Speed ]', 45.6831, 50.2514, NULL, 100, 2147483647, '28', 0, 1, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(75, 5, 14432, 'TikTok PK Battle Points | Speed 10M / DAY | No Refill | ⛔️🔥⚡', 'TikTok » Battle Points [ Best Speed ]', 49.6555, 54.6210, NULL, 100, 2147483647, '28', 0, 1, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1, 'Default', 0, NULL, 0),
(76, 5, 15059, 'YouTube Subscribe | Non Drop | Speed 1000+ / DAY | Start Time 0-24 Hours | 30 Days Refill | ✅️🔥', 'YouTube » Subscribe [ Non Drop ]', 6131.7043, 6744.8748, NULL, 100, 5000, '1631', 0, 0, '✅ Example Link : link channel or video\r\n\r\n🕓 Start Time : 0-24h\r\n🚀 Speed : 5k/day\r\n⚖️ Min/max : 100/100k\r\n♻️ Guarantee : 30 days Refill\r\n🌎 Country : Global\r\n\r\n⚠️ Note :\r\n✅ Directly produced by us with stable quality and upgraded capacity.\r\n✅ Real subscribers, scalable up to several million per channel.\r\n✅ Speed: 1k – 5k subs/day\r\n⚡ For large orders, we can push up to 10k/day.\r\n📌 When the service is busy, the starting speed of the process changes.\r\n📌 Do not place the second order on the same link before your order is completed in the system.', 1, 'Default', 0, NULL, 0),
(77, 5, 14618, 'YouTube Subscribe | Drop – 100% | Speed 150K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'YouTube » Subscribe [ No Refill ]', 117.9125, 129.7037, NULL, 100, 20000, '13', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 150K+ / DAY  \r\n📉 Drop Ratio: 100%  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Channel link  \r\n\r\n⚠️ Warning: No guarantee, not for monetization. All subscribers drop after some time. No refill or refund.', 1, 'Default', 0, NULL, 0),
(78, 5, 14701, 'YouTube Subscribe | Drop – 100% | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'YouTube » Subscribe [ No Refill ]', 117.9125, 129.7037, NULL, 100, 20000, '15', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: 100%  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Channel link  \r\n\r\n⚠️ Warning: No guarantee, not for monetization. All subscribers drop after some time. No refill or refund.', 1, 'Default', 0, NULL, 0),
(79, 5, 12820, 'YouTube View | Non Drop | Speed 500+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 256.0384, 281.6423, NULL, 50, 10000, '1447', 1, 1, '- Start Time : 0 - 1 hours \r\n- Speed : Day 500+\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n- Refill button active \r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(80, 5, 14435, 'YouTube View | Non Drop | Speed 500+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 267.1704, 293.8874, NULL, 50, 500000, '699', 1, 1, '- Start Time : 0 - 1 hours \r\n- Speed : Day 500+\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n- Refill button working \r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(81, 5, 14614, 'YouTube View | Non Drop | Speed 1000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Views [ Cheapest ]', 267.1704, 293.8874, NULL, 50, 500000, '641', 1, 1, '- Start Time : 0-1 Hour !\r\n- Speed : Day 1000\r\n- Refill Gurantee : Lifetime ♻️\r\n- Drop Rate : Not Much Expected\r\n- Example Link : https://youtu.be/example', 1, 'Default', 0, NULL, 0),
(82, 5, 14621, 'YouTube View | Non Drop | Speed 1500+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 249.3590, 274.2949, NULL, 50, 50000, '1939', 0, 1, '- Start Time : 0-1 Hour\r\n- Speed : Day 1500\r\n- Refill Gurantee : Lifetime ♻️\r\n- Drop Rate : Not Much Expected\r\n- Example Link : https://youtu.be/example', 1, 'Default', 0, NULL, 0),
(83, 5, 14282, '🆅🅸🅿 YouTube View | Non Drop | Speed 1000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Best Speed ]', 249.3590, 274.2949, NULL, 50, 500000, '1412', 1, 1, '- Start Time : 0 - 1 hour\r\n- Speed : Day 1000 / 1500\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(84, 5, 14734, '🆅🅸🅿 YouTube View | Non Drop | Speed 500+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥', 'YouTube » Views [ Best Speed ]', 268.5110, 295.3621, NULL, 50, 5000, '192', 1, 1, '🔥 100% always working 💯\r\n\r\n🔥 100% Non Drop 💯\r\n\r\n~ Start : 0-50 minutes \r\n~ Speed : 500+/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1, 'Default', 0, NULL, 0),
(85, 5, 14736, '🆅🅸🅿 YouTube View | Suggested + Mix | Non Drop | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Best Speed ]', 353.2586, 388.5845, NULL, 50, 200000, '61', 1, 1, '🔥 Mostly Suggested + Mix 💥\r\n🔥 100% always working 💯\r\n🔥 100% Non Drop 💯\r\n🔥 Best speed after start 💯\r\n\r\n~ Start : 0-1 hour\r\n~ Speed : 20k to 30k/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1, 'Default', 0, NULL, 0),
(86, 5, 14737, '🆅🅸🅿 YouTube View | Non Drop | Speed 500+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Best Speed ]', 267.1704, 293.8874, NULL, 100, 50000, '1290', 1, 1, '100% Always Working \r\n\r\nStart time : 0 - 1 hour\r\nSpeed : upto 500+\r\nDrop : 100% Non drop\r\nGuarantee : Lifetime', 1, 'Default', 0, NULL, 0),
(87, 5, 14738, '🆅🅸🅿 YouTube View | 1-5 Minutes Retention | Non Drop | Speed 2000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'YouTube » Views [ Best Speed ]', 385.9128, 424.5041, NULL, 100, 10000000, '410', 0, 1, 'YouTube Views – Fast Start, Top Quality, Lifetime Non Drop\r\n\r\n🔥🔥Experience our best working YouTube views service with super top quality and 100% non drop guarantee. Your order starts within 0–15 minutes and delivers speed of 2,000 to 5,000 views per day. We offer a lifetime guarantee for stable, permanent results. Simply provide your video link and enjoy fast, safe, and recommended service. Perfect for those who want premium, reliable, and effective YouTube promotion!', 1, 'Default', 0, NULL, 0);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`, `service_type`, `dripfeed`, `last_synced_at`, `manually_deleted`) VALUES
(88, 5, 15048, '🆅🅸🅿 YouTube View | 1-5 Minutes Retention | Non Drop | Speed 2000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'YouTube » Views [ High Retention ]', 385.9128, 424.5041, NULL, 100, 10000000, '550', 0, 1, 'YouTube Views – Fast Start, Top Quality, Lifetime Non Drop\r\n\r\n🔥🔥Experience our best working YouTube views service with super top quality and 100% non drop guarantee. Your order starts within 0–15 minutes and delivers speed of 2,000 to 5,000 views per day. We offer a lifetime guarantee for stable, permanent results. Simply provide your video link and enjoy fast, safe, and recommended service. Perfect for those who want premium, reliable, and effective YouTube promotion!', 1, 'Default', 0, NULL, 0),
(89, 5, 14699, '🆅🅸🅿 YouTube View | Suggested + Mix | Non Drop | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Suggested ]', 353.2586, 388.5845, NULL, 50, 10000000, '152', 0, 1, '🔥 Mostly Suggested + Mix 💥\r\n🔥 100% always working 💯\r\n🔥 100% Non Drop 💯\r\n🔥 Best speed after start 💯\r\n\r\n~ Start : 0-1 hour\r\n~ Speed : 20k to 30k/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1, 'Default', 0, NULL, 0),
(90, 5, 14720, 'Tiktok Live Stream Views 180 Minutes⚡️', 'YouTube » Views [ Suggested ]', 4409.5565, 4850.5121, NULL, 50, 150000, '196', 0, 0, '𝔻𝕖𝕥𝕒𝕚𝕝𝕤\r\n- 𝗦𝘁𝗮𝗿𝘁 𝘁𝗶𝗺𝗲: Instant\r\n- 𝗦𝗽𝗲𝗲𝗱: Fast\r\n- 𝗤𝘂𝗮𝗹𝗶𝘁𝘆: Real\r\n- 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲: No\r\n- 𝗥𝗲𝗳𝗶𝗹𝗹-𝗣𝗲𝗿𝗶𝗼𝗱:No Refill\r\n- 𝗗𝗿𝗼𝗽-𝗥𝗮𝘁𝗶𝗼: Non-Drop\r\n- 𝗟𝗶𝗻𝗸 𝗙𝗼𝗿𝗺𝗮𝘁: https://www.tiktok.com/@username/live\r\n\r\nℕ𝕠𝕥𝕖𝕤\r\n📌 We can not cancel your order once it has been submitted.\r\n📌 Check the link format carefully before placing the order.\r\n📌 Kindly make sure your account is public, Not private.', 1, 'Default', 0, NULL, 0),
(91, 5, 14721, 'Tiktok Live Stream Views 240 Minutes⚡️', 'YouTube » Views [ Suggested ]', 5867.1514, 6453.8665, NULL, 50, 150000, '262', 0, 0, '𝔻𝕖𝕥𝕒𝕚𝕝𝕤\r\n- 𝗦𝘁𝗮𝗿𝘁 𝘁𝗶𝗺𝗲: Instant\r\n- 𝗦𝗽𝗲𝗲𝗱: Fast\r\n- 𝗤𝘂𝗮𝗹𝗶𝘁𝘆: Real\r\n- 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲: No\r\n- 𝗥𝗲𝗳𝗶𝗹𝗹-𝗣𝗲𝗿𝗶𝗼𝗱:No Refill\r\n- 𝗗𝗿𝗼𝗽-𝗥𝗮𝘁𝗶𝗼: Non-Drop\r\n- 𝗟𝗶𝗻𝗸 𝗙𝗼𝗿𝗺𝗮𝘁: https://www.tiktok.com/@username/live\r\n\r\nℕ𝕠𝕥𝕖𝕤\r\n📌 We can not cancel your order once it has been submitted.\r\n📌 Check the link format carefully before placing the order.\r\n📌 Kindly make sure your account is public, Not private.', 1, 'Default', 0, NULL, 0),
(92, 5, 14321, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 3K | Speed 50K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 484.6388, 533.1027, NULL, 3000, 500000, '1314', 1, 1, '', 1, 'Default', 0, NULL, 0),
(93, 5, 14322, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 30K | Speed 5M+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 334.2850, 367.7135, NULL, 30000, 10000000, '479', 1, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 30K\r\n\r\nSpeed : upto 5M\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1, 'Default', 0, NULL, 0),
(94, 5, 14620, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 40K | Speed 50K+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 282.1036, 310.3140, NULL, 40000, 50000000, '2825', 1, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 40K\r\n\r\nSpeed : upto 50,000+\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1, 'Default', 0, NULL, 0),
(95, 5, 14714, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 20K | Speed 5M+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 331.8988, 365.0887, NULL, 20000, 50000000, '1642', 0, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 20K\r\n\r\nSpeed : upto 5M\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1, 'Default', 0, NULL, 0),
(96, 5, 14844, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 10K | Speed 50K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 369.0378, 405.9415, NULL, 10000, 2147483647, '445', 1, 1, 'Start time : 0 - 5 hours \r\n\r\nMinimum Order : 10K\r\n\r\nSpeed : upto 50,000+\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide\r\n\r\nContact support team before order for special big orders we try fast Start and double Speed', 1, 'Default', 0, NULL, 0),
(97, 5, 12814, '🆅🅸🅿 YouTube Real Ads Views | Minimum 500K | Non Drop | Speed 500K+ / DAY | Start Time 24-48 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Views  [ Real Google Ads ]', 146.7586, 161.4345, NULL, 500000, 2147483647, '0', 1, 0, 'In this service minimum order 500k+ views \r\n\r\nStart Time: 24 Hours (Sometime It will take 48 hours)\r\n\r\nComplete time: 36-72 Hours\r\n\r\nSpeed : 500K+ / Day\r\n\r\nGuarantee : 100% Non Drop \r\n\r\nTraffic Source : 100% Google Ads\r\n\r\nLocation : India / Worldwide / Random\r\n\r\nVideo Length: Must be less than 5 Mins\r\n\r\nNote: Approval time 24-48 hours!', 1, 'Default', 0, NULL, 0),
(98, 5, 14547, '🆅🅸🅿 YouTube Real Ads Views | Minimum 1M | Non Drop | Speed 1M+ / DAY | Start Time 24-48 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Views  [ Real Google Ads ]', 137.5861, 151.3447, NULL, 1000000, 2147483647, '0', 1, 1, 'In this service minimum order 1M views \r\n\r\nStart Time: 24 Hours (Sometime It will take 48 hours)\r\n\r\nComplete time: 36-72 Hours\r\n\r\nSpeed : 1M+ / Day\r\n\r\nGuarantee : 100% Non Drop \r\n\r\nTraffic Source : 100% Google Ads\r\n\r\nLocation : India / Worldwide / Random\r\n\r\nVideo Length: Must be less than 5 Mins\r\n\r\nNote: Approval time 24-48 hours!', 1, 'Default', 0, NULL, 0),
(99, 5, 15049, 'YouTube Live Stream Views 15 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 12.7680, 14.0448, NULL, 50, 50000, '12', 0, 0, '', 1, 'Default', 0, NULL, 0),
(100, 5, 15050, 'YouTube Live Stream Views 30 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 25.5360, 28.0896, NULL, 50, 50000, '18', 0, 0, '', 1, 'Default', 0, NULL, 0),
(101, 5, 15051, 'YouTube Live Stream Views 60 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 51.0720, 56.1792, NULL, 50, 50000, '16', 0, 0, '', 1, 'Default', 0, NULL, 0),
(102, 5, 15052, 'YouTube Live Stream Views 90 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 76.6080, 84.2688, NULL, 50, 50000, '14', 0, 0, '', 1, 'Default', 0, NULL, 0),
(103, 5, 15053, 'YouTube Live Stream Views 120 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 102.1440, 112.3584, NULL, 50, 50000, '39', 0, 0, '', 1, 'Default', 0, NULL, 0),
(104, 5, 14124, 'YouTube Video Likes | Speed 5K+ / DAY | No Refill | ⛔🔥', 'YouTube » Likes [ Cheapest ]', 41.9084, 46.0993, NULL, 10, 100000, '12', 0, 1, '⏱ Start: 1 hour (max 12 hours)  \r\n⚡ Speed: 5K+ / DAY (may vary)  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1, 'Default', 0, NULL, 0),
(105, 5, 14400, 'Youtube Likes | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Cheapest ]', 52.3488, 57.5837, NULL, 10, 30000, '40', 1, 0, '⏱ Start: 1 hour (max 1 hour)\r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1, 'Default', 0, NULL, 0),
(106, 5, 14520, 'YouTube Video Likes | Speed 50K+ / DAY | 30 Days Refill | ✅🔥⚡', 'YouTube » Likes [ Cheapest ]', 47.8800, 52.6680, NULL, 10, 500000, '37', 0, 1, '⏱ Start: 1 hour (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: 30 Days Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen. If drop happens within 30 days, refill will be given.', 1, 'Default', 0, NULL, 0),
(107, 5, 14571, 'YouTube Likes | Speed 50K+ / DAY | No Refill | ⛔🔥⚡', 'YouTube » Likes [ Cheapest ]', 38.3040, 42.1344, NULL, 10, 1000000, '13', 0, 0, '⏱ Start: 1 hour (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1, 'Default', 0, NULL, 0),
(108, 5, 13942, '🆅🅸🅿 Youtube Likes | Non Drop | Speed 1M+ / DAY | Start Time 0-15 Minutes | 𝗥𝗲𝗳𝗶𝗹𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 𝗔𝗰𝘁𝗶𝘃𝗲 | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Likes [ Best Speed ]', 223.6954, 246.0649, NULL, 10, 500000, '70', 1, 1, '⏱ Start: 0–15 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1, 'Default', 0, NULL, 0),
(109, 5, 14125, 'Youtube Likes | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 249.3590, 274.2949, NULL, 10, 10000000, '5', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 500K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1, 'Default', 0, NULL, 0),
(110, 5, 14526, 'Youtube Likes | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 65.4360, 71.9796, NULL, 10, 30000, '34', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔘 Button: 30 Days Refill Button \r\n✅️ Refill: Yes Lifetime Partial Support \r\n\r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1, 'Default', 0, NULL, 0),
(111, 5, 14561, '🆅🅸🅿 Youtube Likes | Real | Non Drop | Speed 5M+ Per DAY | Start Time 0-5 Minute | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐🔥⚡', 'YouTube » Likes [ Best Speed ]', 249.3590, 274.2949, NULL, 10, 10000000, '9', 0, 1, '✅️ Recommended for big orders ⚡️\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1, 'Default', 0, NULL, 0),
(112, 5, 14862, '🆅🅸🅿 Youtube Likes | Non Drop | Speed 1M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 273.6000, 300.9600, NULL, 10, 100000, '31', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1, 'Default', 0, NULL, 0),
(113, 5, 13590, 'YouTube Likes | India 🇮🇳 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 206.8416, 227.5258, NULL, 10, 50000, '12', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: India 🇮🇳  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(114, 5, 13743, 'YouTube Likes | PAK 🇵🇰 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 315.8095, 347.3904, NULL, 10, 50000, '41', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Pakistan 🇵🇰  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 0, 'Default', 0, NULL, 0),
(115, 5, 13943, 'YouTube Likes | Brazil 🇧🇷 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 50, 50000, '14', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Brazil 🇧🇷  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(116, 5, 13944, 'YouTube Likes | Kuwait 🇰🇼 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 305.2426, 335.7668, NULL, 10, 5000, '32', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Kuwait 🇰🇼  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 0, 'Default', 0, NULL, 0),
(117, 5, 15032, 'YouTube Likes | UK 🇬🇧 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: UK 🇬🇧  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(118, 5, 15033, 'YouTube Likes | Australia 🇦🇺 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Australia 🇦🇺  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(119, 5, 15034, 'YouTube Likes | Canada 🇨🇦 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Canada 🇨🇦  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(120, 5, 15035, 'YouTube Likes | Egypt 🇪🇬 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 100, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Egypt 🇪🇬  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(121, 5, 15036, 'YouTube Likes | BELGIUM 🇧🇪 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 368.6760, NULL, 100, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Belgium 🇧🇪  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(122, 5, 15037, 'YouTube Likes | USA 🇺🇸 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 206.8416, 227.5258, NULL, 10, 50000, '43', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: USA 🇺🇸  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(123, 5, 14919, 'YouTube Likes | USA 🇺🇸 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ USA 🇺🇸 ]', 206.8416, 227.5258, NULL, 10, 50000, '221', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: USA 🇺🇸  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1, 'Default', 0, NULL, 0),
(124, 5, 14459, 'YouTube Comments | Custom | Real HQ Profiles | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'YouTube » Comments [ Cheapest ]', 351.1200, 386.2320, NULL, 10, 2000, '5', 0, 0, '- Start Time: 0-5 Min (max 1 hour)\r\n- Speed: Day 5K\r\n- Refill: No Refill ⚠️\r\n- Drop Rate: Low Rate\r\n- Example Link: Video Link', 1, 'Custom Comments', 0, NULL, 0),
(125, 5, 14884, 'YouTube Comments | Custom | Real HQ Profiles | Non Drop | Speed 1000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Comments [ Cheapest ]', 925.7758, 1018.3533, NULL, 10, 50000, '36', 1, 0, '⏱ Start: 1 hour (max 3 hours)  \r\n⚡ Speed: 1,000+ / DAY  \r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Please provide your custom comments text clearly when ordering.  \r\n📌 Write one comment per line – you can write any comments of your choice.  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable', 1, 'Custom Comments', 0, NULL, 0),
(126, 5, 14458, '🆅🅸🅿 YouTube Comments | Custom Type | Real HQ | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Comments [ Best Speed ]', 3740.3856, 4114.4242, NULL, 5, 100000, '44', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ \r\n📉 Drop Ratio: 0% Confirm\r\n✅ Guarantee: Lifetime Refill  \r\n🔄 Always working – Non-stop \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Please provide your custom comments text clearly when ordering.  \r\n📌 Write one comment per line – you can write any comments of your choice.', 1, 'Custom Comments', 0, NULL, 0),
(127, 5, 14515, '🆅🅸🅿 YouTube Comments | Auto Title Related | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⚡️🔥', 'YouTube » Comments [ Best Speed ]', 4155.9840, 4571.5824, NULL, 10, 10000, '25', 1, 1, '⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ \r\n📉 Drop Ratio: 0% Confirm\r\n✅ Guarantee: Lifetime Refill  \r\n🔄 Always working – Non-stop\r\n\r\n🔗 Link: Video link  \r\n\r\n✅️ Comments will be auto-generated based on your video title.', 1, 'Default', 0, NULL, 0),
(128, 5, 14617, 'YouTube Short Video View | Non Drop | Speed 500+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Services [ Shorts ]', 304.9824, 335.4807, NULL, 100, 500000, '80', 0, 1, '𝗤𝘂𝗮𝗹𝗶𝘁𝘆 : High\r\n𝗦𝘁𝗮𝗿𝘁 : 0 to 5 Minutes \r\n𝗗𝗿𝗼𝗽 : 100% Stable\r\n\r\n𝗦𝗽𝗲𝗲𝗱 : 500-10K In Day\r\n\r\n𝗥𝗲𝗳𝗶𝗹𝗹 : Lifetime \r\n𝗖𝗮𝗻𝗰𝗲𝗹 :  Available\r\n𝗟𝗶𝗻𝗸 : Video Link', 1, 'Default', 0, NULL, 0),
(129, 5, 14693, 'YouTube Short Video Likes | Non-Drop | Speed 20K Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'YouTube » Services [ Shorts ]', 294.9750, 324.4725, NULL, 10, 100000, '36', 1, 0, '', 1, 'Default', 0, NULL, 0),
(130, 5, 14694, 'YouTube Short Video Views | Non Drop | Native Ads | Speed 500K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Services [ Shorts ]', 342.0866, 376.2953, NULL, 20000, 10000000, '5782', 0, 0, 'Start time : 1 hour - 5 hour\r\nSpeed : 500,000+/D\r\nGurantee : Lifetime', 1, 'Default', 0, NULL, 0),
(131, 5, 14696, 'YouTube Short Video View | Non Drop | Speed 1K+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Services [ Shorts ]', 318.2424, 350.0666, NULL, 100, 500000, '74', 0, 1, 'High Quality Fast Views\r\n\r\n200 - 400 Per Hour\r\n\r\nInstant Start\r\n\r\nNo Drops Seen\r\n\r\nRefill For Lifetime\r\n\r\nPut YouTube Shorts Video Link\r\n\r\n\r\n• Cancellation Available\r\n• Reliable Service Against Drops\r\n• Video Must Be Less Than 1 Minute', 1, 'Default', 0, NULL, 0),
(132, 5, 14592, 'Instagram Followers | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Followers [ Cheapest ]', 230.5262, 253.5789, NULL, 100, 100000, '24', 0, 1, '⏳ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 5–10% – no refill or refund will be provided in any case, take your own risk.', 1, 'Default', 0, NULL, 0),
(133, 5, 14624, 'Instagram Followers | Real HQ Profiles | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Followers [ Cheapest ]', 311.4936, 342.6429, NULL, 100, 30000, '12', 1, 1, '⏳ Start: 0–1 hour (max 3 hours)  \r\n⚡ Speed: 10K+ / DAY  \r\n🌟 Quality: Real + Mix App Data\r\n📉 Drop Ratio: 5–10%\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable \r\n\r\n⚠️ Drop ratio 5% – 10% possible, but Lifetime refill is available.', 1, 'Default', 0, NULL, 0),
(134, 5, 14672, 'Instagram Followers | Real Profiles | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Cheapest ]', 396.9417, 436.6359, NULL, 100, 500000, '21', 1, 1, '⏳ Start: 0–1 hour (max 3 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real Profiles  \r\n📉 Drop Ratio: 5–10%\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable \r\n\r\n⚠️ Drop ratio 5% – 10% possible, but Lifetime refill is available.', 1, 'Default', 0, NULL, 0),
(135, 5, 15057, 'Instagram Followers | Real Profiles | Speed 5K+ / DAY | No Refill | ⛔️', 'Instagram » Followers [ Cheapest ]', 171.3040, 188.4344, NULL, 10, 1000000, '201', 0, 1, '⏳ Start: 0–1 hour (max 12 hours)  \r\n🚅 Speed: 5K+ / DAY  \r\n🌟 Quality: Real Profiles + Mix\r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 10–50% – no refill or refund will be provided in any case, take your own risk.', 1, 'Default', 0, NULL, 0),
(136, 5, 15058, 'Instagram Followers | Real HQ Profiles | Speed 100K+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Followers [ Cheapest ]', 287.6916, 316.4608, NULL, 100, 500000, '384', 0, 1, '⏳ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 5–10% – no refill or refund will be provided in any case, take your own risk.', 1, 'Default', 0, NULL, 0),
(137, 5, 15061, 'Instagram Followers | Real Profiles | Speed 5K+ / DAY | No Refill | ⛔️', 'Instagram » Followers [ Cheapest ]', 142.5312, 156.7843, NULL, 100, 10000000, '189', 0, 0, '', 1, 'Default', 0, NULL, 0),
(138, 5, 14199, '🆅🅸🅿 Instagram Followers | Real HQ Profiles | All Links Accepted | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Best Speed ]', 629.8499, 692.8349, NULL, 100, 500000, '40', 1, 1, '⏱ Start: 0–5 mins (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Non-Drop Followers  \r\n✅ Guarantee: Lifetime Guarantee  \r\n🔄 Refill: Refill button enabled (easy refill request)  \r\n\r\n🔗 Link: Instagram profile link', 1, 'Default', 0, NULL, 0),
(139, 5, 14607, 'Instagram Followers | Real HQ Profiles | All Links Accepted | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Best Speed ]', 414.2001, 455.6201, NULL, 100, 500000, '21', 1, 1, '⏱ Start: 0–1 hour (max 3 hour)    \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Full Real HQ Profiles (Non Drop)  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Links: Instagram Account Link / URL\r\n\r\n⚠️ Note: Refill possible only if drop is 5% or more.', 1, 'Default', 0, NULL, 0),
(140, 5, 13930, 'Instagram Views | All Links Accepted | Non Drop | Speed 500K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Cheapest ]', 0.3800, 0.4180, NULL, 100, 2000000, '38', 0, 1, '- Start : 5 minutes / 1 hour\r\n- Speed : Day 500K+\r\n- Refill : Yes Refill Guarantee \r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(141, 5, 14075, 'Instagram Views | All Links Accepted | Speed 1M+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Views [ Cheapest ]', 0.2156, 0.2372, NULL, 100, 2147483647, '1056', 0, 1, '- Speed : Day 5m\r\n- Refill : No Refill\r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(142, 5, 14628, 'Instagram Views | All Links Accepted | Speed 1M+ / DAY | No Refill | ⛔️🔥', 'Instagram » Views [ Cheapest ]', 0.5130, 0.5643, NULL, 100, 100000000, '20', 0, 1, '- Link: Instagram Video Link\r\n- Location: Global\r\n- All Link | Video + Reels + IGTV\r\n\r\n⚠ Notes:\r\n- In case of high demand for the service, there may be changes in speed and start time.\r\n- Do not place the second order on the same link before your order is completed in the system.', 1, 'Default', 0, NULL, 0),
(143, 5, 14629, 'Instagram Views | All Links Accepted | Non Drop | Speed 1M+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Cheapest ]', 0.5986, 0.6585, NULL, 100, 100000000, '136', 0, 1, '- Link: Instagram Video Link\r\n- Location: Global\r\n- All Link | Video + Reels + IGTV\r\n\r\n⚠ Notes:\r\n- In case of high demand for the service, there may be changes in speed and start time.\r\n- Do not place the second order on the same link before your order is completed in the system.', 1, 'Default', 0, NULL, 0),
(144, 5, 14667, 'Instagram Reel Views | Speed 1M+ Per DAY | Start Time 0-5 Minutes | 🔥🔥⚡⚡', 'Instagram » Views [ Cheapest ]', 0.3800, 0.4180, NULL, 100, 200000000, '76', 0, 1, 'Start - Instant\r\n\r\nSpeed - 1M/ Day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - No\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Cancel Button is working', 1, 'Default', 0, NULL, 0),
(145, 5, 14869, 'Instagram Views | All Links Accepted | Non Drop | Speed 5M+ Per DAY | 🔥⚡', 'Instagram » Views [ Cheapest ]', 0.2576, 0.2834, NULL, 100, 2000000, '352', 0, 1, '🚨 Start : 5 minutes / 1+ hour\r\n- Speed : Day 5M\r\n- Refill : No Refill\r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(146, 5, 14066, 'Instagram Views | Non Drop | Speed 5M+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡', 'Instagram » Views [ Best Speed ]', 1.8810, 2.0691, NULL, 100, 2000000, '61', 0, 1, 'Start - Instant\r\n\r\nSpeed - 500K+ / day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Smooth working cheap service\r\n\r\n➜ Supports cancel button and we can mass cancel or complete all orders in case of delays', 1, 'Default', 0, NULL, 0),
(147, 5, 14071, 'Instagram Views + Reach | All Links Accepted | Non Drop | Speed 10M+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Best Speed ]', 22.6416, 24.9058, NULL, 100, 500000000, '71', 0, 1, '10K-20K Per Hour\r\n\r\nInstant Start ( Up To 15 Min )\r\n\r\nNo Drops Seen\r\n\r\nPut Video / Reel Link\r\n\r\n\r\n• There Is Some Extra Delivery\r\n• Cancellation Available\r\n• Fast And Stable\r\n• Best Price In The Market', 1, 'Default', 0, NULL, 0),
(148, 5, 14079, 'Instagram Views | All Links Accepted | Non Drop | Speed 1M+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Best Speed ]', 1.8810, 2.0691, NULL, 100, 2000000, '55', 0, 1, '', 1, 'Default', 0, NULL, 0),
(149, 5, 14566, 'Instagram Reel Views | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡️', 'Instagram » Views [ Best Speed ]', 0.3959, 0.4355, NULL, 100, 2000000, '27', 0, 1, '⌛️ Start Time: 0–5 Min (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY (may vary)  \r\n📉 Drop Ratio: 100% Non Drop  \r\n✅ Refill: Yes (Lifetime Guarantee)  \r\n\r\n🔗 Link: Your reel link / URL', 1, 'Default', 0, NULL, 0),
(150, 5, 14062, 'Instagram Views | Reel + IGTV | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗⭐🔥⚡', 'Instagram » Views [ IGTV + Reels ]', 1.8810, 2.0691, NULL, 100, 2147483647, '80', 0, 1, 'Start: INSTANT\r\nSpeed :100k/Hour\r\nGuarantee: Non Drop\r\nQuality: High Quality\r\nRefill: Lifetime', 1, 'Default', 0, NULL, 0),
(151, 5, 14068, 'Instagram Views | Reel + IGTV | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗⭐🔥⚡', 'Instagram » Views [ IGTV + Reels ]', 1.8810, 2.0691, NULL, 100, 200000000, '82', 0, 1, 'Start - 0-5 minutes\r\n\r\nSpeed - 100k / day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Another emergency server with better quality that helps in video ranking\r\n\r\n➜ High Speed And Instant Start\r\n\r\n➜ Works on all links including IGTV and long videos', 1, 'Default', 0, NULL, 0),
(152, 5, 13749, 'Instagram Likes | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Instagram » Likes [ Cheapest ]', 37.8028, 41.5831, NULL, 10, 100000, '46', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 10K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop  \r\n📉 Drop Ratio: High droping possible \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(153, 5, 14082, 'Instagram Likes | Real HQ Profiles | Speed 100K+ / DAY | No Refill | ⛔️🔥', 'Instagram » Likes [ Cheapest ]', 40.8302, 44.9132, NULL, 10, 10000000, '40', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop \r\n📉 Drop Ratio: 5-50% Possible \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(154, 5, 14192, 'Instagram Likes | Real HQ Profiles | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Likes [ Cheapest ]', 69.7452, 76.7197, NULL, 100, 1000000, '16', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n✅️ Refill: Yes Lifetime Guarantee \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(155, 5, 14668, 'Instagram Likes | Fake Bots | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Likes [ Cheapest ]', 44.3556, 48.7912, NULL, 10, 300000, '187', 0, 1, '- Link: Instagram Post Link\r\n- Location: Worldwide 🌎\r\n- Quality: Bot Accounts\r\n- Start: 0-5 Minutes (max 1 hour)\r\n- Speed: Day 100K 🚀\r\n- Drop Rate: Drop 0%\r\n- Refill Time: Lifetime ♻️\r\n- Cancel Button: Active 🚫 \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1, 'Default', 0, NULL, 0),
(156, 5, 11550, '🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Likes [ Best Speed ]', 72.7776, 80.0554, NULL, 100, 1000000, '19', 1, 1, '✅ Always Working – Non Stop\r\n⌛️ Start: 0–5 Minutes (Max 1 Hour)\r\n⚡ Speed: 5M+ / DAY (Ultra Fast)\r\n🌟 Quality: Real HQ Profiles\r\n♻️ Refill: Lifetime Guarantee\r\n\r\n🔗 Link: Your Video Link / URL\r\n\r\n✅️ Note: This service has never dropped before. If it drops in the future, we will provide refill.', 1, 'Default', 0, NULL, 0),
(157, 5, 13751, 'Instagram Likes | Real HQ Profiles | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'Instagram » Likes [ Best Speed ]', 70.3836, 77.4220, NULL, 50, 1000000, '13', 0, 1, '✅ Always Working – Non Stop\r\n⌛️ Start: 0–5 Minutes (Max 1 Hour)\r\n⚡ Speed: 5M+ / DAY (Ultra Fast)\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Refill: No if drop likes \r\n\r\n🔗 Link: Your Video Link / URL', 1, 'Default', 0, NULL, 0),
(158, 5, 14057, 'Instagram Likes | IND 🇮🇳 | Real Profiles | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Likes [ IND 🇮🇳 ]', 72.7776, 80.0554, NULL, 100, 1000000, '9', 0, 1, '⭐️ 100% Real Indian Profiles \r\n⏱ Start: 0-5 minutes (max 1 hour)\r\n⚡ Speed: 100K+ / DAY (after start)\r\n✅️ Refill: Yes Lifetime Guarantee\r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n✅️ Note: If drop happens in future, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(159, 5, 14067, 'Instagram Reach Impressions | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Reach Impressions', 14.2881, 15.7169, NULL, 10, 300000, '30', 1, 1, 'High Quality Accounts\r\nSpeed 10K - 20K Per Hour\r\nStart 0 - 5 Mins (max 1 hour)\r\nDrop Ratio No Drops Seen\r\nGuarantee Refill For Lifetime\r\n\r\nPut Instagram Reel/Post Link\r\n\r\n• Good Service To Rank The Post\r\n• Induces Real Reach\r\n• It Takes Up To 24 Hours To Update The Stats', 1, 'Default', 0, NULL, 0),
(160, 5, 14659, 'Instagram Comments | Custom | Real Profiles | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Comments [ Lifetime ]', 245.5751, 270.1326, NULL, 10, 50000, '21', 0, 1, 'Start - 1 hour \r\n\r\nSpeed - 5k / day\r\n\r\nQuality - Old Accounts with posts\r\n\r\nDrop - Non Drop\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Post / Reel URL', 1, 'Custom Comments', 0, NULL, 0),
(161, 5, 13632, 'Instagram Post Saves | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Saves [ Lifetime ]', 18.2400, 20.0640, NULL, 10, 50000, '953', 0, 1, 'High Quality Accounts\r\nSpeed 3K - 5K+ Per Hour\r\nStart 0-5 Mins (max 1 hour)\r\nDrop Ratio No Drops Seen\r\nGurantee Refill For Lifetime\r\n\r\nPut Instagram Post/ Reel Link\r\n\r\n• Good Service With Good Support\r\n• Superfast Server For Instant Result\r\n• Works On Any Kind Of Post', 1, 'Default', 0, NULL, 0),
(162, 5, 14077, 'Instagram Story Views | All Stories | Speed 5M+ Per DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 45.6000, 50.1600, NULL, 100, 15000, '36', 0, 1, '5K per hour\r\n\r\nMix Quality\r\n\r\nNon Drop\r\n\r\nNo Refill\r\n\r\nLink - Username without @\r\n\r\nIf u order 1K and post 10 stories u will get 1K views on each story\r\n\r\nCan have startup delays upto 1 hrs\r\n\r\nTake Screenshot for refunds', 1, 'Default', 0, NULL, 0),
(163, 5, 14078, 'Instagram Story Views | Speed 50K+ Per DAY | Start Time 0-5 Minutes | No Refill | ⛔️', 'Instagram » Services [ For Stories ]', 45.6000, 50.1600, NULL, 100, 15000, '5', 0, 1, 'HQ Indian Data From Apps\r\n\r\n500-1K Views Per Hour\r\n\r\nStart time 5 to 10 mins\r\n\r\nPut Instagram Profile Link/ Username', 1, 'Default', 0, NULL, 0),
(164, 5, 14324, 'Instagram Story Views | All Stories | 100% Real Active | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Services [ For Stories ]', 249.3750, 274.3125, NULL, 10, 100000, '246', 0, 1, '50K-500K / day\r\n\r\n100% Real Indian Human\r\n\r\nNever Drop\r\n\r\nLifetime Refill\r\n\r\n100% Real Indian Quality [ Mostly power accounts with large number of followers ]\r\n\r\nReal Human Power Accounts [ Data - 2 ]\r\n\r\nStory views would be distributed distributed on all stories with same ordered quantity', 1, 'Default', 0, NULL, 0),
(165, 5, 14325, 'Instagram Story Views | All Stories | Speed 10K+ / DAY | Start Time 0-5 Minutes |', 'Instagram » Services [ For Stories ]', 34.0416, 37.4457, NULL, 100, 1000000, '77', 0, 1, '★ Start: 0 - 10 mins / 1 hour \r\n★ Speed: 10K+ Per Day\r\n★ Quality: Mix QUality\r\n★ Drop: Non Drop\r\n\r\n★ Support on the service is good', 1, 'Default', 0, NULL, 0),
(166, 5, 14326, 'Instagram Story Views | All Stories | Speed 50K+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 35.6250, 39.1875, NULL, 100, 100000, '31', 0, 1, '🔥 Put username or profile link\r\n★ Start: 0-1 Hours \r\n★ Speed: 100k+ Per Day\r\n★ Quality: Mix\r\n★ Drop: Unknown\r\n★ Guarantee: :No\r\n\r\n🔝 It\\s a cheap server don\\t complain for non deliveries', 1, 'Default', 0, NULL, 0),
(167, 5, 14328, 'Instagram Story Views | All Stories | Speed 50K+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 39.5438, 43.4982, NULL, 100, 100000, '46', 0, 1, 'World Wide Quality With DP Accounts\r\n\r\nSuperfast Delivery Instant Complete\r\n\r\nInstant Start\r\n\r\nNo Drops Seen\r\n\r\nPut Instagram Profile/ Story Link\r\n\r\n\r\n• Perfect Quality With All DP Accounts\r\n• Cancellation Available\r\n• Take Screenshot With Date And Time For Any Issues', 1, 'Default', 0, NULL, 0),
(168, 5, 14329, 'Instagram Story Views | All Stories | Speed 10K+ / DAY | Start Time 0-5 Minutes |', 'Instagram » Services [ For Stories ]', 35.6250, 39.1875, NULL, 100, 15000, '41', 0, 1, '', 1, 'Default', 0, NULL, 0),
(169, 5, 13056, 'Facebook Followers | Profile &amp;amp; Page | Real HQ | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'Facebook » Followers [ Cheapest ]', 64.7590, 71.2349, NULL, 10, 100000000, '81', 0, 1, '🕑 Start Time 0-1 hour (max 2 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Cheapest service – speed may go up or down anytime  \r\n❌ No Refill – Use at your own risk', 1, 'Default', 0, NULL, 0),
(170, 5, 14491, 'Facebook Followers | Profile &amp;amp; Page | Real HQ | Speed 50K+ / DAY | 30 Days Refill | ✅️🔥⚡️', 'Facebook » Followers [ Cheapest ]', 130.9042, 143.9946, NULL, 10, 1000000, '51', 1, 1, '🕑 Start Time 0-1 hour (max 2 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Speed may go up or down anytime  \r\n✅ 30 Days Refill Guarantee – Full protection for your order', 1, 'Default', 0, NULL, 0),
(171, 5, 14563, 'Facebook Followers | Profile &amp;amp; Page | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'Facebook » Followers [ Cheapest ]', 73.0184, 80.3202, NULL, 100, 10000, '29', 1, 1, '🕑 Start Time 0-3 hours (max 6 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Speed may go up or down anytime  \r\n✅ Lifetime Refill Guarantee – Full protection for your order', 1, 'Default', 0, NULL, 0),
(172, 5, 14684, 'Facebook Followers + Likes | Real HQ Profiles | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Facebook » Followers [ Cheapest ]', 82.5930, 90.8523, NULL, 10, 1000000, '106', 0, 1, '🕑 Start Time 0-1 hour (max 24 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Cheapest service – speed may go up or down anytime  \r\n❌ No Refill – Use at your own risk\r\n\r\n- Link : Fb page link \r\n- No support for incorrect links', 1, 'Default', 0, NULL, 0),
(173, 5, 15054, 'Facebook Followers + Likes | Speed 5K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'Facebook » Followers [ Cheapest ]', 97.8880, 107.6768, NULL, 10, 1000000, '25', 0, 0, '📌 Cheapest service – start and speed may go up or down anytime', 1, 'Default', 0, NULL, 0),
(174, 5, 14140, 'Facebook Page Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Facebook » Followers [ Page ]', 238.9691, 262.8660, NULL, 10, 2000000, '35', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes Lifetime\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1, 'Default', 0, NULL, 0),
(175, 5, 14187, 'Facebook Page Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Page ]', 213.3653, 234.7019, NULL, 10, 5000000, '54', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes 30 days\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1, 'Default', 0, NULL, 0),
(176, 5, 14287, 'Facebook Profile Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Profile ]', 213.3653, 234.7019, NULL, 10, 500000, '27', 0, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes 30 days\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1, 'Default', 0, NULL, 0),
(177, 5, 14545, 'Facebook Profile Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Facebook » Followers [ Profile ]', 238.9691, 262.8660, NULL, 10, 2000000, '40', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes Lifetime\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1, 'Default', 0, NULL, 0),
(178, 5, 13218, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Facebook » Followers + Likes', 102.1440, 112.3584, NULL, 10, 1000000, '15', 1, 1, '⌛️ Start Time: 0 – 1 Hour (max 5 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 10K+ / Day  \r\n✅ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your page link / URL', 1, 'Default', 0, NULL, 0),
(179, 5, 14030, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers + Likes', 426.8617, 469.5478, NULL, 10, 100000, '120', 1, 1, '⌛️ Start Time: 0 – 1 Hour (max 2 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your page link / URL', 1, 'Default', 0, NULL, 0),
(180, 5, 15030, 'Facebook Followers + Likes | Real HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Followers + Likes', 89.7750, 98.7525, NULL, 10, 1000000, '112', 0, 1, '⌛️ Start Time: 0 – 1 Hour (max 2 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n⛔️ Refill: No if Drop \r\n\r\n🔗 Link: Your page link / URL', 1, 'Default', 0, NULL, 0),
(181, 5, 13222, 'Facebook Page Followers | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers [ Best Speed ]', 238.9691, 262.8660, NULL, 10, 5000000, '43', 1, 1, 'Ultra Fast working 🔥\r\n\r\nSometime start in 1 hour', 1, 'Default', 0, NULL, 0),
(182, 5, 14687, 'Facebook Profile Followers | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers [ Best Speed ]', 238.9691, 262.8660, NULL, 10, 5000000, '33', 0, 1, 'Ultra Fast working 🔥\r\n\r\nSometime start in 1 hour', 1, 'Default', 0, NULL, 0),
(183, 5, 13818, 'Facebook Followers | Page / Profile | Real HQ HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Real HQ ]', 348.3357, 383.1692, NULL, 100, 100000, '62', 1, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: 30 Days Guarantee', 1, 'Default', 0, NULL, 0),
(184, 5, 13936, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Real HQ ]', 204.0567, 224.4624, NULL, 10, 5000000, '816', 1, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: 30 Days Guarantee', 1, 'Default', 0, NULL, 0),
(185, 5, 14493, 'Facebook Followers | Page / Profile | Real HQ HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 🔥⚡', 'Facebook » Followers [ Real HQ ]', 288.4655, 317.3121, NULL, 100, 100000, '72', 0, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n⛔️ Refill: No Refill if Drop', 1, 'Default', 0, NULL, 0),
(186, 5, 13658, 'Facebook Post Likes | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'Facebook » Post Likes [ Cheapest ]', 75.6120, 83.1732, NULL, 20, 5000, '25', 1, 1, '⏳ Start Time: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Facebook post link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n✅ Drop can happen in cheap service, but Lifetime Refill is available', 1, 'Default', 0, NULL, 0),
(187, 5, 14570, 'Facebook Post Likes | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Facebook » Post Likes [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '246', 0, 1, '⏳ Start Time: 0 – 1 Hour (max 3 hours)  \r\n⚡ Speed: 10K+ / DAY  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Facebook post link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(188, 5, 13674, 'Facebook Post Likes | Real HQ Profiles | Speed 50K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 75.9122, 83.5034, NULL, 100, 500000, '22', 0, 1, '⏳ Start Time: 0–1 Hour \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Facebook post link  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given', 1, 'Default', 0, NULL, 0),
(189, 5, 14162, 'Facebook Post Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 82.5132, 90.7645, NULL, 20, 500000, '18', 1, 1, '⏳ Start Time: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: 30 Days Refill  \r\n\r\n🔗 Link: Facebook post link', 1, 'Default', 0, NULL, 0),
(190, 5, 14163, 'Facebook Post Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 101.4418, 111.5859, NULL, 20, 500000, '13', 1, 1, '⏳ Start Time: 0-1 hour(max 2 hours) \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Facebook post link', 1, 'Default', 0, NULL, 0),
(191, 5, 13051, 'Facebook Post Reaction | Heart ❤️ | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '603', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Heart ❤️', 1, 'Default', 0, NULL, 0),
(192, 5, 13052, 'Facebook Post Reaction | Care 🥰 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '261', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1, 'Default', 0, NULL, 0),
(193, 5, 13053, 'Facebook Post Reaction | Wow 😲 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '162', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😮', 1, 'Default', 0, NULL, 0),
(194, 5, 13054, 'Facebook Post Reaction | Haha 😂 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '15', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Haha 😄', 1, 'Default', 0, NULL, 0),
(195, 5, 13055, 'Facebook Post Reaction | Sad 😢 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '23', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1, 'Default', 0, NULL, 0),
(196, 5, 13657, 'Facebook Post Reaction | Like 👍 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '172', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Like 👍', 1, 'Default', 0, NULL, 0),
(197, 5, 14411, 'Facebook Post Reaction | Angry 😡 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 25.6318, NULL, 10, 500000, '31', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Angry 😡', 1, 'Default', 0, NULL, 0);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`, `service_type`, `dripfeed`, `last_synced_at`, `manually_deleted`) VALUES
(198, 5, 13656, 'Facebook Post Reaction | Care 🥰 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 50, 100000, '18', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1, 'Default', 0, NULL, 0),
(199, 5, 13659, 'Facebook Post Reaction | Wow 😲 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 50, 100000, '39', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😲', 1, 'Default', 0, NULL, 0),
(200, 5, 13660, 'Facebook Post Reaction | Sad 😥 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 30, 100000, '13', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1, 'Default', 0, NULL, 0),
(201, 5, 13661, 'Facebook Post Reaction | Haha 😄 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 50, 100000, '24', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Haha 😄', 1, 'Default', 0, NULL, 0),
(202, 5, 14171, 'Facebook Post Reaction | Love ❤️ | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 50, 100000, '18', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Love ❤️', 1, 'Default', 0, NULL, 0),
(203, 5, 14751, 'Facebook Post Reaction | Angry 😡 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 328.2621, NULL, 50, 100000, '21', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Angry 😡', 1, 'Default', 0, NULL, 0),
(204, 5, 14877, 'Facebook Post Reaction | Like 👍 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 304.9318, 335.4249, NULL, 50, 100000, '22', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Like 👍', 1, 'Default', 0, NULL, 0),
(205, 5, 14878, 'Facebook Post Reaction | Wow 😲 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 102.9835, NULL, 10, 500000, '24', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😮', 1, 'Default', 0, NULL, 0),
(206, 5, 14879, 'Facebook Post Reaction | Heart ❤️ | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 102.9835, NULL, 10, 500000, '10', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Heart ❤️', 1, 'Default', 0, NULL, 0),
(207, 5, 14880, 'Facebook Post Reaction | Care 🥰 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 102.9835, NULL, 10, 500000, '5', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1, 'Default', 0, NULL, 0),
(208, 5, 14885, 'Facebook Post Reaction | Sad 😢 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 102.9835, NULL, 10, 500000, '11', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1, 'Default', 0, NULL, 0),
(209, 5, 12912, 'Facebook Video Views | Non Drop | Speed 5000+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'Facebook » Views [ Cheapest ]', 21.5062, 23.6569, NULL, 500, 100000000, '254', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee', 1, 'Default', 0, NULL, 0),
(210, 5, 13673, 'Facebook Reel Views | Non Drop | Speed 5000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Facebook » Views [ Cheapest ]', 15.5610, 17.1171, NULL, 500, 10000000, '81', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(211, 5, 14147, 'Facebook Reel Views | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'Facebook » Views [ Cheapest ]', 12.4488, 13.6937, NULL, 500, 10000000, '122', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n❌ Refill: No Refill (If Drop Views)  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(212, 5, 14861, 'Facebook Video Views | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'Facebook » Views [ Cheapest ]', 17.2049, 18.9254, NULL, 500, 100000000, '52', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n❌ Refill: No Refill (If Drop Views)  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1, 'Default', 0, NULL, 0),
(213, 5, 15060, 'Facebook Reel Views / Plays | Non Drop | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Facebook » Views [ Cheapest ]', 9.5760, 10.5336, NULL, 500, 100000000, '308', 0, 1, '- Link : Facebook video/reels link\r\n- Start Time : 0 - 10 minutes\r\n- Speed : 10k/Per Day\r\n- Refill : Lifetime Refill ♻️\r\n- Non Drop', 1, 'Default', 0, NULL, 0),
(214, 5, 14146, 'Facebook Video Views | Non Drop | Speed 100K / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Facebook » Views [ Best Speed ]', 37.7854, 41.5640, NULL, 500, 100000000, '246', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(215, 5, 14396, 'Facebook Reel Views | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Facebook » Views [ Best Speed ]', 23.4612, 25.8073, NULL, 500, 10000000, '192', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1, 'Default', 0, NULL, 0),
(216, 5, 14901, 'Facebook Live Stream Views 15 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 140.4480, 154.4928, NULL, 20, 10000, '15', 0, 0, '- no guarantee service, pls test before using', 1, 'Default', 0, NULL, 0),
(217, 5, 14902, 'Facebook Live Stream Views 30 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 280.8960, 308.9856, NULL, 20, 10000, '18', 0, 0, '', 1, 'Default', 0, NULL, 0),
(218, 5, 14903, 'Facebook Live Stream Views 60 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 561.7920, 617.9712, NULL, 20, 10000, '18', 0, 0, '', 1, 'Default', 0, NULL, 0),
(219, 5, 14904, 'Facebook Live Stream Views 90 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 842.6880, 926.9568, NULL, 20, 10000, '112', 0, 0, '', 1, 'Default', 0, NULL, 0),
(220, 5, 14905, 'Facebook Live Stream Views 120 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1123.5840, 1235.9424, NULL, 20, 10000, '17', 0, 0, '', 1, 'Default', 0, NULL, 0),
(221, 5, 14906, 'Facebook Live Stream Views 150 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1404.4800, 1544.9280, NULL, 20, 10000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(222, 5, 14907, 'Facebook Live Stream Views 180 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1685.3760, 1853.9136, NULL, 20, 10000, '13', 0, 0, '', 1, 'Default', 0, NULL, 0),
(223, 5, 14908, 'Facebook Live Stream Views 300 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 2808.9600, 3089.8560, NULL, 20, 10000, '383', 0, 0, '', 1, 'Default', 0, NULL, 0),
(224, 5, 14178, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 331.9680, 365.1648, NULL, 1, 1, '133', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(225, 5, 14436, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 367.0800, 403.7880, NULL, 1, 1, '965', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(226, 5, 14704, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 494.7600, 544.2360, NULL, 1, 1, '76', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(227, 5, 14894, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 204.2880, 224.7168, NULL, 1, 1, '175', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(228, 5, 14895, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 226.6320, 249.2952, NULL, 1, 1, '164', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(229, 5, 14896, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 309.6240, 340.5864, NULL, 1, 1, '33', 0, 0, '- Start Time: 0–1 Hour\r\n- Speed: 60K / DAY\r\n- Drop Rate: 0%\r\n- Refill Time: Lifetime ✅️\r\n- Need 1+ hour video link\r\n\r\n✔ Video length must be 1+ hour\r\n✔ Monetization 60K minutes package\r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(230, 5, 13654, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1181.0400, 1299.1440, NULL, 1, 1, '284', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(231, 5, 14923, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1308.7200, 1439.5920, NULL, 1, 1, '3462', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(232, 5, 14924, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1596.0000, 1755.6000, NULL, 1, 1, '869', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(233, 5, 15019, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 5990.3200, 6589.3520, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(234, 5, 15020, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 6022.2400, 6624.4640, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(235, 5, 15021, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 1+ Hour Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 6086.0800, 6694.6880, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(236, 5, 15022, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6149.9200, 6764.9120, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(237, 5, 15023, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6213.7600, 6835.1360, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(238, 5, 15024, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 1+ Hour Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6277.6000, 6905.3600, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1, 'Package', 0, NULL, 0),
(239, 5, 14477, 'Facebook Comments | Custom | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Comments [ Real Profiles ]', 69.2266, 76.1493, NULL, 10, 100000000, '8', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - No Refill ⚠️', 1, 'Custom Comments', 0, NULL, 0),
(240, 5, 15055, 'Facebook Comments | Random | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Comments [ Real Profiles ]', 69.2266, 76.1493, NULL, 10, 100000000, '40', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - No Refill ⚠️', 1, 'Default', 0, NULL, 0),
(241, 5, 15056, 'Facebook Comments | Random | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'Facebook » Comments [ Real Profiles ]', 86.4500, 95.0950, NULL, 10, 100000000, '21', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - Lifetime ✅️', 1, 'Default', 0, NULL, 0),
(242, 5, 15028, 'Twitter Followers | HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️ 🔥 ⚡️', 'X Twitter » Followers [ Best Speed ]', 1272.0492, 1399.2542, NULL, 100, 1000000, '11', 0, 0, '', 1, 'Default', 0, NULL, 0),
(243, 5, 15029, 'Twitter Followers | HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅️ 🔥 ⚡️', 'X Twitter » Followers [ Best Speed ]', 1754.0785, 1929.4863, NULL, 100, 100000, '5', 1, 0, '', 1, 'Default', 0, NULL, 0),
(244, 5, 13312, 'Twitter Impressions | Non Drop | Speed 1M+ Per DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Impressions [ Best Speed ]', 18.0163, 19.8180, NULL, 500, 2147483647, '55', 0, 1, 'No guarantee service', 1, 'Default', 0, NULL, 0),
(245, 5, 13868, 'Twitter Impressions  | Non Drop | Speed 1M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'X Twitter » Impressions [ Best Speed ]', 8.2992, 9.1291, NULL, 100, 500000000, '13', 0, 0, '- Start Time : 0-5 Mins (max 1 hour)\r\n- Speed : Day 1M\r\n- Refill Time : Lifetime\r\n- Drop Rate : No Drop\r\n- Example Link : https://twitter.com/username/status/123', 1, 'Default', 0, NULL, 0),
(246, 5, 14427, 'Twitter Profile Visit Impressions  | Non Drop | Speed 5 Million Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'X Twitter » Profile Visit [ Fast ]', 2.4206, 2.6627, NULL, 100, 100, '588', 0, 1, '', 1, 'Default', 0, NULL, 0),
(247, 5, 14608, 'Twitter Tweet Views | Speed 50K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'X Twitter » Profile Visit [ Fast ]', 2.8728, 3.1601, NULL, 100, 2147483647, '407', 0, 1, '- Start Time : 0-5 Mins (max 1 hour)\r\n- Speed : DAY 50K 🚀\r\n- Refill : No Refill if drop\r\n- Drop Ratio : No Drop found in past\r\n\r\n- Example Link : Twitter Tweet/Video Link', 1, 'Default', 0, NULL, 0),
(248, 5, 13859, 'Twitter Poll Votes | 100% Non-Drop | Speed 100K Per Day | Start Time 1-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'X Twitter » Poll Votes [ Refill ]', 104.0600, 114.4660, NULL, 100, 100000, '0', 0, 0, '💧 Drop: no\r\n⭐ Guarantee: lifetime\r\n🔗Example link: www....com?vote=ButtonNumber', 1, 'Default', 0, NULL, 0),
(249, 5, 13844, 'Twitter Tweet Views | Non Drop | Speed 5M / DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 3.3250, 3.6575, NULL, 100, 2147483647, '11', 0, 1, '', 1, 'Default', 0, NULL, 0),
(250, 5, 14197, 'Twitter Views | Tweet + Video | Non Drop | Speed 50K+ / DAY | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 3.1920, 3.5112, NULL, 100, 500000000, '44', 0, 1, 'Working for twitter tweet and videos both', 1, 'Default', 0, NULL, 0),
(251, 5, 14567, 'Twitter Tweet Views | Non Drop | Speed 10M / DAY | Start Time 0-5  Minutes | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 8.2992, 9.1291, NULL, 100, 6000000, '7', 0, 1, 'Start: Instant\r\nSpeed: 100M/Day\r\nDrop Ratio: Non-Drop\r\nExample Link: Tweet Link', 1, 'Default', 0, NULL, 0),
(252, 5, 14568, 'Twitter Tweet Views | Speed 1M+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'X Twitter » Views [ For Tweet ]', 2.0110, 2.2121, NULL, 100, 100000000, '2', 0, 1, '', 1, 'Default', 0, NULL, 0),
(253, 5, 12994, 'Twitter Video Views | Non Drop | Speed 5M Per DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Video ]', 6.1606, 6.7766, NULL, 100, 2147483647, '13', 0, 1, '', 1, 'Default', 0, NULL, 0),
(254, 5, 13860, 'Twitter Video Views | Non Drop | Speed 100K Per DAY | Start Time 0-1 Hour | 🔥⚡', 'X Twitter » Views [ For Video ]', 5.2030, 5.7233, NULL, 100, 2147483647, '21', 0, 1, '⊚ 𝗦𝘁𝗮𝗿𝘁 : Instant / 1-3 hurs\r\n⊚ 𝗦𝗽𝗲𝗲𝗱 : 200k/day\r\n⊚ 𝗤𝘂𝗮𝗹𝗶𝘁𝘆 : Real\r\n⊚ 𝗥𝗲𝗳𝗶𝗹𝗹 : No\r\n⊚ 𝗥𝗲𝗳𝗶𝗹𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 : No\r\n⊚ 𝗖𝗮𝗻𝗰𝗲𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 : No\r\n⊚ 𝗗𝗿𝗼𝗽 𝗥𝗮𝘁𝗶𝗼 : %0\r\n⊚ 𝗘𝘅𝗮𝗺𝗽𝗹𝗲 𝗹𝗶𝗻𝗸 : https://twitter.com/abc/status/123', 1, 'Default', 0, NULL, 0),
(255, 5, 14677, 'Twitter Video Views | Speed 1M / DAY | Start Time 0-5 Minutes |🔥⚡', 'X Twitter » Views [ For Video ]', 8.1875, 9.0062, NULL, 100, 2147483647, '35', 0, 1, '', 1, 'Default', 0, NULL, 0),
(256, 5, 14678, 'Twitter Views | Non Drop | Speed 10M / DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Video ]', 2.3276, 2.5604, NULL, 100, 2147483647, '14', 0, 1, 'Always working 100%', 1, 'Default', 0, NULL, 0),
(257, 5, 14670, 'Twitter Views | Tweet + Video | Non Drop | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'X Twitter » Views [ Lifetime ]', 2.2344, 2.4578, NULL, 100, 1000000000, '41674', 0, 1, 'Link: Tweet / Video Link', 1, 'Default', 0, NULL, 0),
(258, 5, 12987, 'Twitter Likes | Speed 500K+ / DAY | Start Time 0-1 Hour | No Refill | 🔥⚡', 'X Twitter » Likes [ No Refill ]', 384.9353, 423.4289, NULL, 10, 10000, '42', 0, 1, 'No Refill Guarantee', 1, 'Default', 0, NULL, 0),
(259, 5, 13554, 'Spotify Followers | No Drop | Speed 50K / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Spotify » Followers [ Lifetime ]', 74.2459, 81.6705, NULL, 100, 100000000, '15', 1, 0, '- Start Time : 30 minutes\r\n- Speed : Day 50K\r\n- Refill : Lifetime ♻️\r\n- Link : https://open.spotify.com/artist/xyz\r\n\r\n✔ Followers/User/Artist/Podcast working for all\r\n✔ Playlist Followers will update in 0 - 1 Hours\r\nUser &amp;amp; Artist Followers will update in 1 - 48 Hours\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(260, 5, 13908, 'Spotify Followers | No Drop | Speed 100K / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Spotify » Followers [ Lifetime ]', 79.4489, 87.3938, NULL, 100, 50000000, '24', 0, 0, '- Start Time : 30 minutes\r\n- Speed : Day 100K\r\n- Refill : Lifetime ♻️\r\n- Link : https://open.spotify.com/artist/xyz\r\n\r\n✔ Followers/User/Artist/Podcast working for all\r\n✔ Playlist Followers will update in 0 - 1 Hours\r\nUser &amp;amp; Artist Followers will update in 1 - 48 Hours\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(261, 5, 13543, 'Spotify Plays | USA 🇺🇸 | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Spotify » Plays [ Best Speed ]', 274.0987, 301.5086, NULL, 500, 20000000, '5451', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1, 'Default', 0, NULL, 0),
(262, 5, 13877, 'Spotify Free Plays | Global 🌍 | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Spotify » Plays [ Best Speed ]', 313.8232, 345.2055, NULL, 500, 20000000, '3308', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1, 'Default', 0, NULL, 0),
(263, 5, 13878, 'Spotify Plays | USA 🇺🇸 | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'Spotify » Plays [ Premium ]', 274.0987, 301.5086, NULL, 500, 20000000, '5449', 1, 0, 'Spotify Plays takes 24-48 hours to show analysis', 1, 'Default', 0, NULL, 0),
(264, 5, 13879, 'Spotify Premium Plays | Lifetime Guarantee | 500-2k/days | INSTANT', 'Spotify » Plays [ Premium ]', 270.0832, 297.0916, NULL, 1000, 100000000, '3954', 0, 0, '', 1, 'Default', 0, NULL, 0),
(265, 5, 13880, 'Spotify Premium Plays | Lifetime Guarantee | 5k/days | INSTANT', 'Spotify » Plays [ Premium ]', 562.6698, 618.9368, NULL, 1000, 2147483647, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(266, 5, 13881, 'Spotify  𝐏𝐑𝐄𝐌𝐈𝐔𝐌 Search Plays | Max 10M | 3.5k/days | INSTANT', 'Spotify » Plays [ Premium ]', 196.9066, 216.5973, NULL, 1000, 10000000, '1153', 0, 0, '', 1, 'Default', 0, NULL, 0),
(267, 5, 13894, 'Spotify Plays | 🇬🇧 UK | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '1768', 0, 0, '', 1, 'Default', 0, NULL, 0),
(268, 5, 13895, 'Spotify Plays | 🇸🇪 SWEDEN | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '559', 0, 0, '', 1, 'Default', 0, NULL, 0),
(269, 5, 13897, 'Spotify Plays | 🇮🇪 IRELAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '381', 0, 0, '', 1, 'Default', 0, NULL, 0),
(270, 5, 13899, 'Spotify Plays | 🇲🇽 MEXICO | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '376', 0, 0, '', 1, 'Default', 0, NULL, 0),
(271, 5, 13900, 'Spotify Plays | 🇳🇱 NETHERLANDS | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(272, 5, 13901, 'Spotify Plays | 🇳🇴 NORWAY | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(273, 5, 13903, 'Spotify Plays | 🇧🇪 BELGIUM | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(274, 5, 13904, 'Spotify Plays | 🇵🇹 PORTUGAL | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '1318', 0, 0, '', 1, 'Default', 0, NULL, 0),
(275, 5, 13905, 'Spotify Plays | 🇦🇹 AUSTRIA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(276, 5, 13906, 'Spotify Plays | 🇳🇿 NEW ZEALAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(277, 5, 13907, 'Spotify Plays | 🇨🇭 SWITZERLAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '1437', 0, 0, '', 1, 'Default', 0, NULL, 0),
(278, 5, 13909, 'Spotify Plays | 🇬🇷 GREECE | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(279, 5, 13910, 'Spotify Plays | 🇦🇺 AUSTRALIA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(280, 5, 13913, 'Spotify Plays | 🇦🇷 ARGENTINA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(281, 5, 13914, 'Spotify Plays | 🇹🇷 TURKEY | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 114.0703, NULL, 1000, 500000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(282, 5, 13917, 'Spotify Monthly Listerners | 🇺🇲 USA | Speed: 1-3K Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'Spotify » Monthly Listerners', 682.7131, 750.9844, NULL, 1000, 5000000, '3111', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1, 'Default', 0, NULL, 0),
(283, 5, 13918, 'Spotify Monthly Listerners | 🌍 Global | Speed: 1-3K Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'Spotify » Monthly Listerners', 682.7131, 750.9844, NULL, 1000, 5000000, '1151', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1, 'Default', 0, NULL, 0),
(284, 5, 13919, 'Spotify Saves [Track/Album/Episode] 30 Days Refill | Max 1M | Start 1-12 Hours | 50K/Day |', 'Spotify » Saves [ Refill ]', 94.3636, 103.8000, NULL, 100, 1000000, '11', 0, 0, '', 1, 'Default', 0, NULL, 0),
(285, 5, 13920, 'Spotify Saves [For Track/Album] | Lifetime Guaranteed | Max 100K | Start 1-12 Hours | 1.5K-3K/Day |♻️', 'Spotify » Saves [ Refill ]', 102.9420, 113.2362, NULL, 20, 1000000, '10634', 0, 0, '', 1, 'Default', 0, NULL, 0),
(286, 5, 14873, 'Telegram Members | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Telegram » Members [ Cheapest ]', 0.9310, 1.0241, NULL, 1, 1000000, '1897', 0, 1, '- Quality: Low Quality\r\n- Start Time: 0 - 24 hours \r\n- Speed: Day 10K 🚀\r\n- Drop Rate: High Drop\r\n- Refill: No Refill in Any Case ⚠️\r\n- Cancel Button: Enable 🚫\r\n- Example Link: https://t.me/username or @username\r\n\r\n⚠ Note:\r\n- The speed of the cheapest service may go up or down at any time, and there may also be a delay in the start. Additionally, the service rate may change at any time.', 1, 'Default', 0, NULL, 0),
(287, 5, 14955, 'Telegram Members | Speed 15K+ / DAY | No Refill | ⛔🔥', 'Telegram » Members [ Cheapest ]', 11.1056, 12.2162, NULL, 100, 100000, '32', 0, 1, '- Speed : Day 15K+\r\n- Drop Rate : %50 to %100\r\n- Refill : No Refill in Any Case\r\n- Example Link : https://t.me/username or @username\r\n\r\n- The speed of the cheapest service may go up or down at any time, and there may also be a delay in the start. Additionally, the service rate may change at any time.', 1, 'Default', 0, NULL, 0),
(288, 5, 13712, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 30 Days Refill | ✅🔥⚡', 'Telegram » Members [ Best Speed ]', 238.3466, 262.1813, NULL, 10, 1000000, '50', 0, 1, '- Quality : High Quality Members\r\n- Start Time : 0-5 Minutes\r\n- Speed : Day 50K + 🚀\r\n- Refill Time : 30 days ♻️\r\n- Drop Rate : No Drop\r\n- Example Link : https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1, 'Default', 0, NULL, 0),
(289, 5, 14248, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 90 Days Refill | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 272.6979, 299.9677, NULL, 500, 1000000, '301', 0, 1, '- Quality : High Quality Members\r\n- Start Time : 0-5 Minutes\r\n- Speed : Day 100K 🚀\r\n- Refill Time : 90 days ♻️\r\n- Drop Rate : No Drop\r\n- Example Link : https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1, 'Default', 0, NULL, 0),
(290, 5, 14385, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 121.9344, 134.1278, NULL, 10, 500000, '131', 0, 1, '👤 100% real Telegram users from mixed GEOs\r\n🔁 Lifetime refill guarantee — no expiration\r\n📱 All actions via real Android/iOS devices\r\n⚡ Up to 5 million members/day delivery speed\r\n🛡️ Direct provider access — no middlemen\r\n🌍 GEO: BR, MX, IR, AR, IN, ES, PK, PT (Mixed)\r\n\r\nGuarantee\r\nReal\r\nCancel button\r\nSpeed 10M per day\r\n26392 active accounts', 1, 'Default', 0, NULL, 0),
(291, 5, 14386, 'Telegram Members | Speed 50K+ Per DAY | Start Time 5 Minute | 365 Days Refill | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 424.9190, 467.4109, NULL, 500, 100000, '39', 0, 1, 'Guarantee: 1 year refill on private links (others link no refill)\r\n\r\nImportant note: it won\\t cover old drops, we will refuse to refill drops belongs to other services. We are able to understand our drops\r\n\r\nChannels which can cause bans for the members will be canceled automatically [Such as drugs, porn etc.]\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(292, 5, 14451, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 97.5475, 107.3023, NULL, 10, 500000, '53', 0, 1, '- Quality: HQ Accounts\r\n- Start Time: 0-5 Mins (mqx 1 hour)\r\n- Speed: Day 100K\r\n- Refill Time: Lifetime \r\n- Drop Rate: No Drop\r\n- Example Link: https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1, 'Default', 0, NULL, 0),
(293, 5, 14874, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | 30 Days Refill | ✅🔥⚡️', 'Telegram » Members [ Best Speed ]', 246.6593, 271.3252, NULL, 500, 100000, '60', 0, 1, '', 1, 'Default', 0, NULL, 0),
(294, 5, 14929, 'Telegram Premium Members + Views | 7 Days Premium', 'Telegram » Members [ Premium - S1 ]', 1207.5336, 1328.2870, NULL, 10, 100000, '11', 0, 1, 'All Members 7 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n7 Days No Drop\r\nWarranty 7 days', 1, 'Default', 0, NULL, 0),
(295, 5, 14930, 'Telegram Premium Members + Views | 14 Days Premium', 'Telegram » Members [ Premium - S1 ]', 2113.1838, 2324.5022, NULL, 10, 20000, '31', 0, 1, 'All Members 14 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n14 Days No Drop\r\nWarranty 14 days', 1, 'Default', 0, NULL, 0),
(296, 5, 14931, 'Telegram Premium Members + Views | 20-30 Days Premium', 'Telegram » Members [ Premium - S1 ]', 2415.0672, 2656.5739, NULL, 10, 20000, '20', 0, 1, 'All Members 20-30 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n20-30 Days No Drop\r\nWarranty - 20 Days', 1, 'Default', 0, NULL, 0),
(297, 5, 14932, 'Telegram Premium Members + Views | 30-60 Days Premium', 'Telegram » Members [ Premium - S1 ]', 4427.6232, 4870.3855, NULL, 10, 20000, '14', 0, 1, 'All Members 30-60 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\nWarranty 30 days', 1, 'Default', 0, NULL, 0),
(298, 5, 14933, 'Telegram Premium Members + Views | 90-180 Days Premium', 'Telegram » Members [ Premium - S1 ]', 9257.7576, 10183.5334, NULL, 10, 20000, '8', 0, 1, 'All Members 90-180 Days Premium Plan + Views For 5 Posts\r\nInstant Start\r\n90-180 Days No Drop\r\nWarranty 90 days', 1, 'Default', 0, NULL, 0),
(299, 5, 14249, 'Telegram Views | Last 5 Posts | Speed 500K Per DAY | Start Instant 0-5 Minutes | 🔥⚡', 'Telegram » Post View [ Best Speed ]', 12.9676, 14.2644, NULL, 10, 10000000, '9', 0, 1, 'sometime takes 1 hour to start', 1, 'Default', 0, NULL, 0),
(300, 5, 14250, 'Telegram Views | Last 10 Posts | Speed 500K Per DAY | Start Instant 0-5 Minutes | 🔥⚡', 'Telegram » Post View [ Best Speed ]', 21.6126, 23.7739, NULL, 10, 10000000, '15', 0, 1, 'sometime takes 1 hour to start', 1, 'Default', 0, NULL, 0),
(301, 5, 13429, 'Telegram Reactions [👍] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '176', 0, 1, '', 1, 'Default', 0, NULL, 0),
(302, 5, 13431, 'Telegram Reactions [❤️] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '29', 0, 1, '', 1, 'Default', 0, NULL, 0),
(303, 5, 13432, 'Telegram Reactions [🔥] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '160', 0, 1, '', 1, 'Default', 0, NULL, 0),
(304, 5, 13434, 'Telegram Reactions [😱] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '153', 0, 1, '', 1, 'Default', 0, NULL, 0),
(305, 5, 13435, 'Telegram Reactions [⚡️] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '55', 0, 1, '', 1, 'Default', 0, NULL, 0),
(306, 5, 13436, 'Telegram Reactions [🎉] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '294', 0, 1, '', 1, 'Default', 0, NULL, 0),
(307, 5, 13437, 'Telegram Reactions [🤩] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '296', 0, 1, '', 1, 'Default', 0, NULL, 0),
(308, 5, 13438, 'Telegram Reactions [😁] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '685', 0, 1, '', 1, 'Default', 0, NULL, 0),
(309, 5, 13439, 'Telegram Reactions [🙏] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 61.5955, 67.7551, NULL, 50, 5000000, '81', 0, 1, '', 1, 'Default', 0, NULL, 0),
(310, 5, 13440, 'Telegram Reactions [👌🏻] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '84', 0, 1, '', 1, 'Default', 0, NULL, 0),
(311, 5, 13442, 'Telegram Reactions [😢] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '110', 0, 1, '', 1, 'Default', 0, NULL, 0),
(312, 5, 13443, 'Telegram Reactions [💩] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '17', 0, 1, '', 1, 'Default', 0, NULL, 0),
(313, 5, 13444, 'Telegram Reactions [🤮] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '80', 0, 1, '', 1, 'Default', 0, NULL, 0),
(314, 5, 13445, 'Telegram Reactions [🖕] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '216', 0, 1, '', 1, 'Default', 0, NULL, 0),
(315, 5, 13446, 'Telegram Reactions [😐] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '0', 0, 1, '', 1, 'Default', 0, NULL, 0),
(316, 5, 13447, 'Telegram Reactions [😭] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '1101', 0, 1, '', 1, 'Default', 0, NULL, 0),
(317, 5, 13448, 'Telegram Reactions [💯] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '416', 0, 1, '', 1, 'Default', 0, NULL, 0),
(318, 5, 13449, 'Telegram Reactions | Speed 10K / DAY | Negative 👎💩 🤮😢 😱', 'Telegram » Reactions [ Cheapest ]', 4.9277, 5.4205, NULL, 50, 10000, '30', 0, 1, '', 1, 'Default', 0, NULL, 0),
(319, 5, 13450, 'Telegram Reactions | Speed 10K / DAY | Positive 👍🤩🔥❤️🥰', 'Telegram » Reactions [ Cheapest ]', 4.9277, 5.4205, NULL, 50, 10000, '38', 0, 1, 'Link : Use Post Link !\r\n\r\nStart Time 0-1 [ sometimes 3 hours ]\r\n\r\nUltra Fast working old trusted service\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1, 'Default', 0, NULL, 0),
(320, 5, 13451, 'Telegram Reactions [👀] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '998', 0, 1, '', 1, 'Default', 0, NULL, 0),
(321, 5, 13452, 'Telegram Reactions [👻] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 13.5511, NULL, 50, 5000000, '89', 0, 1, '', 1, 'Default', 0, NULL, 0),
(322, 5, 13366, 'Telegram Permium Reaction | 🤬 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '52', 0, 1, 'Speed 50K+ / DAY', 1, 'Default', 0, NULL, 0),
(323, 5, 13367, 'Telegram Permium Reaction | 🙏 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '23', 0, 1, '', 1, 'Default', 0, NULL, 0),
(324, 5, 13368, 'Telegram Permium Reaction | 🤡 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '26', 0, 1, '', 1, 'Default', 0, NULL, 0),
(325, 5, 13369, 'Telegram Permium Reaction | 🤭 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '33', 0, 1, '', 1, 'Default', 0, NULL, 0),
(326, 5, 13370, 'Telegram Permium Reaction | 🕊 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '35', 0, 1, '', 1, 'Default', 0, NULL, 0),
(327, 5, 13374, 'Telegram Permium Reaction | 🤣 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 57.3314, NULL, 10, 1000000, '31', 0, 1, '', 1, 'Default', 0, NULL, 0),
(328, 5, 13041, 'Telegram Reactions + FREE Views | Speed 50K+ / DAY | Positive 👍🤩🎉🔥❤️🥰👏🏻 | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Telegram Reactions » [ Best Speed ]', 3.4580, 3.8038, NULL, 10, 30000, '28', 0, 1, '🔥 Top speed service\r\n🔥 Extra Reactions \r\n🔥Start time 0-5 mins', 1, 'Default', 0, NULL, 0),
(329, 5, 14403, 'Whatsapp Channel Post Reactions | 👍❤️😂😯😥🙏 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '16', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: Mix 👍❤️😂😲😥🙏\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(330, 5, 14404, 'Whatsapp Channel Post Reaction | 😂 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '5', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😂\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(331, 5, 14405, 'Whatsapp Channel Post Reaction | 👍 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '16', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 👍\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(332, 5, 14406, 'Whatsapp Channel Post Reaction | 🙏🏻 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '17', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🙏🏻\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(333, 5, 14407, 'Whatsapp Channel Post Reaction | ❤️ | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '8', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: ❤️\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(334, 5, 14409, 'Whatsapp Channel Post Reaction | 😥 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '6', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😥\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(335, 5, 14992, 'Whatsapp Channel Post Reaction | 😯 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '13', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😯\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(336, 5, 14995, 'Whatsapp Channel Post Reaction | 👏 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '9', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 👏\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(337, 5, 14996, 'Whatsapp Channel Post Reaction | 🔥 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '8', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🔥\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(338, 5, 14997, 'Whatsapp Channel Post Reaction | 🏆 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '4', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🏆\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(339, 5, 14998, 'Whatsapp Channel Post Reaction | 🎉 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 263.3400, NULL, 10, 50000, '14', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🎉\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1, 'Default', 0, NULL, 0),
(340, 5, 14855, 'Whatsapp Channel Followers / Members | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'WhatsApp » Members / Followers', 744.0751, 818.4826, NULL, 10, 50000, '20', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1, 'Default', 0, NULL, 0);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`, `service_type`, `dripfeed`, `last_synced_at`, `manually_deleted`) VALUES
(341, 5, 14949, 'Whatsapp Channel Followers / Members | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'WhatsApp » Members / Followers', 801.3118, 881.4430, NULL, 10, 50000, '33', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1, 'Default', 0, NULL, 0),
(342, 5, 14981, 'Whatsapp Channel Members / Followers | Real HQ Profiles | Speed 10K+ / DAY | No Refill | ⛔️ 🔥⚡️', 'WhatsApp » Members / Followers', 686.8386, 755.5225, NULL, 10, 50000, '31', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 10K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1, 'Default', 0, NULL, 0),
(343, 5, 14851, 'Snapchat Follower | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅️🔥⚡️', 'Snapchat » Followers [ Refill ]', 6484.9484, 7133.4432, NULL, 10, 10000, '788', 0, 0, '- Location: Worldwide 🌍\r\n- Quality: 100% Real HQ Profiles\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K+\r\n- Drop Rate: Non Drop\r\n- Refill Time: 30 Days ♻️\r\n- Example Link: Profile Link or Username', 1, 'Default', 0, NULL, 0),
(344, 5, 14723, 'Website Traffic From Facebook | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '37', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(345, 5, 14724, 'Website Traffic From LinkedIn | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '16', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(346, 5, 14725, 'Website Traffic From Twitter | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '27', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(347, 5, 14726, 'Website Traffic From Instagram | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '16', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(348, 5, 14727, 'Website Traffic From Amazon | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '35', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(349, 5, 14728, 'Website Traffic From Google | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '222', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(350, 5, 14729, 'Website Traffic From Twitch.TV | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '47', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(351, 5, 14730, 'Website Traffic From Pinterest | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '49', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(352, 5, 14731, 'Website Traffic From Blogger.com| WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '45', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(353, 5, 14732, 'Website Traffic From Fiverr.com | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 84.0495, NULL, 88, 88888888, '47', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1, 'Default', 1, NULL, 0),
(354, 5, 14461, '🇺🇸USA Traffic from Google | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '15', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(355, 5, 14462, '🇺🇸USA Traffic from Facebook | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '14', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(356, 5, 14463, '🇺🇸USA Traffic from Instagram | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '8', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(357, 5, 14464, '🇺🇸USA Traffic from Pinterest | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '2', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(358, 5, 14465, '🇺🇸USA Traffic from Twitter | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '20', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(359, 5, 14466, '🇺🇸USA Traffic from Youtube | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '14', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(360, 5, 14467, '🇺🇸USA Traffic from Blogspot/Blogger.com | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 84.0495, NULL, 88, 88888888, '39', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1, 'Default', 1, NULL, 0),
(361, 5, 13965, 'TikTok pak followers speed 10k fast no refill', '⭐️ tiktok pak followers | s2 | non stop', 994.9800, 1094.4780, NULL, 100, 50000, '784', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1, 'Default', 0, NULL, 0),
(362, 5, 14417, 'TikTok pak followers speed 5k no refill', '⭐️ tiktok pak followers | s2 | non stop', 740.6000, 814.6600, NULL, 100, 50000, '164', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1, 'Default', 0, NULL, 0),
(363, 5, 14741, 'TikTok pak followers speed 2k no refill', '⭐️ tiktok pak followers | s2 | non stop', 547.4000, 602.1400, NULL, 100, 50000, '875', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1, 'Default', 0, NULL, 0),
(364, 5, 13937, 'TikTok hq likes speed 50k+ no refill', '⭐️ tiktok likes hq | s2 | non stop', 16.0034, 17.6037, NULL, 10, 1000000, '31', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1, 'Default', 0, NULL, 0),
(365, 5, 14536, 'TikTok likes cheap speed 50k+ no refill', '⭐️ tiktok likes hq | s2 | non stop', 5.0400, 5.5440, NULL, 10, 1000000, '48', 0, 1, '', 1, 'Default', 0, NULL, 0),
(366, 5, 14691, 'TikTok followers lifetime', 'do not use', 163.2400, 179.5640, NULL, 100, 500000, '24', 0, 1, '', 0, 'Default', 0, NULL, 1),
(367, 5, 14692, 'TikTok followers no refill', 'do not use', 147.8400, 162.6240, NULL, 100, 500000, '18', 0, 1, '', 0, 'Default', 0, NULL, 1),
(368, 5, 14870, 'TikTok hq likes speed 20k no refill', 'do not use', 27.1768, 29.8945, NULL, 10, 5000, '24', 0, 1, '', 0, 'Default', 0, NULL, 1),
(369, 5, 14899, 'Ig followers hq - speed 5K+ lifetime', 'do not use', 313.6319, 344.9951, NULL, 100, 30000, '48', 0, 1, '', 0, 'Default', 0, NULL, 1),
(370, 5, 14941, 'TikTok Likes | No Notification | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🎗🔥⚡', 'do not use', 15.4280, 16.9708, NULL, 10, 1000000, '71', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n✅️ Refill: Yes Lifetime Refill  \r\n\r\n🔗 Link: Your video link / URL', 0, 'Default', 0, NULL, 1),
(371, 5, 15062, 'TikTok | 100% Views | 5% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 3.3774, 3.7151, NULL, 1000, 100000, '19', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 50 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 5% of views', 1, 'Default', 0, NULL, 0),
(372, 5, 15063, 'TikTok | 100% Views | 10% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 3.8942, 4.2837, NULL, 1000, 100000, '80', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 100 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 10% of views', 1, 'Default', 0, NULL, 0),
(373, 5, 15064, 'TikTok | 100% Views | 20% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 4.7986, 5.2785, NULL, 1000, 100000, '82', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 200 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 20% of views', 1, 'Default', 0, NULL, 0),
(374, 5, 15065, 'TikTok | 100% Views | 30% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 5.5639, 6.1203, NULL, 1000, 100000, '19', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 300 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 30% of views', 1, 'Default', 0, NULL, 0),
(375, 5, 15066, 'TikTok | 100% Views | 40% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 6.2199, 6.8419, NULL, 1000, 100000, '23', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 400 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 40% of views', 1, 'Default', 0, NULL, 0),
(376, 5, 15067, 'TikTok | 100% Views | 50% Likes | 🔥⚡️', 'TikTok » Views + Likes ( Real HQ )', 6.7883, 7.4672, NULL, 1000, 100000, '29', 0, 0, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 500 likes  \r\n\r\n⏱ Start: 0–5 Minutes\r\n⭐️ Quality: Real HQ Profiles\r\n⚡ Speed: 100K+ / DAY \r\n📍Guarantee: No Refill\r\n👁 Views: 100% of order  \r\n❤️ Likes: 50% of views', 1, 'Default', 0, NULL, 0),
(377, 5, 15068, 'TikTok | 100% Views | 5% Likes | 1% Comments |🔥', 'TikTok » All in ONE ( Cheapest )', 4.5671, 5.0238, NULL, 1000, 100000, '18', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 50 likes + 10 comments\r\n\r\n⏱ Start: 0–1 Hour Max\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 5% of views\r\n💬 Comments: 1% of views', 1, 'Default', 0, NULL, 0),
(378, 5, 15069, 'TikTok | 100% Views | 10% Likes | 2% Comments |🔥', 'TikTok » All in ONE ( Cheapest )', 4.8583, 5.3441, NULL, 1000, 100000, '12', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 100 likes + 20 comments\r\n\r\n⏱ Start: 0–1 Hour\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 10% of views\r\n💬 Comments: 2% of views', 1, 'Default', 0, NULL, 0),
(379, 5, 15070, 'TikTok | 100% Views | 20% Likes | 3% Comments |🔥', 'TikTok » All in ONE ( Cheapest )', 11.0804, 12.1885, NULL, 1000, 100000, '30', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 200 likes + 30 comments\r\n\r\n⏱ Start: 0–1 Hour\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 20% of views\r\n💬 Comments: 3% of views', 1, 'Default', 0, NULL, 0),
(380, 5, 15071, 'TikTok | 100% Views | 5% Likes | 1% Comments |🔥⚡️', 'TikTok » All in ONE ( Real Profiles )', 4.8000, 5.2800, NULL, 1000, 100000, '15', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 50 likes + 10 comments\r\n\r\n⏱ Start: 0–1 Hour\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 5% of views\r\n💬 Comments: 1% of views\r\n\r\n⭐ Likes Quality: Real HQ Profiles\r\n⭐ Comments Quality: Real HQ Profiles', 1, 'Default', 0, NULL, 0),
(381, 5, 15072, 'TikTok | 100% Views | 10% Likes | 2% Comments |🔥⚡️', 'TikTok » All in ONE ( Real Profiles )', 8.4406, 9.2847, NULL, 1000, 100000, '73', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 100 likes + 20 comments\r\n\r\n⏱ Start: 0–1 Hour\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 10% of views\r\n💬 Comments: 2% of views\r\n\r\n⭐ Likes Quality: Real HQ Profiles\r\n⭐ Comments Quality: Real HQ Profiles', 1, 'Default', 0, NULL, 0),
(382, 5, 15073, 'TikTok | 100% Views | 20% Likes | 3% Comments |🔥⚡️', 'TikTok » All in ONE ( Real Profiles )', 11.8843, 13.0728, NULL, 1000, 100000, '13', 0, 0, '🔗 Link: TikTok video link\r\n\r\n📍 Example: If you order 1,000\r\nYou get 1,000 views + 200 likes + 30 comments\r\n\r\n⏱ Start: 0–1 Hour\r\n⚡ Speed: 50K+ / DAY\r\n📍 Guarantee: No Refill\r\n👁 Views: 100% of order\r\n❤️ Likes: 20% of views\r\n💬 Comments: 3% of views\r\n\r\n⭐ Likes Quality: Real HQ Profiles\r\n⭐ Comments Quality: Real HQ Profiles', 1, 'Default', 0, NULL, 0),
(383, 5, 14310, 'TikTok Views | Drop – No | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Views [ Drop – 0% ]', 138.0954, 151.9050, NULL, 1000, 100000, '116', 0, 1, '⏱ Start: 0–1 hour max\r\n🚅 Speed: 5K+ / DAY  \r\n⭐️ Drop Ratio: 0% Confirmed\r\n✅ Guarantee: Yes (Lifetime)  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n✅️ Note: Currently non-drop, but if drops happen in future updates, refill/refund will be given.', 1, 'Default', 0, NULL, 0),
(384, 5, 15031, 'YouTube Subscribe | Non Drop | Speed 5K+ / DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Subscribe [ Non Drop ]', 6664.8960, 7331.3856, NULL, 100, 5000, '4493', 0, 1, '⏳ Start Time: 0 – 12 Hours\r\n🛡 Non-Drop Subscribers  \r\n⚡ Speed: 5000+ / DAY  \r\n✅️ Refill: Yes Lifetime Refill  \r\n\r\n🔗 Link: Channel link  \r\n\r\n⚠️ Channel must have 3+ videos (3+ mins each), otherwise order will not start.\r\n\r\n⚠️ If your channel doesn’t have at least two videos of 3–5 minutes each, no support of any kind will be provided.', 1, 'Default', 0, NULL, 0),
(385, 5, 15074, 'Instagram Views 5% Likes', 'Instagram » Views + Likes ( Real Profiles )', 2.8493, 3.1342, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(386, 5, 15075, 'Instagram Views 10% Likes', 'Instagram » Views + Likes ( Real Profiles )', 4.9641, 5.4605, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(387, 5, 15076, 'Instagram Views 20% Likes', 'Instagram » Views + Likes ( Real Profiles )', 8.6657, 9.5323, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(388, 5, 15077, 'Instagram Views 30% Likes', 'Instagram » Views + Likes ( Real Profiles )', 11.7975, 12.9773, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(389, 5, 15078, 'Instagram Views 40% Likes', 'Instagram » Views + Likes ( Real Profiles )', 14.4822, 15.9304, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0),
(390, 5, 15079, 'Instagram Views 50% Likes', 'Instagram » Views + Likes ( Real Profiles )', 16.8087, 18.4895, NULL, 1000, 100000, '0', 0, 0, '', 1, 'Default', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `sender` enum('user','admin') NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `fee` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `sender_id`, `receiver_id`, `amount`, `fee`, `created_at`) VALUES
(1, 3, 6, 100.0000, 0.0000, '2025-11-20 12:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `video_link` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `title`, `video_link`, `description`, `created_at`) VALUES
(1, 'How to use israrliaqat.shop', 'https://youtu.be/_3mihwLrnHk?si=RAWmBtujNQ9YX5JG', 'Watch video to lean how to use israrliaqat.shop', '2025-11-25 17:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `last_spin_time` datetime DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `status` enum('active','banned') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `google_id`, `balance`, `last_spin_time`, `api_key`, `is_admin`, `created_at`, `name`, `phone`, `password`, `password_reset_token`, `reset_token_expires_at`, `status`) VALUES
(1, 'admin', '$2y$10$1NhdsLS6gNSeY7Cu1EB/k.8C4cXUZALn/w9jBB8JcJQnOExkk/bAq', NULL, 1.00, NULL, NULL, 1, '2025-11-09 16:21:18', NULL, NULL, NULL, NULL, NULL, 'active'),
(2, 'israrsahib6@gmail.com', '$2y$10$aFc0eWL44tNlgcX7uAzCOu9gOk2w8GuTXSDrLgYljzz/jci8hnn9e', NULL, 1.00, NULL, '31ca91bd2594ec0385dd105fafb26ef0', 1, '2025-11-09 16:45:53', NULL, NULL, NULL, NULL, NULL, 'active'),
(3, 'israrliaqat48@gmail.com', '$2y$10$Hchc6dh3xnLeiyImGjcWMuqUodlFuA58Mhe3yhA4DAFgQh5/XK2Ru', NULL, 2435.71, '2025-11-20 18:32:34', 'c53e30d1948d682b67bbd0b85e09899b', 0, '2025-11-09 16:50:59', NULL, NULL, NULL, NULL, NULL, 'active'),
(4, 'amirnazir2828@gmail.com', '$2y$10$n2Uy.t8H9NIdpbUQVUwGMOBX12xvezRuga9JNevcnoJoShM3nGNei', '101527224131157562261', 0.00, NULL, NULL, 0, '2025-11-10 17:34:55', 'Amir Nazir', NULL, NULL, NULL, NULL, 'active'),
(5, 'kibadiw668@fermiro.com', '$2y$10$dJtrMilfFmPKBk2c88rwC.sUFtBfLGaPjWljFtGcp8pH2DzyhwHk6', NULL, 0.00, NULL, NULL, 0, '2025-11-11 14:45:40', NULL, NULL, NULL, NULL, NULL, 'active'),
(6, 'israrliaqat2005@gmail.com', '$2y$10$g6j/J1kc/vapM9CzQqzUy.9O4oXLYNaP8PnuHjYIWc9JDP.4X8Bdm', NULL, 100.00, NULL, NULL, 0, '2025-11-16 19:47:54', NULL, NULL, NULL, NULL, NULL, 'active'),
(7, 'junaidahmed.exe@gmail.com', '$2y$10$BYQ/SrsdH5A86ZJEVMQ2ge70Jq5r4yVVbbOnlxnr2BdzHcktXEVlm', NULL, 1.00, '2025-11-18 18:29:07', NULL, 0, '2025-11-18 13:27:55', NULL, NULL, NULL, NULL, NULL, 'active'),
(8, 'support@smmpro.pk', '$2y$10$GQiNjp8Z6WbWBX6sV6exgO8xlXK6KW48l6Sec6nqdnDRzwwg07waS', NULL, 0.00, NULL, NULL, 0, '2025-11-23 17:21:20', NULL, NULL, NULL, NULL, NULL, 'active'),
(9, 'israrliaqat6@gmail.com', '$2y$10$WgyXMlBhmeJQwfcTKb/Vt.kqR8andCwNvQE8HNp/p9Jv54cnQm47W', '100333532105945593049', 0.00, NULL, NULL, 0, '2025-11-24 21:41:05', 'Israr Liaqat', NULL, NULL, NULL, NULL, 'active'),
(10, 'mansha3101@gmail.com', '$2y$10$3NmV6z8cEKv5dSpBTNI7AuzLjMHzn1OJ/LMbELf7wtJtUcrK3.CKm', '100041875779313128683', 0.00, NULL, NULL, 0, '2025-11-25 15:59:03', 'Mansha', NULL, NULL, NULL, NULL, 'active'),
(11, 'israrliaqat867@gmail.com', '$2y$10$MsAQ0RXiK3uC2Nyl9jR.DOpp/tLqlxf1V/N.E1E9FCJs9XwkummPe', '108984116411879773692', 0.00, NULL, NULL, 0, '2025-11-28 12:23:42', 'Israr Liaqat', NULL, NULL, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorite_services`
--

CREATE TABLE `user_favorite_services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_testimonials`
--

CREATE TABLE `user_testimonials` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_link` varchar(255) NOT NULL,
  `platform` varchar(50) DEFAULT 'TikTok',
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reward_amount` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_testimonials`
--

INSERT INTO `user_testimonials` (`id`, `user_id`, `video_link`, `platform`, `status`, `reward_amount`, `created_at`) VALUES
(1, 0, 'https://youtu.be/t6nHfdKgshg?si=Az-szVUZh79jcMTh', 'Instagram', 'pending', 0.00, '2025-11-25 16:20:10'),
(2, 3, 'https://youtu.be/t6nHfdKgshg?si=Az-szVUZh79jcMT', 'TikTok', 'rejected', 0.00, '2025-11-25 16:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_ledger`
--

CREATE TABLE `wallet_ledger` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `ref_type` varchar(50) NOT NULL DEFAULT 'admin_adjust',
  `ref_id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_ledger`
--

INSERT INTO `wallet_ledger` (`id`, `user_id`, `type`, `amount`, `ref_type`, `ref_id`, `note`, `created_at`) VALUES
(1, 3, 'credit', 1000.00, 'payment', 1, 'Simulated Auto-Deposit', '2025-11-09 17:02:48'),
(2, 3, 'credit', 1000.00, 'payment', 2, 'Simulated Auto-Deposit', '2025-11-09 17:02:53'),
(3, 3, 'credit', 5000.00, 'payment', 3, 'Manual deposit approved: #8888', '2025-11-09 18:23:22'),
(4, 3, 'debit', 700.00, 'order', 11, 'Order #SH-441781EE - Netflix Premium (1M)', '2025-11-09 18:23:59'),
(5, 3, 'credit', 1.00, 'payment', 1, 'NayaPay Claim: 6911feeb27675b5dd1bb6e92', '2025-11-10 17:20:27'),
(6, 3, 'credit', 1.00, 'payment', 2, 'NayaPay Claim: 691220c65730075f55080ab4', '2025-11-10 17:31:18'),
(7, 1, 'credit', 1.00, 'payment', 3, 'NayaPay Claim: 691236205730075f550d0eca', '2025-11-10 19:25:59'),
(8, 3, 'debit', 1500.00, 'order', 12, 'Order #SH-7D9F55BF - Canva Pro (Private - 6M)', '2025-11-11 13:27:58'),
(9, 3, 'debit', 1500.00, 'order', 13, 'Order #SH-1392B505 - Canva Pro (Private - 6M)', '2025-11-11 13:28:06'),
(10, 3, 'debit', 1500.00, 'order', 14, 'Order #SH-C473BB9C - Canva Pro (Private - 6M)', '2025-11-11 13:28:13'),
(11, 3, 'debit', 1500.00, 'order', 15, 'Order #SH-8D1F39A6 - Canva Pro (Private - 6M)', '2025-11-11 13:49:15'),
(12, 3, 'credit', 676.67, 'admin_adjust', 2, 'Refund for cancelled Order #SH-441781EE (Pro-rata)', '2025-11-11 15:54:28'),
(13, 3, 'credit', 5000.00, 'payment', 7, 'Manual deposit approved: #727272737', '2025-11-11 15:55:49'),
(14, 3, 'debit', 1500.00, 'order', 16, 'Order #SH-971B21B2 - Canva Pro (Private - 6M)', '2025-11-11 15:56:43'),
(15, 3, 'debit', 3500.00, 'order', 17, 'Order #SH-BDDD9A98 - Canva Pro (Semi-Private - 12M)', '2025-11-11 16:21:21'),
(16, 3, 'credit', 3500.00, 'admin_adjust', 2, 'Refund for cancelled Order #SH-BDDD9A98 (Pro-rata)', '2025-11-11 16:21:58'),
(17, 3, 'debit', 62.73, 'order', 1, 'SMM Order #1 (Ig followers hq - speed 500+ lifetime)', '2025-11-12 19:23:11'),
(18, 3, 'credit', 62.73, 'admin_adjust', 1, 'SMM Order Failed: You are out of balance. Please recharge your balance to send order with quantity: 100 for service id: 14899', '2025-11-12 19:24:06'),
(19, 3, 'credit', 5.00, 'admin_adjust', 1, 'Daily Spin & Win Bonus (PKR 5.00)', '2025-11-13 13:25:15'),
(20, 3, 'debit', 4.91, 'order', 2, 'SMM Order #2 (Instagram Comments | Custom | Real Profiles | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥)', '2025-11-13 16:17:57'),
(21, 3, 'credit', 4.91, 'admin_adjust', 2, 'SMM Order Failed: You are out of balance. Please recharge your balance to send order with Quantity: 0 for service id: 14659 comments: ', '2025-11-13 16:18:07'),
(22, 3, 'credit', 1.00, 'admin_adjust', 1, 'Daily Spin & Win Bonus (PKR 1.00)', '2025-11-14 18:28:54'),
(23, 3, 'debit', 0.09, 'order', 1, 'SMM Order #1 (Canva Plus | Private | 30+ Days | 1 Device |)', '2025-11-14 20:55:53'),
(24, 3, 'credit', 0.09, 'admin_adjust', 1, 'SMM Order Failed: You are out of balance. Please recharge your balance to send order with quantity: 1 for service id: 14845', '2025-11-14 20:56:02'),
(25, 3, 'debit', 0.67, 'order', 2, 'SMM Order #2 (Instagram Likes | Fake Bots | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-15 06:56:35'),
(26, 3, 'debit', 5.85, 'order', 3, 'SMM Order #3 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-15 06:59:35'),
(27, 3, 'debit', 5.85, 'order', 4, 'SMM Order #4 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-15 15:30:42'),
(28, 3, 'debit', 3.68, 'order', 5, 'SMM Order #5 (Instagram Comments | Custom | Real Profiles | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥)', '2025-11-15 17:20:08'),
(29, 3, 'debit', 5.85, 'order', 6, 'SMM Order #6 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-16 09:52:57'),
(30, 3, 'debit', 5.85, 'order', 7, 'SMM Order #7 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-16 09:56:49'),
(31, 3, 'debit', 5.85, 'order', 8, 'SMM Order #8 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-16 19:02:21'),
(32, 2, 'credit', 1.00, 'payment', 5, 'NayaPay Claim: 691c2c28180b4d7a0b8e0421', '2025-11-18 10:11:42'),
(33, 7, 'credit', 1.00, 'admin_adjust', 1, 'Daily Spin & Win Bonus (PKR 1.00)', '2025-11-18 13:29:07'),
(34, 3, 'debit', 5.85, 'order', 9, 'SMM Order #9 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-19 20:58:43'),
(35, 3, 'credit', 10.00, 'admin_adjust', 1, 'Daily Spin & Win Bonus (PKR 10.00)', '2025-11-20 13:32:34'),
(36, 3, 'debit', 1500.00, 'order', 18, 'Order #SH-FFFCF805 - Canva Pro (Private - 6M)', '2025-11-21 05:38:58'),
(37, 3, 'debit', 1500.00, 'order', 19, 'Order #SH-04CC4CDE - Canva Pro (Private - 6M)', '2025-11-21 05:52:17'),
(38, 3, 'debit', 350.00, 'order', 20, 'Order #SH-6DEA83D5 - Canva Pro (Shared - 1M)', '2025-11-21 06:09:40'),
(39, 3, 'debit', 4.29, 'order', 10, 'SMM Order #10 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-22 11:22:17'),
(40, 3, 'debit', 4.29, 'order', 11, 'SMM Order #11 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-22 13:12:15'),
(41, 3, 'debit', 1.82, 'order', 12, 'SMM Order #12 (Facebook Post Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️)', '2025-11-22 13:35:09'),
(42, 3, 'credit', 1.82, '', 12, 'Refund for Cancelled Order #12', '2025-11-22 13:50:03'),
(43, 3, 'debit', 15.36, 'order', 13, 'SMM Order #13 (Instagram Followers | Real Profiles | Speed 5K+ / DAY | No Refill | ⛔️)', '2025-11-22 16:05:00'),
(44, 3, 'debit', 2.07, 'order', 14, 'SMM Order #14 (Instagram Views | Non Drop | Speed 5M+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡)', '2025-11-22 16:08:16'),
(45, 3, 'debit', 4.18, 'order', 15, 'SMM Order #15 (Instagram Reel Views | Speed 1M+ Per DAY | Start Time 0-5 Minutes | 🔥🔥⚡⚡)', '2025-11-22 16:19:47'),
(46, 3, 'credit', 15.36, '', 13, 'Auto Refund for cancelled Order #13 (Remaining: 100)', '2025-11-22 20:05:03'),
(47, 3, 'debit', 500.00, 'order', 21, 'Digital Download Purchase', '2025-11-24 11:07:51'),
(48, 3, 'credit', 303.33, 'admin_adjust', 2, 'Refund for cancelled Order #SH-6DEA83D5 (Pro-rata)', '2025-11-24 15:43:49'),
(49, 3, 'debit', 500.00, 'order', 22, 'Digital Download Purchase', '2025-11-24 15:49:23'),
(50, 3, 'credit', 1500.00, 'admin_adjust', 2, 'Refund for cancelled Order #SH-FFFCF805 (Pro-rata)', '2025-11-24 16:06:31'),
(51, 3, 'credit', 1500.00, 'admin_adjust', 2, 'Refund for cancelled Order #SH-04CC4CDE (Pro-rata)', '2025-11-24 16:06:34'),
(52, 3, 'debit', 500.00, 'order', 23, 'Digital Download Purchase', '2025-11-24 16:07:02'),
(53, 3, 'debit', 350.00, 'order', 24, 'Order #SH-C7006CCB - Canva Pro (Shared - 1M)', '2025-11-25 07:43:35'),
(54, 3, 'credit', 5000.00, 'reward', 2, 'Video Reward Approved', '2025-11-25 16:45:13'),
(55, 3, 'debit', 5000.00, 'penalty', 2, 'Penalty: Video Deleted', '2025-11-25 16:46:42'),
(56, 3, 'debit', 8.01, 'order', 16, 'SMM Order #16 (🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡)', '2025-11-25 18:25:11'),
(57, 3, 'debit', 1.88, 'order', 17, 'SMM Order #17 (Instagram Followers | Real Profiles | Speed 5K+ / DAY | No Refill | ⛔️)', '2025-11-25 18:39:43'),
(58, 3, 'credit', 1.88, 'refund', 17, 'Auto Refund for cancelled Order #17 (Remaining: 10)', '2025-11-25 19:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `wheel_prizes`
--

CREATE TABLE `wheel_prizes` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL COMMENT 'Inaam ka naam (e.g., 50 PKR)',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Wallet mein kitne paise add honge',
  `probability` int(11) NOT NULL DEFAULT 10 COMMENT 'Jeetne ka chance (total 100 hona zaroori nahi)',
  `color` varchar(20) DEFAULT '#FF0000',
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wheel_prizes`
--

INSERT INTO `wheel_prizes` (`id`, `label`, `amount`, `probability`, `color`, `is_active`) VALUES
(1, 'PKR 1.00', 1.00, 50, '#FFC107', 1),
(2, 'PKR 5.00', 5.00, 30, '#0D6EFD', 1),
(3, 'PKR 10.00', 10.00, 15, '#198754', 1),
(4, 'Try Again', 0.00, 5, '#6C757D', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wheel_spins_log`
--

CREATE TABLE `wheel_spins_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `amount_won` decimal(10,2) NOT NULL,
  `spin_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wheel_spins_log`
--

INSERT INTO `wheel_spins_log` (`id`, `user_id`, `prize_id`, `amount_won`, `spin_time`) VALUES
(1, 3, 2, 5.00, '2025-11-13 13:25:15'),
(2, 3, 1, 1.00, '2025-11-14 18:28:54'),
(3, 7, 1, 1.00, '2025-11-18 13:29:07'),
(4, 3, 3, 10.00, '2025-11-20 13:32:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `broadcasts`
--
ALTER TABLE `broadcasts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_payments`
--
ALTER TABLE `email_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `txn_id` (`txn_id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `service_updates`
--
ALTER TABLE `service_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `smm_categories`
--
ALTER TABLE `smm_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `smm_orders`
--
ALTER TABLE `smm_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `smm_providers`
--
ALTER TABLE `smm_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smm_services`
--
ALTER TABLE `smm_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `provider_service` (`provider_id`,`service_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `api_key_unique` (`api_key`);

--
-- Indexes for table `user_favorite_services`
--
ALTER TABLE `user_favorite_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_service_favorite` (`user_id`,`service_id`),
  ADD KEY `fk_fav_service` (`service_id`);

--
-- Indexes for table `user_testimonials`
--
ALTER TABLE `user_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_ledger`
--
ALTER TABLE `wallet_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wheel_prizes`
--
ALTER TABLE `wheel_prizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wheel_spins_log`
--
ALTER TABLE `wheel_spins_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `prize_id` (`prize_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broadcasts`
--
ALTER TABLE `broadcasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_payments`
--
ALTER TABLE `email_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_updates`
--
ALTER TABLE `service_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2260;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `smm_categories`
--
ALTER TABLE `smm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1889;

--
-- AUTO_INCREMENT for table `smm_orders`
--
ALTER TABLE `smm_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `smm_providers`
--
ALTER TABLE `smm_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `smm_services`
--
ALTER TABLE `smm_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_favorite_services`
--
ALTER TABLE `user_favorite_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_testimonials`
--
ALTER TABLE `user_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_ledger`
--
ALTER TABLE `wallet_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `wheel_prizes`
--
ALTER TABLE `wheel_prizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wheel_spins_log`
--
ALTER TABLE `wheel_spins_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smm_orders`
--
ALTER TABLE `smm_orders`
  ADD CONSTRAINT `fk_smm_service_id` FOREIGN KEY (`service_id`) REFERENCES `smm_services` (`id`),
  ADD CONSTRAINT `fk_smm_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smm_services`
--
ALTER TABLE `smm_services`
  ADD CONSTRAINT `fk_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `smm_providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_favorite_services`
--
ALTER TABLE `user_favorite_services`
  ADD CONSTRAINT `fk_fav_service` FOREIGN KEY (`service_id`) REFERENCES `smm_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_ledger`
--
ALTER TABLE `wallet_ledger`
  ADD CONSTRAINT `wallet_ledger_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wheel_spins_log`
--
ALTER TABLE `wheel_spins_log`
  ADD CONSTRAINT `fk_spin_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
