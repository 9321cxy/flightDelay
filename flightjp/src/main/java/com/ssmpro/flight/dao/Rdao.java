package com.ssmpro.flight.dao;

import com.ssmpro.flight.domain.Hflight;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Rdao {
    //    查找航班
    @Select({
            "<script>",
            "select * from history_data",
            "<where>",
            //匹配航季
            "<if test='flight_season!=null'>",
            "and flight_season = #{flight_season}",
            "</if>",
            //匹配机场（单一机场）
            "<if test='origin_airport!=null'>",
            "and origin_airport = #{origin_airport}",
            "</if>",
            //匹配机场（京津冀机场群）
            "<if test='origin_airport == null'>",
            "and origin_airport like '%ZB%'",
            "</if>",
            //匹配延误等级
            "<if test='delay_level!=null'>",
            "and delay_level = #{delay_level}",
            "</if>",
            "</where>",
            "</script>"})
    public List<Hflight> findHflight(Hflight flight);
}
