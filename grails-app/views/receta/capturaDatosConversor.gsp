<html>
  <head>
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
     <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.core.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.widget.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.position.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.autocomplete.min.js')}"></script>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="inicio.home" /></a> </span>
    <span class="menuButton"><g:link class="salir" controller="receta" action='crear' ><g:message code="receta.crear" /></g:link></span>
    <span class="menuButton"><g:link class="salir" controller="logout" ><g:message code="inicio.salir" /></g:link></span>
  </div>
  <div class="body">
    <g:form action="convertirReceta">
      <table>
        <thead>
          <tr>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'nombre', 'errors')}">
        <g:message code="receta.nombre" default="Nombre" />
        <g:textField name="nombre" maxlength="128" value="${receta?.nombre}" />
        </td>
        <td valign="top" class="value ${hasErrors(bean: receta, field: 'numPorciones', 'errors')}">
        <g:message code="receta.porciones" default="Porciones" />
        <g:textField name="numPorciones" value="${fieldValue(bean: receta, field: 'numPorciones')}" />
        </td>
        <td>
          <span class="button"><g:submitButton name="convertir" class="save" value="${message(code: 'receta.convertir', default: 'Convertir Receta')}" /></span>
        </td>
        </tr>
        </thead>
      </table>
    </g:form>
  </div>
  <g:javascript>
  $(document).ready(function() {
  $("input#nombre").autocomplete({source: "${request.getContextPath()}/receta/recetasByNombre"});
  $("input#nombre").focus();});
</g:javascript>
</body>
</html>
