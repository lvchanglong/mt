<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<div class="mb10 h1 link">${ shiTiInstance.biaoTi }</div>
		
		<div class="content relative clearfix" id="htmlForPreview">
			${ shiTiInstance.neiRong }
		</div>
		
		<g:if test="${shiTiInstance?.fuJian}">
			<div class="fuJian">
				${shiTiInstance?.fuJian}
			</div>
		</g:if>
	
		<div class="text-right detail">
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
		
		<g:render template="/layouts/plugins/baiDuFenXiang"/>
		
		<hr/>
		
		<g:render template="/layouts/plugins/changYanPingLun" model="[sid:'st' + shiTiInstance.id]"/>
	</body>
</html>