<?php
    include_once 'db.php';
    
    $sql = "select * from board;"; 
    $result = pg_query($conn, $sql);

    while ($row = pg_fetch_row($result)) {
        foreach ($row as $i) {
            echo "$i ";
        }
        echo "<br>";
    }



?>
