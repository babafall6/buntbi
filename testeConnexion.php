<?php

  include_once "parameters.php";
  
  mysql_connect(HOST, USER, PASSWORD);
  
  mysql_select_db(DB);
  
  var_dump($_POST);
  
  $sql = "SELECT * FROM vigile WHERE login = '".$_POST['login']."' AND password = SHA1('".$_POST['password']."')";
  
  $resultat = mysql_query($sql);
  
  if($resultat)
  {
    if($line = mysql_fetch_assoc($resultat))
    {
      var_dump($line);
      session_start();
      $_SESSION['vigile'] = $line;
      
      header('Location: vigile.php');
    }else
    {
      header('Location: index.php?error');
    }
  }

?>