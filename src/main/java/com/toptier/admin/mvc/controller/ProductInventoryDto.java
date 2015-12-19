package com.toptier.admin.mvc.controller;

import org.joda.time.LocalDate;

public class ProductInventoryDto {
    private Integer productId;
    private String productName;
    private boolean activeProduct;
    private InventoryDto inventoryDto;

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

    public InventoryDto getInventory() {
        return inventoryDto;
    }

    public void setInventory(InventoryDto inventoryDto) {
        this.inventoryDto = inventoryDto;
    }

    public static class InventoryDto {
        private String productUnitCode;
        private String baseUnitName;
        private LocalDate intakeDate;
        private int intakeBaseUnitStockLevel;

        public String getProductUnitCode() {
            return productUnitCode;
        }

        public void setProductUnitCode(String productUnitCode) {
            this.productUnitCode = productUnitCode;
        }

        public String getBaseUnitName() {
            return baseUnitName;
        }

        public void setBaseUnitName(String baseUnitName) {
            this.baseUnitName = baseUnitName;
        }

        public LocalDate getIntakeDate() {
            return intakeDate;
        }

        public void setIntakeDate(LocalDate intakeDate) {
            this.intakeDate = intakeDate;
        }

        public int getIntakeBaseUnitStockLevel() {
            return intakeBaseUnitStockLevel;
        }

        public void setIntakeBaseUnitStockLevel(int intakeBaseUnitStockLevel) {
            this.intakeBaseUnitStockLevel = intakeBaseUnitStockLevel;
        }
    }
}
