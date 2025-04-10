<?php
$f = fopen( 'php://stdin', 'r' );

function whatTriangle($three_seg) {
    sort($three_seg);
    if ($three_seg[0]+$three_seg[1] <= $three_seg[2]) {
        return false;
    } elseif (pow($three_seg[0], 2)+pow($three_seg[1], 2) === pow($three_seg[2], 2)) {
        return 'RT';
    } elseif (pow($three_seg[0], 2)+pow($three_seg[1], 2) > pow($three_seg[2], 2)) {
        return 'AT';
    } elseif (pow($three_seg[0], 2)+pow($three_seg[1], 2) < pow($three_seg[2], 2)) {
        return 'OT';
    }
}

$result_array = [0, 0, 0, 0];
while( $line = fgets( $f ) ) {
    $three_seg = array_map('intval', explode(' ', $line));
    $test = whatTriangle($three_seg);
    switch ($test) {
        case 'RT':
            $result_array[0]++;
            $result_array[1]++;
            break;
        case 'AT':
            $result_array[0]++;
            $result_array[2]++;
            break;
        case 'OT':
            $result_array[0]++;
            $result_array[3]++;
            break;
        case false:
            break 2;
    }
}
$result = implode(' ', $result_array);
echo $result;

fclose( $f );
?>

