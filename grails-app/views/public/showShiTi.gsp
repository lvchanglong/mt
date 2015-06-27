<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }</title>
	</head>
	<body>
		<h1>${ shiTiInstance.biaoTi }</h1>
		
		<div style="padding: 0 0 15px 0;color:#888888;">
			<strong class="yongHu">
				${ shiTiInstance.getYongHuAsString() }
			</strong>
			<span class="separator"></span>
			<span class="dateCreated">
				<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
			</span>
			<span class="separator"></span>
			<span class="id">
				代号：<span style="font-weight:bold;margin:0 10px;font-size:20px;">${ shiTiInstance.id }</span>
			</span>
		</div>	
		
		<div style="clear:both;"></div>
		
		<div class="neiRong">${shiTiInstance.neiRong}</div>
	</body>
</html>