package com.toptier.admin.mvc.controller;

import com.google.common.base.Strings;
import com.toptier.admin.mvc.controller.ProductInventoryDto.InventoryDto;
import com.toptier.core.model.Address;
import com.toptier.core.model.Customer;
import com.toptier.core.model.Inventory;
import com.toptier.core.model.Product;
import com.toptier.dto.UserDto;
import com.toptier.service.AddressService;
import com.toptier.service.CustomerService;
import com.toptier.service.PersonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AddressService addressService;

    @Autowired
    private MessageSource messageSource;
    
    @Autowired
    private PersonService personService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Customer> allCustomers =  customerService.getAllCustomers();
		return new ModelAndView("customer.list", "allCustomers", allCustomers);
	}
	
	@RequestMapping(value = "/{customerId}", method = RequestMethod.GET)
    public ModelAndView editCustomer(HttpServletRequest request, @PathVariable int customerId) {
        Customer customer = customerService.getCustomer(customerId);
        // TODO Deal with customer == null
        ModelAndView modelAndView = new ModelAndView("customer.form");
        modelAndView.addObject("heading", translatedMessage("customer.form.heading.edit"));
        modelAndView.addObject("action", updateCustomerUrl(request, customerId));
       modelAndView.addObject("customerAddress", customer);
        return modelAndView;
    }
	
	@RequestMapping(value = { "/{customerId}" }, method = RequestMethod.POST)
	public ModelAndView modifyCustomer(@PathVariable int customerId, @ModelAttribute Customer dto) {
		Customer customer = customerService.getCustomer(customerId);
		customer.setName(dto.getName());
		customer.setEmail(dto.getEmail());
		customer.setPhone(dto.getPhone());		
		
		Address address = customer.getAddress();
		address.setRegion(dto.getAddress().getRegion());
		address.setAddrLines(dto.getAddress().getAddrLines());
		address.setPostcode(dto.getAddress().getPostcode());
		address.setCustomer(customer);
		
		personService.saveCustomer(customer);
        return new ModelAndView("redirect:list");
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView newProductForm(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("customer.form");
        modelAndView.addObject("heading", translatedMessage("customer.form.heading.edit"));
        modelAndView.addObject("action", addNewCustomerUrl(request));
        modelAndView.addObject("customerAddress", new Customer());
        return modelAndView;
    }
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView addNewProduct(@ModelAttribute Customer dto) {
		Customer customer = new Customer();
		customer.setName(dto.getName());
		customer.setEmail(dto.getEmail());
		customer.setPhone(dto.getPhone());		
		
		Address address = new Address();
		address.setRegion(dto.getAddress().getRegion());
		address.setAddrLines(dto.getAddress().getAddrLines());
		address.setPostcode(dto.getAddress().getPostcode());
		address.setCustomer(customer);
		
		personService.saveCustomer(customer);
		addressService.saveAddress(address);
        return new ModelAndView("redirect:list");
    }

	private String translatedMessage(String key) {
	    // TODO Perhaps refactor this into a proper class?
	    // See: http://stackoverflow.com/questions/6246381/getting-localized-message-from-resourcebundle-via-annotations-in-spring-framewor
	    Locale locale = LocaleContextHolder.getLocale();
	    return messageSource.getMessage(key, new Object[0], locale);
	}
	
	private String updateCustomerUrl(HttpServletRequest request, int customerId) {
	    return request.getContextPath() + "/customer/" + customerId;
	}
	
	private String addNewCustomerUrl(HttpServletRequest request) {
        return request.getContextPath() + "/customer/";
    }

	  
}
