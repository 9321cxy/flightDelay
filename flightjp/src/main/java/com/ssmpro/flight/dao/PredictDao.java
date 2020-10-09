package com.ssmpro.flight.dao;

import com.ssmpro.flight.domain.predictClass;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PredictDao {
    //    插入数据到数据库
    @Insert("insert into predict(Grade,Height,FlightNumber,CRSArrTime,TailNumber,DestAirport,OriginAirport,CRSDepTime,AircraftType,TaskType,Date,Speed,Status,predictClass) value(#{grade},#{height},#{flightnumber},#{crsarrTime},#{tailnumber},#{destairport},#{originairport},#{crsdepTime},#{aircrafttype},#{tasktype},#{date},#{speed},#{status},#{predictClass})")
    public void insertPredict(predictClass predictClass);
    //    从数据库获取数据
    @Select("select * from predict")
    public List<predictClass> getPredictAll();
}
