
<%@ page import="org.comedor.Ingrediente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'ingrediente.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cantidad" title="${message(code: 'ingrediente.cantidad.label', default: 'Cantidad')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'ingrediente.descripcion.label', default: 'Descripcion')}" />
                        
                            <th><g:message code="ingrediente.materia.label" default="Materia" /></th>
                        
                            <th><g:message code="ingrediente.receta.label" default="Receta" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ingredienteInstanceList}" status="i" var="ingredienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ingredienteInstance.id}">${fieldValue(bean: ingredienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "cantidad")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "materia")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "receta")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ingredienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
