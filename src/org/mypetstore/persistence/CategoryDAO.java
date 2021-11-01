package org.mypetstore.persistence;

import java.util.List;
import org.mypetstore.domain.Category;

public interface CategoryDAO {
    //查询所有category
    List<Category> getCategoryList();
    //通过ID查找category
    Category getCategory(String categoryId);
}
