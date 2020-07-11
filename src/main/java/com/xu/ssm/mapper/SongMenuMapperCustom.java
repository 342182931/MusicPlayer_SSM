package com.xu.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import com.xu.ssm.po.SongMenuCustom;

public interface SongMenuMapperCustom {

	List<SongMenuCustom> findSongMenuByPage(HashMap<String, Object> map);

	SongMenuCustom selectByPrimaryKey(Integer songmenuid);

	List<SongMenuCustom> findSongMenuByUserId(Integer userid);

	SongMenuCustom findSongMenuById(Integer songmenuid);
}