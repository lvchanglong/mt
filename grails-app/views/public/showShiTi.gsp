<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ shiTiInstance.biaoTi }${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:render template="/public/shiTi" model="[shiTiInstance:shiTiInstance]"/>
		
		<g:render template="/layouts/plugins/baiDuFenXiang"/>
		
		<hr/>
		
		<g:render template="/layouts/plugins/changYanPingLun" model="[sid:'st' + shiTiInstance.id]"/>
	</body>
</html>