<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }</title>
	</head>
	<body>
		<h2 class="text-center mb30 bold">
			${ shiTiInstance.biaoTi }
		</h2>

		<div class="text-right detail">
			<span class="yongHu">
				作者：${shiTiInstance.getYongHuAsString()}
			</span>
			<span class="separator"></span> 
			<span class="dateCreated">
				发布时间：<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
			</span>
		</div>
		
		<div style="clear:both;"></div>
		<div class="neiRong" id="htmlForPreview">${shiTiInstance.neiRong}</div>
		
		<g:render template="/layouts/plugins/baiDuFenXiang"/>
	</body>
</html>