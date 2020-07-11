package com.xu.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.SongListMapper;
import com.xu.ssm.mapper.SongListMapperCustom;
import com.xu.ssm.po.SongListCustom;
import com.xu.ssm.po.SongMenuCustom;
import com.xu.ssm.service.SongListService;
@Service("songListService")
public class SongListServiceImpl implements SongListService {

	@Autowired
	private SongListMapper songListMapper;
	@Autowired
	private SongListMapperCustom songListMapperCustom;
	@Override
	public List<SongListCustom> findSonListById(Integer songmenuid) {
		// TODO Auto-generated method stub
		return songListMapperCustom.findSongListById(songmenuid);
	}
	@Override
	public void addSongList(SongListCustom songListCustom) {
		// TODO Auto-generated method stub
		songListMapper.insert(songListCustom);
	}

}
