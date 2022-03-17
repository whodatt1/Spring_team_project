CREATE TABLE `auth_member` (
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `auth` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'ROLE_USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `cart` (
  `cno` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `gno` bigint NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `gname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `goods_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `total_price` bigint NOT NULL,
  `purchase_count` int NOT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `goods` (
  `gno` bigint NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `kinds` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mod_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_count` bigint DEFAULT '0',
  `price` bigint NOT NULL,
  `goods_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `cmt_qty` int DEFAULT '0',
  PRIMARY KEY (`gno`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `goods_file` (
  `uuid` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `save_dir` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(512) COLLATE utf8mb4_general_ci NOT NULL,
  `file_type` tinyint(1) DEFAULT '0',
  `gno` bigint DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `goods_review` (
  `grno` bigint NOT NULL AUTO_INCREMENT,
  `gno` bigint NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `score` int NOT NULL,
  `mod_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`grno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `m_char` (
  `chno` bigint NOT NULL AUTO_INCREMENT,
  `mno` bigint NOT NULL,
  `character_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`chno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `media` (
  `mno` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `movie` tinyint(1) NOT NULL,
  `read_count` bigint DEFAULT '0',
  `opening_year` int NOT NULL,
  `media` text COLLATE utf8mb4_general_ci,
  `age_limit` int NOT NULL,
  `poster_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `bg_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `description2` text COLLATE utf8mb4_general_ci NOT NULL,
  `director` text COLLATE utf8mb4_general_ci NOT NULL,
  `actor` text COLLATE utf8mb4_general_ci NOT NULL,
  `season` int DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `media_file` (
  `uuid` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `save_dir` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(512) COLLATE utf8mb4_general_ci NOT NULL,
  `file_type` tinyint(1) DEFAULT '0',
  `mno` bigint DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `member` (
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pwd` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `grade` tinyint DEFAULT '10',
  `reg_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `profile_limit` tinyint DEFAULT '4',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `profile` (
  `pno` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pin` int DEFAULT NULL,
  `icon` text COLLATE utf8mb4_general_ci NOT NULL,
  `kids` int NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `review` (
  `rno` bigint NOT NULL AUTO_INCREMENT,
  `mno` bigint NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `score` int NOT NULL,
  `mod_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `season` (
  `sno` bigint NOT NULL AUTO_INCREMENT,
  `mno` bigint NOT NULL,
  `media` text COLLATE utf8mb4_general_ci,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `season` int NOT NULL,
  `thumbnail` text COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `watch_list` (
  `wno` bigint NOT NULL AUTO_INCREMENT,
  `mno` bigint NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `poster_img` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`wno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci