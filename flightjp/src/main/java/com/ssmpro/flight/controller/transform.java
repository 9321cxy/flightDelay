package com.ssmpro.flight.controller;

/**
 * @author jup
 * @create 2020/7/25-10:08
 */
public class transform {
    public static String[] change(String flight_season, String origin_airport) {

        String flight_season_cn;
        String origin_airport_cn;
        String year;
        String season;
        String season_cn;

        //确定航季
        year = flight_season.substring(0,4);
        season = flight_season.substring(4);
        switch (season){
            case "summer":{
                season_cn = "夏秋航季";
                break;
            }
            case "winter":{
                season_cn = "冬春航季";
                break;
            }
            default:
                throw new IllegalStateException("Unexpected value: " + season);
        }
        flight_season_cn = year.concat(season_cn);

        //确定机场
        switch (origin_airport){

            case "ZBAA":{
                origin_airport_cn = "北京首都国际机场";
                break;
            }
            case "ZBAD":{
                origin_airport_cn = "北京大兴国际机场";
                break;
            }
            case "ZBNY":{
                origin_airport_cn = "北京南苑国际机场";
                break;
            }
            case "ZBTJ":{
                origin_airport_cn = "天津滨海国际机场";
                break;
            }
            case "ZBSJ":{
                origin_airport_cn = "石家庄正定国际机场";
                break;
            }
            case "ZBZJ":{
                origin_airport_cn = "张家口宁远机场";
                break;
            }
            case "ZBSN":{
                origin_airport_cn = "唐山三女河机场";
                break;
            }
            case "ZBHD":{
                origin_airport_cn = "邯郸机场";
                break;
            }
            case "ZBDH":{
                origin_airport_cn = "秦皇岛北戴河机场";
                break;
            }
            case "ZBCD":{
                origin_airport_cn = "承德普宁机场";
                break;
            }
            case "all":{
                origin_airport_cn = "京津冀机场群";
                break;
            }
            default:
                throw new IllegalStateException("Unexpected value: " + origin_airport);
        }

        //参数返回
        return new String[]{flight_season_cn, origin_airport_cn};
    }
}
