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
					<fieldset class="buttons" style="margin-top:15px;">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />			
						<div id="kongJian-message-update" class="messageBox" style="float:right;">(^_,^ )：“我今天又没吃药，感觉自己萌萌哒...”</div>
					</fieldset>
				</g:form>
			
				<g:javascript>
					jQuery("#kongJian-update-form").ajaxForm({
						success:function(data,textStatus){
							success(data,textStatus,'#kongJian-message-update');
						}, 
						error:function(XMLHttpRequest,textStatus,errorThrown){
							error(XMLHttpRequest,textStatus,errorThrown,'#kongJian-message-update');
						}
					});
				</g:javascript>
				
			</div>
		</g:if>
	</body>
</html>