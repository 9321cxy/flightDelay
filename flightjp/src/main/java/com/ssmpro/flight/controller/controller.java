package com.ssmpro.flight.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssmpro.flight.config.RedisUtil;
import com.ssmpro.flight.domain.*;
import com.ssmpro.flight.service.CrudService;
import com.ssmpro.flight.service.Rservice;
import com.ssmpro.flight.service.predictSerivice;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.String.valueOf;

@Controller
@EnableScheduling   // 2.开启定时任务
@RequestMapping("controller")
@SessionAttributes(value = {"flights", "results", "pageInfo", "hflights"})
public class controller {
    @Autowired
    private predictSerivice predictSerivice;
    @Autowired
    private CrudService crudService;
    @Resource
    private RedisUtil redisUtil;
    @Resource
    private RedisTemplate redisTemplate;
    @Resource
    private RestHighLevelClient client;


    @RequestMapping("/addflight")
    public void addflight() {
        System.out.println("hello");
    }

    @RequestMapping("/deleflight")
    public void deleflight() {

    }

    @RequestMapping("/correctflight")
    public void correctflight() {

    }

    @RequestMapping("/findAll")
    public void findAll() {

        List<FlightsPlus> list = crudService.findAll();
        System.out.println(list);
    }

    @RequestMapping("/analysis")
    @ResponseBody
    public JSONObject analysis() {
        Map<Object, Object> analysis_7_0 = redisUtil.hmget("analysis_7_0");
        Map<Object, Object> analysis_7_7 = redisUtil.hmget("analysis_7_7");
        Map<String, JSONObject> mapAll = new HashMap<>();

        mapAll.put("analysis_7_0", JSONObject.parseObject(JSON.toJSONString(analysis_7_0)));
        mapAll.put("analysis_7_7", JSONObject.parseObject(JSON.toJSONString(analysis_7_7)));
        for (int i = 0; i < 30; i++) {
            String key = "analysis_0_" + i;
            Map<Object, Object> hmget = redisUtil.hmget(key);
            mapAll.put(key, JSONObject.parseObject(JSON.toJSONString(hmget)));
        }
        System.out.println(mapAll);
        JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(mapAll));
        return jsonObject;
    }

    //    初始化模块
//    @PostConstruct
    public void init() {
//        获取一个月的航班统计
        AnnalysisBean flight = new AnnalysisBean();
        Analysis analysis = new Analysis();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR, -2);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        for (int i = 0; i <= 30; i++) {
            calendar.add(Calendar.DATE, -i - 1);
            Date dateStart = calendar.getTime();
            flight.setDate_start(dateFormat.format(dateStart));
            flight.setDate_end(dateFormat.format(dateStart));
            flight.setOriginairport("ZBAA");
            analysis.setZBAA_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
            analysis.setZBAA_count_day(crudService.findAirportCount(flight));
            flight.setOriginairport("ZBAD");
            analysis.setZBAD_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
            analysis.setZBAD_count_day(crudService.findAirportCount(flight));
            flight.setOriginairport("ZBSJ");
            analysis.setZBSJ_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
            analysis.setZBSJ_count_day(crudService.findAirportCount(flight));
            flight.setOriginairport("ZBTJ");
            analysis.setZBTJ_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
            analysis.setZBTJ_count_day(crudService.findAirportCount(flight));
            redisUtil.set("ZBAA_" + flight.getDate_start(), analysis.getZBAA_sumDelayAirport_day() + "");
            redisUtil.set("ZBAD_" + flight.getDate_start(), analysis.getZBAD_sumDelayAirport_day() + "");
            redisUtil.set("ZBSJ_" + flight.getDate_start(), analysis.getZBSJ_sumDelayAirport_day() + "");
            redisUtil.set("ZBTJ_" + flight.getDate_start(), analysis.getZBTJ_sumDelayAirport_day() + "");
            redisUtil.set("ZBAA_count_" + flight.getDate_start(), analysis.getZBAA_count_day() + "");
            redisUtil.set("ZBAD_count_" + flight.getDate_start(), analysis.getZBAD_count_day() + "");
            redisUtil.set("ZBSJ_count_" + flight.getDate_start(), analysis.getZBSJ_count_day() + "");
            redisUtil.set("ZBTJ_count_" + flight.getDate_start(), analysis.getZBTJ_count_day() + "");

        }
        System.out.println("执行了");
    }


    //    统计模块
