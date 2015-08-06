
<%@ page import="com.cyberoller.pinying.ProductGoods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'productGoods.label', default: 'ProductGoods')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<nav:set scope="manager" />
		<nav:set path="manager/productGoods" />

		<a href="#list-productGoods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-productGoods" class="content scaffold-list" role="main">
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
			名称：<input type="text" value="${params.xname }" name="xname" >
			<input style="height:25px;width:50px;" type= "button"  value="查询" onclick="$(this.form).submit()" >
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="xname" params="${filterParams?filterParams:params}" title="${message(code: 'productGoods.xname.label', default: 'Xname')}" />
					
						<th><g:message code="productGoods.category.label" default="Category" /></th>
					
						<th><g:message code="productGoods.brand.label" default="Brand" /></th>
					
						<g:sortableColumn property="xthumbnail" params="${filterParams?filterParams:params}" title="${message(code: 'productGoods.xthumbnail.label', default: 'Xthumbnail')}" />
					
						<g:sortableColumn property="ximage1" params="${filterParams?filterParams:params}" title="${message(code: 'productGoods.ximage1.label', default: 'Ximage1')}" />
					
						<g:sortableColumn property="ximage2" params="${filterParams?filterParams:params}" title="${message(code: 'productGoods.ximage2.label', default: 'Ximage2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productGoodsInstanceList}" status="i" var="productGoodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productGoodsInstance.id}">${fieldValue(bean: productGoodsInstance, field: "xname")}</g:link></td>
					
						<td>${fieldValue(bean: productGoodsInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: productGoodsInstance, field: "brand")}</td>
					
						<td>${fieldValue(bean: productGoodsInstance, field: "xthumbnail")}</td>
					
						<td>${fieldValue(bean: productGoodsInstance, field: "ximage1")}</td>
					
						<td>${fieldValue(bean: productGoodsInstance, field: "ximage2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productGoodsInstanceCount ?: 0}" params="${filterParams?filterParams:params}" />
			</div>
			</form>
		</div>
	</body>
</html>
