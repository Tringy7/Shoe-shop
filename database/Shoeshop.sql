-- Data test
-- admin : admin@gmail.com
-- user : user@gmail.com
-- pass : 123456

--------------------------------- Database -------------------------
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: Shoeshop
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint DEFAULT NULL,
  `size_product` varchar(255) DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkcochhsa891wv0s9wrtf36wgt` (`cart_id`),
  KEY `FK9rlic3aynl3g75jvedkx84lhv` (`product_id`),
  CONSTRAINT `FK9rlic3aynl3g75jvedkx84lhv` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKkcochhsa891wv0s9wrtf36wgt` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` bigint DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` bigint DEFAULT NULL,
  `size_product` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` bigint DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `sold` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkjg5lmvxecaopqrai3u0v8j3i` (`product_id`),
  CONSTRAINT `FKkjg5lmvxecaopqrai3u0v8j3i` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (8,94,'S',6,3),(10,2993,'L',7,3),(12,97,'M',3,4),(13,230,'L',10,4),(14,50,'S',0,5),(15,200,'M',0,5),(16,96,'L',4,5),(17,200,'S',0,6),(18,500,'M',0,6),(20,200,'S',0,7),(21,400,'M',0,7),(22,20,'L',0,7),(23,50,'S',0,8),(24,20,'M',0,8),(25,30,'L',0,8),(26,100,'S',0,10),(27,100,'M',0,10),(29,200,'S',0,11),(30,20,'M',0,11),(31,400,'L',0,11);
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `detail_desc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Nike','White','Comfortable, durable and timeless—it\'s number one for a reason. The classic \'80s construction pairs durable leather with bold details for style that tracks whether you\'re on court or on the go.','1753520144452-product1.jpg','Nike Air Force 1 \'07 LV8',3519000),(4,'Nike','White','Quicker than 1, 2, 3—the original hoops shoe lets you get going. This version of the AF-1 features Nike EasyOn technology for a hands-free experience. The flexible heel collapses when you step in then snaps back into place, making it easy to slip the shoe on and off. Add that to its clean, crisp leather and you\'ve got ultimate wearability. Yeah, it\'s everything you love and then some.','1753522532656-product2.jpg','Nike Air Force 1 \'07 EasyOn',3239000),(5,'Nike','Black','These AF-1s are all about the details. Customise your label, laces and dubrae, and don\'t forget to leave your mark with personal text on the backtab. Between 8 colour choices and additional translucent and gum rubber options for the sole, this design is destined to be one of a kind—just like you.','1753522607411-product3.jpg','Nike Air Force 1 Mid By You',4109000),(6,'Nike','Black','Comfortable, durable and timeless—it\'s number 1 for a reason. The classic \'80s construction pairs with bold details for style that tracks whether you\'re on court or on the go.\r\n\r\n','1753522708741-product4.jpg','Nike Air Force 1 Low Retro',3829000),(7,'Adidas','Orange','The Adidas Handball Spezial Green isn’t just a shoe – it’s a statement. Stylish, comfy, and nostalgic in all the right ways. Whether you’re a sneakerhead or just someone who values a clean, classic look, this pair belongs in your rotation','1753522863029-product5.jpg','Handball Spezial',2500000),(8,'Adidas','Blue','These are a great leisure shoe, the colour is great. Brings back memories! I would recommend them as a leisure shoe as per the design. It is weird not having an arch support hence not designed for sports.','1753522955266-product6.jpg','GRAND COURT BASE 00s',1900000),(10,'Adidas','Red','Great shoes, cool and unique design along with a cool color. I have wider feet and usually shoes are tight around my toes but this sneaker fits extremely well. The only problem for me is that the soles can absorb a lot of heat from the ground and my feet can heat up a bit.','1753523058377-product7.jpg','Gazelle Indoor',2900000),(11,'Adidas','Black','Very nice looking shoe. It is comfortable and the leather is soft and feels great','1753523201275-product8.jpg','Italia 70s',2500000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'MANAGE','ADMIN'),(2,'USER','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('16909968-459d-41d5-bdc2-e38fe95ddb5c','fe1233c4-a373-4af4-9aa5-79cee260f40b',1754033114883,1754033115707,1800,1754034915707,NULL),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','8fff3e29-c53b-4d19-9c4c-9734ecc4e25c',1753798301784,1753884189264,2592000,1756476189264,'user@gmail.com'),('20971797-af95-490a-a208-51b2d73d6b9d','93be9abb-31a1-498a-a48a-43f4c3237d9a',1753698018580,1753698024294,2592000,1756290024294,'admin@gmail.com'),('aa3f12e3-4648-49ee-9030-d78636e02728','c4fed7eb-b2e6-4233-ada8-df4ed19bf251',1753765026878,1753765486110,2592000,1756357486110,'user@gmail.com'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','4585a7ef-ab84-40bb-ab46-d73f24e7c419',1753701827313,1753702191645,2592000,1756294191645,'user@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('16909968-459d-41d5-bdc2-e38fe95ddb5c','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$721d57ec-822c-4b23-b7ca-7fbc7de4da7a'),('16909968-459d-41d5-bdc2-e38fe95ddb5c','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00ZmUxMjMzYzQtYTM3My00YWY0LTlhYTUtNzljZWUyNjBmNDBixsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0text/css,*/*;q=0.1xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\08vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=ZmUxMjMzYzQtYTM3My00YWY0LTlhYTUtNzljZWUyNjBmNDBixt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0\"http://localhost:8080/login?logoutxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Not)A;Brand\";v=\"8\", \"Chromium\";v=\"138\", \"Google Chrome\";v=\"138\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0stylext\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0VNq\0~\0t\0viq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0?q\0~\0q\0~\0xsq\0~\0<����t\0FRq\0~\0t\0frq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Cq\0~\0q\0~\0xsq\0~\0<����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Gq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0!/assets/css/perfect-scrollbar.csst\06http://localhost:8080/assets/css/perfect-scrollbar.csst\0httpt\0	localhostt\0!/assets/css/perfect-scrollbar.css'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$7ec34c14-be3c-4732-9d77-4cbe766fa15d'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$9c32784c-7710-4913-b159-d7f669998619psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00OWMzMjc4NGMtNzcxMC00OTEzLWIxNTktZDdmNjY5OTk4NjE5xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0*/*xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\08vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=OWMzMjc4NGMtNzcxMC00OTEzLWIxNTktZDdmNjY5OTk4NjE5xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0\"http://localhost:8080/login?logoutxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Not)A;Brand\";v=\"8\", \"Chromium\";v=\"138\", \"Google Chrome\";v=\"138\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0scriptxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0VNq\0~\0t\0viq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0?q\0~\0q\0~\0xsq\0~\0<����t\0FRq\0~\0t\0frq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Cq\0~\0q\0~\0xsq\0~\0<����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Gq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/assets/js/navbar-collapse.jst\02http://localhost:8080/assets/js/navbar-collapse.jst\0httpt\0	localhostt\0/assets/js/navbar-collapse.js'),('1e067cb3-5006-4a66-9a92-9496cb87b4ba','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('20971797-af95-490a-a208-51b2d73d6b9d','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$e01ff862-b8aa-441c-94ad-11653f760874psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('20971797-af95-490a-a208-51b2d73d6b9d','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00ZTAxZmY4NjItYjhhYS00NDFjLTk0YWQtMTE2NTNmNzYwODc0xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0text/css,*/*;q=0.1xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0,vi,fr-FR;q=0.9,fr;q=0.8,en-US;q=0.7,en;q=0.6xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=ZTAxZmY4NjItYjhhYS00NDFjLTk0YWQtMTE2NTNmNzYwODc0xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0\"http://localhost:8080/login?logoutxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Not)A;Brand\";v=\"8\", \"Chromium\";v=\"138\", \"Google Chrome\";v=\"138\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0stylext\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����q\0~\0q\0~\0t\0viq\0~\0q\0~\0xsq\0~\0<����t\0FRq\0~\0t\0frq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Aq\0~\0q\0~\0xsq\0~\0<����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Eq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0!/assets/css/perfect-scrollbar.csst\06http://localhost:8080/assets/css/perfect-scrollbar.csst\0httpt\0	localhostt\0!/assets/css/perfect-scrollbar.css'),('aa3f12e3-4648-49ee-9030-d78636e02728','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('aa3f12e3-4648-49ee-9030-d78636e02728','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$3323ef9c-06d8-44d7-84d7-753ffa83776bpsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('aa3f12e3-4648-49ee-9030-d78636e02728','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00YzMwYTM2ZGUtMjZmZi00MzQ2LWI3N2EtZTRmMGRjMWE4ODFlxsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0*/*xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\08vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=YzMwYTM2ZGUtMjZmZi00MzQ2LWI3N2EtZTRmMGRjMWE4ODFlxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0\"http://localhost:8080/login?logoutxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Not)A;Brand\";v=\"8\", \"Chromium\";v=\"138\", \"Google Chrome\";v=\"138\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0scriptxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0VNq\0~\0t\0viq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0?q\0~\0q\0~\0xsq\0~\0<����t\0FRq\0~\0t\0frq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Cq\0~\0q\0~\0xsq\0~\0<����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0Gq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/assets/js/navbar-collapse.jst\02http://localhost:8080/assets/js/navbar-collapse.jst\0httpt\0	localhostt\0/assets/js/navbar-collapse.js'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$fdbef23a-c6b1-4a0e-b729-742df7932d97'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$3b34a403-aed3-412f-a6fa-eda36e025011psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0\nJSESSIONIDpt\0 DBDC428380BEC32EDFEBA2BA0EDD792Csq\0~\0����\0\0\0\0\0ppt\0SESSIONpt\00M2IzNGE0MDMtYWVkMy00MTJmLWE2ZmEtZWRhMzZlMDI1MDExxsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0text/css,*/*;q=0.1xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0vi,en-US;q=0.9,en;q=0.8xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\0eJSESSIONID=DBDC428380BEC32EDFEBA2BA0EDD792C; SESSION=M2IzNGE0MDMtYWVkMy00MTJmLWE2ZmEtZWRhMzZlMDI1MDExxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\0http://localhost:8080/loginxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Not)A;Brand\";v=\"8\", \"Chromium\";v=\"138\", \"Microsoft Edge\";v=\"138\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0stylext\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0}Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����q\0~\0q\0~\0t\0viq\0~\0q\0~\0xsq\0~\0?����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0?����q\0~\0q\0~\0q\0~\0Dq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0!/assets/css/perfect-scrollbar.csst\06http://localhost:8080/assets/css/perfect-scrollbar.csst\0httpt\0	localhostt\0!/assets/css/perfect-scrollbar.css'),('f4ac3d57-e657-428f-b2bf-847bb3109eb2','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'123 nVs','1753671053662-Screenshot 2025-06-24 090506.png','user@gmail.com','Nguyễn Hữu Trí','$2a$10$VjSWgR/UAjmHgRAfVw0Ze.rYmjsHfRYg430h8DcbY6acvDQgKiLGi','0346500557',2),(2,'123 nVs','1753671065240-MCK.png','admin@gmail.com','Nguyễn Hữu Trí','$2a$10$8I4.2eN566Axa0fHslbIS.pLfT//HkQyMbclnXzpz41sAw77PY.xm','0346500557',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-01 14:33:12
