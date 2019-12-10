package edu.jwj439.sys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.jwj439.sys.dao.NewsMapper;
import edu.jwj439.sys.entity.News;
import edu.jwj439.sys.service.INewsService;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.vo.NewsVo;

@Service
public class NewsServiceImpl implements INewsService {

	@Autowired
	private NewsMapper newsMapper;

	/**
	 * 查询所有
	 * 
	 * @param newsVo
	 * @return
	 */
	@Override
	public DataGridView queryAllNews(NewsVo newsVo) {
		Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
		List<News> data = this.newsMapper.queryAllNews(newsVo);
		return new DataGridView(page.getTotal(), data);
	}

	/**
	 * 添加公告
	 * 
	 * @param newsVo
	 */
	@Override
	public void addNews(NewsVo newsVo) {
		this.newsMapper.insertSelective(newsVo);
	}

	/**
	 * 删除一条公告
	 * 
	 * @param newsid
	 */
	@Override
	public void deleteNews(Integer newsid) {
		this.newsMapper.deleteByPrimaryKey(newsid);
	}

	/**
	 * 批量删除公告
	 * 
	 * @param ids
	 */
	@Override
	public void deleteBatchNews(Integer[] ids) {
		for (Integer id : ids) {
			this.deleteNews(id);
		}
	}

	/**
	 * 更新公告
	 * 
	 * @param newsVo
	 */
	@Override
	public void updateNews(NewsVo newsVo) {
		this.newsMapper.updateByPrimaryKeySelective(newsVo);
	}

	/**
	 * 通过id查询一条公告
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public News queryNewsById(Integer id) {
		return this.newsMapper.selectByPrimaryKey(id);
	}

	@Override
	public void addNewsWithOrderState() {
		this.newsMapper.insertNewsWithOrderState();
	}
}
