<%@ page import="mt.FanKui" %>



<div class="fieldcontain ${hasErrors(bean: fanKuiInstance, field: 'yongHu', 'error')} ">
	<label for="yongHu">
		<g:message code="fanKui.yongHu.label" default="Yong Hu" />
		
	</label>
	<g:select id="yongHu" name="yongHu.id" from="${mt.YongHu.list()}" optionKey="id" value="${fanKuiInstance?.yongHu?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fanKuiInstance, field: 'neiRong', 'error')} required">
	<label for="neiRong">
		<g:message code="fanKui.neiRong.label" default="Nei Rong" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="neiRong" required="" value="${fanKuiInstance?.neiRong}"/>

</div>

