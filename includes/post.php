<?php
    include_once "db.php";
    //ini_set('display_errors', 1);
    //ini_set('display_startup_errors', 1);
    //error_reporting(E_ALL);
    session_start();

    $thread = pg_escape_string($conn, $_POST['thread']);
    $board = pg_escape_string($conn,$_POST['board']);  
    if(empty($thread)) $thread = 'NULL'; 
    
    include_once "ptc.php";
    
    $usr = (string) $_SERVER['REMOTE_ADDR'];
    $q = "INSERT INTO public.post(context, thread, usr, flag, media,banned) VALUES ('$context', $thread, '$usr', $flag, $file_id, false);";
    $result = pg_query($conn, $q);
    header("Location: ../test.php");



