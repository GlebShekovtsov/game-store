-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 18 2022 г., 03:12
-- Версия сервера: 8.0.29
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `games_store_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `achievements`
--

CREATE TABLE `achievements` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `achievements`
--

INSERT INTO `achievements` (`id`, `name`, `condition`, `picture`) VALUES
(1, 'Акт милосердия', 'Убил своего первого зараженного.\r\n', 'dayz_achiev1.jpg'),
(2, 'Биологические потребности', 'Что-то съел и выпил.\r\n', 'dayz_achiev2.jpg'),
(3, 'К бою готов', 'Снарядил огнестрельное, холодное оружие и рюкзак.\n', 'dayz_achiev3.jpg'),
(4, 'Пацифист', 'Убил зараженного солдата.', 'dayz_achiev4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `bucket`
--

CREATE TABLE `bucket` (
  `id_bucket` int NOT NULL,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bucket`
--

INSERT INTO `bucket` (`id_bucket`, `id_user`, `id_game`) VALUES
(5, 1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Игры'),
(2, 'Демо'),
(3, 'Дополнительный контент');

-- --------------------------------------------------------

--
-- Структура таблицы `developer`
--

CREATE TABLE `developer` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `developer`
--

INSERT INTO `developer` (`id`, `name`) VALUES
(1, 'Bohemia Interactive');

-- --------------------------------------------------------

--
-- Структура таблицы `developer_games`
--

CREATE TABLE `developer_games` (
  `id` int NOT NULL,
  `id_developer` int NOT NULL,
  `id_game` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `developer_games`
--

INSERT INTO `developer_games` (`id`, `id_developer`, `id_game`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `dlc`
--

CREATE TABLE `dlc` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_dlc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dlc`
--

INSERT INTO `dlc` (`id`, `id_game`, `id_dlc`) VALUES
(1, 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `editions`
--

CREATE TABLE `editions` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `editions`
--

INSERT INTO `editions` (`id`, `id_game`, `name`, `price`) VALUES
(1, 4, 'DayZ Livonia Edition', '1393');

-- --------------------------------------------------------

--
-- Структура таблицы `edition_content`
--

CREATE TABLE `edition_content` (
  `id` int NOT NULL,
  `id_edition` int NOT NULL,
  `id_dlc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `edition_content`
--

INSERT INTO `edition_content` (`id`, `id_edition`, `id_dlc`) VALUES
(1, 1, 4),
(2, 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `game_achievements`
--

CREATE TABLE `game_achievements` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_achievement` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_achievements`
--

INSERT INTO `game_achievements` (`id`, `id_game`, `id_achievement`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `game_gallery`
--

CREATE TABLE `game_gallery` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_gallery`
--

INSERT INTO `game_gallery` (`id`, `id_game`, `picture`) VALUES
(1, 4, 'dayz_screen1.jpg'),
(2, 4, 'dayz_screen2.jpg'),
(3, 4, 'dayz_screen3.jpg'),
(4, 4, 'dayz_screen4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `game_genre`
--

CREATE TABLE `game_genre` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_genre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_genre`
--

INSERT INTO `game_genre` (`id`, `id_game`, `id_genre`) VALUES
(1, 1, 4),
(2, 2, 2),
(3, 1, 3),
(4, 4, 9),
(5, 4, 6),
(6, 4, 10),
(7, 1, 10),
(9, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `game_labels`
--

CREATE TABLE `game_labels` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_label` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_labels`
--

INSERT INTO `game_labels` (`id`, `id_game`, `id_label`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 3),
(15, 5, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `game_languages`
--

CREATE TABLE `game_languages` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_language` int NOT NULL,
  `interface` tinyint(1) NOT NULL,
  `voice` tinyint(1) NOT NULL,
  `subtitles` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_languages`
--

INSERT INTO `game_languages` (`id`, `id_game`, `id_language`, `interface`, `voice`, `subtitles`) VALUES
(1, 4, 1, 1, 0, 1),
(2, 4, 2, 1, 0, 1),
(3, 4, 3, 1, 0, 1),
(4, 4, 4, 1, 0, 1),
(5, 4, 5, 1, 0, 1),
(6, 4, 6, 1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `game_platform`
--

CREATE TABLE `game_platform` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_platform` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_platform`
--

INSERT INTO `game_platform` (`id`, `id_game`, `id_platform`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 3, 1),
(7, 3, 2),
(8, 3, 3),
(9, 4, 1),
(10, 5, 1),
(11, 5, 2),
(12, 5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `game_promo`
--

CREATE TABLE `game_promo` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_promo` int NOT NULL,
  `discount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_qualities`
--

CREATE TABLE `game_qualities` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_quality` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_qualities`
--

INSERT INTO `game_qualities` (`id`, `id_game`, `id_quality`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(7, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `game_series`
--

CREATE TABLE `game_series` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_serie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_subgenres`
--

CREATE TABLE `game_subgenres` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_subgenre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `game_subgenres`
--

INSERT INTO `game_subgenres` (`id`, `id_game`, `id_subgenre`) VALUES
(1, 2, 1),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Гонки'),
(2, 'Ролевая игра'),
(3, 'Симулятор'),
(4, 'Стратегия'),
(5, 'ММО'),
(6, 'Приключение'),
(7, 'Шутер'),
(8, 'Казуальная игра'),
(9, 'Экшен'),
(10, 'Многопользовательская игра');

-- --------------------------------------------------------

--
-- Структура таблицы `labels`
--

CREATE TABLE `labels` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `labels`
--

INSERT INTO `labels` (`id`, `name`) VALUES
(1, 'Глобальная стратегия'),
(2, 'Экономика'),
(3, 'Стратегия'),
(4, 'Ролевая игра'),
(5, 'Глубокий сюжет'),
(6, 'Детектив'),
(7, 'Симулятор колонии'),
(8, 'Строительство базы'),
(9, '2D'),
(10, 'Выживание'),
(11, 'Зомби'),
(12, 'Для нескольких игроков'),
(13, 'Инди'),
(14, 'Симулятор');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'русский'),
(2, 'английский'),
(3, 'французский'),
(4, 'итальянский'),
(5, 'немецкий'),
(6, 'испанский'),
(7, 'чешский'),
(8, 'китайский (упр.)'),
(9, 'китайский (трад.)'),
(10, 'японский'),
(11, 'польский'),
(12, 'бр. португальский');

-- --------------------------------------------------------

--
-- Структура таблицы `library`
--

CREATE TABLE `library` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `library`
--

INSERT INTO `library` (`id`, `id_user`, `id_game`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `platforms`
--

CREATE TABLE `platforms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `platforms`
--

INSERT INTO `platforms` (`id`, `name`) VALUES
(1, 'Windows'),
(2, 'Mac OS'),
(3, 'Linux');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `id_cathegory` int NOT NULL,
  `poster` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `release_date` date NOT NULL,
  `short_descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `full_descr` text NOT NULL,
  `capsule_image` varchar(255) NOT NULL,
  `game_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `id_cathegory`, `poster`, `price`, `release_date`, `short_descr`, `full_descr`, `capsule_image`, `game_name`) VALUES
(1, 1, 'victoria3_poster.jpg', '2500', '2022-10-25', 'Paradox Development Studio предлагает вам построить идеальное общество в суматохе безумного XIX века. Найдите способ уравновесить общественные противоречия и заслужите место под солнцем в Victoria 3 — одной из самых ожидаемых игр в истории студии.\r\n', 'СОЗДАЙТЕ ВЕЛИКОЕ БУДУЩЕЕ\r\nParadox Development Studio предлагает вам построить идеальное общество в суматохе безумного XIX века. Найдите способ уравновесить общественные противоречия и заслужите место под солнцем в Victoria 3 — одной из самых ожидаемых игр в истории студии.\r\nИДЕАЛЬНЫЙ СИМУЛЯТОР ОБЩЕСТВА\r\nУправляйте любой из десятков стран мира в период с 1836 по 1936 год. Сельское хозяйство или промышленность, верность традициям или радикальные реформы, мирная жизнь или завоевания — выбор за вами!\r\nПомните, что у каждой группы населения свои политические воззрения и экономические проблемы.\r\nСоздайте прогрессивное общество с помощью правительственных реформ и обновлений конституции или встаньте на защиту традиционных ценностей от революционных потрясений.\r\nИсследуйте новые технологии и изучайте новые идеи, чтобы помочь развитию своей страны.\r\nСЛОЖНАЯ ЭКОНОМИЧЕСКАЯ СИСТЕМА\r\nРазвивайте промышленность и торговлю, облагайте прибыль налогами и повышайте национальное благосостояние.\r\nИмпортируйте дешевое сырье для обеспечения основных нужд и ищите новые рынки для сбыта товаров.\r\nРегулируйте оборот важнейших товаров, чтобы поддерживать свою экономику и влиять на судьбы империй.\r\nИспользуйте дешевую рабочую силу, но не забывайте о потребности рынка в квалифицированных сотрудниках.\r\nИГРАЙТЕ НА МИРОВОЙ СЦЕНЕ\r\nДергайте за ниточки в запутанной дипломатической паутине, плетите интриги, создавайте союзы, ссорьте и мирите, укрепляйте свои позиции в мире.\r\nИспользуйте угрозы, военное превосходство и блеф, чтобы заставить врагов отступить.\r\nРазвивайте экономику и армию за счет противников.\r\nРазвивайте промышленность или завоевывайте новые территории, чтобы укрепить свою репутацию и заслужить уважение конкурентов.', 'victoria3_capsule_184x69.jpg', 'Victoria 3'),
(2, 1, 'disco_elysium_poster.jpg', '725', '2022-10-27', 'Disco Elysium - The Final Cut — революция в жанре РПГ. Ваш персонаж — детектив с уникальными навыками, которому предстоит исследовать целый район. Допрашивайте персонажей, расследуйте убийства или берите взятки. Кем вы станете: героем или неудачником?\r\n', 'Disco Elysium - The Final Cut — это окончательное издание потрясающей РПГ-игры. Ваш персонаж — детектив с набором уникальных навыков, которому предстоит исследовать целый городской район. Судьба сведет вас с незабываемыми персонажами. Проводите допросы, раскрывайте убийства или берите взятки. Вам решать, кем вы хотите стать — героем или полнейшим неудачником.\r\nПолное озвучивание. Полное английское озвучивание по-настоящему вдохнуло жизнь в удивительных жителей города. Настраивайте их друг против друга, пытайтесь им помочь или влюбляйтесь до беспамятства, ведь теперь каждое слово произнесено с нужным акцентом и эмоциями.\r\n\r\nНовые задания о политических взглядах. Столкнитесь со своим реальным мировоззрением, поддавшись зову политического компаса. Откройте для себя новых горожан, монументальные достопримечательности и целую дополнительную локацию — ещё больше влияйте на мир в погоне за своими мечтами.\r\n\r\nНовый уровень свободы выбора. Запугивайте, льстите, применяйте силу, пишите стихи, пойте под караоке, танцуйте как сумасшедший или найдите наконец смысл жизни. Disco Elysium - The Final Cut — видеоигра, наиболее достоверно воссоздающая опыт настольной РПГ.\r\n\r\nБесконечные возможности для ролевой игры.​ 24 уникальных навыка — развивайте и властвуйте. Создайте свой стиль при помощи 80 разных предметов одежды. Используйте 14 разных инструментов: от оружия и фонарика до магнитофона. Или смешайте себе коктейль из 6 уникальных и не очень безобидных веществ. В шкафчике мыслей вы найдете 60 безумных мыслей, которые позволят вам еще больше развить персонажа.\r\n\r\nРеволюционная система диалогов и незабываемые персонажи. ​Мир, населенный не статистами, а живыми людьми. Добивайтесь от них ответов, делайте проницательные наблюдения и реализовывайте самые смелые желания, играя за копа или кого-то совершенно иного. Революционная диалоговая система игры позволит вам творить практически что угодно.\r\nПроложите свой собственный путь через город. Исследуйте, манипулируйте окружающими, собирайте тару или станьте миллионером. Таких возможностей в открытом мире вы еще не видели. Завоюйте Ревашоль шаг за шагом. От лабиринта улиц к морским пляжам и дальше — за горизонт.', 'disco_elysium_capsule_sm_120.jpg', 'Disco Elysium - The Final Cut'),
(3, 1, 'rimworld_poster.jpg', '619', '2022-10-28', 'RimWorld управляет тремя людьми, выжившими после крушения космического лайнера, в строительстве колонии в приграничном мире на краю изученного пространства. Источники вдохновения этой игры -это дух космического вестерна Firefly.', 'RimWorld управляет тремя людьми, выжившими после крушения космического лайнера, в строительстве колонии в приграничном мире на краю изученного пространства. Источники вдохновения этой игры -это дух космического вестерна Firefly, глубокая проработка Dwarf Fortress и эпические Dune и Warhammer 40 000.\r\n\r\nСледите за настроением, потребностями, мыслями, ранениями и болезнями колонистов. Участвуйте в глубоко проработанной боях небольших команд. Используйте одежду, оружие и экипировку из металла, дерева, камня, ткани и экзотических, футуристических материалов. Сражайтесь с пиратами-налетчиками, враждебными племенами, свирепыми животными и древними машинами убийств. Играя, каждый раз открывайте для себя новый мир. Стройте колонии в природных зонах от пустыни до джунглей и тундры, имеющих свои уникальные флоры и фауны. Управляйте колонистами и развивайте их с помощью уникальных биографий, черт и навыков. Учитесь легко играть с помощью интеллектуального и ненавязчивого ИИ-наставника\r\n\r\nИгра RimWorld разработана Tynan Sylvester и компанией Ludeon Studios. С момента первого выхода 4 ноября 2013 г. была улучшена.', 'rimworld_capsule_184x69.jpg', 'RimWorld'),
(4, 1, 'dayz_poster.jpg', '1199', '2022-10-28', 'Как долго вы сможете выжить в пост-апокалипсисе? Мир пал под натиском зараженных. Боритесь против других выживших за ограниченные ресурсы. Сможете ли вы работать сообща с незнакомцами? Или станете волком-одиночкой? Это ваша история, это DayZ.', 'Это ваша история\nВ этой игре не будет маркеров на карте, ежедневных заданий или списков лидеров, что поможет вам создать свою историю. В ней есть лишь Чернарусь — постсоветское государство площадью 230 квадратных километров, которое поразил неизвестный вирус, превративший большую часть ее населения в свирепствующих зараженных.\nВаша задача — как можно дольше продержаться в условиях полного краха цивилизации. Имейте в виду, что Чернарусь не прощает ошибок, и смерть здесь не понарошку. Все, что у вас останется, когда вы начнете все сначала, — это воспоминания о вашей роковой ошибке.\nЗнакомьтесь с другими игроками\nВас ждет до 60 игроков, стремящихся выжить любой ценой. Заводите друзей, убивайте без проволочек, стройте базу или потеряйте все из-за банки фасоли. Используйте голосовой чат (VOIP), чтобы общаться с другими игроками. Каждая встреча несет особый смысл, ведь на кону может быть ваша жизнь. Будьте осторожны. Оставайтесь начеку. Никому не доверяйте.\nВыживите в Чернаруси\nЗараженные — не единственная ваша проблема: дикая природа и неблагоприятные погодные условия тоже могут доставить немало хлопот. Избегайте стай волков и разъяренных медведей, укрывайтесь от проливного дождя и ищите свет в кромешной тьме. Вам также нужно будет освоить комплексную механику выживания, завязанную на вашем голоде, жажде, температуре тела и многих других аспектах.', 'dayz_capsule_184x69.jpg', 'DayZ'),
(5, 3, 'rimworld_biotech_poster.jpg', '595', '2022-11-01', 'Дополнение Biotech для Rimworld', 'Raise a family with children, experiment with genetic modifications, and command your own mechanoid army and workforce.\r\nRaise a family\r\nHave children and raise a family through natural or artificial means. Colonists could give birth or use a surrogate mother, take in a band of orphans, and even gestate embryos in machines. Play matchmaker with your colonists, or let their relationships grow organically. Prepare for labor and childcare, and get ready to welcome your little ones to the world!\r\nCare for your babies\r\nKeep your baby’s tummy full with lots of good eats, decorate an adorable nursery for playtime, and build a comfortable crib for a good night’s rest. Happy babies make for happy colonists.\r\nWatch over your children\r\nGive your children a rich and happy childhood by balancing their life between work and play. Help kids fulfill their learning desires by letting them explore nature, chat on the radio, spend time in class, daydream, scribble, and watch the grown-ups at work. Choose your children’s traits and passions at certain ages - the healthier their upbringing, the greater the variety of traits and passions to pick from.\r\n\r\nGrowth vats offer a cheaper alternative to normal child raising. Use vats to accelerate your children’s development to quickly churn out dumb soldiers and simple workers.\r\nGenetic modification\r\nCreate your own genetically-modified colonists known as xenohumans. Curate a collection of exotic genes by purchasing them from traders, accepting them as quest rewards, or extracting them from your menagerie of xenohuman prisoners. Recombine genes to make bizarre and advantageous mixes of traits, and build your colony of xenohumans!\r\nMeet new xenohuman factions\r\nEngage with new factions consisting of exotic xenohumans. Xenohuman factions include hardy pig-people, poison-drinking waster pirates, unforgiving neanderthal hunters, and more. Factions feel different from each other - how you handle a group of frenzied fire-breathers will be different from stopping the wolf escorts sent by fur-bodied riflemen. Some xenohuman cultures are friendly, while others are hostile or prefer to be left alone.\r\nJoin the immortal blood-drinkers\r\nSanguophages pass among humans undetected while concealing superhuman powers and working to satiate their genetic need for blood. Powered by superintelligent nano-machines, sanguophages are ageless, immortal, preternaturally beautiful, and capable of launching deadly spines and healing allies. You may join their cult if deemed worthy, or force them to grant you immortality.\r\nBuild and control mechanoids\r\nMake your colonist into a mechanitor - a person with a brain implant that lets them psychically command semi-living machines called mechanoids. Create mechanoids by growing them inside high-tech gestator tanks and command a wide variety of new combat and labor mechanoids.\r\n\r\nBuild a mechanoid army and experiment with a variety of battle tactics using swarms of cheap, disposable gunners, tanky defenders, shield-projecting snipers, flame-spitters, and more. At home, make mechanoid workers that can manufacture goods, rescue and tend to colonists, build and repair structures, sow and harvest crops, haul stuff, and other tasks. Grow your swarm and upgrade your mechanitor into an unstoppable mechlord.\r\nChallenge super-mechanoid bosses\r\nCall down three new super-mechanoid bosses to fight. Defeat these super-deadly enemies and their escorts and harvest special mechanoid chips from their smoking husks to advance your mechanoid technology.\r\nAdapt to pollution\r\nYour mechanoid infrastructure produces toxic wastepacks. Left unfrozen, waste deteriorates and leaks pollutants into the environment. Pollution poisons your colonists, mutates plants and animals, blocks the sunlight, and attracts giant hostile insects. Manage your waste, or embrace pollution with new gear, detoxifier organs, and genetic modifications.', 'rimworld_biotech_capsule_120.jpg', 'RimWorld - Biotech\r\n'),
(6, 3, 'dayz_livonia_poster.jpg', '349', '2019-12-03', ' ', 'Добро пожаловать в Ливонию! Ливония, изобилующая дикой природой, руинами и скрытыми локациями, раскинулась на территории 163 км2, состоящей из полей, лесов и таинственных пейзажей — это дает уникальный новый опыт, который понравится как новичкам, так и ветеранам DayZ.\r\n\r\nИсследуйте земли. Захватывающее разнообразие неизведанных локаций ждет смелых и предприимчивых. Исследуйте мрачные болота, заброшенные охотничьи хижины, лесопилки и вырубленные леса, а также огромные карьеры с оставшимися запасами взрывчатки.\r\n\r\nДобывайте пропитание. Съестные припасы в Ливонии скудны. Так что если вы хотите выжить, вам придется научиться охотиться, ловить рыбу и собирать кормовые растения в условиях дикой природы, не прощающей ошибок. К счастью, сейчас земля кажется более живой, чем до апокалипсиса.\r\n\r\nОткройте секрет. Отправляйтесь на юг и найдите скрытый вход, ведущий в таинственный подземный комплекс. Позовите на помощь друга, когда будете искать способ проникнуть вовнутрь. И не забудьте взять с собой припасы, особенно фонарик. Иначе вы можете заблудиться в темном лабиринте коридоров, ожидающих каждого, кто в них войдет.', 'dayz_livonia_capsule_sm_120.jpg', 'DayZ Livonia\r\n'),
(7, 1, 'projectzomboid_poster.jpg', '435', '2013-11-08', 'Project Zomboid is the ultimate in zombie survival. Alone or in MP: you loot, build, craft, fight, farm and fish in a struggle to survive. A hardcore RPG skillset, a vast map, massively customisable sandbox and a cute tutorial raccoon await the unwary. So how will you die? All it takes is a bite..\r\n', 'Project Zomboid is an open-ended zombie-infested sandbox. It asks one simple question – how will you die? \r\n\r\nIn the towns of Muldraugh and West Point, survivors must loot houses, build defences and do their utmost to delay their inevitable death day by day. No help is coming – their continued survival relies on their own cunning, luck and ability to evade a relentless horde.\r\nCurrent Features\r\nHardcore Sandbox Zombie Survival Game with a focus on realistic survival.\r\nOnline multiplayer survival with persistent player run servers.\r\nLocal 4 player split-screen co-op\r\nHundreds of zombies with swarm mechanics and in-depth visual and hearing systems.\r\nFull line of sight system and real-time lighting, sound and visibility mechanics. Hide in the shadows, keep quiet and keep the lights off at night, or at least hang sheets over the windows.\r\nVast and growing map (loosely based on a real world location) for you to explore, loot and set up your fortress. Check out Blindcoder’s map project: https://map.projectzomboid.com/\r\nVehicles with full physics and deep and realistic gameplay mechanics.\r\nUse tools and items to craft weapons, barricade and cook. You can even build zombie proof forts by chopping trees, sawing wood and scavenging supplies.\r\nDeal with depression, boredom, hunger, thirst and illness while trying to survive.\r\nDay turns to night. The electricity falters. Hordes migrate. Winter draws in. Nature gradually starts to take over.\r\nFarming, fishing, carpentry, cooking, trapping, character customization, skills and perks that develop based on what you do in-game.\r\nProper zombies that don’t run. (Unless you tell them to in the sandbox menu).\r\nA ton of amazing atmospheric music tracks by the prodigy that is Zach Beever.\r\nImaginative Challenge scenarios and instant action ‘Last Stand’ mode, on top of regular Sandbox and Survival \r\nFull, open and powerful Lua modding support.\r\nXbox Controller Gamepad support on Windows. [Others pads can be set up manually. Gamepad support not currently available on Mac]\r\n\r\nWe’re a small team at the moment, but we’re also committed to providing the following:\r\nplanned Features:\r\nThe return of our PZ Stories mode that also serves as first ever tutorial actively trying to kill you at every turn. Kate and Baldspot return!\r\nIn-depth and varied NPC encounters driven in a persistent world, powered by a metagame system that turns each play-through into your very own zombie survival movie with emergent narrative gameplay.\r\nConstant expansion of the countryside and cities around Muldraugh and West Point\r\nFull wilderness survival systems, animals and hunting for food.\r\nMore items, crafting recipes, weapons and gameplay systems.\r\nSteam Workshop and Achievements support', 'projectzomboid_capsule_184x69.jpg', 'Project Zomboid');

-- --------------------------------------------------------

--
-- Структура таблицы `promos`
--

CREATE TABLE `promos` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_begin` datetime NOT NULL,
  `date_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `publisher`
--

CREATE TABLE `publisher` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publisher`
--

INSERT INTO `publisher` (`id`, `name`) VALUES
(1, 'Bohemia Interactive');

-- --------------------------------------------------------

--
-- Структура таблицы `publisher_games`
--

CREATE TABLE `publisher_games` (
  `id` int NOT NULL,
  `id_publisher` int NOT NULL,
  `id_game` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publisher_games`
--

INSERT INTO `publisher_games` (`id`, `id_publisher`, `id_game`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `qualities`
--

CREATE TABLE `qualities` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `qualities`
--

INSERT INTO `qualities` (`id`, `name`, `icon`) VALUES
(1, 'ММО', 'ico_multiPlayer.png'),
(2, 'Против игроков (по сети)', 'ico_multiPlayer.png'),
(3, 'Кооператив (по сети)', 'ico_coop.png'),
(4, 'Достижения', 'ico_achievements.png'),
(5, 'Имеется античит', 'ico_vac.png');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL,
  `text` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `id_user`, `id_game`, `text`, `grade`) VALUES
(5, 1, 4, 'Не играйте!!!', '3');

-- --------------------------------------------------------

--
-- Структура таблицы `series`
--

CREATE TABLE `series` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `similar_products`
--

CREATE TABLE `similar_products` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_similar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `similar_products`
--

INSERT INTO `similar_products` (`id`, `id_game`, `id_similar`) VALUES
(1, 4, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `subgenres`
--

CREATE TABLE `subgenres` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subgenres`
--

INSERT INTO `subgenres` (`id`, `name`) VALUES
(1, 'CRPG'),
(2, 'Упрощенный рогалик'),
(3, 'Похожа на Dark Souls'),
(4, 'Арена-шутер'),
(5, 'Историческая стратегия');

-- --------------------------------------------------------

--
-- Структура таблицы `system_requier`
--

CREATE TABLE `system_requier` (
  `id` int NOT NULL,
  `id_game` int NOT NULL,
  `id_platform` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `processor` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `graphics` varchar(255) NOT NULL,
  `directX` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `hdd` varchar(255) NOT NULL,
  `sound` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `system_requier`
--

INSERT INTO `system_requier` (`id`, `id_game`, `id_platform`, `type`, `os`, `processor`, `ram`, `graphics`, `directX`, `web`, `hdd`, `sound`, `comments`) VALUES
(1, 4, 1, 'Минимальные', 'Windows 7/8.1 64-bit', 'Intel Core i5-4430', '8 ГБ ОЗУ', 'NVIDIA GeForce GTX 760 или AMD R9 270X', 'Версии 11', 'Требуется подключение к сети', '16 ГБ', 'DirectX-совместимая', ' '),
(2, 4, 1, 'Рекомендованные', 'Windows 10 64-bit', 'Intel Core i5-6600K или AMD R5 1600X', '12 ГБ ОЗУ', 'NVIDIA GeForce GTX 1060 или AMD RX 580', 'Версии 11', 'Требуется подключение к интернету', '25 ГБ', 'DirectX-совместимая', ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `e-mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `e-mail`) VALUES
(1, 'jmix', '$2y$10$CxjsSqXLzmWTTX9PrKIt2.nsQNLlA4itSrvhyder59SnbN2y5CAbm', 'jmix@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wish` int NOT NULL,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wishlist`
--

INSERT INTO `wishlist` (`id_wish`, `id_user`, `id_game`) VALUES
(2, 1, 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bucket`
--
ALTER TABLE `bucket`
  ADD PRIMARY KEY (`id_bucket`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_game` (`id_game`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `developer_games`
--
ALTER TABLE `developer_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_developer` (`id_developer`),
  ADD KEY `id_game` (`id_game`);

--
-- Индексы таблицы `dlc`
--
ALTER TABLE `dlc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dlc` (`id_dlc`),
  ADD KEY `dlc_ibfk_2` (`id_game`);

--
-- Индексы таблицы `editions`
--
ALTER TABLE `editions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`);

--
-- Индексы таблицы `edition_content`
--
ALTER TABLE `edition_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dlc` (`id_dlc`),
  ADD KEY `id_edition` (`id_edition`);

--
-- Индексы таблицы `game_achievements`
--
ALTER TABLE `game_achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_platform` (`id_achievement`);

--
-- Индексы таблицы `game_gallery`
--
ALTER TABLE `game_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`);

--
-- Индексы таблицы `game_genre`
--
ALTER TABLE `game_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_genre_ibfk_1` (`id_game`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Индексы таблицы `game_labels`
--
ALTER TABLE `game_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_label` (`id_label`);

--
-- Индексы таблицы `game_languages`
--
ALTER TABLE `game_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_language` (`id_language`);

--
-- Индексы таблицы `game_platform`
--
ALTER TABLE `game_platform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_platform` (`id_platform`);

--
-- Индексы таблицы `game_promo`
--
ALTER TABLE `game_promo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_promo_ibfk_1` (`id_game`),
  ADD KEY `id_promo` (`id_promo`);

--
-- Индексы таблицы `game_qualities`
--
ALTER TABLE `game_qualities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_qualities_ibfk_1` (`id_game`),
  ADD KEY `game_qualities_ibfk_2` (`id_quality`);

--
-- Индексы таблицы `game_series`
--
ALTER TABLE `game_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_serie` (`id_serie`);

--
-- Индексы таблицы `game_subgenres`
--
ALTER TABLE `game_subgenres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_subgenre` (`id_subgenre`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cathegory` (`id_cathegory`);

--
-- Индексы таблицы `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publisher_games`
--
ALTER TABLE `publisher_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_publisher` (`id_publisher`);

--
-- Индексы таблицы `qualities`
--
ALTER TABLE `qualities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_ibfk_1` (`id_game`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `similar_products`
--
ALTER TABLE `similar_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_similar` (`id_similar`);

--
-- Индексы таблицы `subgenres`
--
ALTER TABLE `subgenres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_requier`
--
ALTER TABLE `system_requier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_platform` (`id_platform`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wish`),
  ADD KEY `wishlist_ibfk_1` (`id_game`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bucket`
--
ALTER TABLE `bucket`
  MODIFY `id_bucket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `developer`
--
ALTER TABLE `developer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `developer_games`
--
ALTER TABLE `developer_games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `dlc`
--
ALTER TABLE `dlc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `editions`
--
ALTER TABLE `editions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `edition_content`
--
ALTER TABLE `edition_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `game_achievements`
--
ALTER TABLE `game_achievements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `game_gallery`
--
ALTER TABLE `game_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `game_genre`
--
ALTER TABLE `game_genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `game_labels`
--
ALTER TABLE `game_labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `game_languages`
--
ALTER TABLE `game_languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `game_platform`
--
ALTER TABLE `game_platform`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `game_promo`
--
ALTER TABLE `game_promo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game_qualities`
--
ALTER TABLE `game_qualities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `game_series`
--
ALTER TABLE `game_series`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game_subgenres`
--
ALTER TABLE `game_subgenres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `library`
--
ALTER TABLE `library`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `publisher_games`
--
ALTER TABLE `publisher_games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `qualities`
--
ALTER TABLE `qualities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `series`
--
ALTER TABLE `series`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `similar_products`
--
ALTER TABLE `similar_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `subgenres`
--
ALTER TABLE `subgenres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `system_requier`
--
ALTER TABLE `system_requier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wish` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bucket`
--
ALTER TABLE `bucket`
  ADD CONSTRAINT `bucket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bucket_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `developer_games`
--
ALTER TABLE `developer_games`
  ADD CONSTRAINT `developer_games_ibfk_1` FOREIGN KEY (`id_developer`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `developer_games_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dlc`
--
ALTER TABLE `dlc`
  ADD CONSTRAINT `dlc_ibfk_1` FOREIGN KEY (`id_dlc`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `dlc_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `editions`
--
ALTER TABLE `editions`
  ADD CONSTRAINT `editions_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `edition_content`
--
ALTER TABLE `edition_content`
  ADD CONSTRAINT `edition_content_ibfk_1` FOREIGN KEY (`id_dlc`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `edition_content_ibfk_2` FOREIGN KEY (`id_edition`) REFERENCES `editions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_achievements`
--
ALTER TABLE `game_achievements`
  ADD CONSTRAINT `game_achievements_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_achievements_ibfk_2` FOREIGN KEY (`id_achievement`) REFERENCES `achievements` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_gallery`
--
ALTER TABLE `game_gallery`
  ADD CONSTRAINT `game_gallery_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_genre`
--
ALTER TABLE `game_genre`
  ADD CONSTRAINT `game_genre_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_labels`
--
ALTER TABLE `game_labels`
  ADD CONSTRAINT `game_labels_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_labels_ibfk_2` FOREIGN KEY (`id_label`) REFERENCES `labels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_languages`
--
ALTER TABLE `game_languages`
  ADD CONSTRAINT `game_languages_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_languages_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_platform`
--
ALTER TABLE `game_platform`
  ADD CONSTRAINT `game_platform_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_platform_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platforms` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_promo`
--
ALTER TABLE `game_promo`
  ADD CONSTRAINT `game_promo_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_promo_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_qualities`
--
ALTER TABLE `game_qualities`
  ADD CONSTRAINT `game_qualities_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_qualities_ibfk_2` FOREIGN KEY (`id_quality`) REFERENCES `qualities` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_series`
--
ALTER TABLE `game_series`
  ADD CONSTRAINT `game_series_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_series_ibfk_2` FOREIGN KEY (`id_serie`) REFERENCES `series` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `game_subgenres`
--
ALTER TABLE `game_subgenres`
  ADD CONSTRAINT `game_subgenres_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `game_subgenres_ibfk_2` FOREIGN KEY (`id_subgenre`) REFERENCES `subgenres` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_cathegory`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `publisher_games`
--
ALTER TABLE `publisher_games`
  ADD CONSTRAINT `publisher_games_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `publisher_games_ibfk_2` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `similar_products`
--
ALTER TABLE `similar_products`
  ADD CONSTRAINT `similar_products_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `similar_products_ibfk_2` FOREIGN KEY (`id_similar`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `system_requier`
--
ALTER TABLE `system_requier`
  ADD CONSTRAINT `system_requier_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `system_requier_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platforms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
