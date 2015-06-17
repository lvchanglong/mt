
<%@ page import="mt.FanKui" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fanKui.label', default: 'FanKui')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fanKui" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fanKui" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="fanKui.yongHu.label" default="Yong Hu" /></th>
					
						<g:sortableColumn property="neiRong" title="${message(code: 'fanKui.neiRong.label', default: 'Nei Rong')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'fanKui.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'fanKui.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fanKuiInstanceList}" status="i" var="fanKuiInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fanKuiInstance.id}">${fieldValue(bean: fanKuiInstance, field: "yongHu")}</g:link></td>
					
						<td>${fieldValue(bean: fanKuiInstance, field: "neiRong")}</td>
					
						<td><g:formatDate date="${fanKuiInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${fanKuiInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fanKuiInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
