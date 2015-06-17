
<%@ page import="mt.FanKui" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fanKui.label', default: 'FanKui')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fanKui" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fanKui" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fanKui">
			
				<g:if test="${fanKuiInstance?.yongHu}">
				<li class="fieldcontain">
					<span id="yongHu-label" class="property-label"><g:message code="fanKui.yongHu.label" default="Yong Hu" /></span>
					
						<span class="property-value" aria-labelledby="yongHu-label"><g:link controller="yongHu" action="show" id="${fanKuiInstance?.yongHu?.id}">${fanKuiInstance?.yongHu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fanKuiInstance?.neiRong}">
				<li class="fieldcontain">
					<span id="neiRong-label" class="property-label"><g:message code="fanKui.neiRong.label" default="Nei Rong" /></span>
					
						<span class="property-value" aria-labelledby="neiRong-label"><g:fieldValue bean="${fanKuiInstance}" field="neiRong"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fanKuiInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="fanKui.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fanKuiInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fanKuiInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="fanKui.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${fanKuiInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fanKuiInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fanKuiInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
