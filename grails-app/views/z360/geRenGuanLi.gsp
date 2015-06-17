<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>个人管理</title>
	</head>
	<body>
		<div id="kongjian" class="clearfix defaultPage">
			<div class="relative clearfix">
				<asset:image src="${ yongHuInstance.touXiang }" style="float:right;width:180px;height:180px;margin-top:35px;padding:0 10px;" alt="头像"/>
				<div style="position:relative;float:left;padding-left:15px;">
					<h3>
						姓名：${ yongHuInstance.xingMing }
					</h3>
					<h3>
						简介：${ yongHuInstance.jianJie }
					</h3>
					<h3 style="color:lightslategray;">
						网站公告：<span id="kongjian-wrapper-h1">网站公告</span>
						<g:javascript>
							var source = new EventSource("${ createLink(controller:"z520", action:"jinQiGongGao") }");
							source.onmessage = function(event) {
								jQuery("#kongjian-wrapper-h1").html(event.data);//近期公告
							};
						</g:javascript>
					</h3>
				</div>
			</div>
			
			<hr/>
			
			<ul class="clearfix">
				<li style="float:left;margin-right:70px;">
					<g:link controller="z360" action="listShiTi" id="${ yongHuInstance.id }" target="_blank" class="aList">
						<asset:image src="SuCai/实体列表.png" alt="实体列表"/>
					</g:link>
				</li>
				<li style="float:left;">
					<g:link controller="z360" action="listKongJian" id="${ yongHuInstance.id }" target="_blank" class="aList">
						<asset:image src="SuCai/空间列表.png" alt="空间列表"/>
					</g:link>
				</li>
			</ul>
		</div>
	</body>
</html>