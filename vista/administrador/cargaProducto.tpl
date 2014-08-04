<div  id="overlay"></div>
<div  id="mensaje">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>

</div>
<div style=" margin-left: 5%; margin-top: 5%">
    
    <h2>Carga por producto</h2><br>
    
    <table width="60%">
        <tr>
            <td align="right">Producto:</td>
            <td><select></select></td>
            <td style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTabla()">Buscar</button></td>
        </tr>
    </table>
    
    <div id="cargaTabla"></div>
</div>