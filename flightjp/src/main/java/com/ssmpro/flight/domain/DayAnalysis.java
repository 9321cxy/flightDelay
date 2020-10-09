package com.ssmpro.flight.domain;

import java.util.List;

public class DayAnalysis {
    private String date;
    private String airport;
    private Integer time;
    private String depCount;
    private String depDelay;
    private String depDelayRate;
    private String depDelayTime;
    private String arrCount;
    private String arrDelay;
    private String arrDelayRate;
    private String arrDelayTime;
    private String allCount;
    private String delayCount;
    private String delayRate;
    private String delayTime;
    private List<String> maxTime;
    private String maxDelay;
    private Integer grade0Count;
    private Integer grade1Count;
    private Integer grade2Count;
    private Integer grade3Count;
    private Integer grade4Count;
    private Integer arrGrade0Count;
    private Integer arrGrade1Count;
    private Integer arrGrade2Count;
    private Integer arrGrade3Count;
    private Integer arrGrade4Count;


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getDepCount() {
        return depCount;
    }

    public void setDepCount(String depCount) {
        this.depCount = depCount;
    }

    public String getDepDelay() {
        return depDelay;
    }

    public void setDepDelay(String depDelay) {
        this.depDelay = depDelay;
    }

    public String getDepDelayRate() {
        return depDelayRate;
    }

    public void setDepDelayRate(String depDelayRate) {
        this.depDelayRate = depDelayRate;
    }

    public String getDepDelayTime() {
        return depDelayTime;
    }

    public void setDepDelayTime(String depDelayTime) {
        this.depDelayTime = depDelayTime;
    }

    public String getArrCount() {
        return arrCount;
    }

    public void setArrCount(String arrCount) {
        this.arrCount = arrCount;
    }

    public String getArrDelay() {
        return arrDelay;
    }

    public void setArrDelay(String arrDelay) {
        this.arrDelay = arrDelay;
    }

    public String getArrDelayRate() {
        return arrDelayRate;
    }

    public void setArrDelayRate(String arrDelayRate) {
        this.arrDelayRate = arrDelayRate;
    }

    public String getArrDelayTime() {
        return arrDelayTime;
    }

    public void setArrDelayTime(String arrDelayTime) {
        this.arrDelayTime = arrDelayTime;
    }

    public String getAllCount() {
        return allCount;
    }

    public void setAllCount(String allCount) {
        this.allCount = allCount;
    }

    public String getDelayCount() {
        return delayCount;
    }

    public void setDelayCount(String delayCount) {
        this.delayCount = delayCount;
    }

    public String getDelayRate() {
        return delayRate;
    }

    public void setDelayRate(String delayRate) {
        this.delayRate = delayRate;
    }

    public String getDelayTime() {
        return delayTime;
    }

    public void setDelayTime(String delayTime) {
        this.delayTime = delayTime;
    }

    public List<String> getMaxTime() {
        return maxTime;
    }

    public void setMaxTime(List<String> maxTime) {
        this.maxTime = maxTime;
    }

    public String getMaxDelay() {
        return maxDelay;
    }

    public void setMaxDelay(String maxDelay) {
        this.maxDelay = maxDelay;
    }

    public Integer getGrade0Count() {
        return grade0Count;
    }

    public void setGrade0Count(Integer grade0Count) {
        this.grade0Count = grade0Count;
    }

    public Integer getGrade1Count() {
        return grade1Count;
    }

    public void setGrade1Count(Integer grade1Count) {
        this.grade1Count = grade1Count;
    }

    public Integer getGrade2Count() {
        return grade2Count;
    }

    public void setGrade2Count(Integer grade2Count) {
        this.grade2Count = grade2Count;
    }

    public Integer getGrade3Count() {
        return grade3Count;
    }

    public void setGrade3Count(Integer grade3Count) {
        this.grade3Count = grade3Count;
    }

    public Integer getGrade4Count() {
        return grade4Count;
    }

    public void setGrade4Count(Integer grade4Count) {
        this.grade4Count = grade4Count;
    }

    public Integer getArrGrade0Count() {
        return arrGrade0Count;
    }

    public void setArrGrade0Count(Integer arrGrade0Count) {
        this.arrGrade0Count = arrGrade0Count;
    }

    public Integer getArrGrade1Count() {
        return arrGrade1Count;
    }

    public void setArrGrade1Count(Integer arrGrade1Count) {
        this.arrGrade1Count = arrGrade1Count;
    }

    public Integer getArrGrade2Count() {
        return arrGrade2Count;
    }

    public void setArrGrade2Count(Integer arrGrade2Count) {
        this.arrGrade2Count = arrGrade2Count;
    }

    public Integer getArrGrade3Count() {
        return arrGrade3Count;
    }

    public void setArrGrade3Count(Integer arrGrade3Count) {
        this.arrGrade3Count = arrGrade3Count;
    }

    public Integer getArrGrade4Count() {
        return arrGrade4Count;
    }

    public void setArrGrade4Count(Integer arrGrade4Count) {
        this.arrGrade4Count = arrGrade4Count;
    }

    @Override
    public String toString() {
        return "DayAnalysis{" +
                "date='" + date + '\'' +
                ", airport='" + airport + '\'' +
                ", time=" + time +
                ", depCount='" + depCount + '\'' +
                ", depDelay='" + depDelay + '\'' +
                ", depDelayRate='" + depDelayRate + '\'' +
                ", depDelayTime='" + depDelayTime + '\'' +
                ", arrCount='" + arrCount + '\'' +
                ", arrDelay='" + arrDelay + '\'' +
                ", arrDelayRate='" + arrDelayRate + '\'' +
                ", arrDelayTime='" + arrDelayTime + '\'' +
                ", allCount='" + allCount + '\'' +
                ", delayCount='" + delayCount + '\'' +
                ", delayRate='" + delayRate + '\'' +
                ", delayTime='" + delayTime + '\'' +
                ", maxTime=" + maxTime +
                ", maxDelay='" + maxDelay + '\'' +
                ", grade0Count=" + grade0Count +
                ", grade1Count=" + grade1Count +
                ", grade2Count=" + grade2Count +
                ", grade3Count=" + grade3Count +
                ", grade4Count=" + grade4Count +
                ", arrGrade0Count=" + arrGrade0Count +
                ", arrGrade1Count=" + arrGrade1Count +
                ", arrGrade2Count=" + arrGrade2Count +
                ", arrGrade3Count=" + arrGrade3Count +
                ", arrGrade4Count=" + arrGrade4Count +
                '}';
    }
}
