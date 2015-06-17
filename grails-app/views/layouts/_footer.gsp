<%@ page import="mt.Helper" %>

<footer id="main-footer">
	
	<div style="padding:15px 0 10px 0;">
		<g:link class="btn bold" controller="z360" action="guanYuWangZhan">
			<i class="fa fa-leaf"></i>关于网站
		</g:link>
		
		<g:link uri="/" class="btn bold">
			<i class="fa fa-home"></i>回到首页
		</g:link>
		
        <a class="btn bold" href="#main">
            <i class="fa fa-chevron-up"></i>返回顶部
        </a>
    </div>
    
	<ul class="clearfix inlineBlock">
		<li>
			<i class="fa fa-copyright"></i>${ Helper.getNian() }&nbsp;${ grailsApplication.config.author.name }&nbsp;版权所有
		</li>
		<li>
			<g:link controller="z360" action="yongQianBiDu">
				用前必读
			</g:link>
		</li>
		<li>
			<g:link controller="z360" action="zuJianCangKu">
				组件仓库
			</g:link>
		</li>
		<li>
			<g:link controller="z360" action="yongHuFanKui">
				用户反馈
			</g:link>
		</li>
		<li>
			<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">
				${ grailsApplication.config.application.code }
			</a>
		</li>
	</ul>
	
</footer>