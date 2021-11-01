package org.mypetstore.web.servlets;

import org.mypetstore.domain.Item;
import org.mypetstore.domain.Product;
import org.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SearchProductServlet extends HttpServlet {
    private static final String SEARCH = "/WEB-INF/jsp/catalog/SearchProducts.jsp";

    private String productId;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //    System.out.println("post 请求");
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //    System.out.println("get 请求");
        productId = req.getParameter("productId");
        CatalogService service = new CatalogService();
        Product product = service.getProduct(productId);

        HttpSession session = req.getSession();
        session.setAttribute("product", product);
        req.getRequestDispatcher(SEARCH).forward(req,resp);
    }
}
