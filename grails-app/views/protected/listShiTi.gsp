<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>实体管理${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:if test="${ session.uid || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="shiTi-save-form" url="[controller:'shiTi', action:'save']" class="clearfix">
				<g:textField name="biaoTi" value="" style="margin-bottom:15px;width:100%;" placeholder="标题" required="" autofocus="" class="form-control"/>
				<g:textArea id="shiTiNeiRongSave" name="neiRong" value="" style="width:100%;" placeholder="内容" class="ckeditor"/>
				<br/>
				<g:textArea id="shiTiFuJianSave" name="fuJian" value="" style="width:100%;" placeholder="附件" class="ckeditor"/>
				
				<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
				<g:submitButton name="faBu" value="发布" class="btn btn-primary pull-right" style="margin-top:8px;margin-right:10px;"/>
				<div id="shiTi-message-save" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
			</g:form>
			<g:javascript>
				jQuery("#shiTi-save-form").ajaxForm({
					beforeSerialize: function($form, options) { 
					    var neiRongHtml = CKEDITOR.instances.shiTiNeiRongSave.getData();
					    jQuery("#shiTiNeiRongSave").val(neiRongHtml);
					    
					    var fuJianHtml = CKEDITOR.instances.shiTiFuJianSave.getData();
					    jQuery("#shiTiFuJianSave").val(fuJianHtml);
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
								<h2 class="text-center mb30 block">
									<g:link controller="protected" action="editShiTi" id="${ shiTiInstance.id }" target="_blank" onclick="reloadConfirm();">${ shiTiInstance.biaoTi }</g:link>
									
									<span style="color:lightgray;margin-left:5px;font-size:18px;">
										${ shiTiInstance.id }
									</span>
								</h2>
								
								<div class="neiRong">${shiTiInstance.neiRong}</div>
								
								<g:if test="${shiTiInstance?.fuJian}">
									<div class="fuJian">
										${shiTiInstance?.fuJian}
									</div>
								</g:if>
								
								<div class="text-right detail">
									<span class="yongHu">
										发布人：${shiTiInstance.getYongHuAsString()}
									</span>
									<span class="separator"></span> 
									<span class="dateCreated">
										发布时间：<g:formatDate date="${shiTiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
									</span>
								</div>
								
								<div style="clear:both;"></div>
							</li>
						</g:each>
					</ul>
					<div class="pagination">
						<g:paginate total="${shiTiInstanceCount}"/>
					</div>
				</div>
			</div>
			<g:javascript>
				paginate("#shiTi-wrapper", "#shiTi-load");
			</g:javascript>
		</g:if>
	</body>
</html>