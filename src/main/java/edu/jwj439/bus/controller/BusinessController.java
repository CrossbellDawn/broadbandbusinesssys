package edu.jwj439.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 业务管理的路由控制器
 */
@Controller
@RequestMapping("bus")
public class BusinessController {
    /**
     * 跳转到客户管理
     * @return
     */
    @RequestMapping("toCustomerManager")
    public String toCustomerManager(){
        return "business/customer/customerManager";
    }
    
    /**
     * 跳转到宽带管理
     * @return
     */
    @RequestMapping("toBoardBandManager")
    public String toBoardBandManager(){
    	return "business/boardband/boardbandManager";
    }
    /**
     * 跳到订单管理
     * @return
     */
    @RequestMapping("toOrderManager")
    public String toOrderManager(){
    	return "business/order/orderManager";
    }
}
