<?php
    include_once 'includes/db.php';
    include_once "header.php";
    //ini_set('display_errors', 1);
    
    $sql = "select * from board;"; 
    $result = pg_query($conn, $sql);

?>

<body>
<div class="container">
    <div class="row justify-content-center g-0">
        <div class="col-sm-3">
            <div class="card">
                <div class="card-body align-items-center row">
                    <div style="margin:0px;padding:0px;" class="col-auto">
                        <img class=" thumnail"  src="media/favicon.png">
                    </div>
                    <div style="margin:0px;padding:0px;" class="col-auto">
                        <p style = "font-size:40px;" class="card-text text-break text-success"> 3Chan</p> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>
    <div class="container text-center">
        <div class="row">
            <?php while ($row = pg_fetch_row($result)) : ?>
                <div class="col">
                    <a href="catalog.php?board=<?=$row[0]?>"><?=$row[1]?></a>
                </div>
            <?php endwhile;?>
        </div>
    </div>
</div>
       

