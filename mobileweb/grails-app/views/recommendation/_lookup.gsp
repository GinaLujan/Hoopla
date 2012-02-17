<%@ page import="com.hoopla.mobileweb.Recommendation" %>



<div class="fieldcontain ${hasErrors(bean: recommendationInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="recommendation.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${recommendationInstance?.eventDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: recommendationInstance, field: 'eventType', 'error')} required">
	<label for="eventType">
		<g:message code="recommendation.eventType.label" default="Event Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="eventType" from="${com.hoopla.mobileweb.EventType?.values()}" keys="${com.hoopla.mobileweb.EventType.values()*.name()}" required="" value="${recommendationInstance?.eventType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recommendationInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="recommendation.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${com.hoopla.mobileweb.Location.list()}" optionKey="id" required="" value="${recommendationInstance?.location?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recommendationInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="recommendation.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${recommendationInstance?.title}"/>
</div>

