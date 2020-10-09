package com.ssmpro.flight.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.ssmpro.flight.config.RedisUtil;
import com.ssmpro.flight.dao.CrudDao;
import com.ssmpro.flight.domain.AnnalysisBean;
import com.ssmpro.flight.domain.FlightsPlus;
import com.ssmpro.flight.domain.Page;
import com.ssmpro.flight.service.CrudService;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MatchPhraseQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.RangeQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CrudServiceImpl implements CrudService {
    @Autowired
    private CrudDao crudDao;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private RedisUtil redisUtil;
    @Resource
    private RestHighLevelClient client;

    @Override
    public void saveFlight(FlightsPlus flight) {
        crudDao.saveFlight(flight);
    }

    @Override
    public void updateFlight(FlightsPlus flight) {
        crudDao.updateFlight(flight);
    }

    @Override
    public void delFlight(FlightsPlus flight) {
        crudDao.delFlight(flight);
    }

    @Override
    public List<FlightsPlus> findAll() {
        return crudDao.findAll();
    }

    @Override
    public List<FlightsPlus> findFlight(FlightsPlus flight, Page page) {
        PageHelper.startPage(page.getCurrPage(), page.getPageSize());
        return crudDao.findFlight(flight);
    }

    @Override
    public Integer findFlightCount(FlightsPlus flight) {
        return crudDao.findFlightCount(flight);
    }

    @Override
    public Integer findAirportCount(FlightsPlus flight) {
        return crudDao.findAirportCount(flight);
    }

    @Override
    public AnnalysisBean sumAirportCount(AnnalysisBean flight) {
        return crudDao.sumAirportCount(flight);
    }

    @Override
    public AnnalysisBean sumFlightCount(AnnalysisBean flight) {
        return crudDao.sumFlightCount(flight);
    }

    @Override
    public SearchResponse findEs(FlightsPlus flight, Page page) throws IOException {

        SearchRequest searchRequest = new SearchRequest("jingjinji_data");
//    构建搜索条件
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        MatchPhraseQueryBuilder queryBuilders;
        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();

        MatchPhraseQueryBuilder originairport;
        SearchSourceBuilder query;
        //        判断搜索条件不为空，拼接搜索数据库语句
        if ((flight.getDate_start() != "") || (flight.getDate_end() != "")) {
            RangeQueryBuilder queryBuilder = QueryBuilders.rangeQuery("date");
            if (flight.getDate_start() != "") {
                queryBuilder.gt(flight.date_start).includeUpper(true).includeLower(true);    // 包含上
            }
            if (flight.getDate_end() != "") {
                queryBuilder.lt(flight.date_end).includeLower(true).includeUpper(true);      // 包含下
            }
            boolQueryBuilder.filter(queryBuilder);
        }
        if (flight.getFlightnumber() != "") {
            queryBuilders = QueryBuilders.matchPhraseQuery("flightnumber", flight.flightnumber);
            boolQueryBuilder.filter(queryBuilders);
        }
        if (flight.getOriginairport() != "") {
            originairport = QueryBuilders.matchPhraseQuery("originairport", flight.originairport);
            boolQueryBuilder.filter(originairport);
        }
        query = searchSourceBuilder.query(boolQueryBuilder);
        searchSourceBuilder.from((page.getCurrPage() - 1) * page.getPageSize());
        searchSourceBuilder.size(page.getPageSize());
        searchRequest.source(query);
        SearchResponse search = client.search(searchRequest, RequestOptions.DEFAULT);
        return search;
    }

    @Override
    public SearchResponse findEs(FlightsPlus flight) throws IOException {

        SearchRequest searchRequest = new SearchRequest("jingjinji_data");
//    构建搜索条件
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        MatchPhraseQueryBuilder queryBuilders;
        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();

        MatchPhraseQueryBuilder originairport;
        MatchPhraseQueryBuilder destairport;
        SearchSourceBuilder query;
        //        判断搜索条件不为空，拼接搜索数据库语句
        if ((flight.getDate_start() != "" && flight.getDate_start() != null) || (flight.getDate_end() != "" && flight.getDate_end() != null)) {
            RangeQueryBuilder queryBuilder = QueryBuilders.rangeQuery("date");
            if (flight.getDate_start() != "" && flight.getDate_start() != null) {
                queryBuilder.gt(flight.date_start).includeUpper(true).includeLower(true);    // 包含上
            }
            if (flight.getDate_end() != "" && flight.getDate_end() != null) {
                queryBuilder.lt(flight.date_end).includeLower(true).includeUpper(true);      // 包含下
            }
            boolQueryBuilder.filter(queryBuilder);
        }
        if (flight.getFlightnumber() != "" && flight.getFlightnumber() != null) {
            queryBuilders = QueryBuilders.matchPhraseQuery("flightnumber", flight.flightnumber);
            boolQueryBuilder.filter(queryBuilders);
        }
        if (flight.getOriginairport() != "" && flight.getOriginairport() != null) {
            originairport = QueryBuilders.matchPhraseQuery("originairport", flight.originairport);
            boolQueryBuilder.filter(originairport);
        }
        if (flight.getDestairport() != "" && flight.getDestairport() != null) {
            destairport = QueryBuilders.matchPhraseQuery("destairport", flight.destairport);
            boolQueryBuilder.filter(destairport);
        }
        query = searchSourceBuilder.query(boolQueryBuilder).size(10000);
        searchRequest.source(query);
        SearchResponse search = client.search(searchRequest, RequestOptions.DEFAULT);
        return search;
    }

    @Override
//    检查redis中有无剩余缓存空间，有就缓存,没有就删除最小缓存价值的对象，然后进行存储
    public void findMemory(Integer size, String keypage, Map<String, Object> map) {
        while (true) {
            Set<String> keys = redisTemplate.keys("hash*");
            Integer keysize = keys.size();
            if (keysize < size) {
                redisUtil.hmset(keypage, map);
                break;
            } else {
                Map<String, Integer> map1 = new HashMap<>();
                for (String key : keys) {
                    map1.put(key, Integer.parseInt((String) redisUtil.hmget(key).get(JSON.toJSON("replace"))));
                }

                List<Map.Entry<String, Integer>> list = map1.entrySet().stream()
                        .sorted((entry1, entry2) -> entry1.getValue().compareTo(entry2.getValue()))
                        .collect(Collectors.toList());
                System.out.println(list);
                String str = list.get(0).toString();
                String result = str.substring(0, str.indexOf("="));
                redisUtil.del(result);
            }
        }
        redisUtil.hmset(keypage, map);
    }

    //    检查redis中有无剩余缓存空间，有就缓存,没有就删除最小缓存价值的对象，然后进行存储
    public void findMemory1(Integer size, String keypage, Map<String, Object> map) {

        Set<String> keys = redisTemplate.keys("hash*");
        Integer keysize = keys.size();
        if (keysize < size) {
            redisUtil.hmset(keypage, map);
            redisTemplate.opsForZSet().add("selectRange", keypage, Integer.parseInt((String) map.get("replace")));
        } else {
            Set<String> selectRange = redisTemplate.opsForZSet().range("selectRange", 0, 1);
            redisTemplate.opsForZSet().removeRange("selectRange", 0, 1);
            for (String s:selectRange) {
                redisUtil.del(s);
            }
        }

    }

    @Override
    public List<String> findflightnumber() {
        return crudDao.findflightnumber();
    }

    //    分析函数start为起始天数，end为截止天数（7，7）表示从14天前到7天前，（7,0）表示从7天前到当天;(0,7)表示7天前
    @Override
    public void analysisfrom(int start, int end) {
        AnnalysisBean annalysisBean = new AnnalysisBean();
        annalysisBean.setFlightnumber("CQH8587");
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        Map<String, Object> map = new HashMap<>();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR, -2);
        calendar.add(Calendar.DATE, -end);
        Date date1 = calendar.getTime();
        annalysisBean.setDate_end(simpleDateFormat.format(date1));
        calendar.add(Calendar.DATE, -start);
        Date date = calendar.getTime();
        annalysisBean.setDate_start(simpleDateFormat.format(date));
        System.out.println(simpleDateFormat.format(date));
//        获取北京的统计信息存入map
        map = getairportmessage("ZBAA", annalysisBean, map);
//        获取天津的信息存入map
        map = getairportmessage("ZBTJ", annalysisBean, map);
//        获取大兴信息存入map
        map = getairportmessage("ZBAD", annalysisBean, map);
//        获取石家庄信息存入map
        map = getairportmessage("ZBSJ", annalysisBean, map);
        redisUtil.hmset("analysis_" + start + "_" + end, map);
        annalysisBean.setDate_end(simpleDateFormat.format(date1));
    }

    //    获取机场信息存入map中
    public Map<String, Object> getairportmessage(String airport, AnnalysisBean annalysisBean, Map<String, Object> map) {
        AnnalysisBean conditionbean = annalysisBean;
        conditionbean.setOriginairport(airport);
        AnnalysisBean bean = sumAirportCount(conditionbean);
        bean.setAllCounts(findAirportCount(conditionbean));
        if (bean.getOriginairport() != null) {
            bean.setDelayRate();
            bean.setAveArrDelay();
            map.put(bean.getOriginairport(), JSON.toJSONString(bean));
        }
        return map;
    }


}
