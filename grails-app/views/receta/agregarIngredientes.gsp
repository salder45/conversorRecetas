<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
      <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" align="left" class="name"><g:message code="receta.nombre.label" default="Nombre" /></td>
          <td valign="top" align="left" class="value">${fieldValue(bean: receta, field: "nombre")}</td>
          <td valign="top" align="left" class="name"><g:message code="receta.numPorciones.label" default="Num Porciones" /></td>
          <td valign="top" align="left" class="value">${fieldValue(bean: receta, field: "numPorciones")}</td>
          </tr>
        </table>
      </div>
      <div>
        <table>
          <tbody>
              <td valign="top" align="left" class="name"><g:message code="receta.nombre.label" default="Nombre Materia" /></td>
              <td valign="top" align="left" class="name"><g:message code="receta.nombre.label" default="Cantidad" /></td>
              <td valign="top" align="left" class="name"><g:message code="receta.nombre.label" default="Unidad Medida" /></td>
          </tbody>
        <td valign="top" class="value ${hasErrors(bean: receta, field: 'ingredientes', 'errors')}">
        <g:each in="${receta?.ingredientes?}" var="i">
          <tr>
          <td valign="top" align="left" class="value">${i.materia.nombre}</td>
          <td valign="top" align="left" class="value">${i.cantidad}</td>
          <td valign="top" align="left" class="value">${i.materia.unidadMedida}</td>
          </tr>
        </g:each>
        </td>
        </table>
      </div>
      <div>
        <g:form action="addIngrediente">
          <tr>
          <g:hiddenField name="idReceta" value="${receta?.id}" />
          <tr class="prop">
            <td valign="top" class="name">
              <label for="nombreMateria"><g:message code="receta.numPorciones.label" default="Nombre Materia" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: materiaPrima, field: 'nombre', 'errors')}">
          <g:textField name="nombre" value="${fieldValue(bean: materiaPrima, field: 'nombre')}" />
          </td>
          <td>
            <label for="nombreMateria"><g:message code="receta.numPorciones.label" default="Cantidad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'cantidad', 'errors')}">
          <g:textField name="cantidad" value="${fieldValue(bean: ingrediente, field: 'cantidad')}" />
          </td>
          <td valign="top" class="name">
            <label for="unidadMedida"><g:message code="materiaPrima.unidadMedida.label" default="Unidad Medida" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'unidadMedida', 'errors')}">
          <g:select name="unidadMedida" from="${ingrediente.constraints.unidadMedida.inList}" value="${ingrediente?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"  />
          </td>
          </tr>
          <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
          </tr>
        </g:form>
      </div>
      <div class="buttons">
        <g:form>
          <g:hiddenField name="id" value="${receta?.id}" />
          <span class="button"><g:actionSubmit class="edit" action="editar" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
          <span class="button"><g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </g:form>
      </div>
    </div>
  </body>
</html>