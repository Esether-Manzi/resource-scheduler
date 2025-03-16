<?php
    date_default_timezone_set('Africa/Kampala');
    $conn = mysqli_connect("localhost","root","","queuing_system");

    if(!$conn){mysqli_connect_error($conn);}