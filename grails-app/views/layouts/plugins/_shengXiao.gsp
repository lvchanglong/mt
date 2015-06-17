<div id="shengXiao">
	<div id="shengXiao-wrapper" style="position:relative;width:150px;height:150px;line-height:150px;text-align:center;">
		<span style="font-weight:700;font-size:70px;">!</span>
	</div>
	
	<g:form name="shengXiaoChaXun-form" controller="z520" action="shengXiaoChaXun">
		<g:field type="number" name="nian" required="" placeholder="年份"/>
		<g:submitButton name="tiJiao" value="提交"/>
	</g:form>

	<g:javascript>
		jQuery("#shengXiaoChaXun-form").ajaxForm({
			success:function(data,textStatus){
				jQuery("#shengXiao-wrapper").removeClass();
				jQuery("#shengXiao-wrapper").html("<div style='position:absolute;right:-40px;top:0;font-weight:bold;display:block;'>" + data.zhongWen + "</div>");
				jQuery("#shengXiao-wrapper").addClass("shengXiao " + data.pinYin);
			}, 
			error:function(XMLHttpRequest,textStatus,errorThrown){
				jQuery("#shengXiao-wrapper").removeClass();
				jQuery("#shengXiao-wrapper").html("格式有误/例：1988");
			}
		});
	</g:javascript>
</div>