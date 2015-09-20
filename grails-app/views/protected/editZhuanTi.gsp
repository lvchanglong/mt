<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>专题修改${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == zhuanTiInstance.yongHu?.id || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="zhuanTi-update-form" url="[resource:zhuanTiInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${zhuanTiInstance?.version}" />
				
				<g:textField name="biaoTi" required="" value="${zhuanTiInstance?.biaoTi}" style="width:100%;" autofocus="" class="form-control"/>
				<g:textArea name="neiRong" required="" value="${zhuanTiInstance?.neiRong}" style="margin:15px 0;width:100%;" class="form-control"/>
				
				<g:actionSubmit class="btn btn-primary pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" style="margin:8px 15px 0 15px;"/>
			</g:form>
			<g:javascript>
				jQuery("#zhuanTi-update-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#zhuanTi-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#zhuanTi-message-console');
					}
				});
			</g:javascript>
			
			<g:form name="zhuanTi-delete-form" url="[resource:zhuanTiInstance, action:'delete']" method="DELETE">
				<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" style="margin-top:8px;"/>	
			</g:form>
			<g:javascript>
				jQuery("#zhuanTi-delete-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#zhuanTi-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#zhuanTi-message-console');
					}
				});
			</g:javascript>
			
			<div id="zhuanTi-message-console" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
		</g:if>
	</body>
</html>