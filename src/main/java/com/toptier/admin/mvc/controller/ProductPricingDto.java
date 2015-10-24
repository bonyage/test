package com.toptier.admin.mvc.controller;

import com.toptier.core.model.MarketingTag;
import org.joda.time.LocalDate;

import java.math.BigDecimal;

public class ProductPricingDto {

    private static final BigDecimal CENTS_IN_A_DOLLAR = new BigDecimal("100");

    private Integer productId;
    private LocalDate effectiveFrom;
    private BigDecimal baseUnitPrice;
    private MarketingTag marketingTag;
    private boolean active;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public LocalDate getEffectiveFrom() {
        return effectiveFrom;
    }

    public void setEffectiveFrom(LocalDate effectiveFrom) {
        this.effectiveFrom = effectiveFrom;
    }

    public BigDecimal getBaseUnitPrice() {
        return baseUnitPrice;
    }

    public void setBaseUnitPrice(BigDecimal baseUnitPrice) {
        this.baseUnitPrice = baseUnitPrice;
    }

    public Integer getBaseUnitPriceInCents() {
        return getBaseUnitPrice().multiply(CENTS_IN_A_DOLLAR).intValue();
    }

    public void setBaseUnitPriceInCents(Integer baseUnitPriceInCents) {
        BigDecimal baseUnitPrice = new BigDecimal(baseUnitPriceInCents).divide(CENTS_IN_A_DOLLAR, 2, BigDecimal.ROUND_HALF_UP);
        setBaseUnitPrice(baseUnitPrice);
    }

    public MarketingTag getMarketingTag() {
        return marketingTag;
    }

    public void setMarketingTag(MarketingTag marketingTag) {
        this.marketingTag = marketingTag;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
