-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.2.30
-- Время создания: Фев 05 2023 г., 19:28
-- Версия сервера: 5.7.37-40
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `f0773505_ProgrammingLessons`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Question`
--

CREATE TABLE `Question` (
  `QuestionId` int(11) NOT NULL,
  `Question` text COLLATE utf8_unicode_ci NOT NULL,
  `AnswerOptions` text COLLATE utf8_unicode_ci NOT NULL,
  `CorrectAnswer` text COLLATE utf8_unicode_ci NOT NULL,
  `ThemeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Question`
--

INSERT INTO `Question` (`QuestionId`, `Question`, `AnswerOptions`, `CorrectAnswer`, `ThemeId`) VALUES
(1, 'Какой тип данных хранит значения: true, false?', 'string,bool,int', 'bool', 1),
(2, 'Какой тип данных хранит в себе набор символов Unicode?', 'string,char,byte', 'string', 1),
(3, 'Какая операция позволяет получить остаток от целочисленного деления?', '--,%,/', '%', 2),
(4, 'Какая операция позволяет увеличить значение переменной на 1?', '++,--,/', '++', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Themes`
--

CREATE TABLE `Themes` (
  `ThemeId` int(11) NOT NULL,
  `ThemeTitle` text COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfQuestions` int(11) NOT NULL,
  `ThemeTheoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Themes`
--

INSERT INTO `Themes` (`ThemeId`, `ThemeTitle`, `NumberOfQuestions`, `ThemeTheoryId`) VALUES
(1, 'Типы данных', 2, 1),
(2, 'Арифметические операции языка C#', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Theory`
--

CREATE TABLE `Theory` (
  `TheoryId` int(11) NOT NULL,
  `TheoreticalInformation` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Theory`
--

INSERT INTO `Theory` (`TheoryId`, `TheoreticalInformation`) VALUES
(1, 'Как и во многих языках программирования, в C# есть своя система типов данных, которая используется для создания переменных. Тип данных определяет внутреннее представление данных, множество значений, которые может принимать объект, а также допустимые действия, которые можно применять над объектом.\r\n\r\nВ языке C# есть следующие базовые типы данных:\r\n\r\nbool: хранит значение true или false (логические литералы). Представлен системным типом System.Boolean\r\n\r\nbyte: хранит целое число от 0 до 255 и занимает 1 байт. Представлен системным типом System.Byte\r\n\r\nsbyte: хранит целое число от -128 до 127 и занимает 1 байт. Представлен системным типом System.SByte\r\n\r\nshort: хранит целое число от -32768 до 32767 и занимает 2 байта. Представлен системным типом System.Int16\r\n\r\nushort: хранит целое число от 0 до 65535 и занимает 2 байта. Представлен системным типом System.UInt16\r\n\r\nint: хранит целое число от -2147483648 до 2147483647 и занимает 4 байта. Представлен системным типом System.Int32\r\n\r\nuint: хранит целое число от 0 до 4294967295 и занимает 4 байта. Представлен системным типом System.UInt32\r\n\r\nlong: хранит целое число от –9 223 372 036 854 775 808 до 9 223 372 036 854 775 807 и занимает 8 байт. Представлен системным типом System.Int64\r\n\r\nulong: хранит целое число от 0 до 18 446 744 073 709 551 615 и занимает 8 байт. Представлен системным типом System.UInt64\r\n\r\nfloat: хранит число с плавающей точкой от -3.4*1038 до 3.4*1038 и занимает 4 байта. Представлен системным типом System.Single\r\n\r\ndouble: хранит число с плавающей точкой от ±5.0*10-324 до ±1.7*10308 и занимает 8 байта. Представлен системным типом System.Double\r\n\r\ndecimal: хранит десятичное дробное число. Если употребляется без десятичной запятой, имеет значение от ±1.0*10-28 до ±7.9228*1028, может хранить 28 знаков после запятой и занимает 16 байт. Представлен системным типом System.Decimal\r\n\r\nchar: хранит одиночный символ в кодировке Unicode и занимает 2 байта. Представлен системным типом System.Char.\r\n\r\nstring: хранит набор символов Unicode. Представлен системным типом System.String.\r\n\r\nobject: может хранить значение любого типа данных и занимает 4 байта на 32-разрядной платформе и 8 байт на 64-разрядной платформе. Представлен системным типом System.Object, который является базовым для всех других типов и классов .NET.'),
(2, 'В C# используется большинство операций, которые применяются и в других языках программирования. Операции представляют определенные действия над операндами - участниками операции. В качестве операнда может выступать переменной или какое-либо значение (например, число). Операции бывают унарными (выполняются над одним операндом), бинарными - над двумя операндами и тернарными - выполняются над тремя операндами. Рассмотрим все виды операций.\r\n\r\nБинарные арифметические операции:\r\n\r\nОперация сложения (+).\r\nОперация вычитания (-).\r\nОперация умножения (*).\r\nОперация деления (/).\r\nОперация получение остатка от целочисленного деления (%)\r\nОперация инкремента (++).\r\nОперация декремента или уменьшения значения на единицу (--).\r\n');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`QuestionId`);

--
-- Индексы таблицы `Themes`
--
ALTER TABLE `Themes`
  ADD PRIMARY KEY (`ThemeId`);

--
-- Индексы таблицы `Theory`
--
ALTER TABLE `Theory`
  ADD PRIMARY KEY (`TheoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
