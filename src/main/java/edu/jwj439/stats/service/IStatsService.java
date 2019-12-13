package edu.jwj439.stats.service;

import java.util.List;

import edu.jwj439.stats.entity.BaseEntity;

public interface IStatsService {
   
    List<Double> loadCompanyYearGradeStatList(String year);
    
    /**
     * 业务员年度销售额数据
     * @return
     */
    List<BaseEntity> loadOpernameYearGradeStatList(String year);
}
