<?php
    session_start(); // start sessions
    date_default_timezone_set('Africa/Kampala'); // emphasize timezone to local time
    $conn = mysqli_connect("mysql_db","root","root","queuing_system");
    // $conn = mysqli_connect("localhost","root","","queuing_system"); // database connection

    if(!$conn){mysqli_connect_error($conn);} // check for any connection errors


// Generate the next token number
    function generateNextToken($prefix){
        global $conn;

    //check last provided number and increament it to get new number
        $getLastNumber = "select * from queue where prefix = '$prefix' order by surfix desc limit 1";
        $lastNumber = mysqli_query($conn , $getLastNumber);
        if(mysqli_num_rows($lastNumber)>0){
            foreach($lastNumber as $lastNum){
            }
            $newNum = $lastNum['surfix'] + 1;
        }else{
            $newNum = 1;
        }
        
        return $newNum;
    }


// Generate the next que position at record entry
    function nextInQueue(){
        global $conn;

    //check last que number and increament it to get new que number
        $getLastQueuePosition = "select * from queue where status = 1 order by queue_position desc limit 1";
        $lastQueue = mysqli_query($conn , $getLastQueuePosition);
        if(mysqli_num_rows($lastQueue)>0){
            foreach($lastQueue as $lastQue){
            }
            $newQue = $lastQue['queue_position'] + 1;
        }else{
            $newQue = 1;
        }
        
        return $newQue;
    }


//Fetch next customer
    function nextCustomer($tellerId,$priority,$customerActive){
        global $conn;
        getOverDues();
        $time_called = date('Y-m-d H:i:s');

        if($customerActive != null || $customerActive != ""){
            $customerToComplete = "update queue set status=3, time_finished='$time_called' where id =$customerActive ";
            $customerComplete = mysqli_query($conn , $customerToComplete);
        }

        $overDueCustomer = "select * from queue where status = 1 and flag = 1 order by id asc limit 1";
        $overDue = mysqli_query($conn , $overDueCustomer);

        $priorityCustomer = "select * from queue where status = 1 and service = '$priority' order by queue_position asc limit 1";
        $priorityCust = mysqli_query($conn , $priorityCustomer);

        $queueCustomer = "select * from queue where status = 1 order by queue_position asc limit 1";
        $queueCust = mysqli_query($conn , $queueCustomer);

    //check if there are any overdue customers (aging customer)
        if(mysqli_num_rows($overDue)>0){
            foreach($overDue as $overD){}
            $nextCustomerId = $overD['id'];
            $nextCustomerToken = $overD['prefix']." ". str_pad($overD['surfix'], 3, 0, STR_PAD_LEFT) ;

    //check for priority customers
        }elseif(mysqli_num_rows($priorityCust)>0){
            foreach($priorityCust as $priorityCu){}
            $nextCustomerId = $priorityCu['id'];
            $nextCustomerToken = $priorityCu['prefix']." ". str_pad($priorityCu['surfix'], 3, 0, STR_PAD_LEFT);

    //check for any customer first come first serve
        }elseif(mysqli_num_rows($queueCust)>0){
            foreach($queueCust as $queueCu){}
            $nextCustomerId = $queueCu['id'];
            $nextCustomerToken = $queueCu['prefix']." ".str_pad($queueCu['surfix'], 3, 0, STR_PAD_LEFT);

        }else{
            $nextCustomerId = null;
        }

    //change customer status from waiting to Active/Being served status (2)
        if($nextCustomerId !=null){
            $customerToActive = "update queue set teller=$tellerId , status= '2' , time_called='$time_called' where id =$nextCustomerId ";
            $activeCustomer = mysqli_query($conn , $customerToActive);

            if($activeCustomer){
                $_SESSION["currentCustomer"]= $nextCustomerId;
                return $nextCustomerToken;
            }
            
        }else{
            return;
        }

    }


// identify and flag overdue customers

    function getOverDues(){
        global $conn;
    //check and flag customers who have stayed over 30 minutes
        $overDueCustomers = "UPDATE queue SET flag=1 WHERE status=1 and time_in <= NOW() - INTERVAL 30 MINUTE";
        $updateOverDueCustomers = mysqli_query($conn,$overDueCustomers);

    }
