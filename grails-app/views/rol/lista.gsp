
<%@ page import="org.comedor.Rol" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'rol.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="authority" title="${message(code: 'rol.authority.label', default: 'Authority')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${rolList}" status="i" var="rol">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="ver" id="${rol.id}">${fieldValue(bean: rol, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: rol, field: "authority")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${rolTotal}" />
            </div>
        </div>
    </body>
</html>
