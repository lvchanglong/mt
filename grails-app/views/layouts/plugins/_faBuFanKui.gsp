<h3>
	关于本<asset:image src="SuCai/网站.png" alt="网站" class="verticalAlignBottom"/>，你想<asset:image src="SuCai/说.png" alt="说" class="verticalAlignBottom"/>什么？
</h3>

<g:form name="fanKui-save-form" controller="fanKui" action="save" class="clearfix">
	<g:hiddenField name="yongHu.id" value="${ session.uid }"/>
	
	<g:textArea id="fanKui-save-neiRong" name="neiRong" required="" autofocus="" class="form-control borderRadius" style="width:100%;" placeholder="你想写多长就写多长"/>

	<div id="fanKui-save-status" class="messageBox">(^_,^ )：“没吃药，萌萌哒...”</div>
	<g:submitButton name="tiJiao" value="发布" class="btn btn-primary btn-sm pull-right"/>
</g:form>
<g:javascript>
	jQuery("#fanKui-save-form").ajaxForm({
		success:function(data,textStatus){
			jQuery("#fanKui-save-neiRong").val("");
			jQuery("#fanKui-save-status").html("(^_,^ )：“反馈已收到”");
			window.location.reload();
		}, 
		error:function(XMLHttpRequest,textStatus,errorThrown){
			error(XMLHttpRequest,textStatus,errorThrown,'#fanKui-save-status');
		}
	});
</g:javascript>