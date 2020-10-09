package com.ssmpro.flight.domain;

public class predictClass extends FlightsPlus {
    public String predictClass = "";

    public String getPredictClass() {
        return predictClass;
    }

    public void setPredictClass(String predictClass) {
        this.predictClass = predictClass;
    }

    @Override
    public String toString() {
        return "predictClass{" +
                "predictClass='" + predictClass + '\'' +
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
