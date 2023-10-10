<?php
    include_once "header.php";
    include_once "boardBar.php";
    //include_once "includes/db.php";

    $sql = "select t.id,t.name,m.path, p.context from thread t join post p on t.post = p.id join media m on p.media = m.id where t.board = " . $_GET['board'] .";"; 
    $result = pg_query($conn, $sql);
    //var_dump($sql)
?>  
<body class="">







  <div class="min-vh-100">
    <div class="container mt-3">
      <div class="row">
            <div class="card-deck d-flex align-items-center justify-content-left">

                <?php while ($row = pg_fetch_row($result)) : ?>
                  <a class="noStyle" href="thread.php?board=<?=$_GET['board']?>&thread=<?=$row[0]?>">
                    <div class="card mt-3" style=" max-width: 12rem;">
                            <img class="card-img-top" src="<?=$row[2]?>" alt="Card image cap">
                            <div class="card-body">
                                <p class="card-title"><?=$row[3]?></p>
                                <p class="card-text"><?=$row[1]?></p>
                            </div>
                    </div>
                  </a>
                <?php endwhile;?>

            </div>    
        </div>
  </div>
  </div>
  <footer class=" text-center text-lg-start">
    <div class="text-center p-3">
      Under The GNU General Public License (v3 or later)
    </div>
  </footer>
</body>

</html>

<style>
  .red {
    background-color: #870101;
  }

  .pink {
    background-color: #ffccaa;
  }
</style>