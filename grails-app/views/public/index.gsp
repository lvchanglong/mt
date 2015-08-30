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
											<div class="cont leftBorder">
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
												<div class="col-md-12 overflowHidden">
													<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
														<g:if test="${ shiTiInstance }">
															<div class="borderTopBox">
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
																
																<div class="text-left detail">
																	<span class="yongHu">
																		发布人：${shiTiInstance.getYongHuAsString()}
																	</span>
																	<span class="separator"></span>
																	<span class="dateCreated">
																		发布时间：<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
																	</span>
																	<span class="separator"></span>
																	<g:render template="/layouts/plugins/zhuanZai"/>
																</div>
															</div>
														</g:if>
													</g:each>
												</div>
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
				<div class="midTitle">
					<div class="cont leftPointer">
						联系站长
					</div>
				</div>
				<div class="paddingTB">
					<div class="row">
						<div class="col-md-12">
							<asset:image src="SuCai/个人微信.png" style="width:100%;" title="加我微信"/>
						</div>
					</div>
				</div>
				
				<div class="midTitle">
					<div class="cont leftPointer">
						手机版本
					</div>
				</div>
				<div class="paddingTB">
					<g:link controller="public" action="xiaZai" params="[filePath:'grails-app/assets/androids/lvchanglong.apk']" class="btn btn-default">安卓版应用下载</g:link>
				</div>
				
				<div class="midTitle">
					<div class="cont leftPointer">
						成长历程
					</div>
				</div>
				<div class="paddingTB">
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
				</div>
			</div><%--col-md-end--%>
				
		</div>
		
		<div style="display:none;">
			<g:render template="/layouts/plugins/baiDuZhanNei"/>
		</div>
		
	</body>
</html>