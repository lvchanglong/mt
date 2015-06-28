<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>反馈</title>
	</head>
	<body>
		<g:render template="/layouts/plugins/faBuFanKui" />
		
		<hr/>

		<div id="fanKui-wrapper">
			<div id="fanKui-load">
				<ul>
					<g:each in="${fanKuiInstanceList}" status="i" var="fanKuiInstance">
						<li class="relative">
							<g:img uri="${ createLink(controller:'public', action:'loadTouXiang', id:fanKuiInstance?.yongHu?.id) }" width="70px" height="70px" alt="头像" class="img-thumbnail pull-left" style="margin:0 10px 10px 0;"/>
						
							<span class="neiRong" style="padding-bottom:25px;line-height: 30px;">
								${fanKuiInstance.neiRong}									
							</span>
							
							<div style="position:absolute;right:0;bottom:0;padding-bottom:5px;">
								${ fanKuiInstance.getYongHuAsString() }
								<span class="separator">/</span>
								<g:formatDate date="${fanKuiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss"/>
							</div>
							
							<hr style="clear:both;"/>
						</li>
					</g:each>
				</ul>
				<div class="pagination">
					<g:paginate total="${fanKuiInstanceCount}" />
				</div>
			</div>
		</div>
		<g:javascript>
			paginate("#fanKui-wrapper", "#fanKui-load");
		</g:javascript>
	</body>
</html>