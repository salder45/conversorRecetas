

<%@ page import="org.comedor.MateriaPrima" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div-->
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${materiaPrimaInstance}">
            <div class="errors">
                <g:renderErrors bean="${materiaPrimaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${materiaPrimaInstance?.id}" />
                <g:hiddenField name="version" value="${materiaPrimaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="materiaPrima.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: materiaPrimaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="64" value="${materiaPrimaInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unidadMedida"><g:message code="materiaPrima.unidadMedida.label" default="Unidad Medida" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: materiaPrimaInstance, field: 'unidadMedida', 'errors')}">
                                    <g:select name="unidadMedida" from="${materiaPrimaInstance.constraints.unidadMedida.inList}" value="${materiaPrimaInstance?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
