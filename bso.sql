-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2015 at 07:42 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bso`
--

-- --------------------------------------------------------

--
-- Table structure for table `berkas_dsn`
--

CREATE TABLE IF NOT EXISTS `berkas_dsn` (
  `id_berkas_dsn` int(10) NOT NULL AUTO_INCREMENT,
  `id_instruksi` int(10) NOT NULL,
  `nama_berkas` varchar(50) NOT NULL,
  `dir_berkas` varchar(50) NOT NULL,
  PRIMARY KEY (`id_berkas_dsn`),
  KEY `fk_berkas_dsn` (`id_instruksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `berkas_mhs`
--

CREATE TABLE IF NOT EXISTS `berkas_mhs` (
  `id_berkas_mhs` int(11) NOT NULL AUTO_INCREMENT,
  `nama_berkas` varchar(50) NOT NULL,
  `dir_berkas` varchar(50) NOT NULL,
  PRIMARY KEY (`id_berkas_mhs`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `berkas_mhs`
--

INSERT INTO `berkas_mhs` (`id_berkas_mhs`, `nama_berkas`, `dir_berkas`) VALUES
(1, 'matematikadiskrit1-140525031943-phpapp01.docx', './upload/docx/24087.docx'),
(2, 'PROGRAM KREATIFITAS MAHASISWA.docx', './upload/docx/50592.docx'),
(3, 'trik (1).txt', './upload/txt/94924.txt'),
(4, 'PROGRAM KREATIFITAS MAHASISWA.docx', './upload/docx/96105.docx');

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan`
--

CREATE TABLE IF NOT EXISTS `bimbingan` (
  `id_bimbingan` int(10) NOT NULL AUTO_INCREMENT,
  `kode_bimbingan` varchar(5) NOT NULL,
  `id_mhs` int(10) NOT NULL,
  PRIMARY KEY (`id_bimbingan`),
  KEY `fk_mahasiswa` (`id_mhs`),
  KEY `fk_klmp_bimbingan` (`kode_bimbingan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bimbingan`
--

INSERT INTO `bimbingan` (`id_bimbingan`, `kode_bimbingan`, `id_mhs`) VALUES
(1, '17JFv', 1),
(2, '17JFv', 2),
(3, '17JFv', 3),
(4, '4mCxq', 4),
(5, '17JFv', 5);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `id_dsn` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `jen_kel` enum('Laki-laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `bdg_keahlian` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `dir_foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dsn`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dsn`, `nama`, `nidn`, `jen_kel`, `tempat_lahir`, `tgl_lahir`, `alamat`, `telp`, `email`, `bdg_keahlian`, `username`, `password`, `dir_foto`) VALUES
(1, 'Budi Aryanto', '123.456.789', 'Laki-laki', 'Semarang', '1880-01-22', 'Tlogosari Semarang', '087765890123', 'budi@dsn.example.com', 'Ilmu Komputer', 'budi', '00dfc53ee86af02e742515cdcf075ed3', NULL),
(2, 'Clara Rahayu', '234.567.789', 'Laki-laki', 'Kendal', '1986-11-21', 'Sijeruk Kendal', '085764123980', 'clara@dsn.example.com', 'Ilmu Komputer', 'clara', '23d1e10df85ef805b442a922b240ce25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instruksi`
--

CREATE TABLE IF NOT EXISTS `instruksi` (
  `id_instruksi` int(10) NOT NULL AUTO_INCREMENT,
  `instruksi` varchar(225) NOT NULL,
  `dibuat_pd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_bimbingan` int(10) NOT NULL,
  PRIMARY KEY (`id_instruksi`),
  KEY `fk_bimbingan` (`id_bimbingan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `instruksi`
--

INSERT INTO `instruksi` (`id_instruksi`, `instruksi`, `dibuat_pd`, `id_bimbingan`) VALUES
(1, 'Kumpulkan draft Skripsinya saya tunggu sampai tgl 30 Januari', '2015-01-21 23:26:22', 1),
(2, 'Kerjakan BAB i', '2015-01-22 02:00:32', 3),
(3, 'Kerjakan Bab Selnjutnya', '2015-01-22 04:25:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `klmp_bimbingan`
--

CREATE TABLE IF NOT EXISTS `klmp_bimbingan` (
  `kode_bimbingan` varchar(5) NOT NULL,
  `id_dsn` int(10) NOT NULL,
  PRIMARY KEY (`kode_bimbingan`),
  KEY `fk_dosen` (`id_dsn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klmp_bimbingan`
--

INSERT INTO `klmp_bimbingan` (`kode_bimbingan`, `id_dsn`) VALUES
('17JFv', 1),
('4mCxq', 2);

-- --------------------------------------------------------

--
-- Table structure for table `komentar_dsn`
--

CREATE TABLE IF NOT EXISTS `komentar_dsn` (
  `id_komentar_dsn` int(10) NOT NULL AUTO_INCREMENT,
  `id_komentar_mhs` int(10) NOT NULL,
  `komentar` varchar(225) NOT NULL,
  `dibuat_pd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_komentar_dsn`),
  KEY `fk_komentar_dsn` (`id_komentar_mhs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `komentar_mhs`
--

CREATE TABLE IF NOT EXISTS `komentar_mhs` (
  `id_komentar_mhs` int(10) NOT NULL AUTO_INCREMENT,
  `id_instruksi` int(10) NOT NULL,
  `komentar` varchar(225) NOT NULL,
  `dibuat_pd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_komentar_mhs`),
  KEY `fk_komentar_mhs` (`id_instruksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `komentar_mhs`
--

INSERT INTO `komentar_mhs` (`id_komentar_mhs`, `id_instruksi`, `komentar`, `dibuat_pd`) VALUES
(1, 2, 'Revisi yang mana pak', '2015-01-22 02:03:20'),
(2, 3, 'Masih Bingung pak ', '2015-01-22 04:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id_mhs` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `prodi` varchar(30) NOT NULL,
  `jen_kel` enum('Laki-laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `dir_foto` varchar(50) DEFAULT NULL,
  `jdl_skripsi` text NOT NULL,
  PRIMARY KEY (`id_mhs`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama`, `nim`, `prodi`, `jen_kel`, `tempat_lahir`, `tgl_lahir`, `alamat`, `telp`, `email`, `username`, `password`, `dir_foto`, `jdl_skripsi`) VALUES
(1, 'Muhamad Farikhin', 'A11.2013.07504', 'Teknik Informatika S1', 'Laki-laki', 'Kendal', '1994-04-02', 'Sidorejo Kendal', '081901713900', 'm.farikhin94@gmail.com', 'far', '17d965747c701d6ffb406cad0f4265dc', NULL, '-'),
(2, 'Riski Adi Nugroho', 'A11.2013.07500', 'Teknik Informatika S1', 'Laki-laki', 'Semarang', '1995-07-15', 'Kaligawe Semarang', '089123456789', 'riski@example.com', 'riskie', 'a7bc352be7e77ff222d93385e89b5a74', NULL, '-'),
(3, 'Lisa Kurnia', 'A11.2013.07921', 'Teknik Informatika S1', 'Perempuan', 'Kab. Semarang', '1989-08-19', 'Tengaran Kab. Semarang Jawa Tengah', '08985588982', 'lisakurnia98@rcketmail.cm', 'lisa', 'e8c05c6a94dc1712764e326d4b886888', NULL, 'SMS Gateway layanan custmer care'),
(4, 'Afit Dzulfiana', 'a11.2013.07630', 'Teknik Informatika S1', 'Laki-laki', 'jerman', '2015-01-02', 'semarang', '0888888888888', 'emailsaya@gmail.com', 'aaaa', 'e807f1fcf82d132f9bb018ca6738a19f', NULL, '-'),
(5, 'nama saya', 'a11.2013.0888', 'Sistem Informasi S1', 'Laki-laki', 'Semarang', '2015-01-06', 'jl nakula 60 semarang', '0897878787', 'abcdef@gmail.cm', 'abcdef', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '-');

-- --------------------------------------------------------

--
-- Table structure for table `pengumpulan_tgs`
--

CREATE TABLE IF NOT EXISTS `pengumpulan_tgs` (
  `id_pengumpulan_tgs` int(10) NOT NULL AUTO_INCREMENT,
  `id_tugas` int(10) NOT NULL,
  `pesan` varchar(225) NOT NULL,
  `dibuat_pd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_berkas_mhs` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_pengumpulan_tgs`),
  KEY `fk_pengumpulan_tgs` (`id_tugas`),
  KEY `fk_berkas_mhs` (`id_berkas_mhs`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pengumpulan_tgs`
--

INSERT INTO `pengumpulan_tgs` (`id_pengumpulan_tgs`, `id_tugas`, `pesan`, `dibuat_pd`, `id_berkas_mhs`) VALUES
(1, 2, 'Ya ', '2015-01-22 02:01:13', 1),
(2, 1, 'ini pak filenya ', '2015-01-22 04:23:48', 2),
(3, 3, 'ya', '2015-01-22 06:20:45', 4);

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

CREATE TABLE IF NOT EXISTS `penugasan` (
  `id_tugas` int(10) NOT NULL AUTO_INCREMENT,
  `id_instruksi` int(10) NOT NULL,
  `validasi` enum('OK','Revisi','Bimbingan Selesai') DEFAULT NULL,
  `mengumpulkan` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_tugas`),
  KEY `fk_penugasan` (`id_instruksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `penugasan`
--

INSERT INTO `penugasan` (`id_tugas`, `id_instruksi`, `validasi`, `mengumpulkan`) VALUES
(1, 1, 'OK', 1),
(2, 2, 'Revisi', 0),
(3, 3, 'OK', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berkas_dsn`
--
ALTER TABLE `berkas_dsn`
  ADD CONSTRAINT `fk_berkas_dsn` FOREIGN KEY (`id_instruksi`) REFERENCES `instruksi` (`id_instruksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD CONSTRAINT `fk_klmp_bimbingan` FOREIGN KEY (`kode_bimbingan`) REFERENCES `klmp_bimbingan` (`kode_bimbingan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mahasiswa` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instruksi`
--
ALTER TABLE `instruksi`
  ADD CONSTRAINT `fk_bimbingan` FOREIGN KEY (`id_bimbingan`) REFERENCES `bimbingan` (`id_bimbingan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `klmp_bimbingan`
--
ALTER TABLE `klmp_bimbingan`
  ADD CONSTRAINT `fk_dosen` FOREIGN KEY (`id_dsn`) REFERENCES `dosen` (`id_dsn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komentar_dsn`
--
ALTER TABLE `komentar_dsn`
  ADD CONSTRAINT `fk_komentar_dsn` FOREIGN KEY (`id_komentar_mhs`) REFERENCES `komentar_mhs` (`id_komentar_mhs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komentar_mhs`
--
ALTER TABLE `komentar_mhs`
  ADD CONSTRAINT `fk_komentar_mhs` FOREIGN KEY (`id_instruksi`) REFERENCES `instruksi` (`id_instruksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengumpulan_tgs`
--
ALTER TABLE `pengumpulan_tgs`
  ADD CONSTRAINT `fk_berkas_mhs` FOREIGN KEY (`id_berkas_mhs`) REFERENCES `berkas_mhs` (`id_berkas_mhs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengumpulan_tgs` FOREIGN KEY (`id_tugas`) REFERENCES `penugasan` (`id_tugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD CONSTRAINT `fk_penugasan` FOREIGN KEY (`id_instruksi`) REFERENCES `instruksi` (`id_instruksi`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
