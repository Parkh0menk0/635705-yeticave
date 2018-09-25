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
    $timeLeft = date('H:i', $sub);
    return $timeLeft;
}