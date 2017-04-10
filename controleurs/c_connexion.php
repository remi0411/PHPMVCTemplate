<?php
/**
 * Created by PhpStorm.
 * User: Lardier
 * Date: 10/04/2017
 * Time: 12:57
 */

// Vérifie la provenance de l'appel et la map si besoin
if(!isset($_REQUEST['action'])){
    $_REQUEST['action'] = 'demandeConnexion';
}

$action = $_REQUEST['action'];

// Redirection en fonction de l'appel
switch($action){

    /**
     * Affiche la page de connexion à l'application
     */
    case 'demandeConnexion':{
        include("vues/v_connexion.php");
        break;
    }

    /**
     * Valide les données rentrées pour se connecter à l'application
     */
    case 'valideConnexion': {
        var_dump($_REQUEST);
        if($_REQUEST["login"] == "pass"){
            // Appel de la fonction connecter
            header('Location:index.php?uc=accueil&action=bonjour');
        }
        else {
            ajouterErreur("Login ou mot de passe incorrect");
            include("vues/v_erreurs.php");
            include("vues/v_connexion.php");
        }
        break;
    }
    default :{
        include("vues/v_connexion.php");
        break;
    }
}