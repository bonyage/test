package com.toptier.admin.mvc.controller;

import com.toptier.core.model.MarketingTag;
import org.joda.time.LocalDate;

import java.math.BigDecimal;

public class ProductPricingDto {

    private static final BigDecimal CENTS_IN_A_DOLLAR = new BigDecimal("100");

    private Integer priceId;
    private Integer productId;
    private LocalDate effectiveFrom;
    private BigDecimal baseUnitPrice;
    private BigDecimal marketingBaseUnitPrice;
    private MarketingTag marketingTag;
    private boolean active;
    private boolean stockedProduct;
    
    public ProductPricingDto(boolean active)
    {
    	this.active = active;
    }
    
    public ProductPricingDto()
    {
    }
    
    public Integer getPriceId() {
		return priceId;
	}

	public void setPriceId(Integer priceId) {
		this.priceId = priceId;
	}

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
    	if (baseUnitPriceInCents == null)
    	{
    		setBaseUnitPrice(BigDecimal.ZERO);
    	}
    	else 
    	{    		
    		BigDecimal baseUnitPrice = new BigDecimal(baseUnitPriceInCents).divide(CENTS_IN_A_DOLLAR, 2, BigDecimal.ROUND_HALF_UP);
    		setBaseUnitPrice(baseUnitPrice);
    	}
    }

    public void setMarketingBaseUnitPriceInCents(Integer marketBaseUnitPriceInCents) {
    	if (marketBaseUnitPriceInCents == null)
    	{
            setMarketingBaseUnitPrice(BigDecimal.ZERO);
    	}
    	else {
	        BigDecimal temp = new BigDecimal(marketBaseUnitPriceInCents).divide(CENTS_IN_A_DOLLAR, 2, BigDecimal.ROUND_HALF_UP);
	        setMarketingBaseUnitPrice(temp);
    	}
    }
        

    public BigDecimal getMarketingBaseUnitPrice() {
		return marketingBaseUnitPrice;
	}

	public void setMarketingBaseUnitPrice(BigDecimal marketingBaseUnitPrice) {
		this.marketingBaseUnitPrice = marketingBaseUnitPrice;
	}
	
    public Integer getMarketBaseUnitPriceInCents() {
        return getMarketingBaseUnitPrice().multiply(CENTS_IN_A_DOLLAR).intValue();
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

	public boolean isStockedProduct() {
		return stockedProduct;
	}

	public void setStockedProduct(boolean stockedProduct) {
		this.stockedProduct = stockedProduct;
	}
    
}
