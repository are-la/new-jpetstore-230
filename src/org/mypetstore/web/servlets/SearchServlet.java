package org.mypetstore.web.servlets;

import com.google.gson.Gson;
import org.mypetstore.domain.Product;
import org.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Search Servlet", value = "/searchapi")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("product");
        System.out.println(keyword);
        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList(keyword);
        String productJsonString = new Gson().toJson(productList);

        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(productJsonString);
        out.flush();
    }
}
