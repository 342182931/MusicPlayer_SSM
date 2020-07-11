package com.xu.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.SongListCustom;
import com.xu.ssm.po.SongMenuCustom;
import com.xu.ssm.service.SongListService;

@Controller
public class SongListController {
	@Autowired
	private SongListService songListService;
	
	@RequestMapping("person_list")
	public String person_list(Integer songmenuid,HttpServletRequest request){
		List<SongListCustom> list_songlist= songListService.findSonListById(songmenuid);
		HttpSession session=request.getSession();
		session.setAttribute("person_songlist", list_songlist);
		return "person-list";
	}
	@RequestMapping("songmenulist")
	public String songmenulist(Integer songmenuid,HttpServletRequest request){
		List<SongListCustom> list_songlist= songListService.findSonListById(songmenuid);
		HttpSession session=request.getSession();
		session.setAttribute("list_songlist", list_songlist);
		return "songlist-detail";
	}
	@RequestMapping("insertsongmenulist")
	public @ResponseBody boolean insertsongmenulist(SongListCustom songListCustom) {
		try {
			songListService.addSongList(songListCustom);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
