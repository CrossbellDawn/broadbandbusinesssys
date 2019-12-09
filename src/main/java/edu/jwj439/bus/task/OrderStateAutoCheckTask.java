package edu.jwj439.bus.task;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import edu.jwj439.bus.service.IOrderService;
import edu.jwj439.sys.dao.INewsDao;
import edu.jwj439.sys.service.INewsService;
import edu.jwj439.sys.utils.ApplicationContextUtil;

@Component
@EnableScheduling // 开启定时任务
public class OrderStateAutoCheckTask {
    @Scheduled(cron="0 0/1 0/1 * * ? ") //每分钟(调试用)
    //@Scheduled(cron = "0 0 0 * * ?  ")
    public void OrderCheck() {
        IOrderService orderService =
                (IOrderService) ApplicationContextUtil.getBean("orderServiceImpl");
        orderService.updateOrderState();
    }
    
    @Scheduled(cron="10 0/1 0/1 * * ? ") //每分钟(调试用)
    //@Scheduled(cron = "10 0 0 * * ?   ")//比上面的状态更新  慢 10秒
    public void NewsWithOrderState() {
        INewsService newsService=
                (INewsService) ApplicationContextUtil.getBean("newsServiceImpl");
        newsService.addNewsWithOrderState();
    }
    
}
