package com.ssmpro.flight.service;

import com.ssmpro.flight.domain.AnnalysisBean;
import com.ssmpro.flight.domain.FlightsPlus;
import com.ssmpro.flight.domain.Page;
import org.elasticsearch.action.search.SearchResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface CrudService {
//    增加航班
    public void saveFlight(FlightsPlus flight);
//    修改航班
    public void updateFlight(FlightsPlus flight);
//    删除航班
    public void delFlight(FlightsPlus flight);

    public List<FlightsPlus> findAll();
//    查找航班
    public List<FlightsPlus> findFlight(FlightsPlus flight, Page page);
//    按机场条件查询数量
    public Integer findAirportCount(FlightsPlus flight);
//    按航班条件查询数量
    public Integer findFlightCount(FlightsPlus flight);
//    按机场条件统计延误总和
    public AnnalysisBean sumAirportCount(AnnalysisBean flight);
//    按航班号条件统计延误总和
    public AnnalysisBean sumFlightCount(AnnalysisBean flight);
//    从ES中查数据
    public SearchResponse findEs(FlightsPlus flight, Page page) throws IOException;

    public SearchResponse findEs(FlightsPlus flight) throws IOException;

    //    搜索剩余空间，缓存替换
    public void findMemory(Integer size,String keypage, Map<String, Object> map);
    //    搜索剩余空间，缓存替换
    public void findMemory1(Integer size,String keypage, Map<String, Object> map);
    //    获取mysql某列信息
    public List<String> findflightnumber();


    //    分析函数
    void analysisfrom(int start, int end);
}
