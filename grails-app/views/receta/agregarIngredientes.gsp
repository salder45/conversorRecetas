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
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
      <table>
        <tbody>
          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.nombre" default="Nombre" /></td>
        <td valign="top" class="value">${fieldValue(bean: receta, field: "nombre")}</td>
        <td valign="top" class="name"><g:message code="receta.porciones" default="Porciones" /></td>
        <td valign="top" class="value">${fieldValue(bean: receta, field: "numPorciones")}</td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name"><g:message code="receta.procedimiento" default="Procedimiento" /></td>
        <td valign="top" class="value">${fieldValue(bean: receta, field: "procedimiento")}</td>
        </tr>
        </tbody>
      </table>
      <g:form action="agregaIngrediente">
        <g:hiddenField name="idReceta" value="${receta?.id}" />
        <table>
          <thead>
            <tr>
              <td>
          <g:message code="receta.nombre" default="Nombre" />
          </td>
          <td>
          <g:message code="receta.porciones" default="Porciones" />
          </td>
          <td>
          <g:message code="receta.procedimiento" default="Procedimiento" />
          </td>
          </tr>
          </thead>
          <tbody>
          <g:each in="${receta.ingredientes}" var="i">
            <tr>
              <td valign="top" align="left" class="value">${i.materia.nombre}</td>
              <td valign="top" align="left" class="value">${i.cantidad}</td>
              <td valign="top" align="left" class="value">${i.materia.unidadMedida}</td>              
            </tr>
          </g:each>
          <tr>
            <td valign="top" class="value ${hasErrors(bean: materiaPrima, field: 'nombre', 'errors')}">
          <g:textField name="nombre" value="${fieldValue(bean: materiaPrima, field: 'nombre')}" />
          </td>
          <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'cantidad', 'errors')}">
          <g:textField name="cantidad" value="${fieldValue(bean: ingrediente, field: 'cantidad')}" />
          </td>
          <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'unidadMedida', 'errors')}">
          <g:select name="unidadMedida" from="${ingrediente.constraints.unidadMedida.inList}" value="${ingrediente?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"  />
          </td>
          <td>
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'ingrediente.agregar', default: 'Create')}" /></span>
          </td>
          </tr>
          </tbody>
        </table>
      </g:form>
    </div>
  </div>

<g:javascript>
  $(document).ready(function() {
  $("input#nombre").autocomplete({source: "${request.getContextPath()}/materiaPrima/materiasByNombre"});
$("input#nombre").focus();});
</g:javascript>
</body>
</html>
