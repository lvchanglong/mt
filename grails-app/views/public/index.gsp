<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>

		<div class="row" style="padding-top:30px;">
		
			<div class="col-md-8">
				<g:if test="${kongJianInstanceList}">
					<div id="kongJian-wrapper">
						<div id="kongJian-load">
							<ul>
								<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
									<li id="kj${ kongJianInstance.id }" class="anchor">anchor</li>
									<li>
										<div class="jumbotron mb0 mt15">
											<h1>
												<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
													<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();"><span class="glyphicon glyphicon-edit"></span></g:link>
												</g:if>
												${ kongJianInstance.biaoTi }
											</h1>
											<g:if test="${kongJianInstance?.fuJian}">
												<p>
													${kongJianInstance?.fuJian}
												</p>
											</g:if>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
													<g:if test="${ shiTiInstance }">
														<div class="borderBox">
															<div class="mh150">
																<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
																	<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="mb10 h1 link">
																		<span class="glyphicon glyphicon-edit"></span>
																	</g:link>
																</g:if>
																
																<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="mb10 h1 link">${ shiTiInstance.biaoTi }</g:link>
																
																<div class="content relative clearfix colorLight">
																	${ shiTiInstance.neiRong }
																</div>
																
																<div class="text-right detail block">
																	<span class="yongHu">
																		${shiTiInstance.getYongHuAsString()}
																	</span>
																	<span class="shortSeparator">|</span>
																	<span class="dateCreated">
																		<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy年MM月dd日" />
																	</span>
																	<span class="shortSeparator">|</span>
																	<g:render template="/layouts/plugins/zhuanZai"/>
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
				
				<div class="midTitle">
					<div class="cont leftPointer">
						快速通道
					</div>
				</div>
				<div class="paddingTB">
					<div class="row">
						<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
							<div class="col-md-6 col-xs-6 mb10">
								<a href="#kj${ kongJianInstance.id }" class="btn btn-default block colorGray">${ kongJianInstance.biaoTi }</a>
							</div>
						</g:each>
						<div class="col-md-12 col-xs-12">
							<g:render template="/layouts/plugins/baiDuZhanNei"/>
						</div>
					</div>
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
										<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="colorGray">
											${ shiTiInstance.id }&nbsp;${ shiTiInstance.biaoTi }
										</g:link>
									</div>
								</div>
							</g:if>
						</g:each>
					</div>
				</div>

				<div class="midTitle">
					<div class="cont leftPointer">
						手机版本
					</div>
				</div>
				<div class="paddingTB">
					<g:link controller="public" action="xiaZai" params="[filePath:'grails-app/assets/androids/lvchanglong.apk']" class="btn btn-primary">安卓版应用下载</g:link>
				</div>
				
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
						站长作品
					</div>
				</div>
				<div class="paddingTB">
					<g:each in="${fileNameList}" status="j" var="fileName">
						<asset:image src="XiangSu/${ fileName }" titile="${ fileName }"/>
					</g:each>
				</div>
				
			</div><%--col-md-end--%>
			
		</div>
		
	</body>
</html>