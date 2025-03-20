<?php
    include "functions.php";

    if(isset($_POST['callNextCustomer'])){
        $tellerId =$_SESSION["userId"];
        $priority =$_SESSION["priority"];
        $currentCustomer =$_SESSION["currentCustomer"];

// call the next customer function
        $next = nextCustomer($tellerId,$priority,$currentCustomer);
        
        if($next == null){
            echo "No more customers available";
            $_SESSION["currentCustomer"] = null;
        }else{
            $showNext = json_encode($next);

            echo "Currently Working on: $showNext <br><hr></hr>";
        }

    }

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="callNextCustomer">
        <form action="" method="post">
            <input type="submit" value="Call Next Customer" name="callNextCustomer">
        </form>
    </div>
</body>
</html>