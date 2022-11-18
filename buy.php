<?php

include_once 'includes/connect.php';
$user = $_SESSION['id'];
if (isset($_GET['idbuygame'])) {
    $idbuygame = $_GET['idbuygame'];
} else {
    echo "<p>" . "Ошибка:" . $conn->error . "</p>";
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
    <title>Корзина</title>
</head>

<body>
    <main class="main">
        <header class="header">
            <div class="container header__container">
                <div class="header__login login">
                    <?php
                    if (isset($_SESSION["id"])) {
                        echo "<a href='profile.php?userid=" . $_SESSION['id'] . "' class='login__link'>" . $_SESSION["login"] . "</a>";
                    } else {
                        echo "<a href='reg/auth.php' class='login__link'>Войти</a>";
                    }
                    ?>

                </div>
                <div class="header__global">
                    <div class="header__logo logo">
                        <a href="index.php" class="logo__link">
                            <img src="img/logo.png" alt="" class="logo__image">
                        </a>
                    </div>
                    <nav class="header__nav nav">
                        <ul class="nav__list">
                            <li class="nav__item"><a href="index.php" class="nav__link">Магазин</a></li>
                            <?php
                            if (isset($_SESSION["id"])) {
                                echo "<li class='nav__item'><a href='library.php' class='nav__link'>Библиотека</a></li>";
                            } else {
                            }
                            ?>
                            <li class="nav__item"><a href="#" class="nav__link">Поддержка</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <section class="main__section hero">
            <div class="container hero__container">
                <div class="shop-block__upper upper">
                    <div class="upper__wishlist-block">
                        <a href="wishlist.php" class="wishlist__link">Список желаемого</a>
                    </div>
                    <div class="upper__cart-block">
                        <a href="cart.php" class="cart__link">Корзина</a>
                    </div>
                </div>
                <div class="hero__wrapper shop-block">
                    <nav class="shop-block__nav shop-menu">
                        <ul class="shop-menu__list">
                            <li class="shop-menu__item"><a href="#" class="shop-menu__link">Новинки</a></li>
                            <li class="shop-menu__item"><a href="#" class="shop-menu__link">Категории</a></li>
                            <li class="shop-menu__item"><a href="#" class="shop-menu__link">Новости</a></li>
                        </ul>
                    </nav>
                    <form action="" class="shop-block__form search">
                        <input type="text" class="search__input">
                    </form>
                </div>
            </div>
        </section>

        <section class="main__section cart">
            <div class="container cart__container">
                <div class="cart__wrapper">
                    <div class="cart__shortcut shortcut">
                        <a href="index.php">Все продукты > </a>
                        <span class="shortcut__span">Покупка</span>
                    </div>
                    <h2 class="cart__label">Товар</h2>
                </div>
                <div class="cart__game-wrapper game">
                    <?php

                    $cartSelect = "SELECT * FROM `product`
                    WHERE id = $idbuygame";
                    $cartSelectResult = mysqli_query($connect, $cartSelect);

                    ?>
                    <ul class="game__list">
                        <?php
                        foreach ($cartSelectResult as $cartRow) {
                            echo "<li class='game__item'>";
                            echo "<div class='game__buy-wrapper'>";
                            echo "<img class='game__pic' src='img/" . $cartRow['poster'] . "' alt=''>";
                            echo "</div>";

                            echo "<div class='game__buy-info'>";
                            echo "<h3 class='game__buy-label'> Информация о покупке </h3>";
                            echo "<span class='game__buy-label'>Название</span>";
                            echo "<p class='game__buy-game-name'>" . $cartRow['game_name'] . "</p>";
                            echo "<span class='game__buy-label'>Описание</span>";
                            echo "<p class='game__buy-descr'>" . $cartRow['short_descr'] . "</p>";
                            echo "<span class='game__buy-label'>Цена</span>";
                            echo "<span class='cart-price__span'>" . $cartRow['price'] . " руб." . "</span>";
                            echo "</div>";

                            echo "</li>";
                            echo "<div class='game__buy buy'>";
                            echo "<a href='buy.php?buyed=1&idbuygame=" . $idbuygame . "' class='buy__link'>" . "Завершить покупку" . "</a>";
                            "</div>";
                        }

                        if (isset($_GET['buyed'])) {

                            $libraryInsert = "INSERT INTO `library` (`id_user`, `id_game`) VALUES ($user, $idbuygame)";
                            $deleteGame = "DELETE FROM `bucket` WHERE id_user = '$user' AND id_game = '$idbuygame'";

                            if ($connect->query($libraryInsert)) {
                        ?>
                                <script>
                                    setTimeout(() => {
                                        document.location.replace("http://games-store/index.php");
                                    }, 2000);
                                </script>
                            <?php
                            }
                            if ($connect->query($deleteGame)) {
                                echo "<p class='reg__paragraph'>" . "Покупка проведена успешно, Перенаправляем..." . "</p>";
                            ?>
                                <script>
                                    setTimeout(() => {
                                        document.location.replace("http://games-store/index.php");
                                    }, 2000);
                                </script>
                        <?php
                            } else {
                                echo "<p>" . "Ошибка:" . $connect->error . "</p>";
                            }
                        }
                        ?>
                    </ul>


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