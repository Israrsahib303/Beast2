-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2025 at 02:11 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.11

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
(4, '31763189374194309763570154', 700.00, 'pending', NULL, NULL, '2025-11-15 06:51:02', '------=_Part_4639621_219100071.1763189379023\r\nContent-Type: multipart/alternative; \r\n	boundary=\"----=_Part_4639622_1847651700.1763189379023\"\r\n\r\n------=_Part_4639622_1847651700.1763189379023\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nThere is an incoming fund transfer of Rs. 700 from Raast-{accountNumber} to your NayaPay wallet.\r\n------=_Part_4639622_1847651700.1763189379023\r\nContent-Type: text/html;charset=UTF-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nNayaPay Email@font-face{font-family:\"DMSansMedium\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Medium.ttf\") format(\"truetype\");font-weight:500;font-style:normal}@font-face{font-family:\"DMSansBold\";src:url(\"https://nayapay.com/fonts/DM_Sans/static/DMSans-Bold.ttf\") format(\"truetype\");font-weight:bold;font-style:normal}@media(min-width:600px){.logo{width:148px !important}.title-text{font-size:28px !important}.general-text{font-size:18px !important;line-height:24px !important}.general-text-2{font-size:16px !important;line-height:24px !important}.general-text-3{font-size:14px !important;line-height:normal !important}.summary-title{font-size:15px !important;line-height:normal !important}.summary-text{font-size:14px !important;line-height:normal !important}.summary-amount{font-size:18px !important;line-height:normal !important}.footer-text{font-size:10px !important}.heading-emoji{font-size:20px !important}}:root{color-scheme:light dark;supported-color-schemes:light dark}.body-bg-color{background-color:#fff !important}.trans-msg-bg-color{background-color:#f9f8f8 !important}.footer-bg-color{background-color:#fafafa !important}.footer,.footer td,.footer p,.footer span{color:#757575 !important;background-color:#fafafa !important}.footer-text a{color:#0666eb !important}@media(prefers-color-scheme:dark){*{color:#fff !important}.body-bg-color{background-color:#1f2124 !important}.trans-msg-bg-color{background-color:#757575 !important}.footer-bg-color{background-color:#1f1f1f !important}.footer,.footer td,.footer p,.footer span{background-color:#1f1f1f !important;color:#757575 !important}.footer-text a{color:#0666eb !important}}@media(prefers-color-scheme:light){.body-bg-color{background-color:#fff !important}.trans-msg-bg-color{background-color:#f9f8f8 !important}.footer-bg-color{background-color:#fafafa !important}.footer,.footer td,.footer p,.footer span{color:#757575 !important;background-color:#fafafa !important}.footer-text a{color:##0666eb !important}} Cha-Ching!  Liaquat Ali  JazzCash - Mobilink Microfinance Bank-8432  15 Nov 2025, 11:49 AM  Rs. 700  AMOUNT DETAILS  Amount Received  Rs. 700  Service Fee (Incl. Tax)  Rs. 0  Total Amount  Rs. 700  TRANSACTION DETAILS  Transaction ID  31763189374194309763570154  ADDITIONAL INFORMATION  Source Acc. Title  Liaquat Ali  Source Bank  JazzCash - Mobilink Microfinance Bank  Raast ID / IBAN  ●●●●8432  Destination Acc. Title  Liaqat Ali  Channel  Raast  View your transactionsDo not reply to this email. Responses to this email are not monitored. NayaPay (Private) Limited is authorised and regulated by the State Bank of Pakistan as an Electronic Money Institution.(021) 111-222-729 | www.nayapay.com | support@nayapay.comNayaPay, its employees or agents will never ask you for your password, MPIN, OTP or debit card PIN, via call, email, SMS, web links or social media. For security purposes, please do not share this sensitive information with anyone.\r\n------=_Part_4639622_1847651700.1763189379023--\r\n\r\n------=_Part_4639621_219100071.1763189379023--\r\n');

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
(17, 'SH-BDDD9A98', 3, 4, 12, 291.67, 3500.00, 'cancelled', '2025-11-11 16:21:50', '2025-11-11 16:21:58', NULL, NULL, '2025-11-11 16:21:21');

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
(8, 3, 'JazzCash', 500.00, '8888', 'ss_691361b91474c5.13119760.jpg', 'pending', NULL, NULL, '2025-11-11 16:18:01', NULL);

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
(2, 'Easypaisa', 'easypaisa.png', 'Jane Smith', '03011234567', 'Note: Min deposit PKR 100.', 0.00, 0.00, 1, 0, NULL, NULL, NULL, '2025-11-09 16:21:18'),
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `icon`, `description`, `proof_link`, `category_id`, `is_active`, `created_at`) VALUES
(1, 'Net-Flix Ultra 4K Screens', 'net-flix-ultra-4k-screens', 'net-flix-ultra-4k-screens-69126007908d3.jpeg', 'Ultra 4K Screens || Shared + Private|| No-Logout issues\r\nNo Cr@ck X\r\nOfficial Purchase\r\nReplacement Warranty\r\nInstant delivery\r\nNet_Flix', NULL, 1, 1, '2025-11-09 16:21:18'),
(2, 'ChatGPT Plus', 'chatgpt-plus', 'chatgpt-plus-6910e12098d07.png', 'Gmail ID &amp;amp; password directly on website order history page 💬📥\r\n\r\n⌛️ Complete Time: 0–1 Hrs (max 3 Hrs)\r\n\r\n✅ Send Order Number on Live Chat for Quick Delivery\r\n\r\n💎 Benefits: 👑 Unlock All Models &amp;amp; Features – Includes GPT-4, GPT-4 Turbo &amp;amp; GPT-5 (Agent Mode Supported)\r\n\r\n📜 Rule: This account can be used on up to 5 devices only. Adding more than 5 devices will result in account suspension and no replacement will be provided.', NULL, 2, 1, '2025-11-09 16:21:18'),
(3, 'Veo 3 ( FLOW) Unlimited videos', 'veo-3-flow-unlimited-videos', 'veo-3-flow-unlimited-videos-69125b08b36a7.jpeg', 'What&amp;#039;s Included in the plan?*:\r\n- ❄️ VEO 3.1 (45000) Credits)\r\n- ❄️ Veo 3.1 Fast Mode UNLIMITED\r\n- ❄️ 30TB Storage\r\n- ❄️ YouTube Premium \r\n- ❄️ 30 Days Warranty\r\n- ❄️ Gemini Advance\r\n- ❄️ Nano Bnana 🍌', NULL, 2, 1, '2025-11-09 16:21:18'),
(4, 'Canva Pro', 'canva-pro', 'canva-pro-69125f3ff04b5.jpeg', '30+ days replacement Gurantee\r\n\r\nSend order number on live chat for quick delivery\r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', NULL, 2, 1, '2025-11-09 16:21:18'),
(5, 'Capcut pro - Private Account', 'capcut-pro---private-account', 'capcut-pro---private-account-69125c036894c.png', '🔸 Your Personal Email Login\r\n🔸 Use on 2–3 Devices\r\n🔸 No Login or Logout Issues\r\n🔸 Faster &amp;amp; Secure Performance', NULL, 2, 1, '2025-11-09 16:21:18'),
(6, 'OPPLEX IPTV - IPTV PREMIUM ULTRA 4K-UHD PACKAGES', 'opplex-iptv---iptv-premium-ultra-4k-uhd-packages', 'opplex-iptv---iptv-premium-ultra-4k-uhd-packages-69125da85090d.jpeg', '✅ Good Server Speed\r\n✅ UNLIMITED LIVE TV CHANNELS\r\n✅ UNLIMITED MOVIES\r\n✅ UNLIMITED SEASONS\r\n✅ Login on 1 Device Only', NULL, 1, 1, '2025-11-09 16:21:18');

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
(98, 'site_name', 'Israr liaqat'),
(99, 'site_logo', 'logo.png'),
(100, 'currency_symbol', 'PKR'),
(101, 'whatsapp_number', '+923097856447'),
(102, 'theme_primary', '#6700FF'),
(103, 'theme_hover', '#3507E9'),
(104, 'bg_color', '#1D1D1D'),
(105, 'card_color', '#000'),
(106, 'text_color', '#fff'),
(107, 'text_muted_color', '#fff'),
(109, 'daily_spin_enabled', '1'),
(110, 'daily_spin_cooldown_hours', '24');

-- --------------------------------------------------------

--
-- Table structure for table `smm_categories`
--

CREATE TABLE `smm_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon_filename` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_categories`
--

INSERT INTO `smm_categories` (`id`, `name`, `icon_filename`, `sort_order`) VALUES
(1, 'TikTok', 'TikTok.png', 0),
(4, 'YouTube', 'Youtube.png', 0),
(5, 'Instagram', 'Instagram.png', 0),
(6, 'Facebook', 'Facebook.png', 0),
(7, 'X Twitter', 'X.png', 0),
(8, 'Spotify', 'Spotify.png', 0),
(9, 'Telegram', 'Telegram.png', 0),
(10, 'Telegram Reactions', 'Telegram.png', 0),
(11, 'WhatsApp', 'Whatsapp.png', 0),
(12, 'Snapchat', 'Snapchat.png', 0),
(14, '⭐️ tiktok pak followers | s2 | non stop', 'TikTok.png', 0),
(15, '⭐️ tiktok likes hq | s2 | non stop', 'TikTok.png', 0);

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
(1, 3, 9, 'Https://youtu.be/t6nHfdKgshg?si=Az-szVUZh79jcMTh', 1, 0.0921, NULL, 0, 0, 'completed', NULL, NULL, '2025-11-14 20:55:53', '2025-11-15 20:03:04'),
(2, 3, 156, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 10, 0.6653, NULL, 0, 0, 'completed', 3076540, NULL, '2025-11-15 06:56:35', '2025-11-15 20:02:44'),
(3, 3, 157, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 50, 5.8462, NULL, 1, 0, 'completed', 3076555, '2025-11-16 13:52:18', '2025-11-15 06:59:35', '2025-11-16 08:52:18'),
(4, 3, 157, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 50, 5.8462, NULL, 64, 0, 'completed', 3079749, NULL, '2025-11-15 15:30:42', '2025-11-15 20:02:24'),
(5, 3, 161, 'https://www.instagram.com/p/DQj5L77DX9W/?igsh=MXFsNGhjbnFkaHV1cA==', 10, 3.6836, 'Superb\r\nNice pose\r\nKya baat hai\r\nKya baat hai\r\nNice pic bhai\r\nAala!\r\nBoht khoob\r\nPyari post\r\nMashaAllah\r\nAala!', 0, 0, 'completed', 3080519, NULL, '2025-11-15 17:20:08', '2025-11-15 19:50:03');

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
(1, 'Demo Provider', 'https://dilsmmpanel.com/api/v2', '5509c1e2d10e85a4085fd46cda7b44f19c2121b4', 50, 1);

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
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm_services`
--

INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`) VALUES
(1, 1, 13893, 'TikTok Likes | Speed 100+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 0.4827, 0.7241, NULL, 10, 100, '22', 0, 1, '📈 Maximum order: 100 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 100+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(2, 1, 13912, 'TikTok Likes | Speed 50K+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 5.3508, 8.0262, NULL, 10, 5000000, '27', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n🚅 Speed: 50K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(3, 1, 13938, 'TikTok Likes | Speed 1000+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 1.9312, 2.8967, NULL, 10, 1000, '59', 0, 1, '📈 Maximum order: 1000 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1000+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(4, 1, 14588, 'TikTok Likes | Speed 500+ / DAY | No Refill | ⛔🔥', 'TikTok » Likes [ Cheapest ]', 0.9654, 1.4482, NULL, 10, 500, '25', 0, 1, '📈 Maximum order: 500 Likes\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 500+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(5, 1, 15039, 'TikTok Likes | Speed 100K+ / DAY | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Cheapest ]', 9.1725, 13.7588, NULL, 10, 1000000, '51', 0, 1, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1),
(6, 1, 15046, 'TikTok Likes | Speed 50K+ / DAY | No Refill | ⛔🔥⚡️', 'TikTok » Likes [ Cheapest ]', 6.3756, 9.5634, NULL, 10, 1000000, '106', 0, 1, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1),
(7, 1, 15047, 'TikTok Likes | Speed 100K+ / DAY | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Cheapest ]', 8.8712, 13.3069, NULL, 100, 1000000, '414', 0, 0, '⏱ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL', 1),
(8, 1, 13701, 'Canva Plus | Private | 1+ Year | 1 Device |', 'Canva Plus » Private', 275.1725, 412.7588, NULL, 1, 1, '192', 0, 0, 'Enter Your Gmail in link Section\r\n\r\nYou will get Invitation mail in Gmail inbox 📥\r\n\r\n1+ year replacement Gurantee \r\n\r\nSend order number on live chat for quick delivery \r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', 1),
(9, 1, 14845, 'Canva Plus | Private | 30+ Days | 1 Device |', 'Canva Plus » Private', 91.7241, 137.5861, NULL, 1, 1, '125', 0, 0, 'Enter Your Gmail in link Section\r\n\r\nYou will get Invitation mail in Gmail inbox 📥\r\n\r\n30+ days replacement Gurantee \r\n\r\nSend order number on live chat for quick delivery \r\n\r\nBENEFITS:\r\n👑 Unlock all Tools and Features\r\n👑 Full Warranty\r\n👑 Background Remover\r\n👑 Unlock all Templates and Elements\r\n👑 No Watermark\r\n\r\n𝐑𝐮𝐥𝐞: This account is only for a single use do not share with anyone otherwise we wil suspend your subscription and no refund.\r\n⚠️ Your Gmail should be logged in on your mobile.', 1),
(10, 1, 14449, 'Chatgpt Plus | Private | 5 Users | 30+ Days | 🔥', 'Chatgpt Plus » Private', 1931.0346, 2896.5518, NULL, 1, 1, '20', 0, 1, '📌 Enter your WhatsApp number in the link section – you will receive your Gmail ID &amp;amp; password directly on WhatsApp 💬📥\r\n\r\n⌛️ Complete Time: 0–1 Hrs (max 3 Hrs)\r\n\r\n✅ Send Order Number on Live Chat for Quick Delivery\r\n\r\n💎 Benefits: 👑 Unlock All Models &amp;amp; Features – Includes GPT-4, GPT-4 Turbo &amp;amp; GPT-5 (Agent Mode Supported)\r\n\r\n📜 Rule: This account can be used on up to 5 devices only. Adding more than 5 devices will result in account suspension and no replacement will be provided.', 1),
(11, 1, 14610, 'Chatgpt Go | Private | 1 User | 12 Months | 🔥', 'Chatgpt Plus » Private', 1931.0346, 2896.5518, NULL, 1, 1, '117', 0, 1, 'Enter WhatsApp Number in Link Section, we Will Share Login Details (Gmail, Password)\r\n\r\nChatGPT Go plan includes:\r\n\r\n⭐ Go deep on harder questions\r\n💬 Chat longer and upload more content\r\n🖼️ Make realistic images for your projects\r\n🧠 Store more context for smarter replies\r\n📅 Get help with planning and tasks\r\n⚙️ Explore projects, tasks, and custom GPTs', 1),
(12, 1, 14897, 'Chatgpt Plus | Private | 1 User | 30+ Days | 🔥', 'Chatgpt Plus » Private', 482.7586, 724.1380, NULL, 1, 1, '7', 0, 0, '📌 Enter your Gmail in the link section – you will receive an invitation mail directly in your Gmail inbox 📥  \r\n\r\n⌛️ Complete Time: 0–1 Hrs (max 3 Hrs)\r\n\r\n✅ Send Order Number on Live Chat for Quick Delivery  \r\n\r\n💎 Benefits:  \r\n👑 Unlock All Models &amp;amp; Features – Includes GPT-4, GPT-4 Turbo &amp;amp; GPT-5 (Agent Mode Supported)  \r\n\r\n📜 Rule:  \r\nThis account is for single-use only. Do not share with anyone, otherwise your subscription will be suspended and no refund will be provided.', 1),
(13, 1, 14472, 'TikTok Account | UK / USA | Non Monetized | 1000+ Real Followers | Read Description | 🔥', 'TikTok » Accounts [ Real – UK / USA ]', 1651.0346, 2476.5518, NULL, 1, 1, '189', 0, 0, '✅ 1000+ TikTok organic followers — all real users gained naturally through viral videos.\r\n\r\n✅ Ready-to-use TikTok accounts with active followers\r\n🕹️ Perfect for Gaming Incentive Campaigns\r\n🚀 Boosts your TikTok growth instantly\r\n💬 High engagement &amp;amp; real audience\r\n🔒 Safe and verified accounts\r\n🌍 Suitable for creators, influencers &amp;amp; agencies', 1),
(14, 1, 13698, 'TikTok Account | USA 🇺🇸 | 100% Real | Read Description | 🔥', 'TikTok » Accounts [ Fresh – UK / USA ]', 229.3105, 343.9657, NULL, 1, 1, '17', 0, 0, 'Fresh TikTok account with zero followers — 100% organic, created without any trick or VPN\r\n\r\nUSA account 🇺🇸\r\n\r\nBest for Monetization\r\n\r\nDelivery time: 30 minutes to 5 hours\r\n\r\nAdd Gmail in the link box\r\n\r\nAfter order, contact on live chat', 1),
(15, 1, 13699, 'TikTok Account | UK 🇬🇧 | 100% Real | Read Description | 🔥', 'TikTok » Accounts [ Fresh – UK / USA ]', 229.3105, 343.9657, NULL, 1, 1, '90', 0, 0, 'Fresh TikTok account with zero followers — 100% organic, created without any trick or VPN\r\n\r\nUK account 🇬🇧\r\n\r\nBest for Monetization\r\n\r\nDelivery time: 30 minutes to 5 hours\r\n\r\nAdd Gmail in the link box\r\n\r\nAfter order, contact on live chat', 1),
(16, 1, 14473, 'TikTok Account | UK 🇬🇧 | Real Monetized | 50K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 22931.0346, 34396.5518, NULL, 1, 1, '136', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 50k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality UK-based accounts — no service-based profiles', 1),
(17, 1, 14816, 'TikTok Account | USA 🇺🇸 | Real Monetized | 10K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 8689.6552, 13034.4829, NULL, 1, 1, '49', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 10k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality USA-based accounts — no service-based profiles', 1),
(18, 1, 14817, 'TikTok Account | UK 🇬🇧 | Real Monetized | 10K+ Followers | Read Description | 🔥', 'TikTok » Accounts [ Real Monetized ]', 9655.1725, 14482.7588, NULL, 1, 1, '112', 0, 0, 'Submit your contact number in the link box and share the order ID via live chat\r\n\r\nYou can check available accounts via live chat before confirming your order, then deposit and proceed\r\n\r\nFeel free to place your order — our team will find and provide a TikTok account according to your demand\r\n\r\nEach account is 100% organic, monetized, and has 10k real followers with increasing organic likes, views, and comments\r\n\r\nOnly high-quality UK-based accounts — no service-based profiles', 1),
(19, 1, 15025, 'TikTok Comments | Random | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0–5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Comments [ No Refill ]', 377.3823, 566.0735, NULL, 10, 10000, '23', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n💬 Comments: Random + Emojis  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: TikTok video link', 1),
(20, 1, 14488, '🆅🅸🅿 TikTok Likes | Premium | Real HQ Profiles | Drop – No | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Drop – 0% ]', 63.5592, 95.3387, NULL, 100, 20000000, '30', 0, 1, '⏱ Start: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop: 0% (2+ Years No Drop)\r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(21, 1, 14886, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Drop – 0% ]', 46.5777, 69.8666, NULL, 10, 1000000, '27', 1, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(22, 1, 13996, '🆅🅸🅿 TikTok Likes | Premium | Real HQ Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Best Speed ]', 79.4489, 119.1733, NULL, 10, 500000, '36', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(23, 1, 14414, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'TikTok » Likes [ Best Speed ]', 25.1530, 37.7294, NULL, 100, 500000000, '30', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(24, 1, 14426, 'TikTok Likes | Real HQ Profiles | Non Drop | Speed 1M+ / DAY | Start Time 0-5 Minutes | 30 Days Refill | ✅🔥⚡', 'TikTok » Likes [ Best Speed ]', 25.2700, 37.9050, NULL, 10, 500000000, '28', 1, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1 Million+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: 30 Days Guarantee  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: If drop happens within 30 days, refill will be given. After 30 days, no refill.', 1),
(25, 1, 14433, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Best Speed ]', 13.9650, 20.9475, NULL, 10, 100000, '9', 1, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL', 1),
(26, 1, 14542, 'TikTok Likes | Premium | USA 🇺🇸 | Real Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Best Speed ]', 44.4007, 66.6011, NULL, 10, 5000000, '13', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n❌ Refill: No Refill if Drop Likes\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(27, 1, 14557, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Best Speed ]', 46.5777, 69.8666, NULL, 10, 1000000, '32', 1, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(28, 1, 14434, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Real HQ Profiles ]', 46.5777, 69.8666, NULL, 10, 100000, '35', 0, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(29, 1, 14945, '🆅🅸🅿 TikTok Likes | Premium | Real Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐️🔥⚡', 'TikTok » Likes [ Real HQ Profiles ]', 46.5777, 69.8666, NULL, 10, 1000000, '86', 0, 1, '🔥 Start: 0–5 Minutes Max\r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Real HQ Profiles  \r\n📉 Drop Ratio: 0% (2+ Years No Drop)\r\n✅ Guarantee: Yes Lifetime  \r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚡ Always working, never stops in updates, and completes every order super fast.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(30, 1, 15041, 'TikTok Likes | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Likes [ Real HQ Profiles ]', 12.9360, 19.4040, NULL, 10, 100000, '26', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 100K+ / Day (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop  \r\n\r\n🔗 Link: Your video link / URL', 1),
(31, 1, 15042, 'TikTok Likes | Real HQ Profiles | Drop – Yes | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡️', 'TikTok » Likes [ Real HQ Profiles ]', 16.7580, 25.1370, NULL, 10, 100000, '10', 0, 1, '⏳ Start Time: 0–5 Minutes (max 2 hour)\r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n📉 Drop: Yes Possible in Updates \r\n✅ Guarantee: Lifetime Refill / Refund\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(32, 1, 14841, 'TikTok Likes | Hidden | Speed 100K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'TikTok » Likes [ No Notification ]', 9.6426, 14.4640, NULL, 100, 1000000, '116', 0, 1, '⏱ Start: 0–50 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Your video link / URL', 1),
(33, 1, 14944, 'TikTok Likes | Hidden | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Likes [ No Notification ]', 8.8712, 13.3069, NULL, 10, 1000000, '203', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hours)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Your video link / URL', 1),
(34, 1, 14622, '🆅🅸🅿 TikTok Likes | USA 🇺🇸 | Real Profiles | Drop – No | Speed 100K+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐🔥⚡', 'TikTok » Likes [ Real USA 🇺🇸 ]', 48.5184, 72.7776, NULL, 10, 5000000, '25', 0, 1, '⏱ Start Time: 0–5 Minutes \r\n📍 Location: 100% Real USA\r\n🌟 Quality: 100% USA 🇺🇸 \r\n⚡ Speed: 100K+ Per DAY\r\n✅️ Refill: Yes Lifetime\r\n──────────────\r\n🔗 Link: Your video link / URL', 1),
(35, 1, 14857, 'TikTok Likes | Premium | USA 🇺🇸 | Real Profiles | Speed 500K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Likes [ Real USA 🇺🇸 ]', 31.4412, 47.1618, NULL, 10, 2147483647, '18', 0, 1, '⏱ Start Time: 0–5 Minutes \r\n📍 Location: 100% USA\r\n🌟 Quality: 100% USA 🇺🇸 \r\n⚡ Speed: 500K+ Per DAY\r\n⛔️ Refill: No Refill if Drop\r\n──────────────\r\n🔗 Link: Your video link / URL', 1),
(36, 1, 14428, 'TikTok Likes | PAK 🇵🇰 | Real Active | Non Drop | Speed 1000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Likes [ Real PAK 🇵🇰 ]', 163.2708, 244.9062, NULL, 100, 1000, '23', 0, 1, '⏱ Start Time: 0–hour max\r\n📍 Location: 100% Pakistan\r\n🌟 Quality: 100% PAK 🇵🇰\r\n⚡ Speed: 500 to 1k+ / DAY\r\n✅️ Refill: Yes Lifetime\r\n──────────────\r\n🔗 Link: Your video link / URL', 1),
(37, 1, 14102, 'TikTok Followers | Speed 5K+ / DAY | No Refill | ⛔🔥', 'TikTok » Followers [ Cheapest ]', 248.1248, 372.1872, NULL, 10, 1000000, '42', 0, 1, '⏱ Start: 1 hour (max 3 hours)  \r\n⚡ Speed: 5K / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill in Any Case\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Note: Cheapest service – drop can happen in future, no refill will be given.', 1),
(38, 1, 14105, 'TikTok Followers | Real Monetizable | Drop – Yes | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Cheapest ]', 382.3750, 573.5625, NULL, 50, 1000000, '28', 1, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles\r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(39, 1, 14501, 'TikTok Followers | Speed 5K / DAY | No Refill | ⛔🔥', 'TikTok » Followers [ Cheapest ]', 248.1248, 372.1872, NULL, 10, 5000000, '21', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 5K / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill in Any Case\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Note: Cheapest service – drop can happen in future, no refill will be given.', 1),
(40, 1, 14537, 'TikTok Followers | Drop – Yes | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'TikTok » Followers [ Cheapest ]', 385.0000, 577.5000, NULL, 100, 5000000, '94', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 10K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n⏳ Refill can take more than 24 hours.\r\n\r\n⛔️ This is the cheapest service, and drops can happen.\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(41, 1, 15040, 'TikTok Followers | Real Monitizable | Speed 50K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Followers [ Cheapest ]', 248.9108, 373.3661, NULL, 50, 500000, '58', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill if Drop\r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL', 1),
(42, 1, 15043, 'TikTok Followers | Real Monetizable | Drop – No | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🎗🔥⚡', 'TikTok » Followers [ Cheapest ]', 509.6000, 764.4000, NULL, 50, 1000000, '51', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Lifetime Guarantee  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(43, 1, 14615, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'TikTok » Followers [ Real Monitizable ]', 399.0000, 598.5000, NULL, 50, 1000000, '27', 0, 1, '⏱ Start: 0-5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real Profiles Monitizable\r\n❌ Refill: No Refill Service \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(44, 1, 14753, 'TikTok Followers | Real Monitizable | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡️', 'TikTok » Followers [ Real Monitizable ]', 484.1200, 726.1800, NULL, 50, 1000000, '35', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Refill: Yes Lifetime  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(45, 1, 14013, 'TikTok Followers | Real Monitizable | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'TikTok » Followers [ Best Speed ]', 485.1840, 727.7760, NULL, 10, 1000000, '82', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(46, 1, 14558, 'TikTok Followers | Real Monitizable | Drop – No | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡', 'TikTok » Followers [ Best Speed ]', 484.1200, 726.1800, NULL, 50, 1000000, '136', 1, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(47, 1, 14577, 'TikTok Followers | Real HQ Profiles | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Followers [ Best Speed ]', 428.2600, 642.3900, NULL, 50, 1000000, '75', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 100K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in the future, no refill will be given.', 1),
(48, 1, 14836, 'TikTok Followers | Real HQ Profiles | Speed 50K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'TikTok » Followers [ Best Speed ]', 402.5000, 603.7500, NULL, 10, 1000000, '43', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n📉 Drop Ratio: Non-Drop  \r\n🔥 Safe &amp;amp; High Quality Service  \r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ Note: This service has never dropped before, but if it drops in the future, no refill will be given.', 1),
(49, 1, 14848, 'TikTok Followers | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 428.2600, 642.3900, NULL, 10, 1000000, '39', 0, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 10K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n⛔️ Refill: No Refill  \r\n📉 Drop Ratio: 0-1% Maximum\r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n⚠️ 100% Non-Drop Service — never dropped before, but if it ever does in the future, no refill will be provided.', 1),
(50, 1, 14849, 'TikTok Followers | Real HQ Profiles | Drop – No | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Followers [ Drop – 0% ]', 485.1840, 727.7760, NULL, 10, 1000000, '64', 1, 1, '⏱ Start Time: 0–5 Minutes  (max 1 hour)\r\n⚡ Speed: 50K+ Followers / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime  \r\n📉 Drop Ratio: 0-1% Maximum \r\n🔥 Safe &amp;amp; High Quality Service\r\n\r\n🔗 Link: Your profile link / URL\r\n\r\n✅️ 100% Non-Drop Service — never dropped before, but if it ever does in the future, free refill will be provided (lifetime guarantee).', 1),
(51, 1, 14393, 'TikTok Video Views | Speed 10M+ / DAY | No Refill | ⛔️🔥⚡️', 'TikTok » Views [ Cheapest ]', 2.5760, 3.8640, NULL, 50, 2147483647, '9', 0, 1, '⏱ Start: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 10M+ / in 24 Hours \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be given.', 1),
(52, 1, 14953, 'TikTok Views | Speed 1000+ / Hour | No Refill | ⛔️🔥⚡️', 'TikTok » Views [ Cheapest ]', 2.1000, 3.1500, NULL, 100, 1000, '1', 0, 1, '📈 Maximum order: 1000 Views\r\n\r\n🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1000+ / in 1 hour\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable\r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be provided.', 1),
(53, 1, 15013, 'TikTok Video Views | Speed 1M+ / DAY | No Refill | ⛔️🔥', 'TikTok » Views [ Cheapest ]', 1.9040, 2.8560, NULL, 10, 2147483647, '16', 0, 1, '🕒 Start: 1 hour (max 2 hours)\r\n⚡ Speed: 1M+ / in 24 hours\r\n❌ Refill: No Refill if Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable\r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be provided.', 1),
(54, 1, 15038, 'TikTok Video Views | Speed 5M+ / DAY | No Refill | ⛔🔥⚡️', 'TikTok » Views [ Cheapest ]', 2.4640, 3.6960, NULL, 100, 10000000, '7', 0, 1, '⏱ Start: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 5M+ / in 24 Hours \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Cheapest service — may experience drops anytime. Buy at your own risk; no refund or refill will be given.', 1),
(55, 1, 14296, 'TikTok Video Views | Speed 1M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡️', 'TikTok » Views [ Best Speed ]', 2.5536, 3.8304, NULL, 50, 2147483647, '12', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL', 1),
(56, 1, 14316, 'TikTok Views | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡', 'TikTok » Views [ Best Speed ]', 2.6600, 3.9900, NULL, 50, 2147483647, '3', 0, 1, '✅ Always Working – Non Stop ⚡️\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: Currently no drops, but if drops happen in future updates, no refill will be given (No Refill Service).', 1),
(57, 1, 14713, 'TikTok Video Views | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥', 'TikTok » Views [ Best Speed ]', 2.6600, 3.9900, NULL, 50, 2147483647, '15', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n❌ Refill: No Refill if Drop Views\r\n\r\n🔗 Link: Your video link / URL  \r\n\r\n⚠️ Note: Currently no drops, but if drops happen in future updates, no refill will be given (No Refill Service).', 1),
(58, 1, 15006, 'Tiktok Real Sponsor | 10K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 862.9407, 1294.4110, NULL, 1000, 1000, '2600', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(59, 1, 15007, 'Tiktok Real Sponsor | 20K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 20K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 1602.6044, 2403.9065, NULL, 1000, 1000, '4751', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(60, 1, 15008, 'Tiktok Real Sponsor | 30K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 30K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 2342.2675, 3513.4012, NULL, 1000, 1000, '0', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(61, 1, 15009, 'Tiktok Real Sponsor | 100K Views Package | 100% Real Monitizable | PAK 🇵🇰 | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 6040.5848, 9060.8771, NULL, 1000, 1000, '6109', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(62, 1, 15011, 'Tiktok Real Sponsor | 5K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 5K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 616.3861, 924.5792, NULL, 1000, 1000, '2322', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(63, 1, 15012, 'Tiktok Real Sponsor | 50K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 3575.0400, 5362.5600, NULL, 1000, 1000, '0', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(64, 1, 15017, 'Tiktok Real Sponsor | 100K Views Package | Monitizable | PAK 🇵🇰 | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'TikTok » Views [ Real Monitizable ]', 6040.5848, 9060.8771, NULL, 1000, 1000, '4080', 0, 0, '✅ Add Video Link &amp;amp; Ad Code  \r\nhttps://tiktok.com/video + #AdCode  \r\n\r\n✅ Enter Quantity (e.g. 1000)  \r\nYou will receive the complete promotional package.  \r\n\r\n✅ 100% Organic Reach  \r\nYour video will be promoted through TikTok Ads (Pakistan targeted).  \r\nIf the content is good, you may also get likes, comments &amp;amp; followers.  \r\n\r\n✅ Fast Delivery  \r\nOrders are usually completed within 24–48 hours (may delay if TikTok ads update or high traffic).  \r\n\r\n✅ Impression Report  \r\nAvailable within 24 hours after order completion.  \r\n\r\n⚠ Restricted Content  \r\nTikTok policy does not allow promotion of:  \r\n– PUBG/gaming content violating ad rules  \r\n– Drugs or narcotics  \r\n– Weapons or shooting content  \r\n– Smoking or fireworks  \r\n– Unlicensed brand logos  \r\n– Non-PTA approved mobile devices  \r\n– Any other restricted content  \r\n\r\n❌ Such videos will be rejected.', 1),
(65, 1, 14580, 'TikTok | 100% Views | 5% Likes | Speed 10K+ / DAY | Start Time 0-1 Hour | 🔥', 'TikTok » Views + Likes [ No Refill ]', 6.3176, 9.4765, NULL, 100, 1000000, '32', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 50 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 10K+ / DAY  \r\n👁 Views: 100% of order  \r\n❤️ Likes: 5% of views', 1),
(66, 1, 14581, 'TikTok | 100% Views | 10% Likes | Speed 10K+ / DAY | Start Time 0-1 Hour | 🔥', 'TikTok » Views + Likes [ No Refill ]', 9.4763, 14.2145, NULL, 100, 1000000, '31', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 100 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 10K+ / DAY  \r\n👁 Views: 100% of order  \r\n❤️ Likes: 10% of views', 1),
(67, 1, 14582, 'TikTok | 100% Views | 30% Likes | Speed 10K+ / DAY | Start Time 0-1 Hour | 🔥', 'TikTok » Views + Likes [ No Refill ]', 14.2145, 21.3217, NULL, 100, 1000000, '32', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 300 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 10K+ / DAY  \r\n👁 Views: 100% of order  \r\n❤️ Likes: 30% of views', 1),
(68, 1, 14583, 'TikTok | 100% Views | 50% Likes | Speed 10K+ / DAY | Start Time 0-1 Hour | 🔥', 'TikTok » Views + Likes [ No Refill ]', 21.4796, 32.2195, NULL, 100, 1000000, '64', 0, 1, '🔗 Link: TikTok video link  \r\n\r\n📍 Example: If you order 1,000  \r\nYou get 1,000 views + 500 likes  \r\n\r\n⏱ Start: 0–1 Hour  \r\n⚡ Speed: 10K+ / DAY  \r\n👁 Views: 100% of order  \r\n❤️ Likes: 50% of views', 1),
(69, 1, 14715, 'TikTok Live Stream Views 15 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 41.4960, 62.2440, NULL, 10, 500000, '32', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(70, 1, 14716, 'TikTok Live Stream Views 30 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 82.9920, 124.4880, NULL, 10, 500000, '25', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(71, 1, 14717, 'TikTok Live Stream Views 60 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 165.9840, 248.9760, NULL, 10, 500000, '51', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(72, 1, 14718, 'TikTok Live Stream Views 90 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 248.9760, 373.4640, NULL, 10, 500000, '539', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(73, 1, 14719, 'TikTok Live Stream Views 120 Minutes⚡️', 'TikTok » Views [ Live Stream ]', 331.9680, 497.9520, NULL, 10, 500000, '1542', 0, 0, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(74, 1, 14954, 'TikTok Saves | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'TikTok » Saves [ Lifetime ]', 4.1496, 6.2244, NULL, 10, 1000000, '13', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n✅️ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your video link / URL', 1),
(75, 1, 14840, 'TikTok Shares | Non Drop | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'TikTok » Shares [ Lifetime ]', 17.9550, 26.9325, NULL, 10, 5000000, '72', 0, 1, '✅ Always Working – Non Stop 🔥\r\n\r\n⌛️ Start Time: 0–5 Minutes \r\n⚡ Speed: 500K+ / DAY \r\n❌ Cancel Button: 100% Working  \r\n🛡 Guarantee: Yes Lifetime\r\n📉 Drop Ratio: Non-Drop\r\n\r\n🔗 Link: Your video link / URL\r\n\r\n✅️ Note: If drop happens anytime in future, refill will be given as per lifetime guarantee.', 1),
(76, 1, 14431, 'TikTok PK Battle Points | Speed 5M / DAY | No Refill | ⛔️🔥⚡', 'TikTok » Battle Points [ Best Speed ]', 45.6831, 68.5247, NULL, 100, 2147483647, '27', 0, 1, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(77, 1, 14432, 'TikTok PK Battle Points | Speed 10M / DAY | No Refill | ⛔️🔥⚡', 'TikTok » Battle Points [ Best Speed ]', 49.6555, 74.4832, NULL, 100, 2147483647, '30', 0, 1, '⚠️ Many panels make false claims about this service, but during updates it does not work fully. We do not make any false promises — we clearly inform you that this service works sometimes and sometimes not, with no guarantee and possible late delivery. Please test with a small order first; if it works for you, then place a big order. Once an order is placed, it cannot be refunded even if it is not delivered.', 1),
(78, 1, 15059, 'YouTube Subscribe | Non Drop | Speed 1000+ / DAY | Start Time 0-24 Hours | 30 Days Refill | ✅️🔥', 'YouTube » Subscribe [ Non Drop ]', 6078.8448, 9118.2672, NULL, 100, 500000, '1765', 0, 0, '✅ Example Link : link channel or video\r\n\r\n🕓 Start Time : 0-24h\r\n🚀 Speed : 5k/day\r\n⚖️ Min/max : 100/100k\r\n♻️ Guarantee : 30 days Refill\r\n🌎 Country : Global\r\n\r\n⚠️ Note :\r\n✅ Directly produced by us with stable quality and upgraded capacity.\r\n✅ Real subscribers, scalable up to several million per channel.\r\n✅ Speed: 1k – 5k subs/day\r\n⚡ For large orders, we can push up to 10k/day.\r\n📌 When the service is busy, the starting speed of the process changes.\r\n📌 Do not place the second order on the same link before your order is completed in the system.', 1),
(79, 1, 14618, 'YouTube Subscribe | Drop – 100% | Speed 150K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'YouTube » Subscribe [ No Refill ]', 117.9125, 176.8687, NULL, 100, 20000, '6', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 150K+ / DAY  \r\n📉 Drop Ratio: 100%  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Channel link  \r\n\r\n⚠️ Warning: No guarantee, not for monetization. All subscribers drop after some time. No refill or refund.', 1),
(80, 1, 14701, 'YouTube Subscribe | Drop – 100% | Speed 100K+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔🔥⚡', 'YouTube » Subscribe [ No Refill ]', 117.9125, 176.8687, NULL, 100, 20000, '13', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: 100%  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Channel link  \r\n\r\n⚠️ Warning: No guarantee, not for monetization. All subscribers drop after some time. No refill or refund.', 1),
(81, 1, 12820, 'YouTube View | Non Drop | Speed 500+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 256.0384, 384.0577, NULL, 50, 10000, '2094', 1, 1, '- Start Time : 0 - 1 hours \r\n- Speed : Day 500+\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n- Refill button active \r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(82, 1, 14435, 'YouTube View | Non Drop | Speed 500+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 267.1704, 400.7556, NULL, 50, 500000, '699', 1, 1, '- Start Time : 0 - 1 hours \r\n- Speed : Day 500+\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n- Refill button working \r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(83, 1, 14614, 'YouTube View | Non Drop | Speed 1000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Views [ Cheapest ]', 267.1704, 400.7556, NULL, 50, 500000, '738', 1, 1, '- Start Time : 0-1 Hour !\r\n- Speed : Day 1000\r\n- Refill Gurantee : Lifetime ♻️\r\n- Drop Rate : Not Much Expected\r\n- Example Link : https://youtu.be/example', 1),
(84, 1, 14621, 'YouTube View | Non Drop | Speed 1500+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Cheapest ]', 249.3590, 374.0386, NULL, 50, 50000, '447', 0, 1, '- Start Time : 0-1 Hour\r\n- Speed : Day 1500\r\n- Refill Gurantee : Lifetime ♻️\r\n- Drop Rate : Not Much Expected\r\n- Example Link : https://youtu.be/example', 1),
(85, 1, 14282, '🆅🅸🅿 YouTube View | Non Drop | Speed 1000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Best Speed ]', 249.3590, 374.0386, NULL, 50, 500000, '1886', 1, 1, '- Start Time : 0 - 1 hour\r\n- Speed : Day 1000 / 1500\r\n- Refill Time : Lifetime ♻️\r\n- Example Link : https://youtu.be/video\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(86, 1, 14734, '🆅🅸🅿 YouTube View | Non Drop | Speed 500+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥', 'YouTube » Views [ Best Speed ]', 268.5110, 402.7666, NULL, 50, 5000, '535', 1, 1, '🔥 100% always working 💯\r\n\r\n🔥 100% Non Drop 💯\r\n\r\n~ Start : 0-50 minutes \r\n~ Speed : 500+/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1),
(87, 1, 14736, '🆅🅸🅿 YouTube View | Suggested + Mix | Non Drop | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Best Speed ]', 308.7302, 463.0954, NULL, 200, 200000, '950', 1, 1, '🔥 Mostly Suggested + Mix 💥\r\n🔥 100% always working 💯\r\n🔥 100% Non Drop 💯\r\n🔥 Best speed after start 💯\r\n\r\n~ Start : 0-1 hour\r\n~ Speed : 20k to 30k/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1),
(88, 1, 14737, '🆅🅸🅿 YouTube View | Non Drop | Speed 500+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'YouTube » Views [ Best Speed ]', 267.1704, 400.7556, NULL, 100, 50000, '3244', 1, 1, '100% Always Working \r\n\r\nStart time : 0 - 1 hour\r\nSpeed : upto 500+\r\nDrop : 100% Non drop\r\nGuarantee : Lifetime', 1),
(89, 1, 14738, '🆅🅸🅿 YouTube View | 1-5 Minutes Retention | Non Drop | Speed 2000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'YouTube » Views [ Best Speed ]', 385.9128, 578.8692, NULL, 100, 10000000, '410', 0, 1, 'YouTube Views – Fast Start, Top Quality, Lifetime Non Drop\r\n\r\n🔥🔥Experience our best working YouTube views service with super top quality and 100% non drop guarantee. Your order starts within 0–15 minutes and delivers speed of 2,000 to 5,000 views per day. We offer a lifetime guarantee for stable, permanent results. Simply provide your video link and enjoy fast, safe, and recommended service. Perfect for those who want premium, reliable, and effective YouTube promotion!', 1),
(90, 1, 15048, '🆅🅸🅿 YouTube View | 1-5 Minutes Retention | Non Drop | Speed 2000+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'YouTube » Views [ High Retention ]', 385.9128, 578.8692, NULL, 100, 10000000, '445', 0, 1, 'YouTube Views – Fast Start, Top Quality, Lifetime Non Drop\r\n\r\n🔥🔥Experience our best working YouTube views service with super top quality and 100% non drop guarantee. Your order starts within 0–15 minutes and delivers speed of 2,000 to 5,000 views per day. We offer a lifetime guarantee for stable, permanent results. Simply provide your video link and enjoy fast, safe, and recommended service. Perfect for those who want premium, reliable, and effective YouTube promotion!', 1);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`) VALUES
(91, 1, 14699, '🆅🅸🅿 YouTube View | Suggested + Mix | Non Drop | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Views [ Suggested ]', 308.7302, 463.0954, NULL, 200, 10000000, '526', 0, 1, '🔥 Mostly Suggested + Mix 💥\r\n🔥 100% always working 💯\r\n🔥 100% Non Drop 💯\r\n🔥 Best speed after start 💯\r\n\r\n~ Start : 0-1 hour\r\n~ Speed : 20k to 30k/day\r\n~ Refill : Yes Lifetime Guarantee\r\n~ Drop Ratio : 0%\r\n~ Link : Add video link', 1),
(92, 1, 14720, 'Tiktok Live Stream Views 180 Minutes⚡️', 'YouTube » Views [ Suggested ]', 3126.5640, 4689.8460, NULL, 50, 150000, '196', 0, 0, '𝔻𝕖𝕥𝕒𝕚𝕝𝕤\r\n- 𝗦𝘁𝗮𝗿𝘁 𝘁𝗶𝗺𝗲: Instant\r\n- 𝗦𝗽𝗲𝗲𝗱: Fast\r\n- 𝗤𝘂𝗮𝗹𝗶𝘁𝘆: Real\r\n- 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲: No\r\n- 𝗥𝗲𝗳𝗶𝗹𝗹-𝗣𝗲𝗿𝗶𝗼𝗱:No Refill\r\n- 𝗗𝗿𝗼𝗽-𝗥𝗮𝘁𝗶𝗼: Non-Drop\r\n- 𝗟𝗶𝗻𝗸 𝗙𝗼𝗿𝗺𝗮𝘁: https://www.tiktok.com/@username/live\r\n\r\nℕ𝕠𝕥𝕖𝕤\r\n📌 We can not cancel your order once it has been submitted.\r\n📌 Check the link format carefully before placing the order.\r\n📌 Kindly make sure your account is public, Not private.', 1),
(93, 1, 14721, 'Tiktok Live Stream Views 240 Minutes⚡️', 'YouTube » Views [ Suggested ]', 4053.2654, 6079.8982, NULL, 50, 150000, '262', 0, 0, '𝔻𝕖𝕥𝕒𝕚𝕝𝕤\r\n- 𝗦𝘁𝗮𝗿𝘁 𝘁𝗶𝗺𝗲: Instant\r\n- 𝗦𝗽𝗲𝗲𝗱: Fast\r\n- 𝗤𝘂𝗮𝗹𝗶𝘁𝘆: Real\r\n- 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲: No\r\n- 𝗥𝗲𝗳𝗶𝗹𝗹-𝗣𝗲𝗿𝗶𝗼𝗱:No Refill\r\n- 𝗗𝗿𝗼𝗽-𝗥𝗮𝘁𝗶𝗼: Non-Drop\r\n- 𝗟𝗶𝗻𝗸 𝗙𝗼𝗿𝗺𝗮𝘁: https://www.tiktok.com/@username/live\r\n\r\nℕ𝕠𝕥𝕖𝕤\r\n📌 We can not cancel your order once it has been submitted.\r\n📌 Check the link format carefully before placing the order.\r\n📌 Kindly make sure your account is public, Not private.', 1),
(94, 1, 14321, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 3K | Speed 50K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 484.6388, 726.9583, NULL, 3000, 500000, '1314', 1, 1, '', 1),
(95, 1, 14322, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 30K | Speed 5M+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 334.2850, 501.4275, NULL, 30000, 10000000, '479', 1, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 30K\r\n\r\nSpeed : upto 5M\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1),
(96, 1, 14620, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 40K | Speed 50K+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 282.1036, 423.1555, NULL, 40000, 50000000, '2825', 1, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 40K\r\n\r\nSpeed : upto 50,000+\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1),
(97, 1, 14714, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 20K | Speed 5M+ Per DAY | Start Time 1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 331.8988, 497.8483, NULL, 20000, 50000000, '1642', 0, 1, 'Start time : 0 - 1 hour [ Mostly Instant ]\r\n\r\nMinimum Order : 20K\r\n\r\nSpeed : upto 5M\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide', 1),
(98, 1, 14844, '🆅🅸🅿 YouTube Native Ads View | 100% Real Views | 100% Never Drop | Minimum 10K | Speed 50K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐♻️🔥⚡', 'YouTube » Views  [ Real Native Ads ]', 369.0378, 553.5566, NULL, 10000, 2147483647, '445', 1, 1, 'Start time : 0 - 5 hours \r\n\r\nMinimum Order : 10K\r\n\r\nSpeed : upto 50,000+\r\n\r\nGurantee : Lifetime\r\n\r\nDrop : 100% Never Drop\r\n\r\nSpecial : Advertise videos on magazines , ads and online newspapers around the world. Means alot real people will watch your video\r\n\r\nExtra : may be Video will get channel subscriptions, video likes, dislikes from real users worldwide\r\n\r\nContact support team before order for special big orders we try fast Start and double Speed', 1),
(99, 1, 12814, '🆅🅸🅿 YouTube Real Ads Views | Minimum 500K | Non Drop | Speed 500K+ / DAY | Start Time 24-48 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Views  [ Real Google Ads ]', 146.7586, 220.1380, NULL, 500000, 2147483647, '0', 1, 0, 'In this service minimum order 500k+ views \r\n\r\nStart Time: 24 Hours (Sometime It will take 48 hours)\r\n\r\nComplete time: 36-72 Hours\r\n\r\nSpeed : 500K+ / Day\r\n\r\nGuarantee : 100% Non Drop \r\n\r\nTraffic Source : 100% Google Ads\r\n\r\nLocation : India / Worldwide / Random\r\n\r\nVideo Length: Must be less than 5 Mins\r\n\r\nNote: Approval time 24-48 hours!', 1),
(100, 1, 14547, '🆅🅸🅿 YouTube Real Ads Views | Minimum 1M | Non Drop | Speed 1M+ / DAY | Start Time 24-48 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Views  [ Real Google Ads ]', 137.5861, 206.3792, NULL, 1000000, 2147483647, '0', 1, 1, 'In this service minimum order 1M views \r\n\r\nStart Time: 24 Hours (Sometime It will take 48 hours)\r\n\r\nComplete time: 36-72 Hours\r\n\r\nSpeed : 1M+ / Day\r\n\r\nGuarantee : 100% Non Drop \r\n\r\nTraffic Source : 100% Google Ads\r\n\r\nLocation : India / Worldwide / Random\r\n\r\nVideo Length: Must be less than 5 Mins\r\n\r\nNote: Approval time 24-48 hours!', 1),
(101, 1, 15049, 'YouTube Live Stream Views 15 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 12.7680, 19.1520, NULL, 50, 50000, '37', 0, 0, '', 1),
(102, 1, 15050, 'YouTube Live Stream Views 30 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 25.5360, 38.3040, NULL, 50, 50000, '18', 0, 0, '', 1),
(103, 1, 15051, 'YouTube Live Stream Views 60 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 51.0720, 76.6080, NULL, 50, 50000, '64', 0, 0, '', 1),
(104, 1, 15052, 'YouTube Live Stream Views 90 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 76.6080, 114.9120, NULL, 50, 50000, '0', 0, 0, '', 1),
(105, 1, 15053, 'YouTube Live Stream Views 120 Minutes⚡️', 'YouTube » Views  [ Live Stream ]', 102.1440, 153.2160, NULL, 50, 50000, '23', 0, 0, '', 1),
(106, 1, 14124, 'YouTube Video Likes | Speed 5K+ / DAY | No Refill | ⛔🔥', 'YouTube » Likes [ Cheapest ]', 41.9084, 62.8627, NULL, 10, 100000, '454', 0, 1, '⏱ Start: 1 hour (max 12 hours)  \r\n⚡ Speed: 5K+ / DAY (may vary)  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1),
(107, 1, 14400, 'Youtube Likes | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Cheapest ]', 52.3488, 78.5232, NULL, 10, 30000, '35', 1, 0, '⏱ Start: 1 hour (max 1 hour)\r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1),
(108, 1, 14520, 'YouTube Video Likes | Speed 50K+ / DAY | 30 Days Refill | ✅🔥⚡', 'YouTube » Likes [ Cheapest ]', 47.8800, 71.8200, NULL, 10, 500000, '26', 0, 1, '⏱ Start: 1 hour (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: 30 Days Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen. If drop happens within 30 days, refill will be given.', 1),
(109, 1, 14571, 'YouTube Likes | Speed 50K+ / DAY | No Refill | ⛔🔥⚡', 'YouTube » Likes [ Cheapest ]', 38.3040, 57.4560, NULL, 10, 1000000, '14', 0, 0, '⏱ Start: 1 hour (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable  \r\n\r\n⚠️ This is the cheapest service – dropping may happen.', 1),
(110, 1, 13942, '🆅🅸🅿 Youtube Likes | Non Drop | Speed 1M+ / DAY | Start Time 0-15 Minutes | 𝗥𝗲𝗳𝗶𝗹𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 𝗔𝗰𝘁𝗶𝘃𝗲 | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'YouTube » Likes [ Best Speed ]', 223.6954, 335.5430, NULL, 10, 500000, '20', 1, 1, '⏱ Start: 0–15 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1),
(111, 1, 14125, 'Youtube Likes | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 249.3590, 374.0386, NULL, 10, 10000000, '57', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 500K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1),
(112, 1, 14526, 'Youtube Likes | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 65.4360, 98.1540, NULL, 10, 30000, '32', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔘 Button: 30 Days Refill Button \r\n✅️ Refill: Yes Lifetime Partial Support \r\n\r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1),
(113, 1, 14561, '🆅🅸🅿 Youtube Likes | Real | Non Drop | Speed 5M+ Per DAY | Start Time 0-5 Minute | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️⭐🔥⚡', 'YouTube » Likes [ Best Speed ]', 249.3590, 374.0386, NULL, 10, 10000000, '22', 0, 1, '✅️ Recommended for big orders ⚡️\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1),
(114, 1, 14862, '🆅🅸🅿 Youtube Likes | Non Drop | Speed 1M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'YouTube » Likes [ Best Speed ]', 273.6000, 410.4001, NULL, 10, 100000, '20', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 1M+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n🔗 Link: YouTube video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work  \r\n\r\n✅ Lifetime refill guarantee if drop happens.', 1),
(115, 1, 13590, 'YouTube Likes | India 🇮🇳 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 206.8416, 310.2624, NULL, 10, 50000, '20', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: India 🇮🇳  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(116, 1, 13743, 'YouTube Likes | PAK 🇵🇰 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 315.8095, 473.7142, NULL, 10, 50000, '41', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Pakistan 🇵🇰  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(117, 1, 13943, 'YouTube Likes | Brazil 🇧🇷 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 50, 50000, '15', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Brazil 🇧🇷  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(118, 1, 13944, 'YouTube Likes | Kuwait 🇰🇼 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 305.2426, 457.8638, NULL, 10, 5000, '32', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Kuwait 🇰🇼  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(119, 1, 15032, 'YouTube Likes | UK 🇬🇧 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: UK 🇬🇧  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(120, 1, 15033, 'YouTube Likes | Australia 🇦🇺 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Australia 🇦🇺  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(121, 1, 15034, 'YouTube Likes | Canada 🇨🇦 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 50, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Canada 🇨🇦  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(122, 1, 15035, 'YouTube Likes | Egypt 🇪🇬 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 100, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Egypt 🇪🇬  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(123, 1, 15036, 'YouTube Likes | BELGIUM 🇧🇪 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 335.1600, 502.7400, NULL, 100, 50000, '0', 0, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: Belgium 🇧🇪  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(124, 1, 15037, 'YouTube Likes | USA 🇺🇸 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ Targeted ]', 206.8416, 310.2624, NULL, 10, 50000, '32', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: USA 🇺🇸  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(125, 1, 14919, 'YouTube Likes | USA 🇺🇸 | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Likes [ USA 🇺🇸 ]', 206.8416, 310.2624, NULL, 10, 50000, '21', 1, 0, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Likes  \r\n📍 Location: USA 🇺🇸  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Like count must be public, otherwise service will not work', 1),
(126, 1, 14459, 'YouTube Comments | Custom | Real HQ Profiles | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'YouTube » Comments [ Cheapest ]', 351.1200, 526.6800, NULL, 10, 2000, '5', 0, 0, '- Start Time: 0-5 Min (max 1 hour)\r\n- Speed: Day 5K\r\n- Refill: No Refill ⚠️\r\n- Drop Rate: Low Rate\r\n- Example Link: Video Link', 1),
(127, 1, 14884, 'YouTube Comments | Custom | Real HQ Profiles | Non Drop | Speed 1000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Comments [ Cheapest ]', 925.7758, 1388.6636, NULL, 10, 50000, '16', 1, 0, '⏱ Start: 1 hour (max 3 hours)  \r\n⚡ Speed: 1,000+ / DAY  \r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Please provide your custom comments text clearly when ordering.  \r\n📌 Write one comment per line – you can write any comments of your choice.  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed may not be stable', 1),
(128, 1, 14458, '🆅🅸🅿 YouTube Comments | Custom Type | Real HQ | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Comments [ Best Speed ]', 3740.3856, 5610.5784, NULL, 5, 100000, '14', 1, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ \r\n📉 Drop Ratio: 0% Confirm\r\n✅ Guarantee: Lifetime Refill  \r\n🔄 Always working – Non-stop \r\n\r\n🔗 Link: Video link  \r\n\r\n⚠️ Please provide your custom comments text clearly when ordering.  \r\n📌 Write one comment per line – you can write any comments of your choice.', 1),
(129, 1, 14515, '🆅🅸🅿 YouTube Comments | Auto Title Related | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⚡️🔥', 'YouTube » Comments [ Best Speed ]', 4155.9840, 6233.9760, NULL, 10, 10000, '73', 1, 1, '⏱ Start: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ \r\n📉 Drop Ratio: 0% Confirm\r\n✅ Guarantee: Lifetime Refill  \r\n🔄 Always working – Non-stop\r\n\r\n🔗 Link: Video link  \r\n\r\n✅️ Comments will be auto-generated based on your video title.', 1),
(130, 1, 14617, 'YouTube Short Video View | Non Drop | Speed 500+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Services [ Shorts ]', 304.9824, 457.4737, NULL, 100, 500000, '98', 0, 1, '𝗤𝘂𝗮𝗹𝗶𝘁𝘆 : High\r\n𝗦𝘁𝗮𝗿𝘁 : 0 to 5 Minutes \r\n𝗗𝗿𝗼𝗽 : 100% Stable\r\n\r\n𝗦𝗽𝗲𝗲𝗱 : 500-10K In Day\r\n\r\n𝗥𝗲𝗳𝗶𝗹𝗹 : Lifetime \r\n𝗖𝗮𝗻𝗰𝗲𝗹 :  Available\r\n𝗟𝗶𝗻𝗸 : Video Link', 1),
(131, 1, 14693, 'YouTube Short Video Likes | Non-Drop | Speed 20K Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'YouTube » Services [ Shorts ]', 294.9750, 442.4624, NULL, 10, 100000, '12', 1, 0, '', 1),
(132, 1, 14694, 'YouTube Short Video Views | Non Drop | Native Ads | Speed 500K+ Per DAY | Start Time 0-12 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'YouTube » Services [ Shorts ]', 342.0866, 513.1300, NULL, 20000, 10000000, '5782', 0, 0, 'Start time : 1 hour - 5 hour\r\nSpeed : 500,000+/D\r\nGurantee : Lifetime', 1),
(133, 1, 14696, 'YouTube Short Video View | Non Drop | Speed 1K+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'YouTube » Services [ Shorts ]', 318.2424, 477.3636, NULL, 100, 500000, '752', 0, 1, 'High Quality Fast Views\r\n\r\n200 - 400 Per Hour\r\n\r\nInstant Start\r\n\r\nNo Drops Seen\r\n\r\nRefill For Lifetime\r\n\r\nPut YouTube Shorts Video Link\r\n\r\n\r\n• Cancellation Available\r\n• Reliable Service Against Drops\r\n• Video Must Be Less Than 1 Minute', 1),
(134, 1, 14592, 'Instagram Followers | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Followers [ Cheapest ]', 201.8940, 302.8410, NULL, 100, 100000, '84', 0, 1, '⏳ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 5–10% – no refill or refund will be provided in any case, take your own risk.', 1),
(135, 1, 14624, 'Instagram Followers | Real HQ Profiles | Speed 10K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Followers [ Cheapest ]', 417.8334, 626.7500, NULL, 100, 500000, '141', 1, 1, '⏳ Start: 0–1 hour (max 3 hours)  \r\n⚡ Speed: 10K+ / DAY  \r\n🌟 Quality: Real + Mix App Data\r\n📉 Drop Ratio: 5–10%\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable \r\n\r\n⚠️ Drop ratio 5% – 10% possible, but Lifetime refill is available.', 1),
(136, 1, 14672, 'Instagram Followers | Real Profiles | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Cheapest ]', 444.2833, 666.4249, NULL, 100, 500000, '130', 1, 1, '⏳ Start: 0–1 hour (max 3 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real Profiles  \r\n📉 Drop Ratio: 5–10%\r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable \r\n\r\n⚠️ Drop ratio 5% – 10% possible, but Lifetime refill is available.', 1),
(137, 1, 15057, 'Instagram Followers | Real Profiles | Speed 5K+ / DAY | No Refill | ⛔️', 'Instagram » Followers [ Cheapest ]', 172.4800, 258.7200, NULL, 10, 1000000, '40', 0, 1, '⏳ Start: 0–1 hour (max 12 hours)  \r\n🚅 Speed: 5K+ / DAY  \r\n🌟 Quality: Real Profiles + Mix\r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 10–50% – no refill or refund will be provided in any case, take your own risk.', 1),
(138, 1, 15058, 'Instagram Followers | Real HQ Profiles | Speed 100K+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Followers [ Cheapest ]', 289.6667, 434.5001, NULL, 100, 500000, '194', 0, 1, '⏳ Start: 0–1 hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Instagram profile link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Drop ratio can be 5–10% – no refill or refund will be provided in any case, take your own risk.', 1),
(139, 1, 14199, '🆅🅸🅿 Instagram Followers | Real HQ Profiles | All Links Accepted | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Best Speed ]', 629.8499, 944.7749, NULL, 100, 500000, '68', 1, 1, '⏱ Start: 0–5 mins (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Premium Non-Drop Followers  \r\n✅ Guarantee: Lifetime Guarantee  \r\n🔄 Refill: Refill button enabled (easy refill request)  \r\n\r\n🔗 Link: Instagram profile link', 1),
(140, 1, 14607, 'Instagram Followers | Real HQ Profiles | All Links Accepted | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Followers [ Best Speed ]', 414.2001, 621.3001, NULL, 100, 500000, '136', 1, 1, '⏱ Start: 0–1 hour (max 3 hour)    \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Full Real HQ Profiles (Non Drop)  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Links: Instagram Account Link / URL\r\n\r\n⚠️ Note: Refill possible only if drop is 5% or more.', 1),
(141, 1, 13930, 'Instagram Views | All Links Accepted | Non Drop | Speed 500K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Cheapest ]', 0.3800, 0.5699, NULL, 100, 2000000, '91', 0, 1, '- Start : 5 minutes / 1 hour\r\n- Speed : Day 500K+\r\n- Refill : Yes Refill Guarantee \r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(142, 1, 14075, 'Instagram Views | All Links Accepted | Speed 1M+ / DAY | No Refill | ⛔️🔥⚡️', 'Instagram » Views [ Cheapest ]', 0.2156, 0.3234, NULL, 50, 2147483647, '73', 0, 1, '- Speed : Day 5m\r\n- Refill : No Refill\r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(143, 1, 14628, 'Instagram Views | All Links Accepted | Speed 1M+ / DAY | No Refill | ⛔️🔥', 'Instagram » Views [ Cheapest ]', 0.5130, 0.7694, NULL, 100, 100000000, '36', 0, 1, '- Link: Instagram Video Link\r\n- Location: Global\r\n- All Link | Video + Reels + IGTV\r\n\r\n⚠ Notes:\r\n- In case of high demand for the service, there may be changes in speed and start time.\r\n- Do not place the second order on the same link before your order is completed in the system.', 1),
(144, 1, 14629, 'Instagram Views | All Links Accepted | Non Drop | Speed 1M+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Cheapest ]', 0.5986, 0.8980, NULL, 100, 100000000, '1477', 0, 1, '- Link: Instagram Video Link\r\n- Location: Global\r\n- All Link | Video + Reels + IGTV\r\n\r\n⚠ Notes:\r\n- In case of high demand for the service, there may be changes in speed and start time.\r\n- Do not place the second order on the same link before your order is completed in the system.', 1),
(145, 1, 14667, 'Instagram Reel Views | Speed 1M+ Per DAY | Start Time 0-5 Minutes | 🔥🔥⚡⚡', 'Instagram » Views [ Cheapest ]', 0.3800, 0.5699, NULL, 100, 200000000, '614', 0, 1, 'Start - Instant\r\n\r\nSpeed - 1M/ Day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - No\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Cancel Button is working', 1),
(146, 1, 14869, 'Instagram Views | All Links Accepted | Non Drop | Speed 5M+ Per DAY | 🔥⚡', 'Instagram » Views [ Cheapest ]', 0.2943, 0.4414, NULL, 100, 2000000, '77', 0, 1, '🚨 Start : 5 minutes / 1+ hour\r\n- Speed : Day 5M\r\n- Refill : No Refill\r\n- Example Link : Instagram All Link | Video + Reels + IGTV\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(147, 1, 14066, 'Instagram Views | Non Drop | Speed 5M+ Per DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡', 'Instagram » Views [ Best Speed ]', 1.8810, 2.8216, NULL, 100, 2000000, '84', 0, 1, 'Start - Instant\r\n\r\nSpeed - 500K+ / day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Smooth working cheap service\r\n\r\n➜ Supports cancel button and we can mass cancel or complete all orders in case of delays', 1),
(148, 1, 14071, 'Instagram Views + Reach | All Links Accepted | Non Drop | Speed 10M+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Best Speed ]', 22.6416, 33.9625, NULL, 100, 500000000, '47', 0, 1, '10K-20K Per Hour\r\n\r\nInstant Start ( Up To 15 Min )\r\n\r\nNo Drops Seen\r\n\r\nPut Video / Reel Link\r\n\r\n\r\n• There Is Some Extra Delivery\r\n• Cancellation Available\r\n• Fast And Stable\r\n• Best Price In The Market', 1),
(149, 1, 14079, 'Instagram Views | All Links Accepted | Non Drop | Speed 1M+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗️🔥⚡', 'Instagram » Views [ Best Speed ]', 1.8810, 2.8216, NULL, 100, 2000000, '53', 0, 1, '', 1),
(150, 1, 14566, 'Instagram Reel Views | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗🔥⚡️', 'Instagram » Views [ Best Speed ]', 0.3959, 0.5939, NULL, 100, 2000000, '44', 0, 1, '⌛️ Start Time: 0–5 Min (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY (may vary)  \r\n📉 Drop Ratio: 100% Non Drop  \r\n✅ Refill: Yes (Lifetime Guarantee)  \r\n\r\n🔗 Link: Your reel link / URL', 1),
(151, 1, 14062, 'Instagram Views | Reel + IGTV | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗⭐🔥⚡', 'Instagram » Views [ IGTV + Reels ]', 1.8810, 2.8216, NULL, 100, 2147483647, '61', 0, 1, 'Start: INSTANT\r\nSpeed :100k/Hour\r\nGuarantee: Non Drop\r\nQuality: High Quality\r\nRefill: Lifetime', 1),
(152, 1, 14068, 'Instagram Views | Reel + IGTV | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🎗⭐🔥⚡', 'Instagram » Views [ IGTV + Reels ]', 1.8810, 2.8216, NULL, 100, 200000000, '87', 0, 1, 'Start - 0-5 minutes\r\n\r\nSpeed - 100k / day\r\n\r\nQuality - HQ\r\n\r\nDrop - No\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Reel URL\r\n\r\nNote -\r\n\r\n➜ Another emergency server with better quality that helps in video ranking\r\n\r\n➜ High Speed And Instant Start\r\n\r\n➜ Works on all links including IGTV and long videos', 1),
(153, 1, 13749, 'Instagram Likes | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Instagram » Likes [ Cheapest ]', 37.8028, 56.7042, NULL, 10, 100000, '74', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 10K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop  \r\n📉 Drop Ratio: High droping possible \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(154, 1, 14082, 'Instagram Likes | Real HQ Profiles | Speed 100K+ / DAY | No Refill | ⛔️🔥', 'Instagram » Likes [ Cheapest ]', 55.0620, 82.5930, NULL, 100, 500000, '27', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n❌ Refill: No Refill if Drop \r\n📉 Drop Ratio: 5-50% Possible \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(155, 1, 14192, 'Instagram Likes | Real HQ Profiles | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Likes [ Cheapest ]', 69.7452, 104.6178, NULL, 100, 1000000, '37', 0, 1, '⏱ Start: 1 hour (max 2 hours)  \r\n⚡ Speed: 100K+ / DAY (may vary)    \r\n✅️ Refill: Yes Lifetime Guarantee \r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(156, 1, 14668, 'Instagram Likes | Fake Bots | Non Drop | Speed 100K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Likes [ Cheapest ]', 44.3556, 66.5335, NULL, 10, 300000, '79', 0, 1, '- Link: Instagram Post Link\r\n- Location: Worldwide 🌎\r\n- Quality: Bot Accounts\r\n- Start: 0-5 Minutes (max 1 hour)\r\n- Speed: Day 100K 🚀\r\n- Drop Rate: Drop 0%\r\n- Refill Time: Lifetime ♻️\r\n- Cancel Button: Active 🚫 \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable', 1),
(157, 1, 11550, '🆅🅸🅿 Instagram Likes | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Likes [ Best Speed ]', 77.9486, 116.9230, NULL, 50, 200000, '44', 1, 1, '✅ Always Working – Non Stop\r\n⌛️ Start: 0–5 Minutes (Max 1 Hour)\r\n⚡ Speed: 5M+ / DAY (Ultra Fast)\r\n🌟 Quality: Real HQ Profiles\r\n♻️ Refill: Lifetime Guarantee\r\n\r\n🔗 Link: Your Video Link / URL\r\n\r\n✅️ Note: This service has never dropped before. If it drops in the future, we will provide refill.', 1),
(158, 1, 13751, 'Instagram Likes | Real HQ Profiles | Speed 5M+ / DAY | Start Time 0-5 Minutes | No Refill | ⛔️🔥⚡️', 'Instagram » Likes [ Best Speed ]', 70.3836, 105.5754, NULL, 50, 1000000, '19', 0, 1, '✅ Always Working – Non Stop\r\n⌛️ Start: 0–5 Minutes (Max 1 Hour)\r\n⚡ Speed: 5M+ / DAY (Ultra Fast)\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Refill: No if drop likes \r\n\r\n🔗 Link: Your Video Link / URL', 1),
(159, 1, 14057, 'Instagram Likes | IND 🇮🇳 | Real Profiles | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Likes [ IND 🇮🇳 ]', 72.7776, 109.1664, NULL, 100, 1000000, '7', 0, 1, '⭐️ 100% Real Indian Profiles \r\n⏱ Start: 0-5 minutes (max 1 hour)\r\n⚡ Speed: 100K+ / DAY (after start)\r\n✅️ Refill: Yes Lifetime Guarantee\r\n\r\n🔗 Link: Your video / Reel link\r\n\r\n✅️ Note: If drop happens in future, refill will be given as per lifetime guarantee.', 1),
(160, 1, 14067, 'Instagram Reach Impressions | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Reach Impressions', 14.2881, 21.4322, NULL, 10, 300000, '52', 1, 1, 'High Quality Accounts\r\nSpeed 10K - 20K Per Hour\r\nStart 0 - 5 Mins (max 1 hour)\r\nDrop Ratio No Drops Seen\r\nGuarantee Refill For Lifetime\r\n\r\nPut Instagram Reel/Post Link\r\n\r\n• Good Service To Rank The Post\r\n• Induces Real Reach\r\n• It Takes Up To 24 Hours To Update The Stats', 1),
(161, 1, 14659, 'Instagram Comments | Custom | Real Profiles | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Instagram » Comments [ Lifetime ]', 245.5751, 368.3627, NULL, 10, 50000, '54', 0, 1, 'Start - 1 hour \r\n\r\nSpeed - 5k / day\r\n\r\nQuality - Old Accounts with posts\r\n\r\nDrop - Non Drop\r\n\r\nRefill - Lifetime\r\n\r\nLink - Instagram Post / Reel URL', 1),
(162, 1, 13632, 'Instagram Post Saves | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Instagram » Saves [ Lifetime ]', 18.2400, 27.3601, NULL, 10, 50000, '69', 0, 1, 'High Quality Accounts\r\nSpeed 3K - 5K+ Per Hour\r\nStart 0-5 Mins (max 1 hour)\r\nDrop Ratio No Drops Seen\r\nGurantee Refill For Lifetime\r\n\r\nPut Instagram Post/ Reel Link\r\n\r\n• Good Service With Good Support\r\n• Superfast Server For Instant Result\r\n• Works On Any Kind Of Post', 1),
(163, 1, 14077, 'Instagram Story Views | All Stories | Speed 5M+ Per DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 45.6000, 68.3999, NULL, 100, 15000, '28', 0, 1, '5K per hour\r\n\r\nMix Quality\r\n\r\nNon Drop\r\n\r\nNo Refill\r\n\r\nLink - Username without @\r\n\r\nIf u order 1K and post 10 stories u will get 1K views on each story\r\n\r\nCan have startup delays upto 1 hrs\r\n\r\nTake Screenshot for refunds', 1),
(164, 1, 14078, 'Instagram Story Views | Speed 50K+ Per DAY | Start Time 0-5 Minutes | No Refill | ⛔️', 'Instagram » Services [ For Stories ]', 45.6000, 68.3999, NULL, 100, 15000, '5', 0, 1, 'HQ Indian Data From Apps\r\n\r\n500-1K Views Per Hour\r\n\r\nStart time 5 to 10 mins\r\n\r\nPut Instagram Profile Link/ Username', 1),
(165, 1, 14324, 'Instagram Story Views | All Stories | 100% Real Active | Speed 500K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Instagram » Services [ For Stories ]', 249.3750, 374.0625, NULL, 10, 100000, '246', 0, 1, '50K-500K / day\r\n\r\n100% Real Indian Human\r\n\r\nNever Drop\r\n\r\nLifetime Refill\r\n\r\n100% Real Indian Quality [ Mostly power accounts with large number of followers ]\r\n\r\nReal Human Power Accounts [ Data - 2 ]\r\n\r\nStory views would be distributed distributed on all stories with same ordered quantity', 1),
(166, 1, 14325, 'Instagram Story Views | All Stories | Speed 10K+ / DAY | Start Time 0-5 Minutes |', 'Instagram » Services [ For Stories ]', 34.0416, 51.0623, NULL, 100, 1000000, '30', 0, 1, '★ Start: 0 - 10 mins / 1 hour \r\n★ Speed: 10K+ Per Day\r\n★ Quality: Mix QUality\r\n★ Drop: Non Drop\r\n\r\n★ Support on the service is good', 1),
(167, 1, 14326, 'Instagram Story Views | All Stories | Speed 50K+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 35.6250, 53.4374, NULL, 100, 100000, '42', 0, 1, '🔥 Put username or profile link\r\n★ Start: 0-1 Hours \r\n★ Speed: 100k+ Per Day\r\n★ Quality: Mix\r\n★ Drop: Unknown\r\n★ Guarantee: :No\r\n\r\n🔝 It\\s a cheap server don\\t complain for non deliveries', 1),
(168, 1, 14328, 'Instagram Story Views | All Stories | Speed 50K+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'Instagram » Services [ For Stories ]', 39.5438, 59.3158, NULL, 100, 100000, '71', 0, 1, 'World Wide Quality With DP Accounts\r\n\r\nSuperfast Delivery Instant Complete\r\n\r\nInstant Start\r\n\r\nNo Drops Seen\r\n\r\nPut Instagram Profile/ Story Link\r\n\r\n\r\n• Perfect Quality With All DP Accounts\r\n• Cancellation Available\r\n• Take Screenshot With Date And Time For Any Issues', 1),
(169, 1, 14329, 'Instagram Story Views | All Stories | Speed 10K+ / DAY | Start Time 0-5 Minutes |', 'Instagram » Services [ For Stories ]', 35.6250, 53.4374, NULL, 100, 15000, '250', 0, 1, '', 1),
(170, 1, 13056, 'Facebook Followers | Profile &amp;amp; Page | Real HQ | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'Facebook » Followers [ Cheapest ]', 64.7590, 97.1384, NULL, 10, 100000000, '72', 0, 1, '🕑 Start Time 0-1 hour (max 2 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Cheapest service – speed may go up or down anytime  \r\n❌ No Refill – Use at your own risk', 1),
(171, 1, 14491, 'Facebook Followers | Profile &amp;amp; Page | Real HQ | Speed 50K+ / DAY | 30 Days Refill | ✅️🔥⚡️', 'Facebook » Followers [ Cheapest ]', 130.9042, 196.3563, NULL, 10, 1000000, '1267', 1, 1, '🕑 Start Time 0-1 hour (max 2 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Speed may go up or down anytime  \r\n✅ 30 Days Refill Guarantee – Full protection for your order', 1),
(172, 1, 14563, 'Facebook Followers | Profile &amp;amp; Page | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'Facebook » Followers [ Cheapest ]', 73.0184, 109.5276, NULL, 100, 100000, '173', 1, 1, '🕑 Start Time 0-3 hours (max 6 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Speed may go up or down anytime  \r\n✅ Lifetime Refill Guarantee – Full protection for your order', 1),
(173, 1, 14684, 'Facebook Followers + Likes | Real HQ Profiles | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Facebook » Followers [ Cheapest ]', 82.5930, 123.8895, NULL, 10, 1000000, '1392', 0, 1, '🕑 Start Time 0-1 hour (max 24 hours)\r\n⏳ Start may take some extra time  \r\n💲 Price can change anytime  \r\n📌 Cheapest service – speed may go up or down anytime  \r\n❌ No Refill – Use at your own risk\r\n\r\n- Link : Fb page link \r\n- No support for incorrect links', 1),
(174, 1, 15054, 'Facebook Followers + Likes | Speed 5K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥', 'Facebook » Followers [ Cheapest ]', 97.8880, 146.8320, NULL, 10, 1000000, '38', 0, 0, '📌 Cheapest service – start and speed may go up or down anytime', 1),
(175, 1, 14140, 'Facebook Page Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Facebook » Followers [ Page ]', 238.9691, 358.4536, NULL, 10, 2000000, '20', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes Lifetime\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1),
(176, 1, 14187, 'Facebook Page Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Page ]', 213.3653, 320.0480, NULL, 10, 5000000, '25', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes 30 days\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1),
(177, 1, 14287, 'Facebook Profile Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Profile ]', 213.3653, 320.0480, NULL, 10, 500000, '32', 0, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes 30 days\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1),
(178, 1, 14545, 'Facebook Profile Followers | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Facebook » Followers [ Profile ]', 238.9691, 358.4536, NULL, 10, 2000000, '38', 1, 1, 'Start time : 0 / 1+ hour !\r\n\r\nRefill : Yes Lifetime\r\n\r\n100% Stable Service \r\n\r\nSpeed 50k+/day', 1),
(179, 1, 13218, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Facebook » Followers + Likes', 102.1440, 153.2160, NULL, 10, 1000000, '18', 1, 1, '⌛️ Start Time: 0 – 1 Hour (max 5 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 10K+ / Day  \r\n✅ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your page link / URL', 1),
(180, 1, 14030, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers + Likes', 426.8617, 640.2925, NULL, 10, 100000, '294', 1, 1, '⌛️ Start Time: 0 – 1 Hour (max 2 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: Yes Lifetime \r\n\r\n🔗 Link: Your page link / URL', 1),
(181, 1, 15030, 'Facebook Followers + Likes | Real HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Followers + Likes', 89.7750, 134.6625, NULL, 10, 1000000, '39', 0, 1, '⌛️ Start Time: 0 – 1 Hour (max 2 hours)\r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n⛔️ Refill: No if Drop \r\n\r\n🔗 Link: Your page link / URL', 1),
(182, 1, 13222, 'Facebook Page Followers | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers [ Best Speed ]', 238.9691, 358.4536, NULL, 10, 5000000, '28', 1, 1, 'Ultra Fast working 🔥\r\n\r\nSometime start in 1 hour', 1),
(183, 1, 14687, 'Facebook Profile Followers | Non Drop | Speed 100K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Followers [ Best Speed ]', 238.9691, 358.4536, NULL, 10, 5000000, '27', 0, 1, 'Ultra Fast working 🔥\r\n\r\nSometime start in 1 hour', 1),
(184, 1, 13818, 'Facebook Followers | Page / Profile | Real HQ HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Real HQ ]', 348.3357, 522.5035, NULL, 100, 100000, '335', 1, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: 30 Days Guarantee', 1),
(185, 1, 13936, 'Facebook Followers + Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Followers [ Real HQ ]', 204.0567, 306.0851, NULL, 10, 5000000, '816', 1, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n✅ Refill: 30 Days Guarantee', 1),
(186, 1, 14493, 'Facebook Followers | Page / Profile | Real HQ HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 🔥⚡', 'Facebook » Followers [ Real HQ ]', 288.4655, 432.6983, NULL, 100, 100000, '111', 0, 1, '⏱ Start Time: 0 – 1 Hour ✅  \r\n🌍 Location: Worldwide  \r\n🌟 Quality: Real HQ Profiles  \r\n⚡ Speed: 50K+ / Day  \r\n⛔️ Refill: No Refill if Drop', 1),
(187, 1, 13658, 'Facebook Post Likes | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'Facebook » Post Likes [ Cheapest ]', 75.6120, 113.4181, NULL, 20, 5000, '23', 1, 1, '⏳ Start Time: 0–1 Hour (max 2 hours)  \r\n⚡ Speed: 50K+ / DAY  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Facebook post link  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n✅ Drop can happen in cheap service, but Lifetime Refill is available', 1),
(188, 1, 14570, 'Facebook Post Likes | Speed 10K+ / DAY | No Refill | ⛔️🔥', 'Facebook » Post Likes [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '87', 0, 1, '⏳ Start Time: 0 – 1 Hour (max 3 hours)  \r\n⚡ Speed: 10K+ / DAY  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Facebook post link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(189, 1, 13674, 'Facebook Post Likes | Real HQ Profiles | Speed 50K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 75.9122, 113.8683, NULL, 100, 500000, '47', 0, 1, '⏳ Start Time: 0–1 Hour \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill  \r\n\r\n🔗 Link: Facebook post link  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given', 1),
(190, 1, 14162, 'Facebook Post Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 82.5132, 123.7698, NULL, 20, 500000, '34', 1, 1, '⏳ Start Time: 0–1 Hour  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: 30 Days Refill  \r\n\r\n🔗 Link: Facebook post link', 1),
(191, 1, 14163, 'Facebook Post Likes | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Post Likes [ Best Speed ]', 101.4418, 152.1626, NULL, 20, 500000, '24', 1, 1, '⏳ Start Time: 0-1 hour(max 2 hours) \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n✅ Guarantee: Lifetime Refill  \r\n\r\n🔗 Link: Facebook post link', 1),
(192, 1, 13051, 'Facebook Post Reaction | Heart ❤️ | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '88', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Heart ❤️', 1),
(193, 1, 13052, 'Facebook Post Reaction | Care 🥰 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '72', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1),
(194, 1, 13053, 'Facebook Post Reaction | Wow 😲 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '15', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😮', 1),
(195, 1, 13054, 'Facebook Post Reaction | Haha 😂 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '15', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Haha 😄', 1),
(196, 1, 13055, 'Facebook Post Reaction | Sad 😢 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '23', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1),
(197, 1, 13657, 'Facebook Post Reaction | Like 👍 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '69', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Like 👍', 1),
(198, 1, 14411, 'Facebook Post Reaction | Angry 😡 | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Facebook » Post Reactions [ Cheapest ]', 23.3016, 34.9524, NULL, 10, 500000, '31', 0, 1, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Angry 😡', 1),
(199, 1, 13656, 'Facebook Post Reaction | Care 🥰 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 50, 100000, '427', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1),
(200, 1, 13659, 'Facebook Post Reaction | Wow 😲 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 50, 100000, '51', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😲', 1),
(201, 1, 13660, 'Facebook Post Reaction | Sad 😥 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 30, 100000, '13', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1),
(202, 1, 13661, 'Facebook Post Reaction | Haha 😄 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 50, 100000, '24', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Haha 😄', 1),
(203, 1, 14171, 'Facebook Post Reaction | Love ❤️ | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 50, 100000, '29', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Love ❤️', 1),
(204, 1, 14751, 'Facebook Post Reaction | Angry 😡 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 298.4201, 447.6301, NULL, 50, 100000, '21', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Angry 😡', 1),
(205, 1, 14877, 'Facebook Post Reaction | Like 👍 | Non Drop | Speed 50K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅🔥⚡', 'Facebook » Post Reactions [ Refill ]', 304.9318, 457.3976, NULL, 50, 100000, '13', 0, 1, '⏳ Start Time: 0–5 Minutes (max 1 hour)\r\n⚡ Speed: 50K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n✅ Guarantee: 30 Days Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Like 👍', 1),
(206, 1, 14878, 'Facebook Post Reaction | Wow 😲 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 140.4320, NULL, 10, 500000, '8', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Wow 😮', 1),
(207, 1, 14879, 'Facebook Post Reaction | Heart ❤️ | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 140.4320, NULL, 10, 500000, '886', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Heart ❤️', 1);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`) VALUES
(208, 1, 14880, 'Facebook Post Reaction | Care 🥰 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 140.4320, NULL, 10, 500000, '30', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Care 🥰', 1),
(209, 1, 14885, 'Facebook Post Reaction | Sad 😢 | Speed 10K+ / DAY | No Refill | ⛔🔥⚡️', 'Facebook » Post Reactions [ S2 ]', 93.6214, 140.4320, NULL, 10, 500000, '11', 0, 0, '⏳ Start Time: 0–1 hour (max 2 hours)\r\n⚡ Speed: 10K+ / DAY\r\n🌟 Quality: Real HQ Profiles\r\n⛔️ Guarantee: No Refill\r\n\r\n🔗 Link: Facebook post link\r\n\r\n📍 Post Reaction: Sad 😢', 1),
(210, 1, 12912, 'Facebook Video Views | Non Drop | Speed 5000+ Per DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'Facebook » Views [ Cheapest ]', 21.5062, 32.2594, NULL, 500, 100000000, '227', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee', 1),
(211, 1, 13673, 'Facebook Reel Views | Non Drop | Speed 5000+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥', 'Facebook » Views [ Cheapest ]', 15.5610, 23.3415, NULL, 500, 10000000, '2218', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1),
(212, 1, 14147, 'Facebook Reel Views | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'Facebook » Views [ Cheapest ]', 12.4488, 18.6732, NULL, 500, 10000000, '417', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n❌ Refill: No Refill (If Drop Views)  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(213, 1, 14861, 'Facebook Video Views | Non Drop | Speed 5000+ / DAY | No Refill | ⛔️🔥', 'Facebook » Views [ Cheapest ]', 17.2049, 25.8073, NULL, 500, 100000000, '306', 0, 1, '⏱ Start: 1 hour (max 24 hours)  \r\n⚡ Speed: 5,000+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n❌ Refill: No Refill (If Drop Views)  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Cheapest service – start &amp;amp; speed not stable  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n⚠️ This service has never dropped before, but if it drops in future, no refill will be given.', 1),
(214, 1, 14146, 'Facebook Video Views | Non Drop | Speed 100K / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Facebook » Views [ Best Speed ]', 37.7854, 56.6782, NULL, 500, 100000000, '265', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook video link only  \r\n\r\n⚠️ Works for Facebook videos only – provide correct video link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1),
(215, 1, 14396, 'Facebook Reel Views | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Facebook » Views [ Best Speed ]', 23.4612, 35.1918, NULL, 500, 10000000, '218', 0, 1, '✅ No speed issues in the last 2+ years  \r\n\r\n⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 100K+ / DAY  \r\n📉 Drop Ratio: Non Drop  \r\n✅ Guarantee: Lifetime  \r\n\r\n🔗 Link: Facebook reel link only  \r\n\r\n⚠️ Works for Facebook reels only – provide correct reel link when ordering  \r\n\r\n✅ If drop happens, refill will be given as per lifetime guarantee.', 1),
(216, 1, 14901, 'Facebook Live Stream Views 15 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 140.4480, 210.6720, NULL, 20, 10000, '15', 0, 0, '- no guarantee service, pls test before using', 1),
(217, 1, 14902, 'Facebook Live Stream Views 30 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 280.8960, 421.3440, NULL, 20, 10000, '18', 0, 0, '', 1),
(218, 1, 14903, 'Facebook Live Stream Views 60 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 561.7920, 842.6880, NULL, 20, 10000, '15', 0, 0, '', 1),
(219, 1, 14904, 'Facebook Live Stream Views 90 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 842.6880, 1264.0320, NULL, 20, 10000, '112', 0, 0, '', 1),
(220, 1, 14905, 'Facebook Live Stream Views 120 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1123.5840, 1685.3760, NULL, 20, 10000, '17', 0, 0, '', 1),
(221, 1, 14906, 'Facebook Live Stream Views 150 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1404.4800, 2106.7200, NULL, 20, 10000, '0', 0, 0, '', 1),
(222, 1, 14907, 'Facebook Live Stream Views 180 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 1685.3760, 2528.0640, NULL, 20, 10000, '13', 0, 0, '', 1),
(223, 1, 14908, 'Facebook Live Stream Views 300 Minutes⚡️', 'Facebook » Views [ Live Stream ]', 2808.9600, 4213.4400, NULL, 20, 10000, '383', 0, 0, '', 1),
(224, 1, 14178, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 331.9680, 497.9520, NULL, 1, 1, '133', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(225, 1, 14436, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 367.0800, 550.6200, NULL, 1, 1, '965', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(226, 1, 14704, '🆅🅸🅿 Facebook Watch Time | 60K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 494.7600, 742.1400, NULL, 1, 1, '76', 0, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(227, 1, 14894, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 204.2880, 306.4320, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(228, 1, 14895, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 226.6320, 339.9480, NULL, 1, 1, '164', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 60K / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 60K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(229, 1, 14896, 'Facebook Watch Time | 60K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 60K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 60k Minutes ]', 309.6240, 464.4360, NULL, 1, 1, '173', 0, 0, '- Start Time: 0–1 Hour\r\n- Speed: 60K / DAY\r\n- Drop Rate: 0%\r\n- Refill Time: Lifetime ✅️\r\n- Need 1+ hour video link\r\n\r\n✔ Video length must be 1+ hour\r\n✔ Monetization 60K minutes package\r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(230, 1, 13654, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1181.0400, 1771.5600, NULL, 1, 1, '284', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(231, 1, 14923, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1308.7200, 1963.0800, NULL, 1, 1, '3462', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(232, 1, 14924, 'Facebook Watch Time | 600K Minutes | Non Drop | Need 1+ Hours Video Link | Speed 600K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 600k Minutes ]', 1596.0000, 2394.0000, NULL, 1, 1, '1056', 1, 1, '- Start Time: 0–1 Hour  \r\n- Speed: 600K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 600K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(233, 1, 15019, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 5990.3200, 8985.4800, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(234, 1, 15020, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 6022.2400, 9033.3600, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(235, 1, 15021, 'Facebook Watch Time | 120K Minutes | Non Drop | Need 1+ Hour Video Link | Speed 120K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 120k Minutes ]', 6086.0800, 9129.1200, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 120K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 120K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(236, 1, 15022, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 3+ Hours Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6149.9200, 9224.8800, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 3+ hours video link  \r\n\r\n✔ Video length must be 3+ hours  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(237, 1, 15023, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 2+ Hours Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6213.7600, 9320.6400, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 2+ hours video link  \r\n\r\n✔ Video length must be 2+ hours  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(238, 1, 15024, 'Facebook Watch Time | 180K Minutes | Non Drop | Need 1+ Hour Video Link | Speed 180K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Facebook » Watchtime [ 180k Minutes ]', 6277.6000, 9416.4000, NULL, 1, 1, '0', 0, 0, '- Start Time: 0–1 Hour  \r\n- Speed: 180K+ / DAY  \r\n- Drop Rate: 0%  \r\n- Refill Time: Lifetime ✅️  \r\n- Need 1+ hour video link  \r\n\r\n✔ Video length must be 1+ hour  \r\n✔ Monetization 180K minutes package  \r\n\r\n⏳ Watchtime appears in Facebook analytics within 24–48 hours after the order is completed.', 1),
(239, 1, 14477, 'Facebook Comments | Custom | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Comments [ Real Profiles ]', 69.2266, 103.8400, NULL, 10, 100000000, '20', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - No Refill ⚠️', 1),
(240, 1, 15055, 'Facebook Comments | Random | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'Facebook » Comments [ Real Profiles ]', 69.2266, 103.8400, NULL, 10, 100000000, '27', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - No Refill ⚠️', 1),
(241, 1, 15056, 'Facebook Comments | Random | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡', 'Facebook » Comments [ Real Profiles ]', 86.4500, 129.6750, NULL, 10, 100000000, '106', 0, 1, '⚠️ Please Read the Description\r\n\r\nComments May be hidden for some post and only the count will be visible.\r\n\r\n- Link: Facebook Post/Video/Reel Link\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K\r\n- Refill Time - Lifetime ✅️', 1),
(242, 1, 15028, 'Twitter Followers | HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️ 🔥 ⚡️', 'X Twitter » Followers [ Best Speed ]', 1272.0492, 1908.0739, NULL, 100, 1000000, '2903', 0, 0, '', 1),
(243, 1, 15029, 'Twitter Followers | HQ Profiles | Speed 10K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅️ 🔥 ⚡️', 'X Twitter » Followers [ Best Speed ]', 1754.0785, 2631.1177, NULL, 100, 100000, '150', 1, 0, '', 1),
(244, 1, 13312, 'Twitter Impressions | Non Drop | Speed 1M+ Per DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Impressions [ Best Speed ]', 18.0163, 27.0245, NULL, 500, 2147483647, '22', 0, 1, 'No guarantee service', 1),
(245, 1, 13868, 'Twitter Impressions  | Non Drop | Speed 1M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'X Twitter » Impressions [ Best Speed ]', 8.2992, 12.4488, NULL, 100, 500000000, '11', 0, 0, '- Start Time : 0-5 Mins (max 1 hour)\r\n- Speed : Day 1M\r\n- Refill Time : Lifetime\r\n- Drop Rate : No Drop\r\n- Example Link : https://twitter.com/username/status/123', 1),
(246, 1, 14427, 'Twitter Profile Visit Impressions  | Non Drop | Speed 5 Million Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'X Twitter » Profile Visit [ Fast ]', 2.4206, 3.6309, NULL, 100, 100, '588', 0, 1, '', 1),
(247, 1, 14608, 'Twitter Tweet Views | Speed 50K+ / DAY | Start Time 0-1 Hour | No Refill | ⛔️🔥⚡️', 'X Twitter » Profile Visit [ Fast ]', 2.8728, 4.3092, NULL, 100, 2147483647, '20', 0, 1, '- Start Time : 0-5 Mins (max 1 hour)\r\n- Speed : DAY 50K 🚀\r\n- Refill : No Refill if drop\r\n- Drop Ratio : No Drop found in past\r\n\r\n- Example Link : Twitter Tweet/Video Link', 1),
(248, 1, 13859, 'Twitter Poll Votes | 100% Non-Drop | Speed 100K Per Day | Start Time 1-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'X Twitter » Poll Votes [ Refill ]', 104.0600, 156.0901, NULL, 100, 100000, '0', 0, 0, '💧 Drop: no\r\n⭐ Guarantee: lifetime\r\n🔗Example link: www....com?vote=ButtonNumber', 1),
(249, 1, 13844, 'Twitter Tweet Views | Non Drop | Speed 5M / DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 3.3250, 4.9875, NULL, 100, 2147483647, '14', 0, 1, '', 1),
(250, 1, 14197, 'Twitter Views | Tweet + Video | Non Drop | Speed 50K+ / DAY | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 3.1920, 4.7880, NULL, 100, 500000000, '11', 0, 1, 'Working for twitter tweet and videos both', 1),
(251, 1, 14567, 'Twitter Tweet Views | Non Drop | Speed 10M / DAY | Start Time 0-5  Minutes | 🔥⚡', 'X Twitter » Views [ For Tweet ]', 8.2992, 12.4488, NULL, 100, 6000000, '283', 0, 1, 'Start: Instant\r\nSpeed: 100M/Day\r\nDrop Ratio: Non-Drop\r\nExample Link: Tweet Link', 1),
(252, 1, 14568, 'Twitter Tweet Views | Speed 1M+ / DAY | Start Time 0-5 Minutes | 🔥⚡️', 'X Twitter » Views [ For Tweet ]', 2.0110, 3.0164, NULL, 100, 100000000, '10', 0, 1, '', 1),
(253, 1, 12994, 'Twitter Video Views | Non Drop | Speed 5M Per DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Video ]', 6.1606, 9.2408, NULL, 100, 2147483647, '87', 0, 1, '', 1),
(254, 1, 13860, 'Twitter Video Views | Non Drop | Speed 100K Per DAY | Start Time 0-1 Hour | 🔥⚡', 'X Twitter » Views [ For Video ]', 5.2030, 7.8044, NULL, 100, 2147483647, '998', 0, 1, '⊚ 𝗦𝘁𝗮𝗿𝘁 : Instant / 1-3 hurs\r\n⊚ 𝗦𝗽𝗲𝗲𝗱 : 200k/day\r\n⊚ 𝗤𝘂𝗮𝗹𝗶𝘁𝘆 : Real\r\n⊚ 𝗥𝗲𝗳𝗶𝗹𝗹 : No\r\n⊚ 𝗥𝗲𝗳𝗶𝗹𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 : No\r\n⊚ 𝗖𝗮𝗻𝗰𝗲𝗹 𝗕𝘂𝘁𝘁𝗼𝗻 : No\r\n⊚ 𝗗𝗿𝗼𝗽 𝗥𝗮𝘁𝗶𝗼 : %0\r\n⊚ 𝗘𝘅𝗮𝗺𝗽𝗹𝗲 𝗹𝗶𝗻𝗸 : https://twitter.com/abc/status/123', 1),
(255, 1, 14677, 'Twitter Video Views | Speed 1M / DAY | Start Time 0-5 Minutes |🔥⚡', 'X Twitter » Views [ For Video ]', 8.1875, 12.2812, NULL, 100, 2147483647, '35', 0, 1, '', 1),
(256, 1, 14678, 'Twitter Views | Non Drop | Speed 10M / DAY | Start Time 0-5 Minutes | 🔥⚡', 'X Twitter » Views [ For Video ]', 2.3276, 3.4915, NULL, 100, 2147483647, '17', 0, 1, 'Always working 100%', 1),
(257, 1, 14670, 'Twitter Views | Tweet + Video | Non Drop | Speed 50K+ / DAY | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'X Twitter » Views [ Lifetime ]', 2.2344, 3.3516, NULL, 100, 1000000000, '23566', 0, 1, 'Link: Tweet / Video Link', 1),
(258, 1, 12987, 'Twitter Likes | Speed 500K+ / DAY | Start Time 0-1 Hour | No Refill | 🔥⚡', 'X Twitter » Likes [ No Refill ]', 716.6015, 1074.9022, NULL, 100, 10000, '42', 0, 1, 'No Refill Guarantee', 1),
(259, 1, 13554, 'Spotify Followers | No Drop | Speed 50K / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Spotify » Followers [ Lifetime ]', 74.2459, 111.3689, NULL, 100, 100000000, '7', 1, 0, '- Start Time : 30 minutes\r\n- Speed : Day 50K\r\n- Refill : Lifetime ♻️\r\n- Link : https://open.spotify.com/artist/xyz\r\n\r\n✔ Followers/User/Artist/Podcast working for all\r\n✔ Playlist Followers will update in 0 - 1 Hours\r\nUser &amp;amp; Artist Followers will update in 1 - 48 Hours\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(260, 1, 13908, 'Spotify Followers | No Drop | Speed 100K / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Spotify » Followers [ Lifetime ]', 79.4489, 119.1733, NULL, 100, 50000000, '24', 0, 0, '- Start Time : 30 minutes\r\n- Speed : Day 100K\r\n- Refill : Lifetime ♻️\r\n- Link : https://open.spotify.com/artist/xyz\r\n\r\n✔ Followers/User/Artist/Podcast working for all\r\n✔ Playlist Followers will update in 0 - 1 Hours\r\nUser &amp;amp; Artist Followers will update in 1 - 48 Hours\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(261, 1, 13543, 'Spotify Plays | USA 🇺🇸 | Speed 10K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Spotify » Plays [ Best Speed ]', 274.0987, 411.1481, NULL, 500, 20000000, '898', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1),
(262, 1, 13877, 'Spotify Free Plays | Global 🌍 | Speed 20K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡️', 'Spotify » Plays [ Best Speed ]', 313.8232, 470.7347, NULL, 500, 20000000, '3308', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1),
(263, 1, 13878, 'Spotify Plays | USA 🇺🇸 | Speed 50K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🔥⚡️', 'Spotify » Plays [ Premium ]', 274.0987, 411.1481, NULL, 500, 20000000, '3295', 1, 0, 'Spotify Plays takes 24-48 hours to show analysis', 1),
(264, 1, 13879, 'Spotify Premium Plays | Lifetime Guarantee | 500-2k/days | INSTANT', 'Spotify » Plays [ Premium ]', 270.0832, 405.1249, NULL, 1000, 100000000, '3954', 0, 0, '', 1),
(265, 1, 13880, 'Spotify Premium Plays | Lifetime Guarantee | 5k/days | INSTANT', 'Spotify » Plays [ Premium ]', 562.6698, 844.0047, NULL, 1000, 2147483647, '0', 0, 0, '', 1),
(266, 1, 13881, 'Spotify  𝐏𝐑𝐄𝐌𝐈𝐔𝐌 Search Plays | Max 10M | 3.5k/days | INSTANT', 'Spotify » Plays [ Premium ]', 196.9066, 295.3600, NULL, 1000, 10000000, '1153', 0, 0, '', 1),
(267, 1, 13915, 'Spotify Podcast Plays | Non Drop | Speed 5K Per DAY | Start Time 0-24 Hours | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅', 'Spotify » Plays [ Podcast ]', 265.6436, 398.4653, NULL, 500, 10000000, '218', 0, 0, '', 1),
(268, 1, 13894, 'Spotify Plays | 🇬🇧 UK | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '1768', 0, 0, '', 1),
(269, 1, 13895, 'Spotify Plays | 🇸🇪 SWEDEN | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '559', 0, 0, '', 1),
(270, 1, 13897, 'Spotify Plays | 🇮🇪 IRELAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '381', 0, 0, '', 1),
(271, 1, 13899, 'Spotify Plays | 🇲🇽 MEXICO | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '376', 0, 0, '', 1),
(272, 1, 13900, 'Spotify Plays | 🇳🇱 NETHERLANDS | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(273, 1, 13901, 'Spotify Plays | 🇳🇴 NORWAY | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(274, 1, 13903, 'Spotify Plays | 🇧🇪 BELGIUM | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(275, 1, 13904, 'Spotify Plays | 🇵🇹 PORTUGAL | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '1318', 0, 0, '', 1),
(276, 1, 13905, 'Spotify Plays | 🇦🇹 AUSTRIA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(277, 1, 13906, 'Spotify Plays | 🇳🇿 NEW ZEALAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(278, 1, 13907, 'Spotify Plays | 🇨🇭 SWITZERLAND | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '1437', 0, 0, '', 1),
(279, 1, 13909, 'Spotify Plays | 🇬🇷 GREECE | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(280, 1, 13910, 'Spotify Plays | 🇦🇺 AUSTRALIA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(281, 1, 13913, 'Spotify Plays | 🇦🇷 ARGENTINA | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(282, 1, 13914, 'Spotify Plays | 🇹🇷 TURKEY | Lifetime Guarantee | Max 500K | 20k-25k/Day |', 'Spotify » Plays [ Targeted ]', 103.7002, 155.5504, NULL, 1000, 500000, '0', 0, 0, '', 1),
(283, 1, 13917, 'Spotify Monthly Listerners | 🇺🇲 USA | Speed: 1-3K Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'Spotify » Monthly Listerners', 633.9553, 950.9329, NULL, 1000, 5000000, '3111', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1),
(284, 1, 13918, 'Spotify Monthly Listerners | 🌍 Global | Speed: 1-3K Per DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 ✅', 'Spotify » Monthly Listerners', 633.9553, 950.9329, NULL, 1000, 5000000, '594', 0, 0, '⚠ Spotify updates the plays counter once time every 36/48 hours. Please, if the order is marked as completed, but you still don\\t see the plays counter updated, just wait a couple of days to see the changes.', 1),
(285, 1, 13919, 'Spotify Saves [Track/Album/Episode] 30 Days Refill | Max 1M | Start 1-12 Hours | 50K/Day |', 'Spotify » Saves [ Refill ]', 94.3636, 141.5455, NULL, 100, 1000000, '11', 0, 0, '', 1),
(286, 1, 13920, 'Spotify Saves [For Track/Album] | Lifetime Guaranteed | Max 100K | Start 1-12 Hours | 1.5K-3K/Day |♻️', 'Spotify » Saves [ Refill ]', 102.9420, 154.4130, NULL, 20, 1000000, '10634', 0, 0, '', 1),
(287, 1, 14873, 'Telegram Members | Speed 10K+ / DAY | No Refill | ⛔🔥', 'Telegram » Members [ Cheapest ]', 0.9310, 1.3965, NULL, 1, 1000000, '730', 0, 1, '- Quality: Low Quality\r\n- Start Time: 0 - 24 hours \r\n- Speed: Day 10K 🚀\r\n- Drop Rate: High Drop\r\n- Refill: No Refill in Any Case ⚠️\r\n- Cancel Button: Enable 🚫\r\n- Example Link: https://t.me/username or @username\r\n\r\n⚠ Note:\r\n- The speed of the cheapest service may go up or down at any time, and there may also be a delay in the start. Additionally, the service rate may change at any time.', 1),
(288, 1, 14955, 'Telegram Members | Speed 15K+ / DAY | No Refill | ⛔🔥', 'Telegram » Members [ Cheapest ]', 4.3890, 6.5835, NULL, 100, 100000, '27', 0, 1, '- Speed : Day 15K+\r\n- Drop Rate : %50 to %100\r\n- Refill : No Refill in Any Case\r\n- Example Link : https://t.me/username or @username\r\n\r\n- The speed of the cheapest service may go up or down at any time, and there may also be a delay in the start. Additionally, the service rate may change at any time.', 1),
(289, 1, 13712, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 30 Days Refill | ✅🔥⚡', 'Telegram » Members [ Best Speed ]', 252.6474, 378.9710, NULL, 10, 1000000, '50', 0, 1, '- Quality : High Quality Members\r\n- Start Time : 0-5 Minutes\r\n- Speed : Day 50K + 🚀\r\n- Refill Time : 30 days ♻️\r\n- Drop Rate : No Drop\r\n- Example Link : https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1),
(290, 1, 14248, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | Start Time 0-5 Minutes | 90 Days Refill | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 272.6979, 409.0468, NULL, 500, 1000000, '71', 0, 1, '- Quality : High Quality Members\r\n- Start Time : 0-5 Minutes\r\n- Speed : Day 100K 🚀\r\n- Refill Time : 90 days ♻️\r\n- Drop Rate : No Drop\r\n- Example Link : https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1),
(291, 1, 14385, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 402.8058, 604.2086, NULL, 10, 500000, '37', 0, 1, '👤 100% real Telegram users from mixed GEOs\r\n🔁 Lifetime refill guarantee — no expiration\r\n📱 All actions via real Android/iOS devices\r\n⚡ Up to 5 million members/day delivery speed\r\n🛡️ Direct provider access — no middlemen\r\n🌍 GEO: BR, MX, IR, AR, IN, ES, PK, PT (Mixed)\r\n\r\nGuarantee\r\nReal\r\nCancel button\r\nSpeed 10M per day\r\n26392 active accounts', 1),
(292, 1, 14386, 'Telegram Members | Speed 50K+ Per DAY | Start Time 5 Minute | 365 Days Refill | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 424.9190, 637.3786, NULL, 500, 100000, '17', 0, 1, 'Guarantee: 1 year refill on private links (others link no refill)\r\n\r\nImportant note: it won\\t cover old drops, we will refuse to refill drops belongs to other services. We are able to understand our drops\r\n\r\nChannels which can cause bans for the members will be canceled automatically [Such as drugs, porn etc.]\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(293, 1, 14451, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 100K+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅⭐🔥⚡', 'Telegram » Members [ Best Speed ]', 97.5475, 146.3213, NULL, 10, 500000, '27', 0, 1, '- Quality: HQ Accounts\r\n- Start Time: 0-5 Mins (mqx 1 hour)\r\n- Speed: Day 100K\r\n- Refill Time: Lifetime \r\n- Drop Rate: No Drop\r\n- Example Link: https://t.me/username\r\n(If you have old members in your channel or group , you should use private link for guarantee)', 1),
(294, 1, 14874, 'Telegram Members | Real HQ Profiles | Non Drop | Speed 50K+ / DAY | 30 Days Refill | ✅🔥⚡️', 'Telegram » Members [ Best Speed ]', 246.6593, 369.9889, NULL, 500, 100000, '12', 0, 1, '', 1),
(295, 1, 14929, 'Telegram Premium Members + Views | 7 Days Premium', 'Telegram » Members [ Premium - S1 ]', 1207.5336, 1811.3004, NULL, 10, 100000, '11', 0, 1, 'All Members 7 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n7 Days No Drop\r\nWarranty 7 days', 1),
(296, 1, 14930, 'Telegram Premium Members + Views | 14 Days Premium', 'Telegram » Members [ Premium - S1 ]', 2113.1838, 3169.7757, NULL, 10, 20000, '31', 0, 1, 'All Members 14 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n14 Days No Drop\r\nWarranty 14 days', 1),
(297, 1, 14931, 'Telegram Premium Members + Views | 20-30 Days Premium', 'Telegram » Members [ Premium - S1 ]', 2415.0672, 3622.6008, NULL, 10, 20000, '20', 0, 1, 'All Members 20-30 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\n20-30 Days No Drop\r\nWarranty - 20 Days', 1),
(298, 1, 14932, 'Telegram Premium Members + Views | 30-60 Days Premium', 'Telegram » Members [ Premium - S1 ]', 4427.6232, 6641.4348, NULL, 10, 20000, '62', 0, 1, 'All Members 30-60 Days Premium Plan + Views For 5 Posts Join From Search\r\nInstant Start\r\nWarranty 30 days', 1),
(299, 1, 14933, 'Telegram Premium Members + Views | 90-180 Days Premium', 'Telegram » Members [ Premium - S1 ]', 9257.7576, 13886.6364, NULL, 10, 20000, '8', 0, 1, 'All Members 90-180 Days Premium Plan + Views For 5 Posts\r\nInstant Start\r\n90-180 Days No Drop\r\nWarranty 90 days', 1),
(300, 1, 14249, 'Telegram Views | Last 5 Posts | Speed 500K Per DAY | Start Instant 0-5 Minutes | 🔥⚡', 'Telegram » Post View [ Best Speed ]', 12.9676, 19.4515, NULL, 10, 10000000, '11', 0, 1, 'sometime takes 1 hour to start', 1),
(301, 1, 14250, 'Telegram Views | Last 10 Posts | Speed 500K Per DAY | Start Instant 0-5 Minutes | 🔥⚡', 'Telegram » Post View [ Best Speed ]', 21.6126, 32.4190, NULL, 10, 10000000, '11', 0, 1, 'sometime takes 1 hour to start', 1),
(302, 1, 13429, 'Telegram Reactions [👍] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '20', 0, 1, '', 1),
(303, 1, 13431, 'Telegram Reactions [❤️] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '30', 0, 1, '', 1),
(304, 1, 13432, 'Telegram Reactions [🔥] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '27', 0, 1, '', 1),
(305, 1, 13434, 'Telegram Reactions [😱] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '153', 0, 1, '', 1),
(306, 1, 13435, 'Telegram Reactions [⚡️] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '55', 0, 1, '', 1),
(307, 1, 13436, 'Telegram Reactions [🎉] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '27', 0, 1, '', 1),
(308, 1, 13437, 'Telegram Reactions [🤩] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '35', 0, 1, '', 1),
(309, 1, 13438, 'Telegram Reactions [😁] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '685', 0, 1, '', 1),
(310, 1, 13439, 'Telegram Reactions [🙏] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 61.5955, 92.3933, NULL, 50, 5000000, '81', 0, 1, '', 1),
(311, 1, 13440, 'Telegram Reactions [👌🏻] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '84', 0, 1, '', 1),
(312, 1, 13442, 'Telegram Reactions [😢] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '110', 0, 1, '', 1),
(313, 1, 13443, 'Telegram Reactions [💩] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '17', 0, 1, '', 1),
(314, 1, 13444, 'Telegram Reactions [🤮] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '80', 0, 1, '', 1),
(315, 1, 13445, 'Telegram Reactions [🖕] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '216', 0, 1, '', 1),
(316, 1, 13446, 'Telegram Reactions [😐] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '0', 0, 1, '', 1),
(317, 1, 13447, 'Telegram Reactions [😭] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '1101', 0, 1, '', 1),
(318, 1, 13448, 'Telegram Reactions [💯] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '416', 0, 1, '', 1),
(319, 1, 13449, 'Telegram Reactions | Speed 10K / DAY | Negative 👎💩 🤮😢 😱', 'Telegram » Reactions [ Cheapest ]', 4.9277, 7.3916, NULL, 50, 10000, '30', 0, 1, '', 1),
(320, 1, 13450, 'Telegram Reactions | Speed 10K / DAY | Positive 👍🤩🔥❤️🥰', 'Telegram » Reactions [ Cheapest ]', 4.9277, 7.3916, NULL, 50, 10000, '20', 0, 1, 'Link : Use Post Link !\r\n\r\nStart Time 0-1 [ sometimes 3 hours ]\r\n\r\nUltra Fast working old trusted service\r\n\r\n# Do not place the second order on the same link before your order is completed in the system', 1),
(321, 1, 13451, 'Telegram Reactions [👀] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '998', 0, 1, '', 1),
(322, 1, 13452, 'Telegram Reactions [👻] 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗥𝗲𝗳𝗶𝗹𝗹 | Non Drop | Instant', 'Telegram » Reactions [ Cheapest ]', 12.3192, 18.4787, NULL, 50, 5000000, '89', 0, 1, '', 1),
(323, 1, 13366, 'Telegram Permium Reaction | 🤬 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '52', 0, 1, 'Speed 50K+ / DAY', 1),
(324, 1, 13367, 'Telegram Permium Reaction | 🙏 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '36', 0, 1, '', 1),
(325, 1, 13368, 'Telegram Permium Reaction | 🤡 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '26', 0, 1, '', 1),
(326, 1, 13369, 'Telegram Permium Reaction | 🤭 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '33', 0, 1, '', 1),
(327, 1, 13370, 'Telegram Permium Reaction | 🕊 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '35', 0, 1, '', 1),
(328, 1, 13374, 'Telegram Permium Reaction | 🤣 + Views | Max 1M | Day 50K', 'Telegram » Reactions [ Premium ]', 52.1195, 78.1792, NULL, 10, 1000000, '31', 0, 1, '', 1),
(329, 1, 13041, 'Telegram Reactions + FREE Views | Speed 50K+ / DAY | Positive 👍🤩🎉🔥❤️🥰👏🏻 | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥⚡', 'Telegram Reactions » [ Best Speed ]', 3.4580, 5.1870, NULL, 10, 30000, '29', 0, 1, '🔥 Top speed service\r\n🔥 Extra Reactions \r\n🔥Start time 0-5 mins', 1),
(330, 1, 14403, 'Whatsapp Channel Post Reactions | 👍❤️😂😯😥🙏 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '14', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: Mix 👍❤️😂😲😥🙏\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(331, 1, 14404, 'Whatsapp Channel Post Reaction | 😂 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '5', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😂\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(332, 1, 14405, 'Whatsapp Channel Post Reaction | 👍 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '5', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 👍\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(333, 1, 14406, 'Whatsapp Channel Post Reaction | 🙏🏻 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '17', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🙏🏻\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(334, 1, 14407, 'Whatsapp Channel Post Reaction | ❤️ | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '12', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: ❤️\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(335, 1, 14409, 'Whatsapp Channel Post Reaction | 😥 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '6', 0, 1, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😥\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(336, 1, 14992, 'Whatsapp Channel Post Reaction | 😯 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '4', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 😯\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(337, 1, 14995, 'Whatsapp Channel Post Reaction | 👏 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '9', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 👏\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(338, 1, 14996, 'Whatsapp Channel Post Reaction | 🔥 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '2', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🔥\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(339, 1, 14997, 'Whatsapp Channel Post Reaction | 🏆 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '12', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🏆\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(340, 1, 14998, 'Whatsapp Channel Post Reaction | 🎉 | Speed 50K+ / DAY | Start Time 0-5 Minutes |', 'WhatsApp » Reactions [ Best Speed ]', 239.4000, 359.1000, NULL, 10, 50000, '13', 0, 0, '- Link: Whatsapp Channel Link\r\n- Location: Global 🌍\r\n- Start : 0-10 Minutes\r\n- Reaction: 🎉\r\n- Speed: Day 50K\r\n\r\nNotes:\r\n- When the service is busy, the starting speed of the process changes.', 1),
(341, 1, 14855, 'Whatsapp Channel Followers / Members | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'WhatsApp » Members / Followers', 744.0751, 1116.1126, NULL, 10, 50000, '270', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1),
(342, 1, 14949, 'Whatsapp Channel Followers / Members | Real HQ Profiles | Speed 50K+ / DAY | No Refill | ⛔️🔥⚡️', 'WhatsApp » Members / Followers', 801.3118, 1201.9678, NULL, 10, 50000, '40', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 50K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1),
(343, 1, 14981, 'Whatsapp Channel Members / Followers | Real HQ Profiles | Speed 10K+ / DAY | No Refill | ⛔️ 🔥⚡️', 'WhatsApp » Members / Followers', 686.8386, 1030.2579, NULL, 10, 50000, '23', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 10K+ / DAY  \r\n🌟 Quality: Real HQ Profiles  \r\n❌ Refill: No Refill (If Drop)  \r\n\r\n🔗 Link: WhatsApp channel link only  \r\n\r\n⚠️ Works for WhatsApp channels only – provide correct channel link when ordering  \r\n\r\n⚠️ If members drop in future, no refill will be given for this service.', 1),
(344, 1, 14851, 'Snapchat Follower | Real HQ Profiles | Non Drop | Speed 10K+ / DAY | Start Time 0-1 Hour | 30 Days Refill | ✅️🔥⚡️', 'Snapchat » Followers [ Refill ]', 6484.9484, 9727.4226, NULL, 10, 10000, '788', 0, 0, '- Location: Worldwide 🌍\r\n- Quality: 100% Real HQ Profiles\r\n- Start Time: 0-1 Hour\r\n- Speed: Day 10K+\r\n- Drop Rate: Non Drop\r\n- Refill Time: 30 Days ♻️\r\n- Example Link: Profile Link or Username', 1),
(345, 1, 14723, 'Website Traffic From Facebook | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '38', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(346, 1, 14724, 'Website Traffic From LinkedIn | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '38', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(347, 1, 14725, 'Website Traffic From Twitter | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '33', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(348, 1, 14726, 'Website Traffic From Instagram | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '32', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(349, 1, 14727, 'Website Traffic From Amazon | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '31', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(350, 1, 14728, 'Website Traffic From Google | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '222', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(351, 1, 14729, 'Website Traffic From Twitch.TV | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '25', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(352, 1, 14730, 'Website Traffic From Pinterest | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '33', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(353, 1, 14731, 'Website Traffic From Blogger.com| WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '45', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(354, 1, 14732, 'Website Traffic From Fiverr.com | WW | Speed 50K Per DAY | No Refill |', 'Website » Traffic [ Global ]', 76.4086, 114.6130, NULL, 88, 88888888, '47', 0, 0, 'Start: Instant - 12 hours\r\nSpeed: Up to 50K/ day\r\nSpecs:\r\n100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic - Direct Visits\r\nGoogle Analytics Supported\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed\r\nLink Format: Full Website URL', 1),
(355, 1, 14461, '🇺🇸USA Traffic from Google | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '50', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(356, 1, 14462, '🇺🇸USA Traffic from Facebook | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '20', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1);
INSERT INTO `smm_services` (`id`, `provider_id`, `service_id`, `name`, `category`, `base_price`, `service_rate`, `old_price`, `min`, `max`, `avg_time`, `has_refill`, `has_cancel`, `description`, `is_active`) VALUES
(357, 1, 14463, '🇺🇸USA Traffic from Instagram | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '48', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(358, 1, 14464, '🇺🇸USA Traffic from Pinterest | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '2', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(359, 1, 14465, '🇺🇸USA Traffic from Twitter | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '20', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(360, 1, 14466, '🇺🇸USA Traffic from Youtube | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '14', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(361, 1, 14467, '🇺🇸USA Traffic from Blogspot/Blogger.com | Speed 10K Per DAY | No Refill |', 'Website » Traffic [ USA 🇺🇸 ]', 76.4086, 114.6130, NULL, 88, 88888888, '39', 0, 0, 'Specs:100% Real &amp;amp; Unique Traffic\r\nDesktop Traffic 45-55%\r\nMobile Traffic 45-55%\r\nGoogle Analytics Supported\r\nLow bounce rates 15-20%\r\nYou can use bit.ly to track results\r\nNo Adult, Drugs or other harmful websites allowed', 1),
(372, 1, 13965, 'TikTok pak followers speed 10k fast no refill', '⭐️ tiktok pak followers | s2 | non stop', 994.9800, 1492.4700, NULL, 100, 50000, '784', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1),
(373, 1, 14417, 'TikTok pak followers speed 5k no refill', '⭐️ tiktok pak followers | s2 | non stop', 740.6000, 1110.9000, NULL, 100, 50000, '77', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1),
(374, 1, 14741, 'TikTok pak followers speed 2k no refill', '⭐️ tiktok pak followers | s2 | non stop', 547.4000, 821.1000, NULL, 100, 50000, '321', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1),
(375, 1, 13937, 'TikTok hq likes speed 50k+ no refill', '⭐️ tiktok likes hq | s2 | non stop', 16.0034, 24.0051, NULL, 10, 1000000, '20', 0, 1, '⚠️ Service is only for API users  \r\n❌ No support for manual orders  \r\n⚡ Quick support for API orders', 1),
(376, 1, 14536, 'TikTok likes cheap speed 50k+ no refill', '⭐️ tiktok likes hq | s2 | non stop', 5.0400, 7.5600, NULL, 10, 1000000, '185', 0, 1, '', 1),
(377, 1, 14691, 'TikTok followers lifetime', 'do not use', 163.2400, 244.8600, NULL, 100, 500000, '24', 0, 1, '', 1),
(378, 1, 14692, 'TikTok followers no refill', 'do not use', 147.8400, 221.7600, NULL, 100, 500000, '18', 0, 1, '', 1),
(379, 1, 14870, 'TikTok hq likes speed 20k no refill', 'do not use', 27.1768, 40.7652, NULL, 10, 5000, '24', 0, 1, '', 1),
(380, 1, 14899, 'Ig followers hq - speed 500+ lifetime', 'do not use', 313.6319, 470.4479, NULL, 100, 30000, '218', 0, 1, '', 1),
(381, 1, 14941, 'TikTok Likes | No Notification | Non Drop | Speed 5M+ / DAY | Start Time 0-5 Minutes | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅️🎗🔥⚡', 'do not use', 15.4280, 23.1420, NULL, 10, 1000000, '92', 0, 1, '⏱ Start: 0–5 Minutes (max 1 hour)  \r\n⚡ Speed: 5M+ / DAY  \r\n📉 Quality: Hidden (No Notification)  \r\n✅️ Refill: Yes Lifetime Refill  \r\n\r\n🔗 Link: Your video link / URL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `last_spin_time` datetime DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `balance`, `last_spin_time`, `api_key`, `is_admin`, `created_at`) VALUES
(1, 'admin', '$2y$10$1NhdsLS6gNSeY7Cu1EB/k.8C4cXUZALn/w9jBB8JcJQnOExkk/bAq', 1.00, NULL, NULL, 1, '2025-11-09 16:21:18'),
(2, 'israrsahib6@gmail.com', '$2y$10$aFc0eWL44tNlgcX7uAzCOu9gOk2w8GuTXSDrLgYljzz/jci8hnn9e', 0.00, NULL, NULL, 1, '2025-11-09 16:45:53'),
(3, 'israrliaqat48@gmail.com', '$2y$10$Hchc6dh3xnLeiyImGjcWMuqUodlFuA58Mhe3yhA4DAFgQh5/XK2Ru', 4468.62, '2025-11-14 23:28:54', '1d81ba6756261e0fe5f2d0585b3ee003', 0, '2025-11-09 16:50:59'),
(4, 'amirnazir2828@gmail.com', '$2y$10$n2Uy.t8H9NIdpbUQVUwGMOBX12xvezRuga9JNevcnoJoShM3nGNei', 0.00, NULL, NULL, 0, '2025-11-10 17:34:55'),
(5, 'kibadiw668@fermiro.com', '$2y$10$dJtrMilfFmPKBk2c88rwC.sUFtBfLGaPjWljFtGcp8pH2DzyhwHk6', 0.00, NULL, NULL, 0, '2025-11-11 14:45:40');

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
-- Table structure for table `wallet_ledger`
--

CREATE TABLE `wallet_ledger` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `ref_type` enum('payment','order','admin_adjust') NOT NULL,
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
(28, 3, 'debit', 3.68, 'order', 5, 'SMM Order #5 (Instagram Comments | Custom | Real Profiles | Speed 5K+ / DAY | Start Time 0-1 Hour | 𝗟𝗶𝗳𝗲𝘁𝗶𝗺𝗲 𝗚𝘂𝗮𝗿𝗮𝗻𝘁𝗲𝗲 | ✅🔥)', '2025-11-15 17:20:08');

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
(2, 3, 1, 1.00, '2025-11-14 18:28:54');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_payments`
--
ALTER TABLE `email_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `smm_categories`
--
ALTER TABLE `smm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `smm_orders`
--
ALTER TABLE `smm_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `smm_providers`
--
ALTER TABLE `smm_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smm_services`
--
ALTER TABLE `smm_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_favorite_services`
--
ALTER TABLE `user_favorite_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_ledger`
--
ALTER TABLE `wallet_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `wheel_prizes`
--
ALTER TABLE `wheel_prizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wheel_spins_log`
--
ALTER TABLE `wheel_spins_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

------WebKitFormBoundaryKfuZStqlX3Q7Rip0
Content-Disposition: form-data; name="overwrite"

0