package com.xu.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.xu.ssm.po.UserCustom;
import com.xu.ssm.po.UserQueryVo;

public interface UserMapperCustom {
	public List<UserCustom> findUserList(UserQueryVo userQueryVo);

	public List<UserCustom> findUser(UserQueryVo userQueryVo);

	public List<UserCustom> findUserByPage(Map<String, Object> map);

	public int updateById(UserCustom userCustom);
}