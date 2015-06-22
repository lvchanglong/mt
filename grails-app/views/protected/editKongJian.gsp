<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>空间修改</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == kongJianInstance.yongHu?.id }">
			<div id="editKongJian" class="clearfix defaultPage">
				
				<g:form name="kongJian-update-form" url="[resource:kongJianInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${kongJianInstance?.version}" />
					<g:textField name="biaoTi" required="" value="${kongJianInstance?.biaoTi}" style="margin: 60px 0 15px 0;"/>
					<g:textField name="neiRong" required="" value="${kongJianInstance?.neiRong}"/>
					<div style="margin:5px 15px 0 0;float:left;">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />	
					</div>
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
					<div style="margin:5px 15px 0 0;float:left;">
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />		
					</div>
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
				
				<div id="kongJian-message-console" class="messageBox" style="float:right;">(^_,^ )：“没吃药，萌萌哒...”</div>
				
			</div>
		</g:if>
	</body>
</html>