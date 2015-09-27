<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>历程${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<div class="row">
			<g:each in="${ShiTi.list()}" status="j" var="shiTiInstance">
				<g:if test="${ shiTiInstance }">
					<div class="col-md-12">
						<div class="mb10">
							<g:if test="${ YongHu.get(session.uid)?.shiFouGuanLiYuan() }">
								<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();">
									<span class="glyphicon glyphicon-edit"></span>
								</g:link>
							</g:if>
							<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="colorGray">
								${ shiTiInstance.id }&nbsp;${ shiTiInstance.biaoTi }
							</g:link>
						</div>
					</div>
				</g:if>
			</g:each>
		</div>
	</body>
</html>