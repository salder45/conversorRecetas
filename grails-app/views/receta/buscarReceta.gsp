
<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.core.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.widget.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.position.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.autocomplete.min.js')}"></script>
</head>
<body>        
  <div class="body">
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${receta}">
      <div class="errors">
        <g:renderErrors bean="${receta}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="ver">
      <table>
        <tbody>
          <tr class="prop">

            <td valign="top" class="name">
              <label for="nombre"><g:message code="recetaPrima.ingrediente" default="Ingrediente" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: recetaPrima , field: 'nombre', 'errors')}">
        <g:textField name="nombre" value="${receta?.nombre}" />      
        </tr>
        </tbody>
      </table>
      <div class="buttons">
        <span class="button"><g:submitButton name="editar" class="list" value="${message(code: 'receta.buscar.receta', default: 'Buscar')}" /></span>
      </div>
    </g:form>
  </div>
<g:javascript>
  $(document).ready(function() {
  $("input#nombre").autocomplete({source: "${request.getContextPath()}/receta/recetasByNombre"});
$("input#nombre").focus();});
</g:javascript>
</body>
</html>
