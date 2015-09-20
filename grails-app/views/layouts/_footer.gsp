<%@ page import="mt.Helper" %>

<footer class="footer">
	<div class="container">
		<ul class="clearfix">
			<li>
				<i class="fa fa-copyright"></i>2014-${ Helper.getNian() }&nbsp;&nbsp;${ grailsApplication.config.author.name }&nbsp;&nbsp;版权所有
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