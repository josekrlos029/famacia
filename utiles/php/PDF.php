<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PDF
 *
 * @author JoseCarlos
 */
class PDF extends FPDF {

    var $y;
    
    
    function AcceptPageBreak() {
        $this->SetY(0);
        $this->y=0;
        $this->AddPage();
        
    }
    
    function addY(&$y){
        $this->y= $y;
    }
            
    function PDF($orientation='P', $unit='mm', $size='A4')
{
	// Llama al constructor de la clase padre
	$this->FPDF($orientation,$unit,$size);
	// Iniciaci�n de variables
	$this->B = 0;
	$this->I = 0;
	$this->U = 0;
	$this->HREF = '';
        
}

}
