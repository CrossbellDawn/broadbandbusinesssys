package edu.jwj439.bus.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Customer {
    private Integer custId;

    private String custName;

    private Integer custUserId;

    private Integer custCreateId;

    private String custSource;

    private String custMajor;

    private Integer custLevel;

    private String custLinkman;

    private String custPhone;

    private String custMobile;

    private String custZipcode;

    private String custAddress;
    
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date custCreatetime;

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId ;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName == null ? null : custName.trim();
    }

    public Integer getCustUserId() {
        return custUserId;
    }

    public void setCustUserId(Integer custUserId) {
        this.custUserId = custUserId;
    }

    public Integer getCustCreateId() {
        return custCreateId;
    }

    public void setCustCreateId(Integer custCreateId) {
        this.custCreateId = custCreateId;
    }

    public String getCustSource() {
        return custSource;
    }

    public void setCustSource(String custSource) {
        this.custSource = custSource == null ? null : custSource.trim();
    }

    public String getCustMajor() {
        return custMajor;
    }

    public void setCustMajor(String custMajor) {
        this.custMajor = custMajor == null ? null : custMajor.trim();
    }

    public Integer getCustLevel() {
        return custLevel;
    }

    public void setCustLevel(Integer custLevel) {
        this.custLevel = custLevel;
    }

    public String getCustLinkman() {
        return custLinkman;
    }

    public void setCustLinkman(String custLinkman) {
        this.custLinkman = custLinkman == null ? null : custLinkman.trim();
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone == null ? null : custPhone.trim();
    }

    public String getCustMobile() {
        return custMobile;
    }

    public void setCustMobile(String custMobile) {
        this.custMobile = custMobile == null ? null : custMobile.trim();
    }

    public String getCustZipcode() {
        return custZipcode;
    }

    public void setCustZipcode(String custZipcode) {
        this.custZipcode = custZipcode == null ? null : custZipcode.trim();
    }

    public String getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress == null ? null : custAddress.trim();
    }

    public Date getCustCreatetime() {
        return custCreatetime;
    }
    
    public void setCustCreatetime(Date custCreatetime) {
        this.custCreatetime = custCreatetime;
    }
}
