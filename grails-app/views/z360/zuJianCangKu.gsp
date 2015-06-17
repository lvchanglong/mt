<%@ page import="mt.YongHu" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>组件仓库</title>
	</head>
	<body>

		<div id="fuWu" class="clearfix defaultPage">

			<h1>组件仓库</h1>

			<h2>ＩＰ查询</h2>
			<g:render template="/layouts/plugins/yongHuIP" />
			
			<hr/>
			
			<h2>当前时间</h2>
			<g:render template="/layouts/plugins/shiZhong"/>
			
			<hr/>
			
			<h2>生肖查询</h2>
			<g:render template="/layouts/plugins/shengXiao"/>
			
			<hr/>
			
			<h2>腾云驾雾</h2>
			<g:render template="/layouts/plugins/feiTeng"/>

			<hr/>
			
			<h2>卡通动画</h2>
			<g:render template="/layouts/plugins/kaTong" />
			
			<hr/>
			
			<h2>性别表示</h2>
			<asset:image src="SuCai/女.png" alt="女" title="女" style="float:left;width:250px;height:250px;margin-right:30px;"/>
			<asset:image src="SuCai/男.png" alt="男" title="男" style="float:left;width:250px;height:250px;margin-right:30px;"/>
			<asset:image src="SuCai/未知.png" alt="未知" title="未知" style="float:left;width:250px;height:250px;"/>
			
			<hr style="clear:both;"/>
			
			<h2>幻灯片A</h2>
			<g:render template="/layouts/plugins/sliderEvolution" model="[instanceList: slideList, width:'100%', height:'372px']"/>
			
			<hr/>
			
			<h2>幻灯片B</h2>
			<g:render template="/layouts/plugins/huanDengPian" model="[instanceList: slideList, width:'100%', height:'372px']"/>
		</div>
		
	</body>
</html>