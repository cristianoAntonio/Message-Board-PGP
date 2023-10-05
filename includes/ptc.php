<?php
    $context = pg_escape_string($conn,$_POST['context']);
    $flag = pg_escape_string($conn,$_POST['flag']);
    $media = $_FILES['media'];
    if(empty($flag))$flag = 'NULL';
    if(!is_null($media['name'])){
        if(!str_contains($media['type'], "image") && !str_contains($media['type'], "video")){
            die();
        }

        $uploads_dir = '../media' . "/" .  (int)$_SERVER['REMOTE_ADDR'];
        mkdir($uploads_dir, 0777);
        $fname = basename($media['name']);
        $uploads_dir ="$uploads_dir/$fname";

        if(!file_exists($uploads_dir)){
            move_uploaded_file($media["tmp_name"], $uploads_dir);
            $q = "INSERT INTO public.media(path) VALUES ('$uploads_dir');";
            $result = pg_query($conn, $q);
        }

        $q = "SELECT id FROM media WHERE path = '$uploads_dir';";
        $result = pg_query($conn, $q);
        $file_id = (int) pg_fetch_result($result,0,0);
    }
    else $file_id = 'NULL';
?>