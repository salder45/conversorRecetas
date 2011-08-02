<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <!--div class="nav">
      <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
      <span class="menuButton"><g:link class="salir" controller="receta" action='crear' ><g:message code="receta.crear" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="receta" action='capturaDatosConversor' ><g:message code="receta.datos" /></g:link></span>
      <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
    </div-->
    <div class="body">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="receta.nombre.label" default="Nombre" /></td>
          <td valign="top" class="value">${fieldValue(bean: recetaConvertida, field: "nombre")}</td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.numPorciones.label" default="Num Porciones" /></td>
          <td valign="top" class="value">${fieldValue(bean: recetaConvertida, field: "numPorciones")}</td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.ingredientes.label" default="Ingredientes" /></td>
          <td valign="top" style="text-align: left;" class="value">
            <ul>
              <g:each in="${recetaConvertida.ingredientes}" var="i">
                <tr>
                  <td valign="top" align="left" class="value">${i.materia.nombre}</td>
                  <td valign="top" align="left" class="value">${i.cantidad}</td>
                  <td valign="top" align="left" class="value">${i.materia.unidadMedida}</td>
                </tr>
              </g:each>
            </ul>
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.procedimiento.label" default="Procedimiento" /></td>
          <td valign="top" class="value">${fieldValue(bean: recetaConvertida, field: "procedimiento")}</td>
          </tr>

          </tbody>
        </table>
      </div>
      <g:form action="reporte">
        <g:hiddenField name="nombre" value="${recetaConvertida?.nombre}" />
        <g:hiddenField name="porcionesAConvertir" value="${cantidadAConvertir}" />
        <div class="buttons">
          <span class="button"><g:submitButton name="imprimir" class="save" value="${message(code: 'inicio.print', default: 'Imprimir')}" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>
