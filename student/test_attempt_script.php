<?php
    include '../db/database.php';
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $test_id = mysqli_real_escape_string($conn,$_POST['test_id']);
        $staff_id = mysqli_real_escape_string($conn,$_POST['staff_id']);
        $test_name = mysqli_real_escape_string($conn,$_POST['test_name']);
        $test_stream = mysqli_real_escape_string($conn,$_POST['test_stream']);
        $test_subject = mysqli_real_escape_string($conn,$_POST['test_subject']);
        $number_of_questions = mysqli_real_escape_string($conn,$_POST['number_of_questions']);
        $neg_marks = mysqli_real_escape_string($conn,$_POST['neg_marks']);
        $test_time = mysqli_real_escape_string($conn,$_POST['test_time']);
        $total_marks = mysqli_real_escape_string($conn,$_POST['total_marks']);
        $wrong = $right = $attempted = $marks_obtained = 0;

        for ($i=0; $i < $number_of_questions; $i++)
        {
            $answer = mysqli_real_escape_string($conn,$_POST['answer'][$i]);
            $correct_option = mysqli_real_escape_string($conn,$_POST['correct_option'][$i]);
            $marks = mysqli_real_escape_string($conn,$_POST['marks'][$i]);
            //check which option is selected
            if ($answer == 'A') {
                $answer_code = 1;
                $attempted++;
            }
            elseif ($answer == 'B') {
                $answer_code = 2;
                $attempted++;
            }
            elseif ($answer == 'C') {
                $answer_code = 3;
                $attempted++;
            }
            elseif ($answer == 'D') {
                $answer_code = 4;
                $attempted++;
            }
            else {
                $answer_code = 0;
            }

            //check if right or not
            if ($answer_code == $correct_option) {
                $right++;
                $marks_obtained = $marks + $marks_obtained;
            }else {
                if ($answer_code != 0) {
                    $wrong++;
                }
            }
        }
        $not_attempted = $number_of_questions - $attempted;

        $sql_test_result = "INSERT INTO test_result (test_id, attempted, not_attempted, right_answers, wrong_answers, marks_obtained, total_marks)
                            VALUES('$test_id','$attempted','$not_attempted','$right','$wrong','$marks_obtained','$total_marks')";
        //$result_test_result = mysqli_query($conn,$sql_test_result);

        $sql = "SELECT * FROM test_result WHERE test_id = $test_id";
        //$result = mysqli_query($conn,$sql);
        $row = mysqli_fetch_assoc($result);
        $result_id = $row['result_id'];

        for ($i=0; $i < $number_of_questions; $i++)
        {
            $question_id = mysqli_real_escape_string($conn,$_POST['question_id'][$i]);
            $answer = mysqli_real_escape_string($conn,$_POST['answer'][$i]);
            if ($answer == 'A') {
                $answer_code = 1;
            }
            elseif ($answer == 'B') {
                $answer_code = 2;
            }
            elseif ($answer == 'C') {
                $answer_code = 3;
            }
            elseif ($answer == 'D') {
                $answer_code = 4;
            }
            else {
                $answer_code = 0;
            }
            $sql_test_attempted = "INSERT INTO test_attempted (result_id, question_id, answer)
                                    VALUES('$result_id','$question_id','$answer_code')";
            //$result_test_attempted = mysqli_query($conn,$sql_test_attempted);
        }
    }
?>
