package edu.jwj439.bus.vo;

import edu.jwj439.bus.entity.Order;

public class OrderVo extends Order{
    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;
    
    //订单状态
    private Integer orderFlag;

    public Integer getOrderFlag() {
        return orderFlag;
    }

    public void setOrderFlag(Integer orderFlag) {
        this.orderFlag = orderFlag;
    }

    //接受多个id
    private Integer [] ids;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }
}
