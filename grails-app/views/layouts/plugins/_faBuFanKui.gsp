<div class="faBuFanKui relative">
	<h3>
		关于本<asset:image src="HanZi/网站.png" alt="网站" class="verticalAlignBottom"/>，你想<asset:image src="HanZi/说.png" alt="说" class="verticalAlignBottom"/>什么？
	</h3>
	
	<g:form name="fanKui-save-form" controller="fanKui" action="save" class="clearfix">
		<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
		
		<g:textArea id="fanKui-save-neiRong" name="neiRong" required="" class="borderRadius smallTextArea" placeholder="你想写多长就写多长"/>

		<div id="fanKui-save-status" class="messageBox">(^_,^ )：“我今天又没吃药，感觉自己萌萌哒...”</div>
		<g:submitButton name="tiJiao" value="发布" class="submitBtn btn-default"/>
	</g:form>
	
	<g:javascript>
		jQuery("#fanKui-save-form").ajaxForm({
			success:function(data,textStatus){
				jQuery("#fanKui-save-neiRong").val("");
				jQuery("#fanKui-save-status").html("(^_,^ )：“反馈已收到”");
			}, 
			error:function(XMLHttpRequest,textStatus,errorThrown){
				error(XMLHttpRequest,textStatus,errorThrown,'#fanKui-save-status');
			}
		});
	</g:javascript>
</div>

