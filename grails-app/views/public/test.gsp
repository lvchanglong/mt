<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>测试</title>
	</head>
	<body>
		
		<g:form name="ajaxForm" controller="public" action="ajaxTest">
			<span id="console">控制台</span>
			<g:submitButton name="submit" value="提交"/>
		</g:form>
		
		<g:javascript>
			jQuery("#ajaxForm").ajaxForm({
				success:function(data,textStatus){
					success(data,textStatus,'#console');
				}, 
				error:function(XMLHttpRequest,textStatus,errorThrown){
					error(XMLHttpRequest,textStatus,errorThrown,'#console');
				}
			});
		</g:javascript>
		
		<content tag="header">
		</content>
		
		<content tag="footer">
		</content>
		
	</body>
</html>