<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
      <sec:ifAnyGranted roles="ROLE_ADMIN">
      <span class="menuButton"><g:link class="admin" controller="admin" ><g:message code="admin.titulo" /></g:link></span>
      </sec:ifAnyGranted>
      <span class="menuButton"><g:link class="salir" controller="receta" ><g:message code="receta.titulo" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
      </div>
  </body>
</html>
