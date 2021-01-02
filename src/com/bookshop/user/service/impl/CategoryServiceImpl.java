package com.bookshop.user.service.impl;

import com.bookshop.user.dao.CategoryDAO;
import com.bookshop.user.entity.Category;
import com.bookshop.user.service.CategoryService;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : CategoryServiceImpl
 * @ Date       : 2019/5/30 20:43
 * @ Description:
 */

public class CategoryServiceImpl implements CategoryService {
    private CategoryDAO categoryDAO;

    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Override
    public List<Category> getCategory() {
        return categoryDAO.getCategory();
    }
}
