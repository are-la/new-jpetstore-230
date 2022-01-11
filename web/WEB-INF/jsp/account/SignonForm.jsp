<%@ include file="../common/IncludeTop.jsp"%>
<script src="js/jquery.js"></script>
<script src="js/dynamicSecurityCode.js"></script>

<div style="padding: 20px 400px ;">
    <h5 class="text-center">${sessionScope.message}</h5>
    <br>
    <br>
    <br>

    <form class="bs-example bs-example-form" role="form" method="post" action="logIn" onsubmit="return checkCode()">
        <div class="input-group input-group-lg">
            <span class="input-group-addon">Username:</span>
            <input type="text" class="form-control" name="username" value="j2ee" placeholder="Username">
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-addon">Password:</span>
            <input maxlength="10px" type="password" class="form-control" name="password" value="j2ee" placeholder="Password">
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-addon">PIN:</span>
            <input type="text" class="form-control" id="checkPIN" name="checkPIN" onblur="checkCode()" placeholder="PIN">
        </div>
        <span id="is_right"></span>
        <br>
        <br>
        <img class="img-rounded" id="security" src="validateCode">
        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;<a href="javascript:dynamicSecurity();">Change to another one</a>
        <br>
        <br>
        <input type="submit" value="login" class="btn btn-info btn-block active">
    </form>
    <br>
    Need a user name and password?
    <a href="viewAccount?msg=New">Register Now!</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

