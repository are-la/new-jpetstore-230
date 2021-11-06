package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Log;
import org.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewLogServlet extends HttpServlet {

    private static final String MyLog = "/WEB-INF/jsp/log/ViewLog.jsp";

    private List<Log> browseLogList;
    private List<Log> addToItemToCartLogList;
    private String workingItemId;

    private LogService logService;
    private Account account;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        workingItemId = request.getParameter("workingItemId");
        System.out.println(workingItemId);
        account = (Account) session.getAttribute("account");
        logService = new LogService();
       // session.setAttribute("workingItemID",workingItemId);
       // logService.insertAddLog(account,workingItemId);
        browseLogList = logService.getBrowseLogListByUsername(account.getUsername());
        addToItemToCartLogList = logService.getAddLogListByUsername(account.getUsername());
        session.setAttribute("browseLogList",browseLogList);
        session.setAttribute("addToItemToCartLogList",addToItemToCartLogList);
        request.getRequestDispatcher(MyLog).forward(request,response);
    }
}
