package com.toptier.admin.mvc.controller;

import com.google.common.base.Strings;
import com.toptier.core.model.Product;
import com.toptier.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Product> allProducts =  productService.getAllProducts();
		return new ModelAndView("product.list", "allProducts", allProducts);
	}

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView newProductForm(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("product.form");
        modelAndView.addObject("product", new ProductDto());
        modelAndView.addObject("heading", "New Product");
        modelAndView.addObject("action", addNewProductUrl(request));
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView addNewProduct(@ModelAttribute ProductDto product) {
        productService.saveCreateProduct(toEntity(product));
        return new ModelAndView("redirect:list");
    }

    @RequestMapping(value = "/{productId}", method = RequestMethod.GET)
    public ModelAndView editProduct(HttpServletRequest request, @PathVariable int productId) {
        Product product = productService.getProduct(productId);
        // TODO Deal with product == null
        ModelAndView modelAndView = new ModelAndView("product.form");
        modelAndView.addObject("product", toDto(product));
        modelAndView.addObject("heading", "Edit Product");
        modelAndView.addObject("action", updateProductUrl(request, productId));
        return modelAndView;
    }

    @RequestMapping(value = "/{productId}", method = RequestMethod.POST)
    public ModelAndView updateProduct(@ModelAttribute ProductDto dto) {
        productService.saveUpdateProduct(toEntity(dto));
        return new ModelAndView("redirect:list");
    }

    private String addNewProductUrl(HttpServletRequest request) {
        return request.getContextPath() + "/product/";
    }

    private String updateProductUrl(HttpServletRequest request, int productId) {
        return request.getContextPath() + "/product/" + productId;
    }

    private Product toEntity(ProductDto dto) {
        Product product = new Product();
        product.setId(dto.getId());
        product.setVersion(dto.getVersion());
        product.setName(dto.getName());
        product.setShortDescription(dto.getShortDescription());
        product.setLongDescription(dto.getLongDescription());
        product.setMarketingText(dto.getMarketingText());
        product.setSku(dto.getSku());
        product.setActive(dto.isActive());

        // Icon
        if (!Strings.isNullOrEmpty(dto.getIconImageKey())) product.setIconImage(dto.getIconImageKey());
        // Front
        if (!Strings.isNullOrEmpty(dto.getFrontSmallImageKey())) product.setFrontSmallImage(dto.getFrontSmallImageKey());
        if (!Strings.isNullOrEmpty(dto.getFrontMediumImageKey())) product.setFrontMediumImage(dto.getFrontMediumImageKey());
        if (!Strings.isNullOrEmpty(dto.getFrontLargeImageKey())) product.setFrontLargeImage(dto.getFrontLargeImageKey());
        // Side
        if (!Strings.isNullOrEmpty(dto.getSideSmallImageKey())) product.setSideSmallImage(dto.getSideSmallImageKey());
        if (!Strings.isNullOrEmpty(dto.getSideMediumImageKey())) product.setSideMediumImage(dto.getSideMediumImageKey());
        if (!Strings.isNullOrEmpty(dto.getSideLargeImageKey())) product.setSideLargeImage(dto.getSideLargeImageKey());
        // Back
        if (!Strings.isNullOrEmpty(dto.getBackSmallImageKey())) product.setBackSmallImage(dto.getBackSmallImageKey());
        if (!Strings.isNullOrEmpty(dto.getBackMediumImageKey())) product.setBackMediumImage(dto.getBackMediumImageKey());
        if (!Strings.isNullOrEmpty(dto.getBackLargeImageKey())) product.setBackLargeImage(dto.getBackLargeImageKey());

        return product;
    }

    private ProductDto toDto(Product product) {
        ProductDto dto = new ProductDto();
        dto.setId(product.getId());
        dto.setVersion(product.getVersion());
        dto.setName(product.getName());
        dto.setShortDescription(product.getShortDescription());
        dto.setLongDescription(product.getLongDescription());
        dto.setMarketingText(product.getMarketingText());
        dto.setSku(product.getSku());
        dto.setActive(product.isActive());

        // Icon
        if (!Strings.isNullOrEmpty(product.getIconImage())) dto.setIconImageKey(product.getIconImage());
        // Front
        if (!Strings.isNullOrEmpty(product.getFrontSmallImage())) dto.setFrontSmallImageKey(product.getFrontSmallImage());
        if (!Strings.isNullOrEmpty(product.getFrontMediumImage())) dto.setFrontMediumImageKey(product.getFrontMediumImage());
        if (!Strings.isNullOrEmpty(product.getFrontLargeImage())) dto.setFrontLargeImageKey(product.getFrontLargeImage());
        // Side
        if (!Strings.isNullOrEmpty(product.getSideSmallImage())) dto.setSideSmallImageKey(product.getSideSmallImage());
        if (!Strings.isNullOrEmpty(product.getSideMediumImage())) dto.setSideMediumImageKey(product.getSideMediumImage());
        if (!Strings.isNullOrEmpty(product.getSideLargeImage())) dto.setSideLargeImageKey(product.getSideLargeImage());
        // Back
        if (!Strings.isNullOrEmpty(product.getBackSmallImage())) dto.setBackSmallImageKey(product.getBackSmallImage());
        if (!Strings.isNullOrEmpty(product.getBackMediumImage())) dto.setBackMediumImageKey(product.getBackMediumImage());
        if (!Strings.isNullOrEmpty(product.getBackLargeImage())) dto.setBackLargeImageKey(product.getBackLargeImage());

        return dto;
    }
}
