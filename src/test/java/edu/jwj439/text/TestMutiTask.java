package edu.jwj439.text;

import org.junit.Test;
import edu.jwj439.bus.service.IOrderService;
import edu.jwj439.sys.utils.ApplicationContextUtil;

public class TestMutiTask {

    @Test
    public void mutiTaskTest() {
        IOrderService orderService=(IOrderService)ApplicationContextUtil.getBean("orderServiceImpl");
        orderService.updateOrderState();
        System.out.println("ABC");
        System.out.println("whl");
    }
}
