

<%@ page import="org.comedor.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuario}">
            <div class="errors">
                <g:renderErrors bean="${usuario}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${usuario?.id}" />
                <g:hiddenField name="version" value="${usuario?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="usuario.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${usuario?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="usuario.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${usuario?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="accountExpired"><g:message code="usuario.accountExpired.label" default="Account Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${usuario?.accountExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="accountLocked"><g:message code="usuario.accountLocked.label" default="Account Locked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${usuario?.accountLocked}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apMaterno"><g:message code="usuario.apMaterno.label" default="Apellido Materno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'apMaterno', 'errors')}">
                                    <g:textField name="apMaterno" value="${usuario?.apMaterno}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apPaterno"><g:message code="usuario.apPaterno.label" default="Apellido Paterno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'apPaterno', 'errors')}">
                                    <g:textField name="apPaterno" value="${usuario?.apPaterno}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="usuario.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${usuario?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enabled"><g:message code="usuario.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${usuario?.enabled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${usuario?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passwordExpired"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuario, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${usuario?.passwordExpired}" />
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
