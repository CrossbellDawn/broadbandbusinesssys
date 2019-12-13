package edu.jwj439.stats.controller;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.jwj439.bus.entity.Customer;
import edu.jwj439.bus.entity.Order;
import edu.jwj439.bus.service.ICustomerService;
import edu.jwj439.bus.service.IOrderService;
import edu.jwj439.bus.vo.CustomerVo;
import edu.jwj439.stats.entity.BaseEntity;
import edu.jwj439.stats.service.IStatsService;
import edu.jwj439.stats.utils.ExprotCustomerUtil;
import edu.jwj439.stats.utils.ExprotOrderUtil;

@RequestMapping("stats")
@Controller
public class StatsController {

	@Autowired
	private IStatsService statsService;

	@Autowired
	private ICustomerService customerService;

	@Autowired
	private IOrderService orderService;
	
	
    /**
     * 跳转到业务员年度业务统计
     * @return
     */
    @RequestMapping("toOperatorYearGradeStat")
    public String toOperatorYearGradeStat(){
        return "stats/operatorYearGradeStat";
    }

	/**
	 * 跳转到公司年度业务统计
	 * 
	 * @return
	 */
	@RequestMapping("toCompanyYearGradeStat")
	public String toCompanyYearGradeStat() {
		return "stats/companyYearGradeStat";
	}


	/**
	 * 加载公司年度业务统计数据
	 * 
	 * @return
	 */
	@RequestMapping("loadCompanyYearGradeStatJson")
	@ResponseBody
	public List<Double> loadCompanyYearGradeStatJson(String year) {
		List<Double> entities = this.statsService.loadCompanyYearGradeStatList(year);
		for (int i = 0; i < entities.size(); i++) {
			if (null == entities.get(i)) {
				entities.set(i, 0.0);
			}
		}
		return entities;
	}

	/**
	 * 导出客户数据
	 */
	@RequestMapping("exportCustomer")
	public ResponseEntity<Object> exportCustomer(CustomerVo customerVo, HttpServletResponse response) {
		List<Customer> customers = customerService.queryAllCustomerForList(customerVo);
		String fileName = "客户数据.xls";
		String sheetName = "客户数据";
		ByteArrayOutputStream bos = ExprotCustomerUtil.exportCustomer(customers, sheetName);

		try {
			fileName = URLEncoder.encode(fileName, "UTF-8");// 处理文件名乱码
			// 创建封装响应头信息的对象
			HttpHeaders header = new HttpHeaders();
			// 封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
			header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			// 设置下载的文件的名称
			header.setContentDispositionFormData("attachment", fileName);
			return new ResponseEntity<Object>(bos.toByteArray(), header, HttpStatus.CREATED);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导出宽带业务订单数据
	 */
	@RequestMapping("exportOrder")
	public ResponseEntity<Object> exportOrder(Integer orderId) {
		// 根据订单号查询订单信息
		Order order = orderService.queryOrderByorder_id(orderId);
		System.out.println(orderId);

		String fileName = order.getOrderCustName() + "的宽带业务订单.xls";
		String sheetName = order.getOrderCustName() + "宽带业务订单";
		ByteArrayOutputStream bos = ExprotOrderUtil.exportOrder(order, sheetName);

		try {
			fileName = URLEncoder.encode(fileName, "UTF-8");// 处理文件名乱码
			// 创建封装响应头信息的对象
			HttpHeaders header = new HttpHeaders();
			// 封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
			header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			// 设置下载的文件的名称
			header.setContentDispositionFormData("attachment", fileName);
			return new ResponseEntity<Object>(bos.toByteArray(), header, HttpStatus.CREATED);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 加载业务员年度业务统计数据
	 * 
	 * @return
	 */
	@RequestMapping("loadOperatorYearGradeStatJson")
	@ResponseBody
	public Map<String, Object> loadOperatorYearGradeStatJson(String year) {
		List<BaseEntity> entities = this.statsService.loadOpernameYearGradeStatList(year);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> names = new ArrayList<String>();
		List<Double> values = new ArrayList<Double>();
		for (BaseEntity baseEntity : entities) {
			names.add(baseEntity.getName());
			values.add(baseEntity.getValue());
		}
		map.put("name", names);
		map.put("value", values);
		return map;
	}

}
