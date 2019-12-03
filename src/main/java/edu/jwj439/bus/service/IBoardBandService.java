package edu.jwj439.bus.service;

import java.util.List;

import edu.jwj439.bus.entity.BoardBand;
import edu.jwj439.bus.vo.BoardBandVo;
import edu.jwj439.sys.utils.DataGridView;


public interface IBoardBandService {
    /**
     * 查询所有宽带产品
     * @param BoardBandVo
     * @return
     */
    public DataGridView queryAllBoardBand(BoardBandVo boardBandVo);
    /**
     * 添加宽带产品
     * @param BoardBandVo
     */
    public void addBoardBand(BoardBandVo boardBandVo);

    /**
     * 修改宽带产品
     * @param BoardBandVo
     */
    public void updateBoardBand(BoardBandVo boardBandVo);

    /**
     * 删除宽带产品
     * @param cust_id
     */
    public void deleteBoardBand(Integer band_id);

    /**
     * 批量删除宽带产品
     * @param cust_ids
     */
    public void deleteBatchBoardBand(Integer [] band_ids);

    /**
     * 根据身份号查询宽带产品信息
     * @param cust_id
     * @return
     */
    public BoardBand queryBoardBandBycust_id(Integer band_id);

    /**
     * 查询宽带产品数据返回集合
     * @param BoardBandVo
     * @return
     */
    List<BoardBand> queryAllBoardBandForList(BoardBandVo boardBandVo);
}
