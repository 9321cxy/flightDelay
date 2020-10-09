package com.ssmpro.flight;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.ssmpro.flight.config.LRUCache;
import com.ssmpro.flight.config.RedisUtil;
import com.ssmpro.flight.dao.CrudDao;
import com.ssmpro.flight.domain.DayAnalysis;
import com.ssmpro.flight.domain.FlightsPlus;
import com.ssmpro.flight.domain.Page;
import com.ssmpro.flight.service.CrudService;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.index.query.MatchPhraseQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.FetchSourceContext;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import java.awt.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;

//import com.ssmpro.flight.domain.user;

@SpringBootTest
class FlightApplicationTests {
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private RestHighLevelClient restHighLevelClient;
    @Autowired
    private CrudService crudService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private CrudDao crudDao;


    @Test
    public void testGetList(){
        DayAnalysis dayAnalysis =new DayAnalysis();
        dayAnalysis.setAirport("ZBAA");
        dayAnalysis.setDate("20180930");
        List<DayAnalysis> dayAnalysisTimeList = crudDao.getDayAnalysisTimeList(dayAnalysis);
        System.out.println(dayAnalysisTimeList);
    }
    @Test
    public void testGetDao(){
        DayAnalysis dayAnalysis = new DayAnalysis();
        dayAnalysis.setDate("20180930");
        dayAnalysis.setAirport("ZBTJ");
        DayAnalysis getdayAnalysis = crudDao.getDayAnalysis(dayAnalysis);
        List<String> dayAnalysisTime = crudDao.getDayAnalysisTime(dayAnalysis);
        getdayAnalysis.setMaxTime(dayAnalysisTime);
        System.out.println(getdayAnalysis);
    }
//测试统计起飞延误数据插入表格
    @Test
    public void testInsertDao(){
        DayAnalysis dayAnalysis =new DayAnalysis();
        Calendar calendar =Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR,-2);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String[] airportArray = new String[]{"ZBAA","ZBAD","ZBTJ","ZBSJ"};
        for (int i = 0; i < 10; i++) {
            calendar.add(Calendar.DATE,-1);
            for (String airport:airportArray) {
                for (int j = 0; j < 24; j++) {
                    dayAnalysis.setDate(simpleDateFormat.format(calendar.getTime()));
                    dayAnalysis.setAirport(airport);
                    dayAnalysis.setTime(j);
                    System.out.println(dayAnalysis);
                    crudDao.InsertOriginDayAnalysis(dayAnalysis);
                }
            }
        }
    }

    //测试统计降落延误数据更新表格
    @Test
    public void testInsertDestDao(){
        DayAnalysis dayAnalysis =new DayAnalysis();
        Calendar calendar =Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR,-2);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String[] airportArray = new String[]{"ZBAA","ZBAD","ZBTJ","ZBSJ"};
        for (int i = 0; i < 10; i++) {
            calendar.add(Calendar.DATE,-1);
            for (String airport:airportArray) {
                for (int j = 0; j < 24; j++) {
                    dayAnalysis.setDate(simpleDateFormat.format(calendar.getTime()));
                    dayAnalysis.setAirport(airport);
                    dayAnalysis.setTime(j);
                    System.out.println(dayAnalysis);
                    crudDao.InsertArrDayAnalysis(dayAnalysis);
                }
            }
        }
    }
    //        测试索引的创建
    @Test
    void testCreatedIndex() throws IOException {
//        创建索引请求
        CreateIndexRequest request = new CreateIndexRequest("cxy_index");
//        执行创建请求返回indicesClient,请求后获得相应
        CreateIndexResponse createIndexResponse = restHighLevelClient.indices().create(request, RequestOptions.DEFAULT);
        System.out.println(createIndexResponse);
    }

    //    获取索引
    @Test
    void testExistIndex() throws IOException {
        GetIndexRequest request = new GetIndexRequest("cxy_index");
        boolean exists = restHighLevelClient.indices().exists(request, RequestOptions.DEFAULT);
        System.out.println(exists);
    }

    //    删除索引
    @Test
    void testDeletIndex() throws IOException {
        DeleteIndexRequest request = new DeleteIndexRequest("cxy_index");
        AcknowledgedResponse delete = restHighLevelClient.indices().delete(request, RequestOptions.DEFAULT);
        System.out.println(delete);
    }

    //    测试添加文档
    @Test
