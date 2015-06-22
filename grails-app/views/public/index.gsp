<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>主坦克</title>
	</head>
	<body>

		<div id="zhuYe" class="clearfix defaultPage">

			<g:if test="${shiTiInstanceList}">
				<div id="shiTi-wrapper">
				
					<div id="shiTi-load">
						<ul>
							<g:each in="${shiTiInstanceList}" status="i" var="shiTiInstance">
								<li>
									<h2><g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();">${ shiTiInstance.biaoTi }</g:link></h2>

									<div style="padding: 0 0 15px 0;color:#888888;">
										<span class="dateCreated">
											<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
										</span>
										<span class="separator"></span>
										<span class="id">
											代号：<span style="font-weight:bold;margin:0 10px;font-size:20px;">${ shiTiInstance.id }</span>
										</span>
									</div>
									
									<div style="clear:both;"></div>
									
									<div class="neiRong">${shiTiInstance.neiRong}</div>
								</li>
							</g:each>
						</ul>
						
						<div class="pagination">
							<g:paginate total="${shiTiInstanceCount}" params="[id:yongHuInstance?.id]"/>
						</div>
					</div>
					
				</div>
				
				<g:javascript>
					paginate("#shiTi-wrapper", "#shiTi-load");
				</g:javascript>
			</g:if>
			
			<div style="display:none;">
				<g:render template="/layouts/plugins/baiDuZhanNei"/>
			</div>
			
		</div>

	</body>
</html>