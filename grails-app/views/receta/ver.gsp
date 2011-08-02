
<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.core.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.widget.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/minified',file:'jquery.ui.position.min.js')}"></script>
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
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
      <table>
        <tbody>
          <!--                   
                                 <tr class="prop">
                                     <td valign="top" class="name"><g:message code="receta.id.label" default="Id" /></td>
                                     
                                     <td valign="top" class="value">${fieldValue(bean: receta, field: "id")}</td>
                                     
                                 </tr>-->

          <tr class="prop">
            <td valign="top" class="name"><g:message code="receta.nombre.label" default="Nombre" /></td>

        <td valign="top" class="value">${fieldValue(bean: receta, field: "nombre")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="receta.procedimiento.label" default="Procedimiento" /></td>

        <td valign="top" class="value">${fieldValue(bean: receta, field: "procedimiento")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="receta.numPorciones.label" default="Num Porciones" /></td>

        <td valign="top" class="value">${fieldValue(bean: receta, field: "numPorciones")}</td>

        </tr>

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
            </tr>
          </g:each>
          </tbody>
        </table>
        <tr>
          <td valign="top" class="name">
            <button id="desplegar"><label for="nombre"><g:message code="receta.convertir" default="Nombre" /></label></button>
          </td>
        <tr/>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form method="post" controller="receta">
        <g:hiddenField name="id" value="${receta?.id}" />
        <span class="button"><g:actionSubmit class="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" onclick="this.form.action='${createLink(action:'editar')}/${receta?.id}';"/></span>
        <span class="button"><g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </g:form>
    </div>  
  </div>
    <div id="conversion-div">
    <g:form action="convertirReceta">
      <g:hiddenField name="id" value="${receta?.id}"/>
      <tr class="prop">
        <td valign="top" class="name">
          <label for="porcionesAConvertir"><g:message code="receta.convertir" default="Receta" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: receta, field: 'nombre', 'errors')}">
      <g:textField name="porcionesAConvertir" value="${porcionesAConvertir}" />
      </td>
      </tr>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'receta.convertir', default: 'Convertir')}" /></span>
      </div>
    </g:form>    
  </div>
<g:javascript>
  $(document).ready(function() {
  $("#conversion-div").dialog({autoOpen:false,
  height: 100,
			width: 250,
			modal: true});
  $("#desplegar").button().click(function(){
$("#conversion-div").dialog("open");
});
});


</g:javascript>
</body>
</html>