//    void testAddDocument() throws IOException {
//        user user = new user();
//        user.setName("cxy");
//        user.setAge(3);
////        创建请求
//        IndexRequest request = new IndexRequest("cxy_index");
////        规则
//        request.id("1");
//        request.timeout(TimeValue.timeValueSeconds(1));
////        将数据放入请求 json
//        request.source(JSON.toJSONString(user), XContentType.JSON);
////        发送请求,获取响应结果
//        IndexResponse indexResponse = restHighLevelClient.index(request, RequestOptions.DEFAULT);
//        System.out.println(indexResponse.toString());
//        System.out.println(indexResponse.status());
//
//    }

    //    获取文档,判断是否存在
//    @Test
    void testIsExist() throws IOException {
        GetRequest request = new GetRequest("cxy_index", "1");
        request.fetchSourceContext(new FetchSourceContext(false));
        request.storedFields("_none_");
        boolean exists = restHighLevelClient.exists(request, RequestOptions.DEFAULT);
        System.out.println(exists);
    }

    //    获取文档信息
    @Test
    void testgetDocument() throws IOException {
        GetRequest getRequest = new GetRequest("cxy_index", "1");
        GetResponse response = restHighLevelClient.get(getRequest, RequestOptions.DEFAULT);
        String sourceAsString = response.getSourceAsString();
        System.out.println(sourceAsString);
    }

    //    更新文档信息
//    @Test
//    void testUPdateDocument() throws IOException {
//        UpdateRequest request = new UpdateRequest("cxy_index", "1");
//        request.timeout("1s");
//        user user = new user();
//        user.setAge(18);
//        user.setName("cxy");
//        request.doc(JSON.toJSONString(user), XContentType.JSON);
//        UpdateResponse update = restHighLevelClient.update(request, RequestOptions.DEFAULT);
//        System.out.println(update);
//
//    }

    //    删除
    @Test
    void testDeletDocument() throws IOException {
        DeleteRequest request = new DeleteRequest("cxy_index", "1");
        request.timeout("1s");
        DeleteResponse deleteResponse = restHighLevelClient.delete(request, RequestOptions.DEFAULT);
        System.out.println(deleteResponse.status());


    }

    //    批处理请求
