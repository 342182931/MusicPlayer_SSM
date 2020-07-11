package com.xu.ssm.mapper;

import com.xu.ssm.po.Collect;
import com.xu.ssm.po.CollectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectMapper {
    long countByExample(CollectExample example);

    int deleteByExample(CollectExample example);

    int deleteByPrimaryKey(Integer collectid);

    int insert(Collect record);

    int insertSelective(Collect record);

    List<Collect> selectByExample(CollectExample example);

    Collect selectByPrimaryKey(Integer collectid);

    int updateByExampleSelective(@Param("record") Collect record, @Param("example") CollectExample example);

    int updateByExample(@Param("record") Collect record, @Param("example") CollectExample example);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}