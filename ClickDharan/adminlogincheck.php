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
        $email_ = $_POST['email'];
        $password = $_POST['password'];

        // $checkquery = "Select * from  where default_email='$email_' and default_password='$password";
        $checkquery = "Select * from superadmin where default_email='$email_' and default_password='$password'";
        $execute_query = mysqli_query($database_connection, $checkquery);
        echo "Num rows";
        $rows_num = mysqli_num_rows($execute_query);
        if ($rows_num > 0) {
            echo http_response_code(200);
            // echo "Error occured";

        } else {
            echo http_response_code(400);
            // echo "Error Host doesnt match";
        }
    } else {
        echo "Method not valid";
    }
}
