package edu.jwj439.stats.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.jwj439.stats.dao.StatsMapper;
import edu.jwj439.stats.entity.BaseEntity;
import edu.jwj439.stats.service.IStatsService;
@Service
public class StatsServiceImpl implements IStatsService {
    @Autowired
    private StatsMapper statsMapper;

    @Override
    public List<Double> loadCompanyYearGradeStatList(String year) {
        return this.statsMapper.queryCompanyYearGradeStat(year);
    }

    @Override
    public List<BaseEntity> loadOpernameYearGradeStatList(String year) {
        return this.statsMapper.queryOpernameYearGradeStat(year);
    }
}
