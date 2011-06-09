<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
      <span class="menuButton"><g:link class="crear" controller="receta" action='crear' ><g:message code="receta.crear" /></g:link></span>
      <span class="menuButton"><g:link class="capturaDatos" controller="receta" action='capturaDatosConversor' ><g:message code="receta.datos" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="receta" action='capturaDatosEditar' ><g:message code="receta.editar" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
      </div>
  </body>
</html>
