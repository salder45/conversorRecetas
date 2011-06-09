

<%@ page import="org.comedor.Ingrediente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ingredienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${ingredienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidad"><g:message code="ingrediente.cantidad.label" default="Cantidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'cantidad', 'errors')}">
                                    <g:textField name="cantidad" value="${fieldValue(bean: ingredienteInstance, field: 'cantidad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="materia"><g:message code="ingrediente.materia.label" default="Materia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'materia', 'errors')}">
                                    <g:select name="materia.id" from="${org.comedor.MateriaPrima.list()}" optionKey="id" value="${ingredienteInstance?.materia?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receta"><g:message code="ingrediente.receta.label" default="Receta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'receta', 'errors')}">
                                    <g:select name="receta.id" from="${org.comedor.Receta.list()}" optionKey="id" value="${ingredienteInstance?.receta?.id}"  />
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
