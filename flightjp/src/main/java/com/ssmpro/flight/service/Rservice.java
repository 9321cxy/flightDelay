package com.ssmpro.flight.service;

import com.ssmpro.flight.domain.Hflight;

import java.util.List;

public interface Rservice {
    //    查找航班
    public List<Hflight> findHflight(Hflight flight);
}

