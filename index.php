<?php
require_once('functions.php');
require_once('data.php');

$page_content =  include_template('main.php', ['items' => $items, 'categories' => $categories]);

$layout_content = include_template('layout.php', 
    [
        'content' => $page_content,
        'title' => 'Yeticave - Главная',
        'user_name' => $user_name,
        'categories' => $categories,
    ]
);

print($layout_content);
