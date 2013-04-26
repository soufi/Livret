<?php
    class Connexion{
        private $_user;
        private $_passwd;
        private $_host;
        private $_bdd;
        private $_connect;

        //default constructor
        public function __construct ($user = 'root', $passwd = 'root', $host = 'localhost', $bdd = 'livret'){
            $this->_user = $user;
            $this->_passwd = $passwd;
            $this->_host = $host;
            $this->_bdd = $bdd;
            try{
                $this->_connect = new PDO ('mysql:host='.$this->_host.';dbname='.$this->_bdd,$this->_user,$this->_passwd);
            }catch(Exception $e){
                echo 'Une erreur est survenue ! '. $e->getMessage();
            }
        }
    }
?>