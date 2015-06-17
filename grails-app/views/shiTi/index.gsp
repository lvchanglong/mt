
<%@ page import="mt.ShiTi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiTi.label', default: 'ShiTi')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shiTi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shiTi" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="shiTi.yongHu.label" default="Yong Hu" /></th>
					
						<g:sortableColumn property="biaoTi" title="${message(code: 'shiTi.biaoTi.label', default: 'Biao Ti')}" />
					
						<g:sortableColumn property="neiRong" title="${message(code: 'shiTi.neiRong.label', default: 'Nei Rong')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'shiTi.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'shiTi.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shiTiInstanceList}" status="i" var="shiTiInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shiTiInstance.id}">${fieldValue(bean: shiTiInstance, field: "yongHu")}</g:link></td>
					
						<td>${fieldValue(bean: shiTiInstance, field: "biaoTi")}</td>
					
						<td>${fieldValue(bean: shiTiInstance, field: "neiRong")}</td>
					
						<td><g:formatDate date="${shiTiInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${shiTiInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shiTiInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
