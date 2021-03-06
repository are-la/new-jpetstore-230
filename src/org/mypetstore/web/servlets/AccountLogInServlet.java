package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AccountLogInServlet extends HttpServlet {
    private static final String Main = "/WEB-INF/jsp/catalog/Main.jsp";
    private static final String ErrorString = "Wrong username or password";
    private static final String Error = "/WEB-INF/jsp/common/Message.jsp";
    private static final String SignOn = "/WEB-INF/jsp/account/SignonForm.jsp";
    private String username;
    private String password;
    private Account account;

    private AccountService service;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checkCode = request.getParameter("checkPIN");
        username = request.getParameter("username");
        password = request.getParameter("password");

        HttpSession session = request.getSession();
        String validateCode = (String) session.getAttribute("validateCode");
        //删除验证码，这样返回时验证码就会刷新一次
        session.removeAttribute("validateCode");
        if(validateCode!=null && validateCode.equalsIgnoreCase(checkCode)){
            service = new AccountService();
            account = new Account();
            account = service.getAccount(username,password);
            if(account != null)
            {
                System.out.println("login account is not null and account is "+ account.getUsername()+" "+ account.getPassword());
                session.setAttribute("account",account);
                request.getRequestDispatcher(Main).forward(request,response);
            }
            else {
                System.out.println("login account is null");
                session.setAttribute("message",ErrorString);
                request.getRequestDispatcher(SignOn).forward(request,response);
            }
        }else{
            session.setAttribute("message","验证码错误！");
            request.getRequestDispatcher(Error).forward(request,response);
        }
//        service = new AccountService();
//        account = new Account();
//        account = service.getAccount(username,password);
//        if(account != null)
//        {
//            System.out.println("login account is not null and account is "+ account.getUsername()+" "+ account.getPassword());
//            HttpSession session = request.getSession();
//            session.setAttribute("account",account);
//            request.getRequestDispatcher(Main).forward(request,response);
//        }
//        else {
//            System.out.println("login account is null");
//            HttpSession session = request.getSession();
//            session.setAttribute("message",ErrorString);
//            request.getRequestDispatcher(SignOn).forward(request,response);
//        }
    }
}
