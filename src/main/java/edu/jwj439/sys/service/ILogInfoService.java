package edu.jwj439.sys.service;


import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.vo.LogInfoVo;

/**
 * 日志管理的服务接口
 */
public interface ILogInfoService {

    /**
     * 查询所有日志
     * @param logInfoVo
     * @return
     */
    public DataGridView queryAllLogInfo(LogInfoVo logInfoVo);

    /**
     * 添加日志
     * @param logInfoVo
     */
    public void addLogInfo(LogInfoVo logInfoVo);

    /**
     * 根据id删除日志
     * @param logInfoid
     */
    public void deleteLogInfo(Integer logInfoid);

    /**
     * 批量删除日志
     * @param ids
     */
    public void deleteBatchLogInfo(Integer [] ids);



}
