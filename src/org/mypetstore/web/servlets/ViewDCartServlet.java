package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Cart;
import org.mypetstore.service.CatalogService;
import org.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewDCartServlet extends HttpServlet {

    private static final String View_Cart = "/WEB-INF/jsp/cart/Cart.jsp";

    private Account account;
    private CatalogService catalogService;
    private Cart cart;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        account = (Account) session.getAttribute("account");
        catalogService = new CatalogService();
        cart = catalogService.getCart(account.getUsername());
        if(cart == null){
            cart = new Cart();
        }
        session.setAttribute("cart",cart);
        request.getRequestDispatcher(View_Cart).forward(request,response);
    }
}
