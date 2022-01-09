<%@ include file="../common/IncludeTop.jsp"%>
<script src="js/jquery.js"></script>
<script src="js/dynamicSecurityCode.js"></script>

<div id="Catalog">
	<form method="post" action="logIn" onsubmit="return checkCode()">
	<p>${sessionScope.message}</p>
	<p>Username:
		<input type="text" name="username" value="j2ee">
		<br>
		<br>
	Password:
		<input type="password" name="password" value="j2ee">
		<br>
		<br>
			PIN:
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="checkPIN" name="checkPIN" onblur="checkCode()">

<%--		<div class="container">--%>

<%--			<form class="form-signin" autocomplete="off">--%>
<%--				<h2 class="form-signin-heading text-primary text-center">login</h2>--%>
<%--				<span class="text-muted">Please enter username and password</span>--%>
<%--				<!-- 将需要用到清除按钮的输入框放到 'input-group-clear' 的div中，添加一个 'input-clear' 的span -->--%>

<%--				<div class="input-group-clear" style="position:relative">--%>
<%--					<label for="username" class="sr-only">UserName</label>--%>
<%--					<input type="text" id="username" class="form-control" placeholder="username" required autofocus>--%>
<%--					<span class="input-clear isfocus">--%>
<%--                    &times;--%>
<%--                </span>--%>
<%--				</div>--%>
<%--				<div class="input-group-clear" style="position:relative">--%>
<%--					<label for="password" class="sr-only">Password</label>--%>
<%--					<input type="password" id="password" class="form-control" placeholder="password" required>--%>
<%--					<span class="input-clear">--%>
<%--                    &times;--%>
<%--                </span>--%>
<%--				</div>--%>
<%--				<button class="btn btn-lg btn-primary btn-block" type="button" id="login-btn">login</button>--%>
<%--			</form>--%>
<%--	</div>--%>

<%--		<div style="display:inline-block;position:relative;">--%>
<%--			<div style="position:absolute;right:2px;top:-2px;cursor:pointer;display:none;" class="input_clear">--%>
<%--				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
<%--					×--%>
<%--				</button>--%>
<%--			</div>--%>
<%--			<input type="text" id="checkPIN" name="checkPIN" onblur="checkCode()" placeholder="please enter PIN" class="input-text w200 form-control" aria-describedby="basic-addon1" name="keyword" id="keyword" style="height:35px;" >--%>
<%--		</div>--%>

		<span id="is_right"></span>
			<br>
		    <br>
			<img id="security" src="validateCode">
			&nbsp;&nbsp;&nbsp;
		<a href="javascript:dynamicSecurity();">Change to another one</a>
		<br>
<%--			<a href="viewAccount?msg=logIn" >Change to another one</a>--%>
		</p>
		<input type="submit" value="login" >

	</form>
	Need a user name and password?
	<a href="viewAccount?msg=New">Register Now!</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

