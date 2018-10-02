<?php
$is_auth = rand(0, 1);
$title = 'Главная';
$user_name = 'Олег'; // укажите здесь ваше имя
$user_avatar = 'img/user.jpg';
$categories = array(
        'boards' => 'Доски и лыжи',
        'attachment' => 'Крепления',
        'boots' => 'Ботинки',
        'clothing' => 'Одежда',
        'tools' => 'Инструменты',
        'other' => 'Разное'
         );
$ad_items = array(
        array('title' => '2014 Rossignol District Snowboard', 'category' => 'Доски и лыжи', 'cost' => '10999', 'url_item' => 'img/lot-1.jpg'),
        array('title' => 'DC Ply Mens 2016/2017 Snowboard', 'category' => 'Доски и лыжи', 'cost' => '159999', 'url_item' => 'img/lot-2.jpg'),
        array('title' => 'Крепления Union Contact Pro 2015 года размер L/XL', 'category' => 'Крепления', 'cost' => '8000', 'url_item' => 'img/lot-3.jpg'),
        array('title' => 'Ботинки для сноуборда DC Mutiny Charocal', 'category' => 'Ботинки', 'cost' => '10999', 'url_item' => 'img/lot-4.jpg'),
        array('title' => 'Куртка для сноуборда DC Mutiny Charocal', 'category' => 'Одежда', 'cost' => '7500', 'url_item' => 'img/lot-5.jpg'),
        array('title' => 'Маска Oakley Canopy', 'category' => 'Разное', 'cost' => '5400', 'url_item' => 'img/lot-6.jpg')
);

function costing($price) {
    $tmp = ceil($price);
    return $tmp > 1000 ? number_format($tmp, 0, '', ' ') . ' ₽' : $tmp;
}

require_once('functions.php');

$content = include_template('index.php', [
    'categories' => $categories,
    'ad_items' => $ad_items
]);

$layout_page = include_template('layout.php', [
    'content' => $content,
    'categories' => $categories,
    'title' => $title,
    'user_name' => $user_name,
    'is_auth' => $is_auth,
    'user_avatar' => $user_avatar
]);

$con = mysqli_connect("localhost", "root", "", "yeticave");
mysqli_set_charset($con, "utf8");

print($layout_page);
