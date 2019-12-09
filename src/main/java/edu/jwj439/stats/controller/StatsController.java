package edu.jwj439.stats.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.jwj439.stats.service.IStatsService;

@RequestMapping("stats")
@Controller
public class StatsController {
    
    @Autowired
    private IStatsService statsService;
    /**
     * 跳转到公司年度业务统计
     * @return
     */
    @RequestMapping("toCompanyYearGradeStat")
    public String toCompanyYearGradeStat(){
        return "stats/companyYearGradeStat";
    }

    /**
     * 加载公司年度业务统计数据
     * @return
     */
    @RequestMapping("loadCompanyYearGradeStatJson")
    @ResponseBody
    public List<Double> loadCompanyYearGradeStatJson(String year){
        List<Double> entities = this.statsService.loadCompanyYearGradeStatList(year);
        for (int i = 0; i < entities.size(); i++) {
            if (null==entities.get(i)){
                entities.set(i,0.0);
            }
        }
        return entities;
    }
}
