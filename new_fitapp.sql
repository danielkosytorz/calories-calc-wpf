-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Sie 2021, 18:15
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `new_fitapp`
--

DELIMITER $$
--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calcBMI` (`Height` DECIMAL, `Weight` DECIMAL) RETURNS DECIMAL(9,2) BEGIN
  DECLARE bmi DECIMAL(9,2);
  SET bmi = Weight / Height*Height;
  RETURN bmi;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `breakfast_to_food`
--

CREATE TABLE `breakfast_to_food` (
  `UserBreakfastID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `breakfast_to_food`
--

INSERT INTO `breakfast_to_food` (`UserBreakfastID`, `FoodID`) VALUES
(0, 0),
(0, 4),
(0, 6),
(1, 21),
(1, 2),
(2, 2),
(4, 6),
(6, 5),
(8, 10),
(9, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dinner_to_food`
--

CREATE TABLE `dinner_to_food` (
  `UserDinnerID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `dinner_to_food`
--

INSERT INTO `dinner_to_food` (`UserDinnerID`, `FoodID`) VALUES
(0, 17),
(0, 60),
(0, 135),
(1, 19),
(1, 332),
(5, 9),
(2, 11),
(4, 7),
(4, 6),
(6, 9),
(7, 2),
(6, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exercises`
--

CREATE TABLE `exercises` (
  `ExerciseID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CaloriesBurned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `exercises`
--

INSERT INTO `exercises` (`ExerciseID`, `Name`, `CaloriesBurned`) VALUES
(0, 'Żeglarstwo (sportowe)', 315),
(1, 'Żeglarstwo (rekreacyjnie)', 231),
(2, 'Zumba', 476),
(3, 'Wspinaczka skałkowa', 756),
(4, 'Wspinaczka', 560),
(5, 'Wioślarstwo', 595),
(6, 'Wiosłowanie na łodzi', 280),
(7, 'Windsurfing (ślizg, pompowanie)', 945),
(8, 'Windsurfing (rekreacyjnie)', 350),
(9, 'Wędkowanie', 210),
(10, 'Urządzenie eliptyczne (orbitrek) - umiarkowane tempo', 350),
(11, 'Urządzenie eliptyczne (orbitrek) - intensywnie', 560),
(12, 'Trucht', 420),
(13, 'Trening z piłką gimnastyczną', 196),
(14, 'Trening z kettlami', 560),
(15, 'Trening rozciągający (streching)', 161),
(16, 'Tenis ziemny', 616),
(17, 'Tenis', 560),
(18, 'Taniec współczesny - modern dance (występ lub duży wysiłek)', 476),
(19, 'Taniec współczesny - modern dance (próba, zajęcia)', 336),
(20, 'Taniec towarzyski (wolne tempo)', 210),
(21, 'Taniec towarzyski (szybkie tempo)', 385),
(22, 'Taniec swing', 315),
(23, 'Taniec salsa', 315),
(24, 'Taniec na rurze', 560),
(25, 'Taniec jazzowy (zajęcia, próba)', 350),
(26, 'Taniec jazzowy (występ lub duży wysiłek)', 476),
(27, 'Taniec hip-hop', 385),
(28, 'Taniec flamenco', 315),
(29, 'Taniec brzucha', 315),
(30, 'Taniec brzucha', 315),
(31, 'Taniec - salsa', 315),
(32, 'Symulator schodów - stairmill', 630),
(33, 'Surfing (zawody)', 350),
(34, 'Surfing (rekreacyjnie)', 210),
(35, 'StepMania', 581),
(36, 'Steper', 490),
(37, 'Step aerobik (wys.stepu: 25-30 cm)', 672),
(38, 'Step aerobik (wys.stepu: 15-20 cm)', 525),
(39, 'Step aerobik (wys.stepu: 10 cm)', 385),
(40, 'Squash', 840),
(41, 'Spinning (trening na rowerach)', 595),
(42, 'Spacer wolny', 196),
(43, 'Spacer szybki ( 6 km/h )', 315),
(44, 'Spacer', 245),
(45, 'Spacer', 245),
(46, 'Slow jogging', 385),
(47, 'Skakanka (spokojnie)', 574),
(48, 'Skakanka (intensywnie)', 770),
(49, 'Siłownia (średnio intensywnie)', 490),
(50, 'Siłownia (lekkie ćwiczenia)', 245),
(51, 'Siłownia (ćwiczenia intensywne)', 595),
(52, 'Siatkówka wodna', 350),
(53, 'Siatkówka plażowa', 560),
(54, 'Siatkówka', 280),
(55, 'Rower stacjonarny, wolno (5 METS)', 350),
(56, 'Rower stacjonarny, wolno (4 METS)', 280),
(57, 'Rower stacjonarny, umiarkowanie (7 METS)', 490),
(58, 'Rower stacjonarny, umiarkowanie (6 METS)', 420),
(59, 'Rower stacjonarny, szybko (9 METS)', 630),
(60, 'Rower stacjonarny, szybko (8 METS)', 560),
(61, 'Rower stacjonarny, bardzo wolno (3 METS)', 210),
(62, 'Rower stacjonarny, bardzo szybko (12 METS)', 840),
(63, 'Rower stacjonarny, bardzo szybko (11 METS)', 770),
(64, 'Przysiady', 350),
(65, 'Przysiad wykroczny', 266),
(66, 'Pompki (umiarkowane tempo)', 266),
(67, 'Pompki (energicznie)', 560),
(68, 'Podnoszenie ciężarów', 420),
(69, 'Podciąganie (umiarkowane tempo)', 266),
(70, 'Podciąganie (energicznie)', 560),
(71, 'Pływanie stylem motylkowym', 966),
(72, 'Pływanie stylem klasycznym (wolno)', 371),
(73, 'Pływanie stylem klasycznym (szybko)', 721),
(74, 'Pływanie stylem grzbietowym (wolno)', 336),
(75, 'Pływanie stylem grzbietowym (szybko)', 665),
(76, 'Pływanie kraulem (wolne tempo)', 406),
(77, 'Pływanie kraulem (umiarkowane tempo)', 581),
(78, 'Pływanie kraulem (szybkie tempo)', 700),
(79, 'Ping pong', 280),
(80, 'Piłka ręczna', 840),
(81, 'Piłka nożna', 630),
(82, 'Pilates', 210),
(83, 'Nurkowanie ze sprzętem', 490),
(84, 'Nurkowanie z rurką (snorkeling)', 350),
(85, 'Nurkowanie na zatrzymanym oddechu (tempo umiarkowane)', 826),
(86, 'Nurkowanie na zatrzymanym oddechu (tempo szybkie)', 1106),
(87, 'Nurkowanie na zatrzymanym oddechu (rekreacyjnie)', 490),
(88, 'Nordic Walking - wolno 4 km/h', 308),
(89, 'Nordic Walking - średnie tempo 5 km/h', 392),
(90, 'Nordic Walking - szybko 6 km/h', 476),
(91, 'Nordic Walking - bardzo szybko 7.3 km/h', 504),
(92, 'Łowienie ryb', 210),
(93, 'Kręgle', 210),
(94, 'Koszykówka', 560),
(95, 'Kolarstwo górskie', 595),
(96, 'Kitesurfing (kiteboarding)', 770),
(97, 'Karate', 700),
(98, 'Kajakarstwo powyżej 9.5 km/h (szybkie tempo)', 875),
(99, 'Kajakarstwo 6.5 - 9.5 km/h (umiarkowane tempo)', 406),
(100, 'Aerobik (intensywnie)', 511),
(101, 'Aerobik (spokojnie)', 364),
(102, 'Aerobik (umiarkowane tempo)', 420),
(103, 'Aerobik z ciężarkami (4.5 - 6.5 kg)', 700),
(104, 'Aqua Aerobik (aerobik wodny)', 385),
(105, 'Badminton', 399),
(106, 'Balet (występ lub duży wysiłek)', 476),
(107, 'Balet (zajęcia, próba)', 350),
(108, 'Bieganie 10 km/h', 735),
(109, 'Bieganie 11 km/h', 770),
(110, 'Bieganie 12 km/h', 826),
(111, 'Bieganie 13 km/h (szybko)', 938),
(112, 'Bieganie 14 km/h (bardzo szybko)', 1001),
(113, 'Bieganie 15 km/h (bardzo szybko)', 1071),
(114, 'Bieganie 16 km/h (bardzo szybko)', 1134),
(115, 'Bieganie 17 km/h (sprint)', 1204),
(116, 'Bieganie 18 km/h (sprint)', 1267),
(117, 'Bieganie 6.5 km/h (trucht)', 420),
(118, 'Bieganie 7 km/h (powoli)', 539),
(119, 'Bieganie 8 km/h (powoli)', 581),
(120, 'Bieganie 9 km/h', 672),
(121, 'Bieganie 9.5 km/h', 686),
(122, 'Bilard', 168),
(123, 'Boks', 651),
(124, 'Brzuszki niepełne', 196),
(125, 'Brzuszki pełne (energicznie)', 560),
(126, 'Brzuszki pełne (spokojne tempo)', 196),
(127, 'Brzuszki pełne (umiarkowane tempo)', 266),
(128, 'Callanetics', 315),
(129, 'Chodzenie 2 km/h (bardzo wolno)', 140),
(130, 'Chodzenie 3 km/h (wolno)', 168),
(131, 'Chodzenie 4 km/h (szybko)', 203),
(132, 'Chodzenie 5 km/h (szybko)', 245),
(133, 'Chodzenie 6 km/h (szybko)', 315),
(134, 'Chodzenie po górach', 371),
(135, 'Ergometr ramion', 196),
(136, 'Ergometr wioślarski (wolno)', 336),
(137, 'Ergometr wioślarski umiarkowanie (6 METS)', 420),
(138, 'Ergometr wioślarski, bardzo szybko (12 METS)', 840),
(139, 'Ergometr wioślarski, szybko (9 METS)', 630),
(140, 'Ergometr wioślarski, umiarkowanie (7 METS)', 490),
(141, 'Golf', 315),
(142, 'Gra Frisbee', 210),
(143, 'Hula hop', 280),
(144, 'Jazda konna', 280),
(145, 'Jazda na deskorolce', 371),
(146, 'Jazda na łyżwach', 490),
(147, 'Jazda na nartach biegówkach', 574),
(148, 'Jazda na nartach wodnych', 490),
(149, 'Jazda na nartach zjazdówkach', 511),
(150, 'Jazda na rolkach', 490),
(151, 'Jazda na rolkach', 399),
(152, 'Jazda na rowerze (10 km/h)', 245),
(153, 'Jazda na rowerze (11 -15km/h)', 280),
(154, 'Jazda na rowerze (16-19 km/h)', 476),
(155, 'Jazda na rowerze (19-22 km/h)', 560),
(156, 'Jazda na rowerze (23-25 km/h)', 700),
(157, 'Jazda na rowerze (25-30 km/h)', 840),
(158, 'Jazda na rowerze (powyżej 30 km/h)', 1106),
(159, 'Jazda na snowboardzie', 490),
(160, 'Joga (ogólnie)', 175),
(161, 'Joga Hatha', 175),
(162, 'Joga Power', 280),
(163, 'Jogging wodny', 686);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `food`
--

CREATE TABLE `food` (
  `FoodID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Calories` decimal(10,1) NOT NULL,
  `Protein` decimal(10,1) NOT NULL,
  `Carbohydrates` decimal(10,1) NOT NULL,
  `Fat` decimal(10,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `food`
--

INSERT INTO `food` (`FoodID`, `Name`, `Calories`, `Protein`, `Carbohydrates`, `Fat`) VALUES
(0, 'Agrest', '41.0', '0.8', '0.2', '11.8'),
(1, 'Amarantus. nasiona', '400.0', '14.5', '6.5', '66.2'),
(2, 'Ananas', '54.0', '0.4', '0.2', '13.6'),
(3, 'Ananas w syropie', '84.0', '0.4', '0.1', '21.0'),
(4, 'Anyż', '337.0', '17.6', '16.0', '50.0'),
(5, 'Arbuz', '36.0', '0.6', '0.1', '8.4'),
(6, 'Avocado', '160.0', '2.0', '15.3', '7.4'),
(7, 'Bakłażan', '21.0', '1.1', '0.1', '6.3'),
(8, 'Baleron', '244.0', '15.1', '20.2', '0.9'),
(9, 'Banan', '95.0', '1.0', '0.3', '23.5'),
(10, 'Banany suszone', '360.0', '3.8', '1.1', '88.8'),
(11, 'Bazylia suszona', '251.0', '14.3', '4.0', '61.0'),
(12, 'Bazylia świeża', '23.0', '3.2', '0.6', '2.7'),
(13, 'Biała rzodkiew', '14.0', '1.0', '0.0', '3.0'),
(14, 'Białko jajka kurzego', '49.0', '10.9', '0.2', '0.7'),
(15, 'Bób', '66.0', '7.1', '0.4', '14.0'),
(16, 'Boćwina', '17.0', '2.1', '0.5', '5.5'),
(17, 'Boczek wędzony', '477.0', '13.0', '47.0', '0.0'),
(18, 'Botwinka', '17.0', '2.1', '0.5', '5.5'),
(19, 'Brokuły', '27.0', '3.0', '0.4', '5.2'),
(20, 'Brukselka', '37.0', '4.7', '0.5', '8.7'),
(21, 'Brzoskwinia', '46.0', '1.0', '0.2', '11.9'),
(22, 'Brzoskwinia w syropie', '73.0', '0.4', '0.1', '18.2'),
(23, 'Bułka owsiana', '304.0', '9.3', '4.5', '58.4'),
(24, 'Bułka pszenna zwykła', '273.0', '8.1', '1.5', '57.7'),
(25, 'Bułka sojowa', '315.0', '10.1', '4.0', '61.1'),
(26, 'Bułka tarta', '347.0', '9.7', '1.9', '77.6'),
(27, 'Bułka wrocławskia', '294.0', '8.0', '4.4', '56.6'),
(28, 'Burak', '38.0', '1.8', '0.1', '9.5'),
(29, 'Cebula', '30.0', '1.4', '0.4', '6.9'),
(30, 'Cebula czerwona', '30.0', '1.4', '0.4', '6.9'),
(31, 'Cebula konserwowa', '52.0', '0.7', '0.2', '12.4'),
(32, 'Cebulka dymka', '30.0', '1.4', '0.4', '6.9'),
(33, 'Chili', '40.0', '0.4', '0.1', '1.8'),
(34, 'Chleb chrupki', '353.0', '8.7', '2.4', '78.9'),
(35, 'Chleb pszenny', '257.0', '8.5', '1.4', '54.3'),
(36, 'Chleb zwykły', '248.0', '6.1', '1.3', '56.3'),
(37, 'Chleb żytni pełnoziarnisty', '225.0', '6.8', '1.8', '53.8'),
(38, 'Chleb żytni razowy', '213.0', '5.9', '1.7', '51.2'),
(39, 'Chrzan', '67.0', '4.5', '0.6', '18.1'),
(40, 'Ciecierzyca konserwowa', '127.0', '6.0', '3.0', '18.0'),
(41, 'Cieciorka', '364.0', '19.3', '6.0', '60.6'),
(42, 'Cielęcina łopatka', '106.0', '19.9', '2.8', '0.0'),
(43, 'Cielęcina sznyclówka', '105.0', '20.5', '2.4', '0.0'),
(44, 'Cielęcina udziec', '108.0', '19.9', '3.1', '0.0'),
(45, 'Cukier', '405.0', '0.0', '0.0', '99.8'),
(46, 'Cukier brązowy', '380.0', '0.1', '0.0', '98.0'),
(47, 'Cukier puder', '387.0', '0.0', '0.0', '100.0'),
(48, 'Cukinia', '15.0', '1.2', '0.1', '3.2'),
(49, 'Curry', '325.0', '13.0', '14.0', '58.0'),
(50, 'Ćwikła', '40.0', '1.6', '0.1', '10.2'),
(51, 'Cykoria', '21.0', '1.7', '0.2', '4.1'),
(52, 'Cynamon', '247.0', '4.0', '1.2', '81.0'),
(53, 'Cytryna', '36.0', '0.8', '0.3', '9.5'),
(54, 'Czekolada gorzka', '554.0', '6.7', '34.3', '56.6'),
(55, 'Czereśnie', '61.0', '1.0', '0.3', '14.6'),
(56, 'Czerwona fasola konserwowa ', '87.0', '8.1', '0.6', '12.3'),
(57, 'Czosnek', '146.0', '6.4', '0.5', '32.6'),
(58, 'Czosnek granulowany', '331.0', '17.0', '0.7', '73.0'),
(59, 'Daktyle suszone', '277.0', '2.0', '0.4', '74.0'),
(60, 'Dorsz filety bez skóry', '70.0', '16.5', '0.3', '0.0'),
(61, 'Dynia', '28.0', '1.3', '0.3', '7.7'),
(62, 'Dżem jagodowy niskosłodzony', '153.0', '0.3', '0.2', '38.2'),
(63, 'Dżem śliwkowy niskosłodzony', '153.0', '0.3', '0.1', '37.9'),
(64, 'Dżem truskawkowy niskosłodzony', '153.0', '0.3', '0.2', '37.8'),
(65, 'Dżem wiśniowy niskosłodzony', '154.0', '0.4', '0.2', '37.5'),
(66, 'Ekstrakt z wanilii', '288.0', '0.0', '0.0', '14.0'),
(67, 'Estragon', '295.0', '23.0', '7.2', '50.0'),
(68, 'Fasola biała suche nasiona', '288.0', '21.4', '1.6', '61.6'),
(69, 'Fasola cięta. konserwowa. bez zalewy', '16.0', '1.5', '0.2', '4.5'),
(70, 'Fasola szparagowa', '27.0', '2.4', '0.2', '7.6'),
(71, 'Fasolka szparagowa. mrożonka', '24.0', '2.2', '0.2', '6.8'),
(72, 'Figi suszone', '290.0', '3.6', '1.2', '78.0'),
(73, 'Filet z makreli w sosie pomidorowym', '150.0', '13.1', '9.0', '4.0'),
(74, 'Flądra świeża', '83.0', '16.5', '1.8', '0.0'),
(75, 'Gałka muszkatołowa', '475.0', '6.7', '32.0', '50.0'),
(76, 'Goździk', '323.0', '6.0', '20.0', '61.0'),
(77, 'Grahamka', '252.0', '9.0', '1.7', '56.1'),
(78, 'Granat', '83.0', '1.7', '1.2', '18.7'),
(79, 'Grejpfrut', '36.0', '0.6', '0.2', '9.8'),
(80, 'Grejpfrut czerwony', '42.0', '0.8', '0.1', '10.7'),
(81, 'Grejpfrut zielony', '36.0', '0.6', '0.2', '9.8'),
(82, 'Groch suche nasiona', '293.0', '23.8', '1.4', '60.2'),
(83, 'Groszek ptysiowy', '476.0', '14.9', '30.2', '37.6'),
(84, 'Groszek zielony', '75.0', '6.7', '0.4', '17.0'),
(85, 'Groszek zielony konserwowy', '63.0', '4.9', '0.2', '15.8'),
(86, 'Gruszka', '54.0', '0.6', '0.2', '14.4'),
(87, 'Grzyby suszone', '284.0', '9.3', '0.7', '73.0'),
(88, 'Halibut świeży', '98.0', '20.1', '1.9', '0.0'),
(89, 'Herbata bez cukru', '0.0', '0.1', '0.0', '0.0'),
(90, 'Imbir', '347.0', '9.1', '6.0', '71.0'),
(91, 'Jabłka suszone', '238.0', '2.1', '2.1', '62.3'),
(92, 'Jabłko', '46.0', '0.4', '0.4', '12.1'),
(93, 'Jagody', '45.0', '0.8', '0.6', '12.2'),
(94, 'Jajko kurze', '139.0', '12.5', '9.7', '0.6'),
(95, 'Jajko przepiórcze', '158.0', '13.0', '11.0', '0.4'),
(96, 'Jarmuż', '29.0', '3.3', '0.7', '6.1'),
(97, 'Jogurt naturalny', '60.0', '4.3', '2.0', '3.6'),
(98, 'Kabanos', '326.0', '27.4', '24.3', '0.0'),
(99, 'Kabanos z kurczaka', '247.0', '22.8', '17.4', '0.1'),
(100, 'Kajzerka', '296.0', '8.4', '3.6', '58.6'),
(101, 'Kakao w proszku', '448.0', '18.2', '21.7', '50.6'),
(102, 'Kalafior', '22.0', '2.4', '0.2', '5.0'),
(103, 'Kalarepa', '29.0', '2.2', '0.3', '6.5'),
(104, 'Kapary', '23.0', '2.4', '0.9', '4.9'),
(105, 'Kapusta biała', '29.0', '1.7', '0.2', '7.4'),
(106, 'Kapusta czerwona', '27.0', '1.9', '0.2', '6.7'),
(107, 'Kapusta kwaszona', '12.0', '1.1', '0.2', '3.4'),
(108, 'Kapusta pekińska', '12.0', '1.2', '0.2', '3.2'),
(109, 'Kapusta włoska', '38.0', '3.3', '0.4', '7.8'),
(110, 'Kardamon', '311.0', '11.0', '6.7', '68.0'),
(111, 'Karp świeży', '110.0', '18.0', '4.2', '0.0'),
(112, 'Kasza gryczana', '336.0', '12.6', '3.1', '69.3'),
(113, 'Kasza jaglana', '346.0', '10.5', '2.9', '71.6'),
(114, 'Kasza jęczmienna pęczak', '334.0', '8.4', '2.0', '74.9'),
(115, 'Kasza jęczmienna perłowa', '327.0', '6.9', '2.2', '75.0'),
(116, 'Kasza kukurydziana', '337.0', '8.0', '1.7', '72.0'),
(117, 'Kasza manna', '348.0', '8.7', '1.3', '76.7'),
(118, 'Kaszanka jęczmienna', '195.0', '8.5', '12.6', '13.0'),
(119, 'Kawa bez cukru', '2.0', '0.2', '0.0', '0.3'),
(120, 'Keczup', '93.0', '1.8', '1.0', '22.2'),
(121, 'Kefir', '51.0', '3.4', '2.0', '4.7'),
(122, 'Kefir', '51.0', '3.4', '2.0', '4.7'),
(123, 'Kiełbasa delikatesowa z kurczaka', '109.0', '19.6', '3.3', '0.1'),
(124, 'Kiełbasa domowa', '320.0', '14.7', '29.2', '0.5'),
(125, 'Kiełbasa jałowcowa z kurczaka', '236.0', '19.0', '17.9', '0.1'),
(126, 'Kiełbasa kanapkowa z kurczaka', '179.0', '11.8', '13.5', '3.0'),
(127, 'Kiełbasa lubuska', '249.0', '17.5', '18.0', '4.8'),
(128, 'Kiełbasa parówkowa', '323.0', '11.0', '31.5', '0.0'),
(129, 'Kiełbasa podlaska z kurczaka', '232.0', '20.7', '16.7', '0.1'),
(130, 'Kiełbasa podsuszana z kurczaka', '162.0', '21.7', '8.4', '0.0'),
(131, 'Kiełbasa podwawelska', '247.0', '17.3', '19.6', '0.9'),
(132, 'Kiełbasa rzeszowska', '203.0', '20.9', '13.4', '0.0'),
(133, 'Kiełbasa śląska', '210.0', '18.4', '15.3', '0.0'),
(134, 'Kiełbasa sucha krakowska', '323.0', '25.6', '24.8', '0.0'),
(135, 'Kiełbasa sucha myśliwska', '291.0', '27.8', '20.1', '0.0'),
(136, 'Kiełbasa szynkowa z kurczaka', '110.0', '16.2', '5.0', '0.0'),
(137, 'Kiełbasa toruńska', '263.0', '20.9', '20.1', '0.0'),
(138, 'Kiełbasa zwyczajna', '209.0', '17.6', '15.6', '0.0'),
(139, 'Kiełbasa żywiecka', '315.0', '20.3', '26.3', '0.0'),
(140, 'Kiełbaski bawarskie', '308.0', '15.5', '27.7', '0.1'),
(141, 'Kiełki bambusa', '20.0', '1.1', '0.6', '2.0'),
(142, 'Kiełki brokuła', '57.0', '5.0', '0.0', '6.8'),
(143, 'Kiełki buraka', '37.0', '1.6', '0.2', '9.6'),
(144, 'Kiełki fasoli mung', '29.0', '3.0', '0.4', '6.2'),
(145, 'Kiełki lucerny', '23.0', '4.0', '0.7', '2.1'),
(146, 'Kiełki rzodkiewki', '43.0', '3.8', '2.5', '3.6'),
(147, 'Kiełki słonecznika', '31.0', '3.4', '0.7', '4.0'),
(148, 'Kiełki soczewicy', '119.0', '9.0', '0.6', '22.1'),
(149, 'Kiełki soi', '141.0', '13.1', '6.7', '9.6'),
(150, 'Kiwi', '56.0', '0.9', '0.5', '13.9'),
(151, 'Kminek', '333.0', '20.0', '15.0', '50.0'),
(152, 'Kolendra', '279.0', '22.0', '4.8', '52.0'),
(153, 'Komosa ryżowa - quinoa', '334.0', '14.8', '5.0', '58.5'),
(154, 'Komosa ryżowa - Quinoa', '334.0', '15.0', '5.0', '58.0'),
(155, 'Koncentrat pomidorowy', '92.0', '5.6', '1.5', '16.7'),
(156, 'Koperek', '26.0', '2.8', '0.4', '6.1'),
(157, 'Kostka rosołowa Rosół z kury z pietruszką i lubczykiem ', '300.0', '10.0', '20.0', '10.0'),
(158, 'Krewetka tygrysia', '92.0', '22.0', '0.0', '1.0'),
(159, 'Kukurydza kolba', '110.0', '3.7', '1.5', '23.4'),
(160, 'Kukurydza konserwowa', '102.0', '2.9', '1.2', '23.6'),
(161, 'Kumin (kmin rzymski)', '429.0', '17.0', '22.0', '34.0'),
(162, 'Kurki', '32.0', '1.5', '0.5', '6.9'),
(163, 'Kurkuma', '354.0', '7.8', '9.9', '65.0'),
(164, 'Len mielony', '253.0', '40.0', '9.0', '3.0'),
(165, 'Len w nasionach', '500.0', '24.5', '31.0', '35.0'),
(166, 'Limonka', '30.0', '0.7', '0.2', '10.5'),
(167, 'Liście mięty', '77.0', '3.8', '0.9', '15.0'),
(168, 'Liść laurowy', '313.0', '7.6', '8.4', '75.0'),
(169, 'Łosoś smażony', '380.0', '21.2', '31.4', '4.0'),
(170, 'Łosoś świeży', '201.0', '19.9', '13.6', '0.0'),
(171, 'Łosoś wędzony', '162.0', '21.5', '8.4', '0.0'),
(172, 'Magii', '17.0', '2.7', '0.0', '1.5'),
(173, 'Majeranek', '271.0', '13.0', '7.0', '61.0'),
(174, 'Majonez', '714.0', '1.3', '79.0', '2.6'),
(175, 'Mak', '478.0', '20.1', '42.9', '24.7'),
(176, 'Mąka kukurydziana', '337.0', '5.9', '3.0', '78.0'),
(177, 'Mąka pszenna typ', '1850.0', '309.0', '11.9', '2.3'),
(178, 'Mąka pszenna typ', '500.0', '343.0', '10.1', '1.2'),
(179, 'Mąka pszenna typ', '550.0', '344.0', '10.5', '1.6'),
(180, 'Mąka pszenna typ', '750.0', '341.0', '11.6', '1.8'),
(181, 'Makaron bezjajeczny', '364.0', '11.0', '1.6', '77.6'),
(182, 'Makaron czterojajeczny', '391.0', '13.2', '3.4', '78.3'),
(183, 'Makaron dwujajeczny', '373.0', '12.0', '2.6', '76.8'),
(184, 'Makaron farfalline pełnoziarnisty z', '351.0', '14.4', '2.5', '63.8'),
(185, 'Makaron penne pełnoziarnisty', '345.0', '15.2', '1.3', '68.0'),
(186, 'Makaron rurki (z pszenicy Durum)', '350.0', '12.0', '1.5', '72.1'),
(187, 'Makaron ryżowy', '356.0', '6.8', '0.7', '83.0'),
(188, 'Makaron spaghetti razowy', '354.0', '13.0', '2.5', '66.5'),
(189, 'Mąka ryżowa', '348.0', '7.2', '0.7', '79.2'),
(190, 'Mąka żytnia typ', '1400.0', '310.0', '7.1', '2.2'),
(191, 'Mąka żytnia typ', '2000.0', '301.0', '8.1', '2.2'),
(192, 'Mąka żytnia typ', '580.0', '330.0', '5.1', '1.5'),
(193, 'Mąka żytnia typ', '720.0', '327.0', '5.9', '1.7'),
(194, 'Makrela świeża', '181.0', '18.7', '11.9', '0.0'),
(195, 'Makrela wędzona', '221.0', '20.7', '15.5', '0.0'),
(196, 'Maliny', '29.0', '1.3', '0.3', '12.0'),
(197, 'Mandarynki', '42.0', '0.6', '0.2', '11.2'),
(198, 'Mango', '67.0', '0.5', '0.3', '17.0'),
(199, 'Marchewka', '27.0', '1.0', '0.2', '8.7'),
(200, 'Marchewka z groszkiem. mrożonka', '39.0', '2.6', '0.3', '10.4'),
(201, 'Marchewki mini', '41.0', '1.0', '0.0', '9.0'),
(202, 'Maślanka', '37.0', '3.4', '0.5', '4.7'),
(203, 'Masło ekstra', '735.0', '0.7', '82.5', '0.7'),
(204, 'Masło klarowane', '883.0', '0.0', '99.0', '0.0'),
(205, 'Masło orzechowe', '634.0', '26.6', '53.0', '8.5'),
(206, 'Masło śmietankowe', '659.0', '1.1', '73.5', '1.1'),
(207, 'Melon', '36.0', '0.9', '0.3', '8.4'),
(208, 'Mieszanka mąk gryczanej. ryżowej lub owsianej', '351.0', '11.7', '2.7', '70.7'),
(209, 'Mieszanka warzywna z kurczakiem. ryżem i grzybami chińskimi. mrożonka', '87.0', '4.3', '2.4', '13.3'),
(210, 'Mieszanka ziół', '1.0', '0.0', '0.1', '0.0'),
(211, 'Mięta pieprzowa', '77.0', '3.8', '0.9', '15.0'),
(212, 'Migdały', '572.0', '20.0', '52.0', '20.5'),
(213, 'Miks ulubionych warzwy', '38.0', '1.9', '0.3', '8.8'),
(214, 'Mintaj świeży', '73.0', '16.6', '0.6', '0.0'),
(215, 'Miód pszczeli', '324.0', '0.3', '0.0', '79.5'),
(216, 'Mleko kokosowe w puszce', '203.0', '2.1', '18.0', '8.1'),
(217, 'Mleko kozie', '68.0', '3.2', '4.1', '4.5'),
(218, 'Mleko owcze', '107.0', '6.0', '7.0', '5.1'),
(219, 'Mleko sojowe', '41.0', '6.0', '1.4', '4.3'),
(220, 'Mleko spożywcze', '51.0', '3.4', '2.0', '4.9'),
(221, 'Mleko w proszku pełne', '479.0', '27.0', '24.0', '38.7'),
(222, 'Mleko zagęszczone niesłodzone', '131.0', '6.6', '7.5', '9.4'),
(223, 'Mleko zagęszczone słodzone', '326.0', '7.5', '8.0', '55.3'),
(224, 'Młody jęczmień proszek', '320.0', '52.0', '2.0', '21.0'),
(225, 'Morele', '47.0', '0.9', '0.2', '11.9'),
(226, 'Morele suszone', '284.0', '5.4', '1.2', '72.2'),
(227, 'Morszczuk świeży', '89.0', '17.2', '2.2', '0.0'),
(228, 'Mus jabłkowy', '124.0', '2.2', '0.2', '28.7'),
(229, 'Musli z orzechami i rodzynkami', '375.0', '11.5', '12.7', '62.9'),
(230, 'Musli z suszonymi owocami', '325.0', '8.4', '3.4', '72.2'),
(231, 'Musztarda', '162.0', '5.7', '6.4', '22.0'),
(232, 'Napój kokosowy w kartonie', '30.0', '0.1', '2.0', '3.5'),
(233, 'Nasiona Chia', '490.0', '16.0', '31.0', '44.0'),
(234, 'Natka pietruszki', '41.0', '4.4', '0.4', '9.0'),
(235, 'Nektarynka', '48.0', '0.9', '0.2', '11.8'),
(236, 'Ocet balsamiczny', '116.0', '0.0', '0.0', '0.7'),
(237, 'Ocet jabłkowy', '24.0', '0.0', '0.0', '6.0'),
(238, 'Ocet winny', '20.0', '0.0', '0.0', '5.0'),
(239, 'Ogórek', '13.0', '0.7', '0.1', '2.9'),
(240, 'Ogórek kiszony', '11.0', '1.0', '0.1', '1.9'),
(241, 'Ogórek konserwowy', '23.0', '0.4', '0.1', '4.9'),
(242, 'Ogórek kwaszony', '11.0', '1.0', '0.1', '1.9'),
(243, 'Ogórki konserwowe', '24.0', '0.3', '0.1', '5.6'),
(244, 'Olej kokosowy', '900.0', '0.0', '100.0', '0.0'),
(245, 'Olej rzepakowy', '884.0', '0.0', '100.0', '0.0'),
(246, 'Olej słonecznikowy', '884.0', '0.0', '100.0', '0.0'),
(247, 'Oliwa z oliwek', '882.0', '0.0', '99.6', '0.2'),
(248, 'Oliwki czarne', '125.0', '1.4', '12.7', '4.1'),
(249, 'Oliwki zielone marynowane', '125.0', '1.4', '12.7', '4.1'),
(250, 'Oregano', '265.0', '9.0', '4.3', '69.0'),
(251, 'Orzechy arachidowe', '560.0', '25.7', '46.1', '19.2'),
(252, 'Orzechy brazylijskie', '656.0', '14.0', '66.0', '4.0'),
(253, 'Orzechy laskowe', '640.0', '14.4', '63.0', '14.9'),
(254, 'Orzechy piniowe', '673.0', '16.7', '68.4', '13.0'),
(255, 'Orzechy pistacjowe', '589.0', '20.5', '48.5', '25.0'),
(256, 'Orzechy włoskie', '645.0', '16.0', '60.3', '18.0'),
(257, 'Orzechy ziemne', '603.0', '26.0', '50.0', '14.0'),
(258, 'Ostra papryka', '0.4', '0.0', '0.0', '0.1'),
(259, 'Otręby pszenne', '185.0', '16.0', '4.6', '61.9'),
(260, 'Paluszek krabowy', '113.0', '6.5', '2.2', '16.8'),
(261, 'Papaja', '41.0', '0.6', '0.1', '11.1'),
(262, 'Papryka czerwona', '28.0', '1.3', '0.5', '6.6'),
(263, 'Papryka czerwona konserwowa', '30.0', '0.8', '1.5', '5.0'),
(264, 'Papryka sucha', '289.0', '15.0', '13.0', '56.0'),
(265, 'Papryka zielona', '18.0', '1.1', '0.3', '4.6'),
(266, 'Pasternak', '57.0', '1.6', '0.6', '15.5'),
(267, 'Pasztet pieczony', '390.0', '17.0', '31.2', '13.5'),
(268, 'Pasztet podlaski z kurczaka', '228.0', '6.7', '21.1', '3.6'),
(269, 'Pasztet z kurczaka', '214.0', '14.4', '14.3', '7.5'),
(270, 'Pestki dyni', '556.0', '24.5', '45.8', '18.0'),
(271, 'Pestki słonecznika', '561.0', '24.4', '43.7', '24.6'),
(272, 'Pesto', '340.0', '3.7', '34.6', '6.3'),
(273, 'Pieczarki', '17.0', '2.7', '0.4', '2.6'),
(274, 'Pieczarki marynowane konserwowe', '19.0', '2.3', '0.4', '4.3'),
(275, 'Pieczeń wołowa', '117.0', '20.9', '3.6', '0.0'),
(276, 'Pieczona polędwica wołowa', '168.0', '19.7', '9.9', '0.0'),
(277, 'Pieczywo tostowe', '305.0', '8.1', '4.7', '58.8'),
(278, 'Pieczywo tostowe grahamowe', '273.0', '7.5', '4.2', '53.8'),
(279, 'Pieczywo Wasa', '370.0', '10.0', '3.0', '70.0'),
(280, 'Pieprz biały', '296.0', '10.0', '2.1', '69.0'),
(281, 'Pieprz czarny', '318.0', '11.0', '3.3', '65.0'),
(282, 'Pieprz czerwony', '318.0', '12.0', '17.0', '57.0'),
(283, 'Pierś indyka bez skóry', '84.0', '19.2', '0.7', '0.0'),
(284, 'Pierś indyka ze skórą', '100.0', '18.7', '2.7', '0.0'),
(285, 'Pierś kurczaka bez skóry', '99.0', '21.5', '1.3', '0.0'),
(286, 'Pietruszka', '38.0', '2.6', '0.5', '10.5'),
(287, 'Pikle konserwowe', '62.0', '1.3', '0.2', '15.5'),
(288, 'Płatki jaglane', '361.0', '10.0', '4.0', '69.0'),
(289, 'Płatki jęczmienne', '355.0', '9.8', '3.6', '79.4'),
(290, 'Płatki kukurydziane', '363.0', '6.9', '2.5', '83.6'),
(291, 'Płatki migdałowe', '581.0', '22.0', '51.0', '10.0'),
(292, 'Płatki owsiane', '366.0', '11.9', '7.2', '69.3'),
(293, 'Płatki pszenne', '351.0', '9.0', '3.0', '81.0'),
(294, 'Płatki ryżowe', '344.0', '6.7', '0.7', '78.9'),
(295, 'Płatki żytnie', '343.0', '6.4', '3.2', '82.6'),
(296, 'Podudzie indyka bez skóry', '100.0', '16.6', '3.7', '0.0'),
(297, 'Polędwica łososiowa', '106.0', '20.0', '2.0', '2.0'),
(298, 'Polędwica luksusowa', '177.0', '19.5', '10.0', '2.4'),
(299, 'Polędwica sopocka', '165.0', '19.9', '9.1', '0.9'),
(300, 'Polędwica wołowa', '113.0', '20.1', '3.5', '0.0'),
(301, 'Polędwica z indyka', '105.0', '15.8', '4.6', '0.1'),
(302, 'Polędwica z piersi kurczaka', '93.0', '20.4', '1.2', '0.0'),
(303, 'Pomarańcza', '44.0', '0.9', '0.2', '11.3'),
(304, 'Pomidor', '15.0', '0.9', '0.2', '3.6'),
(305, 'Pomidory koktajlowe', '15.0', '0.9', '0.2', '3.6'),
(306, 'Pomidory z puszki', '23.0', '1.3', '0.2', '4.0'),
(307, 'Por', '24.0', '2.2', '0.3', '5.7'),
(308, 'Porzeczki białe', '33.0', '1.0', '0.2', '13.1'),
(309, 'Porzeczki czarne', '35.0', '1.3', '0.2', '14.9'),
(310, 'Porzeczki czerwone', '31.0', '1.1', '0.2', '13.8'),
(311, 'Powidła śliwkowe', '214.0', '1.0', '0.2', '53.0'),
(312, 'Poziomki', '33.0', '0.8', '0.5', '8.3'),
(313, 'Proszek do pieczenia', '97.0', '0.1', '0.4', '47.0'),
(314, 'Przecier pomidorowy', '25.0', '1.2', '0.1', '4.5'),
(315, 'Przyprawa do drobiu', '307.0', '9.6', '7.5', '66.0'),
(316, 'Przyprawa do ryb', '307.0', '9.6', '7.5', '66.0'),
(317, 'Przyprawa \"Jarzynka\"', '90.0', '1.9', '0.4', '23.3'),
(318, 'Pstrąg strumieniowy świeży', '97.0', '19.2', '2.1', '0.0'),
(319, 'Pstrąg tęczowy świeży', '160.0', '18.6', '9.6', '0.0'),
(320, 'Pstrąg wędzony', '117.0', '19.4', '4.4', '0.2'),
(321, 'Pumpernikiel', '240.0', '5.9', '2.0', '58.2'),
(322, 'Rabarbar', '9.0', '0.5', '0.1', '4.6'),
(323, 'Rodzynki suszone', '277.0', '2.3', '0.5', '71.2'),
(324, 'Rostbef wołowy', '152.0', '21.5', '7.3', '0.0'),
(325, 'Rozmaryn', '331.0', '4.9', '15.0', '64.0'),
(326, 'Rukola', '25.0', '2.6', '0.7', '3.7'),
(327, 'Ryż biały', '344.0', '6.7', '0.7', '78.9'),
(328, 'Ryż brązowy', '322.0', '7.1', '1.9', '76.8'),
(329, 'Rzepa', '26.0', '1.1', '0.3', '8.2'),
(330, 'Rzeżucha', '32.0', '2.6', '0.7', '5.5'),
(331, 'Rzodkiewka', '14.0', '1.0', '0.2', '4.4'),
(332, 'Salami', '540.0', '21.9', '50.6', '0.9'),
(333, 'Salami popularne', '568.0', '21.6', '53.7', '1.4'),
(334, 'Salami z pieprzem', '405.0', '17.0', '37.0', '1.0'),
(335, 'Sałata', '14.0', '1.4', '0.2', '2.9'),
(336, 'Sałata lodowa', '14.0', '0.9', '0.1', '3.0'),
(337, 'Sałata rzymska', '17.0', '1.2', '0.0', '3.0'),
(338, 'Sandacz świeży', '84.0', '19.2', '0.7', '0.0'),
(339, 'Sardynki w oleju', '221.0', '24.1', '13.9', '0.0'),
(340, 'Sardynki w pomidorach', '162.0', '17.0', '9.9', '1.4'),
(341, 'Schab pieczony', '291.0', '30.4', '18.7', '0.7'),
(342, 'Seler konserwowy', '17.0', '0.7', '0.1', '5.4'),
(343, 'Seler korzeniowy', '21.0', '1.6', '0.3', '7.7'),
(344, 'Seler naciowy', '13.0', '1.0', '0.2', '3.6'),
(345, 'Ser Brie pełnotłusty', '329.0', '19.8', '28.0', '0.2'),
(346, 'Ser Camembert pełnotłusty', '291.0', '21.4', '23.0', '0.2'),
(347, 'Ser Cheddar pełnotłusty', '391.0', '27.1', '31.7', '0.1'),
(348, 'Ser Edamski pełnotłusty', '313.0', '26.1', '23.4', '0.1'),
(349, 'Serek homogenizowany', '161.0', '12.7', '11.0', '3.0'),
(350, 'Serek homogenizowany waniliowy', '159.0', '16.8', '4.2', '13.3'),
(351, 'Serek twarogowy ziarnisty', '101.0', '12.3', '4.3', '3.3'),
(352, 'Serek typu \"Fromage\" naturalny', '379.0', '10.2', '37.1', '2.4'),
(353, 'Ser Ementaler pełnotłusty', '380.0', '28.8', '29.7', '0.1'),
(354, 'Ser Gouda pełnotłusty', '316.0', '27.9', '22.9', '0.1'),
(355, 'Ser kozi', '388.0', '21.4', '33.9', '0.0'),
(356, 'Ser kozi. twarożek', '168.0', '8.7', '14.0', '4.0'),
(357, 'Ser Mascarpone', '394.0', '3.5', '40.0', '5.1'),
(358, 'Ser mozzarella', '254.0', '24.0', '16.0', '3.0'),
(359, 'Ser mozzarella light', '157.0', '19.0', '8.5', '1.0'),
(360, 'Ser Parmezan', '452.0', '41.5', '32.0', '0.1'),
(361, 'Ser Radamer', '339.0', '26.2', '26.0', '0.1'),
(362, 'Ser Rokpol pełnotłusty', '363.0', '22.6', '30.6', '0.1'),
(363, 'Ser Salami pełnotłusty', '351.0', '25.2', '28.1', '0.1'),
(364, 'Ser topiony', '298.0', '13.5', '27.0', '1.2'),
(365, 'Ser Trapistów pełnotłusty', '367.0', '23.5', '30.7', '0.1'),
(366, 'Ser Trapistów tłusty', '351.0', '28.0', '26.8', '0.1'),
(367, 'Ser twarogowy chudy', '99.0', '19.8', '0.5', '3.5'),
(368, 'Ser twarogowy półtłusty', '133.0', '18.7', '4.7', '3.7'),
(369, 'Ser twarogowy tłusty', '175.0', '17.7', '10.1', '3.5'),
(370, 'Ser Tylżycki pełnotłusty', '353.0', '26.1', '27.9', '0.1'),
(371, 'Ser typu \"Feta\"', '215.0', '17.0', '16.0', '1.0'),
(372, 'Sezam', '632.0', '23.2', '59.9', '10.0'),
(373, 'Siemie lniane', '534.0', '18.0', '42.0', '29.0'),
(374, 'Skórka cytrynowa', '120.0', '1.6', '0.2', '25.0'),
(375, 'Skrobia kukurydziana', '353.0', '0.2', '0.0', '88.5'),
(376, 'Skrobia ziemniaczana', '343.0', '0.6', '0.1', '83.9'),
(377, 'Śledź solony', '217.0', '19.8', '15.4', '0.0'),
(378, 'Śledź w oleju', '301.0', '16.4', '26.5', '0.0'),
(379, 'Śliwka', '45.0', '0.6', '0.2', '11.7'),
(380, 'Śliwki suszone', '267.0', '3.5', '1.2', '68.9'),
(381, 'Słodki ziemniak (batat)', '86.0', '1.6', '0.1', '20.0'),
(382, 'Śmietana 12%', '133.0', '2.7', '12.0', '3.9'),
(383, 'Śmietana 18%', '184.0', '2.5', '18.0', '3.6'),
(384, 'Śmietanka kremowa', '287.0', '2.2', '30.0', '3.1'),
(385, 'Soczewica czerwona suche nasiona', '327.0', '25.4', '3.0', '57.5'),
(386, 'Soja suche nasiona', '382.0', '34.3', '19.6', '32.7'),
(387, 'Sok ananasowy', '48.0', '0.3', '0.1', '11.4'),
(388, 'Sok brzoskwiniowo pomarańczowy', '32.0', '0.7', '0.1', '7.4'),
(389, 'Sok buraczany', '34.0', '0.8', '0.2', '7.6'),
(390, 'Sok cytrynowy', '30.0', '0.4', '0.3', '6.4'),
(391, 'Sok egzotyczny', '57.0', '0.8', '0.3', '12.7'),
(392, 'Sok grejpfrutowy', '40.0', '0.5', '0.1', '9.2'),
(393, 'Sok jabłkowy', '42.0', '0.1', '0.1', '10.0'),
(394, 'Sok marchwiowo brzoskwiniowy', '44.0', '0.5', '0.1', '11.3'),
(395, 'Sok marchwiowo jabłkowo bananowy', '39.0', '0.3', '0.1', '10.2'),
(396, 'Sok marchwiowo jabłkowo śliwkowy', '39.0', '0.4', '0.2', '10.2'),
(397, 'Sok marchwiowo jabłkowy', '44.0', '0.5', '0.2', '12.1'),
(398, 'Sok marchwiowo pomarańczowy', '40.0', '0.6', '0.1', '10.8'),
(399, 'Sok marchwiowy', '43.0', '0.4', '0.1', '11.3'),
(400, 'Sok pomarańczowo grejpfrutowy', '43.0', '0.6', '0.1', '9.8'),
(401, 'Sok pomarańczowy', '43.0', '0.6', '0.1', '9.9'),
(402, 'Sok pomidorowy', '14.0', '0.8', '0.2', '3.3'),
(403, 'Sok wieloowocowy', '45.0', '0.2', '0.1', '10.9'),
(404, 'Sok wielowarzywny', '25.0', '1.0', '0.3', '5.7'),
(405, 'Sól', '0.0', '0.0', '0.0', '0.0'),
(406, 'Sola świeża', '83.0', '17.5', '1.4', '0.0'),
(407, 'Sól czosnkowa', '9.0', '4.3', '1.2', '1.9'),
(408, 'Sos sojowy', '0.0', '0.6', '0.0', '0.3'),
(409, 'Starta skórka z pomarańczy', '120.0', '1.6', '0.2', '25.0'),
(410, 'Suszone pomidory', '215.0', '5.0', '14.0', '23.0'),
(411, 'Syrop klonowy', '265.0', '0.1', '0.1', '63.0'),
(412, 'Szafran', '310.0', '11.0', '5.9', '65.0'),
(413, 'Szałwia', '315.0', '11.0', '13.0', '61.0'),
(414, 'Szczaw', '21.0', '1.1', '0.8', '4.9'),
(415, 'Szczupak świeży', '82.0', '18.4', '0.8', '0.0'),
(416, 'Szczypiorek', '29.0', '4.1', '0.8', '3.9'),
(417, 'Szparagi', '18.0', '1.9', '0.2', '3.7'),
(418, 'Szpinak', '16.0', '2.6', '0.4', '3.0'),
(419, 'Szpinak. mrożonka', '15.0', '2.3', '0.4', '2.7'),
(420, 'Szponder wołowy', '217.0', '19.3', '15.7', '0.0'),
(421, 'Szprotka wędzona', '243.0', '19.3', '18.3', '0.0'),
(422, 'Szynka delikatesowa z kurczaka', '123.0', '18.2', '5.6', '0.0'),
(423, 'Szynka kanapkowa', '102.0', '14.2', '4.4', '1.4'),
(424, 'Szynka parmeńska', '135.0', '26.0', '3.0', '1.0'),
(425, 'Szynka wiejska', '253.0', '17.1', '20.3', '0.9'),
(426, 'Szynka wieprzowa gotowana', '233.0', '16.4', '18.3', '1.0'),
(427, 'Szynka wołowa gotowana', '107.0', '20.9', '2.0', '1.1'),
(428, 'Szynka z indyka', '84.0', '17.1', '1.6', '0.1'),
(429, 'Szynka z piersi kurczaka', '98.0', '21.2', '1.2', '0.2'),
(430, 'Szynka z udźca kurczaka', '117.0', '17.2', '5.3', '0.0'),
(431, 'Szynkówka wieprzowa', '191.0', '13.6', '14.7', '1.4'),
(432, 'Szynkówka wołowa', '85.0', '16.2', '1.5', '1.4'),
(433, 'Tofu', '112.0', '12.0', '6.0', '3.0'),
(434, 'Truskawki', '28.0', '0.7', '0.4', '7.2'),
(435, 'Tuńczyk w oleju', '190.0', '27.1', '9.0', '0.0'),
(436, 'Tuńczyk w sosie własnym', '96.0', '21.0', '1.2', '0.0'),
(437, 'Tymianek', '276.0', '9.1', '7.4', '64.0'),
(438, 'Udko kurczaka bez skóry', '125.0', '17.8', '6.0', '0.0'),
(439, 'Udko kurczaka ze skórą', '158.0', '16.8', '10.2', '0.0'),
(440, 'Udziec indyka bez skóry', '104.0', '19.4', '2.8', '0.0'),
(441, 'Udziec indyka ze skórą', '131.0', '18.4', '6.4', '0.0'),
(442, 'Wafle ryżowe', '390.0', '8.0', '3.0', '81.0'),
(443, 'Wątróbka kurczaka', '136.0', '19.1', '6.3', '0.6'),
(444, 'Wędzona pierś z kurczaka', '107.0', '23.0', '0.5', '0.0'),
(445, 'Wędzonka wołowa gotowana', '102.0', '17.8', '3.1', '0.5'),
(446, 'Wieprzowina karkówka', '267.0', '16.1', '22.8', '0.0'),
(447, 'Wieprzowina łopatka', '257.0', '16.0', '21.7', '0.0'),
(448, 'Wieprzowina schab surowy', '174.0', '21.0', '10.0', '0.0'),
(449, 'Wieprzowina żeberka', '321.0', '15.2', '29.3', '0.0'),
(450, 'Wino białe półwytrawne', '81.0', '0.0', '0.0', '3.7'),
(451, 'Wino białe słodkie', '95.0', '0.2', '0.0', '5.9'),
(452, 'Wino białe wytrawne', '66.0', '0.1', '0.0', '0.6'),
(453, 'Wino czerwone', '68.0', '0.1', '0.0', '0.2'),
(454, 'Winogrona', '69.0', '0.5', '0.2', '17.6'),
(455, 'Wiórki kokosowe', '606.0', '5.6', '63.2', '27.0'),
(456, 'Wiśnie', '47.0', '0.9', '0.4', '10.9'),
(457, 'Włoszczyzna krojona w paski', '25.0', '1.4', '0.3', '7.9'),
(458, 'Woda', '0.0', '0.0', '0.0', '0.0'),
(459, 'Zarodki pszenne', '323.0', '27.5', '9.4', '45.5'),
(460, 'Żelatyna', '343.0', '84.2', '0.1', '0.0'),
(461, 'Ziele angielskie', '263.0', '6.1', '8.7', '72.0'),
(462, 'Ziemniaki', '77.0', '1.9', '0.1', '18.3'),
(463, 'Ziemniaki młode', '69.0', '1.8', '0.1', '16.3'),
(464, 'Zioła prowansalskie', '1.0', '0.0', '0.1', '0.0'),
(465, 'Żółtko jajka kurzego', '314.0', '15.5', '28.2', '0.3'),
(466, 'Żurawina niskosłodzona do mięs', '161.0', '0.2', '0.7', '38.8'),
(467, 'Żurawina suszona', '320.0', '0.1', '1.4', '82.4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `supper_to_food`
--

CREATE TABLE `supper_to_food` (
  `UserSupperID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `supper_to_food`
--

INSERT INTO `supper_to_food` (`UserSupperID`, `FoodID`) VALUES
(0, 304),
(0, 331),
(0, 416),
(1, 433),
(1, 219),
(2, 23),
(4, 9),
(8, 8),
(9, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userbodies`
--

CREATE TABLE `userbodies` (
  `UserBodyID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Weight` decimal(10,1) NOT NULL,
  `Height` int(11) NOT NULL,
  `Bodyfat` decimal(10,1) NOT NULL,
  `BMI` decimal(10,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `userbodies`
--

INSERT INTO `userbodies` (`UserBodyID`, `UserID`, `Weight`, `Height`, `Bodyfat`, `BMI`) VALUES
(0, 0, '90.0', 185, '12.0', '25.4'),
(1, 1, '81.0', 181, '12.5', '24.8'),
(4, 3, '80.0', 180, '12.0', '25.0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userexercises`
--

CREATE TABLE `userexercises` (
  `UserExercisesID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `TotalCaloriesBurned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `userexercises`
--

INSERT INTO `userexercises` (`UserExercisesID`, `UserID`, `Date`, `TotalCaloriesBurned`) VALUES
(0, 0, '2021-07-31', 1500),
(1, 1, '2021-07-31', 800),
(8, 0, '2021-08-14', 0),
(9, 3, '2021-08-14', 0),
(10, 1, '2021-08-14', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userexercisestoexercise`
--

CREATE TABLE `userexercisestoexercise` (
  `UserExercisesID` int(11) NOT NULL,
  `ExerciseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `userexercisestoexercise`
--

INSERT INTO `userexercisestoexercise` (`UserExercisesID`, `ExerciseID`) VALUES
(0, 105),
(0, 108),
(1, 40),
(1, 60),
(0, 4),
(1, 105),
(9, 6),
(10, 8),
(9, 122),
(8, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userfood`
--

CREATE TABLE `userfood` (
  `UserFoodID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `TotalCalories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `userfood`
--

INSERT INTO `userfood` (`UserFoodID`, `UserID`, `Date`, `TotalCalories`) VALUES
(0, 0, '2021-07-31', 1500),
(1, 1, '2021-07-31', 900),
(2, 1, '2021-08-14', 0),
(4, 0, '2021-08-14', 0),
(5, 3, '2021-08-14', 0),
(6, 0, '2021-08-16', 0),
(7, 3, '2021-08-16', 0),
(8, 0, '2021-08-17', 0),
(9, 0, '2021-08-18', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userprofiles`
--

CREATE TABLE `userprofiles` (
  `UserProfileID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `userprofiles`
--

INSERT INTO `userprofiles` (`UserProfileID`, `UserID`, `FirstName`, `LastName`, `Gender`, `City`, `Address`, `Phone`) VALUES
(0, 0, 'Daniel', 'Kosytorz', 'Male', 'Zborowskie', 'ul. Gorna 25', '532107477'),
(1, 1, 'Pawel', 'Czyz', 'Male', 'Gliwice', 'ul. Jakas 15', '784957334'),
(3, 2, 'Nowyy', 'nowyy', 'Malee', 'Gliwicee', 'ul. Dluga 6', '123456786'),
(5, 3, 'Dawid', 'K', 'Male', 'Gliwice', 'ul. jakas 2', '123456789');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Login` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`UserID`, `Login`, `Password`, `E-mail`) VALUES
(0, 'Daniel', 'pass', 'daniel@mail.com'),
(1, 'Pawel', 'pass', 'pawel@mail.com'),
(2, 'nowy', 'pass', 'nowy@pl'),
(3, 'Dawid', 'pass3', 'dawid@mail.com');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `breakfast_to_food`
--
ALTER TABLE `breakfast_to_food`
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `breakfast_to_food_ibfk_2` (`UserBreakfastID`);

--
-- Indeksy dla tabeli `dinner_to_food`
--
ALTER TABLE `dinner_to_food`
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `dinner_to_food_ibfk_2` (`UserDinnerID`);

--
-- Indeksy dla tabeli `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`ExerciseID`);

--
-- Indeksy dla tabeli `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indeksy dla tabeli `supper_to_food`
--
ALTER TABLE `supper_to_food`
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `supper_to_food_ibfk_2` (`UserSupperID`);

--
-- Indeksy dla tabeli `userbodies`
--
ALTER TABLE `userbodies`
  ADD PRIMARY KEY (`UserBodyID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `userexercises`
--
ALTER TABLE `userexercises`
  ADD PRIMARY KEY (`UserExercisesID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `userexercisestoexercise`
--
ALTER TABLE `userexercisestoexercise`
  ADD KEY `userexercisestoexercise_ibfk_1` (`ExerciseID`),
  ADD KEY `UserExercisesID` (`UserExercisesID`);

--
-- Indeksy dla tabeli `userfood`
--
ALTER TABLE `userfood`
  ADD PRIMARY KEY (`UserFoodID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`UserProfileID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `exercises`
--
ALTER TABLE `exercises`
  MODIFY `ExerciseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT dla tabeli `food`
--
ALTER TABLE `food`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT dla tabeli `userbodies`
--
ALTER TABLE `userbodies`
  MODIFY `UserBodyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `userexercises`
--
ALTER TABLE `userexercises`
  MODIFY `UserExercisesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `userfood`
--
ALTER TABLE `userfood`
  MODIFY `UserFoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `UserProfileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `breakfast_to_food`
--
ALTER TABLE `breakfast_to_food`
  ADD CONSTRAINT `breakfast_to_food_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `breakfast_to_food_ibfk_2` FOREIGN KEY (`UserBreakfastID`) REFERENCES `userfood` (`UserFoodID`);

--
-- Ograniczenia dla tabeli `dinner_to_food`
--
ALTER TABLE `dinner_to_food`
  ADD CONSTRAINT `dinner_to_food_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `dinner_to_food_ibfk_2` FOREIGN KEY (`UserDinnerID`) REFERENCES `userfood` (`UserFoodID`);

--
-- Ograniczenia dla tabeli `supper_to_food`
--
ALTER TABLE `supper_to_food`
  ADD CONSTRAINT `supper_to_food_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `supper_to_food_ibfk_2` FOREIGN KEY (`UserSupperID`) REFERENCES `userfood` (`UserFoodID`);

--
-- Ograniczenia dla tabeli `userbodies`
--
ALTER TABLE `userbodies`
  ADD CONSTRAINT `userbodies_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Ograniczenia dla tabeli `userexercises`
--
ALTER TABLE `userexercises`
  ADD CONSTRAINT `userexercises_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Ograniczenia dla tabeli `userexercisestoexercise`
--
ALTER TABLE `userexercisestoexercise`
  ADD CONSTRAINT `userexercisestoexercise_ibfk_1` FOREIGN KEY (`ExerciseID`) REFERENCES `exercises` (`ExerciseID`),
  ADD CONSTRAINT `userexercisestoexercise_ibfk_2` FOREIGN KEY (`UserExercisesID`) REFERENCES `userexercises` (`UserExercisesID`);

--
-- Ograniczenia dla tabeli `userfood`
--
ALTER TABLE `userfood`
  ADD CONSTRAINT `userfood_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Ograniczenia dla tabeli `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD CONSTRAINT `userprofiles_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
