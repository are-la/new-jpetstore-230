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
import java.util.List;

public class SearchProductServlet extends HttpServlet {
    private String keyword;
    private static final String View_Search_Product = "/WEB-INF/jsp/catalog/SearchProducts.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        keyword = request.getParameter("keyword");
        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList(keyword);
        HttpSession session = request.getSession();
        session.setAttribute("productList",productList);
        request.getRequestDispatcher(View_Search_Product).forward(request,response);
    }
}
