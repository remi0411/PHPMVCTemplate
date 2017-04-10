<?php
/**
 * Created by PhpStorm.
 * User: Lardier
 * Date: 10/04/2017
 * Time: 13:53
 */

$action = $_REQUEST['action'];
switch($action){

    /**
     * Lance la vue qui dit bonjour
     */
    case 'bonjour':{
        $nomconnecte = 'pass';
        include("vues/v_accueil.php");
        break;
    }
}