//    @Test
//    void testBulkDocument() throws IOException {
//        BulkRequest bulkRequest = new BulkRequest();
//        bulkRequest.timeout("10s");
//        ArrayList<user> arrayList = new ArrayList<>();
//        user user = new user();
//        user.setName("cxy");
//        user.setAge(18);
//        arrayList.add(user);
//        arrayList.add(user);
//        arrayList.add(user);
//        arrayList.add(user);
//        arrayList.add(user);
//        arrayList.add(user);
//        arrayList.add(user);
////        批处理请求
//        for (user u : arrayList) {
//            bulkRequest.add(
//                    new IndexRequest("cxy_index").source(JSON.toJSONString(u), XContentType.JSON));
//        }
//        restHighLevelClient.bulk(bulkRequest, RequestOptions.DEFAULT);
//
//
//    }

    //   查询
    @Test
    void testsearch() throws IOException {
        SearchRequest searchRequest = new SearchRequest("test");
        List<FlightsPlus> list = new ArrayList<>();
//    构建搜索条件
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        MatchPhraseQueryBuilder queryBuilders = QueryBuilders.matchPhraseQuery("flightnumber", "CSN6540");
        MatchAllQueryBuilder matchAllQueryBuilder = QueryBuilders.matchAllQuery();
        SearchSourceBuilder query = searchSourceBuilder.query(queryBuilders);
        searchRequest.source(query);
        SearchResponse search = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        System.out.println(JSON.toJSONString(search.getHits()));
        for (SearchHit hit : search.getHits().getHits()) {

            System.out.println(hit.getSourceAsString());
            FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
            System.out.println(flightsPlus);
            list.add(flightsPlus);
        }
        System.out.println(list);
    }

    @Test
    public void testdelete() {
        if ((redisTemplate.getRequiredConnectionFactory().getConnection().info("memory").get("used_memory_human").toString()) == "4.99M") {
            Set<String> keys = redisTemplate.keys("hash*");
            System.out.println(keys);
            redisTemplate.delete(keys);
            System.out.println(redisTemplate.getRequiredConnectionFactory().getConnection().info("memory").get("used_memory_human"));
        } else {
            Set<String> keys = redisTemplate.keys("hash*");
            System.out.println(keys);
            redisTemplate.delete(keys);
            System.out.println(redisTemplate.getRequiredConnectionFactory().getConnection().info("memory").get("used_memory_human"));
        }
    }

    //根据随机机场随机时间将未命中的存入redis
    @Test
    public void testfindall() throws IOException {
        int ij = 0;
        Date date3 = new Date();
        long time1 = date3.getTime();
        for (int i = 1; i < 2000; i++) {
            List<String> list = new ArrayList<>();
            list.add("ZBSJ");
            list.add("ZBAA");
            list.add("ZBTJ");
            Random random = new Random();
            int n = random.nextInt(list.size());
            String s = list.get(n);
            int StartYear = 2018;
            int EndYear = 2019;
            long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
            long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
            long ms = (long) ((end - start) * Math.random() + start);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            Date date = new Date(ms);
            String formats = dateFormat.format(date);

            Integer page1 = 1;
            Page page = new Page();
            page.setCurrPage(page1);
            String key = "flight" + "_" + formats + formats + s;
            String keypage = key + "_" + page.getCurrPage();
            Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
            String str = (String) hmget.get(JSON.toJSON("flightList"));
            List<FlightsPlus> crudServiceFlight = new ArrayList<>();
            Map<String, Object> altermap = new HashMap<>();
            PageInfo<Object> plusPageInfo = new PageInfo<>();
            if (str != null) {
                System.out.println("redis执行了");
                Integer time = Integer.parseInt((String) hmget.get(JSON.toJSON("time")));
                long timestamp = Long.parseLong((String) hmget.get(JSON.toJSON("timestamp")));
                long timefirst = Long.parseLong((String) hmget.get(JSON.toJSON("timefirst")));
                Date date1 = new Date();
                long timenow = date1.getTime();
//            PageHelper.startPage(page.getCurrPage(),page.getPageSize());
                crudServiceFlight = JSONArray.parseArray(str, FlightsPlus.class);
                Object object = JSONArray.toJSON(crudServiceFlight);
                String json = object.toString();
                altermap.put("flightList", json);
                altermap.put("time", time + 1 + "");
                altermap.put("timestamp", timenow + "");
                altermap.put("timefirst", timefirst + "");
                long replace = (long) ((timenow - timefirst) * 1 * Math.log(timestamp));
                altermap.put("replace", replace + "");
                redisUtil.hmset("hash" + keypage, altermap);
//            System.out.println(objects);
            } else {
                ij++;
                System.out.println("ES执行了");
//            分页插件
                Date date1 = new Date();
                long timestart = date1.getTime();
                FlightsPlus flight = new FlightsPlus();
                flight.setDate_start(formats);
                flight.setDate_end(formats);
                flight.setFlightnumber("");
                flight.setOriginairport(s);
                SearchResponse search = crudService.findEs(flight, page);
                if ((int) search.getHits().getTotalHits().value != 0) {
                    page.setTotalConut((int) search.getHits().getTotalHits().value);

                    plusPageInfo.setTotal((long) page.getTotalConut());
                    plusPageInfo.setPages(page.getTotalPageCount());
                    plusPageInfo.setPageNum(page.getCurrPage());
                    plusPageInfo.setLastPage(page.getTotalPageCount());
                    Date date2 = new Date();
                    long timeend = date2.getTime();
//            System.out.println(search.getHits().getTotalHits().value);
                    for (SearchHit hit : search.getHits().getHits()) {
                        FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                        crudServiceFlight.add(flightsPlus);
                    }
                    Object object = JSONArray.toJSON(crudServiceFlight);
                    System.out.println(crudServiceFlight);
                    if (crudServiceFlight.toString() != null) {
                        String json = object.toString();
                        redisUtil.set(key + "pages", plusPageInfo.getPages() + "");
                        redisUtil.set(key + "total", plusPageInfo.getTotal() + "");
                        Map<String, Object> map = new HashMap<>();
                        map.put("flightList", json);
                        map.put("time", "1");
                        map.put("timefirst", timestart + "");
                        map.put("timestamp", timeend + "");
                        long replace = (long) ((timeend - timestart) * 1 * Math.log(timeend));
                        map.put("replace", replace + "");
                        crudService.findMemory(100, "hash" + keypage, map);
                        redisUtil.hmset("hash" + keypage, map);
                        System.out.println("执行结束");

                    }
//                Set<String> keys = redisTemplate.keys("hash*");
//                System.out.println(keys);
//                Map<String,Object> mapall = new HashMap<>();
//                for (String key1:keys) {
//                    Object value = redisUtil.hmget(key1);
//                    System.out.println(value);
//                }
                }

            }
        }
        Date date4 = new Date();
        long time = date4.getTime();
        System.out.println((time - time1) + "这是耗时");
        System.out.println(ij + "这是未命中的");
    }

    //从ES中查找耗时
    @Test
    public void testES() throws IOException {
        Date date3 = new Date();
        long time = date3.getTime();
        List<String> list = new ArrayList<>();
        list.add("ZBSJ");
        list.add("ZBAA");
        list.add("ZBTJ");
        int StartYear = 2018;
        int EndYear = 2019;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
        Integer page1 = 1;
        Page page = new Page();
        page.setCurrPage(page1);
        for (int i = 0; i <= 50; i++) {
            Random random = new Random();
            int n = random.nextInt(list.size());
            String s = list.get(n);
            long ms = (long) ((end - start) * Math.random() + start);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            Date date = new Date(ms);
            String formats = dateFormat.format(date);
            Date date1 = new Date();
            long timestart = date1.getTime();
            FlightsPlus flight = new FlightsPlus();
            flight.setDate_start(formats);
            flight.setDate_end(formats);
            flight.setFlightnumber("");
            flight.setOriginairport(s);
            SearchResponse search = crudService.findEs(flight, page);
        }
        Date date1 = new Date();
        long time1 = date1.getTime();
        System.out.println((time1 - time) + "这是耗时");
    }

    //从ES与Redis混合查找耗时
    @Test
    public void testRedis() throws IOException {
        Date date4 = new Date();
        Integer ij = 0;
        long time1 = date4.getTime();
        List<String> list = new ArrayList<>();
        list.add("ZBSJ");
        list.add("ZBAA");
        list.add("ZBTJ");
        int StartYear = 2018;
        int EndYear = 2019;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        Integer page1 = 1;
        Page page = new Page();
        page.setCurrPage(page1);
        for (int i = 0; i <= 50; i++) {
            Random random = new Random();
            int n = random.nextInt(list.size());
            String s = list.get(n);
            long ms = (long) ((end - start) * Math.random() + start);
            Date date = new Date(ms);
            String formats = dateFormat.format(date);
            String key = "flight" + "_" + formats + formats + s;
            String keypage = key + "_" + page.getCurrPage();
            Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
            String str = (String) hmget.get(JSON.toJSON("flightList"));
            List<FlightsPlus> crudServiceFlight = new ArrayList<>();
            Map<String, Object> altermap = new HashMap<>();
            FlightsPlus flight = new FlightsPlus();
            if (str == null) {
                ij++;
                flight.setDate_start(formats);
                flight.setDate_end(formats);
                flight.setFlightnumber("");
                flight.setOriginairport(s);
                SearchResponse search = crudService.findEs(flight, page);
            }

        }
        Date date3 = new Date();
        long time = date3.getTime();
        System.out.println(ij + "这是未命中数");
        System.out.println((time - time1) + "这是耗时");
    }

    //    航班号与随机时间查找命中率与耗时从ES中获取
    @Test
    public void testfindflightnumberES() throws IOException {
        List findflightnumber = crudService.findflightnumber();
        Date date2 = new Date();
        long time1 = date2.getTime();
        int StartYear = 2018;
        int EndYear = 2019;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
        List<FlightsPlus> crudServiceFlight = new ArrayList<>();
        Integer page1 = 1;
        Page page = new Page();
        page.setCurrPage(page1);
        for (int i = 0; i <= 5000; i++) {
            Random random = new Random();
            int n = random.nextInt(findflightnumber.size());
            String flightnumber = (String) findflightnumber.get(n);
            System.out.println(flightnumber);
            long ms = (long) ((end - start) * Math.random() + start);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            Date date = new Date(ms);
            String formats = dateFormat.format(date);
            System.out.println(formats);
            Map<String, Object> altermap = new HashMap<>();
            PageInfo<Object> plusPageInfo = new PageInfo<>();
            FlightsPlus flight = new FlightsPlus();
            flight.setDate_start(formats);
            flight.setDate_end(formats);
            flight.setFlightnumber(flightnumber);
            flight.setOriginairport("");
            SearchResponse search = crudService.findEs(flight, page);
            if ((int) search.getHits().getTotalHits().value != 0) {
                page.setTotalConut((int) search.getHits().getTotalHits().value);
                plusPageInfo.setTotal((long) page.getTotalConut());
                plusPageInfo.setPages(page.getTotalPageCount());
                plusPageInfo.setPageNum(page.getCurrPage());
                plusPageInfo.setLastPage(page.getTotalPageCount());
//            System.out.println(search.getHits().getTotalHits().value);
                for (SearchHit hit : search.getHits().getHits()) {
                    FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                    crudServiceFlight.add(flightsPlus);
                }
                Object object = JSONArray.toJSON(crudServiceFlight);
            }
        }
        Date date1 = new Date();
        long time = date1.getTime();
        System.out.println((time - time1) + "这是耗时");
    }

    //    航班号与随机时间查找ES与redis命中率与耗时
    @Test
    public void findflightnumberESRedis() throws IOException {
        List list = crudService.findflightnumber();
        Date date4 = new Date();
        Integer ij = 0;
        long time1 = date4.getTime();
        int StartYear = 2018;
        int EndYear = 2018;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-4-30 0:0:0").getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        Integer page1 = 1;
        Page page = new Page();
        page.setCurrPage(page1);
        for (int i = 0; i < 5000; i++) {
            Random random = new Random();
            int n = random.nextInt(list.size());
            String s = (String) list.get(n);
            long ms = (long) ((end - start) * Math.random() + start);
            Date date = new Date(ms);
            String formats = dateFormat.format(date);
            String key = "flight" + "_" + s + formats + formats;
            String keypage = key + "_" + page.getCurrPage();
            Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
            String str = (String) hmget.get(JSON.toJSON("flightList"));
            List<FlightsPlus> crudServiceFlight = new ArrayList<>();
            Map<String, Object> altermap = new HashMap<>();
            PageInfo<Object> plusPageInfo = new PageInfo<>();
            if (str != null) {
                System.out.println("redis执行了");
                Integer time = Integer.parseInt((String) hmget.get(JSON.toJSON("time")));
                long timestamp = Long.parseLong((String) hmget.get(JSON.toJSON("timestamp")));
                long timefirst = Long.parseLong((String) hmget.get(JSON.toJSON("timefirst")));
                Date date1 = new Date();
                long timenow = date1.getTime();
//            PageHelper.startPage(page.getCurrPage(),page.getPageSize());
                crudServiceFlight = JSONArray.parseArray(str, FlightsPlus.class);
                Object object = JSONArray.toJSON(crudServiceFlight);
                String json = object.toString();
                altermap.put("flightList", json);
                altermap.put("time", time + 1 + "");
                altermap.put("timestamp", timenow + "");
                altermap.put("timefirst", timefirst + "");
                long replace = (long) ((timenow - timefirst) * 1 * Math.log(timestamp));
                altermap.put("replace", replace + "");
                redisUtil.hmset("hash" + keypage, altermap);
//            System.out.println(objects);
            } else {
                ij++;
                System.out.println("ES执行了");
//            分页插件
                FlightsPlus flight = new FlightsPlus();
                flight.setDate_start(formats);
                flight.setDate_end(formats);
                flight.setFlightnumber(s);
                flight.setOriginairport("");
                SearchResponse search = crudService.findEs(flight, page);
                if ((int) search.getHits().getTotalHits().value != 0) {
                    page.setTotalConut((int) search.getHits().getTotalHits().value);

                    plusPageInfo.setTotal((long) page.getTotalConut());
                    plusPageInfo.setPages(page.getTotalPageCount());
                    plusPageInfo.setPageNum(page.getCurrPage());
                    plusPageInfo.setLastPage(page.getTotalPageCount());
//            System.out.println(search.getHits().getTotalHits().value);
                    for (SearchHit hit : search.getHits().getHits()) {
                        FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                        crudServiceFlight.add(flightsPlus);
                    }
                    Object object = JSONArray.toJSON(crudServiceFlight);
                    System.out.println(crudServiceFlight);

                }
            }
        }
        Date date3 = new Date();
        long time = date3.getTime();
        System.out.println((time - time1) + "这是耗时");
        System.out.println(ij + "这是未命中");
    }

    //    从ES查找存入redis命中率与耗时
    @Test
    public void findflightnumberALL() throws IOException {

        int ij = 0;
        int j = 0;
        Date date3 = new Date();
        long time1 = date3.getTime();
        List list = crudService.findflightnumber();
        for (int i = 1; i <= 10000; i++) {
            Random random = new Random();
            int n = random.nextInt(list.size());
            String s = (String) list.get(n);
            int StartYear = 2018;
            int EndYear = 2018;
            long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
            long end = Timestamp.valueOf(EndYear + "-4-30 0:0:0").getTime();

            long ms = (long) ((end - start) * Math.random() + start);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            Date date = new Date(ms);
            String formats = dateFormat.format(date);
            Integer page1 = 1;
            Page page = new Page();
            page.setCurrPage(page1);
            String key = "flight" + "_" + s + formats + formats;
            String keypage = key + "_" + page.getCurrPage();
            Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
            String str = (String) hmget.get(JSON.toJSON("flightList"));
            List<FlightsPlus> crudServiceFlight = new ArrayList<>();
            Map<String, Object> altermap = new HashMap<>();
            PageInfo<Object> plusPageInfo = new PageInfo<>();
            if (str != null) {
                j++;
                System.out.println("redis执行了");
                Integer time = Integer.parseInt((String) hmget.get(JSON.toJSON("time")));
                long timestamp = Long.parseLong((String) hmget.get(JSON.toJSON("timestamp")));
                long timefirst = Long.parseLong((String) hmget.get(JSON.toJSON("timefirst")));
                Date date1 = new Date();
                long timenow = date1.getTime();
//            PageHelper.startPage(page.getCurrPage(),page.getPageSize());
                crudServiceFlight = JSONArray.parseArray(str, FlightsPlus.class);
                Object object = JSONArray.toJSON(crudServiceFlight);
                String json = object.toString();
                altermap.put("flightList", json);
                altermap.put("time", time + 1 + "");
                altermap.put("timestamp", timenow + "");
                altermap.put("timefirst", timefirst + "");
                long replace = (long) ((timenow - timefirst) * 1 * Math.log(timestamp));
                altermap.put("replace", replace + "");
                redisUtil.hmset("hash" + keypage, altermap);
//            System.out.println(objects);
            } else {
                System.out.println("ES执行了");
//            分页插件
                Date date1 = new Date();
                long timestart = date1.getTime();
                FlightsPlus flight = new FlightsPlus();
                flight.setDate_start(formats);
                flight.setDate_end(formats);
                flight.setFlightnumber(s);
                flight.setOriginairport("");
                SearchResponse search = crudService.findEs(flight, page);
                System.out.println(search.getHits().getTotalHits().value);
                if ((int) search.getHits().getTotalHits().value != 0) {
                    ij++;
                    page.setTotalConut((int) search.getHits().getTotalHits().value);
                    plusPageInfo.setTotal((long) page.getTotalConut());
                    plusPageInfo.setPages(page.getTotalPageCount());
                    plusPageInfo.setPageNum(page.getCurrPage());
                    plusPageInfo.setLastPage(page.getTotalPageCount());
                    Date date2 = new Date();
                    long timeend = date2.getTime();
//            System.out.println(search.getHits().getTotalHits().value);
                    for (SearchHit hit : search.getHits().getHits()) {
                        FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                        crudServiceFlight.add(flightsPlus);
                    }
                    Object object = JSONArray.toJSON(crudServiceFlight);
                    System.out.println(crudServiceFlight);
                    if (crudServiceFlight.toString() != null) {
                        String json = object.toString();
                        redisUtil.set(key + "pages", plusPageInfo.getPages() + "");
                        redisUtil.set(key + "total", plusPageInfo.getTotal() + "");
                        Map<String, Object> map = new HashMap<>();
                        map.put("flightList", json);
                        map.put("time", "1");
                        map.put("timefirst", timestart + "");
                        map.put("timestamp", timeend + "");
                        long replace = (long) ((timeend - timestart) * 1 * Math.log(timeend));
                        map.put("replace", replace + "");
                        crudService.findMemory(100, "hash" + keypage, map);
                        System.out.println("执行结束");

                    }
//                Set<String> keys = redisTemplate.keys("hash*");
//                System.out.println(keys);
//                Map<String,Object> mapall = new HashMap<>();
//                for (String key1:keys) {
//                    Object value = redisUtil.hmget(key1);
//                    System.out.println(value);
//                }
                }

            }
        }
        Date date4 = new Date();
        long time = date4.getTime();
        System.out.println((time - time1) + "这是耗时");
        System.out.println(ij + "这是未命中的");
        System.out.println("这是命中" + j);
    }

