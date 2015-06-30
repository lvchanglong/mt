<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体修改</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == shiTiInstance.yongHu?.id || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="shiTi-update-form" url="[resource:shiTiInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${shiTiInstance?.version}" />

				<g:textField name="biaoTi" required="" value="${shiTiInstance?.biaoTi}" style="width:100%;" autofocus="" class="form-control"/>
				<g:textArea id="shiTiNeiRongUpdate" name="neiRong" required="" value="${shiTiInstance?.neiRong}" class="ckeditor"/>
				
				<g:javascript>
					CKEDITOR.inline('shiTiNeiRongUpdate');
				</g:javascript>
				
				<g:actionSubmit class="btn btn-primary pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" style="margin-left:15px;margin-right:15px;"/>
			</g:form>
			<g:javascript>
				jQuery("#shiTi-update-form").ajaxForm({
					beforeSerialize: function($form, options) { 
					    var dataHtml = CKEDITOR.instances.shiTiNeiRongUpdate.getData();
					    jQuery("#shiTiNeiRongUpdate").val(dataHtml);
					},
					success:function(data,textStatus){
						success(data,textStatus,'#shiTi-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#shiTi-message-console');
					}
				});
			</g:javascript>
			
			<g:form name="shiTi-delete-form" url="[resource:shiTiInstance, action:'delete']" method="DELETE">
				<g:actionSubmit  class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />		
			</g:form>
			<g:javascript>
				jQuery("#shiTi-delete-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#shiTi-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#shiTi-message-console');
					}
				});
			</g:javascript>
			
			<div id="shiTi-message-console" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
		</g:if>
	</body>
</html>