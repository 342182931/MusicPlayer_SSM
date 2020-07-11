package com.xu.ssm.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// TODO Auto-generated method stub
		CustomException customException=null;
		if(ex instanceof CustomException) {
			customException=(CustomException) ex;
		}else {
			customException=new CustomException("δ֪����");
		}
		String message=customException.getMessage();
		System.out.println(message);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message",message);
		modelAndView.setViewName("test");
		return modelAndView;
	}

}
