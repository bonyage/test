package com.toptier.admin.mvc.controller;

import com.toptier.core.model.CustomerOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView orders(ModelMap model) {
		List<CustomerOrder> orders = orderService.getAllOrders();
		ModelAndView mav = new ModelAndView("order.list");
		mav.addObject("orders",orders);
		return mav;
	}

	@RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
	public ModelAndView orders(ModelMap model, @PathVariable("id") Integer id) {
		CustomerOrder order = orderService.getOrderById(id);
		ModelAndView mav = new ModelAndView("order.edit");
		mav.addObject("order",order);
		return mav;
	}

}
