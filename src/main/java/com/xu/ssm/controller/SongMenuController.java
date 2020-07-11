package com.xu.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xu.ssm.po.MusicCustom;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.SongMenuCustom;
import com.xu.ssm.po.SongMenuQueryVo;
import com.xu.ssm.service.SongMenuService;
import com.xu.ssm.tools.FileRenameUtil;

@Controller
public class SongMenuController {
	@Autowired
	private SongMenuService songMenuService;

	@RequestMapping("/houtai/findSongMenuListByPage")
	public String findSongMenuListByPage(SongMenuQueryVo songMenuQueryVo, Model model, Integer currPage)
			throws Exception {
		PageBean<SongMenuCustom> pageBean = songMenuService.findSongMenuByPage(currPage, songMenuQueryVo,5);
		model.addAttribute("pageBean", pageBean);
		return "houtai/SongMenu/list";
	}
	
	@RequestMapping("findSongMenuByPage")
	public String findSongMenuByPage(SongMenuQueryVo songMenuQueryVo, Model model, Integer currPage)
			throws Exception {
		PageBean<SongMenuCustom> pageBean = songMenuService.findSongMenuByPage(currPage, songMenuQueryVo,12);
		model.addAttribute("pageBean", pageBean);
		return "songlist";
	}

	@RequestMapping("addSongMenu")
	public String addSongMenu(Integer userid, SongMenuCustom songMenuCustom) throws Exception {
		songMenuCustom.setUserid(userid);
		songMenuCustom.setTime(FileRenameUtil.systime());
		songMenuCustom.setPhoto("/upload/photo.jpeg");
		songMenuCustom.setLanguage("国语");
		songMenuCustom.setTheme("经典");
		songMenuCustom.setStyle("流行");
		songMenuService.addSongMenu(songMenuCustom);
		return "redirect:person_listmenu.action?userid="+userid;
	}
	
	@RequestMapping("findSongMenu")
	public @ResponseBody SongMenuCustom findSongMenu(Integer menuid) throws Exception {
		SongMenuCustom songMenuCustom=new SongMenuCustom();
		songMenuCustom=songMenuService.findSongMenuById(menuid);
		return songMenuCustom;
	}
	
	@RequestMapping("person_listmenu")
	public String person_listmenu(Integer userid,HttpServletRequest request){
		List<SongMenuCustom> list_songmenu= songMenuService.findSongMenuByUserId(userid);
		if(list_songmenu.size()!=0) {
		HttpSession session=request.getSession();
		session.setAttribute("list_songmenu", list_songmenu);
		return "forward:findSongMenuById.action?songmenuid="+list_songmenu.get(0).getSongmenuid();
		}else {
			return "person-list";
		}
	}
	//查找关于用户收藏和创建的歌单
	@RequestMapping("findUserSongMenu")
	public @ResponseBody List<SongMenuCustom> findUserSongMenu(Integer userid,HttpServletRequest request){
		if(userid==null) {return null;}
		List<SongMenuCustom> list_songmenu= songMenuService.findSongMenuByUserId(userid);
		return list_songmenu;
	}
	
	@RequestMapping("findSongMenuById")
	public  String findSongMenuById(Integer songmenuid,HttpServletRequest request) throws Exception {
		SongMenuCustom songMenuCustom=new SongMenuCustom();
		songMenuCustom=songMenuService.findSongMenuById(songmenuid);
		HttpSession session=request.getSession();
		session.setAttribute("personsongMenuCustom", songMenuCustom);
		return "redirect:person_list.action?songmenuid="+songmenuid;
	}
	
	@RequestMapping("updateSongMenu")
	public String updateSongMenu(Integer songmenuid,Integer userid, SongMenuCustom songMenuCustom,MultipartFile file) throws Exception {
		if(file!=null) {
			upload(file, songMenuCustom);
			}
		songMenuService.updateUser(songmenuid, songMenuCustom);
		return "redirect:person_listmenu.action?userid="+userid;
	}
	
	@RequestMapping("findSongMenuByIdUser")
	public  String findSongMenuByIdUser(Integer songmenuid,HttpServletRequest request) throws Exception {
		SongMenuCustom songMenuCustom=new SongMenuCustom();
		songMenuCustom=songMenuService.findSongMenuById(songmenuid);
		HttpSession session=request.getSession();
		session.setAttribute("songMenuCustom", songMenuCustom);
		return "redirect:songmenulist.action?songmenuid="+songmenuid;
	}
	
	@RequestMapping("/houtai/updateSongMenu")
	public String updateSongMenu(Integer id, SongMenuCustom songMenuCustom, Integer currPage) throws Exception {
		songMenuService.updateUser(id, songMenuCustom);
		return "forward:/houtai/findSongMenuListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteSongMenuById")
	public String deleteSongMenuById(Integer id, Integer currPage) throws Exception {
		songMenuService.deleteSongMenuById(id);
		return "forward:/houtai/findSongMenuListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteAllSongMenuById")
	public String deleteAllSongMenuById(Integer[] id, Integer currPage) throws Exception {
		for (int i = 0; i < id.length; i++) {
			songMenuService.deleteSongMenuById(id[i]);
		}
		return "forward:/houtai/findSongMenuListByPage.action?currPage=" + currPage;
	}
	public void upload(MultipartFile file,SongMenuCustom songMenuCustom) {
		try {
			String name = file.getOriginalFilename();
			String fileName=FileRenameUtil.fileRename()+name.substring(name.indexOf("."));
			//String path = request.getServletContext().getRealPath("/upload/");
			String path="D:\\upload\\";
			File f=new File(path,fileName);
			if(!f.exists())f.mkdirs();
			file.transferTo(f);
			songMenuCustom.setPhoto("/upload/"+fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("rank_index_songmenu")
	public String rank_index_songmenu(HttpServletRequest request) throws Exception {
		PageBean<SongMenuCustom> pageBean_songmenu = songMenuService.findSongMenuByPage(1, null, 5);
		HttpSession session=request.getSession();
		session.setAttribute("pageBean_songmenu",pageBean_songmenu);
		return "index";
	}
}
