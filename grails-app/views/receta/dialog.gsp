

<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery/external',file:'jquery.bgiframe-2.1.2.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.core.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.widget.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.mouse.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.button.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.draggable.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.position.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.resizable.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.dialog.js')}"></script>  
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.effects.core.js')}"></script>  
</head>
<body>
  <div id="form-dialog">
    <g:form>

      <table>
        <thead>
        <td valign="top" class="name">
          <label for="nombre"><g:message code="materiaPrima.titulo" default="Nombre" /></label>
        </td>
        </thead>
        <tbody>
          <tr>
            <td valign="top">
        <g:textField name="nombreMateria"/>
        <!--<td>
          <span class="button"><g:actionSubmit class="save" action="agregaIngrediente" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
</td>-->
</table>
</tbody>
</table>
</g:form>
</div>
<div>
<button id="desplegar">Test</button>
</div>
<g:javascript>
$(document).ready(function(){
$("#form-dialog").dialog({autoOpen:false});
$("#desplegar").button().click(function(){
$("#form-dialog").dialog("open");
});
}
);
</g:javascript>    
</body>
</html>
