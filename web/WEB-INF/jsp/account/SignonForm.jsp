<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
	<form method="post" action="logIn">
	<p>${sessionScope.message}</p>
	<p>Username:
		<input type="text" name="username" value="j2ee">
	Password:
		<input type="password" name="password" value="j2ee">
	</p>
		<input type="submit" value="login">

	</form>
	Need a user name and password?
	<a href="viewAccount?msg=New">Register Now!</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

