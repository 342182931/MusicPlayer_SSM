package com.xu.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.CollectQueryVo;
import com.xu.ssm.service.CollectService;

@Controller
public class CollectController {
	@Autowired
	private CollectService collectService;
	
	@RequestMapping("findCollect")
	public @ResponseBody boolean findCollect(CollectQueryVo queryVo,HttpServletRequest request){
		HttpSession session;
		session = request.getSession();
		try {
			if(queryVo.getCollectCustom().getSongmenuid()!=0&&queryVo.getCollectCustom().getUserid()!=0) {
				CollectCustom collectCustom = collectService.findCollect(queryVo);
				if(collectCustom==null) {
					session.removeAttribute("collectid");
					return false;
				}
				session.setAttribute("collectid", collectCustom.getCollectid());
				return true;
				}
			session.removeAttribute("collectid");
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.removeAttribute("collectid");
			return false;
		}
		
	}
	@RequestMapping("addCollect")
	public String addCollect(CollectCustom collectCustom) throws Exception {
		collectService.addCollect(collectCustom);
		return "songlist-detail";
	}
	@RequestMapping("deleteCollect")
	public String deleteCollect(CollectQueryVo queryVo,HttpServletRequest request) throws Exception {
		CollectCustom collectCustom = collectService.findCollect(queryVo);
		if(collectCustom!=null)collectService.deleteCollect(collectCustom.getCollectid());
		HttpSession session=request.getSession();
		session.removeAttribute("collectid");
		return "songlist-detail";
	}
}
