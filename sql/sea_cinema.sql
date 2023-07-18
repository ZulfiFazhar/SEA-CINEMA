-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 04:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sea_cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `movie_id` varchar(255) DEFAULT NULL,
  `seats` longtext DEFAULT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `movie_id`, `seats`, `booking_time`, `username`) VALUES
(22, '1e4ebbc3-cb71-423c-b9ce-7d160962ae65', 'A1,A2', '2023-07-09 12:02:03', 'admin3'),
(23, '1e4ebbc3-cb71-423c-b9ce-7d160962ae65', 'A1,A2,A3,A4', '2023-07-14 06:56:29', 'admin3'),
(24, '1e4ebbc3-cb71-423c-b9ce-7d160962ae65', 'A5', '2023-07-18 02:06:43', 'admin4');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `release_date` varchar(255) NOT NULL,
  `rating` double NOT NULL,
  `age_rating` int(11) NOT NULL,
  `poster_url` varchar(255) NOT NULL,
  `ticket_price` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `release_date`, `rating`, `age_rating`, `poster_url`, `ticket_price`, `createdAt`, `updatedAt`) VALUES
('00eadd1b-7fc8-4627-bb21-8a50643d9d71', 'Avatar', 'Pada abad ke-22, seorang Marinir lumpuh dikirim ke Pandora bulan pada misi yang unik, tetapi menjadi terpecah antara mengikuti perintah dan melindungi peradaban alien.', '2009-12-15', 4.6, 13, 'https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg', 37000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('1e4ebbc3-cb71-423c-b9ce-7d160962ae65', 'Thor: Love and Thunder', '\'Thor: Love and Thunder\'menceritakan Thor (Chris Hemsworth) dalam sebuah perjalanan yang belum pernah ia jalani â€“ pencariankedamaian batin. Namun, masa pensiunnya terganggu oleh seorang pembunuh galaksi yang dikenal sebagai Gorr sang Dewa Jagal (Christian Bale), yang ingin memusnahkan para dewa. Untuk mengatasi ancaman, Thor meminta bantuan Raja Valkyrie (Tessa Thompson), Korg (Taika Waititi), dan mantan kekasihnya Jane Foster (Natalie Portman), yang secara mengejutkan dan misterius berhasil menggunakan palu ajaibnya, Mjolnir, sebagai Mighty Thor. Bersama, mereka memulai petualangan kosmik yang mendebarkan untuk mengungkap misteri pembalasan Dewa Jagal dan menghentikannya sebelum terlambat.', '2022-07-06', 3.2, 12, 'https://image.tmdb.org/t/p/w500/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg', 35000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('2643303f-defa-4467-97eb-3797f7ff0f6d', 'Smile', 'Setelah menyaksikan kejadian aneh dan traumatis yang melibatkan seorang pasien, Dr. Rose Cotter mulai mengalami kejadian menakutkan yang tidak dapat dia jelaskan. Saat teror luar biasa mulai mengambil alih hidupnya, Rose harus menghadapi masa lalunya yang bermasalah untuk bertahan hidup dan melarikan diri dari kenyataan barunya yang mengerikan.', '2022-09-23', 3.7, 11, 'https://image.tmdb.org/t/p/w500/67Myda9zANAnlS54rRjQF4dHNNG.jpg', 38000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('26c0b208-6359-4350-8da9-d8dead9d86af', 'Renfield', 'Setelah bertahun-tahun sebagai hamba Dracula yang merasa jenuh dan lelah, Renfield menemukan harapan baru dalam hidupnya. Dia jatuh cinta pada Rebecca Quincy, seorang polisi lalu lintas yang energik dan sering marah. Kesempatan ini bisa menjadi penebusan baginya.', '2023-04-07', 4, 14, 'https://image.tmdb.org/t/p/w500/2OaprROMZZeiWsydjGUIkXrv2Z3.jpg', 51000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('313d5cd6-255d-4a5c-9b3c-bdf4ccb6ae16', 'Scream VI', 'Setelah pembunuhan terbaru oleh Ghostface, keempat orang yang selamat pergi dari Woodsboro dan memulai hidup baru.', '2023-03-08', 3.8, 12, 'https://image.tmdb.org/t/p/w500/wDWwtvkRRlgTiUr6TyLSMX8FCuZ.jpg', 36000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('34b7b316-c458-4fe6-935d-689a2dd42fbc', 'Peter Pan & Wendy', 'Wendy Darling adalah seorang gadis kecil yang takut pergi dari rumah masa kecilnya. Suatu hari, dia bertemu dengan Peter Pan, seorang anak laki-laki yang tidak mau tumbuh dewasa. Mereka bersama saudara-saudaranya dan peri kecil bernama Tinker Bell pergi ke dunia ajaib yang disebut Neverland. Di sana, mereka menghadapi Kapten Hook, seorang bajak laut jahat, dan mengalami petualangan seru yang akan mengubah hidup Wendy selamanya.', '2023-04-20', 1.9, 13, 'https://image.tmdb.org/t/p/w500/9NXAlFEE7WDssbXSMgdacsUD58Y.jpg', 35000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('3704ee8f-4ee0-4d18-9831-a86fd71fd444', 'Ant-Man and the Wasp: Quantumania', 'Scott Lang dan Hope van Dyne adalah pasangan pahlawan super. Mereka pergi bersama orang tua Hope, Janet van Dyne dan Hank Pym, serta anak perempuan Scott, Cassie Lang, untuk menjelajahi Alam Kuantum. Di sana, mereka bertemu dengan makhluk-makhluk aneh dan memulai petualangan yang tak terduga. Petualangan ini akan menguji batas-batas mereka.', '2023-02-15', 3.4, 12, 'https://image.tmdb.org/t/p/w500/g0OWGM7HoIt866Lu7yKohYO31NU.jpg', 51000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('39282115-510a-4ec1-8a53-dd4fc2fa8307', 'Encanto', 'menceritakan tentang keluarga Madrigals, sebuah keluarga yang tinggal di rumah ajaib dan masing-masing anggota keluarga memiliki keajaibannya tersendiri. Pada jaman dahulu kala, Abuela bersama suami dan anak-anaknya melarikan diri dari kerusuhan di desa.', '2021-10-13', 4.4, 12, 'https://image.tmdb.org/t/p/w500/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg', 44000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('3fd76144-9e2f-486d-9069-9355356948da', 'Black Adam', 'Hampir 5.000 tahun setelah dia dianugerahi kekuatan maha kuasa para dewa Mesirâ€”dan dipenjara dengan cepatâ€”Black Adam dibebaskan dari makam duniawinya, siap untuk melepaskan bentuk keadilannya yang unik di dunia modern.', '2022-10-19', 4.2, 10, 'https://image.tmdb.org/t/p/w500/A5imhXiFF3AL9RRA4FBzNDFmfgW.jpg', 42000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('51e1da36-73e6-4985-94bb-881d69e5d423', 'Fall', 'Untuk sahabat Becky dan Hunter, hidup adalah tentang menaklukkan ketakutan dan mendorong batas. Tetapi setelah mereka mendaki 2.000 kaki ke puncak menara radio terpencil yang ditinggalkan, mereka menemukan diri mereka terdampar tanpa jalan turun. Sekarang keterampilan panjat ahli Becky dan Hunter akan diuji saat mereka mati-matian berjuang untuk bertahan hidup dari unsur-unsur, kurangnya persediaan, dan ketinggian yang menyebabkan vertigo.', '2022-08-11', 4, 11, 'https://image.tmdb.org/t/p/w500/v28T5F1IygM8vXWZIycfNEm3xcL.jpg', 39000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('58aa2b4b-890d-4fa5-b1e0-9a6f0d3cb166', 'The Whale', 'Seorang guru bahasa Inggris yang tertutup dan gemuk mencoba untuk berhubungan kembali dengan putri remajanya yang terasing.', '2022-12-09', 4.3, 15, 'https://image.tmdb.org/t/p/w500/jQ0gylJMxWSL490sy0RrPj1Lj7e.jpg', 55000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('58d60aa6-828e-478c-b8bd-3efcbc76bcac', 'Sonic the Hedgehog 2', 'Alur cerita film Sonic the Hedgehog 2 bermula ketika Sonic menetap di Green Hills. Ia memutuskan menetap di sana agar bisa merasakan lebih banyak kebebasan. Ditambah lagi, Tom dan Maddie setuju untuk meninggalakannya di rumah ketika mereka pergi untuk berlibur. Namun sayangnya, tidak lama setelah mereka pergi Dr. Robotnik sang musuh bubuyutan si landak biru itu kembali ke bumi. Kali ini Dr. Robotnik datang dengan pasukan baru, Knuckles. Tujuan mereka datang kembali adalah untuk mencari Master Emerald yang memiliki kekuatan super. Kekuatan super itu bisa membangun dan menghancurkan peradaban di bumi. Atas hal ini, Sonic pun mencari strategi agar bisa menggagalkan rencara Dr. Robotnik. Strategi yang dilakukan oleh Sonic ialah bekerjasama dengan sahabatnya, Tails. Kemudian bersama dengan Tails, Sonic memulai perjalanan untuk menemukan Master Emerald. Semua itu dilakukan dengan cepat, sebelum Master Emerald jatuh ke tangan yang salah.', '2022-04-08', 4.7, 12, 'https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg', 45000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('61092228-4f33-4d6b-b32e-314b89f01f29', 'To Catch a Killer', 'Baltimore. Malam tahun baru. Seorang petugas polisi yang berbakat tetapi bermasalah (Shailene Woodley) direkrut oleh kepala penyelidik FBI (Ben Mendelsohn) untuk membantu membuat profil dan melacak individu yang terganggu yang meneror kota.', '2023-04-06', 3.3, 15, 'https://image.tmdb.org/t/p/w500/mFp3l4lZg1NSEsyxKrdi0rNK8r1.jpg', 47000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('62973ac7-67db-4435-be58-7ad317d1424e', 'The Batman', 'Ketika seorang pembunuh berantai sadis mulai membunuh tokoh-tokoh politik penting di Gotham, Batman terpaksa menyelidiki korupsi tersembunyi di kota itu dan mempertanyakan keterlibatan keluarganya.', '2022-03-01', 3.9, 13, 'https://image.tmdb.org/t/p/w500/seyWFgGInaLqW7nOZvu0ZC95rtx.jpg', 53000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('67bac006-2561-466d-b024-d08c505b158d', 'Avengers: Infinity War', 'Karena Avengers dan sekutunya terus melindungi dunia dari ancaman yang terlalu besar untuk ditangani oleh seorang pahlawan, bahaya baru telah muncul dari bayangan kosmik: Thanos. Seorang lalim penghujatan intergalaksi, tujuannya adalah untuk mengumpulkan semua enam Batu Infinity, artefak kekuatan yang tak terbayangkan, dan menggunakannya untuk menimbulkan kehendak memutar pada semua realitas. Segala sesuatu yang telah diperjuangkan oleh Avengers telah berkembang hingga saat ini - nasib Bumi dan keberadaannya sendiri tidak pernah lebih pasti.', '2018-04-25', 4.7, 10, 'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', 46000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('6e277ebe-fac6-472a-9c00-398f4bd663ae', 'Transformers: The Last Knight', 'Di tengah ketidakhadiran Optimus Prime, umat manusia berperang melawanTransformers untuk mempertahankan eksistensinya. Cade Yeager membentuk kerjasama dengan Bumblebee, seorang bangsawan Inggris dan seorang professor dari Oxford untuk mempelajari mengapa Transformers selalu kembali ke planet bumi.', '2017-06-16', 3.7, 12, 'https://image.tmdb.org/t/p/w500/s5HQf2Gb3lIO2cRcFwNL9sn1o1o.jpg', 52000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('73ce8fe1-f536-4976-88db-5a8d32783836', 'The Pope\'s Exorcist', 'Pastor Gabriele Amorth, yang memimpin tim pengusir setan di Vatikan, menginvestigasi kasus kekerasan roh jahat yang menghantui seorang anak laki-laki. Dalam penyelidikannya, ia secara tak terduga menemukan rahasia tua yang disembunyikan oleh Vatikan selama berabad-abad.', '2023-04-05', 3.7, 13, 'https://image.tmdb.org/t/p/w500/gNPqcv1tAifbN7PRNgqpzY8sEJZ.jpg', 51000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('762a6d5b-74e7-45f9-9a07-bdc3cd2cfbb9', 'Black Panther: Wakanda Forever', 'Rakyat Wakanda kali ini akan berjuang untuk melindungi negerinya dari campur tangan kekuatan dunia setelah kematian sang Raja T\'Challa.', '2022-11-09', 3.9, 13, 'https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg', 39000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('89ae0bf6-c791-4e22-9bc9-1cdea23c9bd0', 'Puss in Boots: The Last Wish', 'Puss in Boots menemukan fakta bahwa kecintaannya pada petualangan telah merenggut nyawanya: dia telah menghabiskan delapan dari sembilan nyawanya. Puss kini memulai petualangan epik untuk menemukan harapan terakhir untuk memulihkan sembilan nyawanya.', '2022-12-07', 4.8, 11, 'https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg', 51000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('9a0c412e-d1b2-4041-b6fb-83e8a0190ad6', 'Cocaine Bear', 'Sekelompok polisi, penjahat, turis, dan remaja eksentrik berkumpul di hutan Georgia tempat beruang hitam besar mengamuk setelah menelan kokain secara tidak sengaja.', '2023-02-22', 3.2, 12, 'https://image.tmdb.org/t/p/w500/gOnmaxHo0412UVr1QM5Nekv1xPi.jpg', 53000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('a1536c30-562f-497e-8f70-338822f9e4bc', 'Split', 'Ketika ketiga gadis remaja sedang menunggu ayah mereka di dalam mobil, seorang pria misterius menculik dan membawa mereka ke dalam sebuah bunker. Sang penculik yang bernama Kevin (James McAvoy) adalah seorang pria dengan gangguan jiwa yang membuatnya memiliki 23 kepribadian yang berbeda, yang diantaranya adalah seorang wanita dan anak berumur 9 tahun yang bernama Hedwig.  Sebagai salah satu gadis yang diculik, Casey berusaha meloloskan diri dengan meyakinkan salah satu kepribadian Kevin untuk melepaskan mereka. Akan tetapi hal tersebut tidaklah mudah, terlebih setelah Hedwig memperingatkan mereka akan the Beast yang merupakan kepribadian Kevin yang paling berbahaya.', '2017-01-19', 4.3, 10, 'https://image.tmdb.org/t/p/w500/lli31lYTFpvxVBeFHWoe5PMfW5s.jpg', 45000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('b0bae03a-9cec-4708-8daa-40613ec45055', 'Dungeons & Dragons: Honor Among Thieves', 'Seorang pencuri menawan dan sekelompok petualang yang unik melakukan pencurian besar-besaran untuk mencuri relik yang hilang. Namun, segalanya menjadi kacau ketika mereka berjumpa dengan orang yang salah.', '2023-03-23', 4.3, 12, 'https://image.tmdb.org/t/p/w500/A7AoNT06aRAc4SV89Dwxj3EYAgC.jpg', 38000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('b8d0fba4-ca0e-4049-9fc4-b9f185928ebe', 'Spider-Man: No Way Home', 'Peter Parker menghadapi masalah besar. Hal ini terjadi setelah identitasnya sebagai Spiderman terungkap. Dengan kepergian Tony Stark, Peter Parker pun harus meminta bantuan Doctor Strange agar semua orang bisa melupakan identitasnya sebagai manusia laba-laba.', '2021-12-15', 4.8, 15, 'https://image.tmdb.org/t/p/w500/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg', 56000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('b9eace6e-5d16-49b2-a6ef-a1d61fecd292', 'Transformers: Age of Extinction', 'Lima tahun setelah Chicago dihancurkan, manusia berbalik melawan robot. Namun seorang ayah tunggal dan penemu membangkitkan robot yang dapat menyelamatkan dunia.', '2014-06-25', 3.9, 11, 'https://image.tmdb.org/t/p/w500/jyzrfx2WaeY60kYZpPYepSjGz4S.jpg', 54000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('c9ae8e5d-3d86-4158-9a98-b821d3a98d10', 'Avatar: The Way of Water', 'Jake Sully tinggal bersama keluarga barunya di planet Pandora. Setelah ancaman kembali datang, Jake harus bekerja dengan Neytiri dan pasukan ras Na\'vi untuk melindungi planet mereka.', '2022-12-14', 4.4, 12, 'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg', 53000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('d6941602-e46b-4648-b7ed-250c773bd7c1', 'Top Gun: Maverick', 'Setelah lebih dari tiga puluh tahun mengabdi sebagai salah satu penerbang top Angkatan Laut, dan menghindari kenaikan pangkat yang akan menjatuhkannya, Pete \'Maverick\' Mitchell mendapati dirinya melatih satu detasemen lulusan TOP GUN untuk misi khusus yang tidak ada kehidupan. pilot pernah melihat.', '2022-05-24', 4.8, 14, 'https://image.tmdb.org/t/p/w500/jeGvNOVMs5QIU1VaoGvnd3gSv0G.jpg', 57000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('db0bbd8a-5102-4b70-9260-8453a7661bb8', 'John Wick: Chapter 4', 'John Wick mengungkap jalan untuk mengalahkan The High Table. Tapi sebelum dia bisa mendapatkan kebebasannya, Wick harus berhadapan dengan musuh baru dengan aliansi kuat di seluruh dunia dan kekuatan yang mengubah teman lama menjadi musuh.', '2023-03-22', 4, 10, 'https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', 60000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('db729370-3526-4027-8697-3c30af1def49', 'The Super Mario Bros. Movie', 'Ketika sedang bekerja di bawah tanah untuk memperbaiki pipa air, Mario dan Luigi, yang merupakan tukang ledeng dari Brooklyn, tiba-tiba terhisap ke dalam pipa misterius dan masuk ke dunia yang sangat berbeda. Mereka berada di tempat yang ajaib dan aneh. Tapi sayangnya, mereka terpisah satu sama lain. Mario memulai petualangan besar untuk mencari dan menemukan Luigi.', '2023-04-05', 4.6, 14, 'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg', 49000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('ea552056-4f0d-4a5b-bcf7-2ecf01a5a382', 'Prey', 'Di Comanche Nation pada tahun 1717, seorang pejuang yang ganas dan sangat terampil bernama Naru mengetahui bahwa mangsa yang dia intai adalah alien yang sangat berkembang dengan persenjataan berteknologi maju.', '2022-08-02', 4.3, 10, 'https://image.tmdb.org/t/p/w500/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg', 42000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('fbc685a7-f098-4bcd-aca7-8e2de93aaf47', 'Guardians of the Galaxy Vol. 3', 'Peter Quill masih trauma karena kehilangan Gamora. Ia perlu mengumpulkan timnya untuk melindungi alam semesta dan salah satu anggota mereka. Jika mereka gagal, Guardian akan berakhir.', '2023-05-03', 4.1, 12, 'https://image.tmdb.org/t/p/w500/nAbpLidFdbbi3efFQKMPQJkaZ1r.jpg', 41000, '2023-07-07 06:28:10', '2023-07-07 06:28:10'),
('fe1ca111-e864-4b36-9b62-30fb48d8ca8f', 'Fast X', 'Dom Toretto dan keluarganya menjadi sasaran putra gembong narkoba Hernan Reyes yang pendendam.', '2023-05-17', 3.4, 15, 'https://image.tmdb.org/t/p/w500/fiVW06jE7z9YnO4trhaMEdclSiC.jpg', 53000, '2023-07-07 06:28:10', '2023-07-07 06:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `showtimes`
--

CREATE TABLE `showtimes` (
  `id` int(11) NOT NULL,
  `movie_id` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `seats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`seats`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtimes`
--

INSERT INTO `showtimes` (`id`, `movie_id`, `time`, `seats`, `createdAt`, `updatedAt`) VALUES
(2, '00eadd1b-7fc8-4627-bb21-8a50643d9d71', '13:00:00', '{\"A1\": true, \"A2\": true, \"A3\": true, \"A4\": true, \"A5\": true, \"A6\": false, \"A7\": false, \"A8\": false, \"B1\": false, \"B2\": false, \"B3\": false, \"B4\": false, \"B5\": false, \"B6\": false, \"B7\": false, \"B8\": false, \"C1\": false, \"C2\": false, \"C3\": false, \"C4\": false, \"C5\": false, \"C6\": false, \"C7\": false, \"C8\": false, \"D1\": false, \"D2\": false, \"D3\": false, \"D4\": false, \"D5\": false, \"D6\": false, \"D7\": false, \"D8\": false, \"E1\": false, \"E2\": false, \"E3\": false, \"E4\": false, \"E5\": false, \"E6\": false, \"E7\": false, \"E8\": false, \"F1\": false, \"F2\": false, \"F3\": false, \"F4\": false, \"F5\": false, \"F6\": false, \"F7\": false, \"F8\": false, \"G1\": false, \"G2\": false, \"G3\": false, \"G4\": false, \"G5\": false, \"G6\": false, \"G7\": false, \"G8\": false, \"H1\": false, \"H2\": false, \"H3\": false, \"H4\": false, \"H5\": false, \"H6\": false, \"H7\": false, \"H8\": false}', '2023-07-08 07:48:08', '2023-07-08 07:48:08'),
(4, '1e4ebbc3-cb71-423c-b9ce-7d160962ae65', '00:00:00', '{\"A1\": true, \"A2\": true, \"A3\": false, \"A4\": false, \"A5\": false, \"A6\": false, \"A7\": false, \"A8\": false, \"B1\": false, \"B2\": false, \"B3\": false, \"B4\": false, \"B5\": false, \"B6\": false, \"B7\": false, \"B8\": false, \"C1\": false, \"C2\": false, \"C3\": false, \"C4\": false, \"C5\": false, \"C6\": false, \"C7\": false, \"C8\": false, \"D1\": false, \"D2\": false, \"D3\": false, \"D4\": false, \"D5\": false, \"D6\": false, \"D7\": false, \"D8\": false, \"E1\": false, \"E2\": false, \"E3\": false, \"E4\": false, \"E5\": false, \"E6\": false, \"E7\": false, \"E8\": false, \"F1\": false, \"F2\": false, \"F3\": false, \"F4\": false, \"F5\": false, \"F6\": false, \"F7\": false, \"F8\": false, \"G1\": false, \"G2\": false, \"G3\": false, \"G4\": false, \"G5\": false, \"G6\": false, \"G7\": false, \"G8\": false, \"H1\": false, \"H2\": false, \"H3\": false, \"H4\": false, \"H5\": false, \"H6\": false, \"H7\": false, \"H8\": false}', '2023-07-09 09:54:14', '2023-07-09 09:54:14'),
(5, '1e4ebbc3-cb71-423c-b9ce-7d160962ae65', '10:00:00', '{\"A1\": true, \"A2\": true, \"A3\": true, \"A4\": true, \"A5\": true, \"A6\": false, \"A7\": false, \"A8\": false, \"B1\": false, \"B2\": false, \"B3\": false, \"B4\": false, \"B5\": false, \"B6\": false, \"B7\": false, \"B8\": false, \"C1\": false, \"C2\": false, \"C3\": false, \"C4\": false, \"C5\": false, \"C6\": false, \"C7\": false, \"C8\": false, \"D1\": false, \"D2\": false, \"D3\": false, \"D4\": false, \"D5\": false, \"D6\": false, \"D7\": false, \"D8\": false, \"E1\": false, \"E2\": false, \"E3\": false, \"E4\": false, \"E5\": false, \"E6\": false, \"E7\": false, \"E8\": false, \"F1\": false, \"F2\": false, \"F3\": false, \"F4\": false, \"F5\": false, \"F6\": false, \"F7\": false, \"F8\": false, \"G1\": false, \"G2\": false, \"G3\": false, \"G4\": false, \"G5\": false, \"G6\": false, \"G7\": false, \"G8\": false, \"H1\": false, \"H2\": false, \"H3\": false, \"H4\": false, \"H5\": false, \"H6\": false, \"H7\": false, \"H8\": false}', '2023-07-09 09:54:14', '2023-07-09 09:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `age` int(2) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `age`, `balance`) VALUES
('', 'admin4', 'Admin Ke Empat', 'password', 99, 500000),
('cf066ff5-181a-11ee-987e-4533315c3c19', 'admin', 'Admin Satu', 'admin', 22, 0),
('cf0670b2-181a-11ee-987e-4533315c3c19', 'admin2', 'Admin Dua', 'admin', 18, 500000),
('cf06711c-181a-11ee-987e-4533315c3c19', 'zulfifazhar', 'Zulfi Fadilah Azhar', 'zul123', 22, 0),
('cf06715b-181a-11ee-987e-4533315c3c19', 'zulfifazhar2', 'Zulfi Fadilah Azhar', 'zul123', 22, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `showtimes`
--
ALTER TABLE `showtimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
