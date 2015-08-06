
<%@ page import="com.cyberoller.pinying.shiro.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<nav:set scope="manager" />
		<nav:set path="manager/user" />
	
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1>
				<g:message code="default.list.label" args="[entityName]" />
				<a href="${createLink(action:'create')}" style="font-size:16px;">
					<g:message code="default.create.label" args="[entityName]" />
				</a>	
			</h1>			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<form name="form2" method="get" action="<g:createLink action="index" />">
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			用户名：<input type="text" value="${params.username }" name="username" >
			邮箱：<input type="text" value="${params.email }" name="email" >
			<input style="height:25px;width:50px;" type= "button"  value="查询" onclick="$(this.form).submit()" >
			
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="username" params="${filterParams?filterParams:params}" title="${message(code: 'user.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="fullname" params="${filterParams?filterParams:params}" title="${message(code: 'user.fullname.label', default: 'Fullname')}" />
					
						<g:sortableColumn property="email" params="${filterParams?filterParams:params}" title="${message(code: 'user.email.label', default: 'Email')}" />
					
					
						<g:sortableColumn property="errortimes" params="${filterParams?filterParams:params}" title="${message(code: 'user.errortimes.label', default: 'Errortimes')}" />
						
						<g:sortableColumn property="money" params="${filterParams?filterParams:params}" title="${message(code: 'user.money.label', default: 'Money')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "fullname")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
					
					
						<td>${fieldValue(bean: userInstance, field: "errortimes")}</td>
						<td>${fieldValue(bean: userInstance, field: "money")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" params="${filterParams?filterParams:params}" />
			</div>
			</form>
		</div>
	</body>
</html>
