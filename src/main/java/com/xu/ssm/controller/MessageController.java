package com.xu.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xu.ssm.po.MessageCustom;
import com.xu.ssm.po.MessageQueryVo;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.service.MessageService;
import com.xu.ssm.tools.FileRenameUtil;

@Controller
public class MessageController {
	@Autowired
	private MessageService messageService;
	@RequestMapping("/houtai/findMessageListByPage")
	public String findMessageListByPage(MessageQueryVo messageQueryVo, Model model, Integer currPage) throws Exception {
		PageBean<MessageCustom> pageBean = messageService.findMessageByPage(currPage,messageQueryVo);
		model.addAttribute("pageBean", pageBean);
		return "houtai/Message/list";
	}
	@RequestMapping("/houtai/updateMessage")
	public String updateMessage(Integer id, MessageCustom messageCustom, Integer currPage) throws Exception {
		messageService.updateUser(id, messageCustom);
		return "forward:/houtai/findMessageListByPage.action?message.reply=0&&currPage=" + currPage;
	}
	@RequestMapping("/houtai/deleteMessageById")
	public String deleteMessageById(Integer id, Integer currPage) throws Exception {
		messageService.deleteMessageById(id);
		return "forward:/houtai/findMessageListByPage.action?message.reply=0&&currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteAllMessageById")
	public String deleteAllMessageById(Integer[] id, Integer currPage) throws Exception {
		for (int i = 0; i < id.length; i++) {
			messageService.deleteMessageById(id[i]);
		}
		return "forward:/houtai/findMessageListByPage.action?message.reply=0&&currPage=" + currPage;
	}
	@RequestMapping("user_message")
	public String user_message(MessageQueryVo messageQueryVo, Model model, Integer currPage) throws Exception {
		PageBean<MessageCustom> pageBean = messageService.findMessageByPage(currPage,messageQueryVo);
		model.addAttribute("pageBean", pageBean);
		return "user-message";
	}
	@RequestMapping("add_message")
	public String add_message(MessageCustom messageCustom) throws Exception {
		messageCustom.setTime(FileRenameUtil.systime());
		messageService.addMessage(messageCustom);
		return "forward:user_message.action?messageCustom.musicid="+messageCustom.getMusicid()+"&&currPage=1&&messageCustom.reply=0";
	}
	@RequestMapping("list_message")
	public @ResponseBody List<MessageCustom> list_message(MessageQueryVo messageQueryVo) throws Exception {
		PageBean<MessageCustom> page_message= messageService.findMessageByPage(1, messageQueryVo);
		return page_message.getListT();
	}
}
