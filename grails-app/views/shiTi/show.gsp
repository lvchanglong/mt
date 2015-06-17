
<%@ page import="mt.ShiTi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiTi.label', default: 'ShiTi')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shiTi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shiTi" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shiTi">
			
				<g:if test="${shiTiInstance?.yongHu}">
				<li class="fieldcontain">
					<span id="yongHu-label" class="property-label"><g:message code="shiTi.yongHu.label" default="Yong Hu" /></span>
					
						<span class="property-value" aria-labelledby="yongHu-label"><g:link controller="yongHu" action="show" id="${shiTiInstance?.yongHu?.id}">${shiTiInstance?.yongHu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${shiTiInstance?.biaoTi}">
				<li class="fieldcontain">
					<span id="biaoTi-label" class="property-label"><g:message code="shiTi.biaoTi.label" default="Biao Ti" /></span>
					
						<span class="property-value" aria-labelledby="biaoTi-label"><g:fieldValue bean="${shiTiInstance}" field="biaoTi"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shiTiInstance?.neiRong}">
				<li class="fieldcontain">
					<span id="neiRong-label" class="property-label"><g:message code="shiTi.neiRong.label" default="Nei Rong" /></span>
					
						<span class="property-value" aria-labelledby="neiRong-label"><g:fieldValue bean="${shiTiInstance}" field="neiRong"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shiTiInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="shiTi.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${shiTiInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${shiTiInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="shiTi.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${shiTiInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shiTiInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${shiTiInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