//    mysql与redis使用Hbrid算法
    @Test
    public void findbymysql() {
        int ij =0;
        FlightsPlus flightsPlus = new FlightsPlus();
        Page page = new Page();
        page.setCurrPage(1);
        List<String> list = new ArrayList<>();
        list.add("ZBSJ");
        list.add("ZBAA");
        list.add("ZBTJ");
        Random random = new Random();
        Date date = new Date();
        int StartYear = 2018;
        int EndYear = 2019;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        List<FlightsPlus> crudServiceFlight;
        Map<String, Object> altermap = new HashMap<>();
        long timeall = 0;
        long timedelay=0;
        for (int i = 0; i < 2000; i++) {
            long ms = (long) ((end - start) * Math.random() + start);
            Date date2 = new Date(ms);
            String formats = dateFormat.format(date2);
            int n = random.nextInt(list.size());
            String s = list.get(n);
            String key = "flight" + "_" + formats + formats + s;
            String keypage = key + "_" + page.getCurrPage();
            Date date5 = new Date();
            long date3Time = date5.getTime();
            Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
            Date date4 =new Date();
            long date4Time = date4.getTime();
            timeall = timeall + date4Time-date3Time;
            String str = (String) hmget.get(JSON.toJSON("flightList"));
            if (str != null) {
                System.out.println("redis执行了");
                Integer time = Integer.parseInt((String) hmget.get(JSON.toJSON("time")));
                long timefirst = Long.parseLong((String) hmget.get(JSON.toJSON("timefirst")));
                Date date1 = new Date();
                long timenow = date1.getTime();
//            PageHelper.startPage(page.getCurrPage(),page.getPageSize());
                crudServiceFlight = JSONArray.parseArray(str, FlightsPlus.class);
                Object object = JSONArray.toJSON(crudServiceFlight);
                String json = object.toString();
                altermap.put("flightList", json);
                altermap.put("time", time + 1 + "");
                altermap.put("timestamp", timenow + "");
                altermap.put("timefirst", timefirst + "");
                long replace = (long) ((timefirst) * (time+1) * Math.log(timenow));
                altermap.put("replace", replace + "");
                redisUtil.hmset("hash" + keypage, altermap);
            } else {
                ij++;
                flightsPlus.setOriginairport(s);
                flightsPlus.setDate_start(formats);
                flightsPlus.setDate_end(formats);
                Date date1 = new Date();
                long timestart = date1.getTime();
                crudServiceFlight = crudService.findFlight(flightsPlus, page);
                Date date3 = new Date();
                long timeend = date3.getTime();
                Object object = JSONArray.toJSON(crudServiceFlight);
                timeall= timeend-timestart+timeall;
                timedelay = timedelay+timeend-timestart;
                if (crudServiceFlight.toString() != null) {
                    String json = object.toString();
                    Map<String, Object> map = new HashMap<>();
                    map.put("flightList", json);
                    map.put("time", "1");
                    long replace;
                    if (timeend-timestart!=0) {
                        map.put("timefirst", timeend - timestart + "");
                        replace = (long) ((timeend - timestart) * 1 * Math.log(timeend));
                    }else {
                        map.put("timefirst", 1 + "");
                        replace = (long) (1 * Math.log(timeend));
                    }
                    map.put("timestamp", timeend + "");
                    map.put("replace", replace + "");
                    crudService.findMemory1(700, "hash" + keypage, map);
                    System.out.println("执行结束");
                }
            }
        }
        System.out.println(timedelay+"mysql延时");
        System.out.println(timeall+"总延时");
        Date date1 = new Date();
        System.out.println(date1.getTime() - date.getTime() + "这是耗时");
        System.out.println(ij+"这是未命中");
    }

    @Test
    public void findbymysqluselru(){
        LRUCache cache = new LRUCache(700);
        int ij =0;
        FlightsPlus flightsPlus = new FlightsPlus();
        Page page = new Page();
        page.setCurrPage(1);
        List<String> list = new ArrayList<>();
        list.add("ZBSJ");
        list.add("ZBAA");
        list.add("ZBTJ");
        Random random = new Random();
        int StartYear = 2018;
        int EndYear = 2019;
        long start = Timestamp.valueOf(StartYear + "-4-1 0:0:0").getTime();
        long end = Timestamp.valueOf(EndYear + "-3-29 0:0:0").getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        List<FlightsPlus> crudServiceFlight;
        long time = 0;
        long timedelay=0;
        for (int i = 0; i < 2000; i++) {
            long ms = (long) ((end - start) * Math.random() + start);
            Date date2 = new Date(ms);
            String formats = dateFormat.format(date2);
            int n = random.nextInt(list.size());
            String s = list.get(n);
            String key = "flight" + "_" + formats + formats + s;
            String keypage = key + "_" + page.getCurrPage();
            System.out.println(keypage);
            Date date3 = new Date();
            long time3 = date3.getTime();
            Object o1 = cache.get("hash" + keypage);
            Date date4 = new Date();
            long time4 = date4.getTime();
            time=time+time4-time3;
            System.out.println(o1);
            if (o1 == null){
                ij++;
                flightsPlus.setOriginairport(s);
                flightsPlus.setDate_start(formats);
                flightsPlus.setDate_end(formats);
                Date date = new Date();
                long time1 = date.getTime();
                crudServiceFlight = crudService.findFlight(flightsPlus, page);
                Date date1 = new Date();
                long time2 = date1.getTime();
                String json = JSON.toJSONString(crudServiceFlight);
                cache.put("hash"+keypage,json);
                time = time2-time1+time;
                timedelay = time2-time1+timedelay;
            }else {
                System.out.println("lru执行了");
            }

        }
        System.out.println(timedelay+"mysql延时");
        System.out.println(time+"总延时");
        System.out.println("结束");
        System.out.println(ij+"这是未命中");
    }
    @Test
