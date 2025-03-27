<?php
session_start(); // start sessions
date_default_timezone_set('Africa/Kampala'); // emphasize timezone to local time
$conn = mysqli_connect("mysql_db","essie","essie","queuing_system");
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
        $time_called = date('Y-m-d H:i:s');

        if($customerActive != null || $customerActive != ""){
            $customerToComplete = "UPDATE queue set status=3, time_finished='$time_called' where id =$customerActive ";
            $customerComplete = mysqli_query($conn , $customerToComplete);

            if($customerComplete){
                $computeTImes = "UPDATE queue set waiting_time = TIMEDIFF(time_called, time_in), service_time = TIMEDIFF(time_finished, time_called) where id =$customerActive";
                mysqli_query($conn , $computeTImes);
            }
        }

        $status = threshold($tellerId);
        getOverDues();

        if((int)$status == 1){
    
            $overDueCustomer = "select * from queue where status = 1 and flag = 1 order by id asc limit 1";
            $overDue = mysqli_query($conn , $overDueCustomer);
    
            $VIPCustomer = "select * from queue where status = 1 and priority = 1 order by queue_position asc limit 1";
            $VIPCust = mysqli_query($conn , $VIPCustomer);
    
            $coporateCustomers = "select * from queue where status = 1 and priority = 2 order by queue_position asc limit 1";
            $coporateCust = mysqli_query($conn , $coporateCustomers);
    
            $priorityCustomer = "select * from queue where status = 1 and service = '$priority' order by queue_position asc limit 1";
            $priorityCust = mysqli_query($conn , $priorityCustomer);
    
            $queueCustomer = "select * from queue where status = 1 order by period asc, queue_position asc limit 1";
            $queueCust = mysqli_query($conn , $queueCustomer);
    
        //check if there are any overdue customers (aging customer)
            if(mysqli_num_rows($overDue)>0){
                foreach($overDue as $overD){}
                $nextCustomerId = $overD['id'];
                $nextCustomerToken = $overD['prefix']." ". str_pad($overD['surfix'], 3, 0, STR_PAD_LEFT) ;
    
        //check for VIP customers
            }elseif(mysqli_num_rows($VIPCust)>0){
                foreach($VIPCust as $VIP){}
                $nextCustomerId = $VIP['id'];
                $nextCustomerToken = $VIP['prefix']." ". str_pad($VIP['surfix'], 3, 0, STR_PAD_LEFT);
    
        //check for Coporate customers
            }elseif(mysqli_num_rows($coporateCust)>0){
                foreach($coporateCust as $coporate){}
                $nextCustomerId = $coporate['id'];
                $nextCustomerToken = $coporate['prefix']." ". str_pad($coporate['surfix'], 3, 0, STR_PAD_LEFT);
    
        //check for priority customers
            }elseif(mysqli_num_rows($priorityCust)>0){
                foreach($priorityCust as $priorityCu){}
                $nextCustomerId = $priorityCu['id'];
                $nextCustomerToken = $priorityCu['prefix']." ". str_pad($priorityCu['surfix'], 3, 0, STR_PAD_LEFT);
    
        //check for any customer basing on shortest job first and then first come first serve in that order
            }elseif(mysqli_num_rows($queueCust)>0){
                foreach($queueCust as $queueCu){}
                $nextCustomerId = $queueCu['id'];
                $nextCustomerToken = $queueCu['prefix']." ".str_pad($queueCu['surfix'], 3, 0, STR_PAD_LEFT);
    
            }else{
                $nextCustomerId = null;
            }
    
        //change customer status from waiting to Active/Being served status (2)
            if($nextCustomerId !=null){
                $customerToActive = "update queue set teller=$tellerId , status=2 , time_called='$time_called' where id =$nextCustomerId ";
                $activeCustomer = mysqli_query($conn , $customerToActive);
    
                if($activeCustomer){
                    $_SESSION["currentCustomer"]= $nextCustomerId;
                    return $nextCustomerToken;
                }
                
            }else{
                return;
            }

        }else{
            // echo "it is 2"; return;
            echo "You have reached your customer service limit for now. Please wait.....";
        }

        

    }


// identify and flag overdue customers

    function getOverDues(){
        global $conn;
    //check and flag customers who have stayed over 30 minutes
        $overDueCustomers = "UPDATE queue SET flag=1 WHERE status=1 and time_in <= NOW() - INTERVAL 30 MINUTE";
        $updateOverDueCustomers = mysqli_query($conn,$overDueCustomers);

    }



// check admin threshold

    function threshold($teller){
        global $conn;
        $totalNumberOfCustomers =  "select count(*) as total from queue";
        $totalCustomers = mysqli_query($conn , $totalNumberOfCustomers);
        $theCustomers = mysqli_fetch_assoc($totalCustomers);

        $myNumberOfCustomers =  "select count(*) as total from queue where teller = $teller";
        $myCustomers = mysqli_query($conn , $myNumberOfCustomers);
        $customersToMe = mysqli_fetch_assoc($myCustomers);
        $myTotalCustomers = $customersToMe['total'];

        $getAllTellers =  "select count(*) as total from admin";
        $allTellers = mysqli_query($conn , $getAllTellers);
        $theTellers = mysqli_fetch_assoc($allTellers);

        $getActiveTellers =  "select count(*) as total from admin where status=1";
        $activeTellers = mysqli_query($conn , $getActiveTellers);

        $thresholdValue = $theCustomers['total'] / $theTellers['total'];
        $remainder = $theCustomers['total'] % $theTellers['total'];

        if($thresholdValue <= 0){
            $threshold = 2;
        }else{
            if($remainder > 0){
                $threshold = $thresholdValue+1;
            }else{
                $threshold = $thresholdValue;
            }
            
        }
        $updateThresholdQuery = "update admin set threshold = $threshold";
        $updateThreshold = mysqli_query($conn,$updateThresholdQuery);
        if(!$updateThreshold){echo mysqli_error($conn);}

        $updateMyCustomerCount = "update admin set served = $myTotalCustomers where id = $teller";
        $updateCustomerCount = mysqli_query($conn,$updateMyCustomerCount);
        if(!$updateCustomerCount){echo mysqli_error($conn);}

        $tellerStatusUpdate = "UPDATE admin SET status = CASE WHEN served >= threshold THEN 2 WHEN served < threshold THEN 1 END";
        $updateTellerStatus = mysqli_query($conn,$tellerStatusUpdate);
        if(!$updateTellerStatus){echo mysqli_error($conn);}

        $getTellerStatus =  "select * from admin where id = $teller";
        $tellerStatus = mysqli_query($conn , $getTellerStatus);
        $theTellerStatus = mysqli_fetch_assoc($tellerStatus);

        if($theTellerStatus){
            return $theTellerStatus['status'];
        }else{
            echo mysqli_error($conn);
        }

    }
