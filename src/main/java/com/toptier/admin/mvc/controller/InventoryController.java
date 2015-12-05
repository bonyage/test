package com.toptier.admin.mvc.controller;

import com.toptier.core.model.Product;
import com.toptier.core.model.StockLevel;
import com.toptier.service.InventoryService;
import com.toptier.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/inventory")
public class InventoryController {

	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllInventory() {
		List<Product> allProducts = productService.getAllProducts();
		Map<Integer, StockLevel> prodIdToStockLevel = getProductIdToStockLevel();
		List<StockLevelDto> inventory = generateStockLevelDtos(allProducts, prodIdToStockLevel);
		return new ModelAndView("inventory.list", "inventory", inventory);
	}

	@RequestMapping(value = { "/{productId}" }, method = RequestMethod.GET)
	public ModelAndView stockLevelForm(@PathVariable int productId) {
		Product product = productService.getProduct(productId);
		// TODO Deal with product == null.
		StockLevel stockLevel = inventoryService.getStockLevel(productId);
		ModelAndView modelAndView = new ModelAndView("stockLevel.form");
		modelAndView.addObject("productName", product.getName());
		modelAndView.addObject("stockLevel", toDto(product, stockLevel));
		return modelAndView;
	}

	@RequestMapping(value = { "/{productId}" }, method = RequestMethod.POST)
	public ModelAndView saveStockLevel(@PathVariable int productId, @ModelAttribute StockLevelDto dto) {
		Product product = productService.getProduct(productId);
		// TODO Deal with product == null.
		StockLevel stockLevel = inventoryService.getStockLevel(productId);
		ModelAndView modelAndView = new ModelAndView("stockLevel.form");
		modelAndView.addObject("productName", product.getName());
		modelAndView.addObject("stockLevel", toDto(product, stockLevel));
		return modelAndView;
	}

	private Map<Integer, StockLevel> getProductIdToStockLevel() {
		Map<Integer, StockLevel> result = new HashMap<>();
		List<StockLevel> inventory = inventoryService.getAllStockLevels();
		for (StockLevel stockLevel : inventory) {
			result.put(stockLevel.getProductId(), stockLevel);
		}
		return result;
	}

	private List<StockLevelDto> generateStockLevelDtos(List<Product> allProducts, Map<Integer, StockLevel> prodIdToStockLevel) {
		List<StockLevelDto> result = new ArrayList<>();
		for (Product product : allProducts) {
			StockLevel stockLevel = prodIdToStockLevel.get(product.getId());
			result.add(toDto(product, stockLevel));
		}
		return result;
	}

	private StockLevelDto toDto(Product product, StockLevel stockLevel) {
		StockLevelDto result = new StockLevelDto();
		result.setProductId(product.getId());
		result.setProductName(product.getName());
		result.setActiveProduct(product.isActive());
		if (stockLevel != null) {
			result.setStockLevelDefined(true);
			result.setQuantity(stockLevel.getQuantity());
			result.setUnit(stockLevel.getUnit());
		}
		return result;
	}
}
