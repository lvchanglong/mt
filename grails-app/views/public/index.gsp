<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>主坦克</title>
	</head>
	<body>

		<g:render template="/layouts/plugins/faBuFanKui" />
		
		<hr/>
		
		<g:if test="${kongJianInstanceList}">
			<div id="kongJian-wrapper">
				<div id="kongJian-load">
					<ul>
						<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
							<li>
								<h1 class="bold">
									<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
										<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();">${ kongJianInstance.biaoTi }</g:link>
									</g:if>
									<g:else>
										${ kongJianInstance.biaoTi }
									</g:else>
								</h1>
								<div class="neiRong clearfix">
									<div class="row">
										<div class="col-md-12">
											${kongJianInstance?.miaoShu}
										</div>
										<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
											<g:if test="${ shiTiInstance }">
												<div class="col-md-3">
													<div class="smallBox">
														<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
															<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="title">
																<i class="fa fa-desktop"></i>${ shiTiInstance.biaoTi }
															</g:link>
														</g:if>
														<g:else>
															<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="title">
																<i class="fa fa-desktop"></i>${ shiTiInstance.biaoTi }
															</g:link>
														</g:else>
													</div>
												</div>
											</g:if>
										</g:each>
									</div>
								</div>
							</li>
						</g:each>
					</ul>
					<div class="pagination" style="clear:both;">
						<g:paginate total="${kongJianInstanceCount}"/>
					</div>
				</div>
			</div>
			<g:javascript>
				paginate("#kongJian-wrapper", "#kongJian-load");
			</g:javascript>
		</g:if>
		
		<div style="display:none;">
			<g:render template="/layouts/plugins/baiDuZhanNei"/>
		</div>
		
	</body>
</html>