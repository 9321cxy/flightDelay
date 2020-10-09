package com.ssmpro.flight.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ssmpro.flight.dao.CrudDao;
import com.ssmpro.flight.domain.AnnalysisBean;
import com.ssmpro.flight.domain.DayAnalysis;
import com.ssmpro.flight.domain.FlightsPlus;
import com.ssmpro.flight.domain.Page;
import com.ssmpro.flight.service.CrudService;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("dayAnalysis")
public class dayAnalysisController {
    @Autowired
    private CrudDao crudDao;
    @Autowired
    private CrudService crudService;

    //    获取日起飞延误统计
    @RequestMapping("/analysisData")
    @ResponseBody
    public JSONArray analysisData(String param) {
        JSONArray array = new JSONArray();
        DayAnalysis dayAnalysis = new DayAnalysis();
        dayAnalysis.setDate(param);
        String[] airports = new String[]{"ZBAA", "ZBAD", "ZBTJ", "ZBSJ"};
//        获取各机场某天起飞延误
        for (String air : airports) {
            dayAnalysis.setAirport(air);
            DayAnalysis getdayAnalysis = crudDao.getDayAnalysis(dayAnalysis);
//            获取延误严重的时段
            List<String> dayAnalysisTime = crudDao.getDayAnalysisTime(dayAnalysis);
            List<String> dayAnalysisTimeScope = new ArrayList<String>();
            for (String analysisTime : dayAnalysisTime) {
                analysisTime = analysisTime + "-" + (Integer.parseInt(analysisTime) + 1);
                dayAnalysisTimeScope.add(analysisTime);
            }
            getdayAnalysis.setMaxTime(dayAnalysisTimeScope);
            array.add(getdayAnalysis);
        }
//        获取各机场各时段延误信息
        for (String air : airports) {
            dayAnalysis.setAirport(air);
            List<DayAnalysis> dayAnalysisTimeList = crudDao.getDayAnalysisTimeList(dayAnalysis);
            array.add(dayAnalysisTimeList);
        }
        System.out.println(array);
        return array;
    }

    //    获取日降落延误统计
    @RequestMapping("/analysisArrData")
    @ResponseBody
    public JSONArray analysisArrData(String param) {
        JSONArray array = new JSONArray();
        DayAnalysis dayAnalysis = new DayAnalysis();
        dayAnalysis.setDate(param);
        String[] airports = new String[]{"ZBAA", "ZBAD", "ZBTJ", "ZBSJ"};
//        获取各机场某天起飞延误
        for (String air : airports) {
            dayAnalysis.setAirport(air);
            DayAnalysis getdayAnalysis = crudDao.getArrDayAnalysis(dayAnalysis);
//            获取延误严重的时段
            List<String> dayAnalysisTime = crudDao.getArrDayAnalysisTime(dayAnalysis);
            List<String> dayAnalysisTimeScope = new ArrayList<String>();
            for (String analysisTime : dayAnalysisTime) {
                analysisTime = analysisTime + "-" + (Integer.parseInt(analysisTime) + 1);
                dayAnalysisTimeScope.add(analysisTime);
            }
            getdayAnalysis.setMaxTime(dayAnalysisTimeScope);
            array.add(getdayAnalysis);
        }
//        获取各机场各时段延误信息
        for (String air : airports) {
            dayAnalysis.setAirport(air);
            List<DayAnalysis> dayAnalysisTimeList = crudDao.getArrDayAnalysisTimeList(dayAnalysis);
            array.add(dayAnalysisTimeList);
        }
        System.out.println(array);
        return array;
    }

    //    获取起飞航班数据
    @ResponseBody
    @RequestMapping("/findFlightByEs")
    public JSONArray findFlightByEs(String date) throws IOException {
        AnnalysisBean annalysisBean = new AnnalysisBean();
        JSONArray array = new JSONArray();
        String[] airArray = new String[]{"ZBAA", "ZBAD", "ZBSJ", "ZBTJ"};
        for (String air : airArray) {
            annalysisBean.setOriginairport(air);
            annalysisBean.setDate_start(date);
            annalysisBean.setDate_end(date);
            annalysisBean.setFlightnumber("");
            SearchResponse search = crudService.findEs(annalysisBean);
            for (SearchHit hit : search.getHits().getHits()) {
                AnnalysisBean annalysisBean1 = JSON.parseObject(hit.getSourceAsString(), AnnalysisBean.class);
                if (annalysisBean1.getDepDelay() != null && annalysisBean1.getDepDelay() >= 15) {
                    array.add(annalysisBean1);
                }
            }
        }

        System.out.println(array.size());
        return array;
    }

    //    获取起飞航班数据
    @ResponseBody
    @RequestMapping("/findArrFlightByEs")
    public JSONArray findArrFlightByEs(String date) throws IOException {
        AnnalysisBean annalysisBean = new AnnalysisBean();
        JSONArray array = new JSONArray();
        String[] airArray = new String[]{"ZBAA", "ZBAD", "ZBSJ", "ZBTJ"};
        for (String air : airArray) {
            annalysisBean.setDestairport(air);
            annalysisBean.setOriginairport("");
            annalysisBean.setDate_start(date);
            annalysisBean.setDate_end(date);
            annalysisBean.setFlightnumber("");
            SearchResponse search = crudService.findEs(annalysisBean);
            for (SearchHit hit : search.getHits().getHits()) {
                AnnalysisBean annalysisBean1 = JSON.parseObject(hit.getSourceAsString(), AnnalysisBean.class);
                if (annalysisBean1.getArrDelay() != null && annalysisBean1.getArrDelay() >= 15) {
                    array.add(annalysisBean1);
                }
            }
        }

        System.out.println(array.size());
        return array;
    }
}
