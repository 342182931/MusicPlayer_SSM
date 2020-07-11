package com.xu.ssm.service;

import com.xu.ssm.po.MessageCustom;
import com.xu.ssm.po.MessageQueryVo;
import com.xu.ssm.po.PageBean;

/**
 * 
* <p>Title: MessageService</p>  
* <p>Description:����service�ӿ� </p>  
* @author xujianfeng  
* @date 2019��8��28��
 */
public interface MessageService {

	PageBean<MessageCustom> findMessageByPage(Integer currPage, MessageQueryVo messageQueryVo);

	void updateUser(Integer id, MessageCustom messageCustom);

	void deleteMessageById(Integer id);

	void addMessage(MessageCustom messageCustom);

}
