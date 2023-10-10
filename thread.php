<?php
    include_once "header.php";
    include_once "boardBar.php";
    $sql = "select t.name,p.context,f.path,m.path,p.id from thread t join post p on t.post = p.id join media m on p.media = m.id join flag f on p.flag = f.id where t.id = " . $_GET['thread'] . ";";
    $result = pg_query($conn, $sql);
    $sql = "select p.context,f.path,m.path,p.id from post p join media m on p.media = m.id join flag f on p.flag = f.id where p.thread = " . $_GET['thread'] . "and p.id != (select t.post from thread t where t.id = "  . $_GET['thread'] . ");";
    $result2 = pg_query($conn, $sql);
?>



<body>
<div class="container mt-3">
    <?php while ($row = pg_fetch_row($result)) : ?>
        <div class="row">
            <div class="col-sm-6">
                <div class="card clearfix">
                    <div class="card-body">
                        <p class="card-title"><span class="text-success">Anonymous</span><span><img  height="14px" width = "20px"  src="<?=$row[2]?>"></span><span> <?=$row[0]?></span><a class="text-primary" href="#<?=$row[4]?>">No. <?=$row[4]?></a></p>
                            <img class="float-start thumnail"  src=" <?=$row[3]?>">
                            <p class="card-text "> <?=$row[1]?></p> 
                    </div>
                </div>
            </div>
        </div>
    <?php endwhile;?>
    <?php while ($row = pg_fetch_row($result2)) : ?>
        <div class="row">
            <div class="col-sm-6">
                <div class="card clearfix">
                    <div class="card-body">
                        <p class="card-title"><span class="text-success">Anonymous</span><span><img  height="14px" width = "20px"  src="<?=$row[1]?>"></span><a class="text-primary" href="#77777777">No. <?=$row[3]?></a></p>
                            <img class="float-start thumnail"  src="<?=$row[2]?>">
                            <p class="card-text "> <?=$row[0]?></p> 
                    </div>
                </div>
            </div>
        </div>
    <?php endwhile;?>
</div>
</body>
</html>