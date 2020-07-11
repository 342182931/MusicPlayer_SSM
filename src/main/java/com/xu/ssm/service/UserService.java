package com.xu.ssm.service;
/**
 * 
* <p>Title: UserService</p>  
* <p>Description:�û�service�ӿ� </p>  
* @author xujianfeng  
* @date 2019��8��28��
 */

import java.util.List;

import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.UserCustom;
import com.xu.ssm.po.UserQueryVo;

public interface UserService {
	public List<UserCustom> findUserList(UserQueryVo userQueryVo);

	public UserCustom findUserById(Integer id) throws Exception;

	public void updateUser(Integer id, UserCustom userCustom) throws Exception;

	public void deleteUserById(Integer id);

	public UserCustom findUser(UserQueryVo userQueryVo) throws Exception;

	public PageBean<UserCustom> findUserByPage(int currPage,UserQueryVo userQueryVo,Integer pageSize) throws Exception;

	public void addUser(UserCustom userCustom);

}
