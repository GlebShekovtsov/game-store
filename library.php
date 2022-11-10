<?php

include_once 'includes/connect.php';
$user = $_SESSION['id'];

?>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">
    <title>Корзина</title>
</head>

<body>
    <main class="main">
        <?php
        include_once 'includes/header.php'
        ?>

        <section class="main__section cart">
            <div class="container cart__container">
                <div class="cart__wrapper">
                    <div class="cart__shortcut shortcut">
                        <a href="index.php">Все продукты > </a>
                        <span class="shortcut__span">Ваша библиотека</span>
                    </div>
                    <h2 class="cart__label">ВАША БИБЛИОТЕКА</h2>
                </div>
                <div class="cart__game-wrapper game">
                    <?php

                    $gameUserSelect = "SELECT * FROM `library`
                    INNER JOIN product on library.id_game = product.id
                    WHERE library.id_user = $user";
                    $gameUserSelectResult = mysqli_query($connect, $gameUserSelect);


                    $platformSelect = "SELECT * FROM game_platform, platforms
                    WHERE game_platform.id_platform = platforms.id";
                    $platformSelectResult = mysqli_query($connect, $platformSelect);


                    $labelsSelect = "SELECT * FROM game_labels, labels
                    WHERE game_labels.id_label = labels.id";
                    $labelSelectResult = mysqli_query($connect, $labelsSelect);

                    ?>
                    <ul class="game__list">
                        <?php
                        foreach ($gameUserSelectResult as $userRow) {
                            echo "<a class='game__view-link' href='product.php?gameid=" . $userRow['id_game'] . "'>";
                            echo "<li class='game__item-library'>";
                            echo "<img src='img/" . $userRow['capsule_image'] . "' alt='' class='game__image'>";
                            echo "<div class='game__tags'>
                            <h3 class='game__name'>" . $userRow['game_name'] . "</h3>";
                            echo "<ul class='game__list platforms'>";
                            foreach ($platformSelectResult as $platformRow) {
                                if ($platformRow['id_game'] == $userRow['id']) {
                                    echo "<li class='platforms__item'>" . $platformRow['name'] . "</li>";
                                }
                            }
                            echo "</ul>";
                            echo "<ul class='game__list labels'>";
                            foreach ($labelSelectResult as $labelRow) {
                                if ($labelRow['id_game'] == $userRow['id']) {
                                    echo "<li class='platforms__item'>" . $labelRow['name'] . "</li>";
                                }
                            }
                            echo "</ul>";
                            echo "</div>";
                            echo "</li>";

                            echo "</a>";
                        }

                        ?>
                    </ul>


                </div>

                <div class="game__down down">
                    <a href="index.php" class="down__continue">Продолжить покупки</a>
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