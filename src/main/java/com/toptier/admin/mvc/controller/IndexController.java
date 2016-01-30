package com.toptier.admin.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.admin.mvc.controller.ProductInventoryDto.InventoryDto;
import com.toptier.core.model.Inventory;
import com.toptier.core.model.Product;
import com.toptier.service.InventoryService;
import com.toptier.service.OrderService;
import com.toptier.service.ProductService;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;
	
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home() {
		return "redirect:/dash";
	}
	
	@RequestMapping(value = { "/dash" }, method = RequestMethod.GET)
	public ModelAndView showDashboard(ModelMap model) {
		ModelAndView mav = new ModelAndView("home.dash");
		List<Product> allProducts = productService.getAllProducts();
		List<Inventory> lowInventoryRecords = inventoryService.getLowInventoryRecords();
		List<ProductInventoryDto> inventory = toDtos(allProducts, lowInventoryRecords);
		mav.addObject("newOrderNum",orderService.getNewOrderNumber());
		mav.addObject("inventory",inventory);
		return mav;
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView showLogin() {
		return new ModelAndView("home.login");
	}

	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("403");
	}
	
	private List<ProductInventoryDto> toDtos(List<Product> allProducts, List<Inventory> allInventoryRecords) {
		Map<Integer, Product> productLookup = generateProductLookup(allProducts);
        List<ProductInventoryDto> result = new ArrayList<>();
        for (Inventory inventoryRecord : allInventoryRecords) {
			Product product = productLookup.get(inventoryRecord.getProductID());
			ProductInventoryDto dto = toDto(product, inventoryRecord);
            result.add(dto);
            
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
	
	private Map<Integer, Product> generateProductLookup(List<Product> allProducts) {
		Map<Integer, Product> result = new HashMap<>();
		for (Product product : allProducts) {
			result.put(product.getId(), product);
		}
		return result;
	}

}
