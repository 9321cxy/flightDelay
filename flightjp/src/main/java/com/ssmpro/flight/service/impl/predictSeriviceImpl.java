package com.ssmpro.flight.service.impl;

import com.ssmpro.flight.dao.PredictDao;
import com.ssmpro.flight.domain.predictClass;
import com.ssmpro.flight.service.predictSerivice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class predictSeriviceImpl implements predictSerivice {
    @Autowired
    private PredictDao predictDao;
    @Override
    public void insertPredict(predictClass predictClass) {
        predictDao.insertPredict(predictClass);
    }

    @Override
    public List<predictClass> getPredictAll() {
        return predictDao.getPredictAll();
    }
}
