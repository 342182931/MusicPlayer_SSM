package com.xu.ssm.service;

import com.xu.ssm.po.CollectCustom;
import com.xu.ssm.po.CollectQueryVo;

/**
 * 
* <p>Title: UserandsongmenuService</p>  
* <p>Description:�ղ�service�ӿ� </p>  
* @author xujianfeng  
* @date 2019��8��28��
 */
public interface CollectService {

	CollectCustom findCollect(CollectQueryVo queryVo);

	void addCollect(CollectCustom collectCustom);

	void deleteCollect(Integer collectid);


}
