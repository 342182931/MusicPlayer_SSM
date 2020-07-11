package com.xu.ssm.mapper;

import java.util.List;

import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.CollectQueryVo;

public interface CollectMapperCustom {
	List<CollectCustom> findCollectById( Integer userid);

	CollectCustom findCollect(CollectQueryVo queryVo);
}
