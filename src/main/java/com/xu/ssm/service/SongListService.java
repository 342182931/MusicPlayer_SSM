package com.xu.ssm.service;

import java.util.List;

import com.xu.ssm.po.SongListCustom;
import com.xu.ssm.po.SongMenuCustom;

/**
 * 
* <p>Title: MusicandsongmenuService</p>  
* <p>Description:歌单和歌曲service接口 </p>  
* @author xujianfeng  
* @date 2019年8月28日
 */
public interface SongListService {

	List<SongListCustom> findSonListById(Integer songmenuid);

	void addSongList(SongListCustom songListCustom);

}
