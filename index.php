<?php
/**
 * Created by PhpStorm.
 * User: Lardier
 * Date: 10/04/2017
 * Time: 12:31
 */

// Ici on peut inclure les dépendances
require_once("include/fct.inc.php");
require_once("include/class.pdobdd.inc.php");

session_start();

//Inclusion de l'entpete
include("vues/v_entete.php");

// Initiation de l'accès à la BDD
$pdo = PdoBDD::getPdoBDD();

/**
 * Pour l'authentification
 */
// Vérifie si un utilisateur est connecté
$estConnecte = estConnecte();

// Si aucun utilisateur n'est connecté, renvoie vers la page de connexion
if(!isset($_REQUEST['uc']) || !$estConnecte) {
    $_REQUEST['uc'] = 'connexion';
}
$uc = $_REQUEST['uc'];

// C'est ici que nous recensons l'ensemble des controleurs de l'application
switch($uc){
    case 'connexion':{
        include("controleurs/c_connexion.php");
        break;
    }
    /*case 'gererFrais' :{
        include("controleurs/c_gererFrais.php");
        break;
    }
    case 'etatFrais' :{
        include("controleurs/c_etatFrais.php");
        break;
    }
    case 'validFrais' :{
        include("controleurs/c_validFrais.php");
    }*/
}

//Inclusion du footer
include("vues/v_pied.php");
