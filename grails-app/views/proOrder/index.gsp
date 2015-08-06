
<%@ page import="com.cyberoller.pinying.Brand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<nav:set scope="manager" />
		<nav:set path="manager/proOrder" />

		<a href="#list-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-order" class="content scaffold-list" role="main">
			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<form name="form2" method="get" action="<g:createLink action="index" />">
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			订单号：<input type="text" value="${params.id }" name="id" >
			收货人：<input type="text" value="${params.consigneeName }" name="consigneeName" >
			手机：<input type="text" value="${params.consigneeMobile }" name="consigneeMobile" >
			<input style="height:25px;width:50px;" type= "button"  value="查询" onclick="$(this.form).submit()" >
			
			<table style="TABLE-LAYOUT: fixed" >
			<thead>
					<tr >
						<g:sortableColumn property="id" params="${filterParams?filterParams:params}" title="订单号" />
						<g:sortableColumn property="cjNum" params="${filterParams?filterParams:params}" title="决裁号" />
						<g:sortableColumn property="pjNum" params="${filterParams?filterParams:params}" title="PJ号" />
						<g:sortableColumn property="costDepart" params="${filterParams?filterParams:params}" title="费用负担部门" />
						<g:sortableColumn property="price" params="${filterParams?filterParams:params}" title="订单金额" />
					
						<g:sortableColumn property="lastUpdated" params="${filterParams?filterParams:params}" title="时间" />
					
						<g:sortableColumn property="consigneeName" params="${filterParams?filterParams:params}" title="收货人" />
						<g:sortableColumn property="consigneeMobile" params="${filterParams?filterParams:params}" title="手机" />
						<g:sortableColumn width="20%" property="consigneeAddress" params="${filterParams?filterParams:params}" title="地址" />
						<g:sortableColumn property="user" params="${filterParams?filterParams:params}" title="用户" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${proOrderList}" status="i" var="order">
				
					<tr class="odd" >
					
						<td > <a href="${createLink(controller:'proOrder', action:'detail', id:order?.id)}" title="查看订单详情" >${fieldValue(bean: order, field: "id")}</a></td>
						
						<td >${fieldValue(bean: order, field: "cjNum")}</td>
						<td >${fieldValue(bean: order, field: "pjNum")}</td>
						<td >${fieldValue(bean: order, field: "costDepart")}</td>
						<td >${fieldValue(bean: order, field: "price")}</td>
					
						<td ><g:formatDate date="${order.lastUpdated}" /></td>
					
						<td >${fieldValue(bean: order, field: "consigneeName")}</td>
						
						<td >${fieldValue(bean: order, field: "consigneeMobile")}</td>
						<td style="word-wrap:break-word;">${fieldValue(bean: order, field: "consigneeAddress")}</td>
						
						<td >${fieldValue(bean: order, field: "user.fullname")}</td>
						
					</tr>
					<tr class="event" >
						<td colspan="10" style="word-wrap:break-word;">
						<g:each in="${order.details}" status="j" var="detail">
							<a target="_blank" href="${createLink(controller:'index', action:'product', id:detail?.good?.id)}" title="${detail.xname }" >
					        ${detail.xname }</a>
					        <span>(${detail?.nums}件)</span>
						</g:each>
						
						</td>
					</tr >
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orderCount ?: 0}" params="${filterParams?filterParams:params}" />
			</div>
			</form>
		</div>
	</body>
</html>
