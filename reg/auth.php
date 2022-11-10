<?php
include '../includes/connect.php';
?>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/normalize.css">
    <title>Авторизация</title>
</head>

<body>
    <main class="main">
        <header class="header">
            <div class="container header__container">
                <div class="header__global">
                    <div class="header__logo logo">
                        <a href="index.php" class="logo__link">
                            <img src="../img/logo.png" alt="" class="logo__image">
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
        <section class="section__reg reg">
            <div class="container reg__container">
                <div class="login__wrapper">
                    <h2 class="login__header">Авторизация</h2>
                    <p class="login__account">
                        Нет аккаунта? <a href="reg.php" class="login__link">Зарегистрируйтесь</a>
                    </p>
                    <form action="" class="login__form form" method="POST">
                        <label for="login">Логин</label>
                        <input class="login__input" type="text" name="login" id="login" required>
                        <label for="password">Пароль</label>
                        <input class="login__input" type="password" name="password" id="password" required>
                        <input type="submit" name="submitlog" class="reg__submit btn">
                    </form>

                    <?php

                    if (isset($_POST['submitlog'])) {
                        $login = $_POST["login"];
                        $auth = "SELECT * FROM `user` WHERE login='$login'";
                        $authResult = mysqli_query($connect, $auth);
                        $authAssoc = mysqli_fetch_assoc($authResult);
                        if (!empty($authAssoc)) {
                            $hash = $authAssoc['password'];
                            if (password_verify($_POST['password'], $hash)) {
                                $userid = $authAssoc['id'];
                                $userlogin = $authAssoc['login'];
                                $_SESSION["login"] = $userlogin;
                                $_SESSION["id"] = $userid;
                                echo "<p>Вход успешно выполнен, перенаправляем на главную...</p>";
                    ?>
                                <script>
                                    setTimeout(() => {
                                        document.location.replace("http://games-store/index.php");
                                    }, 2000);
                                </script>
                    <?php
                            } else {
                                echo "<p>Пароль неверный</p>";
                            }
                        } else {
                            echo "<p>Пользователя с таким логином не существует</p>";
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