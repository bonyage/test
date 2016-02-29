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

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Customer> allCustomers =  customerService.getAllCustomers();
		List<Address> allAddressRecords = addressService.getAllAddressRecords();
		List<CustomerAddressDto> customers = toDtos(allCustomers, allAddressRecords);
		return new ModelAndView("customer.list", "allCustomers", customers);
	}
	
	@RequestMapping(value = "/{customerId}", method = RequestMethod.GET)
    public ModelAndView editCustomer(HttpServletRequest request, @PathVariable int customerId) {
        Customer customer = customerService.getCustomer(customerId);
        // TODO Deal with customer == null
        Address addressRecord = addressService.getAddressRecord(customerId);
        ModelAndView modelAndView = new ModelAndView("customer.form");
        modelAndView.addObject("heading", translatedMessage("customer.form.heading.edit"));
        modelAndView.addObject("action", updateCustomerUrl(request, customerId));
        modelAndView.addObject("customer", toDto(customer,addressRecord));
        return modelAndView;
    }
	
	@RequestMapping(value = { "/{customerId}" }, method = RequestMethod.POST)
	public ModelAndView modifyCustomer(@PathVariable int customerId, @ModelAttribute CustomerAddressDto dto) {
		customerService.setCustomer(customerId, dto.getCustomerName(), dto.getEmail(), dto.getPhone());
		addressService.setAddress(customerId,dto.getRegion(),dto.getAddrlines(),dto.getPostcode());
        return new ModelAndView("redirect:list");
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView newProductForm(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("customer.form");
        modelAndView.addObject("heading", translatedMessage("customer.form.heading.edit"));
        modelAndView.addObject("action", addNewCustomerUrl(request));
        modelAndView.addObject("customer", new CustomerAddressDto());
        return modelAndView;
    }
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView addNewProduct(@ModelAttribute CustomerAddressDto dto) {
		customerService.saveCustomer(dto.getCustomerName(), dto.getEmail(), dto.getPhone());
		int customerId = customerService.getIdByPhone(dto.getPhone());
		addressService.saveAddress(customerId,dto.getRegion(),dto.getAddrlines(),dto.getPostcode());
        return new ModelAndView("redirect:list");
    }

	private String translatedMessage(String key) {
	    // TODO Perhaps refactor this into a proper class?
	    // See: http://stackoverflow.com/questions/6246381/getting-localized-message-from-resourcebundle-via-annotations-in-spring-framewor
	    Locale locale = LocaleContextHolder.getLocale();
	    return messageSource.getMessage(key, new Object[0], locale);
	}
	
	private List<CustomerAddressDto> toDtos(List<Customer> allCustomers, List<Address> allAddressRecords) {
		Map<Integer, Address> addressRecordLookup = generateAddressRecordLookup(allAddressRecords);
        List<CustomerAddressDto> result = new ArrayList<>();
        for (Customer customer : allCustomers) {
			Address addressRecord = addressRecordLookup.get(customer.getId());
			CustomerAddressDto dto = toDto(customer, addressRecord);
            result.add(dto);
        }
        return result;
    }
	
	private CustomerAddressDto toDto(Customer customer, Address addressRecord) {
        CustomerAddressDto dto = new CustomerAddressDto();
        dto.setCustomerId(customer.getId());
        dto.setCustomerName(customer.getName());
        dto.setEmail(customer.getEmail());
        dto.setPhone(customer.getPhone());
        dto.setRegion(addressRecord.getRegion());
        dto.setAddrlines(addressRecord.getAddrLines());
        dto.setPostcode(addressRecord.getPostcode());
		return dto;
    }
	
	private Map<Integer, Address> generateAddressRecordLookup(List<Address> allAddressRecords) {
		Map<Integer, Address> result = new HashMap<>();
		for (Address addressRecord : allAddressRecords) {
			result.put(addressRecord.getCustomerID(), addressRecord);
		}
		return result;
	}
	
	private String updateCustomerUrl(HttpServletRequest request, int customerId) {
	    return request.getContextPath() + "/customer/" + customerId;
	}
	
	private String addNewCustomerUrl(HttpServletRequest request) {
        return request.getContextPath() + "/customer/";
    }

	  
}
