<%@ include file="../common/IncludeTop.jsp" %>

<div class="home-scrolldown">
    <a href="main" class="scroll-icon smoothscroll">Return to Main Menu-></a>
</div>

<div id="Catalog" style="padding:10px 150px;height: 650px">

    <table class="table table-hover">
        <tr>
            <th>&nbsp;</th>
            <th>Product ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="product" items="${sessionScope.productList}">
            <tr>
                <td>
                    <a href="viewProduct?productId=${product.productId}">${product.description}</a>
                </td>
                <td><b>
                    <a href="viewProduct?productId=${product.productId}" font color="BLACK"> ${product.productId}</a>
                </b></td>
                <td>${product.name}</td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>




