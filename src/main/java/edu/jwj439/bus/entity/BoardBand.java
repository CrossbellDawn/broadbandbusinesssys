package edu.jwj439.bus.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardBand {
    private Integer bandId;

    private String bandWidth;

    private String bandSpeed;

    private Double bandMouthly;

    private Double bandYearly;

    private String bandDesc;

    private Integer bandState;
    @JsonFormat(pattern="yy-MM-dd HH:mm:ss" ,timezone="GMT+8")
    private Date bandCreatetime;

    public Integer getBandId() {
        return bandId;
    }

    public void setBandId(Integer bandId) {
        this.bandId = bandId;
    }

    public String getBandWidth() {
        return bandWidth;
    }

    public void setBandWidth(String bandWidth) {
        this.bandWidth = bandWidth == null ? null : bandWidth.trim();
    }

    public String getBandSpeed() {
        return bandSpeed;
    }

    public void setBandSpeed(String bandSpeed) {
        this.bandSpeed = bandSpeed == null ? null : bandSpeed.trim();
    }

    public Double getBandMouthly() {
        return bandMouthly;
    }

    public void setBandMouthly(Double bandMouthly) {
        this.bandMouthly = bandMouthly;
    }

    public Double getBandYearly() {
        return bandYearly;
    }

    public void setBandYearly(Double bandYearly) {
        this.bandYearly = bandYearly;
    }

    public String getBandDesc() {
        return bandDesc;
    }

    public void setBandDesc(String bandDesc) {
        this.bandDesc = bandDesc == null ? null : bandDesc.trim();
    }

    public Integer getBandState() {
        return bandState;
    }

    public void setBandState(Integer bandState) {
        this.bandState = bandState;
    }

    public Date getBandCreatetime() {
        return bandCreatetime;
    }

    public void setBandCreatetime(Date bandCreatetime) {
        this.bandCreatetime = bandCreatetime;
    }
}