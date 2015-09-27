<%@ page import="mt.YongHu" %>
<%@ page import="mt.ShiTi" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<g:if test="${ kongJianInstanceList }">
			<div class="row">
				<div class="col-md-8">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
								<li data-target="#carousel-example-generic" data-slide-to="${ i }" class="${ (i == 0)?"active":"" }"></li>
							</g:each>
					  	</ol>
					  	
					  	<div class="carousel-inner" role="listbox" style="">
					  		<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
					  			<div class="item ${ (i == 0)?"active":"" }">
					  				<g:link controller="public" action="showKongJian" id="${ kongJianInstance.id }" class="block colorWhite" target="_blank">
						      			<div class="row slider">
						      				<div class="col-md-12 sliderImg">
						      					${ kongJianInstance.fuJian }
						      				</div>
						      				<div class="col-md-12 sliderText">
						      					<div style="padding:0 30px 30px 30px;">
						      						<h1 class="text-center">
								      					${ kongJianInstance.biaoTi }
								      				</h1>
								      				${ kongJianInstance.miaoShu }
						      					</div>
						      				</div>
						      			</div>
						      		</g:link>
					    		</div>
					  		</g:each>
					  	</div>
					  	
					  	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="background-image:none;">
					    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    	<span class="sr-only">Previous</span>
					  	</a>
					  	<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="background-image:none;">
					    	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    	<span class="sr-only">Next</span>
					  	</a>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="rightTopBox bkGreen">
						<div style="padding-top:40px;">
							<g:img uri="${ createLink(controller:'public', action:'loadTouXiang', id:session.uid) }" width="180px" height="180px" alt="头像" class="img-rounded toCenter"/>
						</div>
					</div>
					<div class="rightBottomBox bkGray">
						<div style="padding:40px 30px 0 30px;font-weight:bold;font-size:20px;line-height:26px;color:#fff;">
							${ session.uinfo }
						</div>
					</div>
				</div>
				
				<div class="col-md-12">
					<hr/>
				</div>
				
				<div class="col-md-12">
					<ul>
						<g:each in="${kongJianInstanceList}" status="i" var="kongJianInstance">
							<li>
								<g:render template="/public/kongJian" model="[kongJianInstance:kongJianInstance]"/>
							</li>
						</g:each>
					</ul>
				</div>
			</div>
		</g:if>
		<g:else>
			<h1>（T_T）页面被外星人劫走了...</h1>
		</g:else>
	</body>
</html>