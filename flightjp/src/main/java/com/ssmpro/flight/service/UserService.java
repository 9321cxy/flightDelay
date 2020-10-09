package com.ssmpro.flight.service;

import com.ssmpro.flight.domain.Result;
import com.ssmpro.flight.domain.User;

public interface UserService {
    public Result regist(User user);
    public Result login(User user);
}
