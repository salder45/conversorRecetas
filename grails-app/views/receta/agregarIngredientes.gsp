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
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="receta.nombre" default="Nombre" /></td>
          <td valign="top" class="value">${fieldValue(bean: receta, field: "nombre")}</td>
          <td valign="top" class="name"><g:message code="receta.porciones" default="Porciones" /></td>
          <td valign="top" class="value">${fieldValue(bean: receta, field: "numPorciones")}</td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.procedimiento" default="Procedimiento" /></td>
          <td valign="top" class="value">${fieldValue(bean: receta, field: "procedimiento")}</td>
          </tr>
          </tbody>
        </table>
        <g:form action="agregaIngrediente">
          <g:hiddenField name="idReceta" value="${receta?.id}" />
          <table>
            <thead>
              <tr>
                <td>
            <g:message code="receta.nombre" default="Nombre" />
            </td>
            <td>
            <g:message code="receta.porciones" default="Porciones" />
            </td>
            <td>
            <g:message code="receta.procedimiento" default="Procedimiento" />
            </td>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td valign="top" class="value ${hasErrors(bean: materiaPrima, field: 'nombre', 'errors')}">
            <g:textField name="nombre" value="${fieldValue(bean: materiaPrima, field: 'nombre')}" />
            </td>
            <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'cantidad', 'errors')}">
            <g:textField name="cantidad" value="${fieldValue(bean: ingrediente, field: 'cantidad')}" />
            </td>
            <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'unidadMedida', 'errors')}">
            <g:select name="unidadMedida" from="${ingrediente.constraints.unidadMedida.inList}" value="${ingrediente?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"  />
            </td>
            </tr>
            </tbody>
          </table>
          <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
          </div>
        </g:form>
      </div>
    </div>
  </body>
</html>
