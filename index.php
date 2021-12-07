<?php
session_start();
if (isset($_POST['submit'])) {
    if ($_POST['submit'] == 'Login') {
        $_SESSION['User_Name'] = $_POST['name'];
        header("Location:topics.php");
    }
}
?>
<html>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <head><title>Quiz</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script></head>
    <body style="background-image: linear-gradient(#4E65FF,#92EFFD)">

        <h1 style='text-align: center'>QUIZ</h1><hr>
        <h3 style="text-align:center">Login</h3>
        <div class="form-group col-md-12">

            <form method="POST" action="" > 

                <div class="col-md-4">&nbsp;</div>

                <label class="col-md-1" >UserName</label>
                <div class="col-md-2">
                    <input type="text" class="form-control" name="name" placeholder="Enter UserName" required>
                </div><br><br>

                <div class="col-md-4">&nbsp;</div>
                <label class="col-md-1" >Password</label>
                <div class="col-md-2">
                    <input type="password" class="form-control" name="pwd" placeholder="Enter Password" required>
                </div>

                <div class="col-md-4">&nbsp;</div><br><br>
                <div class="col-md-5">&nbsp;</div>
                <div class="col-md-2">
                    <input type="submit" class="form-control btn btn-success"  name="submit" value="Login">
                </div>

            </form>
        </div>
    </body>
</html>
