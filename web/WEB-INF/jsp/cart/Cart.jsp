<%@ include file="../common/IncludeTop.jsp"%>

<script src="js/autoRefreshCart.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>

<!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

<div id="BackLink">
	<a href="main">Return to Main Menu</a>
</div>

<div id="Catalog">

	<div id="Cart" style="text-align: center">

		<h2 style="position: center">Shopping Cart</h2>
		<form method="post" action="#">
			<table style="vertical-align: middle; text-align: center">
				<tr>
					<th></th>
					<th><b>Product Name</b></th>
					<th><b>Description</b></th>
					<th><b>In Stock?</b></th>
					<th><b>Quantity</b></th>
					<th><b>List Price</b></th>
					<th><b>Total Cost</b></th>
					<th>&nbsp;</th>
				</tr>

				<c:if test="${sessionScope.cart.numberOfItems == 0}">
					<tr>
						<td colspan="8"><b>Your cart is empty.</b></td>
					</tr>
				</c:if>

				<c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">

					<tr>
						<td style="text-align: center; vertical-align: middle"  >
							<div class="product">
								<div class="image"><a href="viewItem?itemId=${cartItem.item.itemId}">${cartItem.item.product.description}</a></div>
							</div>

						</td>
						<td style="text-align: center ;vertical-align: middle">
							<div class="flex justify-between flex-col">
								<span class="shopName">${cartItem.item.product.name}</span>
								<span class="name">${cartItem.item.product.productId}</span>
								<p></p>
								<a href="viewItem?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>
							</div>
						</td>
						<td style="text-align: center ;vertical-align: middle">
								${cartItem.item.attribute1} ${cartItem.item.attribute2}
								${cartItem.item.attribute3} ${cartItem.item.attribute4}
								${cartItem.item.attribute5} ${cartItem.item.product.name}
						</td>
						<td style="text-align: center ;vertical-align: middle">
								${cartItem.inStock}
						</td>
						<td style="text-align: center ;vertical-align: middle">
							<input type="button"  value="-"  onclick="mun('${cartItem.item.itemId}','${cartItem.item.listPrice}')"/>
							<input type="text" id="quantityOf${cartItem.item.itemId}"  name="${cartItem.item.itemId}" value="${cartItem.quantity}" style="width: 50%" onchange="refreshCart('${cartItem.item.itemId}',${cartItem.item.listPrice});"/>
							<input type="button"  value="+"  onclick="add('${cartItem.item.itemId}','${cartItem.item.listPrice}');"/>
						</td>
						<td style="text-align: center ;vertical-align: middle"><fmt:formatNumber value="${cartItem.item.listPrice}"
																								 pattern="$#,##0.00" />
						</td>
						<td  style="text-align: center ;vertical-align: middle" id="totalOf${cartItem.item.itemId}">
							<fmt:formatNumber value="${cartItem.total}" pattern="$#,##0.00" />
						</td>
						<td style="text-align: center ;vertical-align: middle">
							<a href="removeItemFromCart?workingItemId=${cartItem.item.itemId}" class="btn btn-outline-dark btn-green remove_button " >Remove</a>
						</td>
					</tr>
				</c:forEach>

			</table>

		</form>

		<c:if test="${sessionScope.cart.numberOfItems > 0}">
			<a href="newOrder" class="Button">Proceed to Checkout</a>
		</c:if></div>

	<%--<div id="MyList">--%>
	<%--  <c:if test="${sessionScope.accountBean != null}">--%>
	<%--	<c:if test="${!sessionScope.accountBean.authenticated}">--%>
	<%--	  <c:if test="${!empty sessionScope.accountBean.account.listOption}">--%>
	<%--	    <%@ include file="IncludeMyList.jsp"%>--%>
	<%--      </c:if>--%>
	<%--	</c:if>--%>
	<%--  </c:if>--%>
	<%--</div>--%>

	<div id="Separator">&nbsp</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>