<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体详情</title>
	</head>
	<body>
		<div id="showShiTi" class="clearfix defaultPage">
			
			<h1>${ shiTiInstance.biaoTi }</h1>
			
			<div style="float:right;">
				<strong class="yongHu">
					${ shiTiInstance.getYongHuAsString() }
				</strong>
				<span class="separator">/</span>
				<span class="dateCreated">
					<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
				</span>
				<span class="separator">/</span>
				<span class="id">
					${ shiTiInstance.id}
				</span>
			</div>
			
			<div style="clear:both;"></div>
			
			<div class="neiRong">${shiTiInstance.neiRong}</div>
			
			<g:if test="${ session.uid && session.uid == shiTiInstance.yongHu?.id }">
				<g:form name="shiTi-delete-form" url="[resource:shiTiInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" controller="z360" action="editShiTi" id="${shiTiInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						
						<div id="shiTi-message-delete" class="messageBox" style="float:right;">(^_,^ )：“我今天又没吃药，感觉自己萌萌哒...”</div>
					</fieldset>
				</g:form>
				
				<g:javascript>
					jQuery("#shiTi-delete-form").ajaxForm({
						success:function(data,textStatus){
							success(data,textStatus,'#shiTi-message-delete');
						}, 
						error:function(XMLHttpRequest,textStatus,errorThrown){
							error(XMLHttpRequest,textStatus,errorThrown,'#shiTi-message-delete');
						}
					});
				</g:javascript>
			</g:if>
			
		</div>
	</body>
</html>