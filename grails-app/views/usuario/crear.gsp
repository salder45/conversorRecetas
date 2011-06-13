

<%@ page import="org.comedor.Usuario" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="usuario.crear" args="[entityName]" /></title>
</head>
<body>
  <!--div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="lista"><g:message code="usuario.lista" args="[entityName]" /></g:link></span>
  </div-->
  <div class="body">
    <h1><g:message code="usuario.crear" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usuario}">
      <div class="errors">
        <g:renderErrors bean="${usuario}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="guardar" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="username"><g:message code="usuario.username" default="Username" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: usuario, field: 'username', 'errors')}">
          <g:textField name="username" value="${usuario?.username}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="password"><g:message code="usuario.password" default="Password" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuario, field: 'password', 'errors')}">
          <g:passwordField name="password" value="${usuario?.password}" />
          </td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="nombre"><g:message code="usuario.nombre" default="Nombre" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuario, field: 'nombre', 'errors')}">
          <g:textField name="nombre" value="${usuario?.nombre}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="apPaterno"><g:message code="usuario.apPaterno" default="Apellido Paterno" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuario, field: 'apPaterno', 'errors')}">
          <g:textField name="apPaterno" value="${usuario?.apPaterno}" />
          </td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="apMaterno"><g:message code="usuario.apMaterno" default="Apellido Materno" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuario, field: 'apMaterno', 'errors')}">
          <g:textField name="apMaterno" value="${usuario?.apMaterno}" />
          </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
