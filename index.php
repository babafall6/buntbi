<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Connexion</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class='corner content-dim'>
    <div class="rotate"> buntbi </div>
  </header>

  <div id="content" class='corner content-dim' >
    <div id="connexion">
      <span >
        <?php 
          if(isset($_GET['error']) )
            echo "Login ou mot de passe incorrect"; 
        ?> 
      </span>
      <form action="testeConnexion.php" method="post">
        <label for="" class='label'>Login :</label>
        <input type="text" class='input-text' name="login">
        <label for="" class='label'>Password :</label>
        <input type="password"class='input-text' name="password">
        <input type="submit" value='' class='buton-connexion'>
      </form>
    </div>
  </div>
  <footer class='content-dim'>copyright sup'info master 2014</footer>
</body>
</html>