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

function formatted_price (float $cost) {
    $cost = ceil ($cost);
    
    return number_format($cost, 0, "", " ") . " " . "₽";
}
?>