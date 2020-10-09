package com.ssmpro.flight.domain;

import java.text.DecimalFormat;

public class AnnalysisBean extends FlightsPlus{
    private Integer arrDelay;
    private Integer depDelay;
    private String delayRate;
    private Integer delayCounts;
    private Integer allCounts;
    private Integer aveArrDelay;

    public void setDelayRate(String delayRate) {
        this.delayRate = delayRate;
    }

    public Integer getAveArrDelay() {
        return aveArrDelay;
    }

    public void setAveArrDelay() {
        this.aveArrDelay = this.arrDelay/this.allCounts;
    }

    public Integer getDelayCounts() {
        return delayCounts;
    }

    public void setDelayCounts(Integer delayCounts) {
        this.delayCounts = delayCounts;
    }

    public Integer getAllCounts() {
        return allCounts;
    }

    public void setAllCounts(Integer allCounts) {
        this.allCounts = allCounts;
    }

    public Integer getArrDelay() {
        return arrDelay;
    }

    public void setArrDelay(Integer arrDelay) {
        this.arrDelay = arrDelay;
    }

    public Integer getDepDelay() {
        return depDelay;
    }

    public void setDepDelay(Integer depDelay) {
        this.depDelay = depDelay;
    }

    public String getDelayRate() {
        return delayRate;
    }

    public void setDelayRate() {
        DecimalFormat df = new DecimalFormat("0.00");
        this.delayRate = df.format(100*(float)this.delayCounts/(float)this.allCounts)+"%";
    }

    @Override
    public String toString() {
        return "AnnalysisBean{" +
                "arrDelay=" + arrDelay +
                ", depDelay=" + depDelay +
                ", delayRate='" + delayRate + '\'' +
                ", delayCounts=" + delayCounts +
                ", allCounts=" + allCounts +
                ", date='" + date + '\'' +
                ", flightnumber='" + flightnumber + '\'' +
                ", originairport='" + originairport + '\'' +
                ", destairport='" + destairport + '\'' +
                ", aircrafttype='" + aircrafttype + '\'' +
                ", crsarrTime='" + crsarrTime + '\'' +
                ", crsdepTime='" + crsdepTime + '\'' +
                ", tailnumber='" + tailnumber + '\'' +
                ", grade='" + grade + '\'' +
                ", height='" + height + '\'' +
                ", tasktype='" + tasktype + '\'' +
                ", speed='" + speed + '\'' +
                ", status='" + status + '\'' +
                ", date_start='" + date_start + '\'' +
                ", date_end='" + date_end + '\'' +
                '}';
    }
}
