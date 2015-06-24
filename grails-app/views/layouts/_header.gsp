<%@ page import="mt.YongHu" %>

<g:set var="dangQianYongHu" value="${ YongHu.get(session.uid) }" />

<header id="main-header" class="clearfix minWidth">
	
	<div class="daoHang clearfix">
		<div class="logoWrapper">
			<g:link uri="/" elementId="main-header-logo">
				<asset:image src="SuCai/logo.png" alt="主坦克"/>
			</g:link>
		</div>
		
		<div id="main-header-menu">
			<a href="javascript:void(0);" onclick="hideAll('.hiddenBox');">
				<i class="fa fa-chevron-up"></i>
			</a>
		</div>
		
		<ol id="main-header-toggle">			
			<g:if test="${ dangQianYongHu }">
				<li>
					<a href="javascript:void(0);" onclick="clickToHover('.hiddenBox', '#hoverGaiXinXi')"><i class="fa fa-user fa-1_5"></i>${ dangQianYongHu.xingMing }</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="clickToHover('.hiddenBox', '#hoverGaiMiMa')"><i class="fa fa-key fa-1_5"></i>密码修改</a>
				</li>
				<li>
					<g:link controller="protected" action="listShiTi"><i class="fa fa-file fa-1_5"></i>实体管理</g:link>
				</li>
				<li>
					<g:link controller="protected" action="listKongJian"><i class="fa fa-folder fa-1_5"></i>空间管理</g:link>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="jQuery.post('${ createLink(controller:'public', action:"yongHuZhuXiao") }', function(){window.location.reload();});"><i class="fa fa-sign-out fa-1_5"></i>退出</a>
				</li>
			</g:if>
			<g:else>
				<li>
					<a href="javascript:void(0);" onclick="clickToHover('.hiddenBox', '#hoverDengLu')"><i class="fa fa-sign-in fa-1_5"></i>登录</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="clickToHover('.hiddenBox', '#hoverZhuCe')"><i class="fa fa-user-plus fa-1_5"></i>注册</a>
				</li>
			</g:else>
		</ol>
	</div>
	
	<g:if test="${ dangQianYongHu }">
		<%-- 信息修改 --%>
		<div class="hiddenBox" id="hoverGaiXinXi">
			<div class="innerWrapper clearfix">
				<g:form name="xinXiXiuGai" url="[controller:'yongHu', action:'update', id:session.uid]" method="PUT" class="clearfix">
					<h3>
						(^﹃^ )<span class="separator">/</span><span id="yongHuXiuGaiTiShi" class="message-content">姓名、简介</span>
					</h3>
					<g:hiddenField name="version" value="${gengXinInstance?.version}" />
					<g:textField name="xingMing" value="${dangQianYongHu?.xingMing}" placeholder="姓名"/>
					<g:textArea name="jianJie" value="${dangQianYongHu?.jianJie}" placeholder="简介" style="min-height:130px;"/>

					<g:submitButton name="xiuGaiXX" value="修改" class="submitBtn btn-default"/>
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
			
				<div class="touXiangKongJian" style="float:left;width:180px;">
					<div id="touXiangWrapper" style="width:180px;height:180px;">
						<g:if test="${ dangQianYongHu.touXiang }">
							<g:img uri="${ createLink(controller:'protected', action:'loadTouXiang') }" width="180px" height="180px" alt="头像"/>
						</g:if>
						<g:else>
							<asset:image src="SuCai/记者.png" width="180px" height="180px" alt="头像"/>
						</g:else>
					</div>
					<g:uploadForm useToken="true" controller="protected" action="touXiangShangChuan" onsubmit="wenJianShangChuan(jQuery(this).find([type=file])[0].files, '${ createLink(controller:"protected", action:"touXiangShangChuan") }', '#kaiShiShangChuan', jQuery(this).serialize());return false">									
						<div class="relative">
							<div id="tuPianXuanZe" class="tuPianXuanZe btn btn-default">
								选择图片
							</div>
							<input type="file" name="file" onchange="tuPianChaKan(this.files, '#touXiangWrapper', '#tuPianXuanZe', '#kaiShiShangChuan');" multiple="false" class="btn btn-default"/>
						</div>
						<g:submitButton id="kaiShiShangChuan" name="shangChuan" value="开始上传" class="tuPianShangChuan btn-default"/>
					</g:uploadForm>
				</div>
			</div>
		</div>
		
		<%-- 密码修改 --%>
		<div class="hiddenBox" id="hoverGaiMiMa">
			<div class="innerWrapper">
				<g:form name="miMaXiuGai" url="[controller:'protected', action:'miMaXiuGai', id:session.uid]">
					<h3>
						(^﹃^ )<span class="separator">/</span><span id="miMaXiuGaiTiShi" class="message-content">原密、新密、确认</span>
					</h3>
					<g:passwordField name="yuanMiMa" required="" value="" placeholder="原始密码"/>
					<g:passwordField name="xinMiMa" required="" value="" placeholder="新的密码"/>
					<g:passwordField name="queRenMiMa" required="" value="" placeholder="确认密码"/>
					<g:submitButton name="xiuGai" value="修改" class="submitBtn btn-default"/>
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
	</g:if>
	<g:else>
		<%-- 用户登录 --%>
		<div class="hiddenBox" id="hoverDengLu">
			<div class="innerWrapper">
				<g:form name="yongHuDengLu" url="[controller:'public', action:'yongHuDengLu']">
					<h3>
						(^﹃^ )<span class="separator">/</span><span id="dengLuTiShi" class="message-content">账号</span>
					</h3>
					<g:textField id="saveZhangHao" name="zhangHao" required="" value="" placeholder="账号：是ＱＱ么？"/>
					<g:passwordField name="miMa" value="" placeholder="密码：默认"/>
					<div style="float:left;margin-top:10px;"><g:checkBox id="saveAuto" name="saveAuto" checked="true" style="margin-top:0;vertical-align:middle;"/>&nbsp;&nbsp;记住账号</div>
					<g:submitButton name="dengLu" value="登录" class="submitBtn btn-default"/>
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
							var zhangHao = jQuery("#saveZhangHao").val();
							if(true == jQuery("#saveAuto").is(":checked")) {
								localStorage.zhangHao = zhangHao;
							} else {
								localStorage.zhangHao = '';
							}
						}
					}
					
					function loadZhangHao() {
						if(localStorage) {
							if(localStorage.zhangHao) {
								jQuery("#saveZhangHao").val(localStorage.zhangHao);
							}
						}
					}
				</g:javascript>
			</div>
		</div>
		
		<%-- 用户注册 --%>
		<div class="hiddenBox" id="hoverZhuCe">
			<div class="innerWrapper">
				<g:form name="yongHuZhuCe" url="[controller:'public', action:'yongHuZhuCe']">
					<h3>
						(^﹃^ )<span class="separator">/</span><span id="zhuCeTiShi" class="message-content">默认密码：${ grailsApplication.config.application.password }</span>
					</h3>
					<g:textField name="zhangHao" required="" value="" placeholder="账号：使用ＱＱ？"/>
					<g:passwordField name="miMa" value="" placeholder="密码：默认"/>
					<g:passwordField name="queRenMiMa" value="" placeholder="确认：默认"/>
					<g:submitButton name="zhuCe" value="注册" class="submitBtn btn-default"/>
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
	</g:else>
</header>