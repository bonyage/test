package com.toptier.admin.mvc.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.admin.mvc.dto.LoginForm;

@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home() {
		return "redirect:/login";
	}
	
	@RequestMapping(value = { "/dash" }, method = RequestMethod.GET)
	public ModelAndView showDashboard(ModelMap model) {
		return new ModelAndView("home.dash");
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView showLogin() {
		return new ModelAndView("home.login");
	}	

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, LoginForm loginform, Locale locale,
			HttpServletRequest request) throws Exception {

		String username = loginform.getUsername();
		String password = loginform.getPassword();

		//XXX
		if (!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)) {
			request.getSession().setAttribute("LOGGEDIN_USER", loginform);
			return "redirect:/dash";
		} else {
			return "redirect:/login.failed";
		}
	}

}
