-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 03 Haz 2022, 21:43:26
-- Sunucu sürümü: 10.4.21-MariaDB
-- PHP Sürümü: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `otobus_bileti`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(50) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `seviye` tinyint(2) NOT NULL,
  `hakkimizda` varchar(5000) NOT NULL,
  `siteharitasi` varchar(500) NOT NULL,
  `hukum` varchar(500) NOT NULL,
  `gizlilik` varchar(500) NOT NULL,
  `uyelik` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`id`, `kullanici_adi`, `sifre`, `seviye`, `hakkimizda`, `siteharitasi`, `hukum`, `gizlilik`, `uyelik`) VALUES
(1, 'admin', 'admin', 0, 'Hakkımızda yazısı web sitenizin en önemli sayfalarından birisidir. Hakkımızda sayfası sayesinde ziyaretçileriniz ve müşterileriniz firmanızı ve sizi daha iyi tanıyacaktır. Genel olarak web sitelerinde standart sayfalar bulunmaktadır. Bu sayfalar genel olarak Ana Sayfa, Ürünler, Hakkımızda, Galeri ve İletişim başlıklarından oluşmaktadır. Biz bu yazımızda bir web sitesine hakkımızda yazısı yazma için dikkat etmemiz gerekenleri maddeler halinde sıralayacağız.', 'site haritası örneği var mı hacı?', 'lan ne nullu?', 'çok gizli bi siteyik', 'buraya giren bir daha çıkmamıştır. çıkamazsın. kabul ediyor musun?');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `biletler`
--

