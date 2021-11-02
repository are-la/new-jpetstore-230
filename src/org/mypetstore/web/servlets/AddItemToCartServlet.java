package org.mypetstore.web.servlets;

import org.mypetstore.domain.Cart;
import org.mypetstore.domain.Item;
import org.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddItemToCartServlet extends HttpServlet {
    //1.处理完请求后的跳转页面
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";

    //2.定义出来该请求的数据
    private String workingItemId;
    private Cart cart;

    //3、是否需要调用业务逻辑层
    private CatalogService catalogService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("post 请求");
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("购物车的 get 请求");

        workingItemId = req.getParameter("workingItemId");
        HttpSession session = req.getSession();
        cart = (Cart)session.getAttribute("cart");

//        System.out.println("1");
        if(cart == null){
            cart = new Cart();
        }

        if(cart.containsItemId(workingItemId)){
//            System.out.println("2");
            cart.incrementQuantityByItemId(workingItemId);
        }else{
            catalogService = new CatalogService();
//            System.out.println("3");
            boolean isInStock = catalogService.isItemInStock(workingItemId);
//            System.out.println("4");
            Item item = catalogService.getItem(workingItemId);
//            System.out.println("5");
            cart.addItem(item,isInStock);
//            System.out.println("6");
        }
//        System.out.println("测试cart === "+cart.getNumberOfItems());
        session.setAttribute("cart", cart);
        req.getRequestDispatcher(VIEW_CART).forward(req,resp);
    }
}
