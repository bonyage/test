package com.toptier.admin.mvc.controller;

import com.toptier.core.model.Product;
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
import java.util.List;

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
		List<StockLevelDto> inventory = toDtos(allProducts);
		return new ModelAndView("inventory.list", "inventory", inventory);
	}

    @RequestMapping(value = { "/{productId}" }, method = RequestMethod.GET)
	public ModelAndView stockLevelForm(@PathVariable int productId) {
		Product product = productService.getProduct(productId);
		// TODO Deal with product == null.
		ModelAndView modelAndView = new ModelAndView("stockLevel.form");
		modelAndView.addObject("productName", product.getName());
		modelAndView.addObject("stockLevel", toDto(product));
		return modelAndView;
	}

	@RequestMapping(value = { "/{productId}" }, method = RequestMethod.POST)
	public ModelAndView setStockLevelAndUnit(@PathVariable int productId, @ModelAttribute StockLevelDto dto) {
        inventoryService.setQuantityAndUnit(productId, dto.getQuantity(), dto.getUnit());
        return new ModelAndView("redirect:list");
	}

    private List<StockLevelDto> toDtos(List<Product> allProducts) {
        List<StockLevelDto> result = new ArrayList<>();
        for (Product product : allProducts) {
            result.add(toDto(product));
        }
        return result;
    }

    private StockLevelDto toDto(Product product) {
        StockLevelDto dto = new StockLevelDto();
        dto.setProductId(product.getId());
        dto.setProductName(product.getName());
        dto.setActiveProduct(product.isActive());
        dto.setQuantity(product.getQuantity());
        dto.setUnit(product.getUnit());
        return dto;
    }
}
