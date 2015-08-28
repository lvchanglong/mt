<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>

		<g:render template="/layouts/plugins/faBuFanKui" />
		
		<div class="row" style="padding-top:30px;">
		
			<div class="col-md-8">
				<g:if test="${kongJianInstanceList}">
					<div id="kongJian-wrapper">
						<div id="kongJian-load">
							<ul>
								<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
									<li>
										<div class="midTitle">
											<div class="cont">
												<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
													<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();"><span class="glyphicon glyphicon-edit"></span></g:link>
												</g:if>
												${ kongJianInstance.biaoTi }
											</div>
										</div>
										<div class="neiRong clearfix">
											<div class="row">
												<g:if test="${kongJianInstance?.miaoShu}">
													<div class="col-md-12">
														${kongJianInstance?.miaoShu}
													</div>
												</g:if>
												<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
													<g:if test="${ shiTiInstance }">
														<div class="col-md-12">
															<div class="borderBottomBox">
																<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
																	<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="listTitle mb10 inlineBlock link">
																		<span class="glyphicon glyphicon-edit"></span>
																	</g:link>
																</g:if>
																
																<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="listTitle mb10 inlineBlock link">
																	${ shiTiInstance.id }&nbsp;${ shiTiInstance.biaoTi }
																</g:link>
																
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
			</div><%--col-md-end--%>
			
			<div class="col-md-4">
				<div class="row">
					<g:each in="${ShiTi.list()}" status="j" var="shiTiInstance">
						<g:if test="${ shiTiInstance }">
							<div class="col-md-12">
								<div class="mb10">
									<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
										<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();">
											<span class="glyphicon glyphicon-edit"></span>
										</g:link>
									</g:if>
									<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank">
										${ shiTiInstance.id }&nbsp;${ shiTiInstance.biaoTi }
									</g:link>
								</div>
							</div>
						</g:if>
					</g:each>
				</div>
			</div><%--col-md-end--%>
				
		</div>
		
		<div style="display:none;">
			<g:render template="/layouts/plugins/baiDuZhanNei"/>
		</div>
		
	</body>
</html>