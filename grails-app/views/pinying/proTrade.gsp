<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="pinying"/>
	<title><g:message code="custom.menu.productInfo" />~Best Gift</title>
	<link rel="stylesheet" href="${resource(dir:"css/pinying", file:"static.css")}" />
</head>
<body>

<g:form url="[resource:proOrder, action:'payment']" method="PUT" >
	<div class="tradeInfo mt25">
	<hl>
	结算:
	</hl>
	<br>
	<ul><%--
		<li class="clearFix">
			<label>裁决号</label>
			<span><input type="text" name="cjNum" /> </span>
		</li>
		
		--%>
		<li class="fieldcontain required clearFix">
			<label for="cjNum">
				决裁号
			</label>
			<span><g:textField name="cjNum" maxlength="20" required=""   value="${cjNum }"/></span>
		</li>
		
		<li class="fieldcontain required clearFix">
			<label>会议名称</label>
			<span><g:textField name="pjNum" maxlength="20"  value="${pjNum }" /></span>
		</li>
		<li class="fieldcontain required clearFix">
			<label>费用负担部门</label>
			<span><g:textField name="costDepart" maxlength="50" required=""  value="${costDepart }"/></span>
			<input type='hidden' name="price" value="${price}">
		</li>
	</ul>
	<hl>
	&nbsp;&nbsp;&nbsp;&nbsp;收货人信息
	</hl>
	</div>
	<div class="consignee mt25">
	<ul>
		<li class="fieldcontain required clearFix">
			<label for="consigneeName">
				收货人:
			</label>
			<span><g:textField name="consigneeName" maxlength="50" required=""   value="${consigneeName }"/></span>
			
		</li>
		
		<li class="fieldcontain required clearFix">
			
			<label for="consigneeAddress">
				收货地址:
			</label>
			<span><g:textField id="consignee_address"name="consigneeAddress" maxlength="200" required=""   value="${consigneeAddress }"/></span>
			
		</li>
		
		<li class="fieldcontain required clearFix">
			<label for="consigneePhone">
				电话:
			</label>
			<span><g:textField name="consigneePhone" maxlength="20"   value="${consigneePhone }"/></span>
			
			<label for="consigneeMobile">
				手机:
			</label>
			<span><g:textField name="consigneeMobile" maxlength="15" required=""   value="${consigneeMobile }"/></span>
		</li>
		
		<li class="fieldcontain required clearFix">
			
			<label for="consigneeRemark" id="consignee_remark_lable"> 
				备注说明(如要求到货时间等):
			</label>
			<br>
			<span><g:textField id="consignee_remark" name="consigneeRemark" maxlength="200"   value="${consigneeRemark }"/></span>
			
		</li>
	</ul>
	
	<br><br>
	<div class="choose-btns"><button type="submit" class="btn-append" >确认下单</button></div>
	</div>
</g:form>

</body>
</html>
