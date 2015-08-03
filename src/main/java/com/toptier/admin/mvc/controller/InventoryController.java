package com.toptier.admin.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/inventory")

public class InventoryController {
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllInventory(ModelMap model) {
        return new ModelAndView("inventory.list");
	}


}
