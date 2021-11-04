<%@ include file="../common/IncludeTop.jsp"%>
<script src="js/checkUsernameIsExist.js"></script>
<div id="Catalog">
	<form action="updateUserInfo?msg=New" method="post" name="registerForm">
		<h3>User Information</h3>
		<table>
			<tr>
				<td>User ID:</td>
				<td>
					<input type="text" name="username" onblur="usernameIsExist();"/>
					<div id="usernameMsg"></div>
				</td>
			</tr>
			<tr>
				<td>New password:</td>
				<td>
					<input type="password" name="password"/>
				</td>
			</tr>
			<tr>
				<td>Repeat password:</td>
				<td>
					<input type="password" name="repeatPassword"/>
				</td>
			</tr>

			<tr>
				<td>Email:</td>
				<td>
					<input type="text" name="email"/>
				</td>
			</tr>

			<tr>
				<td>Firstname:</td>
				<td>
					<input type="text" name="firstname"/>
				</td>
			</tr>

			<tr>
				<td>Lastname</td>
				<td>
					<input type="text" name="lastname"/>
				</td>
			</tr>

			<tr>
				<td>Address1:</td>
				<td>
					<input type="text" name="address1"/>
				</td>
			</tr>

			<tr>
				<td>Address2:</td>
				<td>
					<input type="text" name="address2"/>
				</td>
			</tr>

			<tr>
				<td>City:</td>
				<td>
					<input type="text" name="city"/>
				</td>
			</tr>

			<tr>
				<td>State:</td>
				<td>
					<input type="text" name="state"/>
				</td>
			</tr>

			<tr>
				<td>Country:</td>
				<td>
					<input type="text" name="country"/>
				</td>
			</tr>

			<tr>
				<td>Phone:</td>
				<td>
					<input type="text" name="phone"/>
				</td>
			</tr>

			<tr>
				<td>Status:</td>
				<td>
					<input type="text" name="status"/>
				</td>
			</tr>
			<tr>
				<td>Zip:</td>
				<td>
					<input type="text" name="zip"/>
				</td>
			</tr>

			<tr>
				<td>Prefered language</td>
				<td>
					<input type="text" name="langpref" value="english"/>
				</td>
			</tr>

			<tr>
				<td>Favoraite Category:</td>
				<td>
					<input type="text" name="favcategory" value="DOGS"/>
				</td>
			</tr>

		</table>


		<%--		<%@ include file="IncludeAccountFields.jsp"%>--%>

		<input type="submit" name="newAccount" value="Save Account Information"/>
	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>