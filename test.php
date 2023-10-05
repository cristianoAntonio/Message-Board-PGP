<?php
    //ini_set('display_errors', 1);
    session_start();
    include_once 'includes/db.php';
    $sql = "select * from flag;"; 
    $result = pg_query($conn, $sql);
    
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
    <form action="includes/post.php" enctype="multipart/form-data" method="post">
        <label for="context">Context</label>
        <input type="text" name="context" id="context">
        <select name="flag">
            <?php while ($row = pg_fetch_row($result)) : ?>
                <option value="<?=$row[0]?>">
                    <?=$row[2]?>             
                </option>
            <?php endwhile;?>
        </select>
        <input type="hidden" name="MAX_FILE_SIZE" value="50000000" />
        <input type="hidden" name="thread" value="<?=$_GET['thread']?>">
        <input type="hidden" name="board" value="<?=$_GET['board']?>">
        <input type="file" id="media" name="media"/>
        <input type="submit" value="submit">
    </form>

</body>
</html>