package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateUserInfoServlet extends HttpServlet {

    private static final String Success = "/WEB-INF/jsp/common/Message.jsp";
    private static final String updateSuccess = "/WEB-INF/jsp/account/EditAccountForm.jsp";
    private static final String Error = "/WEB-INF/jsp/common/Error.jsp";

    // signon table
    private String username;
    private String password;

    // account table
    private String msg;
    private String email;
    private String firstname;
    private String lastname;
    private String address1;
    private String city;
    private String country;
    private String phone;
    private String status;
    private String state;
    private String zip;
    private String address2;
    private String repeatPassword;

    // profile table
    private String langpref;
    private String favcategory;

    private AccountService service;
    private Account account;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checkCode = request.getParameter("checkPIN");
        HttpSession session = request.getSession();
        String validateCode = (String) session.getAttribute("validateCode");
        //删除验证码，这样返回时验证码就会刷新一次
        session.removeAttribute("validateCode");
        if(validateCode!=null && validateCode.equalsIgnoreCase(checkCode)){
            msg = request.getParameter("msg");
            System.out.println("++++"+msg);
            if(msg.equals("New"))
            {
                System.out.println("+++++++");
                // signon table
                username = request.getParameter("username");
                password = request.getParameter("password");
                repeatPassword = request.getParameter("repeatPassword");

                // account table
                email = request.getParameter("email");
                firstname = request.getParameter("firstname");
                lastname = request.getParameter("lastname");
                address1 = request.getParameter("address1");
                address2 = request.getParameter("address2");
                city = request.getParameter("city");
                country = request.getParameter("country");
                phone = request.getParameter("phone");
                state = request.getParameter("state");
                status = request.getParameter("status");
                zip = request.getParameter("zip");

                // profile table
                langpref = request.getParameter("langpref");
                favcategory = request.getParameter("favcategory");

                account = new Account();

                // signon table
                account.setUsername(username);
                account.setPassword(password);

                // account table
                account.setEmail(email);
                account.setFirstName(firstname);
                account.setLastName(lastname);
                account.setAddress1(address1);
                account.setAddress2(address2);
                account.setCity(city);
                account.setCountry(country);
                account.setPhone(phone);
                account.setState(state);
                account.setZip(zip);
                account.setStatus(status);

                // profile table
                account.setLanguagePreference(langpref);
                account.setFavouriteCategoryId(favcategory);

                if(password.equals(repeatPassword))
                {
                    service = new AccountService();
                    service.insertAccount(account);
                    msg = "Register successfully";
                    System.out.println("+++Register successfully");
                    session.setAttribute("message",msg);
                    request.getRequestDispatcher(Success).forward(request,response);
                }else {
                    msg = " The passwords entered are different";
                }
            }
            else if(msg.equals("Edit"))
            {
                account = new Account();
                Account temAccount = (Account) session.getAttribute("account");
                account.setUsername(temAccount.getUsername());
                account.setPassword(request.getParameter("password"));
                account.setFirstName(request.getParameter("account.firstName"));
                account.setLastName(request.getParameter("account.lastName"));
                account.setEmail(request.getParameter("account.email"));
                account.setPhone(request.getParameter("account.phone"));
                account.setAddress1(request.getParameter("account.address1"));
                account.setAddress2(request.getParameter("account.address2"));
                account.setCity(request.getParameter("account.city"));
                account.setState(request.getParameter("account.state"));
                account.setZip(request.getParameter("account.zip"));
                account.setCountry(request.getParameter("account.country"));
                account.setLanguagePreference(request.getParameter("account.languagePreference"));
                account.setFavouriteCategoryId(request.getParameter("account.favouriteCategoryId"));
//            account.setListOption(request.getParameter());
//            account.setBannerOption(request.getParameter());
                System.out.println(account.getAddress2()+" "+account.getFavouriteCategoryId());
                service = new AccountService();
                service.updateAccount(account);
                session.setAttribute("account", account);
                request.getRequestDispatcher(updateSuccess).forward(request,response);
            }
        }else{
            session.setAttribute("message","验证码错误！");
            request.getRequestDispatcher(Error).forward(request,response);
        }
    }
}
