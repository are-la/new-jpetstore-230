package org.mypetstore.web.servlets;

import org.mypetstore.domain.Category;
import org.mypetstore.domain.Product;
import org.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewCatagoryServlet extends HttpServlet {

    private static final String VIEW_CATEGORY = "/WEB-INF/jsp/catalog/Category.jsp";

    private String categoryId;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    System.out.println("post 请求");
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    System.out.println("get 请求");
        categoryId = req.getParameter("categoryId");
        CatalogService service = new CatalogService();
        Category category = service.getCategory(categoryId);
        List<Product> productList = service.getProductListByCategory(categoryId);

        HttpSession session = req.getSession();
        session.setAttribute("category", category);
        session.setAttribute("productList", productList);

        req.getRequestDispatcher(VIEW_CATEGORY).forward(req,resp);
    }
}
