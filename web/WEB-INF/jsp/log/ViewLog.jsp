<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a href="main">Return to Mains</a>
</div>

<div id="Catalog" style="padding: 10px 320px">

    <h2><br>My Browse Log</h2>

    <table class="table table-hover">
        <tr>
            <th>Item ID</th>
            <th>Time</th>
        </tr>
        <c:forEach var="browseLogs" items="${sessionScope.browseLogList}">
            <tr>
                <td>
                    <a href="viewItem?itemId=${browseLogs.itemId}">${browseLogs.itemId}</a>
                </td>
                <td>
                        ${browseLogs.logDate}
                </td>
            </tr>
        </c:forEach>
    </table>

    <h2>My Add Item To Cart Log</h2>

    <table class="table table-hover">
        <tr>
            <th>Item ID</th>
            <th>Time</th>
        </tr>
        <c:forEach var="addItemToCartLogs" items="${sessionScope.addToItemToCartLogList}">
            <tr>
                <td>
                    <a href="viewItem?itemId=${addItemToCartLogs.itemId}">${addItemToCartLogs.itemId}</a>
                </td>
                <td>
                        ${addItemToCartLogs.logDate}
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>





