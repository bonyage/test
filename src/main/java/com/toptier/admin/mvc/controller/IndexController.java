package com.toptier.admin.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home() {
		return "redirect:/dash";
	}
	
	@RequestMapping(value = { "/dash" }, method = RequestMethod.GET)
	public ModelAndView showDashboard(ModelMap model) {
		return new ModelAndView("home.dash");
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView showLogin() {
		return new ModelAndView("home.login");
	}

	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("403");
	}

}
