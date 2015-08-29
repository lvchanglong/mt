<%@ page import="mt.Helper" %>

<footer class="footer">
	<div class="container">
		<div class="clearfix text-left" style="padding-left:7px;">
			温馨提示：站内含“【原创】”标志的内容，皆为本站的原创内容，著作权归本站所有，转载请注明出处，因为这会让你的转载合法化...
		</div>
		<ul class="clearfix">
			<li>
				<i class="fa fa-copyright"></i>${ Helper.getNian() }&nbsp;${ grailsApplication.config.author.name }&nbsp;版权所有
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