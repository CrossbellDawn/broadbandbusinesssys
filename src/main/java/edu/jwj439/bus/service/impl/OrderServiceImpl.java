package edu.jwj439.bus.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.jwj439.bus.dao.OrderMapper;
import edu.jwj439.bus.entity.Order;
import edu.jwj439.bus.service.IOrderService;
import edu.jwj439.bus.vo.OrderVo;
import edu.jwj439.sys.utils.DataGridView;

@Service
public class OrderServiceImpl implements IOrderService{
    @Autowired
    private OrderMapper orderMapper;
    
    @Override
    public DataGridView queryAllOrder(OrderVo orderVo) {
        Page<Object> page=PageHelper.startPage(orderVo.getPage(),orderVo.getLimit());
        List<Order> data=this.orderMapper.queryAllOrder(orderVo);
        return new DataGridView(page.getTotal(), data);
        
    }

    @Override
    public void addOrder(OrderVo orderVo) {
        this.orderMapper.insert(orderVo);
    }

    @Override
    public void updateOrder(OrderVo orderVo) {
        this.orderMapper.updateByOrderNumber(orderVo);
    }

    @Override
    public void deleteOrder(Integer order_id) {
        this.orderMapper.deleteByPrimaryKey(order_id);
    }

    @Override
    public void deleteBatchOrder(Integer[] order_ids) {
        for(Integer order_id:order_ids) {
            this.deleteOrder(order_id);
        }
    }

    @Override
    public Order queryOrderByorder_id(Integer order_id) {
        return this.orderMapper.selectByPrimaryKey(order_id);
    }

    @Override
    public List<Order> queryAllOrderForList(OrderVo orderVo) {
        return this.orderMapper.queryAllOrder(orderVo);
    }

    @Override
    public void updateOrderState() {
      this.orderMapper.updateOrderState();
    }

}
