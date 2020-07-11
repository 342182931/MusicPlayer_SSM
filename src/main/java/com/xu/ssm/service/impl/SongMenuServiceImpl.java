package com.xu.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.SongMenuMapper;
import com.xu.ssm.mapper.SongMenuMapperCustom;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.SongMenuCustom;
import com.xu.ssm.po.SongMenuQueryVo;
import com.xu.ssm.service.SongMenuService;

@Service("songMenuService")
public class SongMenuServiceImpl implements SongMenuService {
	@Autowired
	private SongMenuMapper songMenuMapper;
	@Autowired
	private SongMenuMapperCustom songMenuMapperCustom;

	@Override
	public PageBean<SongMenuCustom> findSongMenuByPage(Integer currPage, SongMenuQueryVo songMenuQueryVo,
			Integer pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageBean<SongMenuCustom> pageBean = new PageBean<SongMenuCustom>();

		// 封装当前页数数量
		if (pageSize != null) {
			pageBean.setPageSize(pageSize);
		}
		// 封装总记录数
		int totalCount = songMenuMapperCustom.findSongMenuByPage(null).size();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		pageBean.setTotalPage();

		// 封装当前页数
		pageBean.setCurrPage(currPage);

		// 将值存进map中
		map.put("start", (pageBean.getCurrPage() - 1) * pageBean.getPageSize());
		map.put("size", pageBean.getPageSize());
		if (songMenuQueryVo != null)
			map.put("songMenuCustom", songMenuQueryVo.getSongMenuCustom());
		// 封装每页显示的数据
		List<SongMenuCustom> lists = songMenuMapperCustom.findSongMenuByPage(map);
		pageBean.setListT(lists);

		return pageBean;
	}

	@Override
	public void updateUser(Integer id, SongMenuCustom songMenuCustom) {
		// TODO Auto-generated method stub
		songMenuCustom.setSongmenuid(id);
		songMenuMapper.updateByPrimaryKeySelective(songMenuCustom);
	}

	@Override
	public void deleteSongMenuById(Integer id) {
		// TODO Auto-generated method stub
		songMenuMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void addSongMenu(SongMenuCustom songMenuCustom) {
		// TODO Auto-generated method stub
		songMenuMapper.insert(songMenuCustom);
	}

	@Override
	public List<SongMenuCustom> findSongMenuByUserId(Integer userid) {
		// TODO Auto-generated method stub
		return songMenuMapperCustom.findSongMenuByUserId(userid);
	}

	@Override
	public SongMenuCustom findSongMenuById(Integer id) {
		// TODO Auto-generated method stub
		return songMenuMapperCustom.findSongMenuById(id);
	}

}
