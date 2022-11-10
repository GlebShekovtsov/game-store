<?php

include_once 'includes/connect.php';
$user = $_SESSION['id'];
if (isset($_GET['gameid'])) {
    $gameid = $_GET['gameid'];
    $gameInsert = "INSERT INTO `wishlist` (`id_user`, `id_game`) VALUES ('$user', '$gameid')";

    if ($connect->query($gameInsert)) {
?>
        <script>
            document.location.replace("http://games-store/wishlist.php");
        </script>
<?php
    } else {
        echo "<p>" . "Ошибка:" . $conn->error . "</p>";
    }
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
                            <li class="nav__item"><a href="library.php" class="nav__link">Библиотека</a></li>
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
                        <span class="shortcut__span">Ваш список желаемого</span>
                    </div>
                    <h2 class="cart__label">ВАШ СПИСОК ЖЕЛАЕМОГО</h2>
                </div>
                <div class="cart__game-wrapper game">
                    <?php

                    $cartSelect = "SELECT * FROM `wishlist`
                    INNER JOIN product on wishlist.id_game = product.id
                    WHERE wishlist.id_user = $user";
                    $cartSelectResult = mysqli_query($connect, $cartSelect);

                    ?>
                    <ul class="game__list">
                        <?php
                        foreach ($cartSelectResult as $cartRow) {

                            echo "<a href='product.php?gameid=" . $cartRow['id_game'] . "'>";
                            echo "<li class='game__item'>";
                            echo "<div class='game__cart-wrapper'>";
                            echo "<img class='game__pic' src='img/" . $cartRow['capsule_image'] . "' alt=''>";
                            echo "<span class='game__name'>" . $cartRow['game_name'] . "</span>";
                            echo "</div>";

                            echo "<div class='game__cart-price cart-price'>";
                            echo "<span class='cart-price__span'>" . $cartRow['price'] . " руб." . "</span>";
                            echo "<a href='cart.php?delete=" . $cartRow['id_wish'] . "' class='price__delete'>Удалить</a>";
                            echo "</div>";

                            echo "</li>";
                            echo "</a>";
                        }

                        if (isset($_GET['delete'])) {
                            $gamedeleteId = $_GET['delete'];
                            $deleteGame = "DELETE FROM `wishlist` WHERE id_bucket = '$gamedeleteId'";

                            if ($connect->query($deleteGame)) {
                        ?>
                                <script>
                                    document.location.replace("http://games-store/cart.php");
                                </script>
                        <?php
                            } else {
                                echo "<p>" . "Ошибка:" . $conn->error . "</p>";
                            }
                        }
                        ?>
                    </ul>


                </div>

                <div class="game__down down">
                    <a href="index.php" class="down__continue">Продолжить покупки</a>
                    <a href="wishlist.php?deleteall=1" class="down__continue">Удалить все товары</a>
                    <?php
                    if (isset($_GET['deleteall'])) {
                        $deleteAllGames = "DELETE FROM `wishlist` WHERE id_user = '$user'";
                        if ($connect->query($deleteAllGames)) {
                    ?>
                            <script>
                                document.location.replace("http://games-store/wishlist.php");
                            </script>
                    <?php
                        } else {
                            echo "<p>" . "Ошибка:" . $conn->error . "</p>";
                        }
                    }
                    ?>
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