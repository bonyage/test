package com.toptier.admin.mvc.controller;

import com.toptier.admin.mvc.controller.ProductInventoryDto.InventoryDto;
import com.toptier.core.model.Inventory;
import com.toptier.core.model.Product;
import com.toptier.core.model.ProductUnit;
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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/inventory")
public class InventoryController {

	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;

	@ModelAttribute("allProductUnitsAsMap")
	public Map<String, String> allProductUnitsAsMap() {
		Map<String, String> result = new LinkedHashMap<>();
		for (ProductUnit productUnit : inventoryService.getAllProductUnits()) {
			result.put(productUnit.getCode(), productUnit.getDisplayName());
		}
		return result;
	}

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllInventory() {
		List<Product> allProducts = productService.getAllProducts();
		List<Inventory> allInventoryRecords = inventoryService.getAllInventoryRecords();
		List<ProductInventoryDto> inventory = toDtos(allProducts, allInventoryRecords);
		return new ModelAndView("inventory.list", "inventory", inventory);
	}

    @RequestMapping(value = { "/{productId}" }, method = RequestMethod.GET)
	public ModelAndView stockLevelForm(@PathVariable int productId) {
		Product product = productService.getProduct(productId);
		// TODO Deal with product == null.
		Inventory inventoryRecord = inventoryService.getInventoryRecord(productId);
		ModelAndView modelAndView = new ModelAndView("stockLevel.form");
		modelAndView.addObject("productName", product.getName());
		modelAndView.addObject("stockLevel", toDto(product, inventoryRecord));
		return modelAndView;
	}

	@RequestMapping(value = { "/{productId}" }, method = RequestMethod.POST)
	public ModelAndView setStockLevelAndUnit(@PathVariable int productId, @ModelAttribute ProductInventoryDto dto) {
        inventoryService.setProductInventoryRecord(
				productId,
				dto.getInventory().getIntakeBaseUnitStockLevel(),
				dto.getInventory().getProductUnitCode(),
				dto.getInventory().getBaseUnitName());
        return new ModelAndView("redirect:list");
	}

    private List<ProductInventoryDto> toDtos(List<Product> allProducts, List<Inventory> allInventoryRecords) {
		Map<Integer, Inventory> inventoryRecordLookup = generateInventoryRecordLookup(allInventoryRecords);
        List<ProductInventoryDto> result = new ArrayList<>();
        for (Product product : allProducts) {
			Inventory inventoryRecord = inventoryRecordLookup.get(product.getId());
			ProductInventoryDto dto = toDto(product, inventoryRecord);
            result.add(dto);
        }
        return result;
    }

	private Map<Integer, Inventory> generateInventoryRecordLookup(List<Inventory> allInventoryRecords) {
		Map<Integer, Inventory> result = new HashMap<>();
		for (Inventory inventoryRecord : allInventoryRecords) {
			result.put(inventoryRecord.getProductID(), inventoryRecord);
		}
		return result;
	}

	private ProductInventoryDto toDto(Product product, Inventory inventoryRecord) {
        ProductInventoryDto dto = new ProductInventoryDto();
        dto.setProductId(product.getId());
        dto.setProductName(product.getName());
        dto.setActiveProduct(product.isActive());

		InventoryDto inventoryRecordDto = toInventoryRecordDto(inventoryRecord);
		dto.setInventory(inventoryRecordDto);

		return dto;
    }

	private InventoryDto toInventoryRecordDto(Inventory inventoryRecord) {
		if (inventoryRecord == null) return null;

		InventoryDto dto = new InventoryDto();
		dto.setProductUnitCode(inventoryRecord.getBaseUnit().getCode());
		dto.setBaseUnitName(inventoryRecord.getBaseUnitName());
		dto.setIntakeDate(inventoryRecord.getIntakeDate());
		dto.setIntakeBaseUnitStockLevel(inventoryRecord.getIntakeBaseUnitStockLevel());
		return dto;
	}
}
