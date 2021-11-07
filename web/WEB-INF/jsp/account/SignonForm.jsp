<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
	<form method="post" action="logIn">
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
		<input type="text" name="checkPIN">
			<br>
		    <br>
			<img src="validateCode">
			&nbsp;&nbsp;&nbsp;
			<a href=""viewAccount?msg=logIn">Change another one</a>
		</p>
		<input type="submit" value="login">

	</form>
	Need a user name and password?
	<a href="viewAccount?msg=New">Register Now!</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

