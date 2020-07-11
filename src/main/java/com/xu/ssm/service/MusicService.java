package com.xu.ssm.service;

import java.util.List;

import com.xu.ssm.po.Music;
import com.xu.ssm.po.MusicCustom;
import com.xu.ssm.po.MusicQueryVo;
import com.xu.ssm.po.PageBean;

/**
 * 
* <p>Title: MusicService</p>  
* <p>Description:音乐service接口 </p>  
* @author xujianfeng  
* @date 2019年8月28日
 */
public interface MusicService {

	PageBean<MusicCustom> findMusicByPage(Integer currPage, MusicQueryVo musicQueryVo,Integer pageSize);

	void updateUser(Integer id, MusicCustom musicCustom);

	void deleteMusicById(Integer integer);

	List<MusicCustom> findMusic(MusicCustom musicCustom);

	void addMusic(MusicCustom musicCustom);

	MusicCustom selectMusicById(Integer id);
	
	PageBean<MusicCustom> findMusicByRank(Integer currPage,String term,Integer pageSize);

}
