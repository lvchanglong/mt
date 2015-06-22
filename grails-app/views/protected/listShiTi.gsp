<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体管理</title>
	</head>
	<body>
		<div id="listShiTi" class="clearfix defaultPage">

			<g:if test="${ session.uid && session.uid == yongHuInstance?.id }">
				<g:form name="shiTi-save-form" url="[controller:'shiTi', action:'save']" class="clearfix" style="margin-top:30px;">
					<g:textField name="biaoTi" value="" style="margin-bottom:15px;width:100%;" placeholder="标题" required=""/>
					<g:textArea id="shiTiNeiRongSave" name="neiRong" value="" style="width:100%;" placeholder="如果您想说点什么" class="ckeditor"/>
					
					<g:javascript>
						CKEDITOR.inline('shiTiNeiRongSave');
					</g:javascript>
					
					<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
					<g:submitButton name="faBu" value="发布" class="submitBtn"/>
					<div id="shiTi-message-save" class="messageBox">(^_,^ )：“没吃药，萌萌哒...”</div>
				</g:form>
				
				<g:javascript>
					jQuery("#shiTi-save-form").ajaxForm({
						beforeSerialize: function($form, options) { 
						    var dataHtml = CKEDITOR.instances.shiTiNeiRongSave.getData();
						    jQuery("#shiTiNeiRongSave").val(dataHtml);
						},
						success:function(data,textStatus){
							success(data,textStatus,'#shiTi-message-save');
							window.location.reload();
						}, 
						error:function(XMLHttpRequest,textStatus,errorThrown){
							error(XMLHttpRequest,textStatus,errorThrown,'#shiTi-message-save');
						}
					});
				</g:javascript>
				
				<hr/>
			</g:if>
			
			<g:if test="${shiTiInstanceList}">
				<div id="shiTi-wrapper">
				
					<div id="shiTi-load">
						<ul>
							<g:each in="${shiTiInstanceList}" status="i" var="shiTiInstance">
								<li>
									<h2><g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();">${ shiTiInstance.biaoTi }</g:link></h2>

									<div style="padding: 0 0 15px 0;color:#888888;">
										<span class="dateCreated">
											<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
										</span>
										<span class="separator"></span>
										<span class="id">
											代号：<span style="font-weight:bold;margin:0 10px;font-size:20px;">${ shiTiInstance.id }</span>
										</span>
									</div>
									
									<div style="clear:both;"></div>
									
									<div class="neiRong">${shiTiInstance.neiRong}</div>
								</li>
							</g:each>
						</ul>
						
						<div class="pagination">
							<g:paginate total="${shiTiInstanceCount}" params="[id:yongHuInstance?.id]"/>
						</div>
					</div>
					
				</div>
				
				<g:javascript>
					paginate("#shiTi-wrapper", "#shiTi-load");
				</g:javascript>
			</g:if>					
			
		</div>
	</body>
</html>