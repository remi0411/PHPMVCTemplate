<?php
/**
 * Created by PhpStorm.
 * User: Lardier
 * Date: 10/04/2017
 * Time: 12:53
 */

/**
 * Teste si le compte est connecté
 * @return true or false
 */
function estConnecte(){
    return true;
    //return isset($_SESSION['idCompte']);
}

/**
 * Ajoute le libellé d'une erreur au tableau des erreurs

 * @param $msg : le libellé de l'erreur
 */
function ajouterErreur($msg){
    if (! isset($_REQUEST['erreurs'])){
        $_REQUEST['erreurs']=array();
    }
    $_REQUEST['erreurs'][]=$msg;
}