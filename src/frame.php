<?php
include "functions.php";
if(!isset($_SESSION["userId"])){ header("Location:login.php"); exit(); }

$page = $_GET['page'] ?? null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Queuing Stystem</title>
</head>
<body>
    <div class="main">
        <div class="main_left">
            <ul>
                <a href="frame.php?page=dashboard.php"><li>Dashboard</li></a>
                <a href="logout.php"><li>Logout</li></a>
            </ul>
        </div>

        <div class="main_right">
            <?php 
                $page = $page ?? "";
                include "$page";
            ?>
        </div>
    </div>
</body>
</html>