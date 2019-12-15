package edu.jwj439.text;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import edu.jwj439.sys.dao.MenuMapper;
import edu.jwj439.sys.entity.Menu;

public class TestInitMenu {
    @Test
    public void MenuInitTest() {
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        MenuMapper menuDao = context.getBean(MenuMapper.class);
        menuDao.insert(new Menu(1, 0, "校园宽带业务系统", null, 1, null, "&#xe68e;", 1));
        menuDao.insert(new Menu(2, 1, "基础管理", "", 0, "", "&#xe621;", 1));
        menuDao.insert(new Menu(3, 1, "业务管理", "", 0, "", "&#xe663;", 1));
        menuDao.insert(new Menu(4, 1, "系统管理", "", 1, "", "&#xe716;", 1));
        menuDao.insert(new Menu(5, 1, "统计分析", null, 0, null, "&#xe629;", 1));
        menuDao.insert(new Menu(6, 2, "客户管理", "../bus/toCustomerManager.action", 0, "", "&#xe770;", 1));
        menuDao.insert(new Menu(7, 2, "宽带管理", "../bus/toBoardBandManager.action", 0, "", "&#xe7ae;", 1));
        menuDao.insert(new Menu(8, 3, "订单管理", "../bus/toOrderManager.action", 0, "", "&#xe63c;", 1));
        menuDao.insert(new Menu(9, 3, "添加订单", "../bus/toAddOrderPage.action", 0, "", "&#xe657;", 1));
        menuDao.insert(new Menu(10, 4, "菜单管理", "../sys/toMenuManager.action", 1, null, "&#xe60f", 1));
        menuDao.insert(new Menu(11, 4, "角色管理", "../sys/toRoleManager.action", 1, "", "&#xe66f;", 1));
        menuDao.insert(new Menu(12, 4, "用户管理", "../sys/toUserManager.action", 0, "", "&#xe770;", 1));
        menuDao.insert(new Menu(13, 4, "日志管理", "../sys/toLogInfoManager.action", 0, "", "&#xe655;", 1));
        menuDao.insert(new Menu(14, 4, "系统公告", "../sys/toNewsManager.action", 0, "", "&#xe645;", 1));
        menuDao.insert(new Menu(15, 4, "数据源监控", "../druid/", 0, "", "&#xe857;", 1));
        menuDao.insert(new Menu(16, 5, "公司年度月份业务销售统计", "../stats/toCompanyYearGradeStat.action", 0, "", "&#xe62c;", 1));
        menuDao.insert(new Menu(17, 5, "员工年度业务销售额统计", "../stats/toOperatorYearGradeStat.action", 0, "", "&#xe62c;", 1));
        ((ConfigurableApplicationContext)context).close();
        System.out.println("初始化完成");
    }
}
