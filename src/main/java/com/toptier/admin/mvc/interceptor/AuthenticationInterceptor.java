package com.toptier.admin.mvc.interceptor;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.toptier.admin.mvc.dto.LoginForm;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	private static final Logger log = Logger
			.getLogger(AuthenticationInterceptor.class.getName());

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		log.info("Authenticate url: " + request.getRequestURI());
		// Avoid a redirect loop for some urls
		if (!request.getServletPath().equals("/login")) {
			LoginForm userData = (LoginForm) request.getSession().getAttribute(
					"LOGGEDIN_USER");
			if (userData == null) {
				String cxt = request.getSession().getServletContext().getContextPath();
				response.sendRedirect(cxt + "/login");
				return false;
			}
		}
		return true;
	}

}
