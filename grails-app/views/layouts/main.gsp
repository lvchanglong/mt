<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<meta name="Keywords" content="主坦克,mt,吕常龙,lvchanglong"/>
		<meta name="Description" content="这是一个赔钱的网站，我是一个倒霉的站长"/>
		<meta name="Author" content="吕常龙">
		
		<script>
			var _hmt = _hmt || [];
			(function() {
			  var hm = document.createElement("script");
			  hm.src = "//hm.baidu.com/hm.js?68c2fb57a6f059f2f5bb543a0a25b7be";
			  var s = document.getElementsByTagName("script")[0]; 
			  s.parentNode.insertBefore(hm, s);
			})();
		</script>
		
		<script type="text/javascript">
		    if (top.location !== self.location) {
			    top.location = self.location;
			}
		</script>

		<title><g:layoutTitle default="主坦克"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body class="minWidth">
		<section id="main">
			<g:pageProperty name="page.header" default="${ render(template:"/layouts/header") }"/>		
			<div id="main-wrapper" class="clearfix">
				<g:layoutBody/>
			</div>
			<g:pageProperty name="page.footer" default="${ render(template:"/layouts/footer") }"/>
		</section>
		
		<div id="spinner">
			<asset:image src="SuCai/奔跑.png" alt="处理中"/>
			<div class="tiShi">处理中...</div>
		</div>
	</body>
</html>
