
<%@ page import="com.hoopla.mobileweb.domain.ContactInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contactInfo.label', default: 'ContactInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contactInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contactInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'contactInfo.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telephone" title="${message(code: 'contactInfo.telephone.label', default: 'Telephone')}" />
					
						<g:sortableColumn property="website" title="${message(code: 'contactInfo.website.label', default: 'Website')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInfoInstanceList}" status="i" var="contactInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactInfoInstance.id}">${fieldValue(bean: contactInfoInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: contactInfoInstance, field: "telephone")}</td>
					
						<td>${fieldValue(bean: contactInfoInstance, field: "website")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
