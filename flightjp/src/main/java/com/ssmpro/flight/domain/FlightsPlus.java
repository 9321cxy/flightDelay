package com.ssmpro.flight.domain;

import java.io.Serializable;

public class FlightsPlus implements Serializable {
    public String date;
    public String flightnumber;
    public String originairport;
    public String destairport;
    public String aircrafttype;
    public String crsarrTime;
    public String crsdepTime;
    public String tailnumber;
    public String grade;
    public String height;
    public String tasktype;
    public String speed;
    public String status;
    public String date_start;
    public String date_end;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFlightnumber() {
        return flightnumber;
    }

    public void setFlightnumber(String flightnumber) {
        this.flightnumber = flightnumber;
    }

    public String getOriginairport() {
        return originairport;
    }

    public void setOriginairport(String originairport) {
        this.originairport = originairport;
    }

    public String getDestairport() {
        return destairport;
    }

    public void setDestairport(String destairport) {
        this.destairport = destairport;
    }

    public String getAircrafttype() {
        return aircrafttype;
    }

    public void setAircrafttype(String aircrafttype) {
        this.aircrafttype = aircrafttype;
    }

    public String getCrsarrTime() {
        return crsarrTime;
    }

    public void setCrsarrTime(String crsarrTime) {
        this.crsarrTime = crsarrTime;
    }

    public String getCrsdepTime() {
        return crsdepTime;
    }

    public void setCrsdepTime(String crsdepTime) {
        this.crsdepTime = crsdepTime;
    }

    public String getTailnumber() {
        return tailnumber;
    }

    public void setTailnumber(String tailnumber) {
        this.tailnumber = tailnumber;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getTasktype() {
        return tasktype;
    }

    public void setTasktype(String tasktype) {
        this.tasktype = tasktype;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate_start() {
        return date_start;
    }

    public void setDate_start(String date_start) {
        this.date_start = date_start;
    }

    public String getDate_end() {
        return date_end;
    }

    public void setDate_end(String date_end) {
        this.date_end = date_end;
    }

    @Override
    public String toString() {
        return "FlightsPlus{" +
                "date='" + date + '\'' +
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
