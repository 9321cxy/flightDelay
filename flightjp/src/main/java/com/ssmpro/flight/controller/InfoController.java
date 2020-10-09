package com.ssmpro.flight.controller;

import com.alibaba.fastjson.JSON;
import com.ssmpro.flight.domain.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * @author jup
 * @create 2020/4/13-21:56
 */
@Controller
@RequestMapping("/Info")
//把数据存入session域中
@SessionAttributes(value = {"title", "flight_data","pie","h_column", "v_column"})
public class InfoController {

    //获取计算机IP
    InetAddress ia = InetAddress.getLocalHost();
    String IP= ia.getHostAddress();
    //指定通信端口
    private static final int PORT = 8088;
    public InfoController() throws UnknownHostException {
    }

    @RequestMapping("/information")
    public String information(Info info, Model model){
        System.out.println("提交了信息");
        System.out.println(info);

        //优化后的表头数据
        Title title = new Title();
        title.setSeason(transform.change(info.getSeason(),info.getAirport())[0]);
        title.setAirport(transform.change(info.getSeason(),info.getAirport())[1]);

        //把前端提交的信息转化为json字符串
        String json= JSON.toJSONString(info);
        System.out.println("发送的json字符串为");
        System.out.println(json);

        //字符串变量存储输入流信息
        StringBuilder message = new StringBuilder();

        //建立socket通信，将前端数据传至python算法
        try {
            Socket socket = new Socket(IP, PORT);

            //获取输出流，向python端发送信息
            OutputStream os=socket.getOutputStream();//字节输出流
            PrintWriter pw=new PrintWriter(os);//将输出流包装为打印流
            pw.write(json);
            pw.flush();
            socket.shutdownOutput();//关闭输出流

            //获取输入流，接收来自python的信息
            InputStream is=socket.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
            String infomation=null;
            while((infomation=in.readLine())!=null){
                message.append(infomation);
                System.out.println("这里是后台，接收到的来自Python信息为："+infomation);
            }
            is.close();
            in.close();
            socket.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //解析json字符串message，取出所需信息
        JSONObject jsonObject = new JSONObject(message.toString());
        JSONArray flight_data = jsonObject.getJSONArray("flight_data");
        JSONArray pie_data = jsonObject.getJSONArray("pie");
        JSONArray h_column_data = jsonObject.getJSONArray("h_column");
        JSONArray v_column_data = jsonObject.getJSONArray("v_column");

        //创建list，用于存储航班信息
        List <Oflight> list = new ArrayList<>();
        //将JSONArray中的航班信息转存到list中
        assert flight_data != null;
        if(flight_data.length()!=0){
            for(int i=0;i<flight_data.length();i++){
                Oflight oflight = new Oflight();
                oflight.setFlight_number(flight_data.getJSONObject(i).getString("flight_number"));
                oflight.setDep_time(flight_data.getJSONObject(i).getString("dep_time"));
                oflight.setOrigin_airport(flight_data.getJSONObject(i).getString("origin_airport"));
                oflight.setArr_time(flight_data.getJSONObject(i).getString("arr_time"));
                oflight.setDest_airport(flight_data.getJSONObject(i).getString("dest_airport"));
                oflight.setGrade(flight_data.getJSONObject(i).getString("grade"));
                oflight.setHeight(flight_data.getJSONObject(i).getString("height"));
                oflight.setAircraft_type(flight_data.getJSONObject(i).getString("aircraft_type"));
                oflight.setTask_type(flight_data.getJSONObject(i).getString("task_type"));
                oflight.setSpeed(flight_data.getJSONObject(i).getString("speed"));
                oflight.setEstimate_delay_level(flight_data.getJSONObject(i).getInt("estimate_delay_level"));
                list.add(oflight);
            }
        }

        //数组存储图表数据（饼图）
        Pie [] pie = new Pie[2];
        for(int i=0;i<pie.length;i++){
            pie[i] = new Pie();
            pie[i].setNo_delay(pie_data.getJSONObject(i).getInt("no_delay"));
            pie[i].setLight_delay(pie_data.getJSONObject(i).getInt("light_delay"));
            pie[i].setModerate_delay(pie_data.getJSONObject(i).getInt("moderate_delay"));
            pie[i].setSerious_delay(pie_data.getJSONObject(i).getInt("serious_delay"));
            pie[i].setSevere_delay(pie_data.getJSONObject(i).getInt("severe_delay"));
        }

        //数组存储图表数据（横向柱状图）
        Column [] h_column = new Column[2];
        for(int j=0;j<h_column.length;j++){
            h_column[j] = new Column();
            h_column[j].setJingjinji(h_column_data.getJSONObject(j).getFloat("jingjinji"));
            h_column[j].setBeijing_shoudu(h_column_data.getJSONObject(j).getFloat("beijing_shoudu"));
            h_column[j].setBeijing_nanyuan(h_column_data.getJSONObject(j).getFloat("beijing_nanyuan"));
            h_column[j].setTianjin(h_column_data.getJSONObject(j).getFloat("tianjin"));
            h_column[j].setShijiazhuang(h_column_data.getJSONObject(j).getFloat("shijiazhuang"));
        }

        //数组存储图表数据（纵向柱状图）
        Column [] v_column = new Column[2];
        for(int k=0;k<h_column.length;k++){
            v_column[k] = new Column();
            v_column[k].setJingjinji(v_column_data.getJSONObject(k).getFloat("jingjinji"));
            v_column[k].setBeijing_shoudu(v_column_data.getJSONObject(k).getFloat("beijing_shoudu"));
            v_column[k].setBeijing_nanyuan(v_column_data.getJSONObject(k).getFloat("beijing_nanyuan"));
            v_column[k].setTianjin(v_column_data.getJSONObject(k).getFloat("tianjin"));
            v_column[k].setShijiazhuang(v_column_data.getJSONObject(k).getFloat("shijiazhuang"));
        }

        //model对象
        model.addAttribute("title",title);
        model.addAttribute("flight_data",list);
        model.addAttribute("pie",pie);
        model.addAttribute("h_column",h_column);
        model.addAttribute("v_column",v_column);

        //页面重定向，打开优化返回界面
//        return "redirect:/FDOreturn.jsp";
        return "redirect:/test.jsp";
    }
}





