<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>空间管理${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:if test="${ session.uid || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="kongJian-save-form" url="[controller:'kongJian', action:'save']" class="clearfix">
				<g:textField name="biaoTi" value="" style="margin-bottom:15px;width:100%;" placeholder="标题" required="" autofocus="" class="form-control"/>
				<g:textArea name="neiRong" value="" style="margin:15px 0;width:100%;" placeholder="1,2,3,7,9（实体代号格式）" class="form-control"/>
				
				<g:textArea id="kongJianFuJianSave" name="fuJian" value="" style="width:100%;min-height:300px;" placeholder="附件" class="ckeditor"/>
				
				<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
				<g:submitButton name="faBu" value="发布" class="btn btn-primary pull-right" style="margin-top:8px;margin-right:10px;"/>
				<div id="kongJian-message-save" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
			</g:form>
			<g:javascript>
				jQuery("#kongJian-save-form").ajaxForm({
					beforeSerialize: function($form, options) { 
					    var dataHtml = CKEDITOR.instances.kongJianFuJianSave.getData();
					    jQuery("#kongJianFuJianSave").val(dataHtml);
					},
					success:function(data,textStatus){
						success(data,textStatus,'#kongJian-message-save');
						window.location.reload();
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#kongJian-message-save');
					}
				});
			</g:javascript>
			
			<hr/>
		</g:if>
		
		<g:if test="${kongJianInstanceList}">
			<div id="kongJian-wrapper">
				<div id="kongJian-load">
					<ul>
						<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
							<li>
								<h2 class="text-center mb30">
									<g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();">${ kongJianInstance.biaoTi }</g:link>
									<span style="color:lightgray;margin-left:5px;font-size:18px;">
										${ kongJianInstance.id }
									</span>
								</h2>
								<div class="neiRong">
									<div class="row">
										<g:if test="${kongJianInstance?.fuJian}">
											<div class="col-md-12">
												${kongJianInstance?.fuJian}
											</div>
										</g:if>
										
										<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
											<g:if test="${ shiTiInstance }">
         										<div class="col-md-3">
													<div class="smallBox">
														<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="title">
															${ shiTiInstance.id }&nbsp;${ shiTiInstance.biaoTi }
														</g:link>
													</div>
												</div>
											</g:if>
										</g:each>
									</div>
								</div>
							</li>
						</g:each>
					</ul>
					<div class="pagination" style="clear:both;">
						<g:paginate total="${kongJianInstanceCount}"/>
					</div>
				</div>
			</div>
			<g:javascript>
				paginate("#kongJian-wrapper", "#kongJian-load");
			</g:javascript>
		</g:if>
	</body>
</html>