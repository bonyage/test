package com.toptier.admin.mvc.controller;

import com.toptier.core.model.Product;
import com.toptier.service.ProductDto;
import com.toptier.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")

public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public ModelAndView listAllProducts() {
		List<Product> allProducts =  productService.getAllProducts();
		return new ModelAndView("product.list", "allProducts", allProducts);
	}

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView newProductForm(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("product.form");
        modelAndView.addObject("product", new ProductDto());
        modelAndView.addObject("formConfig", new ProductFormConfig(request, "New Product"));
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView addNewProduct(@ModelAttribute ProductDto product) {
        productService.saveCreateProduct(toEntity(product));
        return new ModelAndView("redirect:list");
    }

    @RequestMapping(value = "/{productId}", method = RequestMethod.GET)
    public ModelAndView editProduct(HttpServletRequest request, @PathVariable int productId) {
        Product product = productService.getProduct(productId);
        // TODO Deal with product == null
        ModelAndView modelAndView = new ModelAndView("product.form");
        modelAndView.addObject("product", toDto(product));
        modelAndView.addObject("formConfig", new ProductFormConfig(request, "Edit Product", productId));
        return modelAndView;
    }

    @RequestMapping(value = "/{productId}", method = RequestMethod.POST)
    public ModelAndView updateProduct(@ModelAttribute ProductDto dto) {
        productService.saveUpdateProduct(toEntity(dto));
        return new ModelAndView("redirect:list");
    }

    private Product toEntity(ProductDto dto) {
        Product product = new Product();
        product.setId(dto.getId());
        product.setVersion(dto.getVersion());
        product.setName(dto.getName());
        product.setShortDescription(dto.getShortDescription());
        product.setLongDescription(dto.getLongDescription());
        product.setMarketingText(dto.getMarketingText());
        product.setSku(dto.getSku());
        product.setActive(dto.isActive());
        return product;
    }

    private ProductDto toDto(Product product) {
        ProductDto dto = new ProductDto();
        dto.setId(product.getId());
        dto.setVersion(product.getVersion());
        dto.setName(product.getName());
        dto.setShortDescription(product.getShortDescription());
        dto.setLongDescription(product.getLongDescription());
        dto.setMarketingText(product.getMarketingText());
        dto.setSku(product.getSku());
        dto.setActive(product.isActive());
        return dto;
    }

    public static class ProductFormConfig {
        private final String heading;
        private String action;

        private ProductFormConfig(HttpServletRequest request, String heading) {
            this.heading = heading;
            action = constructBaseAction(request);
        }

        private ProductFormConfig(HttpServletRequest request, String heading, int productId) {
            this(request, heading);
            action = action + productId;
        }

        private String constructBaseAction(HttpServletRequest request) {
            return request.getContextPath() + "/product/";
        }

        public String getHeading() {
            return heading;
        }

        public String getAction() {
            return action;
        }
    }
}
