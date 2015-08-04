package com.toptier.admin.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.core.model.ProductPricing;
import com.toptier.service.ProductService;

@Controller
@RequestMapping("/product")

public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts(ModelMap model) {		
		List<ProductPricing> allProducts =  productService.getAllSellingProducts();		
		ModelAndView mav = new ModelAndView("product.list");
		List<ProductPricing> test = new ArrayList<ProductPricing>();
		test.addAll(allProducts);
		test.addAll(allProducts);
		test.addAll(allProducts);
		mav.addObject("products", test);
		return mav;
	}


}
