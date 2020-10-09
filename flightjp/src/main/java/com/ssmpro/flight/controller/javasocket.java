package com.ssmpro.flight.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.ssmpro.flight.service.predictSerivice;
import com.ssmpro.flight.domain.predictClass;
import com.ssmpro.flight.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.InternetAddressEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.lang.reflect.Array;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping("/filetransfor")
@SessionAttributes("Result")
public class javasocket {
    @Autowired
    private predictSerivice predictSerivice;
    private static final int PORT = 8088;

    @RequestMapping("/fileupload")
    public void fileupload(MultipartFile upload, Model model) throws IOException, InterruptedException {
//        String python_enviroment = "C:\\Users\\dell\\AppData\\Local\\conda\\conda\\envs\\tensorflow1.0-py2.7\\python.exe";
//        String PyhonFile = "D:\\idea_pycharm_projects\\HPCliqueNet\\socket\\pysocket.py";

        InetAddress inetAddress = InetAddress.getLocalHost();
        String IP = inetAddress.getHostAddress();
        String line;
        System.out.println("文件读取了");
        int length = 0;
        int size = 0;
//          开启算法进程
//        Process process = Runtime.getRuntime().exec(python_enviroment + " " + PyhonFile);
        try {

//        获取socket套接字
            Socket socket = new Socket(IP, PORT);
            System.out.println(socket);
//        获取上传文件输入流供给缓存区,使用一次后会被释放！！！！！！！！！
            InputStream webfile = upload.getInputStream();

//        供给socket的输出流
            OutputStream os = socket.getOutputStream();

//        获取上传文件并存入buffer缓存区
//            ByteArrayInputStream byteArrayInputStream = (ByteArrayInputStream) upload.getInputStream();
//            InputStreamReader inputStreamReader = new InputStreamReader(byteArrayInputStream);
//            BufferedReader br = new BufferedReader(inputStreamReader);
//            System.out.println(br);
//        打印上传内容
//            while ((line = br.readLine()) != null) {
//                System.out.println(line);
//            }
//            br.close();

//        指定上传每段字节大小1M
            byte[] bytes = new byte[1024];
            while ((length = webfile.read(bytes)) != -1) {
                os.write(bytes, 0, length);
                System.out.println("文件上传");
                size++;                                 //估计上传文件大小
            }
            System.out.println(size + "kb");
            socket.shutdownOutput();

//-----------------------------------------//
//        读取响应数据
            InputStream is = socket.getInputStream();
            InputStreamReader iss = new InputStreamReader(is);
            BufferedReader buff = new BufferedReader(iss);

//            按行输出响应数据
//            int re = process.waitFor();
//            System.out.println("--------------");
//            System.out.println(re);
//            System.out.println("--------------");

            System.out.println("响应数据");
            String result = "";
            while ((line = buff.readLine()) != null) {
                System.out.println(line);
                result += line;
            }
            String substring = result.substring(result.indexOf("[") + 1, result.indexOf("]"));
            System.out.println(substring);
            String[] split = substring.split("\\s+");
            int len = split.length;
            String[] newsplit = new String[len + 1];
            newsplit[0] = "predictClass";
            while ((len) != 0) {
                newsplit[len] = split[len - 1];
                len--;
            }
            //-----------------------将输入输出拼接转为json格式--------------------//
            BufferedReader webreader = new BufferedReader(new InputStreamReader(upload.getInputStream()));
            List<List<String>> strs = new ArrayList<List<String>>();
            int i = 0;
            while ((line = webreader.readLine()) != null) {
                line += "," + newsplit[i];
                i++;
                strs.add(Arrays.asList(line.split(",")));
            }
            JSONArray jsonArray = toJsonArray(strs);
            List<predictClass> predictClasses = jsonArray.toJavaList(predictClass.class);
            for (predictClass predictClass : predictClasses) {
                predictSerivice.insertPredict(predictClass);
            }
//            JSONArray array = (JSONArray) JSONArray.toJSON(strs);
//            String json = array.toJSONString().replace("[","{").replace("]","}");
////            String json  = JSON.toJSONString(array);
////            List<predictClass> predictClasses = JSON.parseObject(json, new TypeReference<List<predictClass>>(){});
//            List<predictClass> predictClasses = JSON.parseArray("["+json.substring(1,json.length()-1)+"]", predictClass.class);
//            System.out.println(predictClasses);
            //-----------------------process接受数据--------------------//
//            String results = null;
//            BufferedReader in =new BufferedReader(new InputStreamReader(process.getInputStream()));
//            while ((line=in.readLine())!=null){
//                results = results + line + "\n";
//            }
//            System.out.println(results);


//            关闭流与socket
            socket.close();
//            in.close();

        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private JSONArray toJsonArray(List<List<String>> strs) {

        JSONArray array = new JSONArray();

        for (int i = 1; i < strs.size(); i++) {

            JSONObject object = new JSONObject();

            for (int j = 0; j < strs.get(0).size(); j++) {

                object.put(strs.get(0).get(j), strs.get(i).get(j));

            }

            array.add(object);

        }

        return array;

    }
}
