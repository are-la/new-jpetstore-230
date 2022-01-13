<%@ include file="../common/IncludeTop.jsp" %>
<script src="js/checkUsernameIsExist.js"></script>
<script src="js/dynamicSecurityCode.js"></script>
<div id="Catalog" style="padding: 0px 400px">
    <form action="updateUserInfo?msg=New" method="post" name="registerForm" onsubmit="return checkCode()">
        <h3>User Information</h3>
        <table class="table table-hover table-condensed">
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

            <tr>
                <td>PIN:</td>
                <td>
                    <input type="text" name="checkPIN">
                    <div id="is_right"></div>
                </td>
            </tr>
            <tr>
                <td><img src="validateCode"></td>
                <td><a href="javascript:dynamicSecurity();">Change another one</a></td>
            </tr>
        </table>
        <input class="btn btn-info btn-block active" type="submit" name="newAccount" value="Save Account Information"/>
    </form>
    <br>
</div>

<%@ include file="../common/IncludeBottom.jsp" %>