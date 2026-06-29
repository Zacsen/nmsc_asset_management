-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table nmscst_asset_db.asset: ~100 rows (approximately)
INSERT INTO `asset` (`id`, `asset_tag`, `name`, `serial_number`, `model_name`, `purchase_date`, `purchase_price`, `status`, `notes`, `created_at`, `updated_at`, `category_id`, `location_id`, `manufacturer_id`, `assigned_to_user_id`) VALUES
	(1, 'AST-45711', 'sunt Printer', '85e41705-3015-3d6d-9ae7-0d31f021038e', 'Model-864-chi', '2024-04-16', 4193.17, 'Maintenance', 'Voluptatibus quis omnis esse sapiente.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 1, 3, 10),
	(2, 'AST-78834', 'at Laptop', '0cbf132c-c2b8-39cd-a672-d70c257f826a', 'Model-949-pfr', '2024-03-11', 4234.80, 'Deployed', 'Accusantium mollitia labore aut accusantium.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 5, 7, NULL),
	(3, 'AST-68810', 'ipsum Printer', 'ba482f6e-a809-3e9f-924c-c2cfaf75a08d', 'Model-572-mvx', '2024-01-02', 1153.74, 'Maintenance', 'Qui illum cum magnam vel sapiente molestias quidem.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 4, 2, 1),
	(4, 'AST-75245', 'et Switch', 'cbb257b8-39fe-30cc-95de-7aa391d12e78', 'Model-521-bvp', '2026-05-29', 1232.96, 'Broken', 'Cumque et sequi dolores consectetur est ratione.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 3, 6, 10),
	(5, 'AST-18081', 'vel Laptop', '3172426c-a11b-3888-9b8b-1aea5810bac2', 'Model-792-dps', '2024-01-27', 1882.36, 'Maintenance', 'Eum consequatur inventore voluptatum id velit et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 1, 4, NULL),
	(6, 'AST-53524', 'suscipit Switch', '8b2283b8-1354-3a72-b630-d86e826df4b2', 'Model-117-srg', '2026-04-27', 4567.22, 'Retired', 'Voluptas autem ut ut sed sint aliquid ducimus enim.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 9, 7, 7),
	(7, 'AST-67670', 'consectetur Monitor', 'e291acbb-9b72-3c1e-8beb-c55055a9e130', 'Model-322-qik', '2026-02-13', 4096.95, 'Retired', 'Architecto voluptatibus in magnam commodi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 9, 6, 3),
	(8, 'AST-96718', 'itaque Printer', 'f319ea08-e22f-3cc4-8bf5-257dfed7cefd', 'Model-298-gjc', '2025-03-29', 1487.54, 'Deployed', 'Optio et magnam nisi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 5, 4, NULL),
	(9, 'AST-80113', 'est Server', 'a11f67b8-91e9-3bfa-b4cc-117b3b775d9b', 'Model-838-oac', '2024-04-29', 2955.73, 'Broken', 'Earum quaerat quia in modi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 4, 3, 2),
	(10, 'AST-60709', 'molestiae Switch', '269df739-c701-344c-96f2-f7dafca09290', 'Model-943-yyk', '2025-10-05', 1948.35, 'Maintenance', 'Qui voluptate dignissimos numquam.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 1, 8, 7),
	(11, 'AST-20095', 'harum Switch', '4eafc520-7723-3e89-9613-3fac58c93562', 'Model-466-tlj', '2024-03-07', 3538.71, 'Deployed', 'Vel animi aut ipsam est recusandae ratione suscipit.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 3, 4, NULL),
	(12, 'AST-65661', 'quae Laptop', '1fb01a6f-4ea8-3559-ba5a-3a45bbd95c85', 'Model-274-fdm', '2025-08-23', 3954.63, 'Deployed', 'Animi quo at quasi qui.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 8, 7, 1),
	(13, 'AST-93534', 'magni Monitor', 'f7b378c9-5e77-3d80-b3ba-936b2e3c2252', 'Model-799-fdy', '2023-12-07', 4010.39, 'Deployed', 'Mollitia ipsa et id laborum.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 8, 1, 6),
	(14, 'AST-73982', 'iure Switch', 'b1b7d88a-5c09-3249-98bd-687748afdefd', 'Model-249-tpk', '2024-04-16', 4461.85, 'Retired', 'Nostrum eum expedita officia.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 2, 5, NULL),
	(15, 'AST-54953', 'error Monitor', '4dd37b96-54bc-3819-904d-365867b7e65b', 'Model-898-mna', '2025-03-02', 4900.69, 'Retired', 'Ut quisquam illum et alias.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 7, 2, NULL),
	(16, 'AST-27785', 'quisquam Server', 'df77299a-3442-30e5-99f1-65383d6645d5', 'Model-239-hcn', '2026-06-27', 1513.25, 'Retired', 'Earum officiis natus iusto modi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 2, 3, 1),
	(17, 'AST-31578', 'sed Laptop', 'e418de40-8414-39db-a41c-3473bd89819e', 'Model-922-gxc', '2026-04-12', 142.35, 'Deployed', 'Quasi incidunt eius dolorem aperiam magni voluptas reiciendis nihil.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 7, 2, NULL),
	(18, 'AST-95254', 'in Server', '8b7ef283-49fb-391a-a098-6fc3c85245b2', 'Model-548-xtl', '2023-08-29', 4998.79, 'Maintenance', 'Porro et qui mollitia aliquam.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 1, 5, 3),
	(19, 'AST-92174', 'aliquam Server', 'e6fc2bdd-0ee4-3a8b-a55b-bd8425b752ed', 'Model-544-axu', '2025-07-03', 2431.98, 'Maintenance', 'Est laboriosam ut nesciunt consequuntur et qui expedita.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 1, 2, 1),
	(20, 'AST-51898', 'et Switch', '24e658f3-4cc6-39d2-8ddd-a041df75b4ba', 'Model-081-udh', '2026-06-17', 1059.20, 'Broken', 'Nemo earum nobis sint ab qui doloribus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 6, 10, 5),
	(21, 'AST-52434', 'occaecati Printer', 'a95d4a17-e08c-3526-9027-4a58263aa19c', 'Model-658-dqq', '2026-01-07', 648.32, 'In Storage', 'Aliquam ea nam expedita sint saepe veritatis ut.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 5, 9, 2),
	(22, 'AST-11562', 'a Server', 'c9361586-478a-31da-bce8-28e16e1f6ea3', 'Model-671-vge', '2023-09-06', 4183.99, 'Retired', 'Molestiae est eum sapiente laudantium ea velit accusantium omnis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 7, 9, 9),
	(23, 'AST-14568', 'pariatur Server', '350a916e-60d5-3390-acd8-578b290228f0', 'Model-116-loc', '2024-02-12', 1314.48, 'Maintenance', 'Consequatur rem aperiam porro ab cumque.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 7, 5, 4),
	(24, 'AST-43122', 'et Printer', 'e4cc23ee-996c-3db9-a1e0-49b554b74ef9', 'Model-280-chx', '2024-07-26', 2953.14, 'In Storage', 'Est sint maxime dicta ut odit non dolor.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 2, 3, 4),
	(25, 'AST-69226', 'dignissimos Server', '8eff3f41-3753-3538-897c-99bff549274e', 'Model-792-cmr', '2025-07-23', 1300.12, 'In Storage', 'Repellat quidem aut ullam voluptatibus quod necessitatibus odio.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 10, 7, NULL),
	(26, 'AST-18839', 'dolor Printer', 'a94cf99f-9d70-3b58-a07c-a8246be14d83', 'Model-763-xmi', '2026-05-09', 4085.36, 'Deployed', 'Distinctio provident ut autem aliquid voluptas ipsum fugiat.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 4, 8, NULL),
	(27, 'AST-54386', 'cupiditate Monitor', '6f15be3a-5228-34a4-b70a-fcdddb98e92a', 'Model-511-ded', '2023-11-23', 4658.27, 'Maintenance', 'Occaecati dolorem amet quos sit numquam et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 3, 5, 8),
	(28, 'AST-86809', 'dignissimos Server', '1cf3928d-b117-375a-a3f5-fcbb57697a89', 'Model-734-muu', '2023-07-18', 4307.89, 'Deployed', 'Sed dolor ipsam sunt ut accusantium.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 6, 9, 5),
	(29, 'AST-87915', 'possimus Printer', '68fc31aa-d10c-32d8-a108-7299065e1c5c', 'Model-625-wxo', '2025-09-24', 1210.37, 'Maintenance', 'Sit sit dolorum est recusandae.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 2, 1, NULL),
	(30, 'AST-62099', 'sint Laptop', 'd4827d2d-43f9-3913-b394-67274bc919fa', 'Model-164-nof', '2025-02-01', 400.64, 'Maintenance', 'Quis repudiandae voluptates facilis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 6, 10, 9),
	(31, 'AST-55277', 'debitis Monitor', '23b25e3f-b5c1-3a93-a99f-6fdf0ec580e2', 'Model-778-rps', '2025-03-13', 2716.14, 'Retired', 'Et enim et exercitationem expedita.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 4, 8, 2),
	(32, 'AST-94518', 'et Printer', 'c3392549-8b9b-3f28-b4ab-ba0268a76e4d', 'Model-166-nga', '2024-01-09', 4476.60, 'Deployed', 'Nobis qui molestiae beatae doloribus odio accusantium.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 10, 3, NULL),
	(33, 'AST-17244', 'inventore Laptop', '8fe85060-ca40-3a0c-86dc-33a3e7fe91de', 'Model-180-vik', '2024-04-01', 4413.38, 'In Storage', 'Qui earum aliquid maxime enim quidem ab.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 5, 3, 8),
	(34, 'AST-83692', 'et Laptop', '51f00196-9520-3206-b4c3-adce75afd642', 'Model-099-buu', '2025-05-24', 4436.92, 'Deployed', 'Molestiae odio dolores ut eum omnis rem quasi tempore.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 9, 9, NULL),
	(35, 'AST-13883', 'aut Monitor', 'ce6754d8-78fa-3642-b866-458b215cfc8b', 'Model-699-xmn', '2025-05-06', 4859.47, 'Broken', 'Consectetur aut consectetur fuga rerum mollitia nemo.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 7, 4, 2),
	(36, 'AST-44119', 'omnis Monitor', '3673d4ea-954f-35e8-95d8-e50b3e8120c0', 'Model-447-xmc', '2025-07-27', 1070.60, 'Maintenance', 'Incidunt sed itaque dolorem quaerat quisquam voluptatem omnis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 3, 10, 6),
	(37, 'AST-61369', 'incidunt Switch', '02979319-2759-3d4d-951e-5bd1c815aea9', 'Model-016-gsl', '2025-04-22', 3789.72, 'Retired', 'Deserunt sunt doloremque suscipit consectetur ut.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 6, 5, 1),
	(38, 'AST-47409', 'officiis Server', 'eeb31f67-89bd-3280-bcf4-165e4fdec314', 'Model-039-wku', '2023-12-07', 1421.07, 'Maintenance', 'Quas non quibusdam nemo omnis enim.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 10, 5, 3),
	(39, 'AST-13717', 'vel Switch', 'be2bf2cf-8e3f-308a-b593-00f570612f00', 'Model-840-tej', '2025-07-06', 750.77, 'Broken', 'Magnam iste consectetur incidunt in nulla.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 4, 3, 3),
	(40, 'AST-92921', 'debitis Monitor', '5c5e152a-019a-3b0b-88b8-7193989dabe2', 'Model-096-qph', '2024-03-14', 259.36, 'Retired', 'Laborum fugiat nemo saepe velit sunt.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 7, 4, NULL),
	(41, 'AST-97011', 'eum Printer', '222106f1-b6a4-315a-920f-a5931f55cb8b', 'Model-605-zhh', '2024-03-27', 2117.74, 'Maintenance', 'Dolor dignissimos omnis quae sunt temporibus velit.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 9, 5, 4),
	(42, 'AST-22645', 'eum Switch', '89956775-72b5-37d2-8501-b6d816961f6f', 'Model-058-nim', '2025-05-19', 1504.93, 'Maintenance', 'Et rem non nobis molestiae vel quia.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 5, 10, NULL),
	(43, 'AST-17766', 'ad Printer', 'ef6f5138-a73a-38b2-95b6-098d5efd02b4', 'Model-502-pum', '2023-11-13', 2049.16, 'Deployed', 'Et accusamus ab expedita et perferendis fugit et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 1, 7, NULL),
	(44, 'AST-46404', 'repellat Laptop', '2b467448-774a-3b3b-b887-ecd18edaa9b1', 'Model-001-jxv', '2023-10-25', 4734.53, 'Retired', 'Nisi dolorem consequatur aliquid.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 5, 1, NULL),
	(45, 'AST-14388', 'sapiente Printer', '90353de5-f23c-34a3-8e72-3ee01c27319c', 'Model-635-svp', '2025-11-28', 1478.81, 'Broken', 'Tempore sint ratione suscipit officia officia.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 5, 8, NULL),
	(46, 'AST-15220', 'incidunt Printer', 'a2f34958-5d7b-326a-b740-9acc8ded5a40', 'Model-669-zbk', '2025-03-08', 2436.91, 'Retired', 'Error sit praesentium vel omnis qui maxime rerum qui.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 10, 7, 9),
	(47, 'AST-94823', 'doloribus Laptop', '7f06ec43-3259-3474-a150-b3d365b46c9c', 'Model-002-zcg', '2023-09-04', 3256.82, 'In Storage', 'Aut fuga unde dolores ipsa dicta et dolores.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 8, 10, NULL),
	(48, 'AST-59388', 'eius Printer', '7109f613-de3c-3d74-aec1-9e05c55839f0', 'Model-178-ccw', '2023-12-17', 3730.18, 'In Storage', 'Mollitia doloremque quibusdam dolore rem aut omnis quis sunt.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 9, 8, NULL),
	(49, 'AST-21335', 'vel Server', '45f919d7-6ae8-308c-8ea6-4b81fb769961', 'Model-889-pgc', '2024-08-14', 4123.27, 'In Storage', 'Quod quos impedit beatae in iusto.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 8, 6, 2),
	(50, 'AST-75548', 'ut Printer', '02a98b15-2139-31b8-b517-ca3a1302579b', 'Model-973-pnz', '2026-03-15', 4848.74, 'Broken', 'Voluptas sit ut libero ipsa.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 4, 3, 5),
	(51, 'AST-82405', 'labore Server', '081d87ba-b1c6-316a-a1dd-c427a9a58ded', 'Model-229-uoz', '2025-01-28', 1178.53, 'Maintenance', 'Repudiandae cupiditate et dignissimos.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 9, 1, NULL),
	(52, 'AST-30080', 'omnis Server', 'de045cd8-5b7b-38d7-b497-a537d02b38e4', 'Model-149-vpl', '2025-07-26', 3022.68, 'Deployed', 'Nesciunt modi accusamus ut qui quibusdam quidem.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 6, 1, 9),
	(53, 'AST-29867', 'temporibus Monitor', 'b463366f-3c73-3a38-9ec7-3218786c4283', 'Model-852-mgo', '2026-05-12', 922.32, 'Retired', 'Cum ea aut culpa numquam sed.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 4, 6, 10),
	(54, 'AST-30039', 'nobis Switch', '48279370-7c77-3c67-aa33-a6977f995a5c', 'Model-401-fvt', '2026-02-08', 2745.18, 'Deployed', 'Ut voluptatem vitae consequuntur aliquid doloribus modi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 4, 5, 4),
	(55, 'AST-32533', 'excepturi Laptop', 'dd84d641-e82b-3769-9b99-a6a2e0fce24a', 'Model-070-nwq', '2024-10-11', 2772.23, 'Maintenance', 'Distinctio sit est assumenda sunt officiis voluptatibus et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 7, 9, 9),
	(56, 'AST-70519', 'illum Monitor', 'c2080e04-5fe1-3bed-b4fc-a4f6f3c46bc1', 'Model-361-yjs', '2025-10-20', 2347.71, 'Maintenance', 'Sunt ipsum aut voluptates.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 4, 8, 1),
	(57, 'AST-45368', 'at Printer', 'f42daf29-eeff-3cff-8cd4-f5e9370a42a6', 'Model-689-vzv', '2024-01-29', 2642.31, 'Retired', 'Ipsum temporibus voluptatibus et earum consequatur sit et perferendis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 1, 5, 10),
	(58, 'AST-90480', 'ut Printer', 'fd178f3a-0fb4-3c23-8a6f-67f2dfd16b8c', 'Model-438-jic', '2025-07-04', 4091.60, 'Deployed', 'Qui dolores iure repellendus fugiat et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 8, 2, 10),
	(59, 'AST-20093', 'delectus Printer', 'b48e9a8b-fb50-38d2-82da-7c76eef6a62b', 'Model-247-kyd', '2024-07-25', 2435.42, 'Retired', 'Dolor provident dolorem facere dolorum cumque ratione.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 8, 1, 5),
	(60, 'AST-86907', 'quisquam Switch', '97836445-4662-32e6-8179-d1507bc9c24c', 'Model-414-txz', '2023-11-15', 1319.81, 'Broken', 'Quaerat nesciunt placeat amet.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 5, 1, 2),
	(61, 'AST-35563', 'est Printer', '6eac3539-2c79-31e5-b682-9b80647f31be', 'Model-736-hjm', '2025-09-20', 2613.32, 'Retired', 'Ullam quas voluptatem alias vitae.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 10, 2, 7),
	(62, 'AST-79338', 'molestias Printer', '185f8448-6ab0-3a53-b30d-497da489a4ac', 'Model-709-rwj', '2025-03-05', 749.43, 'Retired', 'Omnis sunt suscipit delectus incidunt est.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 5, 5, 3),
	(63, 'AST-31127', 'numquam Switch', '5f50ef9a-b5dd-3373-ae39-36bc3c948ace', 'Model-879-ofi', '2024-09-03', 3479.55, 'Deployed', 'Doloribus aut rem atque commodi sed.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 8, 6, 1),
	(64, 'AST-71040', 'ullam Switch', 'c27af15e-a2ac-38df-8e2a-8a09c55d6e19', 'Model-435-mtz', '2024-08-28', 2560.41, 'Retired', 'Ex vel rerum est at.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 6, 10, 10),
	(65, 'AST-18822', 'perferendis Switch', '05a9357a-9167-3ad3-a777-9d95e49fab35', 'Model-315-qys', '2024-08-05', 1005.91, 'Broken', 'Modi quibusdam dignissimos quibusdam animi ipsa autem iste.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 3, 3, 6),
	(66, 'AST-12451', 'eos Server', '63a46976-ac2d-3b3f-9ca8-1fd8104b4e4b', 'Model-678-mfm', '2025-04-17', 4858.03, 'In Storage', 'Omnis inventore animi ad iure.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 10, 8, 9),
	(67, 'AST-52028', 'commodi Server', 'f170aba8-e1f6-35b6-917d-98f40528d92a', 'Model-847-hxx', '2024-09-08', 4269.92, 'Retired', 'Omnis voluptatem aut neque omnis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 4, 6, 7),
	(68, 'AST-92393', 'dolores Printer', '1169a340-be0e-3a14-bebd-2823777e0ba8', 'Model-796-grz', '2024-11-06', 986.74, 'In Storage', 'Cupiditate necessitatibus doloremque magni.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 5, 10, 10),
	(69, 'AST-85770', 'tempora Monitor', '5d9a122b-e2fa-3992-a692-4450158de750', 'Model-420-got', '2023-08-30', 2162.53, 'Maintenance', 'Natus officiis magnam ut consectetur excepturi recusandae.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 10, 9, NULL),
	(70, 'AST-90545', 'enim Monitor', '92fb634a-72c3-3521-8643-e9be1e3aa2da', 'Model-556-kgg', '2024-02-12', 4032.47, 'In Storage', 'Sint quo perspiciatis voluptas quo quidem quisquam nostrum et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 10, 5, 6),
	(71, 'AST-60214', 'enim Monitor', '09978589-8273-3c59-ad62-cef6c7c0988f', 'Model-594-apt', '2025-07-31', 162.70, 'Deployed', 'Itaque delectus explicabo sint est.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 8, 10, 3),
	(72, 'AST-84828', 'ullam Switch', '8c958c5a-029d-3851-b5ad-8ba562fe3f91', 'Model-171-gei', '2023-10-28', 4170.78, 'Deployed', 'Eaque ducimus ut et sapiente tempora.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 10, 4, 2),
	(73, 'AST-42284', 'vel Printer', '31e745a5-109e-3b8f-b0bc-2b3a0e2c792e', 'Model-276-gyt', '2024-09-27', 1614.93, 'Retired', 'Quia quas quo ratione veniam autem dolor debitis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 8, 4, 2),
	(74, 'AST-33137', 'dolores Laptop', '87bf4981-a6d9-3f0d-9af2-0f25f5b7fc6e', 'Model-600-dgo', '2025-08-03', 2579.72, 'Broken', 'Non dicta explicabo delectus cumque consequatur.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 6, 9, NULL),
	(75, 'AST-28494', 'voluptatum Monitor', '2120390b-f717-3efa-bb98-711e05fb0e86', 'Model-955-hhh', '2026-05-01', 3481.75, 'Broken', 'Facilis enim ipsum ea qui error.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 5, 1, 9),
	(76, 'AST-11055', 'sit Server', '4e0ff0ab-cdfd-343a-8acb-fa7268d019e5', 'Model-928-gel', '2024-03-25', 1770.29, 'Retired', 'Voluptate iure nihil dolorem tenetur inventore adipisci.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 3, 1, NULL),
	(77, 'AST-78904', 'aliquam Laptop', 'bd5fb16b-c8b3-368b-87e9-8161b9895a2c', 'Model-185-wct', '2024-02-27', 2049.09, 'In Storage', 'Occaecati eaque nisi autem quia fugiat nisi quia.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 2, 1, NULL),
	(78, 'AST-96181', 'dolores Printer', '8649a9bc-6804-31eb-b469-8ea0ea21dad3', 'Model-442-shz', '2024-07-18', 1372.56, 'Retired', 'Nihil architecto quo non accusamus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 6, 1, 2),
	(79, 'AST-78117', 'harum Laptop', 'efd22c06-eddb-34a9-83e9-6b8e67693b86', 'Model-451-thn', '2024-07-03', 1682.93, 'Maintenance', 'Accusamus incidunt hic ut excepturi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 9, 5, NULL),
	(80, 'AST-52694', 'omnis Monitor', '76e52a5d-27e8-3886-a47c-9a6dd29063ab', 'Model-855-zvp', '2025-03-23', 620.80, 'In Storage', 'Optio a et nihil officiis veritatis quia et ex.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 6, 3, 3),
	(81, 'AST-33943', 'quisquam Printer', '5e5fe428-0a19-32cf-a389-726dd4782469', 'Model-616-kwm', '2026-01-12', 2515.76, 'Maintenance', 'Veritatis non ad ipsam asperiores dignissimos.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 10, 4, 1),
	(82, 'AST-75996', 'debitis Switch', '6847fe92-c54a-3f5a-8f37-9d0f24ab8cd3', 'Model-313-znw', '2025-07-26', 1438.09, 'Maintenance', 'Cumque praesentium omnis dignissimos odit.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 3, 6, NULL),
	(83, 'AST-47806', 'et Monitor', '1b174142-a28f-3b3e-9b1c-5e8a744eff5b', 'Model-962-opr', '2023-09-02', 2134.14, 'Deployed', 'Labore aliquid ipsa voluptas.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 3, 4, 6),
	(84, 'AST-50182', 'cumque Switch', 'd3876916-b7c8-3549-bcef-a418bc7a6be6', 'Model-420-eef', '2026-05-07', 1879.26, 'Deployed', 'Molestiae voluptatum ipsum qui delectus nihil blanditiis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 9, 6, NULL),
	(85, 'AST-27666', 'rerum Laptop', '6f1199cf-f20b-3de5-855e-81bcc613a8cb', 'Model-470-uxc', '2024-04-05', 1417.95, 'Maintenance', 'Soluta autem consequatur quam enim rem eos facilis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 5, 9, NULL),
	(86, 'AST-76585', 'nisi Printer', 'e651441e-5136-3f63-8594-1a424df871bd', 'Model-601-fko', '2024-08-17', 2159.87, 'In Storage', 'Rerum voluptatem eius enim fuga aliquid voluptatem quia.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 4, 10, 5),
	(87, 'AST-80364', 'fugit Server', '687d3ae8-144c-3afc-8969-448fa042fed1', 'Model-397-lpd', '2025-05-14', 3242.77, 'Deployed', 'Iusto ducimus deserunt reprehenderit sint corporis assumenda rerum.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 7, 2, 9, 6),
	(88, 'AST-68829', 'rerum Printer', '7cb7d79c-7b72-3545-8fd1-eb553136ec57', 'Model-133-nqd', '2025-07-01', 2550.41, 'Deployed', 'Corrupti ullam est deleniti.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 2, 1, 4),
	(89, 'AST-83300', 'quos Switch', '34901275-26a3-3a6e-a727-3f5b3060f5de', 'Model-498-nag', '2024-12-09', 732.24, 'Maintenance', 'Voluptas quas quasi minus repellendus in.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 2, 9, 1, 6),
	(90, 'AST-49878', 'in Laptop', 'dab26c2c-23b4-33b1-864c-819de0fbea86', 'Model-990-xqn', '2025-07-29', 1313.55, 'In Storage', 'Voluptates beatae eveniet commodi minus consequatur incidunt aut.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 6, 10, 6),
	(91, 'AST-31548', 'asperiores Server', '40a8bf64-67ff-348c-9224-601e22264410', 'Model-100-fuy', '2025-10-29', 4527.78, 'In Storage', 'Quis maxime dolorum adipisci laboriosam aliquam quis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 10, 8, 7, 9),
	(92, 'AST-58691', 'in Monitor', 'f12b1d78-edba-36d5-889d-7a64ee3e1586', 'Model-245-urv', '2024-09-05', 3596.70, 'In Storage', 'Quis quia explicabo nam aut et quaerat nemo.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 7, 7, 6),
	(93, 'AST-59535', 'atque Monitor', '9e6b4737-3ab7-358d-bdf1-fea897426243', 'Model-683-lrr', '2023-09-20', 4717.53, 'Broken', 'Harum voluptatem blanditiis voluptates consequatur rerum non.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 3, 6, 6, 10),
	(94, 'AST-45515', 'minima Monitor', 'd8977c77-7b33-3727-8093-94ecb43c5c61', 'Model-610-wfc', '2026-01-13', 3543.58, 'Retired', 'A consectetur qui molestiae rerum vel et.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 6, 7, 7),
	(95, 'AST-21575', 'corporis Monitor', '5125f08b-f380-360e-9deb-95fd3b46ffc5', 'Model-121-fuj', '2024-02-15', 1865.29, 'Retired', 'Maxime omnis autem recusandae dolorem quos ullam.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 6, 5, 4, 6),
	(96, 'AST-32021', 'hic Switch', '1d031d56-d5be-3626-8019-79dc636075b0', 'Model-729-oim', '2023-07-21', 1088.35, 'Deployed', 'Voluptatem dolores dolorem facilis earum quasi illum.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 8, 7, 8, NULL),
	(97, 'AST-80641', 'est Switch', '2cbcbe0a-74f0-378c-b24b-8850fa537870', 'Model-994-xwn', '2025-07-15', 1427.47, 'Maintenance', 'Cupiditate voluptatem eos fuga magni.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 1, 9, 1, NULL),
	(98, 'AST-60144', 'dicta Printer', '630b6f8b-5a2f-3a25-a39b-7b8de44662fa', 'Model-553-ltf', '2025-05-21', 1087.20, 'In Storage', 'Natus totam quia ut architecto praesentium exercitationem sequi rerum.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 5, 8, 3, 8),
	(99, 'AST-84798', 'qui Printer', 'e4de0549-5857-312f-bf35-d7e483a58934', 'Model-835-bmq', '2023-08-22', 2483.78, 'Retired', 'Quibusdam blanditiis accusamus quod repudiandae porro.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 4, 9, 5, 3),
	(100, 'AST-12017', 'consequatur Server', '397ea149-1105-3cf0-9a56-eb0d133c8981', 'Model-816-rjq', '2024-11-14', 4777.10, 'Deployed', 'Ut illo cum placeat eos laudantium maxime autem quo.', '2026-06-28 08:54:27', '2026-06-28 08:54:27', 9, 3, 4, NULL);

-- Dumping data for table nmscst_asset_db.cache: ~0 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('laravel-cache-58a529729abdfedf1f6a0f17c1ebdaf4', 'i:1;', 1782666341),
	('laravel-cache-58a529729abdfedf1f6a0f17c1ebdaf4:timer', 'i:1782666341;', 1782666341),
	('laravel-cache-788a18c127a768ccb92e3336d463f5a5', 'i:2;', 1782667164),
	('laravel-cache-788a18c127a768ccb92e3336d463f5a5:timer', 'i:1782667164;', 1782667164);

-- Dumping data for table nmscst_asset_db.cache_locks: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.categories: ~10 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Mobile Phone', 'Enim quis ut est consectetur esse et qui.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(2, 'Desktop PC', 'Earum debitis consectetur expedita beatae blanditiis doloribus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(3, 'Projector', 'Iusto ipsa quod hic quasi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(4, 'Firewall', 'Libero vel in quis numquam quia perspiciatis iste.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(5, 'Tablet', 'Corporis placeat eos consectetur repellendus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(6, 'IP Camera', 'Commodi occaecati sint quo consequuntur enim.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(7, 'Software License', 'Magnam deserunt enim nobis ipsa et reprehenderit totam.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(8, 'Server', 'Beatae omnis ad quasi odio fuga accusantium fugiat eligendi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(9, 'Laptop', 'Nihil facilis molestias nobis.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(10, 'UPS (Uninterruptible Power Supply)', 'Nobis vero sint harum quod eligendi cum error.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(11, 'Furniture', 'All types of Furnishes', '2026-06-28 23:53:57', '2026-06-28 23:54:19');

-- Dumping data for table nmscst_asset_db.failed_jobs: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.jobs: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.job_batches: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.location: ~10 rows (approximately)
INSERT INTO `location` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'Networking Hub', 'Asperiores est accusamus voluptatem dolores eligendi.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(2, 'Branch Office - Cebu', 'Eum cumque qui consequatur.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(3, 'Employee Lounge', 'Tempora nihil similique atque.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(4, 'Training Room', 'Voluptatibus consequatur consequatur voluptatibus et doloribus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(5, 'Annex Building - It Department', 'Quia hic quam neque ducimus aperiam corporis autem.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(6, 'Warehouse - Storage Area A', 'Ducimus qui hic accusantium rerum doloribus.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(7, 'Executive Suite', 'Accusamus nihil et delectus exercitationem.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(8, 'Conference Room 3', 'Eum debitis qui aliquid sit.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(9, 'Customer Service Center', 'Soluta voluptas facilis veritatis facilis officiis aut.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(10, 'Server Room - Ground Floor', 'Aut sequi ab architecto cupiditate aut minima aliquid esse.', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(11, 'Maasin City', 'Maasin City Southern Leyte', '2026-06-28 09:24:11', '2026-06-28 09:24:11');

-- Dumping data for table nmscst_asset_db.manufacturer: ~10 rows (approximately)
INSERT INTO `manufacturer` (`id`, `name`, `url`, `support_url`, `support_phone`, `support_email`, `created_at`, `updated_at`) VALUES
	(1, 'Wilderman, Pagac and Osinski', 'https://www.treutel.com/sequi-et-mollitia-velit-labore-illum-aut', 'http://lubowitz.com/', '+1-931-376-1465', 'tyler.rippin@example.net', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(2, 'Swift-Stehr', 'http://www.gaylord.com/laborum-eius-rem-est-quidem-in-id', 'http://www.kihn.com/', '872.230.0775', 'amara58@example.org', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(3, 'Rowe Inc', 'http://www.friesen.biz/accusantium-assumenda-voluptatem-quo-pariatur-dolorem-qui.html', 'http://littel.biz/et-dicta-vero-porro-ad-aperiam-molestias', '+1-820-440-9619', 'legros.wava@example.com', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(4, 'Torp, Brown and Connelly', 'http://www.toy.biz/', 'http://www.lemke.com/perspiciatis-voluptatem-nam-dolor-perferendis-beatae-aut', '+1.669.778.7910', 'goldner.rowena@example.org', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(5, 'Maggio Ltd', 'http://www.abbott.com/ut-hic-voluptatem-asperiores-quidem-ut-ut-aliquam-animi', 'http://www.kessler.com/quod-nihil-et-ipsa-cum-aspernatur-inventore', '+1.870.227.6896', 'antwon06@example.com', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(6, 'Bosco, Stehr and Morar', 'http://graham.org/assumenda-sapiente-quod-culpa-quos-dolor.html', 'http://www.donnelly.com/assumenda-ut-sequi-dolores-et.html', '+1-458-759-6470', 'qmohr@example.com', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(7, 'Sauer Inc', 'http://prohaska.net/architecto-quam-officiis-ex-provident-doloribus-dolorem.html', 'http://wiza.com/eligendi-laudantium-architecto-aut-animi-dolores-cum-voluptas-iure', '(765) 979-5952', 'mschroeder@example.net', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(8, 'Ernser-Wisoky', 'http://www.schneider.info/omnis-tenetur-dicta-dolor-vel-est-perferendis-et-velit.html', 'http://kunze.com/', '+1 (856) 913-0150', 'wyman62@example.org', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(9, 'Schamberger, Mohr and Lueilwitz', 'http://kulas.com/in-harum-at-fuga-illum.html', 'http://www.marks.org/quisquam-sunt-eos-excepturi-quaerat', '(682) 296-8160', 'brooks89@example.org', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(10, 'Mueller-Schulist', 'https://www.homenick.biz/modi-voluptatibus-nisi-iusto-commodi-repudiandae-sapiente-voluptas', 'http://abshire.com/qui-debitis-ipsum-eum-minima', '+1-678-599-0064', 'kemmer.viva@example.org', '2026-06-28 08:54:27', '2026-06-28 08:54:27');

-- Dumping data for table nmscst_asset_db.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
	(5, '2025_11_25_022437_add_role_to_user_table', 1),
	(6, '2025_11_25_030220_create_category_table', 1),
	(7, '2025_11_25_030906_create_manufacturer_table', 1),
	(8, '2025_11_25_031607_create_location_table', 1),
	(9, '2025_11_25_032402_create_asset_table', 1),
	(10, '2025_11_25_033931_relationship_to_asset_table', 1),
	(11, '2026_06_29_042109_create_personal_access_tokens_table', 2);

-- Dumping data for table nmscst_asset_db.password_reset_tokens: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.personal_access_tokens: ~0 rows (approximately)

-- Dumping data for table nmscst_asset_db.sessions: ~0 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('gtA2wj13AR8bhctwXjA2qhay6dfcJOb4drerTPJy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlMySE5EYWZjTVZBVG1URjl1Q2tUSk5KdmVISHo1b2FacXR1NXB3eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9fQ==', 1782739264);

-- Dumping data for table nmscst_asset_db.users: ~10 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Japheth Simbajon', 'simbajonjapheth@gmail.com', 'admin', '2026-06-28 08:54:26', '$2y$12$vbGBAovP9iQzeZz4gk79LuSe1iT35LI8tUIHmzdOj5ZMNBwAm0Q4G', NULL, NULL, NULL, 'TDiWG9nkgOO5IZVRGZJmZduOLpxPlVNc7mF2Xu8mFwp0VMwq9YAvgtiDb7lw', '2026-06-28 08:54:27', '2026-06-28 09:40:43'),
	(2, 'Albina Abshire', 'therese.pacocha@example.net', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', '3NvsxR3nwi', 'XwkQyoBnVp', '2026-06-28 08:54:27', 'zlMLRK43dF', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(3, 'Myrna Kutch V', 'royal.renner@example.net', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'GbdLIuebD3', 'KhdRAKNDEk', '2026-06-28 08:54:27', 'FjTM8Js34a', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(4, 'Brook Price', 'flatley.tracey@example.com', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'TJ4B7gL1Vk', 'YknBQywWYO', '2026-06-28 08:54:27', 'mEtBHqFX8g', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(5, 'Mr. Samir Bahringer Sr.', 'bettie.bruen@example.net', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'CrPZRbYfM8', 'gb09cui8lY', '2026-06-28 08:54:27', 'CvjG5XT0Tl', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(6, 'Alek Oberbrunner', 'pascale.marks@example.org', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'Yw65B3rgw7', 'wFTyUrIq6I', '2026-06-28 08:54:27', '7CLyvXz7my', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(7, 'Prof. Jennifer Effertz', 'nader.amir@example.org', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', '0OdeJIHKSl', '8Fi0ak61pt', '2026-06-28 08:54:27', 'HmVvfyqXxY', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(8, 'Gertrude Schimmel', 'etromp@example.org', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', '80CuokAooV', 'v5A3CJnBao', '2026-06-28 08:54:27', 'iJl7TLlUii', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(9, 'Dr. Bill O\'Keefe Jr.', 'anastasia.toy@example.net', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'CKamAkzIl9', 'dgKzttKUw9', '2026-06-28 08:54:27', 'la2W2fPcmn', '2026-06-28 08:54:27', '2026-06-28 08:54:27'),
	(10, 'Mariela Brekke II', 'green01@example.net', 'inventory_user', '2026-06-28 08:54:27', '$2y$12$YincDxuivWXEfyS92m7vFukWOvFOMPv0wIKFBubk67o8H2qiwLdS2', 'OW70rWPab3', 'OG79nJ6rhM', '2026-06-28 08:54:27', '9t93SQr9Py', '2026-06-28 08:54:27', '2026-06-28 08:54:27');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
