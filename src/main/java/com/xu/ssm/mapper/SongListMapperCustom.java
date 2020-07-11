package com.xu.ssm.mapper;

import java.util.List;

import com.xu.ssm.po.SongListCustom;


public interface SongListMapperCustom {

	List<SongListCustom> findSongListById(Integer songmenuid);
}