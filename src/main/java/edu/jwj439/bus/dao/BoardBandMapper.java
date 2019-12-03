package edu.jwj439.bus.dao;

import java.util.List;

import edu.jwj439.bus.entity.BoardBand;

public interface BoardBandMapper {
    int deleteByPrimaryKey(Integer bandId);

    int insert(BoardBand record);

    int insertSelective(BoardBand record);

    BoardBand selectByPrimaryKey(Integer bandId);

    int updateByPrimaryKeySelective(BoardBand record);

    int updateByPrimaryKey(BoardBand record);
    
    List<BoardBand> queryAllBoardBand(BoardBand boardBand);
}