<%@ page import="mt.KongJian" %>



<div class="fieldcontain ${hasErrors(bean: kongJianInstance, field: 'yongHu', 'error')} required">
	<label for="yongHu">
		<g:message code="kongJian.yongHu.label" default="Yong Hu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="yongHu" name="yongHu.id" from="${mt.YongHu.list()}" optionKey="id" required="" value="${kongJianInstance?.yongHu?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kongJianInstance, field: 'biaoTi', 'error')} required">
	<label for="biaoTi">
		<g:message code="kongJian.biaoTi.label" default="Biao Ti" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="biaoTi" required="" value="${kongJianInstance?.biaoTi}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kongJianInstance, field: 'neiRong', 'error')} required">
	<label for="neiRong">
		<g:message code="kongJian.neiRong.label" default="Nei Rong" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="neiRong" required="" value="${kongJianInstance?.neiRong}"/>

</div>

