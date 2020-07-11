package com.xu.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.MessageMapper;
import com.xu.ssm.mapper.MessageMapperCustom;
import com.xu.ssm.po.MessageCustom;
import com.xu.ssm.po.MessageQueryVo;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.service.MessageService;
@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageMapper;
	@Autowired
	private MessageMapperCustom messageMapperCustom;
	@Override
	public PageBean<MessageCustom> findMessageByPage(Integer currPage, MessageQueryVo messageQueryVo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageBean<MessageCustom> pageBean = new PageBean<MessageCustom>();

		// ��װ�ܼ�¼��
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("messageCustom", messageQueryVo.getMessageCustom());
		int totalCount = messageMapperCustom.findMessageByPage(map1).size();
		pageBean.setTotalCount(totalCount);

		// ��װ��ҳ��
		pageBean.setTotalPage();

		// ��װ��ǰҳ��
		pageBean.setCurrPage(currPage);
		// ��ֵ���map��
		map.put("start", (pageBean.getCurrPage() - 1) * pageBean.getPageSize());
		map.put("size", pageBean.getPageSize());
		map.put("messageCustom", messageQueryVo.getMessageCustom());
		// ��װÿҳ��ʾ������
		List<MessageCustom> lists = messageMapperCustom.findMessageByPage(map);
		pageBean.setListT(lists);

		return pageBean;
	}

	@Override
	public void updateUser(Integer id, MessageCustom messageCustom) {
		// TODO Auto-generated method stub
		messageCustom.setMessageid(id);
		messageMapper.updateByPrimaryKeySelective(messageCustom);
	}

	@Override
	public void deleteMessageById(Integer id) {
		// TODO Auto-generated method stub
		messageMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void addMessage(MessageCustom messageCustom) {
		// TODO Auto-generated method stub
		messageMapper.insert(messageCustom);
	}

}
