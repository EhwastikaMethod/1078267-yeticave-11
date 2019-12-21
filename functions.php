<?php
function include_template($name, $data) {
    $name = 'templates/' . $name;
    $result = '';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

function formatted_price(int $cost) {
    $cost = ceil($cost);

    return number_format($cost, 0, "", " ") . " " . "₽";
}

function time_left(string $final_date): array {

    $dt_cur = time();
    $dt_end = strtotime($final_date);
    $sec_in_min = 60;
    $dt_diff = $dt_end - $dt_cur;
    $dt_diff_in_min = floor($dt_diff / $sec_in_min);
    $min_in_hour = 60;
    $hours = floor($dt_diff_in_min / $min_in_hour);
    $minutes = $dt_diff_in_min % $min_in_hour;

    $time_left = [$hours, $minutes];

    return $time_left;
}
