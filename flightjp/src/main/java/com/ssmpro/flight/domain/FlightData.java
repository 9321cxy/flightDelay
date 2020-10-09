package com.ssmpro.flight.domain;

import java.io.Serializable;

/**
 * @author jup
 * @create 2020/5/18-20:46
 */
public class FlightData implements Serializable {

    private String flight_number;
    private String dep_time;
    private String origin_airport;

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

    @Override
    public String toString() {
        return "FlightData{" +
                "flight_number='" + flight_number + '\'' +
                ", dep_time='" + dep_time + '\'' +
                ", origin_airport='" + origin_airport + '\'' +
                '}';
    }
}
