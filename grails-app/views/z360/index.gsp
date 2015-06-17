<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>主坦克</title>
	</head>
	<body>

		<div id="zhuYe" class="clearfix defaultPage">

			<g:render template="/layouts/plugins/faBuFanKui" />
			<hr />

			<g:render template="/layouts/plugins/baiDuZhanNei"/>
			<hr/>
			
			<g:if test="${shiTiInstanceList}">
				<div id="shiTi-wrapper">
				
					<div id="shiTi-load">
						<ul>
							<g:each in="${shiTiInstanceList}" status="i" var="shiTiInstance">
								<li>
									<h1>${ shiTiInstance.biaoTi }</h1>
									
									<div style="float:right;">
										<strong class="yongHu">
											${ shiTiInstance.getYongHuAsString() }
										</strong>
										<span class="separator">/</span>
										<span class="dateCreated">
											<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
										</span>
										<span class="separator">/</span>
										<span class="id">
											${ shiTiInstance.id }
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
						
						<hr />
					</div>
					
				</div>
				
				<g:javascript>
					paginate("#shiTi-wrapper", "#shiTi-load");
				</g:javascript>
			</g:if>
			
		</div>

	</body>
</html>