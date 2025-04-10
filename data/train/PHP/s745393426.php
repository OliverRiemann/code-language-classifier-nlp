<?php
$dice_default = array (
    "Top" => 1
    , "North" => 5
    , "East" => 3
    , "South" => 2
    , "West" => 4
    , "Bottom" => 6
);
$dice = array();
$last_dice = array();
while (true) {
    $stdin = trim(fgets(STDIN));
    if ($stdin == 0) {
        break;
    }
    $dice = $dice_default;
    $result = $dice["Top"];
    for ($i = 0;$i < $stdin;$i++) {
        $command = trim(fgets(STDIN));
        $last_dice = $dice;
        switch ($command) {
            case "North":
                $dice["Top"] = $last_dice["South"];
                $dice["South"] = $last_dice["Bottom"];
                $dice["Bottom"] = $last_dice["North"];
                $dice["North"] = $last_dice["Top"];
            break;
            case "East":
                $dice["Top"] = $last_dice["West"];
                $dice["West"] = $last_dice["Bottom"];
                $dice["Bottom"] = $last_dice["East"];
                $dice["East"] = $last_dice["Top"];
            break;
            case "South":
                $dice["Top"] = $last_dice["North"];
                $dice["North"] = $last_dice["Bottom"];
                $dice["Bottom"] = $last_dice["South"];
                $dice["South"] = $last_dice["Top"];
            break;
            case "West":
                $dice["Top"] = $last_dice["East"];
                $dice["East"] = $last_dice["Bottom"];
                $dice["Bottom"] = $last_dice["West"];
                $dice["West"] = $last_dice["Top"];
            break;
            case "Right":
                $dice["North"] = $last_dice["West"];
                $dice["West"] = $last_dice["South"];
                $dice["South"] = $last_dice["East"];
                $dice["East"] = $last_dice["North"];
            break;
            case "Left":
                $dice["North"] = $last_dice["East"];
                $dice["East"] = $last_dice["South"];
                $dice["South"] = $last_dice["West"];
                $dice["West"] = $last_dice["North"];
            break;
            default:
            break;
        }
        $result += $dice["Top"];
    }
    echo $result."\n";
}
?>
