<%@ page import="com.hoopla.mobileweb.domain.ContactInfo" %>



<div class="fieldcontain ${hasErrors(bean: contactInfoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contactInfo.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${contactInfoInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInfoInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="contactInfo.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" value="${contactInfoInstance?.telephone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInfoInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="contactInfo.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${contactInfoInstance?.website}"/>
</div>

