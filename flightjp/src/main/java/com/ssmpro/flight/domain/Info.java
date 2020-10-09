package com.ssmpro.flight.domain;

import java.io.Serializable;

/**
 * @author jup
 * @create 2020/4/13-22:04
 */
public class Info implements Serializable {
    private String season;
    private String airport;
    private String optimization;
    private String flightData;

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

    public String getOptimization() {
        return optimization;
    }

    public void setOptimization(String optimization) {
        this.optimization = optimization;
    }

    public String getFlightData() {
        return flightData;
    }

    public void setFlightData(String flightData) {
        this.flightData = flightData;
    }

    @Override
    public String toString() {
        return "Info{" +
                "season='" + season + '\'' +
                ", airport='" + airport + '\'' +
                ", optimization='" + optimization + '\'' +
                ", flightData='" + flightData + '\'' +
                '}';
    }
}
