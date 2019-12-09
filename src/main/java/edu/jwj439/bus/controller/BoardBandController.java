package edu.jwj439.bus.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.jwj439.bus.service.IBoardBandService;
import edu.jwj439.bus.vo.BoardBandVo;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.utils.ResultObj;

@RestController
@RequestMapping("boardband")
public class BoardBandController {
	@Autowired
	private IBoardBandService boardBandService;
	
	 /**
     * 加载宽带产品端列表返回DataGridView
     * 
     * @param BoardBandVo
     * @return
     */
    @RequestMapping("loadAllBoardBand")
    public DataGridView loadAllBoardBand(BoardBandVo BoardBandVo) {
        return this.boardBandService.queryAllBoardBand(BoardBandVo);
    }

    /**
     * 添加一个宽带产品
     * 
     * @param BoardBandVo
     * @return
     */
    @RequestMapping("addBoardBand")
    public ResultObj addBoardBand(BoardBandVo BoardBandVo) {
        try {
            BoardBandVo.setBandCreatetime(new Date());
            this.boardBandService.addBoardBand(BoardBandVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改宽带产品
     * 
     * @param BoardBandVo
     * @return
     */
    @RequestMapping("updateBoardBand")
    public ResultObj updateBoardBand(BoardBandVo BoardBandVo) {
        try {

            this.boardBandService.updateBoardBand(BoardBandVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个宽带产品
     * 
     * @param BoardBandVo
     * @return
     */
    @RequestMapping("deleteBoardBand")
    public ResultObj deleteBoardBand(BoardBandVo BoardBandVo) {
        try {
            this.boardBandService.deleteBoardBand(BoardBandVo.getBandId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除宽带产品
     * 
     * @param BoardBandVo
     * @return
     */
    @RequestMapping("deleteBatchBoardBand")
    public ResultObj deleteBatchBoardBand(BoardBandVo BoardBandVo) {
        try {
            this.boardBandService.deleteBatchBoardBand(BoardBandVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
