package org.mypetstore.web.servlets;

import org.mypetstore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("post 请求");
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("get 请求");
        HttpSession session = req.getSession();
        Cart cart = (Cart)session.getAttribute("cart");

        if(cart == null){
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        req.getRequestDispatcher(VIEW_CART).forward(req,resp);
    }
}
