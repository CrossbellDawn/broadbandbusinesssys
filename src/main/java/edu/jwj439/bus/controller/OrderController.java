package edu.jwj439.bus.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import edu.jwj439.bus.service.IOrderService;
import edu.jwj439.bus.vo.OrderVo;
import edu.jwj439.sys.constast.SysConstast;
import edu.jwj439.sys.entity.User;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.utils.RandomUtils;
import edu.jwj439.sys.utils.ResultObj;
import edu.jwj439.sys.utils.WebUtils;

@RestController
@RequestMapping("order")
public class OrderController {
    @Autowired
    private IOrderService orderService;

    @RequestMapping("loadAllOrder")
    public DataGridView loadAllOrder(OrderVo orderVo) {
        return this.orderService.queryAllOrder(orderVo);
    }

    /**
     * 初始化添加订单的表单数据
     * 
     * @param orderVo
     * @return
     */
    @RequestMapping("initOrderForm")
    public OrderVo initForm(OrderVo orderVo) {
        //生成订单号
        orderVo.setOrderNumber(RandomUtils.createRandomStringUseTime(SysConstast.ORDER_HEAD_GH));
        //生成计费日期
        orderVo.setOrderStarttime(RandomUtils.firstDateOfNextMonth(new Date()));
        //判断租约类型
        switch (orderVo.getOrderFeetype()) {
            case (1)://包年
                orderVo.setOrderEndtime(RandomUtils.FeetypeOfYearly(new Date()));
                break;
            case (0)://包月
                orderVo.setOrderEndtime(RandomUtils.FeetypeOfMonthly(new Date()));
                break;
            default:
                break;
        }
        //设置操作员
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        orderVo.setOrderOperator(user.getRealname());
        return orderVo;
    }

    @RequestMapping("saveOrder")
    public ResultObj saveOrder(OrderVo orderVo) {
        try {
            //保存修改时间
            orderVo.setOrderCreatetime(new Date());
            this.orderService.addOrder(orderVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 删除订单信息
     * 
     * @param OrderVo
     * @return
     */
    @RequestMapping("deleteOrder")
    public ResultObj deleteOrder(OrderVo OrderVo) {
        try {
            // 删除
            this.orderService.deleteOrder(OrderVo.getOrderId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 修改订单信息
     * 
     * @param OrderVo
     * @return
     */
    @RequestMapping("updateOrder")
    public ResultObj updateOrder(OrderVo OrderVo) {
        try {
            // 修改
            this.orderService.updateOrder(OrderVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
}

