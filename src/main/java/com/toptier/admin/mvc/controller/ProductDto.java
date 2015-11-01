package com.toptier.admin.mvc.controller;

import com.google.common.base.Strings;

/**
 * Created by wwong on 8/23/15.
 */
public class ProductDto {

    private Integer id;
    private Long version;
    private String name;
    private String sku;
    private String shortDescription;
    private String longDescription;
    private String marketingText;
    private boolean active;
    private String iconImageKey;
    private String frontSmallImageKey;
    private String frontMediumImageKey;
    private String frontLargeImageKey;
    private String sideSmallImageKey;
    private String sideMediumImageKey;
    private String sideLargeImageKey;
    private String backSmallImageKey;
    private String backMediumImageKey;
    private String backLargeImageKey;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public String getMarketingText() {
        return marketingText;
    }

    public void setMarketingText(String marketingText) {
        this.marketingText = marketingText;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getIconImageKey() {
        return iconImageKey;
    }

    public void setIconImageKey(String iconImageKey) {
        this.iconImageKey = iconImageKey;
    }

    public String getIconImageUrl() {
        return constructImageUrl(getIconImageKey());
    }

    public String getFrontSmallImageKey() {
        return frontSmallImageKey;
    }

    public void setFrontSmallImageKey(String frontSmallImageKey) {
        this.frontSmallImageKey = frontSmallImageKey;
    }

    public String getFrontSmallImageUrl() {
        return constructImageUrl(getFrontSmallImageKey());
    }

    public String getFrontMediumImageKey() {
        return frontMediumImageKey;
    }

    public void setFrontMediumImageKey(String frontMediumImageKey) {
        this.frontMediumImageKey = frontMediumImageKey;
    }

    public String getFrontMediumImageUrl() {
        return constructImageUrl(getFrontMediumImageKey());
    }

    public String getFrontLargeImageKey() {
        return frontLargeImageKey;
    }

    public void setFrontLargeImageKey(String frontLargeImageKey) {
        this.frontLargeImageKey = frontLargeImageKey;
    }

    public String getFrontLargeImageUrl() {
        return constructImageUrl(getFrontLargeImageKey());
    }

    public String getSideSmallImageKey() {
        return sideSmallImageKey;
    }

    public void setSideSmallImageKey(String sideSmallImageKey) {
        this.sideSmallImageKey = sideSmallImageKey;
    }

    public String getSideSmallImageUrl() {
        return constructImageUrl(getSideSmallImageKey());
    }

    public String getSideMediumImageKey() {
        return sideMediumImageKey;
    }

    public void setSideMediumImageKey(String sideMediumImageKey) {
        this.sideMediumImageKey = sideMediumImageKey;
    }

    public String getSideMediumImageUrl() {
        return constructImageUrl(getSideMediumImageKey());
    }

    public String getSideLargeImageKey() {
        return sideLargeImageKey;
    }

    public void setSideLargeImageKey(String sideLargeImageKey) {
        this.sideLargeImageKey = sideLargeImageKey;
    }

    public String getSideLargeImageUrl() {
        return constructImageUrl(getSideLargeImageKey());
    }

    public String getBackSmallImageKey() {
        return backSmallImageKey;
    }

    public void setBackSmallImageKey(String backSmallImageKey) {
        this.backSmallImageKey = backSmallImageKey;
    }

    public String getBackSmallImageUrl() {
        return constructImageUrl(getBackSmallImageKey());
    }

    public String getBackMediumImageKey() {
        return backMediumImageKey;
    }

    public void setBackMediumImageKey(String backMediumImageKey) {
        this.backMediumImageKey = backMediumImageKey;
    }

    public String getBackMediumImageUrl() {
        return constructImageUrl(getBackMediumImageKey());
    }

    public String getBackLargeImageKey() {
        return backLargeImageKey;
    }

    public void setBackLargeImageKey(String backLargeImageKey) {
        this.backLargeImageKey = backLargeImageKey;
    }

    public String getBackLargeImageUrl() {
        return constructImageUrl(getBackLargeImageKey());
    }

    private String constructImageUrl(String imageKey) {
        return !Strings.isNullOrEmpty(imageKey) ? "/images/product/" + imageKey : null;
    }
}
