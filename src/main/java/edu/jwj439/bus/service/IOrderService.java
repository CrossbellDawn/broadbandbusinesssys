package edu.jwj439.bus.service;

import java.util.List;
import edu.jwj439.bus.entity.Order;
import edu.jwj439.bus.vo.OrderVo;
import edu.jwj439.sys.utils.DataGridView;

public interface IOrderService {
    public DataGridView queryAllOrder(OrderVo orderVo);
    
    public void addOrder(OrderVo orderVo);
    
    public void updateOrder(OrderVo orderVo);
    
    public void deleteOrder(Integer order_id);
    
    public void deleteBatchOrder(Integer order_ids[]);
    
    public Order queryOrderByorder_id(Integer order_id);
    
    List<Order> queryAllOrderForList (OrderVo orderVo);
}
