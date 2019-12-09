package edu.jwj439.bus.service;

import java.util.List;

import edu.jwj439.bus.entity.Customer;
import edu.jwj439.bus.vo.CustomerVo;
import edu.jwj439.sys.utils.DataGridView;

public interface ICustomerService {
    /**
     * 查询所有客户
     * @param customerVo
     * @return
     */
    public DataGridView queryAllCustomer(CustomerVo customerVo);
    /**
     * 添加客户
     * @param customerVo
     */
    public void addCustomer(CustomerVo customerVo);

    /**
     * 修改客户
     * @param customerVo
     */
    public void updateCustomer(CustomerVo customerVo);
    
    public void updateCustomerLevel(CustomerVo customerVo);

    /**
     * 删除客户
     * @param cust_id
     */
    public void deleteCustomer(Integer cust_id);

    /**
     * 批量删除客户
     * @param cust_ids
     */
    public void deleteBatchCustomer(Integer [] cust_ids);

    /**
     * 根据身份号查询客户信息
     * @param cust_id
     * @return
     */
    public Customer queryCustomerBycust_id(Integer cust_id);

    /**
     * 查询客户数据返回集合
     * @param customerVo
     * @return
     */
    List<Customer> queryAllCustomerForList(CustomerVo customerVo);
}
