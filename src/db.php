<?php
    date_default_timezone_set('Africa/Kampala');
    $conn = mysqli_connect("mysql_db","root","root","queuing_system", port:"3306");

    if(!$conn){mysqli_connect_error($conn);}