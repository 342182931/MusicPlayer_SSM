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
import org.springframework.web.servlet.ModelAndView;

import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.UserCustom;
import com.xu.ssm.po.UserQueryVo;
import com.xu.ssm.service.UserService;
import com.xu.ssm.tools.FileRenameUtil;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/houtai/findUserList")
	public String findUserList(UserQueryVo userQueryVo, Model model) throws Exception {
		List<UserCustom> userList = userService.findUserList(userQueryVo);
		model.addAttribute("userList", userList);
		return "houtai/User/list";
	}

	@RequestMapping("/houtai/findUserListByPage")
	public String findUserListByPage(UserQueryVo userQueryVo, Model model, Integer currPage) throws Exception {
		PageBean<UserCustom> pageBean = userService.findUserByPage(currPage, userQueryVo, null);
		model.addAttribute("pageBean", pageBean);
		return "houtai/User/list";
	}

	@RequestMapping("/houtai/addUser")
	public String addUser(UserCustom userCustom, MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			upload(file, userCustom);
		}
		userService.addUser(userCustom);
		return "forward:/houtai/findUserListByPage.action?currPage=" + 1;
	}

	@RequestMapping("/houtai/deleteUserById")
	public String deleteUserById(Integer id, Integer currPage) throws Exception {
		userService.deleteUserById(id);
		return "forward:/houtai/findUserListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteAllUserById")
	public String deleteAllUserById(Integer[] id, Integer currPage) throws Exception {
		for (int i = 0; i < id.length; i++) {
			userService.deleteUserById(id[i]);
		}
		return "forward:/houtai/findUserListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/updateUser")
	public String updateUser(Integer id, UserCustom userCustom, Integer currPage) throws Exception {
		userService.updateUser(id, userCustom);
		return "forward:/houtai/findUserListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/updateUserByLogin")
	public String updateUserByLogin(Integer userid, UserCustom userCustom, HttpServletRequest request,
			MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			upload(file, userCustom);
		}
		userService.updateUser(userid, userCustom);
		userCustom = userService.findUserById(userid);
		HttpSession session = request.getSession();
		session.setAttribute("userCustom", userCustom);
		return "forward:/houtai/info.jsp";
	}

	@RequestMapping("/houtai/findUser")
	public ModelAndView findUser(UserQueryVo userQueryVo, ModelAndView mv, HttpServletRequest request)
			throws Exception {
		UserCustom userCustom = userService.findUser(userQueryVo);
		HttpSession session = request.getSession();
		session.setAttribute("userCustom", userCustom);
		if (userCustom != null) {// 权限验证
			if (userCustom.getOrright() != 1) {
				mv.addObject("msg", "用户权限不够");
				mv.setViewName("houtai/login");
				return mv;
			}
		} else {// 验证账号密码
			mv.addObject("msg", "帐号密码错误");
			mv.setViewName("houtai/login");
			return mv;
		}
		mv.setViewName("houtai/index");
		return mv;
	}

	@RequestMapping("/houtai/cleanSession")
	public ModelAndView cleanSession(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserCustom userCustom = new UserCustom();
		userCustom = (UserCustom) session.getAttribute("userCustom");
		session.invalidate();
		session = request.getSession();
		session.setAttribute("userCustom", userCustom);
		mv.setViewName("houtai/index");
		return mv;
	}

	@RequestMapping("/houtai/quite")
	public ModelAndView quite(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userCustom");
		session.removeAttribute("msg");
		mv.setViewName("houtai/login");
		return mv;
	}

	@RequestMapping("quite")
	public String quite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "MP3";
	}

	@RequestMapping("register")
	public String register(UserCustom userCustom) {
		userCustom.setOrright(2);
		userCustom.setPhoto("/upload/photo.jpeg");
		userService.addUser(userCustom);
		return "MP3";
	}

	@RequestMapping("login")
	public String login(UserQueryVo userQueryVo, HttpServletRequest request) {
		try {
			UserCustom userCustom = userService.findUser(userQueryVo);
			HttpSession session = request.getSession();
			session.setAttribute("userCustom", userCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "MP3";
	}

	@RequestMapping("updateImg")
	public String updateImg(Integer id, UserCustom userCustom, MultipartFile file, HttpServletRequest request)
			throws Exception {
		if (file != null && !file.isEmpty()) {
			upload(file, userCustom);
		}
		userService.updateUser(id, userCustom);

		userCustom = userService.findUserById(id);
		HttpSession session = request.getSession();
		session.invalidate();
		session = request.getSession();
		session.setAttribute("userCustom", userCustom);
		UserCustom user = (UserCustom) session.getAttribute("userCustom");
		System.out.println(user.getPhoto() + user.getName());
		return "MP3";
	}

	@RequestMapping("updatePassword")
	public String updatePassword(Integer id, String passsword, String passsword1, String passsword2,
			HttpServletRequest request) throws Exception {
		UserCustom userCustom = userService.findUserById(id);
		if (userCustom.getPassword() == passsword) {
			userCustom.setPassword(passsword1);
		}
		return "MP3";
	}

	@RequestMapping("findSinger")
	public String findSnger(UserQueryVo queryVo, HttpServletRequest request, Model model, Integer currPage)
			throws Exception {
		UserCustom user = new UserCustom();
		user.setOrright(3);
		queryVo.setUserCustom(user);
		PageBean<UserCustom> pageBean = userService.findUserByPage(currPage, queryVo, 12);
		model.addAttribute("pageBean", pageBean);
		return "singer";
	}

	@RequestMapping("findsonglistbyuserid")
	public String findsonglistbyuserid(Integer userid, HttpServletRequest request) throws Exception {
		UserCustom userCustom = new UserCustom();
		userCustom = userService.findUserById(userid);
		HttpSession session = request.getSession();
		session.setAttribute("singer", userCustom);
		return "redirect:findmusicbysinger.action?musicCustom.userid=" + userid + "&&currPage=1";
	}

	@RequestMapping("findSingerUrl")
	public @ResponseBody UserCustom findSingerUrl(UserCustom userCustom) throws Exception {
		userCustom.setOrright(3);
		UserQueryVo queryVo = new UserQueryVo();
		queryVo.setUserCustom(userCustom);
		UserCustom user1 = userService.findUser(queryVo);
		if (user1 == null) {
			// 下载图片
			if (userCustom.getPhoto() != null || userCustom.getPhoto() != "") {
				String photoname = FileRenameUtil.fileRename() + ".jpg";
				String downloadphoto = "D:\\upload\\photo\\" + photoname;
				FileRenameUtil.downloadFile(userCustom.getPhoto(), downloadphoto);
				userCustom.setPhoto("/upload/photo/" + photoname);
			}
			userService.addUser(userCustom);
			queryVo.setUserCustom(userCustom);
			return userService.findUser(queryVo);
		}
		return user1;
	}

	// 文件上传
	public void upload(MultipartFile file, UserCustom userCustom) {
		try {
			String name = file.getOriginalFilename();
			String fileName = FileRenameUtil.fileRename() + name.substring(name.indexOf("."));
			// String path = request.getServletContext().getRealPath("/upload/");
			String path = "D:\\upload\\";
			File f = new File(path, fileName);
			if (!f.exists())
				f.mkdirs();
			file.transferTo(f);
			userCustom.setPhoto("/upload/" + fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
