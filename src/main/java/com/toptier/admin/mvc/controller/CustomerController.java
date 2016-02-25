package com.toptier.admin.mvc.controller;

import com.google.common.base.Strings;
import com.toptier.core.model.Customer;
import com.toptier.core.model.Product;
import com.toptier.service.CustomerService;
import com.toptier.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

    @Autowired
    private MessageSource messageSource;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Customer> allCustomers =  customerService.getAllCustomers();
		return new ModelAndView("customer.list", "allCustomers", allCustomers);
	}

    
}
