package edu.jwj439.bus.dao;

import java.util.List;
import edu.jwj439.bus.entity.Order;
import edu.jwj439.bus.vo.OrderVo;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    int updateByOrderNumber(Order record);

    List<Order> queryAllOrder(OrderVo orderVo);
    
    int updateOrderState();
}