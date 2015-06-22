<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体修改</title>
	</head>
	<body>
		
		<g:if test="${ session.uid && session.uid == shiTiInstance.yongHu?.id || dangQianYongHu?.shiFouGuanLiYuan() }">
			<div id="editShiTi" class="clearfix defaultPage">
				
				<g:form name="shiTi-update-form" url="[resource:shiTiInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${shiTiInstance?.version}" />

					<g:textField name="biaoTi" required="" value="${shiTiInstance?.biaoTi}" style="margin: 60px 0 15px 0;"/>
					<g:textArea id="shiTiNeiRongUpdate" name="neiRong" required="" value="${shiTiInstance?.neiRong}" class="ckeditor"/>
					
					<g:javascript>
						CKEDITOR.inline('shiTiNeiRongUpdate');
					</g:javascript>
					
					<div style="margin:5px 15px 0 0;float:left;">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
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
					<div style="margin:5px 15px 0 0;float:left;">
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />		
					</div>
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
				
				<div id="shiTi-message-console" class="messageBox" style="float:right;">(^_,^ )：“没吃药，萌萌哒...”</div>
			</div>
		</g:if>
	</body>
</html>