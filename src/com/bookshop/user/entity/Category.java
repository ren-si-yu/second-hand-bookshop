package com.bookshop.user.entity;

import java.util.Objects;
import java.util.Set;

/**
 * @ Author     : Rain
 * @ Classname  : Category
 * @ Date       : 2019/5/30 20:34
 * @ Description:
 */

public class Category {
    private int categoryId;
    private String categoryName;
    private Set<Categorysecond> categorysecond;

    public Set<Categorysecond> getCategorysecond() {
        return categorysecond;
    }

    public void setCategorysecond(Set<Categorysecond> categorysecond) {
        this.categorysecond = categorysecond;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return categoryId == category.categoryId &&
                Objects.equals(categoryName, category.categoryName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(categoryId, categoryName);
    }
}
