package edu.jwj439.bus.dao;

import java.util.List;
import edu.jwj439.bus.entity.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer cust_id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer cust_id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    int updateCustLevelWithCustName(Customer record);

    List<Customer> queryAllCustomer(Customer customer);
}
