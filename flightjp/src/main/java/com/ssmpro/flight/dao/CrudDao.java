package com.ssmpro.flight.dao;

import com.ssmpro.flight.domain.AnnalysisBean;
import com.ssmpro.flight.domain.DayAnalysis;
import com.ssmpro.flight.domain.FlightsPlus;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CrudDao {
    //    增加航班
//    @Insert("INSERT INTO jingjinji() value(#{})")
    public void saveFlight(FlightsPlus flight);

    //    修改航班
    public void updateFlight(FlightsPlus flight);

    //    删除航班
//    @Delete("DELETE FROM jingjinji WHERE flightnumber = #{flightnumber}")
    public void delFlight(FlightsPlus flight);

    @Select("select * from jingjinji")
    public List<FlightsPlus> findAll();

    //    查找航班
    @Select({
            "<script>",
            "select * from jingjinji_delayminutes",
            "<where>",
            "<if test='date_start != null'>",
            "and date >= #{date_start}",
            "</if>",
            "<if test='date_end !=null'>",
            "and #{date_end} >= date",
            "</if>",
            "<if test='flightnumber!=null'>",
            "and flightnumber like #{flightnumber}",
            "</if>",
            "<if test='originairport!=null'>",
            "and originairport = #{originairport}",
            "</if>",
            "</where>",
            "</script>"})
    public List<FlightsPlus> findFlight(FlightsPlus flight);

    //    按机场条件查询数量
    @Select("select count(*) from jingjinji_data where originairport = #{originairport} and date >= #{date_start} and date <= #{date_end} ")
    public Integer findAirportCount(FlightsPlus flght);
    //    按航班条件查询数量
    @Select("select count(*) from jingjinji_data where flightnumber = #{flightnumber} and date >= #{date_start} and date <= #{date_end}")
    public Integer findFlightCount(FlightsPlus flght);

    //    按机场条件统计延误总和
    @Select("select sum(TIME_TO_SEC(arrdelay))as arrDelay,originairport,count(*)as delayCounts from jingjinji_data where originairport = #{originairport} and date >= #{date_start} and date <= #{date_end} and arrdelay > 15")
    public AnnalysisBean sumAirportCount(FlightsPlus flght);

    //    按航班号条件统计延误总和
    @Select("select sum(TIME_TO_SEC(arrdelay))as arrDelay,flightnumber,count(*)as delayCounts from jingjinji_data where flightnumber = #{flightnumber} and date >= #{date_start} and date <= #{date_end} and arrdelay > 15")
    public AnnalysisBean sumFlightCount(AnnalysisBean flght);

//    获取字段内不重复记录
    @Select("select distinct(flightnumber) from jingjinji")
    public List<String> findflightnumber();

//    起飞日延误统计，包括：机场，时段，延误架次，总架次，延误率，延误等级0-4的统计
    @Insert("Insert into delayanalysis(" +
            "date,airport,time,depCount,depDelay,depDelayRate,depDelayTime," +
            "grade0Count,grade1Count,grade2Count,grade3Count,grade4Count) " +
            "SELECT #{date},#{airport}, #{time},count(*),sum(if((DepDelay>15),1,0)) ," +
            "ROUND(sum(if((DepDelay>15),1,0))/count(*)*100,2),sum(DepDelay),sum(if((DepDelay<=15),1,0))," +
            "sum(if((DepDelay>15 and DepDelay<=30),1,0)),sum(if((DepDelay>30 and DepDelay<=60),1,0))," +
            "sum(if((DepDelay>60 and DepDelay<=120),1,0)),sum(if((DepDelay>120),1,0)) " +
            "FROM jingjinji_data where " +
            "Date =#{date} and OriginAirport = #{airport} and ACDepTime>#{time}*10000 and ACDepTime<#{time}*10000+10000 and ACDepTime is not null")
    public void InsertOriginDayAnalysis(DayAnalysis dayAnalysis);

    //    降落日延误统计，包括：机场，时段，延误架次，总架次，延误率，延误等级0-4的统计
    @Update("UPDATE delayanalysis AS a INNER JOIN(SELECT Date,DestAirport, count(*)AS arrCount,sum(if((ArrDelay>15),1,0))AS arrDelay," +
            "ROUND(sum(if((ArrDelay>15),1,0))/count(*)*100,2) AS arrDelayRate,sum(ArrDelay) AS arrDelayTime,sum(if((ArrDelay<=15),1,0)) AS arrGrade0Count," +
            "sum(if((DepDelay>15 and DepDelay<=30),1,0)) AS arrGrade1Count,sum(if((DepDelay>30 and DepDelay<=60),1,0)) AS arrGrade2Count," +
            "sum(if((DepDelay>60 and DepDelay<=120),1,0)) AS arrGrade3Count,sum(if((DepDelay>120),1,0)) AS arrGrade4Count " +
            "FROM jingjinji_data WHERE DestAirport = #{airport} AND Date = #{date} AND ACArrtime > #{time}*10000 AND ACArrtime < #{time}*10000+10000) b on a.date = b.Date " +
            "AND a.airport = b.DestAirport AND a.time =#{time} SET a.arrCount = b.arrCount,a.arrDelay = b.arrDelay,a.arrDelayRate =b.arrDelayRate," +
            "a.arrDelayTime = b.arrDelayTime,a.arrGrade0Count=b.arrGrade0Count,a.arrGrade1Count=b.arrGrade1Count,a.arrGrade2Count=b.arrGrade2Count," +
            "a.arrGrade3Count=b.arrGrade3Count,a.arrGrade4Count=b.arrGrade4Count")
    public void InsertArrDayAnalysis(DayAnalysis dayAnalysis);

    //获取起飞日延误信息
    @Select("Select #{date} as date, #{airport} as airport, sum(depCount) as depCount,sum(depDelay) as depDelay,CONCAT(ROUND(sum(depDelayRate)/count(depDelayRate),2),'%') as depDelayRate," +
            "format(sum(depDelayTime/depCount)/count(depDelayTime),2) as depDelayTime," +
            "max(depDelay) as maxDelay from delayanalysis where date = #{date} and airport = #{airport}")
    public DayAnalysis getDayAnalysis(DayAnalysis dayAnalysis);

    //获取降落日延误信息
    @Select("Select #{date} as date, #{airport} as airport, sum(arrCount) as arrCount,sum(arrDelay) as arrDelay,CONCAT(ROUND(sum(arrDelayRate)/count(arrDelayRate),2),'%') as arrDelayRate," +
            "format(sum(arrDelayTime/arrCount)/count(arrDelayTime),2) as arrDelayTime," +
            "max(arrDelay) as maxDelay from delayanalysis where date = #{date} and airport = #{airport}")
    public DayAnalysis getArrDayAnalysis(DayAnalysis dayAnalysis);


    //获取起飞日延误中最大延误所对应的时段
    @Select("select time from delayanalysis where depDelay = (SELECT max(depDelay) FROM jingjinji.delayanalysis where date = #{date} and airport = #{airport}) and date = #{date} and airport = #{airport}")
    public List<String> getDayAnalysisTime(DayAnalysis dayAnalysis);

    //获取降落日延误中最大延误所对应的时段
    @Select("select time from delayanalysis where arrDelay = (SELECT max(arrDelay) FROM jingjinji.delayanalysis where date = #{date} and airport = #{airport}) and date = #{date} and airport = #{airport}")
    public List<String> getArrDayAnalysisTime(DayAnalysis dayAnalysis);



    //获取日起飞延误信息，各个时段延误统计
    @Select("Select #{date} as date, #{airport} as airport, depDelay as depDelay,time as time,grade0Count,grade1Count,grade2Count,grade3Count,grade4Count from delayanalysis where date = #{date} and airport = #{airport}")
    public List<DayAnalysis> getDayAnalysisTimeList(DayAnalysis dayAnalysis);

    //获取日降落延误信息，各个时段延误统计
    @Select("Select #{date} as date, #{airport} as airport, arrDelay as arrDelay,time as time,arrGrade0Count,arrGrade1Count,arrGrade2Count,arrGrade3Count,arrGrade4Count from delayanalysis where date = #{date} and airport = #{airport}")
    public List<DayAnalysis> getArrDayAnalysisTimeList(DayAnalysis dayAnalysis);


    //起飞延误的计算，用实际起飞时间减去计划起飞时间/60获得延误分钟
    @Update("UPDATE jingjinji_data AS a INNER JOIN (" +
            "SELECT id,(TIME_TO_SEC(ACDepTime)-TIME_TO_SEC(CRSDepTime)) DIV 60 AS depDelay FROM jingjinji_data " +
            ")b ON a.id = b.id SET a.DepDelay = b.depDelay")
    public void analysisDepdelay();

    //降落延误的计算，用实际起飞时间减去计划起飞时间/60获得延误分钟
    @Update("UPDATE jingjinji_data AS a INNER JOIN (" +
            "SELECT id,(TIME_TO_SEC(ACArrTime)-TIME_TO_SEC(CRSArrTime)) DIV 60 AS arrDelay FROM jingjinji_data " +
            ")b ON a.id = b.id SET a.ArrDelay = b.arrDelay")
    public void analysisdelay();

    //整理跨天起飞航班延误分钟，跨天需要加1440分钟
    @Update("UPDATE jingjinji_data AS a INNER JOIN(SELECT id , (DepDelay+1440) AS depDelay FROM jingjinji_data WHERE DepDelay<-720) b ON a.id = b.id SET a.DepDelay = b.depDelay")
    public void correctDepdelay();

    //整理跨天降落航班延误分钟，跨天需要加1440分钟
    @Update("UPDATE jingjinji_data AS a INNER JOIN(SELECT id , (ArrDelay+1440) AS arrDelay FROM jingjinji_data WHERE ArrDelay<-720) b ON a.id = b.id SET a.ArrDelay = b.arrDelay")
    public void correctArrdelay();

}
