
<%@ page import="org.comedor.Receta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'receta.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'receta.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="numPorciones" title="${message(code: 'receta.numPorciones.label', default: 'Num Porciones')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recetaList}" status="i" var="receta">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="ver" id="${receta.id}">${fieldValue(bean: receta, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: receta, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: receta, field: "numPorciones")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${recetaTotal}" />
            </div>
        </div>
    </body>
</html>
