
<%@ page import="org.comedor.MateriaPrima" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'materiaPrima.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'materiaPrima.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="unidadMedida" title="${message(code: 'materiaPrima.unidadMedida.label', default: 'Unidad Medida')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${materiaPrimaInstanceList}" status="i" var="materiaPrimaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${materiaPrimaInstance.id}">${fieldValue(bean: materiaPrimaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: materiaPrimaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: materiaPrimaInstance, field: "unidadMedida")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${materiaPrimaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
