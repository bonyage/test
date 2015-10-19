package com.toptier.admin.mvc.controller;

import com.toptier.core.model.Product;
import com.toptier.core.model.ProductPricing;
import com.toptier.service.PricingService;
import com.toptier.service.ProductService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Transformer;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/pricing")
public class PricingController {

	@Autowired
	private ProductService productService;

	@Autowired
	private PricingService pricingService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts(ModelMap model) {
		List<Product> allProducts =  productService.getAllProducts();
		return new ModelAndView("pricing.list", "allProducts", allProducts);
	}
//	public ModelAndView listAllPricing(ModelMap model) {
//		List<ProductPricing> allPricing = pricingService.getAllProductPricing();
//		return new ModelAndView("pricing.list", "allPricing", allPricing);
//	}

//	@RequestMapping(value = "/new", method = RequestMethod.GET)
//	public ModelAndView newPricingForm(HttpServletRequest request) {
//		ModelAndView modelAndView = new ModelAndView("pricing.form");
////		modelAndView.addObject("productPricing", new ProductPricingDto());
//		modelAndView.addObject("heading", "New Pricing");
////		modelAndView.addObject("action", addNewPricingUrl(request));
//		return modelAndView;
//	}
	@RequestMapping(value = "/{productId}", method = RequestMethod.GET)
	public ModelAndView showAllProductPrices(HttpServletRequest request, @PathVariable int productId) {
		Product product = productService.getProduct(productId);
		List<ProductPricing> allPrices = pricingService.getAllPricesForProduct(productId);
		ModelAndView modelAndView = new ModelAndView("pricing.form");
		modelAndView.addObject("newPrice", new ProductPricingDto());
		modelAndView.addObject("heading", "Pricing - " + product.getName());
		modelAndView.addObject("action", productPricingUrl(request, product.getId()));
		modelAndView.addObject("allPrices", toDtos(allPrices));
		return modelAndView;
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.POST)
	public ModelAndView addNewPrice(@PathVariable int productId, @ModelAttribute ProductPricingDto dto) {
		dto.setEffectiveFrom(new LocalDate());
		Product product = productService.getProduct(productId);
		ProductPricing productPricing = toEntity(dto);
		productPricing.setProduct(product);
		productPricing.setActive(true);
		pricingService.saveAddPrice(productPricing);
		return new ModelAndView("redirect:" + productId);
	}

	private String productPricingUrl(HttpServletRequest request, int productId) {
		return request.getContextPath() + "/pricing/" + productId;
	}

	private List<ProductPricingDto> toDtos(List<ProductPricing> allPrices) {
		return (List<ProductPricingDto>) CollectionUtils.collect(allPrices, new Transformer() {
			@Override
			public Object transform(Object input) {
				ProductPricing entity = (ProductPricing) input;
				ProductPricingDto dto = new ProductPricingDto();
				dto.setEffectiveFrom(entity.getEffectiveFrom());
				dto.setBaseUnitPriceInCents(entity.getBaseUnitPrice());
				dto.setActive(entity.isActive());
				return dto;
			}
		});
	}

	private ProductPricing toEntity(ProductPricingDto dto) {
		ProductPricing entity = new ProductPricing();
		entity.setEffectiveFrom(dto.getEffectiveFrom());
		entity.setBaseUnitPrice(dto.getBaseUnitPriceInCents());
		entity.setActive(dto.isActive());
		return entity;
	}
}
