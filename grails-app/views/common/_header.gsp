<h1><a class="home" href="${createLinkTo(dir:'')}" style="color:white;font-weight:normal;">SAUM</a></h1>
<div id="status">
    <sec:ifLoggedIn>
        Bienvenido <sec:loggedInUserInfo field="username" /><br/>
        <g:link class="perfil" controller="logout" style="color:white;font-weight:normal;"><g:message code="inicio.salir" /></g:link>
    </sec:ifLoggedIn>
  
  
</div>
<sec:ifLoggedIn>
<script type="text/javascript" >
  var timeout	= 500;
var closetimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 
</script>

<ul id="sddm">
  <li><a  href="${resource(dir: '')}">Home</a></li>
    <li><a href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()">Usuario</a>
        <div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
          <g:link controller="usuario" action='lista' >Buscar</g:link>
          <g:link controller="usuario" action='crear' >Crear</g:link>
        </div>
    </li>
    <li><a href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()">Receta</a>
    <div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
       <g:link controller="receta" action='capturaDatosConversor' >Convertir</g:link>
        <g:link controller="receta" action='buscarReceta' >Buscar</g:link>
          <g:link controller="receta" action='crear' >Crear</g:link>
          <!--
          <g:link controller="receta" action='capturaDatosEditar' >Editar</g:link>-->
        </div>
    </li>
    <li><a href="#" onmouseover="mopen('m3')" onmouseout="mclosetime()">Ingrediente</a>
    <div id="m3" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
        <g:link controller="materiaPrima" action='buscarMateriaPrima' >Buscar</g:link>
         <g:link controller="materiaPrima" action='crear' >Crear</g:link>
        </div>
    </li>
    
</ul>
<div style="clear:both"></div>
</sec:ifLoggedIn>