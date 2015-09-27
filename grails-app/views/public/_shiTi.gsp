<%@ page import="mt.YongHu" %>

<g:set var="dangQianYongHu" value="${ YongHu.get(session.uid) }" />

<div class="mb10 h1 text-center block">
	<g:if test="${ dangQianYongHu?.shiFouGuanLiYuan() }">
		<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();" class="link"><span class="glyphicon glyphicon-edit"></span></g:link>
	</g:if>
	
	<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="link">
		${ shiTiInstance.biaoTi }
	</g:link>
	
	<span style="margin-left:5px;font-size:18px;color:lightgray;">
		${ shiTiInstance.id }
	</span>
</div>
<div class="content relative clearfix" id="htmlForPreview">
	${ shiTiInstance.neiRong }
</div>

<div class="text-right lineHeight30">
	<span class="yongHu">
		${shiTiInstance.getYongHuAsString()}
	</span>
	<span class="separator">|</span>
	<span class="dateCreated">
		<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy年MM月dd HH:mm:ss" />
	</span>
	<span class="separator">|</span>
	<g:render template="/layouts/plugins/zhuanZai"/>
</div>

<div style="clear:both;"></div>