//    @PostConstruct
    @Scheduled(cron = "* * 0 * * ?")
    public void analysisScheduled() {
        AnnalysisBean flight = new AnnalysisBean();
        Analysis analysis = new Analysis();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR, -2);
        calendar.add(Calendar.DATE, -1);
        Date dateEnd = calendar.getTime();
        calendar.add(Calendar.DATE, 0);
        Date dateStart = calendar.getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        flight.setDate_end(dateFormat.format(dateEnd));
        flight.setDate_start(dateFormat.format(dateStart));
        System.out.println(flight.getDate_start());
//        数据库搜索的数据是秒钟为单位的
        flight.setOriginairport("ZBAA");
        analysis.setZBAA_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
        analysis.setZBAA_count_day(crudService.findAirportCount(flight));
        flight.setOriginairport("ZBAD");
        analysis.setZBAD_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
        analysis.setZBAD_count_day(crudService.findAirportCount(flight));
        flight.setOriginairport("ZBSJ");
        analysis.setZBSJ_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
        analysis.setZBSJ_count_day(crudService.findAirportCount(flight));
        flight.setOriginairport("ZBTJ");
        analysis.setZBTJ_sumDelayAirport_day((crudService.sumAirportCount(flight).getArrDelay() == null ? 0 : crudService.sumAirportCount(flight).getArrDelay()) / 60);
        analysis.setZBTJ_count_day(crudService.findAirportCount(flight));
        redisUtil.set("ZBAA_" + flight.getDate_start(), analysis.getZBAA_sumDelayAirport_day() + "");
        redisUtil.set("ZBAD_" + flight.getDate_start(), analysis.getZBAD_sumDelayAirport_day() + "");
        redisUtil.set("ZBSJ_" + flight.getDate_start(), analysis.getZBSJ_sumDelayAirport_day() + "");
        redisUtil.set("ZBTJ_" + flight.getDate_start(), analysis.getZBTJ_sumDelayAirport_day() + "");
        redisUtil.set("ZBAA_count_" + flight.getDate_start(), analysis.getZBAA_count_day() + "");
        redisUtil.set("ZBAD_count_" + flight.getDate_start(), analysis.getZBAD_count_day() + "");
        redisUtil.set("ZBSJ_count_" + flight.getDate_start(), analysis.getZBSJ_count_day() + "");
        redisUtil.set("ZBTJ_count_" + flight.getDate_start(), analysis.getZBTJ_count_day() + "");
        System.out.println("执行每天0点定时任务");
    }

    //      ES查询模块
    @RequestMapping("/findByEs")
    public String findByEs(FlightsPlus flight, Model model, Page page) throws IOException {
        if (flight.getDate_start() == null) {
            flight.setDate_start("");
        }
        if (flight.getDate_end() == null) {
            flight.setDate_end("");
        }
        if (flight.getFlightnumber() == null) {
            flight.setFlightnumber("");
        } else {
            flight.setFlightnumber(flight.getFlightnumber());
        }
        if (flight.getOriginairport() == null) {
            flight.setOriginairport("");
        }
        if (flight.getDate_start()!=""^flight.getDate_end()!=""){
            if (flight.getDate_start()!=""){
                flight.setDate_end(flight.getDate_start());
            }
            if(flight.getDate_end()!=""){
                flight.setDate_start(flight.getDate_end());
            }
        }
        String key = "flight" + "_" + flight.getFlightnumber() + flight.getDate_start() + flight.getDate_end() + flight.getOriginairport();
        String keypage = key + "_" + page.getCurrPage();
        Date date = new Date();
        System.out.println(date.getTime());
        Map<Object, Object> hmget = redisUtil.hmget("hash" + keypage);
        List<FlightsPlus> crudServiceFlight = new ArrayList<>();
        PageInfo<FlightsPlus> plusPageInfo;
        Map<String, Object> altermap = new HashMap<>();
        String str = (String) hmget.get(JSON.toJSON("flightList"));
        String pages = (String) redisUtil.get(key + "pages");
        String total = (String) redisUtil.get(key + "total");
//            同步线程执行缓存预存
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    List<FlightsPlus> crudServiceFlight1 = new ArrayList<>();
                    Page curr = new Page();
                    curr.setCurrPage(page.getCurrPage() + 1);
                    String keypage1 = key + "_" + curr.getCurrPage();
                    Date date1 = new Date();
                    long timestart = date1.getTime();
                    SearchResponse search = crudService.findEs(flight, curr);
                    Date date2 = new Date();
                    long timeend = date2.getTime();
                    for (SearchHit hit : search.getHits().getHits()) {
                        FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                        crudServiceFlight1.add(flightsPlus);
                    }
                    Object object = JSONArray.toJSON(crudServiceFlight1);
                    String json = object.toString();
//            System.out.println(json);
//                redisUtil.set(keypage, json);
//            指定失效时间1000min
//                redisUtil.expire(key, 1000);
//                redisUtil.expire(keypage, 1000);
                    Map<String, Object> map = new HashMap<>();
                    map.put("flightList", json);
                    map.put("time", "1");
                    map.put("timefirst", timestart + "");
                    map.put("timestamp", timeend + "");
                    long replace = (long) ((timeend - timestart) * 1 * Math.log(timeend));
                    map.put("replace", replace + "");
                    crudService.findMemory1(10000, "hash" + keypage1, map);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        thread.start();
        if (str != null && pages !=null &&total!=null) {
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
            crudService.findMemory(10000, "hash" + keypage, altermap);
//            System.out.println(objects);
            plusPageInfo = new PageInfo<>(crudServiceFlight);

//            System.out.println(string);
            plusPageInfo.setPages(Integer.parseInt(pages));
            plusPageInfo.setPageNum(page.getCurrPage());
            plusPageInfo.setTotal(Integer.parseInt(total));
            plusPageInfo.setFirstPage(1);
            plusPageInfo.setLastPage(Integer.parseInt(pages));
        } else {
            System.out.println("ES执行了");
//            分页插件
            plusPageInfo = new PageInfo<>(crudServiceFlight);
            plusPageInfo.setFirstPage(1);
            Date date1 = new Date();
            long timestart = date1.getTime();
            System.out.println(timestart);
            SearchResponse search = crudService.findEs(flight, page);
            Date date2 = new Date();
            long timeend = date2.getTime();
            System.out.println(timeend);
//            System.out.println(search.getHits().getTotalHits().value);
            if (search.getHits().getTotalHits()!=null && (int)search.getHits().getTotalHits().value!=0){
                page.setTotalConut((int) search.getHits().getTotalHits().value);
                plusPageInfo.setTotal(page.getTotalConut());
                plusPageInfo.setPages(page.getTotalPageCount());
                plusPageInfo.setPageNum(page.getCurrPage());
                plusPageInfo.setLastPage(page.getTotalPageCount());
            }
            for (SearchHit hit : search.getHits()) {
                FlightsPlus flightsPlus = JSON.parseObject(hit.getSourceAsString(), FlightsPlus.class);
                crudServiceFlight.add(flightsPlus);
            }
            Object object = JSONArray.toJSON(crudServiceFlight);
            String json = object.toString();
//            System.out.println(json);
//                redisUtil.set(keypage, json);
//            指定失效时间1000min
//                redisUtil.expire(key, 1000);
//                redisUtil.expire(keypage, 1000);
            redisUtil.set(key + "pages", plusPageInfo.getPages() + "");
            redisUtil.set(key + "total", plusPageInfo.getTotal() + "");
            Map<String, Object> map = new HashMap<>();
            map.put("flightList", json);
            map.put("time", "1");
            map.put("timefirst", timestart + "");
            map.put("timestamp", timeend + "");
            long replace = (long) ((timeend - timestart) * 1 * Math.log(timeend));
            map.put("replace", replace + "");
            crudService.findMemory(10000, "hash" + keypage, map);
//                Set<String> keys = redisTemplate.keys("hash*");
//                System.out.println(keys);
//                Map<String,Object> mapall = new HashMap<>();
//                for (String key1:keys) {
//                    Object value = redisUtil.hmget(key1);
//                    System.out.println(value);
//                }
        }
        Date date1 = new Date();
        System.out.println(date1.getTime());
        model.addAttribute("flights", flight);
//        查询结果
        model.addAttribute("pageInfo", plusPageInfo);
        return "redirect:/jsp7.jsp";
    }

    //        数据库mysql查询
    @RequestMapping("/findbycondition")
    public String findbycondition(FlightsPlus flight, Model model, Page page) throws IOException {
        System.out.println("findController执行了");
        System.out.println(page);
        //        因为jsp输入项为空时赋值为""，而在dao中判断时要用null
        if (flight.getDate_start() == "") {
            flight.setDate_start(null);
        }
        if (flight.getDate_end() == "") {
            flight.setDate_end(null);
        }
        if (flight.getFlightnumber() == "") {
            flight.setFlightnumber(null);
        } else {
            flight.setFlightnumber(flight.getFlightnumber());
        }
        if (flight.getOriginairport() == "") {
            flight.setOriginairport(null);
        }
        String key = "flight" + "_" + flight.getFlightnumber() + flight.getDate_start() + flight.getDate_end() + flight.getOriginairport();
        String keypage = key + page.getCurrPage();
        Date date = new Date();
        System.out.println(date.getTime());
        String str = (String) redisUtil.get(keypage);
        System.out.println(str);
        List<FlightsPlus> crudServiceFlight;
        PageInfo<FlightsPlus> plusPageInfo;
        if (str != null) {
//            PageHelper.startPage(page.getCurrPage(),page.getPageSize());
            crudServiceFlight = JSONArray.parseArray(str, FlightsPlus.class);
//            System.out.println(objects);
            plusPageInfo = new PageInfo<>(crudServiceFlight);
            String pages = (String) redisUtil.get(key + "pages");
            String total = (String) redisUtil.get(key + "total");
//            System.out.println(string);
            plusPageInfo.setPages(Integer.parseInt(pages));
            plusPageInfo.setPageNum(page.getCurrPage());
            plusPageInfo.setTotal(Integer.parseInt(total));
            plusPageInfo.setLastPage(Integer.parseInt(total));
        } else {
            crudServiceFlight = crudService.findFlight(flight, page);
            Object object = JSONArray.toJSON(crudServiceFlight);
            String json = object.toString();
//            System.out.println(json);
            redisUtil.set(keypage, json);
//            指定失效时间2min
            redisUtil.expire(key, 1000);
            redisUtil.expire(keypage, 1000);

            plusPageInfo = new PageInfo<>(crudServiceFlight);
            redisUtil.set(key + "pages", plusPageInfo.getPages() + "");
            redisUtil.set(key + "total", plusPageInfo.getTotal() + "");
//            redisUtil.set("pages",plusPageInfo.getPages());
        }

        Date date1 = new Date();
        System.out.println(date1.getTime());
//        将查询结果封装到PageInfo中

        System.out.println(plusPageInfo);
//        给前端的输入框保存键入的条件
        model.addAttribute("flights", flight);
//        查询结果
        model.addAttribute("pageInfo", plusPageInfo);

        return "redirect:/jsp7.jsp";
    }


    @RequestMapping("/springfileupload")
    public String fileupload(HttpServletRequest request, MultipartFile upload, Model model) throws
            FileUploadException, IOException {
        System.out.println("文件上传controller");
        String path = request.getSession().getServletContext().getRealPath("/uplods/");
        File file = new File(path);
        if (!file.exists()) {
            file.mkdir();
        }
        String filename = upload.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;
        upload.transferTo(new File(path, filename));

//        调用python文件
        String PyhonFile = "D:\\idea_pycharm_projects\\python_to_java\\2.py";
        String python_enviroment = "C:\\Users\\dell\\AppData\\Local\\conda\\conda\\envs\\tensorflow\\python.exe";
        String params = "11 5";
        try {
            Process process = Runtime.getRuntime().exec(python_enviroment + " " + PyhonFile + " " + params);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
                model.addAttribute("results", line);
            }
            in.close();
            int re = process.waitFor();
            System.out.println("----------------------");
            System.out.println(re);
            System.out.println("----------------------");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("/tabaleData")
    @ResponseBody
    public JSONArray tableData() {
        FlightsPlus flightsPlus = new FlightsPlus();
        flightsPlus.setOriginairport("北京");
        flightsPlus.setFlightnumber("CA1919");
        flightsPlus.setCrsdepTime("2320");
        flightsPlus.setGrade("0");
        flightsPlus.setTasktype("{\"grade0\":\"0.5\",\"grade1\":\"0.2\",\"grade2\":\"0.2\",\"grade3\":\"0.1\"}");
        FlightsPlus flightsPlus1 = new FlightsPlus();
        flightsPlus1.setOriginairport("天津");
        flightsPlus1.setFlightnumber("CA1019");
        flightsPlus1.setCrsdepTime("1120");
        flightsPlus1.setGrade("2");
        flightsPlus1.setTasktype("{\"grade0\":\"0.15\",\"grade1\":\"0.15\",\"grade2\":\"0.5\",\"grade3\":\"0.2\"}");
        FlightsPlus flightsPlus2 = new FlightsPlus();
        flightsPlus2.setOriginairport("大兴");
        flightsPlus2.setFlightnumber("CA1119");
        flightsPlus2.setCrsdepTime("1005");
        flightsPlus2.setGrade("3");
        flightsPlus2.setTasktype("{\"grade0\":\"0.15\",\"grade1\":\"0.15\",\"grade2\":\"0.2\",\"grade3\":\"0.5\"}");
        FlightsPlus flightsPlus3 = new FlightsPlus();
        flightsPlus3.setOriginairport("石家庄");
        flightsPlus3.setFlightnumber("CA1219");
        flightsPlus3.setCrsdepTime("1120");
        flightsPlus3.setGrade("1");
        flightsPlus3.setTasktype("{\"grade0\":\"0.2\",\"grade1\":\"0.5\",\"grade2\":\"0.1\",\"grade3\":\"0.2\"}");
        Object obj = JSONArray.toJSON(flightsPlus);
        Object obj1 = JSONArray.toJSON(flightsPlus1);
        Object obj2 = JSONArray.toJSON(flightsPlus2);
        Object obj3 = JSONArray.toJSON(flightsPlus3);
        JSONArray array = new JSONArray();
        FlightsPlus flightsPlus4 = new FlightsPlus();

//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//        Date date = new Date(System.currentTimeMillis());
//        System.out.println(sdf.format(date));
//        String date = "20180520";
//        flightsPlus4.setDate_start(date);
//        flightsPlus4.setDate_end(date);
//        List<FlightsPlus> ZBAAcrudResult = crudService.findFlight();
//        JSON.toJSONString(array, SerializerFeature.DisableCircularReferenceDetect);
        for (int i = 0; i < 5; i++) {
            array.add(obj);
        }
        for (int i = 0; i < 5; i++) {
            array.add(obj1);
        }
        for (int i = 0; i < 7; i++) {
            array.add(obj2);
        }
        for (int i = 0; i < 10; i++) {
            array.add(obj3);
        }
        array.add(obj);
        String delayarr = "";
        Integer ZBAAgrade0 = 0, ZBAAgrade1 = 0, ZBAAgrade2 = 0, ZBAAgrade3 = 0;
        Integer ZBADgrade0 = 0, ZBADgrade1 = 0, ZBADgrade2 = 0, ZBADgrade3 = 0;
        Integer ZBTJgrade0 = 0, ZBTJgrade1 = 0, ZBTJgrade2 = 0, ZBTJgrade3 = 0;
        Integer ZBSJgrade0 = 0, ZBSJgrade1 = 0, ZBSJgrade2 = 0, ZBSJgrade3 = 0;
//        统计延误航班量
        for (int i = 0; i < array.size(); i++) {

            JSONObject object = array.getJSONObject(i);
//            System.out.println(object);
            int grade = Integer.parseInt(valueOf(object.get("grade")));
            if (object.get("originairport") == "北京") {
                switch (grade) {
                    case 0:
                        ZBAAgrade0++;
                        break;
                    case 1:
                        ZBAAgrade1++;
                        break;
                    case 2:
                        ZBAAgrade2++;
                        break;
                    case 3:
                        ZBAAgrade3++;
                }
            } else if (object.get("originairport") == "大兴") {
                switch (grade) {
                    case 0:
                        ZBADgrade0++;
                        break;
                    case 1:
                        ZBADgrade1++;
                        break;
                    case 2:
                        ZBADgrade2++;
                        break;
                    case 3:
                        ZBADgrade3++;
                }
            } else if (object.get("originairport") == "天津") {
                switch (grade) {
                    case 0:
                        ZBTJgrade0++;
                        break;
                    case 1:
                        ZBTJgrade1++;
                        break;
                    case 2:
                        ZBTJgrade2++;
                        break;
                    case 3:
                        ZBTJgrade3++;
                }
            } else if (object.get("originairport") == "石家庄") {
                switch (grade) {
                    case 0:
                        ZBSJgrade0++;
                        break;
                    case 1:
                        ZBSJgrade1++;
                        break;
                    case 2:
                        ZBSJgrade2++;
                        break;
                    case 3:
                        ZBSJgrade3++;
                }
            }
        }
//        System.out.println(ZBSJgrade0);
        delayarr += ZBAAgrade0 + "," + ZBAAgrade1 + "," + ZBAAgrade2 + "," + ZBAAgrade3 + ","
                + ZBADgrade0 + "," + ZBADgrade1 + "," + ZBADgrade2 + "," + ZBADgrade3 + ","
                + ZBTJgrade0 + "," + ZBTJgrade1 + "," + ZBTJgrade2 + "," + ZBTJgrade3 + ","
                + ZBSJgrade0 + "," + ZBSJgrade1 + "," + ZBSJgrade2 + "," + ZBSJgrade3;
//        System.out.println('1');
        String str = "{\"delayflight\":" + "\"" + delayarr + "\"" + "}";
//        System.out.println(str);
        JSONObject delaynumber = JSONObject.parseObject(str);
//        System.out.println('3');
        array.add(delaynumber);
//        System.out.println(delayarr);
//        System.out.println(flightsPlus);
////        System.out.println(obj);
////        System.out.println(obj1);
        System.out.println(array);

        return array;
    }

    @RequestMapping("/getPredict")
    public String getPredict(){
        List<predictClass> predictAll = predictSerivice.getPredictAll();
        return null;
    }

    @RequestMapping("/getAjaxPredict")
    @ResponseBody
    public JSONArray getAjaxPredict(){
        List<predictClass> predictAll = predictSerivice.getPredictAll();
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(predictAll));
        System.out.println(array);
        return array;
    }
    public void getMassage(){

    }

    @Autowired
    private Rservice rservice;

    @RequestMapping("/findDelayFlight")
    public String findDelayFlight(Hflight hflight, Model model){
        System.out.println("findDelayFlight执行了");
        System.out.println(hflight);
        // 因为jsp输入项为空时赋值为""，而在dao中判断时要用null
        if ((!hflight.getFlight_season().equals(""))||(!hflight.getOrigin_airport().equals("")))
        {
            if (hflight.getFlight_season().equals("all")) {
                hflight.setFlight_season(null);
            }
            if (hflight.getOrigin_airport().equals("all")) {
                hflight.setOrigin_airport(null);
            }
            if (hflight.getDelay_level().equals("all")) {
                hflight.setDelay_level(null);
            }
            System.out.println(hflight);
            List <Hflight> RserviceHflight = rservice.findHflight(hflight);
            model.addAttribute("hflights", RserviceHflight);
        }

        //重定向页面
        return "redirect:/Flight_adjustment.jsp";
    }
}
