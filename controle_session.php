<?php
  session_start();
  if(!isset($_SESSION['vigile'])or !isset($_SESSION['admin']))
    header('Location: index.php');
?>