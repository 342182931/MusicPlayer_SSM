package com.xu.ssm.service;

import java.util.List;

import com.xu.ssm.po.SongListCustom;
import com.xu.ssm.po.SongMenuCustom;

/**
 * 
* <p>Title: MusicandsongmenuService</p>  
* <p>Description:�赥�͸���service�ӿ� </p>  
* @author xujianfeng  
* @date 2019��8��28��
 */
public interface SongListService {

	List<SongListCustom> findSonListById(Integer songmenuid);

	void addSongList(SongListCustom songListCustom);

}
