package com.ssmpro.flight.domain;

import java.io.Serializable;

/**
 * @author jup
 * @create 2020/4/13-22:05
 */
public class Title implements Serializable {
    private String season;
    private String airport;

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
        return "Title{" +
                "season='" + season + '\'' +
                ", airport='" + airport + '\'' +
                '}';
    }
}
