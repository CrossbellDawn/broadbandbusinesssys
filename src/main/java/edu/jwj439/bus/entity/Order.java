package edu.jwj439.bus.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Order {
    private Integer orderId;

    private String orderNumber;

    private String orderCustName;

    private String orderOperator;

    private Integer orderFeetype;

    private Double orderPay;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" , timezone="GMT+8")
    private Date orderStarttime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" , timezone="GMT+8")
    private Date orderEndtime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" , timezone="GMT+8")
    private Date orderCreatetime;
    
    private Integer orderState;

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public String getOrderCustName() {
        return orderCustName;
    }

    public void setOrderCustName(String orderCustName) {
        this.orderCustName = orderCustName == null ? null : orderCustName.trim();
    }

    public String getOrderOperator() {
        return orderOperator;
    }

    public void setOrderOperator(String orderOperator) {
        this.orderOperator = orderOperator == null ? null : orderOperator.trim();
    }

    public Integer getOrderFeetype() {
        return orderFeetype;
    }

    public void setOrderFeetype(Integer orderFeetype) {
        this.orderFeetype = orderFeetype;
    }

    public Double getOrderPay() {
        return orderPay;
    }

    public void setOrderPay(Double orderPay) {
        this.orderPay = orderPay;
    }

    public Date getOrderStarttime() {
        return orderStarttime;
    }

    public void setOrderStarttime(Date orderStarttime) {
        this.orderStarttime = orderStarttime;
    }

    public Date getOrderEndtime() {
        return orderEndtime;
    }

    public void setOrderEndtime(Date orderEndtime) {
        this.orderEndtime = orderEndtime;
    }

    public Date getOrderCreatetime() {
        return orderCreatetime;
    }

    public void setOrderCreatetime(Date orderCreatetime) {
        this.orderCreatetime = orderCreatetime;
    }
}