//    数据分析
    public void testannalysis() {
//        Set<String> analysis = redisTemplate.keys("analysis");
//        redisTemplate.delete(analysis);
//        crudService.analysisfrom(7,0);
//        crudService.analysisfrom(7,7);
//        for (int i=0; i<=30;i++){
//            crudService.analysisfrom(0,i);
//        }
        Map<Object, Object> analysis_7_0 = redisUtil.hmget("analysis_7_0");
        Map<Object, Object> analysis_7_7 = redisUtil.hmget("analysis_7_7");
        Map<String, String> mapAll = new HashMap<>();

        mapAll.put("analysis_7_0", JSON.toJSONString(analysis_7_0));
        mapAll.put("analysis_7_7", JSON.toJSONString(analysis_7_7));
        for (int i = 0; i < 30; i++) {
            String key = "analysis_0_" + i;
            Map<Object, Object> hmget = redisUtil.hmget(key);
            mapAll.put(key, JSON.toJSONString(hmget));
        }
        System.out.println(mapAll);
        JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(mapAll));
        System.out.println(jsonObject.get("analysis_0_29"));

//        Object o = analysis_7_0.get(JSON.toJSON("ZBAA"));
//        System.out.println(JSON.toJSONString(o));
//        AnnalysisBean annalysisBean = JSON.parseObject(JSON.toJSONString(o).replace("\\","").replace("\"{", "{").replace("}\"", "}"), AnnalysisBean.class);
//        System.out.println(annalysisBean);
//        String json = JSON.toJSONString(annalysisBean);
//        System.out.println(json);
    }

