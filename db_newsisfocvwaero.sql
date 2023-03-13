-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Mar 2023 pada 00.24
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_newsisfocvwaero`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_absensi`
--

CREATE TABLE `app_sisfocvwaero_absensi` (
  `id` bigint(20) NOT NULL,
  `tanggal` date NOT NULL,
  `absen_masuk` time(6) DEFAULT NULL,
  `ket_masuk` varchar(30) DEFAULT NULL,
  `absen_keluar` time(6) DEFAULT NULL,
  `ket_keluar` varchar(30) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `image_keluar` varchar(100) DEFAULT NULL,
  `image_masuk` varchar(100) DEFAULT NULL,
  `jml_jamlembur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_sisfocvwaero_absensi`
--

INSERT INTO `app_sisfocvwaero_absensi` (`id`, `tanggal`, `absen_masuk`, `ket_masuk`, `absen_keluar`, `ket_keluar`, `status`, `user_id`, `image_keluar`, `image_masuk`, `jml_jamlembur`) VALUES
(29, '2023-03-11', '19:50:20.000000', 'TELAT', '21:58:18.000000', 'LEMBUR', 'HADIR', 17, 'image_keluar/image.jpg', 'image_masuk/image_6T4uIuS.jpg', 4),
(30, '2023-03-11', '22:06:03.000000', 'TELAT', '22:08:39.000000', 'LEMBUR', 'HADIR', 17, 'image_keluar/image_xZsYoeF.jpg', 'image_masuk/image_J55vT7g.jpg', 5),
(31, '2023-03-11', '22:18:09.000000', 'TELAT', '22:20:44.000000', 'LEMBUR', 'HADIR', 21, 'image_keluar/image_TR12sEt.jpg', 'image_masuk/image_h8GXWqO.jpg', 5),
(32, '2023-03-12', '13:43:37.000000', 'TELAT', '13:44:37.000000', 'TEPAT_WAKTU', 'HADIR', 21, 'image_keluar/image_TIOQcVC.jpg', 'image_masuk/image_3fO2gxn.jpg', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_divisi`
--

CREATE TABLE `app_sisfocvwaero_divisi` (
  `id` bigint(20) NOT NULL,
  `divisi` varchar(30) NOT NULL,
  `gapok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_sisfocvwaero_divisi`
--

INSERT INTO `app_sisfocvwaero_divisi` (`id`, `divisi`, `gapok`) VALUES
(7, 'MARKETING', 2000000),
(8, 'PRODUKSI', 1500000),
(9, 'ADMINISTRASI', 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_gambar`
--

CREATE TABLE `app_sisfocvwaero_gambar` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_sisfocvwaero_gambar`
--

INSERT INTO `app_sisfocvwaero_gambar` (`id`, `image`, `date`) VALUES
(27, 'captures/kkk.jpeg', '2023-03-08 23:22:07.199631'),
(28, 'captures/kkk_SywS2nn.jpeg', '2023-03-08 23:22:29.819065'),
(29, 'captures/berr.jpeg', '2023-03-08 23:26:54.743889'),
(30, 'captures/berr_VE4UgTZ.jpeg', '2023-03-08 23:27:10.137417'),
(31, 'captures/berr_0bTP8v5.jpeg', '2023-03-08 23:27:29.434324'),
(32, 'captures/berr_hvQcVZA.jpeg', '2023-03-08 23:33:07.162568'),
(33, 'captures/berr_ifTJj1p.jpeg', '2023-03-08 23:42:33.651628'),
(34, '', '2023-03-09 14:16:59.994463'),
(35, '', '2023-03-09 14:19:19.531061'),
(36, '', '2023-03-09 14:22:02.399158'),
(37, '', '2023-03-09 14:23:47.773147'),
(38, 'captures/image.jpg', '2023-03-09 14:34:51.630651'),
(39, 'captures/image_yy0e1FO.jpg', '2023-03-09 14:38:12.611731');

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_karyawan`
--

CREATE TABLE `app_sisfocvwaero_karyawan` (
  `id` bigint(20) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` varchar(30) DEFAULT NULL,
  `agama` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tmpt_lahir` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nohp` varchar(50) DEFAULT NULL,
  `divisi_id_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_sisfocvwaero_karyawan`
--

INSERT INTO `app_sisfocvwaero_karyawan` (`id`, `nip`, `nama`, `jk`, `agama`, `tgl_lahir`, `tmpt_lahir`, `pendidikan`, `alamat`, `nohp`, `divisi_id_id`, `user_id`, `foto`) VALUES
(12, '1234', 'CLARA FALISHA SUARDI', 'PEREMPUAN', 'PROTESTAN', '2023-02-08', 'BULUKUMBA', 'STRATA 1', '23 jl ko', '09877', 7, 14, 'uploads/BG_SPONGEBOB.jpg'),
(14, '1234', 'Suardi', 'LAKI-LAKI', 'ISLAM', '2023-02-04', 'BULUKUMBA', 'SMA/SMK/SEDERAJAT', '23 jl ko', '09877', 7, 17, 'uploads/asli.jpg'),
(16, '1234', 'CARLA', 'PEREMPUAN', 'ISLAM', '2023-02-23', 'BULUKUMBA', 'STRATA 1', 'JL. KAMBOJA', '09877', 7, 19, 'uploads/IMG_20200325_174842.jpg'),
(17, '1234', 'clara falisha suardi', 'PEREMPUAN', 'ISLAM', '2023-02-23', 'BULUKUMBA', 'STRATA 2', '23 jl ko', '09877', 7, 20, 'uploads/Picture0018.jpg'),
(18, '9820662ZY', 'Sahril Arasyid', 'LAKI-LAKI', 'ISLAM', '2023-03-03', 'PAPUA', 'STRATA 2', 'PERINTIS KEMERDEKAAN VII', '088777', 7, 21, 'uploads/NK.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_sakit`
--

CREATE TABLE `app_sisfocvwaero_sakit` (
  `id` bigint(20) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `absensi_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_user`
--

CREATE TABLE `app_sisfocvwaero_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_karyawan` tinyint(1) NOT NULL,
  `is_pimpinan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_sisfocvwaero_user`
--

INSERT INTO `app_sisfocvwaero_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_admin`, `is_karyawan`, `is_pimpinan`) VALUES
(1, 'pbkdf2_sha256$390000$TQPdrhZrjH0Yo52hNpsf4Y$OaROE7mVQNkHcMhS87myOrhOasvsxiuALz5A4gT42Ek=', '2023-02-26 07:14:36.065159', 1, 'clara', '', '', 'clarafalisha13@gmail.com', 1, 1, '2023-02-18 06:54:26.688803', 0, 0, 0),
(14, 'pbkdf2_sha256$390000$Of6i5JqTX4xsiAzH7FrC8e$UtL3UEo1R9Ljiip6RSSxuHwIBUizalltWNAS0x8ZCyU=', NULL, 0, 'clara2', '', '', 'clara@gmail.com', 0, 1, '2023-02-21 13:37:31.606431', 0, 1, 0),
(17, 'pbkdf2_sha256$390000$5yuCsT7nOnkIw0TZS5nZbt$5E6cKlLqQerrcbYnXE3d/36jPa7BbcPWFEWX7Z9SgwA=', '2023-03-10 17:50:34.634837', 0, 'suardi', '', '', 'suardi@gmail.com', 0, 1, '2023-02-21 16:59:21.654017', 1, 1, 0),
(19, 'pbkdf2_sha256$390000$rkLqsTp4JHe6PRSr4F40Ct$TnMvQuVOOgaGG81mPDw6qkh8jDfLfFXv7Ro4aHQmsrU=', '2023-02-22 05:18:41.436841', 0, 'carla', '', '', 'carla123@gmail.com', 0, 1, '2023-02-21 17:24:37.311643', 0, 1, 0),
(20, 'pbkdf2_sha256$390000$UgFTZ71KEH0q6QnSH7mcjW$eDyd2z4bTP9DYQJUjrdZPin939kDebI6TSltINvjnvE=', '2023-02-23 13:50:44.339331', 0, 'carlafs', '', '', 'clarafs235@gmail.com', 0, 1, '2023-02-23 12:52:00.990620', 1, 1, 0),
(21, 'pbkdf2_sha256$390000$mOcOWOyi50zFspvNYGJtP0$5erQ/u+GVNWRrIxsrh9uy9MViU550zcNOIAFOXscLLA=', '2023-03-11 14:17:51.403627', 0, 'sahril', '', '', 'sahril123@gmail.com', 0, 1, '2023-03-01 16:29:49.254684', 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_user_groups`
--

CREATE TABLE `app_sisfocvwaero_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_sisfocvwaero_user_user_permissions`
--

CREATE TABLE `app_sisfocvwaero_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add divisi', 8, 'add_divisi'),
(30, 'Can change divisi', 8, 'change_divisi'),
(31, 'Can delete divisi', 8, 'delete_divisi'),
(32, 'Can view divisi', 8, 'view_divisi'),
(33, 'Can add karyawan', 9, 'add_karyawan'),
(34, 'Can change karyawan', 9, 'change_karyawan'),
(35, 'Can delete karyawan', 9, 'delete_karyawan'),
(36, 'Can view karyawan', 9, 'view_karyawan'),
(37, 'Can add absensi', 10, 'add_absensi'),
(38, 'Can change absensi', 10, 'change_absensi'),
(39, 'Can delete absensi', 10, 'delete_absensi'),
(40, 'Can view absensi', 10, 'view_absensi'),
(41, 'Can add capture', 11, 'add_capture'),
(42, 'Can change capture', 11, 'change_capture'),
(43, 'Can delete capture', 11, 'delete_capture'),
(44, 'Can view capture', 11, 'view_capture'),
(45, 'Can add gambar', 11, 'add_gambar'),
(46, 'Can change gambar', 11, 'change_gambar'),
(47, 'Can delete gambar', 11, 'delete_gambar'),
(48, 'Can view gambar', 11, 'view_gambar'),
(49, 'Can add sakit', 12, 'add_sakit'),
(50, 'Can change sakit', 12, 'change_sakit'),
(51, 'Can delete sakit', 12, 'delete_sakit'),
(52, 'Can view sakit', 12, 'view_sakit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'app_sisfocvwaero', 'absensi'),
(8, 'app_sisfocvwaero', 'divisi'),
(11, 'app_sisfocvwaero', 'gambar'),
(9, 'app_sisfocvwaero', 'karyawan'),
(12, 'app_sisfocvwaero', 'sakit'),
(7, 'app_sisfocvwaero', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-18 06:16:17.926781'),
(2, 'auth', '0001_initial', '2023-02-18 06:16:18.239942'),
(3, 'admin', '0001_initial', '2023-02-18 06:16:18.310946'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-18 06:16:18.318455'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-18 06:16:18.328382'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-18 06:16:18.370731'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-18 06:16:18.412172'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-18 06:16:18.431785'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-18 06:16:18.443790'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-18 06:16:18.474323'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-18 06:16:18.479322'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-18 06:16:18.490159'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-18 06:16:18.508096'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-18 06:16:18.526704'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-18 06:16:18.540179'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-18 06:16:18.552277'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-18 06:16:18.575461'),
(18, 'sessions', '0001_initial', '2023-02-18 06:16:18.606009'),
(19, 'app_sisfocvwaero', '0001_initial', '2023-02-18 06:36:58.573231'),
(20, 'app_sisfocvwaero', '0002_divisi_karyawan', '2023-02-19 06:32:26.893328'),
(21, 'app_sisfocvwaero', '0003_alter_karyawan_divisi_id', '2023-02-19 08:26:13.209912'),
(22, 'app_sisfocvwaero', '0004_remove_karyawan_foto', '2023-02-19 09:24:06.968223'),
(23, 'app_sisfocvwaero', '0005_karyawan_foto', '2023-02-19 09:24:59.334610'),
(24, 'app_sisfocvwaero', '0006_alter_karyawan_foto', '2023-02-19 10:05:18.675976'),
(25, 'app_sisfocvwaero', '0007_alter_karyawan_alamat_alter_karyawan_foto_and_more', '2023-02-20 02:34:06.244239'),
(26, 'app_sisfocvwaero', '0008_alter_karyawan_foto', '2023-02-20 03:02:03.646621'),
(27, 'app_sisfocvwaero', '0009_absensi', '2023-02-26 07:13:02.481801'),
(28, 'app_sisfocvwaero', '0010_rename_user_location_absensi_location', '2023-02-26 07:24:25.741015'),
(29, 'app_sisfocvwaero', '0011_alter_absensi_tanggal', '2023-02-26 07:27:58.814941'),
(30, 'app_sisfocvwaero', '0012_absensi_user', '2023-02-27 09:49:53.101139'),
(31, 'app_sisfocvwaero', '0013_remove_absensi_distance_remove_absensi_location_and_more', '2023-03-04 08:20:08.999096'),
(32, 'app_sisfocvwaero', '0014_alter_absensi_image_keluar', '2023-03-05 02:28:23.324092'),
(33, 'app_sisfocvwaero', '0015_capture', '2023-03-05 02:47:23.579168'),
(34, 'app_sisfocvwaero', '0016_rename_capture_gambar', '2023-03-08 22:55:11.043512'),
(35, 'app_sisfocvwaero', '0017_alter_absensi_image_keluar', '2023-03-10 15:58:43.573204'),
(36, 'app_sisfocvwaero', '0018_alter_absensi_absen_keluar_alter_absensi_absen_masuk', '2023-03-11 11:02:40.545125'),
(37, 'app_sisfocvwaero', '0019_absensi_jml_jamlembur', '2023-03-11 11:21:03.717637'),
(38, 'app_sisfocvwaero', '0020_alter_absensi_absen_keluar_alter_absensi_absen_masuk', '2023-03-11 11:47:04.192018'),
(39, 'app_sisfocvwaero', '0021_alter_absensi_ket_keluar_alter_absensi_ket_masuk_and_more', '2023-03-12 06:04:03.116489');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('crsxcaekfvgzzvynw3qcxvh8qwzqnrmp', '.eJxVjDsOwjAQBe_iGln-xR9Kes4QrXc3OIBsKU4qxN0hUgpo38y8lxhhW8u4dV7GmcRZGC1Ov2MGfHDdCd2h3prEVtdlznJX5EG7vDbi5-Vw_w4K9PKtJ9YKnOLJRfYRAmaikBISABrwVjuI5ChZxRhQh5jVkIZJe2t8tgHE-wMvHjiS:1pb02h:xF9gReqtJpx4WxEXtkb-cXKh8M4xGyZQDExiy7lqTh8', '2023-03-25 14:17:51.407973');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `app_sisfocvwaero_absensi`
--
ALTER TABLE `app_sisfocvwaero_absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_sisfocvwaero_abs_user_id_899c3cd3_fk_app_sisfo` (`user_id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_divisi`
--
ALTER TABLE `app_sisfocvwaero_divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_gambar`
--
ALTER TABLE `app_sisfocvwaero_gambar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_karyawan`
--
ALTER TABLE `app_sisfocvwaero_karyawan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `app_sisfocvwaero_kar_divisi_id_id_4bfece4d_fk_app_sisfo` (`divisi_id_id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_sakit`
--
ALTER TABLE `app_sisfocvwaero_sakit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_sisfocvwaero_sak_absensi_id_6f289be7_fk_app_sisfo` (`absensi_id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_user`
--
ALTER TABLE `app_sisfocvwaero_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `app_sisfocvwaero_user_groups`
--
ALTER TABLE `app_sisfocvwaero_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_sisfocvwaero_user_groups_user_id_group_id_515fa6ab_uniq` (`user_id`,`group_id`),
  ADD KEY `app_sisfocvwaero_user_groups_group_id_8775f4c8_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `app_sisfocvwaero_user_user_permissions`
--
ALTER TABLE `app_sisfocvwaero_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_sisfocvwaero_user_us_user_id_permission_id_8e6c03ba_uniq` (`user_id`,`permission_id`),
  ADD KEY `app_sisfocvwaero_use_permission_id_b3f1d1a2_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_absensi`
--
ALTER TABLE `app_sisfocvwaero_absensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_divisi`
--
ALTER TABLE `app_sisfocvwaero_divisi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_gambar`
--
ALTER TABLE `app_sisfocvwaero_gambar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_karyawan`
--
ALTER TABLE `app_sisfocvwaero_karyawan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_sakit`
--
ALTER TABLE `app_sisfocvwaero_sakit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_user`
--
ALTER TABLE `app_sisfocvwaero_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_user_groups`
--
ALTER TABLE `app_sisfocvwaero_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `app_sisfocvwaero_user_user_permissions`
--
ALTER TABLE `app_sisfocvwaero_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `app_sisfocvwaero_absensi`
--
ALTER TABLE `app_sisfocvwaero_absensi`
  ADD CONSTRAINT `app_sisfocvwaero_abs_user_id_899c3cd3_fk_app_sisfo` FOREIGN KEY (`user_id`) REFERENCES `app_sisfocvwaero_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `app_sisfocvwaero_karyawan`
--
ALTER TABLE `app_sisfocvwaero_karyawan`
  ADD CONSTRAINT `app_sisfocvwaero_kar_divisi_id_id_4bfece4d_fk_app_sisfo` FOREIGN KEY (`divisi_id_id`) REFERENCES `app_sisfocvwaero_divisi` (`id`),
  ADD CONSTRAINT `app_sisfocvwaero_kar_user_id_0355cdf1_fk_app_sisfo` FOREIGN KEY (`user_id`) REFERENCES `app_sisfocvwaero_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `app_sisfocvwaero_sakit`
--
ALTER TABLE `app_sisfocvwaero_sakit`
  ADD CONSTRAINT `app_sisfocvwaero_sak_absensi_id_6f289be7_fk_app_sisfo` FOREIGN KEY (`absensi_id`) REFERENCES `app_sisfocvwaero_absensi` (`id`);

--
-- Ketidakleluasaan untuk tabel `app_sisfocvwaero_user_groups`
--
ALTER TABLE `app_sisfocvwaero_user_groups`
  ADD CONSTRAINT `app_sisfocvwaero_use_user_id_ed14782f_fk_app_sisfo` FOREIGN KEY (`user_id`) REFERENCES `app_sisfocvwaero_user` (`id`),
  ADD CONSTRAINT `app_sisfocvwaero_user_groups_group_id_8775f4c8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `app_sisfocvwaero_user_user_permissions`
--
ALTER TABLE `app_sisfocvwaero_user_user_permissions`
  ADD CONSTRAINT `app_sisfocvwaero_use_permission_id_b3f1d1a2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `app_sisfocvwaero_use_user_id_b8d1d082_fk_app_sisfo` FOREIGN KEY (`user_id`) REFERENCES `app_sisfocvwaero_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
