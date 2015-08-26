<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>

		<div class="row">
			<div class="col-md-12">
			
				<g:if test="${kongJianInstanceList}">
					<div id="kongJian-wrapper">
						<div id="kongJian-load">
							<ul>
								<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
									<li>
										<h2 class="text-center mb30 bold">
											<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
												<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();">${ kongJianInstance.biaoTi }</g:link>
											</g:if>
											<g:else>
												${ kongJianInstance.biaoTi }
											</g:else>
										</h2>
										<div class="neiRong clearfix">
											<div class="row">
												<g:if test="${kongJianInstance?.miaoShu}">
													<div class="col-md-3">
														${kongJianInstance?.miaoShu}
													</div>
												</g:if>
												<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
													<g:if test="${ shiTiInstance }">
														<div class="col-md-3">
															<div class="smallBox">
																<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
																	<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="title mb30">
																		<i class="fa fa-desktop"></i>${ shiTiInstance.biaoTi }
																	</g:link>
																</g:if>
																<g:else>
																	<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="title mb30">
																		<i class="fa fa-desktop"></i>${ shiTiInstance.biaoTi }
																	</g:link>
																</g:else>
																<div class="neiRong">
																	${ shiTiInstance.neiRong }
																</div>
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
				
			</div>
			
			<div class="col-md-12">
				
				<hr/>
				
				<g:each in="${ShiTi.list()}" status="j" var="shiTiInstance">
					<g:if test="${ shiTiInstance }">
						<div class="col-md-4">
							<div class="smallBox">
								<span style="color:lightgray;margin-right:3px;">${ shiTiInstance.id }</span>
								<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
									<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="title">
										${ shiTiInstance.biaoTi }
									</g:link>
								</g:if>
								<g:else>
									<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="title">
										${ shiTiInstance.biaoTi }
									</g:link>
								</g:else>
							</div>
						</div>
					</g:if>
				</g:each>
			
			</div>
		</div>
		
		<div style="display:none;">
			<g:render template="/layouts/plugins/baiDuZhanNei"/>
		</div>
		
	</body>
</html>