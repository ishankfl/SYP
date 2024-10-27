<?php
$db_host = "localhost";
$db_username = "root";
$db_password = "";
$db_database = "clickdharan";

$database_connection = mysqli_connect($db_host, $db_username, $db_password, $db_database);

if (!$database_connection) {
    echo "Error";
    echo http_response_code(404);
} else {
    // echo "Not erro";
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $name_ = $_POST['fullname'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        // echo "$name_";
        echo "$email";
        // echo "$password";
        $checkquery = "Select * from admin_writer where email='$email'";

        $execute_query = mysqli_query($database_connection, $checkquery);
        // echo "Num rows";
        $rows_num = mysqli_num_rows($execute_query);
        if ($rows_num > 0) {
            echo "number: $rows_num";
            http_response_code(400);
            // echo "Error occured";

        } else {
            echo "$name_";
            echo "$email";
            echo "$password";

            $insertquery = "INSERT INTO admin_writer VALUES('','$name_','$email','$password','1')";

            $execute_query = mysqli_query($database_connection, $insertquery);
            http_response_code(200);
            // echo "Error Host doesnt match";
        }
    } else {
        echo "Method not valid";
    }
}
