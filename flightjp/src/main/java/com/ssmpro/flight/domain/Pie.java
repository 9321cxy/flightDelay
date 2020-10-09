package com.ssmpro.flight.domain;

import java.io.Serializable;

public class Pie implements Serializable {

    private Integer no_delay;
    private Integer light_delay;
    private Integer moderate_delay;
    private Integer serious_delay;
    private Integer severe_delay;

    public Integer getNo_delay() {
        return no_delay;
    }

    public void setNo_delay(Integer no_delay) {
        this.no_delay = no_delay;
    }

    public Integer getLight_delay() {
        return light_delay;
    }

    public void setLight_delay(Integer light_delay) {
        this.light_delay = light_delay;
    }

    public Integer getModerate_delay() {
        return moderate_delay;
    }

    public void setModerate_delay(Integer moderate_delay) {
        this.moderate_delay = moderate_delay;
    }

    public Integer getSerious_delay() {
        return serious_delay;
    }

    public void setSerious_delay(Integer serious_delay) {
        this.serious_delay = serious_delay;
    }

    public Integer getSevere_delay() {
        return severe_delay;
    }

    public void setSevere_delay(Integer severe_delay) {
        this.severe_delay = severe_delay;
    }

    @Override
    public String toString() {
        return "Pie{" +
                "no_delay=" + no_delay +
                ", light_delay=" + light_delay +
                ", moderate_delay=" + moderate_delay +
                ", serious_delay=" + serious_delay +
                ", severe_delay=" + severe_delay +
                '}';
    }
}
