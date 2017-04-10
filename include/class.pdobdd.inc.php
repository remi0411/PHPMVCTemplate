<?php
/**
 * Created by PhpStorm.
 * User: Lardier
 * Date: 10/04/2017
 * Time: 12:42
 */
class PdoBDD
{
    private static $serveur = 'localhost';
    private static $bdd = 'bibliotheque';
    private static $user = 'root';
    private static $mdp = '';
    private static $monPdo;
    private static $monPdoBDD = null;

    /**
     * @description Constructeur privé, crée l'instance de PDO qui sera sollicitée
     * pour toutes les méthodes de la classe
     */
    private function __construct()
    {
        PdoBDD::$monPdo = new PDO("mysql:host=" . PdoBDD::$serveur . ";dbname=" . PdoBDD::$bdd, PdoBDD::$user, PdoBDD::$mdp);;
        PdoBDD::$monPdo->query("SET CHARACTER SET utf8");
    }

    public function _destruct()
    {
        PdoBDD::$monPdo = null;
    }

    /**
     * @description Fonction statique qui crée l'unique instance de la classe
     * Appel : $instancePdoBDD = PdoBDD::getPdoBdd();
     * @return int l'unique objet de la classe PdoBDD
     */
    public static function getPdoBdd()
    {
        if (PdoBDD::$monPdoBDD == null) {
            PdoBDD::$monPdoBDD = new PdoBDD();
        }
        return PdoBDD::$monPdoBDD;
    }
}
