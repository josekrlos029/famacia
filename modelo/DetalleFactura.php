<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DetalleProducto
 *
 * @author Jose Jimenez
 */
class DetalleFactura extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idProducto;
    private $cantidad;
    private $precioVenta;
    private $iva;
        
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }


    public function getCantidad() {
        return $this->cantidad;
    }
    
    public function getPrecioVenta() {
        return $this->precioVenta;
    }
    
   public function setIdFactura($idDetalleProducto) {
        $this->idFactura = $idDetalleProducto;
    }
    
    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

    public function setPrecioVenta($precioVenta) {
        $this->precioVenta = $precioVenta;
    }
    
    public function getIva() {
        return $this->iva;
    }

    public function setIva($iva) {
        $this->iva = $iva;
    }

    
private function mapearDetalleProducto(DetalleFactura $factura, array $props) {
        if (array_key_exists('idFactura', $props)) {
            $factura->setIdFactura($props['idFactura']);
        }
         if (array_key_exists('idProducto', $props)) {
            $factura->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('cantidad', $props)) {
            $factura->setCantidad($props['cantidad']);
        }
        
        if (array_key_exists('precioVenta', $props)) {
            $factura->setPrecioVenta($props['precioVenta']);
        }
        
        if (array_key_exists('iva', $props)) {
            $factura->setIva($props['iva']);
        }
 
    }
      
    private function getParametros(DetalleFactura $pro){
              
        $parametros = array(
            ':idFactura' => $pro->getIdFactura(),
            ':idProducto' => $pro->getIdProducto(),
            ':cantidad' => $pro->getCantidad(),
            ':precioVenta' => $pro->getPrecioVenta(),
            ':iva' => $pro->getIva()
        );
        return $parametros;
    }

     public function leerProductosPorIdFactura($idFactura){
        $sql = "SELECT * FROM detallefactura dp, producto p WHERE dp.idProducto=p.idProducto AND dp.idFactura=".$idFactura;
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
    
        public function crearDetalleProducto(DetalleFactura $factura) {
        $sql = "INSERT INTO detallefactura (idFactura, idProducto, cantidad, precioVenta, iva) VALUES ( :idFactura, :idProducto, :cantidad, :precioVenta,:iva)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($factura));
        }
        
        public function leerPagosPorIdProductoyRangoFecha($idProducto,$inicio,$fin){
        $sql = "SELECT dp.idFactura, dp.idProducto, dp.cantidad, dp.precioVenta, dp.iva, f.fecha FROM detallefactura dp, factura f WHERE dp.idFactura=f.idFactura AND dp.idProducto='".$idProducto."' AND f.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY f.fecha DESC";
        $this->__setSql($sql);
        return $this->consultar($sql);
        }
        
        public function leerServiciosPorIdPersonayRangoFecha($idPersona,$inicio,$fin){
        $sql = "SELECT f.idFactura, p.nombres, p.sApellido, p.pApellido, f.fecha, (SELECT sum( ( dp.precioVenta + (dp.precioVenta * (dp.iva/100)) )*  dp.cantidad) FROM detallefactura dp WHERE dp.idFactura=f.idFactura) as precio FROM factura f, persona p WHERE f.idFarmaceutico=p.idPersona AND f.idFarmaceutico=".$idPersona." AND f.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY f.fecha DESC";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
}

?>