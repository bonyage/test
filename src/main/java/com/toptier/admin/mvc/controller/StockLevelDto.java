package com.toptier.admin.mvc.controller;

public class StockLevelDto {
    private Integer productId;
    private String productName;
    private boolean activeProduct;
    private int quantity;
    private String unit;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public boolean isActiveProduct() {
        return activeProduct;
    }

    public void setActiveProduct(boolean activeProduct) {
        this.activeProduct = activeProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
