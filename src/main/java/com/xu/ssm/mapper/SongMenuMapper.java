package com.xu.ssm.mapper;

import com.xu.ssm.po.SongMenu;
import com.xu.ssm.po.SongMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SongMenuMapper {
    long countByExample(SongMenuExample example);

    int deleteByExample(SongMenuExample example);

    int deleteByPrimaryKey(Integer songmenuid);

    int insert(SongMenu record);

    int insertSelective(SongMenu record);

    List<SongMenu> selectByExample(SongMenuExample example);

    SongMenu selectByPrimaryKey(Integer songmenuid);

    int updateByExampleSelective(@Param("record") SongMenu record, @Param("example") SongMenuExample example);

    int updateByExample(@Param("record") SongMenu record, @Param("example") SongMenuExample example);

    int updateByPrimaryKeySelective(SongMenu record);

    int updateByPrimaryKey(SongMenu record);
}