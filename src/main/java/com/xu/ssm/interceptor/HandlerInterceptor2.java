package com.xu.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xu.ssm.po.UserCustom;
/**
 * 
* <p>Title: HandlerInterceptor2</p>  
* <p>Description:后台拦截器 </p>  
* @author xujianfeng  
* @date 2020年1月24日
 */
public class HandlerInterceptor2 implements HandlerInterceptor {

	// 进入handle方法之前
	// 身份认证和身份授权
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("运行handler之前。");

		// 获取请求的URL
		StringBuffer url = request.getRequestURL();
		// 除了第一次登录，退出到登录页面，其他钱拦截
		if (url.indexOf("/findUser.action") > 0 || url.indexOf("/login") > 0) {
			return true;
		}
		// 获取session
		HttpSession session = request.getSession();
		UserCustom userCustom = (UserCustom) session.getAttribute("userCustom"); // 判断session里是不是有登录信息
		//判断用户是否登录
		if (userCustom != null) {
			return true;
		}
		String msg = "你还没有登录，请先登录！";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/houtai/login.jsp").forward(request, response);
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
		// 判断session
		System.out.println("运行handler后...");
	}
}
