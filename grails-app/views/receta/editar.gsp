

<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.core.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.widget.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.position.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.autocomplete.min.js')}"></script>


  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/external',file:'jquery.bgiframe-2.1.2.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.mouse.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.button.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.draggable.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.resizable.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.dialog.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.effects.core.js')}"></script>  
</head>
<body>
  <div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${receta}">
      <div class="errors">
        <g:renderErrors bean="${receta}" as="list" />
      </div>
    </g:hasErrors>
    <div class="dialog">
      <table>
        <tbody>
        <g:form method="post" >
          <g:hiddenField name="id" value="${receta?.id}" />
          <g:hiddenField name="version" value="${receta?.version}" />
          <tr class="prop">
            <td valign="top" class="name">
              <label for="nombre"><g:message code="receta.nombre.label" default="Nombre" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'nombre', 'errors')}">
          <g:textField name="nombre" maxlength="64" value="${receta?.nombre}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="procedimiento"><g:message code="receta.procedimiento.label" default="Procedimiento" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'procedimiento', 'errors')}">
          <g:textArea name="procedimiento" cols="40" rows="5" value="${receta?.procedimiento}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="numPorciones"><g:message code="receta.numPorciones.label" default="Num Porciones" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: receta, field: 'numPorciones', 'errors')}">
          <g:textField name="numPorciones" value="${fieldValue(bean: receta, field: 'numPorciones')}" />
          </td>
          </tr>
          <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="actualizar" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
            <span class="button"><g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
          </div>
        </g:form>
        <table>
          <thead>
          <td valign="top" class="name">
            <label for="nombre"><g:message code="materiaPrima.titulo" default="Nombre" /></label>
          </td>
          <td valign="top" class="name">
            <label for="nombre"><g:message code="ingrediente.cantidad" default="Nombre" /></label>
          </td>
          <td valign="top" class="name">
            <label for="nombre"><g:message code="ingrediente.presentacion" default="Nombre" /></label>
          </td>
          <td valign="top" class="name">
            <label for="nombre"><g:message code="ingrediente.unidadMedida" default="Nombre" /></label>
          </td>          
          <td>
            <br/>
          </td>
          </thead>
          <tbody>
          <g:each in="${receta.ingredientes}" var="i">
            <tr>
              <td valign="top" align="left" class="value">${i.materia.nombre}</td>
              <td valign="top" align="left" class="value">${i.cantidad}</td>
              <td valign="top" align="left" class="value">${i.presentacion}</td>
              <td valign="top" align="left" class="value">${i.unidadMedida}</td>              
              <td valign="top" align="left" class="value"><g:link controller="ingrediente" action="eliminar" id="${i.id}"><g:message code="ingrediente.eliminar" default="Eliminar" /></g:link></td>         
              </tr></g:each>
          <tr>
            <td valign="top" class="name">
              <button id="desplegar">Agregar</button>
            </td>
          </tr>
          </tbody>
        </table>
        </tbody>
      </table>
    </div>    
  </div>
  <div id="form-add">
    <g:form action="agregaIngrediente">
      <g:hiddenField name="id" value="${receta?.id}" />
      <table>
        <thead>
        <td valign="top" class="name">
          <label for="nombre"><g:message code="materiaPrima.titulo" default="Nombre" /></label>
        </td>
        <td valign="top" class="name">
          <label for="nombre"><g:message code="ingrediente.presentacion" default="Nombre" /></label>
        </td>
        <td valign="top" class="name">
          <label for="nombre"><g:message code="ingrediente.cantidad" default="Nombre" /></label>
        </td>
        <td valign="top" class="name">
          <label for="nombre"><g:message code="ingrediente.unidadMedida" default="Nombre" /></label>
        </td>
        <td>
          <br/>
        </td>
        </thead>
        <tbody>
          <tr>
            <td valign="top" class="value ${hasErrors(bean: materiaPrima, field: 'nombre', 'errors')}">
        <g:textField name="nombreMateria" value="${fieldValue(bean: materiaPrima, field: 'nombre')}" />
        </td>
        <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'presentacion', 'errors')}">
        <g:textField name="presentacion" value="${fieldValue(bean: ingrediente, field: 'presentacion')}" />
        </td>
        <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'cantidad', 'errors')}">
        <g:textField name="cantidad" value="${fieldValue(bean: ingrediente, field: 'cantidad')}" />
        </td>
        <td valign="top" class="value ${hasErrors(bean: ingrediente, field: 'unidadMedida', 'errors')}">
        <g:select name="unidadMedida" from="${ingrediente.constraints.unidadMedida.inList}" value="${ingrediente?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"  />
        </td>
        <td>
          <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
        </td>
        </tr>
        </tbody>
      </table>      
    </g:form>
  </div>  
<g:javascript>
  $(document).ready(function() {
  $("#form-add").dialog({autoOpen:false,
  height: 150,width: 750,modal: true});
  $("#desplegar").button().click(function(){
  $("#form-add").dialog("open");
  });
  $("input#nombreMateria").autocomplete({source: "${request.getContextPath()}/materiaPrima/materiasByNombre"});
$("input#nombreMateria").focus();});


</g:javascript>
</body>
</html>
