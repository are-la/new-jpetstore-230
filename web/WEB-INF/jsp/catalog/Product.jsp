<%@ include file="../common/IncludeTop.jsp" %>


<div class="home-scrolldown">
    <a href="viewCategory?categoryId=${sessionScope.product.categoryId}" class="scroll-icon smoothscroll">Return
        to ${sessionScope.product.categoryId}-></a>
</div>

<div id="Catalog" style="padding: 10px 50px;height: 650px;">

    <h2>${sessionScope.product.name}</h2>

    <table class="table table-hover">
        <tr>
            <th>Item ID</th>
            <th>Product ID</th>
            <th>Description</th>
            <th>List Price</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach var="item" items="${sessionScope.itemList}">
            <tr>
                <td>
                    <a href="viewItem?itemId=${item.itemId}">${item.itemId}</a>
                </td>
                <td>
                        ${item.product.productId}
                </td>
                <td>
                        ${item.attribute1} ${item.attribute2} ${item.attribute3}
                        ${item.attribute4} ${item.attribute5} ${sessionScope.product.name}
                </td>
                <td>
                    <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                </td>
                <td>
                    <a class="Button" href="addItemToDCart?workingItemId=${item.itemId}">Add to Cart</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>





