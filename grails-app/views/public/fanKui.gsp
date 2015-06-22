<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>反馈</title>
	</head>
	<body>
		<div id="yongHuFanKui" class="clearfix defaultPage">
		
			<g:render template="/layouts/plugins/faBuFanKui" />
			
			<hr/>

			<div id="fanKui-wrapper">
			
				<div id="fanKui-load">
					<ul>
						<g:each in="${fanKuiInstanceList}" status="i" var="fanKuiInstance">
							<li>
								<strong class="yongHu">
									${ fanKuiInstance.getYongHuAsString() }
								</strong>
								<span class="separator">/</span>
								<span class="dateCreated">
									<g:formatDate date="${fanKuiInstance.dateCreated}" format="yyyy-MM-dd HH:mm:ss" />
								</span>
								<div class="neiRong">${fanKuiInstance.neiRong}</div>
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
			
		</div>
	</body>
</html>