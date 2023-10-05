<?php
    //ini_set('display_errors', 1);
    session_start();
    include_once 'includes/db.php';
    $sql = "select * from flag;"; 
    $result = pg_query($conn, $sql);

    $sql2 = "select * from board;"; 
    $result2 = pg_query($conn, $sql2);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/flag-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


    <title>Document</title>
</head>
<body>
    <div class="container mt-5">
        <form action="includes/thread.php" enctype="multipart/form-data" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Title</label>
                <input type="text" name="name" id="name" class="form-control">
            </div>
            <div class="mb-3">
                <label for="context" class="form-label">Context</label>
                <input type="text" name="context" id="context" class="form-control">
            </div>
            <div class="mb-3">
                <label for="flag" class="form-label">Flag</label>
                <select name="flag" id="flag" class="form-select">
                    <?php while ($row = pg_fetch_row($result)) : ?>
                        <option value="<?=$row[0]?>"><?=$row[2]?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <input type="hidden" name="MAX_FILE_SIZE" value="50000000">
            <input type="hidden" name="thread" value="<?=$_GET['thread']?>">
            <input type="hidden" name="board" value="<?=$_GET['board']?>">
            <div class="mb-3">
                <label for="media" class="form-label">Media</label>
                <input type="file" id="media" name="media" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <form action="test2.php" method="get">
            <div class="mb-3">
                <label for="board" class="form-label">Board</label>
                <select name="board" id="board" class="form-select">
                    <?php while ($row = pg_fetch_row($result2)) : ?>
                        <option value="<?=$row[0]?>"><?=$row[1]?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Set Board</button>
        </form>
    </div>

</body>
</html>