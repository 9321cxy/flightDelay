package com.ssmpro.flight.service;

import com.ssmpro.flight.domain.predictClass;

import java.util.List;

public interface predictSerivice {
//    插入数据到数据库
    public void insertPredict(predictClass predictClass);
//    从数据库获取数据
    public List<predictClass> getPredictAll();
}
