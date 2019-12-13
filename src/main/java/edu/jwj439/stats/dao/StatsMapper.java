package edu.jwj439.stats.dao;

import java.util.List;

import edu.jwj439.stats.entity.BaseEntity;

public interface StatsMapper {
    /**
     * 查询公司年度业务销售额数据
     * @param year
     * @return
     */
    List<Double> queryCompanyYearGradeStat(String year);

	List<BaseEntity> queryOpernameYearGradeStat(String year);    
}
