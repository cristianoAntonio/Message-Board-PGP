<?php
    include_once 'includes/db.php';
    //ini_set('display_errors', 1);
    
    $sql = "select * from board;"; 
    $result = pg_query($conn, $sql);

?>

<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <span class="navbar-text">
            <?php while ($row = pg_fetch_row($result)) : ?>
                <a class="text-primary" href="catalog.php?board=<?=$row[0]?>">/<?=$row[2]?>/</a>
            <?php endwhile;?>
        </span>
    </div>
</nav>
