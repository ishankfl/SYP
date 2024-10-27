<?php
$db_host = "localhost";
$db_username = "root";
$db_password = "";
$db_database = "clickdharan";

$database_connection = mysqli_connect($db_host, $db_username, $db_password, $db_database);

// echo "hello";
// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to the Server: " . mysqli_connect_error();
} else {
    $query = "Select * from news_content";
    $values = array();
    $result = mysqli_query($database_connection, $query);
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($values, $row);
    }
    echo json_encode($values);
}
