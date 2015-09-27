<%@ page import="mt.Helper" %>

<footer class="footer">
	<div class="container">
		
		<div class="row" style="border-top: 3px solid #000000;">
			<div class="col-md-5">
				
			</div>
			<div class="col-md-2">
				<g:link uri="/">
					<asset:image src="WenZi/吕常龙.png" class="toCenter logo" style="height:110px;"/>
				</g:link>
			</div>
			<div class="col-md-5">
				
			</div>
		</div>
		
		<ul class="clearfix inlineBlock">
			<li>
				<i class="fa fa-copyright"></i>2014.10.1&nbsp;-&nbsp;${ Helper.getNian() }&nbsp;&nbsp;${ grailsApplication.config.author.name }&nbsp;&nbsp;版权所有
			</li>
			<li>
				<g:link controller="public" action="yongQianBiDu">用前必读</g:link>
			</li>
			<li>
				<g:link controller="public" action="zuJian">
					组件
				</g:link>
			</li>
			<li>
				<g:link controller="public" action="liCheng">
					历程
				</g:link>
			</li>
			<li>
				<g:link controller="public" action="fanKui">
					反馈
				</g:link>
			</li>
			<li>
				<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">
					${ grailsApplication.config.application.code }
				</a>
			</li>
		</ul>
	</div>
</footer>

<div class="topLines">
	<div class="line2"></div>
	<div class="line1"></div>
</div>