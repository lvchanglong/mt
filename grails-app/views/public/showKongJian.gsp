<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ kongJianInstance.biaoTi }${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>

		<div class="row" style="padding-top:30px;">
		
			<div class="col-md-12">
				<ul>
					<li>
						<div class="jumbotron mb0 mt15">
							<h1>
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
				</ul>
			</div><%--col-md-end--%>
			
		</div>
		
	</body>
</html>