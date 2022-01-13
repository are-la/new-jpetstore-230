package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Cart;
import org.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AutoRefreshCartServlet extends HttpServlet {
    int quantity;
    String itemId;
    Account account;
    Cart cart;
    private CatalogService catalogService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("1234");
        HttpSession session = request.getSession();
        cart = (Cart) session.getAttribute("cart");
        account = (Account) session.getAttribute("account");
        itemId = request.getParameter("itemId");
        quantity = Integer.parseInt(request.getParameter("quantity"));
        cart.setQuantityByItemId(itemId,quantity);
        catalogService = new CatalogService();
        catalogService.updateCart(cart,account);
        session.setAttribute("cart",cart);
        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();

        System.out.println("123");
        out.println("<response>");
        out.println("<msg>Update successfully</msg>");
        out.println("<SubTotal>" + cart.getSubTotal() + "</SubTotal>");
        out.println("</response>");
        out.flush();
        out.close();
    }
}
