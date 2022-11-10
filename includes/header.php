<header class="header">
    <div class="container header__container">


        <div class="header__login login">
            <?php
            if (isset($_SESSION["id"])) {
                echo "<a href='profile.php?userid=" . $_SESSION['id'] . "' class='login__link'>" . $_SESSION["login"] . "</a>";
                echo "<a href='reg/exit.php' class='login__link'>Выйти</a>";
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
                <?php
                if (isset($_SESSION["id"])) {
                    echo "<a href='wishlist.php' class='wishlist__link'>" . "Список желаемого" . "</a>";
                } else {
                    echo "<a href='reg/auth.php' class='wishlist__link'>" . "Войдите чтобы просмотреть Список желаемого" . "</a>";
                }
                ?>

            </div>
            <div class="upper__cart-block">
                <?php
                if (isset($_SESSION["id"])) {
                    echo "<a href='cart.php' class='cart__link'>" . "Корзина" . "</a>";
                } else {
                    echo "<a href='reg/auth.php' class='cart__link'>" . "Войдите чтобы просмотреть Корзину" . "</a>";
                }
                ?>
            </div>
        </div>
        <div class="hero__wrapper shop-block">
            <form action="filtered.php" class="shop-block__form search" method="GET">
                <input type="text" class="search__input" name="search_string" placeholder="поиск">
            </form>
        </div>
    </div>
</section>