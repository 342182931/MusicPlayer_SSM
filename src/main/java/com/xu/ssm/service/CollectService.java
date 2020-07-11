package com.xu.ssm.service;

import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.CollectQueryVo;

/**
 * 
* <p>Title: UserandsongmenuService</p>  
* <p>Description:收藏service接口 </p>  
* @author xujianfeng  
* @date 2019年8月28日
 */
public interface CollectService {

	CollectCustom findCollect(CollectQueryVo queryVo);

	void addCollect(CollectCustom collectCustom);

	void deleteCollect(Integer collectid);


}
