<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title>订单详情</title>
		<link rel="stylesheet" href="${resource(dir:"css/pinying", file:"static.css")}" />
	</head>
	<body>
		<nav:set scope="manager" />
		<nav:set path="manager/proOrder" />

		<a href="#list-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-order" class="content scaffold-list" role="main">
			<h1>
				订单详情  
			</h1>
			
			<h5>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				单号: ${order?.id }
				&nbsp;&nbsp;&nbsp;&nbsp; 
				下单时间:&nbsp;&nbsp;<g:formatDate date="${order.lastUpdated}" />
				&nbsp;&nbsp;&nbsp;&nbsp; 
				用户:&nbsp;&nbsp;${order.user?.fullname}
			</h5>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>

<div class="tradeInfo">
	<ul>
		<li class="clearFix">
			<label>决裁号</label>
			<span>${order?.cjNum}</span>
			
			<label>PJ号</label>
			<span>${order?.pjNum}</span>
			
			</li>
		<li class="clearFix">
			<label>费用负担部门</label>
			<span>${order?.costDepart}</span>
			<label>订单金额</label>
			<span>${order?.price}</span>
		</li>		
	</ul>
	
</div>

<div class="consignee mt25">
	<ul>
		<li class="fieldcontain clearFix">
			<label >
				收货人:
			</label>
			<span>${order?.consigneeName }</span>
			
		</li>
		
		<li class="fieldcontain clearFix">
			
			<label >
				收货地址:
			</label>
			<span>${order?.consigneeAddress }</span>
			
		</li>
		
		<li class="fieldcontain clearFix">
			<label>
				电话:
			</label>
			<span>${order?.consigneePhone }</span>
			
			<label >
				手机:
			</label>
			<span>${order?.consigneeMobile }</span>
		</li>
		
		<li class="fieldcontain clearFix">
			<label  id="remark_lable"> 
				备注说明(如要求到货时间等):
			</label>
			<span>${order?.consigneeRemark }</span>
			
		</li>
	</ul>
</div>

<div class="catbox">
	  <table id="cartTable">
	    <thead>
	      <tr>
	        <th>商品</th>
	        <th>单价</th>
	        <th>数量</th>
	        <th>小计</th>
	      </tr>
	    </thead>
	    
	    <tbody>
	    <g:each in="${order?.details}" status="j" var="detail">
	        <tr>
	        <td class="goods">
	        <a target="_blank" href="${createLink(controller:'index', action:'product', id:detail?.good?.id)}" title="" >
	        <img alt="" src="<g:resource dir="images/pinying/images" file="${detail?.xthumbnail}" />"  />
	        </a>
	        <span>${detail?.xname}</span>
	        </td>
	        <td class="price">${detail?.xprice}</td>
	        <td class="count">
	          ${detail?.nums}
	        <td class="subtotal">${detail?.subprice}</td>
	      </tr>
	        
		</g:each>
	    </tbody>
	  </table>
	</div>
</body>
</html>
