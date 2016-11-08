package com.cinema.customer.model;

import javax.servlet.http.HttpServletRequest;

public interface Model {
	public String handlerRequest(HttpServletRequest request) throws Exception;
}
