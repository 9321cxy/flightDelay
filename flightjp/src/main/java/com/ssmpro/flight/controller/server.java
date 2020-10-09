package com.ssmpro.flight.controller;


import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class server {
    private static final int Port = 8087;
    private static Object UTF_8;

    public static void main(String[] args) {
        String line;
        try {
            ServerSocket ss = new ServerSocket(Port);
            Socket socket = ss.accept();
//            获取socket输入流
            InputStream is = socket.getInputStream();
            int size = is.available();
            if(size==0){
                System.out.println("空值");
            }
            System.out.println(is);
            InputStreamReader iss = new InputStreamReader(is);
            BufferedReader buff = new BufferedReader(iss);
            System.out.println(buff);
            while ((line = buff.readLine())!=null){
                System.out.println(line);
            }
//            FileOutputStream fos = new FileOutputStream("D:\\receive.csv");

//            fos.flush();
//            返回数据
            OutputStream os = socket.getOutputStream();
            os.write("上传成功".getBytes());
//            关闭socket
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
