<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<h2 class="text-center mb30 bold">
			${ shiTiInstance.biaoTi }
		</h2>
		
		<div class="neiRong" id="htmlForPreview">${shiTiInstance.neiRong}</div>
		
		<g:if test="${shiTiInstance?.fuJian}">
			<div class="fuJian">
				${shiTiInstance?.fuJian}
			</div>
		</g:if>
								
		<div class="text-right detail">
			<span class="yongHu">
				发布人：${shiTiInstance.getYongHuAsString()}
			</span>
			<span class="separator"></span> 
			<span class="dateCreated">
				发布时间：<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
			</span>
		</div>
		
		<div style="clear:both;"></div>
		
		<g:render template="/layouts/plugins/baiDuFenXiang"/>
		
		<hr/>
		
		<g:render template="/layouts/plugins/changYanPingLun" model="[sid:'st' + shiTiInstance.id]"/>
	</body>
</html>