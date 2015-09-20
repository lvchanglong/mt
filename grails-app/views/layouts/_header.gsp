<%@ page import="mt.YongHu" %>

<g:set var="dangQianYongHu" value="${ YongHu.get(session.uid) }" />

<nav class="navbar navbar-inverse navbar-fixed-top zIndexMax">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mt-navbar-collapse" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		    <g:link uri="/" class="navbar-brand">MT</g:link>
    	</div>
    	
    	<div class="collapse navbar-collapse" id="mt-navbar-collapse">
    		<ul class="nav navbar-nav">
    			<g:if test="${ dangQianYongHu }">
					<li>
						<a href="#" data-toggle="modal" data-target="#hoverGaiXinXi"><i class="fa fa-user"></i>${ dangQianYongHu.xingMing }</a>
						
						<div class="modal fade" id="hoverGaiXinXi" tabindex="-1" role="dialog" aria-labelledby="hoverGaiXinXiTitle">
							<div class="modal-dialog" role="document" aria-hidden="true">
								<div class="modal-content">
								
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						       	 		<h4 class="modal-title" id="hoverGaiXinXiTitle">时人莫小池中水,浅处不妨有卧龙&nbsp;&nbsp;&nbsp;——&nbsp;窦庠</h4>
									</div>
									<div class="modal-body paddingWrapper">
										<div class="row">
											<div class="col-md-6">
												<g:form name="xinXiXiuGai" url="[controller:'yongHu', action:'update', id:session.uid]" method="PUT">
										        	<div id="yongHuXiuGaiTiShi" class="alert alert-info" role="alert">
										        		<strong>姓名、简介</strong>
												    </div>
											        
													<g:hiddenField name="version" value="${dangQianYongHu?.version}"/>
													
													<g:textField name="xingMing" value="${dangQianYongHu?.xingMing}" class="form-control" required="" autofocus="" placeholder="姓名"/>
													<g:textArea name="jianJie" value="${dangQianYongHu?.jianJie}" class="form-control" placeholder="简介"/>
													
													<g:submitButton name="xiuGai" value="修改" class="btn btn-lg btn-primary btn-block"/>
											    </g:form>
												<g:javascript>
													jQuery("#xinXiXiuGai").ajaxForm({
														success:function(data,textStatus){
															success(data,textStatus,'#yongHuXiuGaiTiShi');
														}, 
														error:function(XMLHttpRequest,textStatus,errorThrown){
															error(XMLHttpRequest,textStatus,errorThrown,'#yongHuXiuGaiTiShi');
														}
													});
												</g:javascript>
											</div>
											<div class="col-md-6">
												<g:uploadForm useToken="true" controller="protected" action="touXiangShangChuan" onsubmit="wenJianShangChuan(jQuery(this).find([type=file])[0].files, '${ createLink(controller:"protected", action:"touXiangShangChuan") }', '#kaiShiShangChuan', jQuery(this).serialize());return false" style="width:180px;margin:0 auto;">									
													<div id="touXiangWrapper" style="text-align:center;margin-bottom:15px;margin-top:5px;">
														<g:img uri="${ createLink(controller:'public', action:'loadTouXiang', id:dangQianYongHu?.id) }" width="180px" height="180px" alt="头像" class="img-thumbnail"/>
													</div>
													<div class="xuanZeWenJian">
														<div id="tuPianXuanZe" class="btn btn-primary btn-block">
															选择图片
														</div>
														<input type="file" name="file" onchange="tuPianChaKan(this.files, '#touXiangWrapper', '#tuPianXuanZe', '#kaiShiShangChuan');" multiple="false" class="btn btn-primary btn-block up"/>
													</div>
													<g:submitButton id="kaiShiShangChuan" name="shangChuan" value="开始上传" class="btn btn-default btn-block form-control" style="margin-top:10px;"/>
												</g:uploadForm>
											</div>
										</div>
										
							      	</div>
									
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="#" data-toggle="modal" data-target="#hoverGaiMiMa")"><i class="fa fa-key"></i>密码修改</a>
						
						<div class="modal fade" id="hoverGaiMiMa" tabindex="-1" role="dialog" aria-labelledby="hoverGaiMiMaTitle">
							<div class="modal-dialog" role="document" aria-hidden="true">
								<div class="modal-content">
								
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						       	 		<h4 class="modal-title" id="hoverGaiMiMaTitle">生当作人杰，死亦为鬼雄&nbsp;&nbsp;&nbsp;——&nbsp;李清照</h4>
									</div>
									<div class="modal-body paddingWrapper">
							        	<g:form name="miMaXiuGai" url="[controller:'protected', action:'miMaXiuGai']">
								        	<div id="miMaXiuGaiTiShi" class="alert alert-info" role="alert">
								        		<strong>原密、新密、确认</strong>
										    </div>
									        
									        <g:passwordField name="yuanMiMa" value="" required="" autofocus="" class="form-control" placeholder="原始密码"/>
									        <g:passwordField name="xinMiMa" value="" class="form-control" placeholder="新的密码"/>
											<g:passwordField name="queRenMiMa" value="" class="form-control" placeholder="确认密码"/>
											
											<g:submitButton name="xiuGai" value="修改" class="btn btn-lg btn-primary btn-block"/>
									    </g:form>
										<g:javascript>
											jQuery("#miMaXiuGai").ajaxForm({
												success:function(data,textStatus){
													success(data,textStatus,'#miMaXiuGaiTiShi');
												}, 
												error:function(XMLHttpRequest,textStatus,errorThrown){
													error(XMLHttpRequest,textStatus,errorThrown,'#miMaXiuGaiTiShi');
												}
											});
										</g:javascript>
							      	</div>
									
								</div>
							</div>
						</div>
					</li>
					<li>
						<g:link controller="protected" action="listShiTi"><i class="fa fa-file"></i>实体管理</g:link>
					</li>
					<li>
						<g:link controller="protected" action="listKongJian"><i class="fa fa-folder"></i>空间管理</g:link>
					</li>
					<li>
						<g:link controller="protected" action="listZhuanTi"><i class="fa fa-folder"></i>专题管理</g:link>
					</li>
					<li>
						<a href="#" onclick="jQuery.post('${ createLink(controller:'public', action:"yongHuZhuXiao") }', function(){window.location.reload();});">退出</a>
					</li>
				</g:if>
				<g:else>
					<li>
						<a href="#" data-toggle="modal" data-target="#hoverDengLu">登录</a>
						
						<div class="modal fade" id="hoverDengLu" tabindex="-1" role="dialog" aria-labelledby="hoverDengLuTitle">
							<div class="modal-dialog" role="document" aria-hidden="true">
								<div class="modal-content">
								
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						       	 		<h4 class="modal-title" id="hoverDengLuTitle">举世皆浊我独清，众人皆醉我独醒&nbsp;&nbsp;&nbsp;——&nbsp;屈原</h4>
									</div>
									<div class="modal-body paddingWrapper">
							        	<g:form name="yongHuDengLu" url="[controller:'public', action:'yongHuDengLu']">
								        	<div id="dengLuTiShi" class="alert alert-info" role="alert">
								        		温馨提示：密码<strong style='margin:0 5px 0 3px;'>已</strong>默认
										    </div>
									        
									        <label for="inputZhangHao" class="sr-only">账号</label>
									        <g:textField id="inputZhangHao" name="zhangHao" value="" required="" autofocus="" class="form-control" placeholder="账号：ＱＱ？"/>
									        
									        <label for="inputPassword" class="sr-only">密码</label>
									        <g:passwordField id="inputPassword" name="miMa" value="" class="form-control" placeholder="密码：默认"/>
									        
									        <div class="checkbox">
									        	<label>
									        		<g:checkBox name="rememberMe" checked="true"/> 记住账号
									        	</label>
									        </div>
									        <g:submitButton name="dengLu" value="登录" class="btn btn-lg btn-primary btn-block"/>
									    </g:form>
									    <g:javascript>
											jQuery("#yongHuDengLu").ajaxForm({
												success:function(data,textStatus){
							
													saveZhangHao();//保存账号信息
													
													success(data,textStatus,'#dengLuTiShi');
													window.location.reload();
												}, 
												error:function(XMLHttpRequest,textStatus,errorThrown){
													error(XMLHttpRequest,textStatus,errorThrown,'#dengLuTiShi');
												}
											});
											
											loadZhangHao();//加载账号信息
											
											function saveZhangHao() {
												if(localStorage) {
													var zhangHao = jQuery("#inputZhangHao").val();
													if(true == jQuery("#rememberMe").is(":checked")) {
														localStorage.zhangHao = zhangHao;
													} else {
														localStorage.zhangHao = '';
													}
												}
											}
											
											function loadZhangHao() {
												if(localStorage) {
													if(localStorage.zhangHao) {
														jQuery("#inputZhangHao").val(localStorage.zhangHao);
													}
												}
											}
										</g:javascript>
							      	</div>
									
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="#" data-toggle="modal" data-target="#hoverZhuCe">注册</a>
						
						<div class="modal fade" id="hoverZhuCe" tabindex="-1" role="dialog" aria-labelledby="hoverZhuCeTitle">
							<div class="modal-dialog" role="document" aria-hidden="true">
								<div class="modal-content">
								
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						       	 		<h4 class="modal-title" id="hoverZhuCeTitle">十年生死两茫茫，不思量，自难忘&nbsp;&nbsp;&nbsp;——&nbsp;苏轼</h4>
									</div>
									<div class="modal-body paddingWrapper">
							        	<g:form name="yongHuZhuCe" url="[controller:'public', action:'yongHuZhuCe']">
								        	<div id="zhuCeTiShi" class="alert alert-info" role="alert">
								        		默认密码：<strong>${ grailsApplication.config.application.password }</strong>
										    </div>
									        
									        <g:textField name="zhangHao" value="" required="" autofocus="" class="form-control" placeholder="账号：ＱＱ？"/>
									        <g:passwordField name="miMa" value="" class="form-control" placeholder="密码：默认"/>
											<g:passwordField name="queRenMiMa" value="" class="form-control" placeholder="确认：默认"/>
											
									        <g:submitButton name="zhuCe" value="注册" class="btn btn-lg btn-primary btn-block"/>
									    </g:form>
									    <g:javascript>
											jQuery("#yongHuZhuCe").ajaxForm({
												success:function(data,textStatus){
													success(data,textStatus,'#zhuCeTiShi');
												}, 
												error:function(XMLHttpRequest,textStatus,errorThrown){
													error(XMLHttpRequest,textStatus,errorThrown,'#zhuCeTiShi');
												}
											});
										</g:javascript>
							      	</div>
									
								</div>
							</div>
						</div>
					</li>
				</g:else>
      		</ul>
      		
      		<%--
      		<ul class="nav navbar-nav navbar-right">
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		          </ul>
		        </li>
		    </ul>
    		--%>
    	</div>
	</div>
</nav>