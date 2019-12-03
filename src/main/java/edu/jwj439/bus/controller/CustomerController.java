package edu.jwj439.bus.controller;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import edu.jwj439.bus.service.ICustomerService;
import edu.jwj439.bus.vo.CustomerVo;
import edu.jwj439.sys.entity.User;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.utils.ResultObj;
import edu.jwj439.sys.utils.WebUtils;

@RestController // 以json形式响应数据
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private ICustomerService customerService;

    /**
     * 加载客户端列表返回DataGridView
     * 
     * @param customerVo
     * @return
     */
    @RequestMapping("loadAllCustomer")
    public DataGridView loadAllCustomer(CustomerVo customerVo) {
        System.out.println(this.customerService.queryAllCustomer(customerVo));
        return this.customerService.queryAllCustomer(customerVo);
    }

    /**
     * 添加一个客户
     * 
     * @param customerVo
     * @return
     */
    @RequestMapping("addCustomer")
    public ResultObj addCustomer(CustomerVo customerVo) {
        try {
            customerVo.setCustCreatetime(new Date());
            User user=(User)WebUtils.getHttpSession().getAttribute("user");
            customerVo.setCustCreateId(user.getUserid());
            this.customerService.addCustomer(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改客户
     * 
     * @param customerVo
     * @return
     */
    @RequestMapping("updateCustomer")
    public ResultObj updateCustomer(CustomerVo customerVo) {
        try {

            this.customerService.updateCustomer(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个客户
     * 
     * @param customerVo
     * @return
     */
    @RequestMapping("deleteCustomer")
    public ResultObj deleteCustomer(CustomerVo customerVo) {
        try {
            this.customerService.deleteCustomer(customerVo.getCustId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除客户
     * 
     * @param customerVo
     * @return
     */
    @RequestMapping("deleteBatchCustomer")
    public ResultObj deleteBatchCustomer(CustomerVo customerVo) {
        try {
            this.customerService.deleteBatchCustomer(customerVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
