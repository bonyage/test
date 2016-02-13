package com.toptier.admin.mvc.controller;

import com.toptier.core.model.*;
import com.toptier.dto.CustomerOrderDto;
import com.toptier.dto.OrderItemDto;
import com.toptier.service.PersonService;
import com.toptier.service.PricingService;
import com.toptier.service.ProductService;
import org.apache.commons.beanutils.converters.IntegerConverter;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTimeUtils;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.toptier.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/orders")
@SessionAttributes("order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	@Autowired
	private PricingService pricingService;

	@Autowired
	private PersonService personService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView orders(ModelMap model, @RequestParam("orderStatus") String orderStatus) {
		List<CustomerOrder> orders = orderService.getOrdersByStatus(orderStatus);
		ModelAndView mav = new ModelAndView("order.list");
		mav.addObject("orders",orders);
		return mav;
	}

	@RequestMapping(value = {"/modify/{id}"}, method = RequestMethod.GET)
	public ModelAndView modifyOrders(ModelMap model, @PathVariable("id") Integer id) {
		CustomerOrder order = orderService.getOrderById(id);
		ModelAndView mav = new ModelAndView("order.edit");
		mav.addObject("order", customOrderToDTO(order));
		return mav;	
	}
	
	@RequestMapping(value = {"/cancel/{id}"}, method = RequestMethod.GET)
	public ModelAndView cancelOrders(ModelMap model, @PathVariable("id") Integer id) {
		orderService.cancelOrder(id);
		List<CustomerOrder> orders = orderService.getOrdersByStatus(null);
		ModelAndView mav = new ModelAndView("order.list");
		mav.addObject("orders",orders);
		return mav;
	}

	private CustomerOrderDto customOrderToDTO(CustomerOrder order) {
		CustomerOrderDto customerOrderDto = new CustomerOrderDto();
		customerOrderDto.setCustomerId(order.getCustomer().getId());
		customerOrderDto.setCustomerEmail(order.getCustomer().getEmail());
		customerOrderDto.setCustomerName(order.getCustomer().getName());
		customerOrderDto.setDeliveryAddress(order.getDeliveryAddress());
		customerOrderDto.setDeliveryNote(order.getDeliveryNotes());
		customerOrderDto.setInvoiceDate(order.getOrderDate());
		customerOrderDto.setConfirmedDate(order.getConfirmedDate());
		customerOrderDto.setPackagedDate(order.getPackagedDate());
		customerOrderDto.setDispatchDate(order.getDispatchDate());
		customerOrderDto.setId(order.getId());
		customerOrderDto.setTotal(order.getTotal());
		customerOrderDto.setStatus(order.getStatus());
		List<OrderItemDto> items = new ArrayList<OrderItemDto>();
		for (CustomerOrderLine orderLine : order.getOrderLines()) {
			items.add(orderLineToDto(orderLine));
		}
		customerOrderDto.setItems(items);
		return customerOrderDto;
	}

	private OrderItemDto orderLineToDto(CustomerOrderLine orderLine) {
		OrderItemDto dto = new OrderItemDto();
		dto.setProductCode(orderLine.getProductPricing().getProduct().getProductCode());
		dto.setQuantity(orderLine.getQuantity());
		dto.setProductName(orderLine.getProductPricing().getProduct().getName());
		dto.setPrice(orderLine.getProductPricing().getBaseUnitPrice());
		dto.setSku(orderLine.getProductPricing().getProduct().getSku());
		dto.setSubTotal(orderLine.getSubtotal());
		return dto;
	}

	@RequestMapping(value = {"/new"}, method = RequestMethod.GET)
	public ModelAndView newOrder() {
		ModelAndView mav = new ModelAndView("order.new");
		List<ProductPricing> productPriceList = productService.getAllSellingProducts();
		List<Customer> customers = personService.getAllCustomers();
		mav.addObject("productPriceList", productPriceList);
		mav.addObject("customers", toCustomersMap(customers));
		mav.addObject("date", new LocalDate().toString());
		mav.addObject("order", new CustomerOrderDto());
		return mav;
	}

	private Map<String, String> toCustomersMap(List<Customer> customers) {
		Map<String, String> resultMap = new HashMap();
		for (Customer customer : customers) {
			resultMap.put(Integer.toString(customer.getId()), customer.getName());
		}
		return resultMap;
	}

	@RequestMapping(
			value = {"/new"},
			method = RequestMethod.POST,
			params = {"action"})
	public ModelAndView orderPostBack(@ModelAttribute("order") CustomerOrderDto customerOrderDto,
									  @RequestParam(value = "action") String action, HttpServletRequest httpServletRequest) {
		customerOrderDto.setInvoiceDate(new LocalDate());
		ModelAndView mav = new ModelAndView("order.new");
		if (action.contains("delete-item-")) {
			List<OrderItemDto> items = customerOrderDto.getItems();
			for (OrderItemDto item : items) {
				if (item.getProductCode().equalsIgnoreCase(action.split("-")[2])) {
					customerOrderDto.setSubTotal(customerOrderDto.getSubTotal() - item.getSubTotal());
					customerOrderDto.setTotal(customerOrderDto.getSubTotal() * 1.1d);
					items.remove(item);
					break;
				}
			}
			customerOrderDto.setItems(items);
			List<ProductPricing> productPriceList = productService.getAllSellingProducts();
			List<Customer> customers = personService.getAllCustomers();
			mav.addObject("productPriceList", productPriceList);
			mav.addObject("customers", toCustomersMap(customers));
			mav.addObject("date", new LocalDate().toString());
			mav.addObject("order", customerOrderDto);
		}
		if (Arrays.asList("submit-new-order").contains(action)) {
			CustomerOrder customerOrder = orderToDtoTranslator(customerOrderDto);
			orderService.saveOrUpdateOrder(customerOrder);
			mav = new ModelAndView("redirect:/orders/" + customerOrder.getId());
		}
		if (Arrays.asList("update-order-status", "update-delivery-note", "update-delivery-address").contains(action)) {
			CustomerOrder customerOrder = orderToDtoTranslator(customerOrderDto);
			orderService.saveOrUpdateOrder(customerOrder);
			mav = new ModelAndView("redirect:/orders/" + customerOrder.getId());
			mav.addObject("order", customerOrderDto);
		}
		if (Arrays.asList("add-item").contains(action)) {
			String productId = httpServletRequest.getParameter("product");
			String itemQuantity = httpServletRequest.getParameter("itemQuantity");
			ProductPricing priceForProduct = pricingService.getCurrentPriceForProduct(Integer.parseInt(productId));
			String productName = priceForProduct.getProduct().getName();
			int baseUnitPrice = priceForProduct.getBaseUnitPrice();
			if (customerOrderDto.getItems() == null) {
				customerOrderDto.setItems(new ArrayList<OrderItemDto>());
				customerOrderDto.setSubTotal(0d);

			}
			OrderItemDto orderItemDto = new OrderItemDto();
			orderItemDto.setPrice(baseUnitPrice);
			orderItemDto.setProductCode(productId);
			orderItemDto.setQuantity(Integer.parseInt(itemQuantity));
			orderItemDto.setProductName(productName);
			orderItemDto.setSubTotal(Integer.parseInt(itemQuantity) * baseUnitPrice);

			List<OrderItemDto> items = customerOrderDto.getItems();
			if (items.contains(orderItemDto)) {
				int itemPosition = items.indexOf(orderItemDto);
				OrderItemDto orderItemDtoExisting = items.get(itemPosition);

				customerOrderDto.setSubTotal(customerOrderDto.getSubTotal() - orderItemDtoExisting.getSubTotal());
				items.remove(itemPosition);

				customerOrderDto.setSubTotal(customerOrderDto.getSubTotal() + orderItemDto.getSubTotal());
				items.add(orderItemDto);
			} else {
				items.add(orderItemDto);
				customerOrderDto.setSubTotal(customerOrderDto.getSubTotal() + orderItemDto.getSubTotal());
			}
			customerOrderDto.setItems(items);
			customerOrderDto.setStatus(CustomerOrder.Status.DISPATCHED);
			customerOrderDto.setTotal(customerOrderDto.getSubTotal() * 1.1d);
			mav = new ModelAndView("order.new");
			List<ProductPricing> productPriceList = productService.getAllSellingProducts();
			List<Customer> customers = personService.getAllCustomers();
			mav.addObject("productPriceList", productPriceList);
			mav.addObject("customers", toCustomersMap(customers));
			mav.addObject("date", new LocalDate().toString());
			mav.addObject("order", customerOrderDto);
		}
		return mav;
	}

	private CustomerOrder orderToDtoTranslator(CustomerOrderDto customerOrderDto) {
		CustomerOrder order = null;
		if (customerOrderDto.getId() != null) {
			order = orderService.getOrderById(customerOrderDto.getId());
			order.setStatus(customerOrderDto.getStatus());
			if (StringUtils.isNotEmpty(customerOrderDto.getDeliveryNote())) {
				order.setDeliveryNotes(customerOrderDto.getDeliveryNote());
			}
			if (StringUtils.isNotEmpty(customerOrderDto.getDeliveryAddress())) {
				order.setDeliveryAddress(customerOrderDto.getDeliveryAddress());
			}

		} else {
			order = new CustomerOrder();
			order.setCustomer(personService.getById(customerOrderDto.getCustomerId()));
			order.setDeliveryAddress("Not applicable");
			order.setDeliveryNotes("In store purchase");
			order.setOrderDate(customerOrderDto.getInvoiceDate());
			order.setStatus(CustomerOrder.Status.DISPATCHED);
			HashSet<CustomerOrderLine> customerOrderLines = new HashSet<CustomerOrderLine>();
			for (OrderItemDto orderItem : customerOrderDto.getItems()) {
				customerOrderLines.add(orderItemToCustomerOrderLines(orderItem, order));
			}
			order.setOrderLines(customerOrderLines);
		}
		return order;
	}

	private CustomerOrderLine orderItemToCustomerOrderLines(OrderItemDto orderItem, CustomerOrder order) {
		ProductPricing productPrice = pricingService.getCurrentPriceForProduct(Integer.parseInt(orderItem.getProductCode()));
		CustomerOrderLine orderLine = new CustomerOrderLine();
		orderLine.setQuantity(orderItem.getQuantity());
		orderLine.setOrder(order);
		orderLine.setProductPricing(productPrice);
		orderLine.setModifiedDate(new LocalDate());
		return orderLine;
	}

	@ModelAttribute("order")
	public CustomerOrderDto getOrder() {
		return new CustomerOrderDto();
	}

}
