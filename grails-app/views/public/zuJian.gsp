<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>组件</title>
	</head>
	<body>

		<div id="fuWu" class="clearfix defaultPage">

			<h1>组件</h1>
			
			<div class="floatLeft w25">
				<div class="box">
					<h3>ＩＰ查询</h3>
					<g:render template="/layouts/plugins/yongHuIP" />
				</div>
			</div>
			
			<div class="floatLeft w50">
				<div class="box">
					<h3>当前时间</h3>
					<g:render template="/layouts/plugins/shiZhong"/>
				</div>
			</div>
			
			<div class="floatRight w25">
				<div class="box">
					<h3>卡通动画</h3>
					<g:render template="/layouts/plugins/kaTong" />
				</div>
			</div>
			
			<div class="floatLeft w25">
				<div class="box">
					<h3>生肖查询</h3>
					<g:render template="/layouts/plugins/shengXiao"/>
				</div>
			</div>
			
			<div class="floatRight w75">
				<div class="box">
					<h3>性别表示</h3>
					<asset:image src="SuCai/女.png" alt="女" title="女" style="float:left;width:250px;height:250px;margin-right:30px;"/>
					<asset:image src="SuCai/男.png" alt="男" title="男" style="float:left;width:250px;height:250px;margin-right:30px;"/>
					<asset:image src="SuCai/未知.png" alt="未知" title="未知" style="float:left;width:250px;height:250px;"/>
				</div>
			</div>
			
			<div class="floatLeft w75">
				<div class="box">
					<h3>腾云驾雾</h3>
					<g:render template="/layouts/plugins/feiTeng"/>
				</div>
			</div>
			
			<div class="floatRight w25">
				<div class="box">
					<h3>信息推送</h3>
					<h3 style="color:black;">
						<span id="kongjian-wrapper-h1">信息推送</span>
						<g:javascript>
							var source = new EventSource("${ createLink(controller:'public', action:"jinQiGongGao") }");
							source.onmessage = function(event) {
								jQuery("#kongjian-wrapper-h1").html(event.data);//近期公告
							};
						</g:javascript>
					</h3>
				</div>
			</div>
			
			<div class="floatLeft w50">
				<div class="box" style="min-height:540px;">
					<h3>幻灯片A</h3>
					<g:render template="/layouts/plugins/huanDengPian" model="[instanceList: slideList, width:'100%', height:'372px']"/>
				</div>
			</div>
			
			<div class="floatRight w50">
				<div class="box" style="min-height:540px;">
					<h3>幻灯片B</h3>
					<g:render template="/layouts/plugins/sliderEvolution" model="[instanceList: slideList, width:'100%', height:'372px']"/>
				</div>
			</div>
			
		</div>
		
	</body>
</html>