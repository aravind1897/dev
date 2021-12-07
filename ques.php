<?php
include_once 'DB.php';
session_start();
$result = 'none';
if (isset($_POST['submit'])) {
    $count = $_POST['ques_count'];
    for ($i = 1; $i <= $count; $i++) {
        $uname = $_SESSION['User_Name'];
        $ques = $_POST['ques_' . $i];
        $ans = $_POST['ans_' . $i];
        $query = "insert into user_ans (uname,qid,answer_id) values('$uname','$ques','$ans')";
        $ques = mysqli_query($con, $query);
    }
    $user_ans = "SELECT * FROM `user_ans` as us inner join questions as q on q.qid=us.qid where us.uname='$uname' and us.answer_id=q.answer_id";
    $ans = mysqli_query($con, $user_ans);
    $result = mysqli_num_rows($ans);
    mysqli_close($con);
}
?>

<html>
    <head><title>Quiz</title>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="css/style.css?123" rel="stylesheet" />


    </head>
    <body class="quiz_body">

        <h1 style='text-align: center'>QUIZ</h1>

        <div class="form-group" style="border:1.5px solid black;text-align:center;height:42%" >

            <div class="ques">
<?php if ($result == 'none') { ?>
                    <div class="header">
                        <span class="u_name"><b>Name:</b> <?php echo $_SESSION['User_Name']; ?></span>
                        
                        <h3 style="margin-right:155px">Questions </h3>
                    </div><br><br>

                    <div class="form-group" style="text-align:center">
                        <form method="post" action="" id="quiz">
    <?php
    $query = "select * from questions where cat_id=" . $_SESSION['category'];
    $ques = mysqli_query($con, $query);
    $count = mysqli_num_rows($ques);

    $i = 1;
    while ($row = mysqli_fetch_array($ques)) {
        $class = "success";
        if ($row['level'] == "Intermediate")
            $class = "warning";
        else if ($row['level'] == "Professional")
            $class = "danger";
        ?>

                                <div id = "ques_<?php echo $i; ?>" class="form-group row" style="width:100%">
                                    <input type="hidden" name="ques_<?php echo $i; ?>" value="<?php echo$row['qid']; ?>">
                                    <p name="ques_<?php echo $i; ?>" id="cat_<?php echo $i; ?>" style="font-size:18px"><b><?php echo $i, '. ' . $row['question']; ?></b></p>
                                    <span class="label label-<?php echo $class; ?> level"><?php echo $row['level']; ?></span>
        <?php
        $query = "select * from ques_option where qid=" . $row['qid'];
        $opt = mysqli_query($con, $query);
        while ($ans = mysqli_fetch_array($opt)) {
            ?>		
                                    &nbsp;&nbsp;<input type="radio" class="opt_<?php echo $i; ?>" name="ans_<?php echo $i; ?>" value="<?php echo $ans['qo_id']; ?>">&nbsp;&nbsp;<?php echo $ans['options']; ?>&nbsp;&nbsp;

                                    <?php } ?><br><br><br><br>
                                    <span class='line'></span>
                                    <input type="button" class="btn btn-primary previous" onclick="prev(<?php echo $i; ?>)" value="Previous" >
                                    <input type="button" class="btn btn-primary next" onclick="next(<?php echo $i; ?>)" value="Next" ><br>

                                </div>
        <?php $i = $i + 1;
    } ?>
                            <input type="hidden" name="ques_count" value="<?php echo $count; ?>">
                            <input type="submit" id="final_submit" class="btn btn-success" disabled="true" name="submit" data-toggle="tooltip" 
                                   title="You can submit only after answering all the questions" >
                        </form>
                    </div>

<?php } else { ?>

                    <br><h3>Hi <?php echo $uname; ?>,Your Score</h3>
                    <div class="score"><?php echo $result, '/' . $count; ?></div><br>
                    <a href="index.php"><button type="button" class="btn btn-default">Back to Home page</button></a>
<?php }
?>
            </div>
        </div>

    </body>
</html>
<script type="text/javascript">
    $('.previous').attr('disabled', true);
    function next(ques_no) {

        var ques_count = '<?php echo $count; ?>';
        var next_ques = ques_no + 1;
        var is_answered = $(".opt_" + ques_no).is(":checked");
        if (!is_answered)
        {
            alert('Please answer the question');
            return false;
        }
        $('.previous').attr('disabled', false);
        if (ques_count == next_ques)
        {
            $(".next").attr('disabled', true);
            $("#final_submit").attr('disabled', false);

        }
        $("#ques_" + ques_no).hide();
        $("#ques_" + next_ques).show();
    }

    function prev(ques_no) {
        $(".next").attr('disabled', false);
        var ques_count = '<?php echo $count; ?>';
        var prev_ques = ques_no - 1;
        if (ques_no == 2)
        {
            $(".previous").attr('disabled', true);
        }
        $("#ques_" + ques_no).hide();
        $("#ques_" + prev_ques).show();
    }




    $("#quiz").submit(function (e) {
        var ques_count = '<?php echo $count; ?>';
        var is_answered = $(".opt_" + ques_count).is(":checked");
        if (!is_answered)
        {
            alert('Please answer the question');
            return false;
        }

        return true;
    });


    $(document).ready(function () {
        var ques_count = '<?php echo $count; ?>';
        var i;
        for (i = 2; i <= ques_count; i++)
        {
            $("#ques_" + i).hide();
        }

        var d = new Date();
        $(".dt").html('<b>Date:</b> ' + d.getDate() + '-' + d.getMonth() + '-' + d.getFullYear());
    });
</script>


