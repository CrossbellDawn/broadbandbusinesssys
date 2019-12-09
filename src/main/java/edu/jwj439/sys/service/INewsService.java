package edu.jwj439.sys.service;

import edu.jwj439.sys.entity.News;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.vo.NewsVo;

public interface INewsService {

    /**
     * 查询所有公告
     * @param newsVo
     * @return
     */
    public DataGridView queryAllNews(NewsVo newsVo);

    /**
     * 添加公告
     * @param newsVo
     */
    public void addNews(NewsVo newsVo);

    /**
     * 删除公告
     * @param newsid
     */
    public void deleteNews(Integer newsid);

    /**
     * 批量删除公告
     * @param ids
     */
    public void deleteBatchNews(Integer[] ids);

    /**
     * 更新公告
     * @param newsVo
     */
    public void updateNews(NewsVo newsVo);

    public  News queryNewsById(Integer id);
    
    public void  addNewsWithOrderState();
}
