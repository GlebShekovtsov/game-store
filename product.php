<?php

include_once 'includes/connect.php';

if (isset($_GET['gameid']) && isset($_SESSION['id'])) {
    $user = $_SESSION['id'];
    $gameid = $_GET['gameid'];
}

if (isset($_GET['gameid'])) {
    $gameid = $_GET['gameid'];
}
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">
    <title>Игра</title>
</head>

<body>
    <main class="main">
        <?php
        include_once 'includes/header.php'
        ?>
        <section class="main__section game">
            <div class="container game__container">
                <?php
                $gameSelectById = "SELECT * FROM `product`
                WHERE product.id = $gameid";
                $gameSelectByIdResult = mysqli_query($connect, $gameSelectById);


                $developerSelect = "SELECT * FROM `developer`, `developer_games`
                WHERE developer_games.id_developer = developer.id";
                $developerSelectResult = mysqli_query($connect, $developerSelect);


                $publisherSelect = "SELECT * FROM `publisher`, `publisher_games`
                WHERE publisher_games.id_publisher = publisher.id";
                $publisherSelectResult = mysqli_query($connect, $publisherSelect);

                $labelsSelect = "SELECT * FROM `labels`, `game_labels`
                WHERE game_labels.id_label = labels.id";
                $labelsSelectResult = mysqli_query($connect, $labelsSelect);

                $editionSelect = "SELECT * FROM `editions`
                WHERE id_game = $gameid";
                $editionSelectResult = mysqli_query($connect, $editionSelect);

                $editionContentSelect = "SELECT * FROM `edition_content`
                INNER JOIN `editions` ON edition_content.id_edition = editions.id
                INNER JOIN `product` ON edition_content.id_dlc = product.id
                WHERE edition_content.id_edition = editions.id";
                $editionContentSelectResult = mysqli_query($connect, $editionContentSelect);


                $dlcSelect = "SELECT *, COUNT(id_dlc) AS dlc_count, SUM(price) as dlc_count_price FROM `dlc`
                INNER JOIN product ON dlc.id_dlc = product.id
                WHERE id_game = $gameid
                GROUP BY game_name";
                $dlcSelectResut = mysqli_query($connect, $dlcSelect);


                $minSysReqSelect = "SELECT * FROM `system_requier`
                WHERE id_game= $gameid AND type = 'Минимальные' AND id_platform = 1";
                $minSysReqSelectResult = mysqli_query($connect, $minSysReqSelect);


                $recSysReqSelect = "SELECT * FROM `system_requier`
                WHERE id_game= $gameid AND type = 'Рекомендованные' AND id_platform = 1";
                $recSysReqSelectResult = mysqli_query($connect, $recSysReqSelect);


                $qualSelect = "SELECT * FROM `qualities`
                INNER JOIN game_qualities ON game_qualities.id_quality = qualities.id
                INNER JOIN product ON game_qualities.id_game = product.id
                WHERE game_qualities.id_game = $gameid";
                $qualSelectResult = mysqli_query($connect, $qualSelect);

                $languageSelect = "SELECT * FROM `game_languages`
                INNER JOIN languages ON game_languages.id_language = languages.id
                INNER JOIN product ON game_languages.id_game = product.id
                WHERE game_languages.id_game = $gameid";
                $languageSelectResult = mysqli_query($connect, $languageSelect);


                $achievementSelect = "SELECT * FROM `game_achievements`
                INNER JOIN achievements ON game_achievements.id_achievement = achievements.id
                INNER JOIN product ON game_achievements.id_game = product.id
                WHERE game_achievements.id_game = $gameid
                ORDER BY RAND() LIMIT 5";
                $achievementSelectResult = mysqli_query($connect, $achievementSelect);


                $genreSelect = "SELECT * FROM `game_genre`
                INNER JOIN genres ON game_genre.id_genre = genres.id
                INNER JOIN product ON game_genre.id_game = product.id
                WHERE game_genre.id_game = $gameid";
                $genreSelectResult = mysqli_query($connect, $genreSelect);
                $genreSelectArray = mysqli_fetch_assoc($genreSelectResult);


                $similarSelect = "SELECT * FROM `similar_products`
                INNER JOIN product ON similar_products.id_similar = product.id
                WHERE similar_products.id_game = $gameid";
                $similarSelectResult = mysqli_query($connect, $similarSelect);

                if (isset($_SESSION['id'])) {
                    $librarySelect = "SELECT * FROM `library`
                    WHERE id_user = $user";
                    $librarySelectResult = mysqli_query($connect, $librarySelect);
                }




                $gallerySelect = "SELECT * FROM `game_gallery`
                WHERE id_game = $gameid ORDER BY RAND() LIMIT 4";
                $gallerySelectResult = mysqli_query($connect, $gallerySelect);
                ?>
                <div class="game__nav">
                    <a href="index.php">Все продукты</a>
                    <?php
                    foreach ($gameSelectByIdResult as $gameIdRow) {
                        echo "> " . $gameIdRow['game_name'];
                    }
                    ?>
                </div>
                <?php foreach ($gameSelectByIdResult as $gameIdRow) {
                    echo "<div class='game__label'>";
                    echo $gameIdRow['game_name'];
                    echo "</div>";
                ?>
                    <div class='game__wrapper'>
                        <div class="game__gallery gallery">
                            <ul class="gallery__list">
                                <?php
                                foreach ($gallerySelectResult as $galleryRow) {
                                    echo "<li class='gallery__item'>";
                                    echo "<img src='img/" . $galleryRow['picture'] . "' class='gallery__pic'>";
                                    echo "</li>";
                                }
                                ?>

                            </ul>
                        </div>
                        <div class="game__information">
                            <img src="img\<? echo $gameIdRow['poster'] ?>" alt="" class="game__poster">
                            <p class="game__shrt-descr">
                                <?php echo $gameIdRow['short_descr'] ?>
                            </p>
                            <div class="game__release-date">
                                Дата выхода:
                                <?php
                                $date = $gameIdRow['release_date'];
                                $dateReplace = str_replace("-", ".", "$date");
                                echo $dateReplace;
                                ?>
                            </div>
                            <div class="game__devs-wrapper">
                                <div class="game__developer">
                                    Разработчик:
                                    <?php
                                    foreach ($developerSelectResult as $developerRow) {
                                        if ($developerRow['id_game'] == $gameIdRow['id']) {
                                            echo "<a href='developer.php?devid=" . $developerRow['id'] . "'>" . $developerRow['name']  . "</a>";
                                        }
                                    }
                                    ?>
                                </div>
                                <div class="game__publisher">
                                    Издатель:
                                    <?php
                                    foreach ($publisherSelectResult as $publisherRow) {
                                        if ($publisherRow['id_game'] == $gameIdRow['id']) {
                                            echo "<a href='publisher.php?pubid=" . $publisherRow['id'] . "'>" . $publisherRow['name']  . "</a>";
                                        }
                                    }
                                    ?>
                                </div>
                            </div>
                            <div class="game__labels game-labels">
                                Популярные метки для этого продукта
                                <ul class="game-labels__list">
                                    <?php
                                    foreach ($labelsSelectResult as $labelRow) {
                                        if ($labelRow['id_game'] == $gameIdRow['id']) {
                                            echo "<li class='game-labels__item'>" . $labelRow['name'] . "</li>";
                                        }
                                    }
                                    ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <?php
                    if (isset($_SESSION['id'])) {
                        foreach ($librarySelectResult as $libraryRow) {
                        }
                    ?>
                        <div class="game__wishlist wishlist">
                            <?php

                            if ($libraryRow['id_game'] == $gameIdRow['id']) {
                            } else {
                                echo "<a href='wishlist.php?gameid=" . $gameIdRow['id'] . "' class='wishlist__link'>В список желаемого</a>";
                            }
                            ?>
                        </div>
                        <div class="game__full-info">
                            <div class="game__main-info">
                                <div class="game__price-wrapper price">
                                    <h2 class="price__header">Купить <?php echo $gameIdRow['game_name'] ?></h2>
                                    <div class="price__block">
                                        <span class="price__span">
                                            <?php echo $gameIdRow['price'] . " руб."; ?>
                                        </span>
                                    <?php
                                    if ($libraryRow['id_game'] == $gameIdRow['id'] && isset($_SESSION['id'])) {
                                        echo "Игра уже в библиотеке";
                                    } else {
                                        echo "<a href='cart.php?gameid= " . $gameIdRow['id'] . "' class='price__link'>" . "В корзину" . "</a>";
                                    }
                                }
                                    ?>
                                    </div>
                                </div>
                                <div class="game__edition-wrapper edition">
                                    <?php
                                    foreach ($editionSelectResult as $editionRow) {
                                    ?>
                                        <h2 class="edition__header">Купить <?php echo $editionRow['name'] ?></h2>
                                        <div class="edition__block">
                                            <p class="edition__include">Включенные товары: </p>
                                            <ul class="edition__list">
                                                <?php
                                                foreach ($editionContentSelectResult as $contentRow) {
                                                    if ($contentRow['id_game'] == $gameIdRow['id'] && isset($_SESSION['id'])) {
                                                        echo "<li class='edition__item'>" . $contentRow['game_name'] . "</li>";
                                                    }
                                                }
                                                ?>

                                            </ul>
                                        </div>
                                        <div class="price__block">
                                            <span class="price__span">
                                                <?php echo $editionRow['price'] . " руб."; ?>
                                            </span>
                                            <a href="cart.php?editionid=<?php echo $editionRow['id'] ?>" class="price__link">В корзину</a>

                                        </div>

                                    <?php
                                    }
                                    ?>
                                </div>
                                <div class="game__dlc-block dlc">
                                    <div class="dlc__about-wrapper">
                                        <?php
                                        foreach ($dlcSelectResut as $dlcRow) {
                                        ?>
                                            <h3 class="dlc__label">КОНТЕНТ ДЛЯ ЭТОЙ ИГРЫ</h3>
                                            <span class="dlc__show-all">Просмотреть все (<?php echo $dlcRow['dlc_count'] ?>)</span>
                                    </div>
                                    <ul class="dlc__list">
                                        <?
                                            echo "<li class='dlc__item'>";
                                            echo "<a href='product.php?gameid=" . $dlcRow['id'] . "' class='dlc__name'>" . $dlcRow['game_name'] . "</a>";
                                            echo "<span class='dlc__price'>" . $dlcRow['price'] . " руб. " . "</span>";
                                            echo "</li>";
                                        ?>
                                    </ul>
                                    <div class="dlc__price-wrapper">
                                    <?php
                                        } ?>
                                    </div>
                                </div>
                                <div class="game__descr-block">
                                    <h3 class="descr__label">ОБ ЭТОЙ ИГРЕ</h3>
                                    <div class="descr__wrapper">
                                        <?php
                                        echo $gameIdRow['full_descr'];
                                        ?>
                                    </div>
                                </div>

                                <div class="game__sys-req sys-req">
                                    <h3 class="sys-req__label">СИСТЕМНЫЕ ТРЕБОВАНИЯ</h3>
                                    <div class="sys-req__wrapper">
                                        <div class="sys-req__min min-req">
                                            <span class="min-req__span">Минимальные:</span>
                                            <?php foreach ($minSysReqSelectResult as $minRow) {
                                            ?>
                                                <ul class="min-req__list">
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">ОС: </span>
                                                        <?php echo $minRow['os'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Процессор: </span>
                                                        <?php echo $minRow['processor'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Оперативная память: </span>
                                                        <?php echo $minRow['ram'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Видеокарта: </span>
                                                        <?php echo $minRow['graphics'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">DirectX: </span>
                                                        <?php echo $minRow['directX'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Сеть: </span>
                                                        <?php echo $minRow['web'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Место на диске: </span>
                                                        <?php echo $minRow['hdd'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Звуковая карта: </span>
                                                        <?php echo $minRow['sound'] ?>
                                                    </li>
                                                    <li class="min-req__item">
                                                        <span class="min-req__name">Дополнительно: </span>
                                                        <?php echo $minRow['comments'] ?>
                                                    </li>
                                                <?php
                                            }
                                                ?>
                                                </ul>
                                        </div>
                                        <div class="sys-req__rec rec-req">
                                            <span class="rec-req__span">Рекомендованные:</span>
                                            <?php foreach ($recSysReqSelectResult as $recRow) {
                                            ?>
                                                <ul class="rec-req__list">
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">ОС: </span>
                                                        <?php echo $recRow['os'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Процессор: </span>
                                                        <?php echo $recRow['processor'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Оперативная память: </span>
                                                        <?php echo $recRow['ram'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Видеокарта: </span>
                                                        <?php echo $recRow['graphics'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">DirectX: </span>
                                                        <?php echo $recRow['directX'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Сеть: </span>
                                                        <?php echo $recRow['web'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Место на диске: </span>
                                                        <?php echo $recRow['hdd'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Звуковая карта: </span>
                                                        <?php echo $recRow['sound'] ?>
                                                    </li>
                                                    <li class="rec-req__item">
                                                        <span class="rec-req__name">Дополнительно: </span>
                                                        <?php echo $recRow['comments'] ?>
                                                    </li>
                                                </ul>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="game__similar similar">
                                    <h3 class="similar__label">ПОХОЖИЕ ТОВАРЫ</h3>
                                    <ul class="similar__list">
                                        <?php
                                        foreach ($similarSelectResult as $similarRow) {
                                            echo "<a href='product.php?gameid=" . $similarRow['id_similar'] . "'>";
                                            echo "<li class='similar__item'>";
                                            echo "<img class='similar__image' src='img/" . $similarRow['capsule_image'] . "' alt=''>";
                                            echo "<span class='similar__game-name'>" . $similarRow['game_name'] . "</span>";
                                            echo "<span class='similar__game-price'>" . $similarRow['price'] . " руб." . "</span>";
                                            echo "</li>";
                                            echo "</a>";
                                        }
                                        ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="game__side-info side-info">
                                <div class="side-info__qualities">
                                    <ul class="side-info__list">
                                        <?php
                                        foreach ($qualSelectResult as $qualRow) {
                                            echo "<li class='side-info__item'>";
                                            echo "<img src='img/" . $qualRow['icon'] . "' сlass='side-info__image' alt=''>";
                                            echo "<span class='side-info__span'>" . $qualRow['name'] . "</span>";
                                            echo "</li>";
                                        }
                                        ?>
                                    </ul>
                                </div>

                                <div class="side-info__language language">
                                    <div class="language__label">Языки:</div>
                                    <table class="language__table">
                                        <thead class="language__thead">
                                            <tr class="language__trow">
                                                <th class="language__theadrow"><br></th>
                                                <th class="language__theadrow">Интерфейс</th>
                                                <th class="language__theadrow">Озвучка</th>
                                                <th class="language__theadrow">Субтитры</th>
                                            </tr>
                                        </thead>
                                        <tbody class="language__tbody">
                                            <?php
                                            foreach ($languageSelectResult as $languageRow) {
                                                echo "<tr class='language__trow'>";
                                                echo "<td class='language__tdfirst'>" . $languageRow['name'] . "</td>";

                                                $interfacemark = $languageRow['interface'] == true ? "✔" : "&nbsp;";
                                                echo "<td class='language__td'>" . $interfacemark . "</td>";

                                                $voicemark = $languageRow['voice'] == true ? "✔" : "&nbsp;";
                                                echo "<td class='language__td'>" . $voicemark . "</td>";

                                                $subtitlemark = $languageRow['subtitles'] == true ? "✔" : "&nbsp;";
                                                echo "<td class='language__td'>" . $subtitlemark . "</td>";
                                                echo "</tr>";
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="side-info__achievements achievements">
                                    <div class="achievements_label">Достижения: </div>
                                    <p class="header__label"></p>
                                    <div class="achiements__wrapper">
                                        <ul class="achievements__list">
                                            <?php
                                            foreach ($achievementSelectResult as $achievementRow) {
                                                echo "<li class='achievements__item'>";
                                                echo "<img src='img/" . $achievementRow['picture'] . "' alt='' class='achievements__image'>";
                                                echo "</li>";
                                            }
                                            ?>
                                        </ul>
                                        <a href="#" class="achievements__showmore">Показать всё</a>
                                    </div>
                                </div>

                                <div class="side-info__info-block info-block">
                                    <div class="info-block__name">Название: <?php echo $gameIdRow['game_name'] ?></div>

                                    <div class="info-block__genres genres">
                                        <span class="genres__span">Жанр: </span>
                                        <ul class="genres__list">
                                            <?php
                                            foreach ($genreSelectResult as $genreRow) {
                                                echo "<li class='genres__item'>" . $genreRow['name'] . " " . "</li>";
                                            }
                                            ?>
                                        </ul>
                                    </div>

                                    <div class="info-block__developer developer">
                                        <span class="developer__span">Разработчик: </span>
                                        <?php
                                        foreach ($developerSelectResult as $developerRow) {
                                            if ($developerRow['id_game'] == $gameIdRow['id']) {
                                                echo "<a href='developer.php?devid=" . $developerRow['id'] . "'>" . $developerRow['name']  . "</a>";
                                            }
                                        }
                                        ?>
                                    </div>

                                    <div class="info-block__publisher publisher">
                                        <span class="publisher__span">Издатель: </span>
                                        <?php
                                        foreach ($publisherSelectResult as $publisherRow) {
                                            if ($publisherRow['id_game'] == $gameIdRow['id']) {
                                                echo "<a href='publisher.php?devid=" . $publisherRow['id'] . "'>" . $publisherRow['name']  . "</a>";
                                            }
                                        }
                                        ?>
                                    </div>

                                    <div class="info-block__release-date release-date">
                                        <span class="release-date__span">Дата выхода: </span>
                                        <?php echo $dateReplace ?>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        <?php

                }

        ?>
        </div>
        </section>
    </main>
    <footer class="footer">
        <div class="container footer__container">
            <p class="footer__text">
                © 2022 Prikol Corporation. Все права защищены. Все торговые марки являются собственностью соответствующих владельцев в РФ и других странах.
                НДС включён во все цены, где он применим. Политика конфиденциальности | Правовая информация | Соглашение подписчика | Возвраты | Файлы cookie
            </p>
        </div>
    </footer>
</body>

</html>