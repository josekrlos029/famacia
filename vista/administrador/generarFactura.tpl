<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<header>
    <style>
    #cont{
        line-height:0px
    }
    #cont p{
        font-size: 11px
    }
    #cont table{
        font-size: 11px
    }
</style>
<title>Factura de Venta N° <?php echo $idFactura; ?></title>
</header>
<body>
    <div id="cont">
    <br>
    <center><h4>Droguería San Miguel</h4></center>
    <center><h5>NIT. 36573581</h5></center>
    <center><h5>Trav 12 # 7 - 04 "20 de Noviembre"</h5></center>
    <center><h5>TEL: 3016571870</h5></center>
    <center><h5>La Jagua de Ibirico - Cesar</h5></center>
    <br>
    <p>Documento Equivalente a FACTURA DE VENTA</p>
    <p>No. <?php echo $idFactura; ?></p>
    <p>Fecha: <?php echo $f->getFecha(); ?></p>
    <p>CAJA: <?php echo $far->getNombres() . " " . $far->getPApellido(); ?></p>
    <br>
    <p>Cliente: <?php echo $p->getNombres() . " " . $p->getPApellido() . " " . $p->getSApellido(); ?></p>
    <p>C:C: <?php echo $p->getIdentificacion(); ?></p>
    <table style="width: 250px;" border="0">
        <tr>
            <th align="left" width="70%">DESCRIPCION</th>
            <th width="15%">IVA%</th>
            <th width="15%">VALOR</th>
        </tr>
        <?php 
        $suma=0;
        foreach ($detp as $det) { ?>
        <tr>
            <td><?php echo $det["cantidad"] . " - " . strtoupper(utf8_decode($det["nombre"])); ?></td>
            <td><?php echo $det["iva"] . "%"; ?></td>
            <td><?php echo ($det["precioVenta"] + (($det["iva"] / 100) * $det["precioVenta"])) * $det["cantidad"]; ?></td>
        </tr>
        <?php 
        $suma += ($det["precioVenta"] + (($det["iva"] / 100) * $det["precioVenta"])) * $det["cantidad"];
        }?>
    </table>
    <br>
    <p><b>TOTAL:</b> <?php echo $suma; ?></p>
    <br>
    <br>
    <center><p>leineryeliangie@hotmail.com - TEL: 3016571870</p></center>
    <center><p>GRACIAS POR PREFERIRNOS</p></center>
    <center><p>PARA RECLAMOS CONSERVE SU FACTURA</p></center>
</div>

</body>
</html>
