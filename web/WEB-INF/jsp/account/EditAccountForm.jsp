<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
	<form>
		<h3>User Information:</h3>
		<table>
			<tr>
				<td>User ID:</td>
				<td>${sessionScope.account.username}</td>
			</tr>
			<tr>
				<td>User Firstname:</td>
				<td>${sessionScope.account.firstName}</td>
			</tr>
			<tr>
				<td>User Lastname:</td>
				<td>${sessionScope.account.lastName}</td>
			</tr>
			<tr>
				<td>User Email:</td>
				<td>${sessionScope.account.email}</td>
			</tr>
			<tr>
				<td>User Address1:</td>
				<td>${sessionScope.account.address1}</td>
			</tr>
			<tr>
				<td>User Address2:</td>
				<td>${sessionScope.account.address2}</td>
			</tr>
			<tr>
				<td>User City:</td>
				<td>${sessionScope.account.city}</td>
			</tr>
			<tr>
				<td>User State:</td>
				<td>${sessionScope.account.state}</td>
			</tr>
			<tr>
				<td>User Country:</td>
				<td>${sessionScope.account.country}</td>
			</tr>
			<tr>
				<td>User Phone:</td>
				<td>${sessionScope.account.phone}</td>
			</tr>
		</table>
	</form>
	<form action="updateUserInfo?msg=Edit" method="post">
		<h3>Change Password:</h3>
		<table>
				<td>New password:</td>
				<td>
					<input type="password" name="password"/>
				</td>
			</tr>
			<tr>
				<td>Repeat password:</td>
				<td>
					<input type="password" name="repeatPassword" />
				</td>
			</tr>
		</table>
		<%@ include file="IncludeAccountFields.jsp"%>
		<input type="submit" name= "editAccount" value="Save Account Information">
	</form>
	<a href="#">My Orders</a>
	<a href="#">My Log</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
