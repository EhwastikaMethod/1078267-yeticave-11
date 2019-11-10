<?php
$is_auth = rand(0, 1);
$user_name = 'Maria';
$categories = ["Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"];
$items = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '10999',
        'image' => 'img/lot-1.jpg',
        'finalDate' => date('Y-m-d', strtotime('-1 day')),
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '159999',
        'image' => 'img/lot-2.jpg',
        'finalDate' => date('Y-m-d', strtotime('+3 day')),
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => 'Крепления',
        'price' => '8000',
        'image' => 'img/lot-3.jpg',
        'finalDate' => date('Y-m-d', strtotime('+1 day')),
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => 'Ботинки',
        'price' => '10999',
        'image' => 'img/lot-4.jpg',
        'finalDate' => date('Y-m-d', strtotime('+4 day')),
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => 'Одежда',
        'price' => '7500',
        'image' => 'img/lot-5.jpg',
        'finalDate' => date('Y-m-d', strtotime('+2 day')),
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'category' => 'Разное',
        'price' => '5400',
        'image' => 'img/lot-6.jpg',
        'finalDate' => date('Y-m-d', strtotime('+1 day')),
    ],
];
