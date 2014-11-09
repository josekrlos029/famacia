<?php

/**
 * Description of Persona
 *
 * @author JoseCarlos
 */
class Persona extends Modelo {

    public function __construct() {
        parent::__construct();
    }

    private $idPersona;
    private $identificacion;
    private $tipoIdentificacion;
    private $nombres;
    private $pApellido;
    private $sApellido;
    private $sexo;
    private $fNacimiento;
    private $telefono;
    private $direccion;

    public function getIdPersona() {
        return $this->idPersona;
    }

    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function getIdentificacion() {
        return $this->identificacion;
    }

    public function getTipoIdentificacion() {
        return $this->tipoIdentificacion;
    }

    public function setIdentificacion($identificacion) {
        $this->identificacion = $identificacion;
    }

    public function setTipoIdentificacion($tipoIdentificacion) {
        $this->tipoIdentificacion = $tipoIdentificacion;
    }

    public function getNombres() {
        return $this->nombres;
    }

    public function setNombres($nombres) {
        $this->nombres = $nombres;
    }

    public function getPApellido() {
        return $this->pApellido;
    }

    public function setPApellido($pApellido) {
        $this->pApellido = $pApellido;
    }

    public function getSApellido() {
        return $this->sApellido;
    }

    public function setSApellido($sApellido) {
        $this->sApellido = $sApellido;
    }

    public function getSexo() {
        return $this->sexo;
    }

    public function setSexo($sexo) {
        $this->sexo = $sexo;
    }

    public function getFNacimiento() {
        return $this->fNacimiento;
    }

    public function setFNacimiento($fNacimiento) {
        $this->fNacimiento = $fNacimiento;
    }

    public function getTelefono() {
        return $this->telefono;
    }

    public function setTelefono($telefono) {
        $this->telefono = $telefono;
    }

    public function getDireccion() {
        return $this->direccion;
    }

    public function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

//Funciones CRUD

    private function mapearPersona(Persona $persona, array $props) {
        if (array_key_exists('idPersona', $props)) {
            $persona->setIdPersona($props['idPersona']);
        }
        if (array_key_exists('identificacion', $props)) {
            $persona->setIdentificacion($props['identificacion']);
        }
        if (array_key_exists('tipoIdentificacion', $props)) {
            $persona->setTipoIdentificacion($props['tipoIdentificacion']);
        }
        if (array_key_exists('nombres', $props)) {
            $persona->setNombres($props['nombres']);
        }
        if (array_key_exists('pApellido', $props)) {
            $persona->setPApellido($props['pApellido']);
        }
        if (array_key_exists('sApellido', $props)) {
            $persona->setSApellido($props['sApellido']);
        }
        if (array_key_exists('sexo', $props)) {
            $persona->setSexo($props['sexo']);
        }
        if (array_key_exists('cumpleanios', $props)) {
            $persona->setFNacimiento(self::crearFecha($props['cumpleanios']));
        }
        if (array_key_exists('telefono', $props)) {
            $persona->setTelefono($props['telefono']);
        }

        if (array_key_exists('direccion', $props)) {
            $persona->setDireccion($props['direccion']);
        }
    }

    private function getParametros(Persona $per) {

        $parametros = array(
            ':identificacion' => $per->getIdentificacion(),
            ':tipoIdentificacion' => $per->getTipoIdentificacion(),
            ':nombres' => $per->getNombres(),
            ':pApellido' => $per->getPApellido(),
            ':sApellido' => $per->getSApellido(),
            ':sexo' => $this->getSexo(),
            ':cumpleanios' => $per->getFNacimiento(),
            ':telefono' => $per->getTelefono(),
            ':direccion' => $per->getDireccion()
            
        );
        return $parametros;
    }
    
