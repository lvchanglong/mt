<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体修改</title>
	</head>
	<body>
		<g:if test="${ session.uid && session.uid == shiTiInstance.yongHu?.id }">
			<div id="editShiTi" class="clearfix defaultPage">
				
				<g:form name="shiTi-update-form" url="[resource:shiTiInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${shiTiInstance?.version}" />

					<g:textField name="biaoTi" required="" value="${shiTiInstance?.biaoTi}" style="margin: 60px 0 15px 0;"/>
					<g:textArea id="shiTiNeiRongUpdate" name="neiRong" required="" value="${shiTiInstance?.neiRong}" class="ckeditor"/>
					
					<g:javascript>
						CKEDITOR.inline('shiTiNeiRongUpdate');
					</g:javascript>
					
					<fieldset class="buttons" style="margin-top:15px;">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<div id="shiTi-message-update" class="messageBox" style="float:right;">(^_,^ )：“我今天又没吃药，感觉自己萌萌哒...”</div>
					</fieldset>
				</g:form>
			
				<g:javascript>
					jQuery("#shiTi-update-form").ajaxForm({
						beforeSerialize: function($form, options) { 
						    var dataHtml = CKEDITOR.instances.shiTiNeiRongUpdate.getData();
						    jQuery("#shiTiNeiRongUpdate").val(dataHtml);
						},
						success:function(data,textStatus){
							success(data,textStatus,'#shiTi-message-update');
						}, 
						error:function(XMLHttpRequest,textStatus,errorThrown){
							error(XMLHttpRequest,textStatus,errorThrown,'#shiTi-message-update');
						}
					});
				</g:javascript>
				
			</div>
		</g:if>
	</body>
</html>