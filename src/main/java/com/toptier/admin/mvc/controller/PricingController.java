package com.toptier.admin.mvc.controller;

import com.toptier.core.model.MarketingTag;
import com.toptier.core.model.Product;
import com.toptier.core.model.ProductPricing;
import com.toptier.service.PricingService;
import com.toptier.service.ProductService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Transformer;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pricing")
public class PricingController {

	@Autowired
	private ProductService productService;

	@Autowired
	private PricingService pricingService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Product> allProducts =  productService.getAllProducts();
		return new ModelAndView("pricing.list", "allProducts", allProducts);
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.GET)
	public ModelAndView showAllProductPrices(HttpServletRequest request, @PathVariable int productId) {
		Product product = productService.getProduct(productId);
		List<ProductPricing> allPrices = pricingService.getAllPricesForProduct(productId);
		ModelAndView modelAndView = new ModelAndView("pricing.form");
		modelAndView.addObject("productName", product.getName());
		modelAndView.addObject("productId", productId);		
		modelAndView.addObject("mode", "new");		
		modelAndView.addObject("priceDTO", new ProductPricingDto(true));
		modelAndView.addObject("marketingTags", getMarketingTagsAsMap());
		modelAndView.addObject("allPrices", toDtos(allPrices));
		return modelAndView;
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.POST)
	public ModelAndView addNewPrice(@PathVariable int productId, @ModelAttribute ProductPricingDto dto) {
		dto.setEffectiveFrom(new LocalDate());
		Product product = productService.getProduct(productId);
		ProductPricing productPricing = toEntity(dto);
		productPricing.setProduct(product);
		pricingService.savesOrUpdatePrice(productPricing);
		return new ModelAndView("redirect:/pricing/" + productId);
	}
	
	@RequestMapping(value = "/item/{priceId}", method = RequestMethod.GET)
	public ModelAndView showProductPricingItem(HttpServletRequest request, @PathVariable int priceId ) {
		ProductPricing price = pricingService.getPrice(priceId);
		ModelAndView modelAndView = new ModelAndView("pricing.form");
		modelAndView.addObject("productName", price.getProduct().getName());
		modelAndView.addObject("productId", price.getProduct().getId());		
		modelAndView.addObject("mode", "update");		
		modelAndView.addObject("priceDTO", toDTO(price));
		modelAndView.addObject("marketingTags", getMarketingTagsAsMap());
		return modelAndView;
	}
	
	@RequestMapping(value = "/item/{priceId}", method = RequestMethod.POST)
	public ModelAndView saveProductPricingItem(HttpServletRequest request, @ModelAttribute ProductPricingDto dto) {
		ProductPricing price = pricingService.getPrice(dto.getPriceId());
		price.setBaseUnitPrice(dto.getBaseUnitPriceInCents());
		price.setMarketingBaseUnitPrice(dto.getMarketBaseUnitPriceInCents());
		price.setMarketingTag(dto.getMarketingTag());
		price.setActive(dto.isActive());
		price.setStockedProduct(dto.isStockedProduct());
		pricingService.savesOrUpdatePrice(price);
		return new ModelAndView("redirect:/pricing/" + dto.getProductId());
	}
	

	private List<ProductPricingDto> toDtos(List<ProductPricing> allPrices) {
		return (List<ProductPricingDto>) CollectionUtils.collect(allPrices, new Transformer() {
			@Override
			public Object transform(Object input) {
				ProductPricing entity = (ProductPricing) input;
				return toDTO(entity);
			}
		});
	}

	private ProductPricing toEntity(ProductPricingDto dto) {
		ProductPricing entity = new ProductPricing();
		entity.setEffectiveFrom(dto.getEffectiveFrom());
		entity.setBaseUnitPrice(dto.getBaseUnitPriceInCents());
		entity.setMarketingBaseUnitPrice(dto.getMarketBaseUnitPriceInCents());
		entity.setMarketingTag(dto.getMarketingTag());
		entity.setActive(dto.isActive());
		entity.setStockedProduct(dto.isStockedProduct());
		return entity;
	}
	
	private ProductPricingDto toDTO(ProductPricing entity)
	{
		ProductPricingDto dto = new ProductPricingDto();
		dto.setProductId(entity.getProduct().getId());
		dto.setPriceId(entity.getId());
		dto.setEffectiveFrom(entity.getEffectiveFrom());
		dto.setBaseUnitPriceInCents(entity.getBaseUnitPrice());
		dto.setMarketingBaseUnitPriceInCents(entity.getMarketingBaseUnitPrice());
		dto.setMarketingTag(entity.getMarketingTag());
		dto.setActive(entity.isActive());
		dto.setStockedProduct(entity.isStockedProduct());
		return dto;
	}

	private Map<String, String> getMarketingTagsAsMap() {
		Map<String, String> tags = new LinkedHashMap<>();
		for (MarketingTag t : getMarketingTagInDisplayOrder()) {
			tags.put(t.name(), t.getDescription());
		}
		return tags;
	}

	private List<MarketingTag> getMarketingTagInDisplayOrder() {
		List tags = Arrays.asList(MarketingTag.values());
		Collections.sort(tags, new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				Integer displayOrder1 = ((MarketingTag) o1).getDisplayOrder();
				Integer displayOrder2 = ((MarketingTag) o2).getDisplayOrder();
				return displayOrder1.compareTo(displayOrder2);
			}
		});
		return tags;
	}
}
