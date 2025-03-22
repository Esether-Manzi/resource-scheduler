<?php
    include "functions.php";

    if(isset($_POST['generateToken'])){
        $service = $_POST['service'];
        $priority = $_POST['priority'];

    // check the type of service requested and provide a code accordingly
        switch ($service){
            case "Cash Deposit":
                $prefix = "CD";
                break;

            case "Cash Withdraw":
                $prefix = "CW";
                break;

            case "Check Deposit":
                $prefix = "CKD";
                break;
            case "Electronic Funds Transfer":
                $prefix = "EFT";
                break;
            case "Western Union":
                $prefix = "WU";
                break;
            case "Forex":
                $prefix = "FX";
                break;
            default:
                echo "Wrong Value provided";
                break;

        }
        
        $surfix = generateNextToken($prefix); //call function to generate next token number for new customer
        $queue_position = nextInQueue();    //call function to generate next queue position for new customer
        $status = 1;
        $time_in = date('Y-m-d H:i:s');

        $token = "insert into queue(service,priority,prefix,surfix,queue_position,status,time_in) 
                values('$service','$priority','$prefix','$surfix','$queue_position','$status','$time_in')";
        $saveToken = mysqli_query($conn , $token);

        if($saveToken){
            $newSurfix = str_pad($surfix,3,0,STR_PAD_LEFT);
            echo "Token generated is: $prefix  $newSurfix <br>";
        }else{
            echo "Token Failed to Generate";
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
    <div class="generateToken">
        <form action="" method="post">
            <h4>Choose a service</h4>
            <!-- <label for="">Choose a service</label><br> -->
            <input type="radio" name="service" value="Cash Deposit" required><label for="">Cash Deposit</label><br>
            <input type="radio" name="service" value="Cash Withdraw" required><label for="">Cash Withdraw</label><br>
            <input type="radio" name="service" value="Check Deposit" required><label for="">Check Deposit</label><br>
            <input type="radio" name="service" value="Electronic Funds Transfer" required><label for="">Electronic Funds Transfer</label><br>
            <input type="radio" name="service" value="Western Union" required><label for="">Western Union</label><br>
            <input type="radio" name="service" value="Forex" required><label for="">Forex</label><br>

            <h4>Customer Category</h4>
            <!-- <label for="">Customer Catgory</label><br> -->
            <input type="radio" name="priority" value="1" required><label for="">VIP</label><br>
            <input type="radio" name="priority" value="2" required><label for="">Coporate</label><br>
            <input type="radio" name="priority" value="3" required><label for="">Normal</label><br>

            <input type="submit" value="Generate Token" name="generateToken">
        </form>
    </div>
</body>
</html>