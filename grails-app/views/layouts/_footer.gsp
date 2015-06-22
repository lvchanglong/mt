<%@ page import="mt.Helper" %>

<footer id="main-footer">
	
	<div style="padding:25px 0 10px 0;">
		<g:link class="bold" controller="public" action="guanYuWangZhan"><i class="fa fa-leaf fa-1_5"></i>关于网站</g:link>
		<g:link uri="/" class="bold"><i class="fa fa-home fa-1_5"></i>回到首页</g:link>
        <a class="bold" href="#main"><i class="fa fa-arrow-up fa-1_5"></i>返回顶部</a>
    </div>
    
	<ul class="clearfix inlineBlock">
		<li>
			<i class="fa fa-copyright"></i>${ Helper.getNian() }&nbsp;&nbsp;&nbsp;${ grailsApplication.config.author.name }&nbsp;&nbsp;&nbsp;版权所有
		</li>
		<li>
			<g:link controller="public" action="yongQianBiDu">
				用前必读
			</g:link>
		</li>
		<li>
			<g:link controller="public" action="zuJian">
				组件
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
	
</footer>