/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `Banner` (
  `ma_banner` int NOT NULL AUTO_INCREMENT,
  `ma_phim` int NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_banner`),
  KEY `ma_phim` (`ma_phim`),
  CONSTRAINT `Banner_ibfk_1` FOREIGN KEY (`ma_phim`) REFERENCES `Phim` (`ma_phim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `CumRap` (
  `ma_cum_rap` int NOT NULL AUTO_INCREMENT,
  `ten_cum_rap` varchar(200) NOT NULL,
  `dia_chi` varchar(200) NOT NULL,
  `ma_he_thong_rap` int NOT NULL,
  PRIMARY KEY (`ma_cum_rap`),
  KEY `ma_he_thong_rap` (`ma_he_thong_rap`),
  CONSTRAINT `CumRap_ibfk_1` FOREIGN KEY (`ma_he_thong_rap`) REFERENCES `HeThongRap` (`ma_he_thong_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DatVe` (
  `ma_dat_ve` int NOT NULL AUTO_INCREMENT,
  `tai_khoan` int NOT NULL,
  `ma_lich_chieu` int NOT NULL,
  `ma_ghe` int NOT NULL,
  PRIMARY KEY (`ma_dat_ve`),
  KEY `tai_khoan` (`tai_khoan`),
  KEY `ma_lich_chieu` (`ma_lich_chieu`),
  KEY `ma_ghe` (`ma_ghe`),
  CONSTRAINT `DatVe_ibfk_1` FOREIGN KEY (`tai_khoan`) REFERENCES `NguoiDung` (`tai_khoan`),
  CONSTRAINT `DatVe_ibfk_2` FOREIGN KEY (`ma_lich_chieu`) REFERENCES `LichChieu` (`ma_lich_chieu`),
  CONSTRAINT `DatVe_ibfk_3` FOREIGN KEY (`ma_ghe`) REFERENCES `Ghe` (`ma_ghe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Ghe` (
  `ma_ghe` int NOT NULL AUTO_INCREMENT,
  `ten_ghe` varchar(100) NOT NULL,
  `loai_ghe` varchar(100) NOT NULL,
  `ma_rap` int DEFAULT NULL,
  PRIMARY KEY (`ma_ghe`),
  KEY `ma_rap` (`ma_rap`),
  CONSTRAINT `Ghe_ibfk_1` FOREIGN KEY (`ma_rap`) REFERENCES `RapPhim` (`ma_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `HeThongRap` (
  `ma_he_thong_rap` int NOT NULL AUTO_INCREMENT,
  `ten_he_thong_rap` varchar(255) NOT NULL,
  `logo` varchar(200) NOT NULL,
  PRIMARY KEY (`ma_he_thong_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `LichChieu` (
  `ma_lich_chieu` int NOT NULL AUTO_INCREMENT,
  `ma_rap` int NOT NULL,
  `ma_phim` int NOT NULL,
  `ngay_gio_chieu` datetime DEFAULT NULL,
  `gia_ve` int NOT NULL,
  PRIMARY KEY (`ma_lich_chieu`),
  KEY `ma_rap` (`ma_rap`),
  KEY `ma_phim` (`ma_phim`),
  CONSTRAINT `LichChieu_ibfk_1` FOREIGN KEY (`ma_rap`) REFERENCES `RapPhim` (`ma_rap`),
  CONSTRAINT `LichChieu_ibfk_2` FOREIGN KEY (`ma_phim`) REFERENCES `Phim` (`ma_phim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `NguoiDung` (
  `tai_khoan` int NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `so_dt` varchar(50) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `loai_nguoi_dung` varchar(200) NOT NULL,
  PRIMARY KEY (`tai_khoan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Phim` (
  `ma_phim` int NOT NULL AUTO_INCREMENT,
  `ten_phim` varchar(200) NOT NULL,
  `trailer` varchar(200) NOT NULL,
  `hinh_anh` varchar(200) NOT NULL,
  `mo_ta` varchar(200) NOT NULL,
  `ngay_khoi_chieu` datetime NOT NULL,
  `danh_gia` int NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `dang_chieu` tinyint(1) NOT NULL,
  `sap_chieu` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_phim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `RapPhim` (
  `ma_rap` int NOT NULL AUTO_INCREMENT,
  `ten_rap` varchar(255) NOT NULL,
  `ma_cum_rap` int NOT NULL,
  PRIMARY KEY (`ma_rap`),
  KEY `ma_cum_rap` (`ma_cum_rap`),
  CONSTRAINT `RapPhim_ibfk_1` FOREIGN KEY (`ma_cum_rap`) REFERENCES `CumRap` (`ma_cum_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Banner` (`ma_banner`, `ma_phim`, `hinh_anh`) VALUES
(1, 1, 'banner1.jpg');
INSERT INTO `Banner` (`ma_banner`, `ma_phim`, `hinh_anh`) VALUES
(2, 2, 'banner2.jpg');
INSERT INTO `Banner` (`ma_banner`, `ma_phim`, `hinh_anh`) VALUES
(3, 3, 'banner3.jpg');
INSERT INTO `Banner` (`ma_banner`, `ma_phim`, `hinh_anh`) VALUES
(4, 4, 'banner4.jpg'),
(5, 5, 'banner5.jpg'),
(6, 6, 'banner6.jpg');

INSERT INTO `CumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(1, 'Quận 1', 'Địa chỉ 1', 1);
INSERT INTO `CumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(2, 'Quận 2', 'Địa chỉ 2', 2);
INSERT INTO `CumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(3, 'Quận 3', 'Địa chỉ 3', 3);
INSERT INTO `CumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(4, 'Quận 4', 'Địa chỉ 4', 4),
(5, 'Quận 5', 'Địa chỉ 5', 5);

INSERT INTO `DatVe` (`ma_dat_ve`, `tai_khoan`, `ma_lich_chieu`, `ma_ghe`) VALUES
(1, 1, 1, 1);
INSERT INTO `DatVe` (`ma_dat_ve`, `tai_khoan`, `ma_lich_chieu`, `ma_ghe`) VALUES
(2, 1, 1, 2);
INSERT INTO `DatVe` (`ma_dat_ve`, `tai_khoan`, `ma_lich_chieu`, `ma_ghe`) VALUES
(3, 2, 2, 3);
INSERT INTO `DatVe` (`ma_dat_ve`, `tai_khoan`, `ma_lich_chieu`, `ma_ghe`) VALUES
(4, 2, 2, 4),
(5, 3, 3, 5),
(6, 3, 3, 6),
(7, 4, 4, 7),
(8, 4, 4, 8),
(9, 5, 5, 9),
(10, 5, 5, 10);

INSERT INTO `Ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(1, 'Ghế A1', 'Ghế thường', 1);
INSERT INTO `Ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(2, 'Ghế A2', 'Ghế thường', 1);
INSERT INTO `Ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(3, 'Ghế B1', 'Ghế VIP', 2);
INSERT INTO `Ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(4, 'Ghế B2', 'Ghế VIP', 2),
(5, 'Ghế C1', 'Ghế thường', 3),
(6, 'Ghế C2', 'Ghế thường', 3),
(7, 'Ghế D1', 'Ghế VIP', 4),
(8, 'Ghế D2', 'Ghế VIP', 4),
(9, 'Ghế E1', 'Ghế thường', 5),
(10, 'Ghế E2', 'Ghế thường', 5),
(11, 'Ghế F1', 'Ghế VIP', 3),
(12, 'Ghế F2', 'Ghế VIP', 2);

INSERT INTO `HeThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(1, 'Hệ thống CGV', 'logo1.jpg');
INSERT INTO `HeThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(2, 'Hệ thống GALAXY', 'logo2.jpg');
INSERT INTO `HeThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(3, 'Hệ thống Beta', 'logo3.jpg');
INSERT INTO `HeThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(4, 'Hệ thống Lotteria', 'logo4.jpg'),
(5, 'Hệ thống BHD', 'logo5.jpg');

INSERT INTO `LichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`) VALUES
(1, 1, 1, '2023-10-25 10:00:00', 100000);
INSERT INTO `LichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`) VALUES
(2, 2, 2, '2023-10-26 12:00:00', 120000);
INSERT INTO `LichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`) VALUES
(3, 3, 3, '2023-10-27 14:00:00', 150000);
INSERT INTO `LichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`) VALUES
(4, 4, 4, '2023-10-28 16:00:00', 130000),
(5, 5, 5, '2023-10-29 18:00:00', 110000),
(6, 1, 6, '2023-10-30 20:00:00', 160000);

INSERT INTO `NguoiDung` (`tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(1, 'Người dùng 1', 'user1@example.com', '1234567890', 'password1', 'admin');
INSERT INTO `NguoiDung` (`tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(2, 'Người dùng 2', 'user2@example.com', '0987654321', 'password2', 'admin');
INSERT INTO `NguoiDung` (`tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(3, 'Người dùng 3', 'user3@example.com', '0932432323', 'password3', 'guest');
INSERT INTO `NguoiDung` (`tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(4, 'Người dùng 4', 'user4@example.com', '0983443341', 'password4', 'guest'),
(5, 'Người dùng 5', 'user5@example.com', '0987244321', 'password5', 'admin'),
(6, 'Người dùng 6', 'user6@example.com', '0982432333', 'password6', 'guest'),
(7, 'Người dùng 7', 'user7@example.com', '0383244324', 'password7', 'guest'),
(8, 'Người dùng 8', 'user8@example.com', '0487234342', 'password8', 'guest'),
(9, 'Người dùng 9', 'user9@example.com', '0947652343', 'password9', 'guest'),
(10, 'Người dùng 10', 'user10@example.com', '9876543210', 'password10', 'admin');

INSERT INTO `Phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`, `createdAt`, `updatedAt`) VALUES
(1, 'Người nhện', 'trailer1.mp4', 'image1.jpg', 'Mô tả phim 1', '2023-10-25 10:00:00', 4, 1, 1, 0, '2024-04-06 08:34:58', '2024-04-06 08:34:58');
INSERT INTO `Phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`, `createdAt`, `updatedAt`) VALUES
(2, 'Người dơi', 'trailer2.mp4', 'image2.jpg', 'Mô tả phim 2', '2023-10-26 10:00:00', 5, 1, 0, 1, '2024-04-06 08:34:58', '2024-04-06 08:34:58');
INSERT INTO `Phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`, `createdAt`, `updatedAt`) VALUES
(3, 'Người kiến', 'trailer3.mp4', 'image3.jpg', 'Mô tả phim 3', '2023-10-26 10:00:00', 5, 1, 1, 1, '2024-04-06 08:34:58', '2024-04-06 08:34:58');
INSERT INTO `Phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`, `createdAt`, `updatedAt`) VALUES
(4, 'Người cá', 'trailer4.mp4', 'image4.jpg', 'Mô tả phim 4', '2023-10-26 10:00:00', 3, 1, 1, 1, '2024-04-06 08:34:58', '2024-04-06 08:34:58'),
(5, 'Người hùng', 'trailer5.mp4', 'image5.jpg', 'Mô tả phim 5', '2023-10-26 10:00:00', 4, 1, 0, 1, '2024-04-06 08:34:58', '2024-04-06 08:34:58'),
(6, 'Người nghèo', 'trailer6.mp4', 'image6.jpg', 'Mô tả phim 6', '2023-10-26 10:00:00', 5, 1, 1, 1, '2024-04-06 08:34:58', '2024-04-06 08:34:58');

INSERT INTO `RapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(1, 'Tên rạp 1', 1);
INSERT INTO `RapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(2, 'Tên rạp 2', 2);
INSERT INTO `RapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(3, 'Tên rạp 3', 3);
INSERT INTO `RapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(4, 'Tên rạp 4', 4),
(5, 'Tên rạp 5', 5);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;