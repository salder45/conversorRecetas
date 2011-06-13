
<%@ page import="org.comedor.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div-->
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
                                                
                            <g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />
                        
                            <g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />

                            <g:sortableColumn property="apPaterno" title="${message(code: 'usuario.apPaterno.label', default: 'Apellido Paterno')}" />

                            <g:sortableColumn property="apMaterno" title="${message(code: 'usuario.apMaterno.label', default: 'Apellido Materno')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioList}" status="i" var="usuario">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="ver" id="${usuario.id}">${fieldValue(bean: usuario, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuario, field: "username")}</td>
                                                
                            <td><g:formatBoolean boolean="${usuario.accountExpired}" /></td>
                        
                            <td><g:formatBoolean boolean="${usuario.accountLocked}" /></td>
                        
                            <td>${fieldValue(bean: usuario, field: "nombre")}</td>
                            <td>${fieldValue(bean: usuario, field: "apPaterno")}</td>
                            <td>${fieldValue(bean: usuario, field: "apMaterno")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioTotal}" />
            </div>
        </div>
    </body>
</html>
