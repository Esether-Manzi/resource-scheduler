<?php
    include 'db.php';

// form button actions

    if(isset($_POST['generateToken'])){
        $service = $_POST['service'];
        $priority = $_POST['priority'];

        switch ($service){
            
            case "Cash Deposit":
                $prefix = "CD";
                $surfix = generateNextToken($prefix);
                $queue_position = nextInQueue(); 
                $status = 1;
                $time_in = date('Y-m-d H:i:s');

                break;
        }

        $token = "insert into queue(service,priority,prefix,surfix,queue_position,status,time_in) values('$service','$priority','$prefix','$surfix','$queue_position','$status','$time_in')";
        $saveToken = mysqli_query($conn , $token);

        if($saveToken){
            echo "All good";
        }else{
            echo "Bad";
        }
        
    }


    if(isset($_POST['nextCustomer'])){
        $customersInQueue = "select MIN(queue_position) from queue where status = 1";
        $lastNumber = mysqli_query($conn , $customersInQueue);


    }




//functions

// Generate the next token number
    function generateNextToken($prefix){
        global $conn;

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


// Generate the next que number at record entry
    function nextInQueue(){
        global $conn;

        // $getLastQueuePosition = "select MAX(queue_position) from queue where status = 1";
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

    function nextCustomer($tellerId,$priority){
        global $conn;
        getOverDues();
        $status = 2;
        $time_called = date('Y-m-d H:i:s');

        $overDueCustomer = "select * from queue where status = 1 and flag = 1 order by id asc limit 1";
        $overDue = mysqli_query($conn , $overDueCustomer);

        $priorityCustomer = "select * from queue where status = 1 and service = $priority order by queue_position asc limit 1";
        $priorityCust = mysqli_query($conn , $priorityCustomer);

        $queueCustomer = "select * from queue where status = 1 order by queue_position asc limit 1";
        $queueCust = mysqli_query($conn , $queueCustomer);

        if(mysqli_num_rows($overDue)>0){
            foreach($overDue as $overD){}
            $nextCustomerId = $overD['id'];
        }elseif(mysqli_num_rows($priorityCust)>0){
            foreach($priorityCust as $priorityCu){}
            $nextCustomerId = $priorityCu['id'];
        }elseif(mysqli_num_rows($queueCust)>0){
            foreach($queueCust as $queueCu){}
            $nextCustomerId = $queueCu['id'];
        }

        if($nextCustomerId){
            $customerToActive = "update queue set teller=$tellerId, status=$status, time_called=$time_called where id =$nextCustomerId ";
            $customerActive = mysqli_query($conn , $customerToActive);
            
            if($customerActive){
                echo "all good";
            }
            
        }

    }



// identify overdue customers

    function getOverDues(){
        global $conn;
        //check for overdues over 30 minutes
        $overDueCustomers = "UPDATE queue SET flag=1 WHERE status=1 and time_in <= NOW() - INTERVAL 30 MINUTE";
        $updateOverDueCustomers = mysqli_query($conn,$overDueCustomers);

    }
