package com.toptier.admin.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/agent")

public class AgentController {
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllAgents(ModelMap model) {
        return new ModelAndView("agent.list");
	}


}