//    java画图
    @Test
    public static void main(String[] args) {

        StandardChartTheme mChartTheme = new StandardChartTheme("CN");
        mChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 20));
        mChartTheme.setExtraLargeFont(new Font("宋体", Font.PLAIN, 15));
        mChartTheme.setRegularFont(new Font("宋体", Font.PLAIN, 15));
        ChartFactory.setChartTheme(mChartTheme);
        CategoryDataset mDataset = GetDataset();
        JFreeChart mChart = ChartFactory.createLineChart(
                "容量-DMS响应时间",//图名字
                "Redis容量",//横坐标
                "DMS响应时间（ms）",//纵坐标
                mDataset,//数据集
                PlotOrientation.VERTICAL,
                true, // 显示图例
                true, // 采用标准生成器
                false);// 是否生成超链接

        CategoryPlot mPlot = (CategoryPlot)mChart.getPlot();
        mPlot.setBackgroundPaint(Color.LIGHT_GRAY);
        mPlot.setRangeGridlinePaint(Color.BLUE);//背景底部横虚线
        mPlot.setOutlinePaint(Color.RED);//边界线

        ChartFrame mChartFrame = new ChartFrame("容量-DMS响应时间", mChart);
        mChartFrame.pack();
        mChartFrame.setVisible(true);

    }
    public static CategoryDataset GetDataset()
    {
        DefaultCategoryDataset mDataset = new DefaultCategoryDataset();
        mDataset.addValue(11739, "HyBrid", "100");
        mDataset.addValue(10061, "HyBrid", "200");
        mDataset.addValue(9227, "HyBrid", "300");
        mDataset.addValue(8681, "HyBrid", "400");
        mDataset.addValue(8072, "HyBrid", "500");
        mDataset.addValue(5727, "HyBrid", "600");
        mDataset.addValue(5627, "HyBrid", "700");
        mDataset.addValue(11855, "LRU", "100");
        mDataset.addValue(11170, "LRU", "200");
        mDataset.addValue(9940, "LRU", "300");
        mDataset.addValue(9265, "LRU", "400");
        mDataset.addValue(8497, "LRU", "500");
        mDataset.addValue(7669, "LRU", "600");
        mDataset.addValue(7294, "LRU", "700");
        return mDataset;
    }
    @Test
    public void test1(){
        Random random = new Random();
        int i = random.nextInt();
        System.out.println(i);
    }
}

