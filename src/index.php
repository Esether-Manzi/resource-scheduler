<?php
    include "functions.php";

    if(isset($_POST['generateToken'])){
        list($service, $period) = explode("," , $_POST['service']);
        
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
        $priority = $_POST['priority'];
        $surfix = generateNextToken($prefix); //call function to generate next token number for new customer
        $queue_position = nextInQueue();    //call function to generate next queue position for new customer
        $status = 1;
        $time_in = date('Y-m-d H:i:s');

        $token = "insert into queue(service,period,priority,prefix,surfix,queue_position,status,time_in) 
                values('$service','$period','$priority','$prefix','$surfix','$queue_position','$status','$time_in')";
        $saveToken = mysqli_query($conn , $token);

        if($saveToken){
            $newSurfix = str_pad($surfix,3,0,STR_PAD_LEFT);
            echo "Token generated is: $prefix  $newSurfix <br><hr></hr>";
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
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <h1 class="token_heading">Welcome To BANK</h1>
    <form class="token_form" action="" method="post">
        <label class="label_name" for="">Choose a service</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Cash Deposit,7" required><label class="label_option" for="">Cash Deposit</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Cash Withdraw,5" required><label class="label_option" for="">Cash Withdraw</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Check Deposit,10" required><label class="label_option" for="">Check Deposit</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Electronic Funds Transfer,15" required><label class="label_option" for="">Electronic Funds Transfer</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Western Union,15" required><label class="label_option" for="">Western Union</label><br>
        <input class="radios_inputs" type="radio" name="service" value="Forex,5" required><label class="label_option" for="">Forex</label><br>

        <label class="label_name" for="">Customer Catgory</label><br>
        <input class="radios_inputs" type="radio" name="priority" value="1" required><label class="label_option" for="">VIP</label><br>
        <input class="radios_inputs" type="radio" name="priority" value="2" required><label class="label_option" for="">Coporate</label><br>
        <input class="radios_inputs" type="radio" name="priority" value="3" required><label class="label_option" for="">Normal</label><br>

        <input type="submit" class="generate_token_button" value="Generate Token" name="generateToken">
    </form>
</body>
</html>