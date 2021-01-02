package com.bookshop.user.entity;

/**
 * @ Author     : Rain
 * @ Classname  : Categorysecond
 * @ Date       : 2019/5/30 20:34
 * @ Description:
 */

public class Categorysecond {
    private int categorySecondId;
    private String categorySecondName;
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getCategorySecondId() {
        return categorySecondId;
    }

    public void setCategorySecondId(int categorySecondId) {
        this.categorySecondId = categorySecondId;
    }

    public String getCategorySecondName() {
        return categorySecondName;
    }

    public void setCategorySecondName(String categorySecondName) {
        this.categorySecondName = categorySecondName;
    }


}
