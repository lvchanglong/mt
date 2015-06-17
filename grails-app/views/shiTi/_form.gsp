<%@ page import="mt.ShiTi" %>



<div class="fieldcontain ${hasErrors(bean: shiTiInstance, field: 'yongHu', 'error')} ">
	<label for="yongHu">
		<g:message code="shiTi.yongHu.label" default="Yong Hu" />
		
	</label>
	<g:select id="yongHu" name="yongHu.id" from="${mt.YongHu.list()}" optionKey="id" value="${shiTiInstance?.yongHu?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shiTiInstance, field: 'biaoTi', 'error')} required">
	<label for="biaoTi">
		<g:message code="shiTi.biaoTi.label" default="Biao Ti" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="biaoTi" required="" value="${shiTiInstance?.biaoTi}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shiTiInstance, field: 'neiRong', 'error')} required">
	<label for="neiRong">
		<g:message code="shiTi.neiRong.label" default="Nei Rong" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="neiRong" required="" value="${shiTiInstance?.neiRong}"/>

</div>

