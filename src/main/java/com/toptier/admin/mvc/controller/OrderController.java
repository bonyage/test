package com.toptier.admin.mvc.controller;

import com.toptier.core.model.CustomerOrder;
import com.toptier.dto.CustomerOrderDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView orders(ModelMap model, @RequestParam("orderStatus") String orderStatus) {
		List<CustomerOrder> orders = orderService.getOrdersByStatus(orderStatus);
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

	@RequestMapping(value = {"/new"}, method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("order") CustomerOrderDto customerOrderDto) {
		CustomerOrder customerOrder = orderToDtoTranslator(customerOrderDto);
		orderService.saveOrUpdateOrder(customerOrder);
		ModelAndView mav = new ModelAndView("order.edit");
		mav.addObject("order", customerOrder);
		return mav;
	}

	private CustomerOrder orderToDtoTranslator(CustomerOrderDto customerOrderDto) {
		CustomerOrder order = orderService.getOrderById(customerOrderDto.getId());
		order.setStatus(CustomerOrder.Status.valueOf(customerOrderDto.getStatus()));
		if (StringUtils.isNotEmpty(customerOrderDto.getDeliveryNote())) {
			order.setDeliveryNotes(customerOrderDto.getDeliveryNote());
		}
		return order;
	}


}
