<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>空间管理</title>
	</head>
	<body>
		<div id="listKongJian" class="clearfix defaultPage">
			
			<g:if test="${ session.uid && session.uid == yongHuInstance.id || dangQianYongHu?.shiFouGuanLiYuan() }">
				<g:form name="kongJian-save-form" url="[controller:'kongJian', action:'save']" class="clearfix" style="margin-top:30px;">
					<g:textField name="biaoTi" value="" style="margin-bottom:15px;width:100%;" placeholder="标题" required=""/>
					<g:textArea name="neiRong" value="" style="width:100%;min-height:300px;" placeholder="1,2,3,7,9（实体代号格式）"/>
					
					<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
					<g:submitButton name="faBu" value="发布" class="submitBtn"/>
					<div id="kongJian-message-save" class="messageBox">(^_,^ )：“没吃药，萌萌哒...”</div>
				</g:form>
				
				<g:javascript>
					jQuery("#kongJian-save-form").ajaxForm({
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
									<h1><g:link controller="protected" action="editKongJian" id="${ kongJianInstance.id }" target="_blank" onclick="reloadConfirm();">${ kongJianInstance.biaoTi }</g:link></h1>
									
									<div class="neiRong">
										<ul>
											<g:each in="${kongJianInstance.children()}" status="j" var="shiTiInstance">
												<g:if test="${ shiTiInstance }">
													<li>
														<div class="floatLeft w50">
															<div class="box">
																<g:link controller="public" action="showShiTi" id="${ shiTiInstance.id }" target="_blank" class="title">
																	<i class="fa fa-desktop"></i>${ shiTiInstance.biaoTi }
																</g:link>
																
																<div class="phone">
																	${ shiTiInstance.neiRong }
																</div>
																
																<i class="fa fa-mobile-phone fa-2" style="position:absolute;top:0;right:0;"></i>
															</div>
														</div>
													</li>
												</g:if>
											</g:each>
										</ul>
									</div>
								</li>
							</g:each>
						</ul>
						
						<div class="pagination" style="clear:both;">
							<g:paginate total="${kongJianInstanceCount}" params="[id:yongHuInstance?.id]"/>
						</div>
					</div>
					
				</div>
				
				<g:javascript>
					paginate("#kongJian-wrapper", "#kongJian-load");
				</g:javascript>
			</g:if>
			
		</div>
	</body>
</html>