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
* <p>Description:��̨������ </p>  
* @author xujianfeng  
* @date 2020��1��24��
 */
public class HandlerInterceptor2 implements HandlerInterceptor {

	// ����handle����֮ǰ
	// �����֤�������Ȩ
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("����handler֮ǰ��");

		// ��ȡ�����URL
		StringBuffer url = request.getRequestURL();
		// ���˵�һ�ε�¼���˳�����¼ҳ�棬����Ǯ����
		if (url.indexOf("/findUser.action") > 0 || url.indexOf("/login") > 0) {
			return true;
		}
		// ��ȡsession
		HttpSession session = request.getSession();
		UserCustom userCustom = (UserCustom) session.getAttribute("userCustom"); // �ж�session���ǲ����е�¼��Ϣ
		//�ж��û��Ƿ��¼
		if (userCustom != null) {
			return true;
		}
		String msg = "�㻹û�е�¼�����ȵ�¼��";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/houtai/login.jsp").forward(request, response);
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
		// �ж�session
		System.out.println("����handler��...");
	}
}
