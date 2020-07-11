package com.xu.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
* <p>Title: HandlerInterceptor1</p>  
* <p>Description:ǰ̨������ </p>  
* @author xujianfeng  
* @date 2020��1��24��
 */
public class HandlerInterceptor1 implements HandlerInterceptor {
	// ����handle����֮ǰ
	// �����֤�������Ȩ
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("����handler֮ǰ");
		return false;
	}

	// ����handle֮�󣬷���ModelAndView֮ǰ
	// �����õ�ģ�����ݣ�����˵��������������ﴫ����ͼ��ͳһ����ͼ����
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("����handler�С�����");
	}

	// ִ���귽��֮��
	// ͳһ���쳣����
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("����handler֮��");
	}
}
