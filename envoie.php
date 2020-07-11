<?PHP

$serveur = "localhost"; /* Connexion à la base de donnée */
$login = "root";
$pass = "root";
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
/* Connexion à la base de donnée */
try{
  $nom = "";
  $prenom = "";
  $email = "";

  $connexion = new PDO("mysql:host=$serveur;dbname=moyenne", $login, $pass);
  $connexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  if($_POST) /* Si validation du formulaire */
      {
        $nom = $_POST['nom'];
        $note_math = $_POST['note_math'];
        $note_anglais = $_POST['note_anglais'];
        $note_francais = $_POST['note_francais'];
        $note_histoire = $_POST['note_histoire'];
        $coeff_math = $_POST['coeff_math'];
        $coeff_anglais = $_POST['coeff_anglais'];
        $coeff_francais = $_POST['coeff_francais'];
        $coeff_histoire = $_POST['coeff_histoire'];

        /* Premiere requete d'insert pour le nom de l'eleve */
        $insert = "INSERT INTO eleve (id_eleve, nom) VALUES (NULL, '$nom')";
        $connexion ->exec($insert);

        /* Deuxieme requete d'insert pour les coeff */
        $insert1 = "INSERT INTO matiere (id_matiere, ref_matiere, nom_matiere, coef) VALUES (NULL, (SELECT MAX(id_eleve) FROM eleve), 'math', '$coeff_math'),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), 'anglais', '$coeff_anglais'),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), 'francais', '$coeff_francais'),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), 'histoire', '$coeff_histoire')";
        $connexion ->exec($insert1);

        /* Troisieme requete d'insert pour les notes */
        $insert2 = "INSERT INTO notation (id_note,ref_note, note) VALUES (NULL, (SELECT MAX(id_eleve) FROM eleve), ($note_math*$coeff_math)),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), ($note_anglais*$coeff_anglais)),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), ($note_francais*$coeff_francais)),
        (NULL, (SELECT MAX(id_eleve) FROM eleve), ($note_histoire*$coeff_histoire))";
    		$connexion ->exec($insert2);

        /*renvoie vers le formulaire*/
        header('location:formulaire.html');
      }
    }


  catch(PDOException $e){ /* message d'erreur si la connexion échoue */
	echo 'Echec de la connexion : '.$e->getMessage();
  }
?>
