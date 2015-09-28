<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>
<%@ page import="mt.BkColor" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>我的传说${ grailsApplication.config.html.title.suffix }</title>
	</head>
	<body>
		<div class="row" style="font-size:20px;font-weight:bold;line-height:34px;color:#fff;">
			<div class="col-md-12" style="background-color:#454853;min-height:170px;">
				<div style="padding:30px;">
					<h1 style="font-weight:bold;" class="text-center">
						我的传说
					</h1>
				</div>
			</div>
			<div class="col-md-4" style="background-color:#8A8D8C;min-height:500px;">
				<div style="padding-top:40px;">
					<g:link controller="public" action="woDeChuanShuo" target="_blank" class="toCenter">
						<g:img uri="${ createLink(controller:'public', action:'loadTouXiang', id:session.uid) }" width="180px" height="180px" alt="头像" class="img-rounded toCenter"/>
					</g:link>
				</div>
			</div>
			<div class="col-md-8" style="background-color:#2c313a;min-height:500px;">
				<ul style="padding:15px;">
					<li>
						我叫<strong style="font-size:26px;">${ session.uname }</strong>，${ session.uinfo }
					</li>
					<li style="margin-top:10px;">
						${ guShiInstance }
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>