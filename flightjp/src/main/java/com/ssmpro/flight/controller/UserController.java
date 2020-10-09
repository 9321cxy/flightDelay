package com.ssmpro.flight.controller;

import com.ssmpro.flight.domain.Result;
import com.ssmpro.flight.domain.User;
import com.ssmpro.flight.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 注册
     *
     * @param user 参数封装
     * @return Result
     */
    @RequestMapping(value = "/regist")
    public String regist(User user, HttpSession session) {
        Result regist = userService.regist(user);
        session.setAttribute("loginUser", user.getUsername());
        if (regist.isSuccess()) {
            return "redirect:/testlogin.html";
        } else {
            return "redirect:/regist.html";
        }
    }

    /**
     * 登录
     *
     * @param user 参数封装
     * @return Result
     */
    @RequestMapping(value = "/login")
    public String login(User user, HttpSession session) {
        Result login = userService.login(user);
        System.out.println(user.getUsername());
        if (login.isSuccess()) {
            if (user.getUsername() != null) {
                session.setAttribute("loginUser", user.getUsername());
            }
            return "redirect:/index.html";
        } else {
            return "redirect:/testlogin.html";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getmassage")
    public String getloginmassege(HttpServletRequest request) {
        Object loginUser = request.getSession().getAttribute("loginUser");
        if (loginUser !=null) {
            return loginUser.toString();
        }else {
            return "请登录";
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        return "redirect:/testlogin.html";
    }
}

