package com.xu.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
* <p>Title: HandlerInterceptor1</p>  
* <p>Description:前台拦截器 </p>  
* @author xujianfeng  
* @date 2020年1月24日
 */
public class HandlerInterceptor1 implements HandlerInterceptor {
	// 进入handle方法之前
	// 身份认证和身份授权
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("进入handler之前");
		return false;
	}

	// 进入handle之后，返回ModelAndView之前
	// 将公用的模型数据（比如菜单导航栏）在这里传到视图，统一的视图处理
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("运行handler中。。。");
	}

	// 执行完方法之后
	// 统一的异常处理
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("运行handler之后");
	}
}
