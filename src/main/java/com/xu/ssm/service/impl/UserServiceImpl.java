package com.xu.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.UserMapper;
import com.xu.ssm.mapper.UserMapperCustom;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.User;
import com.xu.ssm.po.UserCustom;
import com.xu.ssm.po.UserQueryVo;
import com.xu.ssm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	public UserMapper userMapper;
	@Autowired
	public UserMapperCustom userMapperCustom;

	@Override
	public List<UserCustom> findUserList(UserQueryVo userQueryVo) {
		// TODO Auto-generated method stub
		return userMapperCustom.findUserList(userQueryVo);
	}

	@Override
	public UserCustom findUserById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		// 中间可能需要业务处理
		User user = userMapper.selectByPrimaryKey(id);
		UserCustom userCustom = null;
		// 用spring提供的工具将items的属性值拷贝到itemsCustom
		if (user != null) {
			userCustom = new UserCustom();
			BeanUtils.copyProperties(user, userCustom);
		}
		return userCustom;
	}

	@Override
	public void updateUser(Integer id, UserCustom userCustom) throws Exception {
		// TODO Auto-generated method stub
		userCustom.setUserid(id);
		userMapperCustom.updateById(userCustom);
	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public UserCustom findUser(UserQueryVo userQueryVo) throws Exception {
		// TODO Auto-generated method stub
		List<UserCustom> userCustomList = userMapperCustom.findUser(userQueryVo);
		if (userCustomList.size() == 1)
			return userCustomList.get(0);
		return null;

	}

	@Override
	public PageBean<UserCustom> findUserByPage(int currPage, UserQueryVo userQueryVo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageBean<UserCustom> pageBean = new PageBean<UserCustom>();

		// 封装总记录数
		int totalCount = userMapperCustom.findUserList(userQueryVo).size();
		pageBean.setTotalCount(totalCount);

		// 封装页面页数
		if (pageSize != null) {
			pageBean.setPageSize(pageSize);
		}
		// 封装总页数
		pageBean.setTotalPage();

		// 封装当前页数
		pageBean.setCurrPage(currPage);

		// 将值存进map中
		map.put("start", (pageBean.getCurrPage() - 1) * pageBean.getPageSize());
		map.put("size", pageBean.getPageSize());
		map.put("userCustom", userQueryVo.getUserCustom());
		// 封装每页显示的数据
		List<UserCustom> lists = userMapperCustom.findUserByPage(map);
		pageBean.setListT(lists);

		return pageBean;
	}

	@Override
	public void addUser(UserCustom userCustom) {
		// TODO Auto-generated method stub
		userMapper.insert(userCustom);
	}

}
