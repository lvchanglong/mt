<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>空间修改</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == kongJianInstance.yongHu?.id || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="kongJian-update-form" url="[resource:kongJianInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${kongJianInstance?.version}" />
				<g:textField name="biaoTi" required="" value="${kongJianInstance?.biaoTi}" style="width:100%;" autofocus="" class="form-control"/>
				<g:textArea name="neiRong" required="" value="${kongJianInstance?.neiRong}" style="width:100%;" class="form-control"/>
				<g:actionSubmit class="btn btn-primary pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" style="margin-left:15px;margin-right:15px;"/>
			</g:form>
			<g:javascript>
				jQuery("#kongJian-update-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#kongJian-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#kongJian-message-console');
					}
				});
			</g:javascript>
			
			<g:form name="kongJian-delete-form" url="[resource:kongJianInstance, action:'delete']" method="DELETE">
				<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />	
			</g:form>
			<g:javascript>
				jQuery("#kongJian-delete-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#kongJian-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#kongJian-message-console');
					}
				});
			</g:javascript>
			
			<div id="kongJian-message-console" class="alert alert-info" role="alert">(^_,^ )：“没吃药，萌萌哒...”</div>
		</g:if>
	</body>
</html>