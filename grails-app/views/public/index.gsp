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
			
			<g:if test="${kongJianInstanceList}">
				<div id="kongJian-wrapper">
				
					<div id="kongJian-load">
						<ul>
							<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
								<li>
									<h1>
										<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
											<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();">${ kongJianInstance.biaoTi }</g:link>
										</g:if>
										<g:else>
											${ kongJianInstance.biaoTi }
										</g:else>
									</h1>
									
									<div class="neiRong clearfix">
										<ul class="clearfix">
											<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
												<g:if test="${ shiTiInstance }">
													<li class="floatLeft w${ hmIW.get(j%9) }">
														<div class="box">
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
															
															<div class="phone">
																${ shiTiInstance.neiRong }
															</div>
														</div>
													</li>
												</g:if>
											</g:each>
										</ul>
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
			
		</div>

	</body>
</html>