-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: productsdb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `auditor_name` varchar(255) DEFAULT NULL,
  `audit_date` date DEFAULT NULL,
  `audit_time` time DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `audits_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`products_id`),
  CONSTRAINT `audits_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (77,14,1,'John Doe','2024-07-06','05:00:00'),(78,2,23,'Jane Saidoh','2024-07-06','10:05:03'),(79,13,23,'Joseph Murumbi','2024-07-06','12:34:23'),(80,11,12,'Mary Muthoni','2024-07-06','15:04:34'),(81,22,22,'Musa Pinto','2024-07-06','18:45:32'),(82,1,2,'Ramogi Achieng','2024-07-06','19:34:32'),(83,1,1,'Stanley Mathenge','2024-07-07','07:56:01'),(84,21,2,'Musa Mboya','2024-07-07','07:34:56'),(85,33,3,'Waruhiu Itote','2024-07-07','09:00:23'),(86,1,23,'Cyrus Karanja','2024-07-07','09:10:50'),(87,2,2,'John Doe','2024-07-07','10:56:56'),(88,23,3,'Alice Johnson','2024-07-07','11:03:00'),(89,23,25,'John Doe','2024-07-07','11:03:00'),(90,21,2,'Martin Shikuku','2024-07-07','16:34:23'),(91,17,23,'Alice Johnson','2024-07-07','17:00:00'),(92,1,1,'Wambui Otieno','2024-07-07','18:56:00'),(93,2,22,'Cyrus Jirongo','2024-07-08','08:34:23'),(94,1,3,'Alice Johnson','2024-07-08','08:56:00'),(95,12,12,'John Doe','2024-07-08','10:12:00');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `quality_rank` int DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `products_id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category` varchar(100) DEFAULT NULL,
  `segment` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `description` text,
  `package_type` varchar(50) DEFAULT NULL,
  `package_size` varchar(50) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2024-07-09 09:13:30','2024-07-10 08:47:38','Energy Drink','Energy Drink','Khazaal Industries','3x Energy','3x Energy 330ml can Khazaal Industries','Can','330Ml',NULL,'cb77f8e27cf5',NULL),(2,'2024-07-09 09:15:13','2024-07-10 08:47:39','Energy Drink','Energy Drink','Khazaal Industries','3x Energy','3x Energy 330ml can Khazaal Industries','Can','330Ml',NULL,'cb77f8e27cf5',NULL),(3,'2024-07-09 09:19:51','2024-07-10 10:40:42','Beverage','Soft Drinks','Coca-Cola','Coke','3x Energy 330ml can Khazaal Industries','Can','330 ml',NULL,'5d57b843dc5c',NULL),(4,'2024-07-09 09:19:51','2024-07-10 10:05:25','Toothpaste','Oral Care','Pepsodent','Pepsodent Charcoal','Pepsodent Cavity Charcoal 130g','Tube','130g',NULL,'4c9d0e00be6e',NULL),(5,'2024-07-09 09:19:51','2024-07-10 10:40:42','Toothpaste','Oral Care','Colgate','Colgate MaxFresh','3x Energy 330ml can Khazaal Industries','Tube','100g',NULL,'51c8ffc429c0',NULL),(6,'2024-07-09 09:19:51','2024-07-10 10:05:25','Toothpaste','Oral Care','Pepsodent','Pepsodent Charcoal','Pepsodent Cavity Charcoal 130g','Tube','130g',NULL,'f0ef13427209',NULL),(7,'2024-07-09 09:19:51','2024-07-10 08:47:39','Toothpaste','Oral Care','Pepsodent','Pepsodent Charcoal','Pepsodent Cavity Charcoal 130g','Tube','130g',NULL,'4bae997b94d2',NULL),(8,'2024-07-09 09:19:51','2024-07-10 10:05:25','Toothpaste','Oral Care','Pepsodent','Pepsodent Charcoal','Pepsodent Cavity Charcoal 130g','Tube','130g',NULL,'d09d6bfac586',NULL),(9,'2024-07-09 09:23:43','2024-07-10 08:47:39','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'856adea12555',NULL),(10,'2024-07-09 09:23:43','2024-07-10 10:05:25','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'10d0f23b1d3c',NULL),(11,'2024-07-09 09:23:43','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','Fanta','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'cc67ceebb34a',NULL),(12,'2024-07-09 09:23:43','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','Fanta','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'fe8a35302da3',NULL),(13,'2024-07-09 09:23:43','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','Fanta','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'b53279095e76',NULL),(14,'2024-07-09 09:23:43','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','Fanta','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'9f317f1ab94c',NULL),(15,'2024-07-09 09:42:55','2024-07-10 08:47:39','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'856adea12555',NULL),(16,'2024-07-09 09:42:55','2024-07-10 10:05:25','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'10d0f23b1d3c',NULL),(17,'2024-07-09 09:42:55','2024-07-10 08:47:39','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'31758e9e4233',NULL),(18,'2024-07-09 09:42:55','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'9305c469eadd',NULL),(19,'2024-07-09 09:42:55','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'deb8b8d32a86',NULL),(20,'2024-07-09 09:42:55','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'674171749de0',NULL),(21,'2024-07-09 09:42:55','2024-07-10 10:40:42','Toilet Soap','Solid Toilet Soap','Unilever','Rexona','3x Energy 330ml can Khazaal Industries','Wrapped','175g',NULL,'72be67443770',NULL),(22,'2024-07-09 09:42:55','2024-07-10 08:47:39','Infant Nutrition','Infant Cereals','Nestle','Cerelac','Cerelac 6 Months Wheat 50g','Sachet','50g',NULL,'4064c722fefb',NULL),(23,'2024-07-09 09:42:55','2024-07-10 10:40:42','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','3x Energy 330ml can Khazaal Industries','Can','330ml',NULL,'1f4199da155e',NULL),(24,'2024-07-09 09:43:08','2024-07-10 08:47:39','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'856adea12555',NULL),(25,'2024-07-09 09:43:08','2024-07-10 10:05:25','Toothpaste','Gel Toothpaste','Unilever','Close Up','Close Up Deep Action 12hrs fresh breath menthol fresh gel 10g sachet unilever','Sachet','10g',NULL,'10d0f23b1d3c',NULL),(26,'2024-07-09 09:43:08','2024-07-10 08:47:39','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'31758e9e4233',NULL),(27,'2024-07-09 09:43:08','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','300ml',NULL,'9305c469eadd',NULL),(28,'2024-07-09 09:43:08','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'deb8b8d32a86',NULL),(29,'2024-07-09 09:43:08','2024-07-10 10:05:25','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','Coke Apple 300ml Plastic Bottle The coca cola company','Plastic Bottle','500ml',NULL,'674171749de0',NULL),(30,'2024-07-09 09:43:08','2024-07-10 10:40:42','Toilet Soap','Solid Toilet Soap','Unilever','Rexona','3x Energy 330ml can Khazaal Industries','Wrapped','175g',NULL,'72be67443770',NULL),(31,'2024-07-09 09:43:08','2024-07-10 08:47:39','Infant Nutrition','Infant Cereals','Nestle','Cerelac','Cerelac 6 Months Wheat 50g','Sachet','50g',NULL,'4064c722fefb',NULL),(32,'2024-07-09 09:43:08','2024-07-10 10:40:42','Soft Drink Beverage','Carbonated Soft Drink','The Coca Cola Company','CocaCola','3x Energy 330ml can Khazaal Industries','Can','330ml',NULL,'1f4199da155e',NULL),(33,'2024-07-09 09:43:08','2024-07-10 10:40:42','Laundry Detergent','Powder Laundry Detergent','Unilever','Omo','3x Energy 330ml can Khazaal Industries','Sachet','500g','https://images.app.goo.gl/pbtFi8GqqVG7dQ7c6.jpg','db0d7b9f4844',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_products`
--

DROP TABLE IF EXISTS `store_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `store_products_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `store_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_products`
--

LOCK TABLES `store_products` WRITE;
/*!40000 ALTER TABLE `store_products` DISABLE KEYS */;
INSERT INTO `store_products` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,1),(5,3,4),(6,1,23),(7,4,2),(8,12,13),(9,14,2),(10,1,23),(11,4,22),(12,1,23),(13,4,2),(14,11,23),(15,14,2),(16,12,23),(17,10,2),(18,9,23),(19,19,2),(20,12,23),(21,14,2),(22,8,23),(23,4,2),(24,11,23),(25,12,2);
/*!40000 ALTER TABLE `store_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Soko Ndogo','Kayole, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(2,'Eastmatt','Umoja, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(3,'Muhindi Mweusi','Chokaa, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(4,'Carrefour','Ngong Rd, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(5,'Eastmatt','Kileleshwa, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(6,'Muhindi Mweusi','CBD, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(7,'Naivas','Kilimani, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(8,'Panda Matt','Umoja, Nakuru','2024-07-09 09:55:36','2024-07-09 09:55:36'),(9,'Muhindi Mweusi','Chokaa, Nakuru','2024-07-09 09:55:36','2024-07-09 09:55:36'),(10,'Carrefour','CBD, Nakuru','2024-07-09 09:55:36','2024-07-09 09:55:36'),(11,'Eastmatt','Stage, Kisumu','2024-07-09 09:55:36','2024-07-09 09:55:36'),(12,'East Matt','Chokaa, Nakuru','2024-07-09 09:55:36','2024-07-09 09:55:36'),(13,'Gilanus','Kayole, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(14,'Frankmatt','Buruburu, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(15,'Naivas','Karen, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(16,'Faraji Mini Mart','Jogoo Rd, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(17,'Magunas','Kahawa Wendani, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(18,'Magunas','Chokaa, Nakuru','2024-07-09 09:55:36','2024-07-09 09:55:36'),(19,'Soko Ndogo','Kibera, Kisumu','2024-07-09 09:55:36','2024-07-09 09:55:36'),(20,'Eastmatt','Umoja, Kisumu','2024-07-09 09:55:36','2024-07-09 09:55:36'),(21,'Quickmart','Kilimani, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(22,'Quickmart','Kayole, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(23,'Quickmart','Umoja, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(24,'Ukwala','Chokaa, Kisumu','2024-07-09 09:55:36','2024-07-09 09:55:36'),(25,'Raiya Supermarket','Kahawa West, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(26,'Naivas Kubwa','CBD, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36'),(27,'Pattmat','Valley Rd, Nairobi','2024-07-09 09:55:36','2024-07-09 09:55:36');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10 14:19:15