CREATE TABLE `biletler` (
  `id` int(11) NOT NULL,
  `yolcu_tcno` int(11) NOT NULL,
  `sefer_id` int(11) NOT NULL,
  `sefer_tarihi` datetime NOT NULL,
  `koltuk_no` varchar(11) NOT NULL,
  `ucret` varchar(50) NOT NULL,
  `durum` tinyint(1) NOT NULL,
  `aciklama` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `biletler`
--

INSERT INTO `biletler` (`id`, `yolcu_tcno`, `sefer_id`, `sefer_tarihi`, `koltuk_no`, `ucret`, `durum`, `aciklama`) VALUES
(1, 23232323, 1, '2014-05-20 00:00:00', '2', '50.00', 0, 'jkljl'),
(2, 23232323, 1, '2014-05-19 00:00:00', '3', '50.00', 0, 'ıoyhuıyhı'),
(3, 14141414, 1, '2014-05-18 00:00:00', '4', '50.00', 1, 'jıojj'),
(4, 25252525, 1, '2014-05-16 00:00:00', '6', '50.00', 1, 'gbjhb'),
(5, 4, 19, '2004-06-20 14:00:00', '1', '', 1, ''),
(6, 4, 19, '2004-06-20 14:00:00', '2', '', 1, '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `garlar`
--

CREATE TABLE `garlar` (
  `id` int(11) NOT NULL,
  `il_id` int(11) NOT NULL,
  `gar_adi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `garlar`
--

INSERT INTO `garlar` (`id`, `il_id`, `gar_adi`) VALUES
(1, 34, 'İSTANBUL-OTOGAR'),
(2, 34, 'İSTANBUL-ALİBEYKÖY'),
(3, 34, 'İSTANBUL-ÜMRANİYE/DUDULLU'),
(4, 6, 'ANKARA-OTOGAR'),
(5, 16, 'BURSA-OTOGAR'),
(6, 35, 'İZMİR-OTOGAR'),
(7, 50, 'ACIGÖL-OTOGAR'),
(8, 3, 'AFYON-OTOGAR'),
(9, 61, 'AKÇAABAT-OTOGAR'),
(10, 81, 'AKÇAKOCA-OTOGAR'),
(11, 10, 'AKÇAY-OTOGAR'),
(12, 45, 'AKHİSAR-OTOGAR'),
(13, 68, 'AKSARAY-OTOGAR'),
(14, 42, 'AKŞEHİR-OTOGAR'),
(15, 7, 'ALANYA-MAHMUTLAR'),
(16, 7, 'ALANYA-OTOGAR'),
(17, 67, 'ALAPLI-OTOGAR'),
(18, 35, 'ALİAĞA-OTOGAR'),
(19, 35, 'ALİAĞA-YENİ ŞAKRAN'),
(20, 10, 'ALTINOLUK-OTOGAR'),
(21, 77, 'ALTINOVA-OTOGAR'),
(22, 74, 'AMASRA-OTOGAR'),
(23, 33, 'ANAMUR-OTOGAR'),
(24, 7, 'ANTALYA-OTOGAR'),
(25, 37, 'ARAÇ-OTOGAR'),
(26, 53, 'ARDEŞEN-OTOGAR'),
(27, 8, 'ARHAVİ-OTOGAR'),
(28, 10, 'ARTUR-OTOGAR'),
(29, 50, 'AVANOS-OTOGAR'),
(30, 9, 'AYDIN-OTOGAR'),
(31, 33, 'AYDINCIK-OTOGAR'),
(32, 10, 'AYVALIK-OTOGAR'),
(33, 55, 'BAFRA-OTOGAR'),
(34, 10, 'BALIKESİR-OTOGAR'),
(35, 64, 'BANAZ-MERKEZ'),
(36, 10, 'BANDIRMA-OTOGAR'),
(37, 74, 'BARTIN-OTOGAR'),
(38, 61, 'BEŞİKDÜZÜ-OTOGAR'),
(39, 42, 'BEYŞEHİR-OTOGAR'),
(40, 17, 'BİGA-OTOGAR'),
(41, 11, 'BİLECİK-AKTARMA MERK.'),
(42, 48, 'BODRUM-OTOGAR'),
(43, 48, 'BODRUM-TURGUTREİS'),
(44, 48, 'BODRUM-YALIKAVAK'),
(45, 14, 'BOLU-OTOGAR'),
(46, 3, 'BOLVADİN-OTOGAR'),
(47, 9, 'BOZDOĞAN-OTOGAR'),
(48, 11, 'BOZÜYÜK-OTOGAR'),
(49, 11, 'BOZÜYÜK-SARAR PET OFISI'),
(50, 33, 'BOZYAZI-OTOGAR'),
(51, 15, 'BUCAK-OTOGAR'),
(52, 28, 'BULANCAK-OTOGAR'),
(53, 15, 'BURDUR-OTOGAR'),
(54, 10, 'BURHANİYE-KARAAĞAÇ'),
(55, 10, 'BURHANİYE-OTOGAR'),
(56, 42, 'CİHANBEYLİ-OTOGAR'),
(57, 17, 'ÇAN-OTOGAR'),
(58, 17, 'ÇANAKKALE-İSKELE'),
(59, 17, 'ÇANAKKALE-OTOGAR'),
(60, 35, 'ÇANDARLI-OTOGAR'),
(61, 55, 'ÇARŞAMBA-OTOGAR'),
(62, 3, 'ÇAY-OTOGAR'),
(63, 67, 'ÇAYCUMA-OTOGAR'),
(64, 53, 'ÇAYELİ-OTOGAR'),
(65, 35, 'ÇEŞME-ALAÇATI'),
(66, 35, 'ÇEŞME-ILICA'),
(67, 35, 'ÇEŞME-OTOGAR'),
(68, 9, 'ÇİNE-OTOGAR'),
(69, 19, 'ÇORUM-OTOGAR'),
(70, 48, 'DALAMAN-OTOGAR'),
(71, 48, 'DATÇA-OTOGAR'),
(72, 20, 'DENİZLİ-OTOGAR'),
(73, 20, 'DENİZLİ-PAMUKKALE'),
(74, 67, 'DEVREK-OTOGAR'),
(75, 9, 'DİDİM-OTOGAR'),
(76, 35, 'DİKİLİ-MERKEZ'),
(77, 3, 'DİNAR-MERKEZ'),
(78, 3, 'DİNAR-OTOGAR'),
(79, 81, 'DÜZCE-OTOGAR'),
(80, 10, 'EDREMİT-OTOGAR'),
(81, 32, 'EĞİRDİR-OTOGAR'),
(82, 3, 'EMİRDAĞ-OTOGAR'),
(83, 10, 'ERDEK-OTOGAR'),
(84, 67, 'EREĞLİ/KDZ-OTOGAR'),
(85, 26, 'ESKİŞEHİR-OTOGAR'),
(86, 28, 'ESPİYE-OTOGAR'),
(87, 26, 'E.ŞEHİR TCDD-GAR'),
(88, 17, 'EZİNE-GEYİKLİ'),
(89, 17, 'EZİNE-OTOGAR'),
(90, 52, 'FATSA-OTOGAR'),
(91, 48, 'FETHİYE-OTOGAR'),
(92, 53, 'FINDIKLI-OTOGAR'),
(93, 7, 'FİNİKE-OTOGAR'),
(94, 7, 'GAZİPAŞA-OTOGAR'),
(95, 41, 'GEBZE-OTOGAR'),
(96, 17, 'GELİBOLU-OTOGAR'),
(97, 16, 'GEMLİK-OTOGAR'),
(98, 17, 'GEYİKLİ-OTOGAR'),
(99, 28, 'GİRESUN-OTOGAR'),
(100, 67, 'GÖKÇEBEY-SAPAK'),
(101, 15, 'GÖLHİSAR-OTOGAR'),
(102, 15, 'GÖLHİSAR-SAPAK'),
(103, 10, 'GÖNEN-OTOGAR'),
(104, 28, 'GÖRELE-OTOGAR'),
(105, 50, 'GÖREME-OTOGAR'),
(106, 33, 'GÜLNAR-OTOGAR'),
(107, 35, 'GÜMÜLDÜR-MERKEZ'),
(108, 48, 'GÜVERCİNLİK-OTOGAR'),
(109, 55, 'HAVZA-OTOGAR'),
(110, 61, 'HAYRAT-OTOGAR'),
(111, 8, 'HOPA-OTOGAR'),
(112, 42, 'ILGIN-OTOGAR'),
(113, 32, 'ISPARTA-OTOGAR'),
(114, 16, 'İNEGÖL-OTOGAR'),
(115, 34, 'İSTANBUL-AVCILAR'),
(116, 34, 'İSTANBUL-BAKIRKÖY'),
(117, 34, 'İSTANBUL-BEYLİKDÜZÜ'),
(118, 34, 'İSTANBUL-BÜYÜKÇEKMECE'),
(119, 53, 'İYİDERE-MERKEZ'),
(120, 16, 'İZNİK-OTOGAR'),
(121, 42, 'KADINHANI-MERKEZ'),
(122, 7, 'KALKAN-OTOGAR'),
(123, 78, 'KARABÜK-OTOGAR'),
(124, 16, 'KARACABEY-OTOGAR'),
(125, 70, 'KARAMAN-OTOGAR'),
(126, 41, 'KARAMÜRSEL-OTOGAR'),
(127, 37, 'KASTAMONU-OTOGAR'),
(128, 7, 'KAŞ-OTOGAR'),
(129, 55, 'KAVAK-OTOGAR'),
(130, 6, 'KAYAŞ-ÇALIŞKAN'),
(131, 6, 'KAYAŞ-OPET'),
(132, 7, 'KEMER-OTOGAR'),
(133, 22, 'KEŞAN-OTOGAR'),
(134, 71, 'KIRIKKALE-OTOGAR'),
(135, 41, 'KOCAELİ-OTOGAR'),
(136, 42, 'KONYA-OTOGAR'),
(137, 74, 'KOZCAĞIZ-OTOGAR'),
(138, 67, 'KOZLU-OTOGAR'),
(139, 48, 'KÖYCEĞİZ-OTOGAR'),
(140, 16, 'KUMLA-MERKEZ'),
(141, 7, 'KUMLUCA-OTOGAR'),
(142, 9, 'KUŞADASI-OTOGAR'),
(143, 17, 'KÜÇÜKKUYU-OTOGAR'),
(144, 43, 'KÜTAHYA-OTOGAR'),
(145, 17, 'LAPSEKİ-OTOGAR'),
(146, 7, 'MANAVGAT-OTOGAR'),
(147, 45, 'MANİSA-OTOGAR'),
(148, 48, 'MARMARİS-İÇMELER'),
(149, 48, 'MARMARİS-OTOGAR'),
(150, 35, 'MENEMEN-OTOGAR'),
(151, 14, 'MENGEN-OTOGAR'),
(152, 5, 'MERZİFON-OTOGAR'),
(153, 48, 'MİLAS-OTOGAR'),
(154, 16, 'M.KEMAL PAŞA-OTOGAR'),
(155, 16, 'MUDANYA-MERKEZ'),
(156, 48, 'MUĞLA-OTOGAR'),
(157, 33, 'MUT-OTOGAR'),
(158, 9, 'NAZİLLİ-OTOGAR'),
(159, 50, 'NEVŞEHİR-OTOGAR'),
(160, 61, 'OF-OTOGAR'),
(161, 52, 'ORDU-OTOGAR'),
(162, 16, 'ORHANGAZİ-MERKEZ'),
(163, 48, 'ORTACA-OTOGAR'),
(164, 19, 'OSMANCIK-OTOGAR'),
(165, 35, 'ÖZDERE-MERKEZ'),
(166, 53, 'PAZAR-OTOGAR'),
(167, 52, 'PERŞEMBE-MERKEZ'),
(168, 28, 'PİRAZİZ-OTOGAR'),
(169, 6, 'POLATLI-OTOGAR'),
(170, 53, 'RİZE-OTOGAR'),
(171, 78, 'SAFRANBOLU-OTOGAR'),
(172, 54, 'SAKARYA-OTOGAR'),
(173, 35, 'SALİHLERALTI-SAHİL'),
(174, 45, 'SALİHLİ-OTOGAR'),
(175, 55, 'SAMSUN-OTOGAR'),
(176, 3, 'SANDIKLI-OTOGAR'),
(177, 10, 'SARIMSAKLI-OTOGAR'),
(178, 35, 'SEFERİHİSAR-OTOGAR'),
(179, 35, 'SELÇUK-OTOGAR'),
(180, 32, 'SENİRKENT-OTOGAR'),
(181, 7, 'SERİK-BELEK'),
(182, 7, 'SERİK-OTOGAR'),
(183, 9, 'SÖKE-OTOGAR'),
(184, 19, 'SUNGURLU-OTOGAR'),
(185, 10, 'SUSURLUK-OTOGAR'),
(186, 32, 'SÜTÇÜLER-OTOGAR'),
(187, 32, 'ŞARKİKARAAĞAÇ-OTOGAR'),
(188, 43, 'TAVŞANLI-OTOGAR'),
(189, 55, 'TEKKEKÖY-OTOGAR'),
(190, 55, 'TERME-OTOGAR'),
(191, 28, 'TİREBOLU-OTOGAR'),
(192, 37, 'TOSYA-OTOGAR'),
(193, 61, 'TRABZON-ARAKLI'),
(194, 61, 'TRABZON-BEŞİRLİ'),
(195, 61, 'TRABZON-MAÇKA'),
(196, 61, 'TRABZON-MOLOZ'),
(197, 61, 'TRABZON-OTOGAR'),
(198, 61, 'TRABZON-SÜRMENE'),
(199, 45, 'TURGUTLU-OTOGAR'),
(200, 48, 'TURGUTREİS-OTOGAR'),
(201, 32, 'ULUBORLU-OTOGAR'),
(202, 64, 'UŞAK-OTOGAR'),
(203, 52, 'ÜNYE-OTOGAR'),
(204, 50, 'ÜRGÜP-OTOGAR'),
(205, 35, 'ÜRKMEZ-MERKEZ'),
(206, 61, 'VAKFIKEBİR-OTOGAR'),
(207, 55, 'VEZİRKÖPRÜ-OTOGAR'),
(208, 48, 'YALIKAVAK-OTOGAR'),
(209, 77, 'YALOVA-OTOGAR'),
(210, 32, 'YALVAÇ-OTOGAR'),
(211, 48, 'YATAĞAN-OTOGAR'),
(212, 78, 'YENİCE-OTOGAR'),
(213, 16, 'YENİŞEHİR (BRS)-OTOGAR'),
(214, 67, 'ZONGULDAK-OTOGAR');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `id` int(11) NOT NULL,
  `isletme_id` int(11) NOT NULL,
  `icerik` varchar(5000) NOT NULL,
  `duyurular` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `hakkimizda`
--

INSERT INTO `hakkimizda` (`id`, `isletme_id`, `icerik`, `duyurular`) VALUES
(9, 10, '', ''),
(8, 9, 'slkdjfslkd fslkdj flksdjfk sdlkfjsdlk fslkdj flks dfklsd flksd as', 'lkmşlm');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `il`
--

CREATE TABLE `il` (
  `id` int(11) NOT NULL,
  `il` varchar(20) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `il`
--

INSERT INTO `il` (`id`, `il`) VALUES
(1, 'Adana'),
(2, 'Adiyaman'),
(3, 'Afyon'),
(4, 'Ağri'),
(5, 'Amasya'),
(6, 'Ankara'),
(7, 'Antalya'),
(8, 'Artvin'),
(9, 'Aydin'),
(10, 'Balikesir'),
(11, 'Bilecik'),
(12, 'Bingöl'),
(13, 'Bitlis'),
(14, 'Bolu'),
(15, 'Burdur'),
(16, 'Bursa'),
(17, 'Çanakkale'),
(18, 'Çankiri'),
(19, 'Çorum'),
(20, 'Denizlİ'),
(21, 'Diyarbakir'),
(22, 'Edirne'),
(23, 'Elaziğ'),
(24, 'Erzincan'),
(25, 'Erzurum'),
(26, 'Eskişehir'),
(27, 'Gaziantep'),
(28, 'Giresun'),
(29, 'Gümüşhane'),
(30, 'Hakkari'),
(31, 'Hatay'),
(32, 'Isparta'),
(33, 'İçel'),
(34, 'İstanbul'),
(35, 'İzmir'),
(36, 'Kars'),
(37, 'Kastamonu'),
(38, 'Kayserİ'),
(39, 'Kirklareli'),
(40, 'Kirşehir'),
(41, 'Kocaeli'),
(42, 'Konya'),
(43, 'Kütahya'),
(44, 'Malatya'),
(45, 'Manisa'),
(46, 'Kahramanmaraş'),
(47, 'Mardin'),
(48, 'Muğla'),
(49, 'Muş'),
(50, 'Nevşehir'),
(51, 'Niğde'),
(52, 'Ordu'),
(53, 'Rize'),
(54, 'Sakarya'),
(55, 'Samsun'),
(56, 'Siirt'),
(57, 'Sinop'),
(58, 'Sivas'),
(59, 'Tekirdağ'),
(60, 'Tokat'),
(61, 'Trabzon'),
(62, 'Tuncelİ'),
(63, 'Şanliurfa'),
(64, 'Uşak'),
(65, 'Van'),
(66, 'Yozgat'),
(67, 'Zonguldak'),
(68, 'Aksaray'),
(69, 'Bayburt'),
(70, 'Karaman'),
(71, 'Kirikkale'),
(72, 'Batman'),
(73, 'Şirnak'),
(74, 'Bartin'),
(75, 'Ardahan'),
(76, 'Iğdir'),
(77, 'Yalova'),
(78, 'Karabük'),
(79, 'Kilis'),
(80, 'Osmaniye'),
(81, 'Düzce');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE `iletisim` (
  `id` int(11) NOT NULL,
  `telefon` varchar(11) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `baslik` varchar(250) NOT NULL,
  `mesaj` varchar(5000) DEFAULT NULL,
  `tarihsaat` datetime NOT NULL,
  `durum` tinyint(1) NOT NULL COMMENT '0 ise yeni , 1 ise okunmuş'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`id`, `telefon`, `mail`, `baslik`, `mesaj`, `tarihsaat`, `durum`) VALUES
(1, 'sdvfs', 'wsfsd', 'dasklaşegf', 'dsfsşkjawerbkşfbvaşsdbfvbasdşkvbjiasdbvibasdivbşaksdjbvşbasdkşvjbakşsdjbvkşjasdbkşvb', '2014-05-28 11:31:09', 1),
(2, '1234121312', 'mailsad', 'iaoldfvaklsdbivb', 'saddasdasşaksdjbfvkjasdbkşfjbasdkşgfşasdfgasşkvkşasbvşkabsşkvjbaskşbvşkbasdkşjfvbaşskvbşaksdbvkşjbaskşjvbakşsbvkşasdfbjvkşjabskşvbşasd', '2014-05-28 11:49:44', 0),
(3, 'asdasdasd', 'asdasdasa', 'iaweklfhdasdlbf', 'dasdbhasjkf nksdjlşliaskdbfvlasdblişvbasdişvb adsbvoğbbnjkdsbfjkl dsafbhsdjkabhfasdhbf djbafuÄ±gn fjklsdnfsdjklan fsdjklanjklafn asdhÄ±gjklasbhop weh tklwehgÄ±oq', '2014-05-28 11:52:32', 0),
(4, '6464646546', 'asdk fas', 'şalsmdfşasşlm', 'çasöndşlasndşlasş', '2014-05-29 00:00:00', 0),
(5, '6464646546', 'asdk fas', 'şalsmdfşasşlm', 'çasöndşlasndşlasş', '2014-05-29 12:12:57', 1),
(6, 'aeringdasf', 'ÅlpasdfnjgpÅasdf', 'aepÅsfjdÄÅpjasdf', 'ÅalpsdfjgolasdjgfÄjasdopÄgjopasjdfgopjasdpjasdopfjopasdjfop', '2014-05-29 12:15:03', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `isletme`
--

CREATE TABLE `isletme` (
  `id` int(11) NOT NULL,
  `firma_unvani` varchar(255) NOT NULL,
  `kullanici_adi` varchar(255) NOT NULL,
  `sifresi` varchar(255) NOT NULL,
  `yetkili_adi_soyadi` varchar(500) NOT NULL,
  `yetkili_mail` varchar(500) NOT NULL,
  `yetkili_telefon` varchar(50) NOT NULL,
  `firma_adresi` varchar(500) NOT NULL,
  `firma_telefon` varchar(50) NOT NULL,
  `firma_fax` varchar(50) NOT NULL,
  `firma_mail` varchar(255) NOT NULL,
  `firma_web` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `banka_bilgileri` varchar(1000) NOT NULL,
  `vergi_bilgileri` varchar(1000) NOT NULL,
  `durum` tinyint(1) NOT NULL COMMENT '0 ise = akitf, 1 ise pasif, 2 ise silinmis',
  `kayit_tarihi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `isletme`
--

INSERT INTO `isletme` (`id`, `firma_unvani`, `kullanici_adi`, `sifresi`, `yetkili_adi_soyadi`, `yetkili_mail`, `yetkili_telefon`, `firma_adresi`, `firma_telefon`, `firma_fax`, `firma_mail`, `firma_web`, `logo`, `banka_bilgileri`, `vergi_bilgileri`, `durum`, `kayit_tarihi`) VALUES
(9, 'Isparta Petrol', 'mesut', '12345', 'Deniz Bakın', 'yetkili_mail2', '05435556677', 'firma_adresi2', 'firma_telefon2', 'firma_fax2', 'şklasdjbfş', 'aslkndaskln', '', '																										\r\n												\r\n												', '																										\r\n												\r\n												', 0, '0000-00-00 00:00:00'),
(8, 'Anadolu Ulaşım', 'serik', '12345', 'Zehra Bilir', '', '05435556636', '', '', '', '', '', '', '																																							\r\n												\r\n												\r\n												', '																																							\r\n												\r\n												\r\n												', 0, '2014-05-07 15:01:40'),
(10, 'Efetur', 'bbb', '12345', 'Ali Bilmem', 'yetkili_mail1', '05435556655', 'firma_adresi1', 'firma_telefon1', 'firma_fax', 'firma_mail', '', '', '																																																				a\r\n												\r\n												\r\n												\r\n												', '																																																				a\r\n												\r\n												\r\n												\r\n												', 0, '0000-00-00 00:00:00'),
(1, 'Pamukkale Turizm', 'kullanici_adi', '12345', 'Ahmet Baktı', 'yetkili_mail', '05435556612', 'firma_adresi', 'firma_telefon', 'firma_fax', 'firma_mail', 'firma_web', '', '																										banka_bilgileri\r\n												\r\n												', '																										verigi_bilgileri\r\n												\r\n												', 0, '2014-05-05 11:07:29'),
(2, 'Güney Akdeniz', '', '12345', 'Serkan Oran', '', '05435556677', '', '', '', '', '', '', '																																																																	\r\n												\r\n												\r\n												\r\n												\r\n												', '																																																																	\r\n												\r\n												\r\n												\r\n												\r\n												', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `id` int(11) NOT NULL,
  `yolcu_id` int(11) NOT NULL,
  `kullanicitc` bigint(11) NOT NULL,
  `sifre` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `molayeri`
--

CREATE TABLE `molayeri` (
  `id` int(11) NOT NULL,
  `molayeri_adi` varchar(100) NOT NULL,
  `molayeri_lat` varchar(100) NOT NULL,
  `molayeri_long` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `molayeri`
--

INSERT INTO `molayeri` (`id`, `molayeri_adi`, `molayeri_lat`, `molayeri_long`) VALUES
(1, 'İSTANBUL-OTOGAR', '', ''),
(2, 'İSTANBUL-ALİBEYKÖY', '', ''),
(3, 'İSTANBUL-ÜMRANİYE/DUDULLU', '', ''),
(4, 'ANKARA-OTOGAR', '', ''),
(5, 'BURSA-OTOGAR', '', ''),
(6, 'İZMİR-OTOGAR', '', ''),
(7, 'ACIGÖL-OTOGAR', '', ''),
(8, 'AFYON-OTOGAR', '', ''),
(9, 'AKÇAABAT-OTOGAR', '', ''),
(10, 'AKÇAKOCA-OTOGAR', '', ''),
(11, 'AKÇAY-OTOGAR', '', ''),
(12, 'AKHİSAR-OTOGAR', '', ''),
(13, 'AKSARAY-OTOGAR', '', ''),
(14, 'AKŞEHİR-OTOGAR', '', ''),
(15, 'ALANYA-MAHMUTLAR', '', ''),
(16, 'ALANYA-OTOGAR', '', ''),
(17, 'ALAPLI-OTOGAR', '', ''),
(18, 'ALİAĞA-OTOGAR', '', ''),
(19, 'ALİAĞA-YENİ ŞAKRAN', '', ''),
(20, 'ALTINOLUK-OTOGAR', '', ''),
(21, 'ALTINOVA-OTOGAR', '', ''),
(22, 'AMASRA-OTOGAR', '', ''),
(23, 'ANAMUR-OTOGAR', '', ''),
(24, 'ANTALYA-OTOGAR', '', ''),
(25, 'ARAÇ-OTOGAR', '', ''),
(26, 'ARDEŞEN-OTOGAR', '', ''),
(27, 'ARHAVİ-OTOGAR', '', ''),
(28, 'ARTUR-OTOGAR', '', ''),
(29, 'AVANOS-OTOGAR', '', ''),
(30, 'AYDIN-OTOGAR', '', ''),
(31, 'AYDINCIK-OTOGAR', '', ''),
(32, 'AYVALIK-OTOGAR', '', ''),
(33, 'BAFRA-OTOGAR', '', ''),
(34, 'BALIKESİR-OTOGAR', '', ''),
(35, 'BANAZ-MERKEZ', '', ''),
(36, 'BANDIRMA-OTOGAR', '', ''),
(37, 'BARTIN-OTOGAR', '', ''),
(38, 'BEŞİKDÜZÜ-OTOGAR', '', ''),
(39, 'BEYŞEHİR-OTOGAR', '', ''),
(40, 'BİGA-OTOGAR', '', ''),
(41, 'BİLECİK-AKTARMA MERK.', '', ''),
(42, 'BODRUM-OTOGAR', '', ''),
(43, 'BODRUM-TURGUTREİS', '', ''),
(44, 'BODRUM-YALIKAVAK', '', ''),
(45, 'BOLU-OTOGAR', '', ''),
(46, 'BOLVADİN-OTOGAR', '', ''),
(47, 'BOZDOĞAN-OTOGAR', '', ''),
(48, 'BOZÜYÜK-OTOGAR', '', ''),
(49, 'BOZÜYÜK-SARAR PET OFISI', '', ''),
(50, 'BOZYAZI-OTOGAR', '', ''),
(51, 'BUCAK-OTOGAR', '', ''),
(52, 'BULANCAK-OTOGAR', '', ''),
(53, 'BURDUR-OTOGAR', '', ''),
(54, 'BURHANİYE-KARAAĞAÇ', '', ''),
(55, 'BURHANİYE-OTOGAR', '', ''),
(56, 'CİHANBEYLİ-OTOGAR', '', ''),
(57, 'ÇAN-OTOGAR', '', ''),
(58, 'ÇANAKKALE-İSKELE', '', ''),
(59, 'ÇANAKKALE-OTOGAR', '', ''),
(60, 'ÇANDARLI-OTOGAR', '', ''),
(61, 'ÇARŞAMBA-OTOGAR', '', ''),
(62, 'ÇAY-OTOGAR', '', ''),
(63, 'ÇAYCUMA-OTOGAR', '', ''),
(64, 'ÇAYELİ-OTOGAR', '', ''),
(65, 'ÇEŞME-ALAÇATI', '', ''),
(66, 'ÇEŞME-ILICA', '', ''),
(67, 'ÇEŞME-OTOGAR', '', ''),
(68, 'ÇİNE-OTOGAR', '', ''),
(69, 'ÇORUM-OTOGAR', '', ''),
(70, 'DALAMAN-OTOGAR', '', ''),
(71, 'DATÇA-OTOGAR', '', ''),
(72, 'DENİZLİ-OTOGAR', '', ''),
(73, 'DENİZLİ-PAMUKKALE', '', ''),
(74, 'DEVREK-OTOGAR', '', ''),
(75, 'DİDİM-OTOGAR', '', ''),
(76, 'DİKİLİ-MERKEZ', '', ''),
(77, 'DİNAR-MERKEZ', '', ''),
(78, 'DİNAR-OTOGAR', '', ''),
(79, 'DÜZCE-OTOGAR', '', ''),
(80, 'EDREMİT-OTOGAR', '', ''),
(81, 'EĞİRDİR-OTOGAR', '', ''),
(82, 'EMİRDAĞ-OTOGAR', '', ''),
(83, 'ERDEK-OTOGAR', '', ''),
(84, 'EREĞLİ/KDZ-OTOGAR', '', ''),
(85, 'ESKİŞEHİR-OTOGAR', '', ''),
(86, 'ESPİYE-OTOGAR', '', ''),
(87, 'E.ŞEHİR TCDD-GAR', '', ''),
(88, 'EZİNE-GEYİKLİ', '', ''),
(89, 'EZİNE-OTOGAR', '', ''),
(90, 'FATSA-OTOGAR', '', ''),
(91, 'FETHİYE-OTOGAR', '', ''),
(92, 'FINDIKLI-OTOGAR', '', ''),
(93, 'FİNİKE-OTOGAR', '', ''),
(94, 'GAZİPAŞA-OTOGAR', '', ''),
(95, 'GEBZE-OTOGAR', '', ''),
(96, 'GELİBOLU-OTOGAR', '', ''),
(97, 'GEMLİK-OTOGAR', '', ''),
(98, 'GEYİKLİ-OTOGAR', '', ''),
(99, 'GİRESUN-OTOGAR', '', ''),
(100, 'GÖKÇEBEY-SAPAK', '', ''),
(101, 'GÖLHİSAR-OTOGAR', '', ''),
(102, 'GÖLHİSAR-SAPAK', '', ''),
(103, 'GÖNEN-OTOGAR', '', ''),
(104, 'GÖRELE-OTOGAR', '', ''),
(105, 'GÖREME-OTOGAR', '', ''),
(106, 'GÜLNAR-OTOGAR', '', ''),
(107, 'GÜMÜLDÜR-MERKEZ', '', ''),
(108, 'GÜVERCİNLİK-OTOGAR', '', ''),
(109, 'HAVZA-OTOGAR', '', ''),
(110, 'HAYRAT-OTOGAR', '', ''),
(111, 'HOPA-OTOGAR', '', ''),
(112, 'ILGIN-OTOGAR', '', ''),
(113, 'ISPARTA-OTOGAR', '', ''),
(114, 'İNEGÖL-OTOGAR', '', ''),
(115, 'İSTANBUL-AVCILAR', '', ''),
(116, 'İSTANBUL-BAKIRKÖY', '', ''),
(117, 'İSTANBUL-BEYLİKDÜZÜ', '', ''),
(118, 'İSTANBUL-BÜYÜKÇEKMECE', '', ''),
(119, 'İYİDERE-MERKEZ', '', ''),
(120, 'İZNİK-OTOGAR', '', ''),
(121, 'KADINHANI-MERKEZ', '', ''),
(122, 'KALKAN-OTOGAR', '', ''),
(123, 'KARABÜK-OTOGAR', '', ''),
(124, 'KARACABEY-OTOGAR', '', ''),
(125, 'KARAMAN-OTOGAR', '', ''),
(126, 'KARAMÜRSEL-OTOGAR', '', ''),
(127, 'KASTAMONU-OTOGAR', '', ''),
(128, 'KAŞ-OTOGAR', '', ''),
(129, 'KAVAK-OTOGAR', '', ''),
(130, 'KAYAŞ-ÇALIŞKAN', '', ''),
(131, 'KAYAŞ-OPET', '', ''),
(132, 'KEMER-OTOGAR', '', ''),
(133, 'KEŞAN-OTOGAR', '', ''),
(134, 'KIRIKKALE-OTOGAR', '', ''),
(135, 'KOCAELİ-OTOGAR', '', ''),
(136, 'KONYA-OTOGAR', '', ''),
(137, 'KOZCAĞIZ-OTOGAR', '', ''),
(138, 'KOZLU-OTOGAR', '', ''),
(139, 'KÖYCEĞİZ-OTOGAR', '', ''),
(140, 'KUMLA-MERKEZ', '', ''),
(141, 'KUMLUCA-OTOGAR', '', ''),
(142, 'KUŞADASI-OTOGAR', '', ''),
(143, 'KÜÇÜKKUYU-OTOGAR', '', ''),
(144, 'KÜTAHYA-OTOGAR', '', ''),
(145, 'LAPSEKİ-OTOGAR', '', ''),
(146, 'MANAVGAT-OTOGAR', '', ''),
(147, 'MANİSA-OTOGAR', '', ''),
(148, 'MARMARİS-İÇMELER', '', ''),
(149, 'MARMARİS-OTOGAR', '', ''),
(150, 'MENEMEN-OTOGAR', '', ''),
(151, 'MENGEN-OTOGAR', '', ''),
(152, 'MERZİFON-OTOGAR', '', ''),
(153, 'MİLAS-OTOGAR', '', ''),
(154, 'M.KEMAL PAŞA-OTOGAR', '', ''),
(155, 'MUDANYA-MERKEZ', '', ''),
(156, 'MUĞLA-OTOGAR', '', ''),
(157, 'MUT-OTOGAR', '', ''),
(158, 'NAZİLLİ-OTOGAR', '', ''),
(159, 'NEVŞEHİR-OTOGAR', '', ''),
(160, 'OF-OTOGAR', '', ''),
(161, 'ORDU-OTOGAR', '', ''),
(162, 'ORHANGAZİ-MERKEZ', '', ''),
(163, 'ORTACA-OTOGAR', '', ''),
(164, 'OSMANCIK-OTOGAR', '', ''),
(165, 'ÖZDERE-MERKEZ', '', ''),
(166, 'PAZAR-OTOGAR', '', ''),
(167, 'PERŞEMBE-MERKEZ', '', ''),
(168, 'PİRAZİZ-OTOGAR', '', ''),
(169, 'POLATLI-OTOGAR', '', ''),
(170, 'RİZE-OTOGAR', '', ''),
(171, 'SAFRANBOLU-OTOGAR', '', ''),
(172, 'SAKARYA-OTOGAR', '', ''),
(173, 'SALİHLERALTI-SAHİL', '', ''),
(174, 'SALİHLİ-OTOGAR', '', ''),
(175, 'SAMSUN-OTOGAR', '', ''),
(176, 'SANDIKLI-OTOGAR', '', ''),
(177, 'SARIMSAKLI-OTOGAR', '', ''),
(178, 'SEFERİHİSAR-OTOGAR', '', ''),
(179, 'SELÇUK-OTOGAR', '', ''),
(180, 'SENİRKENT-OTOGAR', '', ''),
(181, 'SERİK-BELEK', '', ''),
(182, 'SERİK-OTOGAR', '', ''),
(183, 'SÖKE-OTOGAR', '', ''),
(184, 'SUNGURLU-OTOGAR', '', ''),
(185, 'SUSURLUK-OTOGAR', '', ''),
(186, 'SÜTÇÜLER-OTOGAR', '', ''),
(187, 'ŞARKİKARAAĞAÇ-OTOGAR', '', ''),
(188, 'TAVŞANLI-OTOGAR', '', ''),
(189, 'TEKKEKÖY-OTOGAR', '', ''),
(190, 'TERME-OTOGAR', '', ''),
(191, 'TİREBOLU-OTOGAR', '', ''),
(192, 'TOSYA-OTOGAR', '', ''),
(193, 'TRABZON-ARAKLI', '', ''),
(194, 'TRABZON-BEŞİRLİ', '', ''),
(195, 'TRABZON-MAÇKA', '', ''),
(196, 'TRABZON-MOLOZ', '', ''),
(197, 'TRABZON-OTOGAR', '', ''),
(198, 'TRABZON-SÜRMENE', '', ''),
(199, 'TURGUTLU-OTOGAR', '', ''),
(200, 'TURGUTREİS-OTOGAR', '', ''),
(201, 'ULUBORLU-OTOGAR', '', ''),
(202, 'UŞAK-OTOGAR', '', ''),
(203, 'ÜNYE-OTOGAR', '', ''),
(204, 'ÜRGÜP-OTOGAR', '', ''),
(205, 'ÜRKMEZ-MERKEZ', '', ''),
(206, 'VAKFIKEBİR-OTOGAR', '', ''),
(207, 'VEZİRKÖPRÜ-OTOGAR', '', ''),
(208, 'YALIKAVAK-OTOGAR', '', ''),
(209, 'YALOVA-OTOGAR', '', ''),
(210, 'YALVAÇ-OTOGAR', '', ''),
(211, 'YATAĞAN-OTOGAR', '', ''),
(212, 'YENİCE-OTOGAR', '', ''),
(213, 'YENİŞEHİR (BRS)-OTOGAR', '', ''),
(214, 'ZONGULDAK-OTOGAR', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `otobusler`
--

CREATE TABLE `otobusler` (
  `id` tinyint(2) NOT NULL,
  `marka` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `otobusler`
--

INSERT INTO `otobusler` (`id`, `marka`, `model`) VALUES
(1, 'Mercedes', 'Travego'),
(2, 'MErcedes', 'travego-rahat');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE `personel` (
  `id` int(11) NOT NULL,
  `personel_adiSoyadi` varchar(255) NOT NULL,
  `kullanici_adi` varchar(255) NOT NULL,
  `sifresi` varchar(255) NOT NULL,
  `terminal_id` int(11) NOT NULL,
  `adresi` varchar(500) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `durum` tinyint(1) NOT NULL COMMENT '0 ise = akitf, 1 ise pasif, 2 ise silinmis',
  `kayit_tarihi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`id`, `personel_adiSoyadi`, `kullanici_adi`, `sifresi`, `terminal_id`, `adresi`, `telefon`, `mail`, `durum`, `kayit_tarihi`) VALUES
(1, 'ilkay', 'ereneee', 'eren', 0, 'sisli', '5556598321', 'eren@mail.com', 0, '2014-05-12 13:00:41'),
(2, 'hfgh', 'fghf', 'aa', 9, 'ghj', 'ghjg', 'hjghj', 0, '2014-05-12 14:54:40'),
(3, 'hjkhj', 'khjkhjk', '1', 9, 'kÅ', 'lÅkl', 'ÅklÅkl', 0, '2014-05-12 14:56:08'),
(4, 'alper', 'alperilkay', '12', 9, 'saasassa', 'saasasas', 'saasasas', 0, '2014-05-13 12:44:34'),
(5, 'hakan', 'hakan', 'hakan', 13, 'adres', 'telefon', 'mail', 0, '2014-05-21 13:22:29'),
(6, 'personel_adiSoyadi', 'kullanici_adi', 'sifresi', 1, ' istanbul şişli', '02123645896', 'mail@mail.com', 0, '2014-05-15 13:03:22'),
(7, 'personel_adiSoyadi2', 'kullanici_adi2', 'sifresi2', 2, 'adresi', 'telefon', 'mail', 0, '2014-05-15 13:04:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sefer`
--

CREATE TABLE `sefer` (
  `id` int(12) NOT NULL,
  `isletme_id` int(11) DEFAULT NULL,
  `kalkis_yeri` int(11) DEFAULT NULL,
  `varis_yeri` int(11) DEFAULT NULL,
  `saat` time DEFAULT NULL,
  `sefer_tipi` varchar(50) DEFAULT NULL,
  `otobus_tipi` varchar(100) DEFAULT NULL,
  `koltuk_sayisi` int(3) DEFAULT NULL,
  `normal_fiyat` varchar(20) DEFAULT NULL,
  `indirimli_fiyat` varchar(20) DEFAULT NULL,
  `bilgi` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sefer`
--

INSERT INTO `sefer` (`id`, `isletme_id`, `kalkis_yeri`, `varis_yeri`, `saat`, `sefer_tipi`, `otobus_tipi`, `koltuk_sayisi`, `normal_fiyat`, `indirimli_fiyat`, `bilgi`) VALUES
(17, 9, 8, 46, '09:25:00', 'Normal', 'Trevego', 46, '100', '50', 'a'),
(18, 9, 15, 49, '08:20:00', 'Normal', 'Neoplan', 46, '60', '55', 'bilgi'),
(19, 9, 1, 4, '03:05:00', 'Normal', 'Neoplan', 33, '35', '30', 'bilgi'),
(20, 9, 3, 182, '10:20:00', 'molalı ', 'mercedes ', 54, '80', '60', 'amk '),
(1, 1, 1, 6, '11:02:09', 'Normal', 'Trevega', 50, '60', '45', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sefer_mola`
--

CREATE TABLE `sefer_mola` (
  `sefer_id` int(12) NOT NULL,
  `mola_id` int(11) NOT NULL,
  `varis_saat` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sefer_mola`
--

INSERT INTO `sefer_mola` (`sefer_id`, `mola_id`, `varis_saat`) VALUES
(1, 5, '15:00:00'),
(1, 34, '18:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `servis`
--

CREATE TABLE `servis` (
  `id` int(11) NOT NULL,
  `sehir` varchar(255) NOT NULL,
  `varilacak_yer` varchar(255) NOT NULL,
  `guzargah_no` int(11) NOT NULL,
  `saat` time NOT NULL,
  `plaka` varchar(255) NOT NULL,
  `sofor_adi` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `sofor_tel` varchar(50) NOT NULL,
  `arac_modeli` varchar(50) NOT NULL,
  `koltuk_sayisi` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `servis`
--

INSERT INTO `servis` (`id`, `sehir`, `varilacak_yer`, `guzargah_no`, `saat`, `plaka`, `sofor_adi`, `sofor_tel`, `arac_modeli`, `koltuk_sayisi`) VALUES
(4, 'istanbul', 'besiktas', 1, '18:05:00', '34 klm 81', 'mehmet', '0505 505 55 55', 'ford', 34);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `terminal`
--

CREATE TABLE `terminal` (
  `id` int(11) NOT NULL,
  `İsletme_id` int(11) NOT NULL,
  `terminal_adi` varchar(500) NOT NULL,
  `terminal_adresi` varchar(500) NOT NULL,
  `terminal_telefon` varchar(50) NOT NULL,
  `terminal_fax` varchar(50) NOT NULL,
  `durum` tinyint(1) NOT NULL COMMENT '0 ise = akitf, 1 ise pasif, 2 ise silinmis',
  `kayit_tarihi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `terminal`
--

INSERT INTO `terminal` (`id`, `İsletme_id`, `terminal_adi`, `terminal_adresi`, `terminal_telefon`, `terminal_fax`, `durum`, `kayit_tarihi`) VALUES
(9, 9, 'a', 'accc', '', '', 0, '2014-05-09 15:44:03'),
(10, 9, 'a-', 'a-', '', '', 0, '2014-05-12 13:14:34'),
(1, 1, 'esenler1', 'esenler no:120', '02123698745', '02123698745', 0, '2014-05-15 12:59:23'),
(13, 9, 'üğişçö', 'üğişçö', '5454', '5545646', 0, '2014-05-21 13:21:53'),
(2, 1, 'şişli merkez', 'şişli merkez no:44', '02123654878', '02123654878', 0, '2014-05-15 13:00:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yolcular`
--

CREATE TABLE `yolcular` (
  `id` int(11) NOT NULL,
  `yolcu_tc` varchar(11) NOT NULL,
  `adi` varchar(255) NOT NULL,
  `soyadi` varchar(255) NOT NULL,
  `adres` varchar(500) DEFAULT NULL,
  `tel` varchar(50) NOT NULL,
  `mail` varchar(500) NOT NULL,
  `sifre` varchar(15) NOT NULL,
  `durum` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yolcular`
--

INSERT INTO `yolcular` (`id`, `yolcu_tc`, `adi`, `soyadi`, `adres`, `tel`, `mail`, `sifre`, `durum`) VALUES
(1, '23232323', 'Meryemcan', 'Kesici', 'istanbul', '05552223322', 'meryem_kesici@mail.com', '', 0),
(2, '576567575', 'Fatma', 'Şener', 'Çiçek Sok. Can Mah. Adana', '4456455677', 'fatma@mail.com', '', 0),
(3, '854641654', 'asd', 'asdasd', 'asd', '96456546546', 'asd@asd.com', '', 0),
(4, '17425259128', 'hakan', 'hakan', NULL, '54454', 'hakan@hakan.co', 'hakan', 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `biletler`
--
ALTER TABLE `biletler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_biletler_1` (`sefer_id`),
  ADD KEY `FK_biletler_2` (`yolcu_tcno`);

--
-- Tablo için indeksler `garlar`
--
ALTER TABLE `garlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `il`
--
ALTER TABLE `il`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `isletme`
--
ALTER TABLE `isletme`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `molayeri`
--
ALTER TABLE `molayeri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `otobusler`
--
ALTER TABLE `otobusler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sefer`
--
ALTER TABLE `sefer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sefer_mola`
--
ALTER TABLE `sefer_mola`
  ADD KEY `mola_id` (`mola_id`),
  ADD KEY `sefer_id` (`sefer_id`);

--
-- Tablo için indeksler `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `terminal`
--
ALTER TABLE `terminal`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `yolcular`
--
ALTER TABLE `yolcular`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `biletler`
--
ALTER TABLE `biletler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `garlar`
--
ALTER TABLE `garlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- Tablo için AUTO_INCREMENT değeri `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `il`
--
ALTER TABLE `il`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `isletme`
--
ALTER TABLE `isletme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `molayeri`
--
ALTER TABLE `molayeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- Tablo için AUTO_INCREMENT değeri `otobusler`
--
ALTER TABLE `otobusler`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `personel`
--
ALTER TABLE `personel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `sefer`
--
ALTER TABLE `sefer`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `servis`
--
ALTER TABLE `servis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `terminal`
--
ALTER TABLE `terminal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `yolcular`
--
ALTER TABLE `yolcular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
