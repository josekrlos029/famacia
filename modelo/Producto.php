<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author JoseJimenez  
 */
Class Producto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idProducto;
    private $nombre;
    private $precio;
    private $iva;
    private $unidades;
    private $codigo;
    private $unidadPrincipal;
    private $comision;
    private $idLaboratorio;
    private $estante;
    
    public function getIdProducto() {
        return $this->idProducto;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getPrecio() {
        return $this->precio;
    }

    public function getIva() {
        return $this->iva;
    }

    public function getUnidades() {
        return $this->unidades;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    public function setIva($iva) {
        $this->iva = $iva;
    }

    public function setUnidades($unidades) {
        $this->unidades = $unidades;
    }
    function getCodigo() {
        return $this->codigo;
    }

    function setCodigo($codigo) {
        $this->codigo = $codigo;
    }
    
    function getUnidadPrincipal() {
        return $this->unidadPrincipal;
    }

    function setUnidadPrincipal($unidadPrincipal) {
        $this->unidadPrincipal = $unidadPrincipal;
    }
    
    function getComision() {
        return $this->comision;
    }

    function setComision($comision) {
        $this->comision = $comision;
    }

    function getIdLaboratorio() {
        return $this->idLaboratorio;
    }

    function getIdEstante() {
        return $this->estante;
    }

    function setIdLaboratorio($idLaboratorio) {
        $this->idLaboratorio = $idLaboratorio;
    }

    function setIdEstante($estante) {
        $this->estante = $estante;
    }

            
    private function mapearProducto(Producto $producto, array $props) {
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('nombre', $props)) {
            $producto->setNombre($props['nombre']);
        }
         if (array_key_exists('descripcion', $props)) {
            $producto->setDescripcion($props['descripcion']);
        }
         if (array_key_exists('precio', $props)) {
            $producto->setPrecio($props['precio']);
        }
        if (array_key_exists('iva', $props)) {
            $producto->setIva($props['iva']);
        }
        if (array_key_exists('descuento', $props)) {
            $producto->setDescuento($props['descuento']);
        }
        if (array_key_exists('unidades', $props)) {
            $producto->setUnidades($props['unidades']);
        }
        if (array_key_exists('codigo', $props)) {
            $producto->setCodigo($props['codigo']);
        }
        if (array_key_exists('unidadPrincipal', $props)) {
            $producto->setUnidadPrincipal($props['unidadPrincipal']);
        }
        if (array_key_exists('comision', $props)) {
            $producto->setComision($props['comision']);
        }
        if (array_key_exists('idLaboratorio', $props)) {
            $producto->setIdLaboratorio($props['idLaboratorio']);
        }
        if (array_key_exists('estante', $props)) {
            $producto->setIdEstante($props['estante']);
        }
 
    }
      
    private function getParametros(Producto $pro){
              
        $parametros = array(
            ':nombre' => $pro->getNombre(),
            ':precio' => $pro->getPrecio(),
            ':iva' => $pro->getIva(),
            ':unidadPrincipal' => $pro->getUnidadPrincipal(),
            ':comision' => $pro->getComision(),
            ':unidades' => $pro->getUnidades(),
            ':codigo' => $pro->getCodigo(),
            ':estante' => $pro->getIdEstante(),
            ':idLaboratorio' => $pro->getIdLaboratorio()
        );
        return $parametros;
    }
    
    private function getParametrosAct(Producto $pro){
              
        $parametros = array(
            ':idProducto' => $pro->getIdProducto(),
            ':nombre' => $pro->getNombre(),
            ':precio' => $pro->getPrecio(),
            ':iva' => $pro->getIva(),
            ':unidadPrincipal' => $pro->getUnidadPrincipal(),
            ':comision' => $pro->getComision(),            
            ':codigo' => $pro->getCodigo(),
            ':estante' => $pro->getIdEstante(),
            ':idLaboratorio' => $pro->getIdLaboratorio()
        );
        return $parametros;
    }

    
    public function leerProductos() {
        $sql = "SELECT * FROM producto";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $productos = array();
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            $productos[$producto->getIdProducto()] = $producto;
        }
        return $productos;
    }
        
    public function crearProducto(Producto $producto) {
        $sql = "INSERT INTO producto (nombre, precio, iva, unidadPrincipal, comision, unidades, codigo, idLaboratorio, estante) VALUES (:nombre, :precio, :iva, :unidadPrincipal, :comision, :unidades, :codigo, :idLaboratorio, :estante)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($producto));
    }
    
    public function actualizarProducto(Producto $producto) {
        $sql = "UPDATE producto SET nombre =:nombre, precio=:precio, iva=:iva, unidadPrincipal=:unidadPrincipal, comision=:comision, codigo=:codigo, idLaboratorio=:idLaboratorio, estante=:estante WHERE idProducto=:idProducto";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametrosAct($producto));
    }
    
    public function leerProductoPorId($idProducto) {
        $sql = "SELECT * FROM producto WHERE idProducto=".$idProducto;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $producto = NULL;
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            
        }
        return $producto;
    }
    
    public function leerProductoPorCodigo($codigo) {
        $sql = "SELECT * FROM producto WHERE codigo='".$codigo."'";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $producto = NULL;
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            
        }
        return $producto;
    }
    
    public function leerIngresoProducto($idProducto) {
        $sql = "SELECT * FROM ingresoproducto ip, compra c WHERE c.idCompra = ip.idCompra AND ip.idProducto=".$idProducto." ORDER BY c.fecha DESC";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        
        return $resultado;
    }
    
     public function actualizarUnidades($idProducto, $cantidad) {
           $sql = "UPDATE producto SET unidades=:unidades WHERE idProducto=:idProducto";
        $this->__setSql($sql);
        $this->ejecutar(array(":unidades"=>$cantidad, "idProducto"=>$idProducto));
        
    }
    
    public function crearPresentacionProducto($idProducto, $nombre, $cantidad) {
        $sql = "INSERT INTO presentacionproducto (idProducto, nombre, cantidad) VALUES (:idProducto, :nombre, :cantidad)";
        $this->__setSql($sql);
        $this->ejecutar(array(":idProducto" => $idProducto, ":nombre" => $nombre, ":cantidad" => $cantidad));
    }
    
    public function leerPresentacionesProducto($idProducto) {
        $sql = "SELECT p.*, pp.cantidad, pp.idPresentacion, pp.nombre as nombreP FROM producto p, presentacionproducto pp WHERE p.idProducto = pp.idProducto AND pp.idProducto=" . $idProducto;
        $this->__setSql($sql);
        return $resultado = $this->consultar($sql);
    }
    
    public function leerPresentacionPorId($idPresentacion) {
        $sql = "SELECT * FROM presentacionproducto WHERE idPresentacion=" . $idPresentacion;
        $this->__setSql($sql);
        return $resultado = $this->consultar($sql);
    }
    
    public function eliminarPresentacionProducto($idPresentacion){
        $sql = "DELETE FROM presentacionproducto WHERE idPresentacion = :idPresentacion";
        $this->__setSql($sql);
        $this->ejecutar(array(":idPresentacion" => $idPresentacion));
    }
    
    
}
?>