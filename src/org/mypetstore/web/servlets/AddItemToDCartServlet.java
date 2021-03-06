package org.mypetstore.web.servlets;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Cart;
import org.mypetstore.domain.CartItem;
import org.mypetstore.domain.Item;
import org.mypetstore.service.CatalogService;
import org.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddItemToDCartServlet extends HttpServlet {

    private static final String View_Cart = "/WEB-INF/jsp/cart/Cart.jsp";
    private static final String SIGNON = "/WEB-INF/jsp/account/SignonForm.jsp";

    private String workingItemId;
    private Cart cart;
    private CartItem cartItem;

    private CatalogService catalogService;

    //新代码部分
    private LogService logService;
    private Account account;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        workingItemId = request.getParameter("workingItemId");
     //   account = (Account) session.getAttribute("account");
//        logService = new LogService();
//        logService.insertAddLog(account,workingItemId);
//        System.out.println(workingItemId);
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null)
            request.getRequestDispatcher(SIGNON).forward(request,response);
        cart = (Cart)session.getAttribute("cart");

        //新代码部分
        account = (Account) session.getAttribute("account");
        logService = new LogService();
        logService.insertAddLog(account,workingItemId);
//        logService = new LogService();
//        logService.insertAddLog(account,workingItemId);


        if(cart == null)
        {
            cart = new Cart();
        }
        if(cart.containsItemId(workingItemId))
        {
            cart.incrementQuantityByItemId(workingItemId);
            catalogService.updateCart(cart,account);
        }else {
            catalogService = new CatalogService();
            boolean isInStock = catalogService.isItemInStock(workingItemId);
            Item item = catalogService.getItem(workingItemId);
            cart.addItem(item,isInStock);
            catalogService.addItemToCart(account,cart.getCartItemList().get(cart.getNumberOfItems() - 1));
        }
        session.setAttribute("cart",cart);
        request.getRequestDispatcher(View_Cart).forward(request,response);
    }
}
