package com.xu.ssm.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xu.ssm.mapper.CollectMapper;
import com.xu.ssm.mapper.CollectMapperCustom;
import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.CollectQueryVo;
import com.xu.ssm.service.CollectService;
@Service("collectionService")
public class CollectServiceImpl implements CollectService {

	@Autowired
	public CollectMapper collectMapper;
	@Autowired
	public CollectMapperCustom collectMapperCustom;

	@Override
	public CollectCustom findCollect(CollectQueryVo queryVo) {
		// TODO Auto-generated method stub
		return collectMapperCustom.findCollect(queryVo);
	}

	@Override
	public void addCollect(CollectCustom collectCustom) {
		// TODO Auto-generated method stub
		collectMapper.insert(collectCustom);
	}

	@Override
	public void deleteCollect(Integer collectid) {
		// TODO Auto-generated method stub
		collectMapper.deleteByPrimaryKey(collectid);
	}

}
