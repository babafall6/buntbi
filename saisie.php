<html>
    <head><title>Bienvenu </title></head>
    <body>
        <h1>Bienvenue sur la page d'enregistrement des visiteurs </h1>
        <h2>Commencez-donc par vous inscrire :</h2>
        <form name="inscription" method="post" action="saisie.php">
        Entrez votre num_iden : <input type="text" name="num_iden"/> <br/>
        Entrez votre prenom : <input type="text" name="prenom"/><br/>
        Entrez votre nom : <input type="text" name="nom"/><br/>
        Entrez votre sexe : <input type="text" name="sexe"/><br/>
        Entrez votre date_naissance : <input type="text" name="date_naissance"/><br/>
        Entrez votre adresse : <input type="text" name="adresse"/><br/>
        Entrez votre telephone : <input type="text" name="telephone"/><br/>
        Entrez votre email : <input type="text" name="email"/><br/>
            <input type="submit" name="valider" value="OK"/>
        </form>
        <?php
        if(isset($_POST['valider'])){
            $pseudo=$_POST['num_iden'];
            $ville=$_POST['prenom'];
            $ville=$_POST['nom'];
            $ville=$_POST['sexe'];
            $ville=$_POST['date_naissance'];
            $ville=$_POST['adresse'];
            $ville=$_POST['telephone'];
            $ville=$_POST['email'];
            echo 'Salut '. $prenom.' '. $nom.'<br/>Bienvenue vous etes bien enregistré !';
       }
        ?>
    </body>
</html>

