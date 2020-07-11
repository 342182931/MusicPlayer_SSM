package com.xu.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.MusicMapper;
import com.xu.ssm.mapper.MusicMapperCustom;
import com.xu.ssm.po.MusicCustom;
import com.xu.ssm.po.MusicQueryVo;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.service.MusicService;

@Service("musicService")
public class MusicServiceImpl implements MusicService {
	@Autowired
	public MusicMapper musicMapper;
	@Autowired
	public MusicMapperCustom musicMapperCustom;

	@Override
	public PageBean<MusicCustom> findMusicByPage(Integer currPage, MusicQueryVo musicQueryVo, Integer pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		PageBean<MusicCustom> pageBean = new PageBean<MusicCustom>();

		map1.put("musicCustom", musicQueryVo.getMusicCustom());
		// 封装总记录数
		int totalCount = musicMapperCustom.findMusicByPage(map1).size();
		pageBean.setTotalCount(totalCount);

		// 封装当前页数数量
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
		map.put("musicCustom", musicQueryVo.getMusicCustom());
		// 封装每页显示的数据
		List<MusicCustom> lists = musicMapperCustom.findMusicByPage(map);
		pageBean.setListT(lists);

		return pageBean;
	}

	@Override
	public void updateUser(Integer id, MusicCustom musicCustom) {
		// TODO Auto-generated method stub
		musicCustom.setMusicid(id);
		musicMapper.updateByPrimaryKey(musicCustom);
	}

	@Override
	public void deleteMusicById(Integer integer) {
		// TODO Auto-generated method stub
		musicMapper.deleteByPrimaryKey(integer);
	}

	@Override
	public List<MusicCustom> findMusic(MusicCustom musicCustom) {
		// TODO Auto-generated method stub
		return musicMapperCustom.findMusic(musicCustom);
	}

	@Override
	public void addMusic(MusicCustom musicCustom) {
		// TODO Auto-generated method stub
		musicMapper.insert(musicCustom);
	}

	@Override
	public MusicCustom selectMusicById(Integer id) {
		// TODO Auto-generated method stub
		return musicMapperCustom.selectByPrimaryKey(id);
	}

	@Override
	public PageBean<MusicCustom> findMusicByRank(Integer currPage, String term, Integer pageSize) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageBean<MusicCustom> pageBean = new PageBean<MusicCustom>();

		// 封装总记录数
		int totalCount = musicMapperCustom.findMusicByPage(null).size();
		totalCount = totalCount > 30 ? 30 : totalCount;
		pageBean.setTotalCount(totalCount);

		// 封装当前页数数量
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
		map.put("term", term);
		// 封装每页显示的数据
		List<MusicCustom> lists = musicMapperCustom.findMusicByRank(map);
		pageBean.setListT(lists);

		return pageBean;
	}

}
