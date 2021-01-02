package com.bookshop.user.dao;

import com.bookshop.user.entity.Category;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : CategoryDAO
 * @ Date       : 2019/5/30 20:20
 * @ Description:
 */

public interface CategoryDAO {

    public List<Category> getCategory();
}
