<?php
    include "functions.php";

    if(isset($_POST['login'])){
        $username = $_POST['username'];
        $password = $_POST['password'];

        $getAdmin= "select * from admin where username = '$username' and password='$password' limit 1";
        $checkAdmin = mysqli_query($conn , $getAdmin);

        if(mysqli_num_rows($checkAdmin)>0){
            foreach($checkAdmin as $admin){}

            $_SESSION["userId"] = $admin['id'];
            $_SESSION["priority"] = $admin['priority'];
            $_SESSION["currentCustomer"] = null;

            header("Location:frame.php?page=dashboard.php");
        }else{
            echo "Wrong Username or Password!!!!";
        }

    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <h1 class="login_heading">TELLER LOGIN</h1>
    <form action="" class="login_form" method="post">
        <input type="text" class="form_input" name="username" placeholder="Username" required>
        <input type="password" class="form_input" name="password" placeholder="Password" required>
        <input type="submit" class="form_button" name="login" value="Login">
    </form>
</body>
</html>
