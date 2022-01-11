<%@ include file="../common/IncludeTop.jsp"%>
<script src="js/checkUsernameIsExist.js"></script>
<script src="js/dynamicSecurityCode.js"></script>
<div id="Catalog" style="padding: 0px 400px">
	<form class="bs-example bs-example-form" action="updateUserInfo?msg=New" method="post" name="registerForm" onsubmit="return checkCode()">
		<h4>User Information</h4>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">User ID:</span>
			<input type="text" class="form-control" name="username" onblur="usernameIsExist();"/>
		</div>
		<span id="usernameMsg"></span>

		<div class="input-group input-group-sm">
			<span class="input-group-addon">New password:</span>
			<input type="text" class="form-control" name="password"/>
		</div>

		<div class="input-group input-group-sm">
			<span class="input-group-addon">Repeat password:</span>
			<input type="text" class="form-control" name="repeatPassword"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Email:</span>
			<input type="text" class="form-control" name="email"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Firstname:</span>
			<input type="text" class="form-control" name="firstname"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Lastname:</span>
			<input type="text" class="form-control" name="lastname"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Address1:</span>
			<input type="text" class="form-control" name="address1"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Address2:</span>
			<input type="text" class="form-control" name="address2"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">City:</span>
			<input type="text" class="form-control" name="city"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">State:</span>
			<input type="text" class="form-control" name="state"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Country:</span>
			<input type="text" class="form-control" name="country"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Phone:</span>
			<input type="text" class="form-control" name="phone"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Status:</span>
			<input type="text" class="form-control" name="status"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Zip:</span>
			<input type="text" class="form-control" name="zip"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Prefered language: </span>
			<input type="text" class="form-control" name="langpref" value="english"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">Favoraite Category:</span>
			<input type="text" class="form-control" name="favcategory" value="DOGS"/>
		</div>
		<div class="input-group input-group-sm">
			<span class="input-group-addon">P  I  N    :</span>
			<input type="text" class="form-control" name="checkPIN"/>
		</div>
		<span id="is_right"></span>
		<img id="security" src="validateCode">
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;<a href="javascript:dynamicSecurity();">Change to another one</a>

		<%--		<%@ include file="IncludeAccountFields.jsp"%>--%>
		<br>

		<input class="btn btn-info btn-block active" type="submit" name="newAccount" value="Save Account Information"/>
	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>