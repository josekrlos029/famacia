<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MedicoControl
 *
 * @author JuanMi Martinez
 */
class MedicoControl extends Controlador {
     public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
    }
    public function usuarioMedico(){
        try {
           
            if($this->verificarSession()){
                $this->vista->set('titulo', 'Usuario Medico');
                 $persona = new Persona();
                $idMedico = $_SESSION['idUsuario'];
                $personas = $persona->leerPacientesPorMedico($idMedico);
                $this->vista->set('personas', $personas);
                $cita = new Cita();
                $fecha = getdate();
                $FechaTxt=$fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
                $citas = $cita->leerCitasDelMedico($FechaTxt, $idMedico);
                $this->vista->set('citas', $citas);
                return $this->vista->imprimir();
            }
            
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }  
    
    public function paciente(){
        try {
           
            $this->vista->set('titulo', 'Informacion de Pacientes');
            $persona = new Persona();
            $idMedico = $_SESSION['idUsuario'];
            $personas = $persona->leerPacientesPorMedico($idMedico);
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
    public function medicamentos(){
        try {
           
            $this->vista->set('titulo', 'Informacion de Medicamentos');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }  
        
     public function historial(){
        try {
           
            $this->vista->set('titulo', 'Historial medico ');
            
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }     
    
}

?>
