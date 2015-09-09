<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>空间修改${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == kongJianInstance.yongHu?.id || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="kongJian-update-form" url="[resource:kongJianInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${kongJianInstance?.version}" />
				
				<g:textField name="biaoTi" required="" value="${kongJianInstance?.biaoTi}" style="width:100%;" autofocus="" class="form-control"/>
				<g:textArea name="neiRong" required="" value="${kongJianInstance?.neiRong}" style="margin:15px 0;width:100%;" class="form-control"/>
				
				<g:textArea id="kongJianFuJianUpdate" name="fuJian" value="${kongJianInstance?.fuJian}" style="width:100%;min-height:300px;" placeholder="附件" class="ckeditor"/>
				<g:javascript>
					CKEDITOR.replace('kongJianFuJianUpdate');
				</g:javascript>
				
				<g:actionSubmit class="btn btn-primary pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" style="margin:8px 15px 0 15px;"/>
			</g:form>
			<g:javascript>
				jQuery("#kongJian-update-form").ajaxForm({
					beforeSerialize: function($form, options) { 
					    var dataHtml = CKEDITOR.instances.kongJianFuJianUpdate.getData();
					    jQuery("#kongJianFuJianUpdate").val(dataHtml);
					},
					success:function(data,textStatus){
						success(data,textStatus,'#kongJian-message-console');
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#kongJian-message-console');
					}
				});
			</g:javascript>
			
			<g:form name="kongJian-delete-form" url="[resource:kongJianInstance, action:'delete']" method="DELETE">
				<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" style="margin-top:8px;"/>	
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
			
			<div id="kongJian-message-console" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
		</g:if>
	</body>
</html>