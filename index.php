<?php
require_once 'init.php';

if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
    print(include_template('layout.php', ['content' => $content, 'categories' => []]));
    die;
}

$sql = 'SELECT id, name FROM categories';
$result = mysqli_query($link, $sql);

if ($result) {
    $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
}
else {
    $error = mysqli_error($link);
    $content = include_template('error.php', ['error' => $error]);
}


$sql = 'SELECT l.name as name, c.name as category_name, initial_price, image, final_date from lots as l JOIN categories as c ON c.id = category_id ORDER BY final_date DESC';

if ($res = mysqli_query($link, $sql)) {
    $lots = mysqli_fetch_all($res, MYSQLI_ASSOC);
    
    $content = include_template('main.php', ['lots' => $lots, 'categories' => $categories]);
}
else {
    $content = include_template('error.php', ['error' => mysqli_error($link)]);
}

print(include_template('layout.php', ['content' => $content, 'categories' => $categories]));
