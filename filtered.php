<?php
include_once 'includes/connect.php';
if (isset($_GET['search_string'])) {
} else if ($_GET) {

    $array = $_GET; //Получаем массив GET запроса
    $c = ""; //Переменная для пустой строки


    $arraycount1 = count($array); //Считает количество элементов GET массива
    // echo $arraycount1;
    foreach ($array as $key => $value) {
        $arraycount1 = $arraycount1 - 1;
        $a = "name"; //Присваиваем имя поля
        $a = "$a = "; //Формируем строку
        $arraycount = count($value); //Считаем количество элементов в массивах
        // echo $arraycount;
        foreach ($value as $keyrow) {
            // echo $a; // переменная A содержит название характеристики для запроса
            $arraycount = $arraycount - 1;
            if ($arraycount == 0) //Если счетчик элементов равен 0
            {
                $b = $key . "." . $a . "'" . $keyrow . "' "; //Формируем конец строки из названия ключа и значения
                if ($arraycount1 !== 0) { //Если счетчик массива GET = 0 то
                    $c = $c . $b . "OR "; //Формируем новую строку и добавляем AND
                } else { //Если счетчик массива GET = 0
                    $c = $c . $b; //То формируем конец строки
                }
            } else {
                $b = $key . "." . $a . "'" . $keyrow . "' " . "OR "; //Формируем конец строки
                $c = $c . $b;
            }
        }
    }
} else {
    echo "Методом GET ничего не отправлено";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/style.css">
    <title>Document</title>
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
                        $gameSelect = "SELECT * FROM `product`";
                        $gameSelectResult = mysqli_query($connect, $gameSelect);

                        if (isset($_GET['search_string'])) {
                            $searchstring = $_GET['search_string'];
                            $gameSelectSearch = "SELECT * FROM `product`
                            WHERE game_name LIKE '$searchstring%'";
                            $gameSelectSearchResult = mysqli_query($connect, $gameSelectSearch);
                        } else {
                            $gameByGenreSelect = "SELECT * FROM `product`
                            JOIN game_genre ON game_genre.id_game = product.id
                            JOIN genres ON genres.id = game_genre.id_genre
                            JOIN game_subgenres ON game_subgenres.id_game = product.id
                            JOIN subgenres ON subgenres.id = game_subgenres.id_subgenre 
                            WHERE $c";
                            $gameByGenreSelectResult = mysqli_query($connect, $gameByGenreSelect);
                            $gameByGenreSelectArray = mysqli_fetch_array($gameByGenreSelectResult);
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
                            if (isset($_GET['search_string'])) {
                                foreach ($gameSelectSearchResult as $gameRow) {
                                    echo "<a href='product.php?gameid=" . $gameRow['id'] . "'>";
                                    echo "<div class='games__item game'>";
                                    echo "<img src='img/" . $gameRow['capsule_image'] . "' alt='' class='game__image'>";
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
                                    if ($gameRow['id'] == $gameByGenreSelectArray['id_game']) {
                                        echo "<a href='product.php?gameid=" . $gameRow['id'] . "'>";
                                        echo "<div class='games__item game'>";
                                        echo "<img src='img/" . $gameRow['capsule_image'] . "' alt='' class='game__image'>";
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
                                    <input type="submit" class="btn form__button" value="Отправить">
                                </form>
                                <a href="index.php">Показать всё</a>
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