package com.ssmpro.flight.service.impl;

import com.ssmpro.flight.dao.Rdao;
import com.ssmpro.flight.domain.Hflight;
import com.ssmpro.flight.service.Rservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RserviceImpl implements Rservice {
    @Autowired
    private Rdao Rdao;

    @Override
    public List<Hflight> findHflight(Hflight flight) {
        System.out.println("findService2执行了");
        return Rdao.findHflight(flight);
    }
}