package com.xu.ssm.mapper;

import com.xu.ssm.po.SongList;
import com.xu.ssm.po.SongListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SongListMapper {
    long countByExample(SongListExample example);

    int deleteByExample(SongListExample example);

    int deleteByPrimaryKey(Integer songlistid);

    int insert(SongList record);

    int insertSelective(SongList record);

    List<SongList> selectByExample(SongListExample example);

    SongList selectByPrimaryKey(Integer songlistid);

    int updateByExampleSelective(@Param("record") SongList record, @Param("example") SongListExample example);

    int updateByExample(@Param("record") SongList record, @Param("example") SongListExample example);

    int updateByPrimaryKeySelective(SongList record);

    int updateByPrimaryKey(SongList record);
}