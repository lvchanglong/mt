<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>测试${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		
		<a href="javascript:void(0)" title="A" class="story btn btn-primary" id="Y">我同意</a>
		<a href="javascript:void(0)" title="A" class="story btn btn-primary" id="N">不同意</a>
		
		<div id="YX" class="none">
			谢谢，谢谢啦...
		</div>
		
		<div id="NX" class="none">
			讨厌啦...
		</div>
		
		<g:javascript>
			xuanZeXiangYing();
		</g:javascript>
		
		<%--
		<g:form name="ajaxForm" controller="private" action="ajaxTest">
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
		--%>
		
		<content tag="header">
		</content>
		
		<content tag="footer">
		</content>
	</body>
</html>