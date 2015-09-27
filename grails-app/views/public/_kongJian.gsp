<%@ page import="mt.YongHu" %>
<%@ page import="mt.BkColor" %>

<g:set var="dangQianYongHu" value="${ YongHu.get(session.uid) }" />

<div class="bkBlue">
	<div class="sliderImg">
		${ kongJianInstance.fuJian }
	</div>
 	<div class="sliderText">
		<div style="padding:0 30px 30px 30px;color:#fff;">
			<h1 class="text-center">
				<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
					<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();" class="link minWidth25">
						<span class="glyphicon glyphicon-edit" style="font-size:18px;"></span>
					</g:link>
				</g:if>
				
				<g:link controller="public" action="showKongJian" id="${ kongJianInstance.id }" class="link" target="_blank">${ kongJianInstance.biaoTi }</g:link>
				<span style="font-size:18px;color:lightgray;">
					${ kongJianInstance.id }
				</span>
			</h1>
			${ kongJianInstance.miaoShu }
		</div>
	</div>
</div>

<div class="row">
	<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
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