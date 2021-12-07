<?php
include_once 'DB.php';
$query = "select * from categories";
$data = mysqli_query($con, $query);
session_start();
if (isset($_POST['submit'])) {
    if ($_POST['submit'] == 'Start') {

        $_SESSION['category'] = $_POST['type'];
        echo $_SESSION['category'];
        header("Location:ques.php");
    }
}
?>
<html>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <head><title>Quiz</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-image: linear-gradient(#4E65FF,#92EFFD)">

        <h1 style='text-align: center'>QUIZ</h1><hr>

        <div class="form-group" style="text-align:center;height:30%" >
            <div class="cat">
                <h4>Welcome <b><?php echo $_SESSION['User_Name']; ?></b>, choose your topic</h4><br>

                <form  method="post" action="">
                    <div class="form-group col-md-12">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <select id="type" name="type" class="form-control" required>
                                <option value="">--Select your topic--</option>
                                <?php
                                while ($row = mysqli_fetch_array($data)) {
                                    ?>
                                    <option  value="<?php echo $row['cat_id']; ?>"><?php echo $row['name']; ?></option>
                                <?php } ?>

                            </select>
                        </div>
                        <div class="col-md-1">
                            <input type="submit" class="form-control btn btn-primary"  name="submit" value="Start" id="cat">
                        </div>
                    </div>

                </form>


            </div>

        </div>
    </body>
</html>

