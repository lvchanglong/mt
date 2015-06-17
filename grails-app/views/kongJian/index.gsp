
<%@ page import="mt.KongJian" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kongJian.label', default: 'KongJian')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-kongJian" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-kongJian" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="kongJian.yongHu.label" default="Yong Hu" /></th>
					
						<g:sortableColumn property="biaoTi" title="${message(code: 'kongJian.biaoTi.label', default: 'Biao Ti')}" />
					
						<g:sortableColumn property="neiRong" title="${message(code: 'kongJian.neiRong.label', default: 'Nei Rong')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'kongJian.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'kongJian.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${kongJianInstance.id}">${fieldValue(bean: kongJianInstance, field: "yongHu")}</g:link></td>
					
						<td>${fieldValue(bean: kongJianInstance, field: "biaoTi")}</td>
					
						<td>${fieldValue(bean: kongJianInstance, field: "neiRong")}</td>
					
						<td><g:formatDate date="${kongJianInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${kongJianInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${kongJianInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
