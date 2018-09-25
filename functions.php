<?php
function include_template($name, $data)
{
    $name = 'templates/' . $name;
    $result = '';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require($name);

    $result = ob_get_clean();

    return $result;
}

function lotExistence()
{
    $sub = strtotime('tomorrow') - time();
    $days = (int)($sub / (24 * 60 * 60));
    $hours = (int)(($sub - $days * 24 * 60 * 60) / (60 * 60));
    $min = (int)(($sub - $days * 24 * 60 * 60 - $hours * 60 * 60) / 60);
    $sec = $sub - $days * 24 * 60 * 60 - $hours * 60 * 60 - $min * 60;
}