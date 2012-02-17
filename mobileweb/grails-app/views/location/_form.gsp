<%@ page import="com.hoopla.mobileweb.domain.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'contactInfo', 'error')} required">
	<label for="contactInfo">
		<g:message code="location.contactInfo.label" default="Contact Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contactInfo" name="contactInfo.id" from="${com.hoopla.mobileweb.domain.ContactInfo.list()}" optionKey="id" required="" value="${locationInstance?.contactInfo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="location.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${locationInstance?.location}"/>
</div>

