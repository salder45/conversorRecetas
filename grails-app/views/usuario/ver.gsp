
<%@ page import="org.comedor.Usuario" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="usuario.ver" args="[entityName]" /></title>
</head>
<body>
  <!--div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
  </div-->
  <div class="body">
    <h1><g:message code="usuario.ver" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
      <table>
        <tbody>

          <tr class="prop">
            <td valign="top" class="name"><g:message code="usuario.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: usuario, field: "id")}</td>

        </tr>
        <tr class="prop">
          <td valign="top" class="name"><g:message code="usuario.nombre.label" default="Nombre" /></td>

        <td valign="top" class="value">${fieldValue(bean: usuario, field: "nombre")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="usuario.apPaterno.label" default="Apellido Paterno" /></td>

        <td valign="top" class="value">${fieldValue(bean: usuario, field: "apPaterno")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="usuario.apMaterno.label" default="Apellido Materno" /></td>

        <td valign="top" class="value">${fieldValue(bean: usuario, field: "apMaterno")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="usuario.username.label" default="Username" /></td>

        <td valign="top" class="value">${fieldValue(bean: usuario, field: "username")}</td>

        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form>
        <g:hiddenField name="id" value="${usuario?.id}" />
        <span class="button"><g:actionSubmit class="edit" action="editar" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
        <span class="button"><g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </g:form>
    </div>
  </div>
</body>
</html>
