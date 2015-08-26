<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }</title>
	</head>
	<body>
		<h2 class="text-center mb30">
			${ shiTiInstance.biaoTi }
		</h2>

		<div style="padding: 0 0 15px 0;color:#888888;" class="text-right">
			<strong class="yongHu">
				${ shiTiInstance.getYongHuAsString() }
			</strong>
			<span class="separator"></span>
			<span class="dateCreated">
				<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
			</span>
		</div>
		
		<div style="clear:both;"></div>
		<div class="neiRong" id="htmlForPreview">${shiTiInstance.neiRong}</div>
	</body>
</html>