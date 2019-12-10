package edu.jwj439.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import edu.jwj439.sys.dao.LogInfoMapper;
import edu.jwj439.sys.entity.LogInfo;
import edu.jwj439.sys.service.ILogInfoService;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 日志管理
 */
@Service
public class LogInfoServiceImpl implements ILogInfoService {

	@Autowired
	private LogInfoMapper logInfoDao;

	/**
	 * 查询日志
	 * 
	 * @param logInfoVo
	 * @return
	 */
	@Override
	public DataGridView queryAllLogInfo(LogInfoVo logInfoVo) {
		Page<Object> page = PageHelper.startPage(logInfoVo.getPage(), logInfoVo.getLimit());
		List<LogInfo> data = this.logInfoDao.queryAllLogInfo(logInfoVo);
		return new DataGridView(page.getTotal(), data);
	}

	/**
	 * 添加日志
	 * 
	 * @param logInfoVo
	 */
	@Override
	public void addLogInfo(LogInfoVo logInfoVo) {
		this.logInfoDao.insertSelective(logInfoVo);
	}

	/**
	 * 删除单个日志
	 * 
	 * @param logInfoid
	 */
	@Override
	public void deleteLogInfo(Integer logInfoid) {
		this.logInfoDao.deleteByPrimaryKey(logInfoid);
	}

	/**
	 * 批量删除日志
	 * 
	 * @param ids
	 */
	@Override
	public void deleteBatchLogInfo(Integer[] ids) {
		for (Integer id : ids) {
			this.deleteLogInfo(id);
		}
	}
}
