<html>
  <head>
    <title><g:message code="admin.titulo"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home"/></a></span>
      <span class="menuButton"><g:link class="usuario" controller="usuario" ><g:message code="inicio.usuario"/></g:link></span>
      <sec:ifAnyGranted roles="ROLE_SUPER">
      <span class="menuButton"><g:link class="rol" controller="rol" ><g:message code="inicio.rol"/></g:link></span>
      </sec:ifAnyGranted>
    </div>
  </body>
</html>
