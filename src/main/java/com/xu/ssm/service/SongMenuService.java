package com.xu.ssm.service;

import java.util.List;

import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.SongMenuCustom;
import com.xu.ssm.po.SongMenuQueryVo;

/**
 * 
* <p>Title: SongmenuService</p>  
* <p>Description:歌单service接口 </p>  
* @author xujianfeng  
* @date 2019年8月28日
 */
public interface SongMenuService {

	PageBean<SongMenuCustom> findSongMenuByPage(Integer currPage, SongMenuQueryVo songMenuQueryVo,Integer pageSize);

	void updateUser(Integer id, SongMenuCustom songMenuCustom);

	void deleteSongMenuById(Integer id);

	void addSongMenu(SongMenuCustom songMenuCustom);

	List<SongMenuCustom> findSongMenuByUserId(Integer userid);

	SongMenuCustom findSongMenuById(Integer id);

}
