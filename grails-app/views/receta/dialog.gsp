

<%@ page import="org.comedor.Receta" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <g:javascript library="jquery" />
  <link rel="stylesheet" href="${resource(contextPath:"",dir:'css',file:'jquery.ui.all.css')}" />
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.core.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.widget.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.position.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.autocomplete.min.js')}"></script>
  <script type="text/javascript" src="${resource(contextPath:"",dir:'js/jquery',file:'jquery.ui.dialog.min.js')}"></script>
</head>
<body>
<g:javascript>
  $(function(){$("#prueba").dialog();}
);
</g:javascript>
<div class="demostracion">
<div id="prueba" title="Prueba basica">
<p>Dialog de Prueba</p>
</div>
<div class="hiddenInViewSource" style="padding:20px;">
<p>Prueba Texto Prueba</p>
<form>
<input value="text input"><br>
<input type="checkbox">checkbox<br>
<input type="radio">radio<br>
<select>
<option>select</option>
</select><br><br>
<textarea>textarea</textarea><br>
</form>
</div>

</div>
<div class="demo-description" style="display: none; ">
<p>The basic dialog window is an overlay positioned within the viewport and is protected from page content (like select elements) shining through with an iframe.  It has a title bar and a content area, and can be moved, resized and closed with the 'x' icon by default.</p>
</div><!-- End demo-description -->
</body>
</html>
