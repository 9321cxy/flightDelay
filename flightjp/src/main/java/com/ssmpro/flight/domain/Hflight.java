package com.ssmpro.flight.domain;

import java.io.Serializable;

public class Hflight implements Serializable{
    private String flight_season;//航季
    private String flight_number;//航班号
    private String origin_airport;//起飞机场
    private String dep_time;//起飞时间
    private String dest_airport;//到达机场
    private String arr_time;//到达时间
    private String grade;//等级
    private String height;//高度
    private String aircraft_type;//机型
    private String task_type;//任务类型
    private String speed;//速度
    private String fly_number;//飞行次数
    private String delay_number;//延误次数
    private String average_delay;//平均延误时间
    private String delay_level;//延误等级
    private String season;//所选航季信息
    private String airport;//所选机场信息

    public String getFlight_season() {
        return flight_season;
    }

    public void setFlight_season(String flight_season) {
        this.flight_season = flight_season;
    }

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public String getOrigin_airport() {
        return origin_airport;
    }

    public void setOrigin_airport(String origin_airport) {
        this.origin_airport = origin_airport;
    }

    public String getDep_time() {
        return dep_time;
    }

    public void setDep_time(String dep_time) {
        this.dep_time = dep_time;
    }

    public String getDest_airport() {
        return dest_airport;
    }

    public void setDest_airport(String dest_airport) {
        this.dest_airport = dest_airport;
    }

    public String getArr_time() {
        return arr_time;
    }

    public void setArr_time(String arr_time) {
        this.arr_time = arr_time;
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

    public String getFly_number() {
        return fly_number;
    }

    public void setFly_number(String fly_number) {
        this.fly_number = fly_number;
    }

    public String getDelay_number() {
        return delay_number;
    }

    public void setDelay_number(String delay_number) {
        this.delay_number = delay_number;
    }

    public String getAverage_delay() {
        return average_delay;
    }

    public void setAverage_delay(String average_delay) {
        this.average_delay = average_delay;
    }

    public String getDelay_level() {
        return delay_level;
    }

    public void setDelay_level(String delay_level) {
        this.delay_level = delay_level;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    @Override
    public String toString() {
        return "Hflight{" +
                "flight_season='" + flight_season + '\'' +
                ", flight_number='" + flight_number + '\'' +
                ", origin_airport='" + origin_airport + '\'' +
                ", dep_time='" + dep_time + '\'' +
                ", dest_airport='" + dest_airport + '\'' +
                ", arr_time='" + arr_time + '\'' +
                ", grade='" + grade + '\'' +
                ", height='" + height + '\'' +
                ", aircraft_type='" + aircraft_type + '\'' +
                ", task_type='" + task_type + '\'' +
                ", speed='" + speed + '\'' +
                ", fly_number='" + fly_number + '\'' +
                ", delay_number='" + delay_number + '\'' +
                ", average_delay='" + average_delay + '\'' +
                ", delay_level='" + delay_level + '\'' +
                ", season='" + season + '\'' +
                ", airport='" + airport + '\'' +
                '}';
    }
}
