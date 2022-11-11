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
    <title>Регистрация</title>
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
                    <h2 class="reg__header">Регистрация</h2>
                    <p class="reg__account">
                        Есть аккаунт? <a href="auth.php" class="reg__link">Войдите</a>
                    </p>
                    <form action="" class="reg__form form" method="POST">
                        <label for="email">Адрес эл. почты</label>
                        <input class="reg__input" type="text" name="email" id="email" required>
                        <label for="login">Логин</label>
                        <input class="reg__input" type="text" name="login" id="login" required>
                        <label for="login">Пароль</label>
                        <input class="reg__input" type="password" name="password" id="password" required>
                        <input type="submit" name="submitreg" class="reg__submit btn">
                    </form>

                    <?php

                    if (isset($_POST['submitreg'])) {
                        $email = $_POST['email'];
                        $login = $_POST['login'];
                        $password = $_POST['password'];
                        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                        $userInsertion = "INSERT INTO `user` (`login`, `password`, `e-mail`) VALUES ('$login', '$password', '$email')";
                        if ($connect->query($userInsertion)) {
                            echo "<p class='reg__paragraph'>" . "Регистрация прошла успешно, Перенаправляем..." . "</p>";
                    ?>
                            <script>
                                setTimeout(() => {
                                    document.location.replace("http://games-store/index.php");
                                }, 2000);
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