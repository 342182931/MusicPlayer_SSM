package com.xu.ssm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xu.ssm.po.MusicCustom;
import com.xu.ssm.po.MusicQueryVo;

public interface MusicMapperCustom {

	List<MusicCustom> findMusicByPage(Map<String, Object> map);

	MusicCustom selectByPrimaryKey(Integer musicid);

	List<MusicCustom> findMusic(MusicCustom musicCustom);

	List<MusicCustom> findMusicByRank(HashMap<String, Object> map);

}