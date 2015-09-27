<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${ kongJianInstance.biaoTi }${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:render template="/public/kongJian" model="[kongJianInstance:kongJianInstance]"/>
	</body>
</html>