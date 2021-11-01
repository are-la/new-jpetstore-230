package org.mypetstore.persistence;

import org. mypetstore . domain. Product ;

import java.util.List;

public interface ProductDAO {
    //根据大类的名称得到类中的信息
    List<Product> getProductListByCategory(String categoryId);

    Product getProduct(String productId);

    List<Product> searchProductList(String keywords);

}
