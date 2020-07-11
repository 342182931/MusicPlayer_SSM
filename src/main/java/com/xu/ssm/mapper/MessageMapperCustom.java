package com.xu.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.xu.ssm.po.MessageCustom;

public interface MessageMapperCustom {

	List<MessageCustom> findMessageByPage(Map<String, Object> map);
}