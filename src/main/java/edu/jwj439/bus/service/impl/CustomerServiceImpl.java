package edu.jwj439.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import edu.jwj439.bus.dao.CustomerMapper;
import edu.jwj439.bus.entity.Customer;
import edu.jwj439.bus.service.ICustomerService;
import edu.jwj439.bus.vo.CustomerVo;
import edu.jwj439.sys.utils.DataGridView;

@Service
public class CustomerServiceImpl implements ICustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;
	@Override
	public DataGridView queryAllCustomer(CustomerVo customerVo) {
		Page<Object> page=PageHelper.startPage(customerVo.getPage(),customerVo.getLimit());
		List<Customer> data=this.customerMapper.queryAllCustomer(customerVo);
		return  new DataGridView(page.getTotal(),data);
	}

	@Override
	public void addCustomer(CustomerVo customerVo) {
		this.customerMapper.insert(customerVo);

	}

	@Override
	public void updateCustomer(CustomerVo customerVo) {
		this.customerMapper.updateByPrimaryKeySelective(customerVo);

	}

	@Override
	public void deleteCustomer(Integer cust_id) {
		this.customerMapper.deleteByPrimaryKey(cust_id);

	}

	@Override
	public void deleteBatchCustomer(Integer[] cust_ids) {
		for(Integer cust_id:cust_ids){
			this.deleteCustomer(cust_id);
		}

	}

	@Override
	public Customer queryCustomerBycust_id(Integer cust_id) {
		
		return this.customerMapper.selectByPrimaryKey(cust_id);
	}

	@Override
	public List<Customer> queryAllCustomerForList(CustomerVo customerVo) {
		return this.customerMapper.queryAllCustomer(customerVo);
	}

}
