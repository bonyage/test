package com.toptier.admin.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")

public class IndexController {

	/*
	 * This method will list all existing employees.
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView showShoppingHomepage(ModelMap model) {
        return new ModelAndView("home.index");
	}

}
