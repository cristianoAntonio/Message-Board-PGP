<?php
    include_once "db.php";
    ini_set('display_errors', 1);
    //ini_set('display_startup_errors', 1);
    //error_reporting(E_ALL);
    session_start();

    $board = pg_escape_string($conn,$_POST['board']);
    $name = pg_escape_string($conn,$_POST['name']);  
    
    if(empty($name)){
        die();
    }

    include_once "ptc.php";
    
    $q = "INSERT INTO public.thread(name, board) VALUES ('$name', $board) returning id;";
    $result = pg_query($conn, $q);
    $thread =(int)pg_fetch_result($result,0,0);

    $usr = (string) $_SERVER['REMOTE_ADDR'];
    $q = "INSERT INTO public.post(context, thread, usr, flag, media, banned) VALUES ('$context', $thread, '$usr', $flag, $file_id, false) returning id;";
    $result = pg_query($conn, $q);
    $post = (int)pg_fetch_result($result,0,0);

    $q = "UPDATE public.thread SET post=$post WHERE id = $thread";
    $result = pg_query($conn, $q);

    //header("Location: ../test2.php"); 