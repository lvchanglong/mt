<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>
<%@ page import="mt.BkColor" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>查看历史${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:set var="dangQianYongHu" value="${ YongHu.get(session.uid) }" />
		
		<div class="row">
			<g:each in="${ShiTi.list()}" status="j" var="shiTiInstance">
				<g:if test="${ shiTiInstance }">
					<div class="col-md-4">
						<div class="listBox" style="background-color:${BkColor.getInst()};">
							<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
								<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="link">
									<span class="glyphicon glyphicon-edit"></span>
								</g:link>
							</g:if>
							
							<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="link listHeader">
								${ shiTiInstance.biaoTi }
							</g:link>
							
							<span style="margin-left:5px;font-size:18px;color:lightgray;">
								${ shiTiInstance.id }
							</span>
						
							<div class="content relative clearfix">
								<div class="row">
									<div class="col-md-5 col-xs-5">
										${ shiTiInstance.fuJian }
									</div>
									<div class="col-md-7 col-xs-7" style="margin-left:-15px;">
										${ shiTiInstance.miaoShu }
									</div>
								</div>
							</div>
							
							<div class="text-text lineHeight30 block">
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
	</body>
</html>