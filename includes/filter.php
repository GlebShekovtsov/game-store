<?php
echo "<div class='form__genres'>";
echo "<label class='form__label' for=''>Жанры</label>";
foreach ($genreSelectResult as $genreRow) {
    echo "<div class='aside__checkbox checkbox'>";
    echo "<label for='" . $genreRow['name'] . "' class='checkbox__label'>" . $genreRow['name'] . "</label>";
    echo "<input type='checkbox' name='genres[]' id='" . $genreRow['name'] . "' value='" . $genreRow['name'] . "'>";
    echo "</div>";
}
echo "</div>";
echo "<div class='form__subgenres'>";
echo "<label class='form__label' for=''>Поджанры</label>";
foreach ($subgenreSelectResult as $subgenreRow) {
    echo "<div class='aside__checkbox checkbox'>";
    echo "<label for='" . $subgenreRow['name'] . "' class='checkbox__label'>" . $subgenreRow['name'] . "</label>";
    echo "<input type='checkbox' name='subgenres[]' id='" . $subgenreRow['name'] . "' value='" . $subgenreRow['name'] . "'>";
    echo "</div>";
}
echo "</div>";
