<?php

include_once 'includes/connect.php';
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/normalize.css">
    <title>Интернет-магазин</title>
</head>

<body>
    <main class="main">
        <?php
        include_once 'includes/header.php'
        ?>
        <section class="main__section promo">
            <div class="container promo__container">
                <div class="promo__swiper popular">

                </div>
                <div class="promo__banner banner">

                </div>
                <div class="promo__specials specials">

                </div>
                <div class="promo__category category">

                </div>
            </div>
        </section>
        <section class="main__section store">
            <div class="container store__container">
                <div class="store__menu">
                    <ul class="store__nav">
                        <li class="store__item"><a href="#" class="store__link">Новинки</a></li>
                        <li class="store__item"><a href="#" class="store__link">Популярные игры</a></li>
                        <li class="store__item"><a href="#" class="store__link">Скидки</a></li>
                    </ul>
                    <div class="store__wrapper games">
                        <?php
                        if (isset($_GET['categoryid'])) {
                            $idcategory = $_GET['categoryid'];
                            $gameSelect = "SELECT * FROM `product`
                            WHERE id_cathegory = $idcategory
                            ORDER BY game_name";
                            $gameSelectResult = mysqli_query($connect, $gameSelect);
                        }

                        $platformSelect = "SELECT * FROM game_platform, platforms
                        WHERE game_platform.id_platform = platforms.id";
                        $platformSelectResult = mysqli_query($connect, $platformSelect);


                        $labelsSelect = "SELECT * FROM game_labels, labels
                        WHERE game_labels.id_label = labels.id";
                        $labelSelectResult = mysqli_query($connect, $labelsSelect);

                        ?>


                        <div class="games__list">
                            <?php
                            if (isset($_GET['genres'])) {
                                $genre = $_GET['genres'];
                                foreach ($genre as $gnr) {
                                    $gameByGenreSelect = "SELECT * FROM `product`
                                    JOIN game_genre ON game_genre.id_game = product.id
                                    JOIN genres ON genres.id = game_genre.id_genre
                                    WHERE genres.name = '$gnr'";
                                    $gameByGenreSelectResult = mysqli_query($connect, $gameByGenreSelect);
                                }
                                foreach ($gameByGenreSelectResult as $gameRow) {
                                    echo "<a href='product.php?gameid=" . $gameRow['id'] . "'>";
                                    echo "<div class='games__item game'>";
                                    echo "<img src='/img/" . $gameRow['capsule_image'] . "' alt='' class='game__image'>";
                                    echo "<div class='game__tags'>
                                    <h3 class='game__name'>" . $gameRow['game_name'] . "</h3>";
                                    echo "<ul class='game__list platforms'>";
                                    foreach ($platformSelectResult as $platformRow) {
                                        if ($platformRow['id_game'] == $gameRow['id']) {
                                            echo "<li class='platforms__item'>" . $platformRow['name'] . "</li>";
                                        }
                                    }
                                    echo "</ul>";
                                    echo "<ul class='game__list labels'>";
                                    foreach ($labelSelectResult as $labelRow) {
                                        if ($labelRow['id_game'] == $gameRow['id']) {
                                            echo "<li class='platforms__item'>" . $labelRow['name'] . "</li>";
                                        }
                                    }
                                    echo "</ul>";
                                    echo "</div>";
                                    echo "<div class='game__price price'>";
                                    echo "<span class='price__span'>" . $gameRow['price'] . " руб." . "</span>";
                                    echo "</div>";
                                    echo "</div>";
                                    echo "</a>";
                                }
                            } else {
                                foreach ($gameSelectResult as $gameRow) {
                                    echo "<a href='product.php?gameid=" . $gameRow['id'] . "'>";
                                    echo "<div class='games__item game'>";
                                    echo "<img src='/img/" . $gameRow['capsule_image'] . "' alt='' class='game__image'>";
                                    echo "<div class='game__tags'>
                                    <h3 class='game__name'>" . $gameRow['game_name'] . "</h3>";
                                    echo "<ul class='game__list platforms'>";
                                    foreach ($platformSelectResult as $platformRow) {
                                        if ($platformRow['id_game'] == $gameRow['id']) {
                                            echo "<li class='platforms__item'>" . $platformRow['name'] . "</li>";
                                        }
                                    }
                                    echo "</ul>";
                                    echo "<ul class='game__list labels'>";
                                    foreach ($labelSelectResult as $labelRow) {
                                        if ($labelRow['id_game'] == $gameRow['id']) {
                                            echo "<li class='platforms__item'>" . $labelRow['name'] . "</li>";
                                        }
                                    }
                                    echo "</ul>";
                                    echo "</div>";
                                    echo "<div class='game__price price'>";
                                    echo "<span class='price__span'>" . $gameRow['price'] . " руб." . "</span>";
                                    echo "</div>";
                                    echo "</div>";
                                    echo "</a>";
                                }
                            }


                            ?>
                        </div>
                        <div class="games__filters">
                            <aside class="promo__aside aside">
                                <?php

                                $genreSelect = "SELECT * FROM `genres`";
                                $genreSelectResult = mysqli_query($connect, $genreSelect);

                                $subgenreSelect = "SELECT * FROM `subgenres`";
                                $subgenreSelectResult = mysqli_query($connect, $subgenreSelect);

                                $categorySelect = "SELECT * FROM `categories`";
                                $categorySelectResult = mysqli_query($connect, $categorySelect);

                                ?>
                                <div class="aside__categories categories">
                                    <h3 class="categories__label">Выбор по категориям</h3>
                                    <ul class="categories__list">
                                        <?php
                                        foreach ($categorySelectResult as $categoryRow) {
                                            echo "<li class='categories__item'>";
                                            echo "<a href='category.php?categoryid=" . $categoryRow['id'] . "' class='categories__link'>" . $categoryRow['name'] . "</a>";
                                            echo "</li>";
                                        }

                                        ?>
                                    </ul>
                                </div>
                                <form class="aside__form form" method="GET" action="filtered.php">
                                    <h3 class="form__label">Выбор по жанрам</h3>
                                    <div class="form__checkbox__wrapper">
                                        <?php
                                        include_once 'includes/filter.php'
                                        ?>
                                    </div>
                                    <input type="submit" value="Отправить" name="asideSend">
                                </form>
                                <a href="/index.php">Показать всё</a>
                                <?php


                                ?>
                            </aside>
                        </div>
                    </div>
                </div>
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