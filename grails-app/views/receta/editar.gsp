

<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${receta}">
      <div class="errors">
        <g:renderErrors bean="${receta}" as="list" />
      </div>
    </g:hasErrors>
    <g:form method="post" >
      <g:hiddenField name="id" value="${receta?.id}" />
      <g:hiddenField name="version" value="${receta?.version}" />
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="nombre"><g:message code="receta.nombre.label" default="Nombre" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: receta, field: 'nombre', 'errors')}">
          <g:textField name="nombre" maxlength="64" value="${receta?.nombre}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="numPorciones"><g:message code="receta.numPorciones.label" default="Num Porciones" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'numPorciones', 'errors')}">
          <g:textField name="numPorciones" value="${fieldValue(bean: receta, field: 'numPorciones')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="ingredientes"><g:message code="receta.ingredientes.label" default="Ingredientes" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'ingredientes', 'errors')}">

              <ul>
                <g:each in="${receta?.ingredientes?}" var="i">
                  <li><g:link controller="ingrediente" action="ver" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                </g:each>
              </ul>
          <g:link controller="ingrediente" action="create" params="['receta.id': receta?.id]">${message(code: 'default.add.label', args: [message(code: 'ingrediente.label', default: 'Ingrediente')])}</g:link>

          </td>
          </tr>

          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:actionSubmit class="save" action="actualizar" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
        <span class="button"><g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