    private function getParametrosWithId(Persona $per) {

        $parametros = array(
            ':identificacion' => $per->getIdentificacion(),
            ':tipoIdentificacion' => $per->getTipoIdentificacion(),
            ':nombres' => $per->getNombres(),
            ':pApellido' => $per->getPApellido(),
            ':sApellido' => $per->getSApellido(),
            ':sexo' => $this->getSexo(),
            ':cumpleanios' => $per->getFNacimiento(),
            ':telefono' => $per->getTelefono(),
            ':direccion' => $per->getDireccion()
            
        );
        return $parametros;
    }

    public function crearPersona(Persona $persona) {
        $sql = "INSERT INTO persona (identificacion, tipoIdentificacion, nombres, pApellido, sApellido, sexo, cumpleanios, telefono, direccion) VALUES ( :identificacion, :tipoIdentificacion, :nombres, :pApellido, :sApellido, :sexo, :cumpleanios, :telefono, :direccion)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($persona));
    }

    public function leerPersonas() {
        $sql = "SELECT * FROM persona";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function leerPersonasPorRol($idRol) {
        $sql = "SELECT persona.* FROM persona INNER JOIN rolpersona ON (persona.idPersona = rolpersona.idPersona) AND rolpersona.idRol='" . $idRol . "'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function leerEmpleados() {
        $sql = "SELECT p.* FROM persona p, rolpersona rp WHERE p.idPersona = rp.idPersona AND rp.idRol IN ('002','003')";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function leerPersonasPorServicio($idServicio) {
        $sql = "SELECT persona.* FROM persona INNER JOIN servicio_empleado ON (persona.idPersona = servicio_empleado.idPersona) AND servicio_empleado.idServicio='" . $idServicio . "'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function leerPorRol($idRol) {
        $sql = "SELECT p.idPersona, p.nombres, p.pApellido, p.sApellido, p.sexo, p.cumpleanios, p.telefono, p.direccion FROM persona p, rolpersona r WHERE p.idPersona=r.idPersona AND r.idRol='" . $idRol . "'";
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function leerPorServicio($idServicio) {
        $sql = "SELECT p.idPersona, p.nombres, p.pApellido, p.sApellido, p.sexo, p.cumpleanios, p.telefono, p.celular, p.direccion, p.correo  FROM persona p, servicio_empleado se  WHERE p.idPersona=se.idPersona AND se.idServicio=" . $idServicio;
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

    public function actualizarPersona(Persona $persona) {
        $sql = "UPDATE persona SET tipoIdentificacion=:tipoIdentificacion, nombres=:nombres, pApellido=:pApellido, sApellido=:sApellido, cumpleanios=:cumpleanios, sexo=:sexo, telefono=:telefono, direccion=:direccion  WHERE identificacion=:identificacion";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($persona));
    }

    public function eliminarPersona(Persona $persona) {
        $sql = "DELETE FROM persona where idPersona=:idPersona";
        $this->__setSql($sql);
        $param = array(':idPersona' => $persona->getIdPersona());
        $this->ejecutar($param);
    }

    public function leerPorId($id) {
        $sql = "SELECT idPersona, identificacion, tipoIdentificacion, nombres, pApellido, sApellido, sexo, cumpleanios, telefono, direccion FROM persona ";
        $sql .= "WHERE idPersona='" . $id . "'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $persona = NULL;
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
        }
        return $persona;
    }
    
    public function leerPorCedula($id) {
        $sql = "SELECT idPersona, identificacion, tipoIdentificacion, nombres, pApellido, sApellido, sexo, cumpleanios, telefono, direccion FROM persona ";
        $sql .= "WHERE identificacion='" . $id . "'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $persona = NULL;
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
        }
        return $persona;
    }

    public function leerPacientesPorMedico($idMedico) {
        $sql = "SELECT DISTINCT p.* FROM persona p, cita c WHERE c.idCliente = p.idPersona AND c.idPersona='" . $idMedico . "'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $pers = array();
        foreach ($resultado as $fila) {
            $persona = new Persona();
            $this->mapearPersona($persona, $fila);
            $pers[$persona->getIdPersona()] = $persona;
        }
        return $pers;
    }

}

?>
