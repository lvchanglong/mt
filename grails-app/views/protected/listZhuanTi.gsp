<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>专题管理${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<g:if test="${ session.uid || dangQianYongHu?.shiFouGuanLiYuan() }">
			<g:form name="zhuanTi-save-form" url="[controller:'zhuanTi', action:'save']" class="clearfix">
				<g:textField name="biaoTi" value="" style="margin-bottom:15px;width:100%;" placeholder="标题" required="" autofocus="" class="form-control"/>
				<g:textArea name="neiRong" value="" style="margin:15px 0;width:100%;" placeholder="1,2,3,7,9（空间代号格式）" class="form-control"/>
				
				<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
				<g:submitButton name="faBu" value="发布" class="btn btn-primary pull-right" style="margin-top:8px;margin-right:10px;"/>
				<div id="zhuanTi-message-save" class="alert alert-info" role="alert">没吃药，萌萌哒...</div>
			</g:form>
			<g:javascript>
				jQuery("#zhuanTi-save-form").ajaxForm({
					success:function(data,textStatus){
						success(data,textStatus,'#zhuanTi-message-save');
						window.location.reload();
					}, 
					error:function(XMLHttpRequest,textStatus,errorThrown){
						error(XMLHttpRequest,textStatus,errorThrown,'#zhuanTi-message-save');
					}
				});
			</g:javascript>
			
			<hr/>
		</g:if>
		
		<g:if test="${zhuanTiInstanceList}">
			<div id="zhuanTi-wrapper">
				<div id="zhuanTi-load">
					<ul>
						<g:each in="${zhuanTiInstanceList}" status="i" var="zhuanTiInstance">
							<li>
								<h2 class="text-center mb30">
									<g:link controller="protected" action="editZhuanTi" id="${ zhuanTiInstance.id }" target="_blank" onclick="reloadConfirm();">${ zhuanTiInstance.biaoTi }</g:link>
									<span style="color:lightgray;margin-left:5px;font-size:18px;">
										${ zhuanTiInstance.id }
									</span>
								</h2>
								<div class="neiRong">
									<div class="row">
										<g:each in="${zhuanTiInstance.children()}" status="j" var="kongJianInstance">
											<g:if test="${ kongJianInstance }">
         										<div class="col-md-3">
													<div class="smallBox">
														${ kongJianInstance.id }&nbsp;${ kongJianInstance.biaoTi }
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
						<g:paginate total="${zhuanTiInstanceCount}"/>
					</div>
				</div>
			</div>
			<g:javascript>
				paginate("#zhuanTi-wrapper", "#zhuanTi-load");
			</g:javascript>
		</g:if>
	</body>
</html>