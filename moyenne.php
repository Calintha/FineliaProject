<?php
	$serveur = "localhost";
	$login = "root";
	$pass = "root";

	/* Connexion à la base de donnée */
	try{
		$nom = "";
		$prenom = "";
		$email = "";

		$connexion = new PDO("mysql:host=$serveur;dbname=moyenne", $login, $pass);
		$connexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		/* Requete de calcul de moyenne et affichage des moyennes arrondi a 2 dixieme*/
		$requete = $connexion->prepare("
			SELECT nom, ROUND(SUM(note)/SUM(coef),2) AS moyenne
			FROM eleve, notation, matiere
			WHERE id_eleve = ref_note
			AND id_eleve = ref_matiere
			GROUP BY nom");
		$requete->execute();

		/* Affichage liste des moyennes par nom d'eleve */
		$resultat = $requete->fetchall();
		echo '<pre>';
		print_r($resultat);
		echo '</pre>';
    }
    catch(PDOException $e){ /* message d'erreur si la connexion échoue */
      echo 'Echec de la connexion : '.$e->getMessage();
    }

		/* Lien pour revenir au formulaire */
		echo '<a href="formulaire.html"> Revenir au formulaire. </a>';
?>
