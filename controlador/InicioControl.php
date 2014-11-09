<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InicioControl
 *
 * @author JoseCarlos
 */
class InicioControl extends Controlador{
    
    public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
        $this->setModelo($modelo);
    }
    
    /**
     * Función que Imprime El Index (página principal de la Aplicación
     * @return type
     */
    public function index(){
        try {
            
            $this->vista->set('titulo', 'Inicio');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
     
    public function iniciarSesion(){
        try {
             $this->vista->set('titulo', 'Inicio de Sesion');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
     public function autenticar() {
        try {
            $nombreUsuario = isset($_POST['usuario']) ? $_POST['usuario'] : NULL;
            $clave = isset($_POST['clave']) ? $_POST['clave'] : NULL;
            $user = new Usuario();
            $usuario = $user->verificarUsuario($nombreUsuario,$clave);
            if ($usuario == NULL) {
                echo json_encode("error"); 
            }else{
                $_SESSION['idUsuario'] = $usuario->getIdPersona();
                $rol= new Rol();
                $roles = $rol->leerRoles($usuario->getIdPersona());
                
                foreach ($roles as $r){
                    
                    if ($r["idRol"] == "A"){
                        echo json_encode("/famacia/administrador/usuarioAdministrador"); 
                    }elseif ($r["idRol"] == "F"){
                        echo json_encode("/famacia/medico/usuarioFarmaceutico"); 
                    }
                    
                }
                
            }
        } catch (Exception $exc){
            echo  json_encode('Error de aplicacion: ' . $exc->getMessage());
        }   
        
    }
        
}

?>