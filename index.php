<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="controller.php" method="post">
        <label for="">Choose a service</label><br>
        <input type="radio" name="service" value="Cash Deposit" required><label for="">Cash Deposit</label><br>
        <input type="radio" name="service" value="Cash Withdraw" required><label for="">Cash Withdraw</label><br>
        <input type="radio" name="service" value="Check Deposit" required><label for="">Check Deposit</label><br>
        <input type="radio" name="service" value="Electronic Funds Transfer" required><label for="">Electronic Funds Transfer</label><br>
        <input type="radio" name="service" value="Western Union" required><label for="">Western Union</label><br>
        <input type="radio" name="service" value="Forex" required><label for="">Forex</label><br>

        <label for="">Customer Catgory</label><br>
        <input type="radio" name="priority" value="1" required><label for="">VIP</label><br>
        <input type="radio" name="priority" value="2" required><label for="">Coporate</label><br>
        <input type="radio" name="priority" value="3" required><label for="">Normal</label><br>

        <input type="submit" value="Generate Token" name="generateToken">
    </form>
</body>
</html>