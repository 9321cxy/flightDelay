package com.ssmpro.flight.domain;

import java.io.Serializable;

public class Oflight implements Serializable {

    private String flight_number;//航班号
    private String dep_time;//起飞时间
    private String origin_airport;//起飞机场
    private String arr_time;//到达时间
    private String dest_airport;//到达机场
    private String grade;//等级
    private String height;//高度
    private String aircraft_type;//机型
    private String task_type;//任务类型
    private String speed;//速度
    private Integer estimate_delay_level;//延误等级

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public String getDep_time() {
        return dep_time;
    }

    public void setDep_time(String dep_time) {
        this.dep_time = dep_time;
    }

    public String getOrigin_airport() {
        return origin_airport;
    }

    public void setOrigin_airport(String origin_airport) {
        this.origin_airport = origin_airport;
    }

    public String getArr_time() {
        return arr_time;
    }

    public void setArr_time(String arr_time) {
        this.arr_time = arr_time;
    }

    public String getDest_airport() {
        return dest_airport;
    }

    public void setDest_airport(String dest_airport) {
        this.dest_airport = dest_airport;
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

    public String getAircraft_type() {
        return aircraft_type;
    }

    public void setAircraft_type(String aircraft_type) {
        this.aircraft_type = aircraft_type;
    }

    public String getTask_type() {
        return task_type;
    }

    public void setTask_type(String task_type) {
        this.task_type = task_type;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public Integer getEstimate_delay_level() {
        return estimate_delay_level;
    }

    public void setEstimate_delay_level(Integer estimate_delay_level) {
        this.estimate_delay_level = estimate_delay_level;
    }

    @Override
    public String toString() {
        return "Oflight{" +
                "flight_number='" + flight_number + '\'' +
                ", dep_time='" + dep_time + '\'' +
                ", origin_airport='" + origin_airport + '\'' +
                ", arr_time='" + arr_time + '\'' +
                ", dest_airport='" + dest_airport + '\'' +
                ", grade='" + grade + '\'' +
                ", height='" + height + '\'' +
                ", aircraft_type='" + aircraft_type + '\'' +
                ", task_type='" + task_type + '\'' +
                ", speed='" + speed + '\'' +
                ", estimate_delay_level=" + estimate_delay_level +
                '}';
    }
}
