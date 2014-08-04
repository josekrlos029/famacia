<?php

/**
 * Description of Rol
 *
 * @author JoseCarlos
 */
class Rol extends Modelo{
    //put your code here
    
    private $idRol;
    private $nombre;
    
    private $administrador ="001";
    private $medico = "003";
    private $empleado = "002";
    private $cliente = "004";
    
    public function getIdRol() {
        return $this->idRol;
    }

    public function setIdRol($idRol) {
        $this->idRol = $idRol;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }
    
    public function getAdministrador() {
        return $this->administrador;
    }

    public function getMedico() {
        return $this->medico;
    }

    public function getEmpleado() {
        return $this->empleado;
    }

    public function getCliente() {
        return $this->cliente;
    }

    
  public function leerRoles($idPersona){
        $sql =  "SELECT rp.idRol, r.nombre FROM rol_persona rp, rol r WHERE rp.idRol= r.idRol AND rp.idPersona='".$idPersona."'";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        /*$roles = array();
        foreach ($resultado as $fila){
            $rol = new Rol();
            $this->mapearRol($rol, $fila);
            $roles[$rol->getIdRol()] = $rol;
        }
        return $roles;*/
    }
    
    public function rolPersona($idPersona){
      $sql =  "SELECT  idRol FROM rol_persona WHERE idPersona=".$idPersona;
       $this->__setSql($sql);
       $resultado = $this->consultar($sql);
        $rol=NULL;
        foreach ($resultado as $fila) {
            $rol = new Rol();
            $this->mapearRol($rol, $fila);
            
        }
        return $rol;
    }
    
    
 
private function mapearRol(Rol $rol, array $props){
        if(array_key_exists('idRol', $props)){
            $rol->setIdRol($props['idRol']);
        }
        if(array_key_exists('nombre', $props)){
            $rol->setNombre($props['nombre']);
        }
    }


    public function crearRolPersona($idPersona, $idRol){
        $sql = "INSERT INTO rol_persona (idPersona, idRol) VALUES (:idPersona, :idRol)";
        $this->__setSql($sql);
        $this->ejecutar(array(":idPersona"=>$idPersona,":idRol"=>$idRol));
        
    }
    
    
  }
?>