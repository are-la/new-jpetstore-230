<%@ include file="../common/IncludeTop.jsp"%>
<div style="padding: 10px 320px">

	<h2 style="text-align: center">My Orders</h2>

	<table class="table table-hover">
		<tr>
			<th>Order ID</th>
			<th>Date</th>
			<th>Total Price</th>
		</tr>
		<c:if test="${sessionScope.orderList == null}">
			<tr>
				<td colspan="3"><b>Your orderList is empty.</b></td>
			</tr>
		</c:if>
		<c:forEach var="order" items="${sessionScope.orderList}">
			<tr>
				<td>
					<a href="viewOrder?orderId=${order.orderId}&msg=view">${order.orderId}</a>
				</td>
				<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatNumber value="${order.totalPrice}" pattern="$#,##0.00" /></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>


