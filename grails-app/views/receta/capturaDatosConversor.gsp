<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
      <span class="menuButton"><g:link class="salir" controller="receta" action='crear' ><g:message code="receta.crear" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
    </div>
    <div class="body">
      <g:form action="convertirReceta">
        <table>
          <thead>
            <tr>              
              <td valign="top" class="value ${hasErrors(bean: receta, field: 'nombre', 'errors')}">
          <g:message code="receta.nombre" default="Nombre" />
          <g:textField name="nombre" value="${fieldValue(bean: receta, field: 'nombre')}" />
          </td>
          <td valign="top" class="value ${hasErrors(bean: receta, field: 'numPorciones', 'errors')}">
          <g:message code="receta.porciones" default="Porciones" />
          <g:textField name="numPorciones" value="${fieldValue(bean: receta, field: 'numPorciones')}" />
          </td>
          <td>
            <span class="button"><g:submitButton name="convertir" class="save" value="${message(code: 'receta.convertir', default: 'Convertir Receta')}" /></span>
          </td>
          </tr>
          </thead>
        </table>
      </g:form>
    </div>
  </body>
</html>
