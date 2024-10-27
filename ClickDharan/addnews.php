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
        $heading = $_POST['heading'];
        $content = $_POST['content'];
        $category = $_POST['category'];
        $writer = $_POST['writer'];
        $date = $_POST['date'];


        $insertquery = "INSERT INTO news_content VALUES('','$heading','$content','$category','$writer','sdfsf')";

        $execute_query = mysqli_query($database_connection, $insertquery);
        http_response_code(200);
        // echo "Error Host doesnt match";

    } else {
        echo "Method not valid";
    }
}
