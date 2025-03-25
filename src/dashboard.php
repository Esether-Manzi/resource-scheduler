<?php
$tellerId =$_SESSION["userId"];

if(isset($_POST['callNextCustomer'])){
    $priority =$_SESSION["priority"];
    $currentCustomer =$_SESSION["currentCustomer"];

    if($currentCustomer == null || $currentCustomer == "" || empty($currentCustomer)){
        $getAnyPendingCustomer = "SELECT * from queue where teller = $tellerId and status < 3 limit 1" ;
        $pendingCustomers = mysqli_query($conn,$getAnyPendingCustomer);
        if(mysqli_num_rows($pendingCustomers)>0){
            $pendingCustomer = mysqli_fetch_assoc($pendingCustomers);
            $currentCustomer = $pendingCustomer['id'];
        }else{
            $currentCustomer = null;
        }
    }

// call the next customer function
    $next = nextCustomer($tellerId,$priority,$currentCustomer);
    
    if($next == null){
        $ans =  "No more customers available";
        $_SESSION["currentCustomer"] = null;
    }else{
        $showNext = json_encode($next);

        $ans  = "Currently Working on: $showNext <br><hr></hr>";
    }

}

 $getAverageWaitingTime = mysqli_query($conn, "SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(waiting_time))) AS averageWaitingTime FROM queue");
 $averageWaitingTime = mysqli_fetch_assoc($getAverageWaitingTime);
 $AVWT = strtotime($averageWaitingTime['averageWaitingTime']);
 
 $getAverageServiceTime = mysqli_query($conn, "SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(service_time))) AS averageServiceTime FROM queue");
 $averageServiceTime = mysqli_fetch_assoc($getAverageServiceTime);
 $AVST = strtotime($averageServiceTime['averageServiceTime']);

 $getAdminDetails= "select * from admin where id =$tellerId";
 $getAdmin = mysqli_query($conn , $getAdminDetails);
 $admin = mysqli_fetch_assoc($getAdmin);

 $customersInQueue= "select count(*) as total from queue where status =1";
 $queueCustomers = mysqli_query($conn , $customersInQueue);
 $customers = mysqli_fetch_assoc($queueCustomers);



?>
    <h1 class="page_heading">Dasboard</h1>

    <div class="my_row">
        <div class="dash_card color1">
            <h3>Average Waiting Time</h3>
            <p>
            <?php
                echo date('H',$AVWT) ." Hours "; 
                echo date('i',$AVWT) ." Minutes "; 
                echo date('s',$AVWT) ." Seconds "; 
            ?>
            </p>
        </div>
        
        <div class="dash_card color2">
            <h3>Average Service Time</h3>
            <p>
            <?php
                echo date('H',$AVST) ." Hours "; 
                echo date('i',$AVST) ." Minutes "; 
                echo date('s',$AVST) ." Seconds "; 
            ?>
            </p>
        </div>
        <div class="dash_card color3">
            <h3>My Customer Limit</h3>
            <p>
            <?php
                echo $admin['threshold']; 
            ?>
            </p>
        </div>
        <div class="dash_card color4">
            <h3>My Customers Served</h3>
            <p>
            <?php
                echo $admin['served'];
            ?>
            </p>
        </div>
        <div class="dash_card color5">
            <h3>Customers In Queue</h3>
            <p>
            <?php
                echo $customers['total'];
            ?>
            </p>
        </div>
        
    </div>

    <div class="my_row">
        <form action="" method="post">
            <input type="submit" class="next_customer_button" value="Call Next Customer" name="callNextCustomer">
        </form>
    </div>

    <div class="my_row">
        <?php
            $ans = $ans ?? "";
            echo "<p class=\"answer \">$ans</p>";
        ?>
    </div>
