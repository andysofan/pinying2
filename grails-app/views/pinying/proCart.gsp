<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="pinying"/>
	<title>购物车~Best Gift</title>
	<link rel="stylesheet" href="${resource(dir:"css/pinying", file:"static.css")}" />
</head>
<body>
	<div class="catbox">
	  <table id="cartTable">
	    <thead>
	      <tr>
	        <th><label>
	            <input class="check-all check" type="checkbox"/>&nbsp;&nbsp;全选</label></th>
	        <th>商品</th>
	        <th>单价</th>
	        <th>数量</th>
	        <th>小计</th>
	        <th>操作</th>
	      </tr>
	    </thead>
	    
	    <tbody>
	      <g:each in="${cartList}" status="i" var="cart">
	      <tr>
	        <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
	        <td class="goods">
	        <a href="${createLink(controller:'index', action:'product', id:cart?.good?.id)}" title="" >
	        <img alt="" src="<g:resource dir="images/pinying/images" file="${cart?.xthumbnail}" />"  />
	        </a>
	        <span>${cart?.xname}</span>
	        </td>
	        <td class="price">${cart?.xprice}</td>
	        <td class="count"><span class="reduce"></span>
	          <input class="count-input" type="text" value="${cart?.nums}"/>
	          <span class="add">+</span></td>
	        <td class="subtotal">${cart?.xprice}</td>
	        <td class="operation">
	        	<span class="delete">删除</span>
	        	<input type="hidden" value="${cart?.id}"/>
	        </td>
	      </tr>
	      </g:each>
	      
	    </tbody>
	  </table>
	  <div class="foot" id="foot">
	    <label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;&nbsp;全选</label>
	    <a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
	    <div class="fr closing" id="tradeId">结 算</div>
	    <input type="hidden" id="cartTotalPrice" />
	    <div class="fr total">合计:<span id="priceTotal">0</span></div>
	    <div class="fr total">可用余额:<span id="useTotal">${user?.money }</span></div>
	    <div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
	    <div class="selected-view">
	      <div id="selectedViewList" class="clearfix">
	        
	      </div>
	      <span class="arrow">◆<span>◆</span></span> </div>
	  </div>
	</div>
<script type="text/javascript">
	function delCart(cartId){
		$.ajax({
			url: "${createLink(controller:'proCart', action:'delete')}",
			type: "POST",
			data: { cartId : cartId },
			dataType: "html"
		}).done(function(result){
			//alert(result);
			//$(obj).html(result)
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
	function delCartAll(){
		$.ajax({
			url: "${createLink(controller:'proCart', action:'delAll')}",
			type: "POST",
			dataType: "html"
		}).done(function(result){
			//alert(result);
			//$(obj).html(result)
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}

	function updateCart(cartId,nums){
		$.ajax({
			url: "${createLink(controller:'proCart', action:'update')}",
			type: "POST",
			data: { cartId : cartId ,nums:nums },
			dataType: "html"
		}).done(function(result){
			//alert(result);
			//$(obj).html(result)
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}

	function tradeFun(cid,nums,price){
		var href="${createLink(controller:'proCart', action:'tradeTag')}";
		href+="?cid=" + cid;
		href+="&nums=" + nums;
		href+="&price=" + price;
		window.location.href = href;
	}
	
</script>
<script type="text/javascript" src="${resource(dir:"js/pinying", file:"cart.js")}"></script>
</body>
</html>
