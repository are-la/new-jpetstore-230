package org.mypetstore.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class CheckPINServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checkCode = request.getParameter("checkPIN");
        HttpSession session = request.getSession();
        String validateCode = (String) session.getAttribute("validateCode");
        //比对输出
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(checkCode.equals(validateCode)){
            System.out.println(true);
            out.print("验证码正确");
        }else{
            System.out.println(false);
            out.print("验证码错误");
        }
        out.close();
    }
}