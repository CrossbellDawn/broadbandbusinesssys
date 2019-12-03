package edu.jwj439.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import edu.jwj439.bus.dao.BoardBandMapper;
import edu.jwj439.bus.entity.BoardBand;
import edu.jwj439.bus.service.IBoardBandService;
import edu.jwj439.bus.vo.BoardBandVo;
import edu.jwj439.sys.utils.DataGridView;
@Service
public class BoardBandServiceImpl implements IBoardBandService {
	@Autowired
	private BoardBandMapper boardBandMapper;
	
	@Override
	public DataGridView queryAllBoardBand(BoardBandVo boardBandVo) {
		Page<Object> page=PageHelper.startPage(boardBandVo.getPage(),boardBandVo.getLimit());
		List<BoardBand> data=this.boardBandMapper.queryAllBoardBand(boardBandVo);
		return  new DataGridView(page.getTotal(),data);
	}

	@Override
	public void addBoardBand(BoardBandVo boardBandVo) {
		this.boardBandMapper.insert(boardBandVo);
		
	}

	@Override
	public void updateBoardBand(BoardBandVo boardBandVo) {
		this.boardBandMapper.updateByPrimaryKeySelective(boardBandVo);
	}

	@Override
	public void deleteBoardBand(Integer band_id) {
		this.boardBandMapper.deleteByPrimaryKey(band_id);
		
	}

	@Override
	public void deleteBatchBoardBand(Integer[] band_ids) {
		for(Integer band_id:band_ids){
			this.deleteBoardBand(band_id);
		}
		
	}

	@Override
	public BoardBand queryBoardBandBycust_id(Integer band_id) {
		
		return this.boardBandMapper.selectByPrimaryKey(band_id);
	}

	@Override
	public List<BoardBand> queryAllBoardBandForList(BoardBandVo boardBandVo) {
		return this.boardBandMapper.queryAllBoardBand(boardBandVo) ;
	}



}
