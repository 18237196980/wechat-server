package com.netty.wechatserver.controller;


import com.ex.framework.data.IDUtils;
import com.ex.framework.data.Result;
import com.ex.framework.util.security.Md5;
import com.netty.wechatserver.model.Users;
import com.netty.wechatserver.service.UsersService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author
 * @since 2021-04-22
 */
@RestController
@RequestMapping("/user")
public class UsersController {

    @Autowired
    UsersService usersService;

    @PostMapping("loginOrReg")
    public Result loginOrReg(@RequestBody Users user) {
        if (StringUtils.isEmpty(user.getUsername())) {
            return Result.error("用户名不能为空");
        }

        if (StringUtils.isEmpty(user.getPassword())) {
            return Result.error("密码不能为空");
        }

        Users model = usersService.getByUsername(user.getUsername());
        String e_pwd = Md5.encode(user.getPassword());
        if (model != null) {
            // 登陆，验证密码
            if (StringUtils.equals(e_pwd, model.getPassword())) {
                return Result.success(model);
            } else {
                return Result.error("密码错误");
            }
        } else {
            // 注册
            Users users = new Users();
            users.setId(IDUtils.getSequenceStr());
            users.setUsername(user.getUsername());
            users.setPassword(e_pwd);
            users.setFace_image("aa");
            users.setFace_image_big("big_aa");
            usersService.add(users);

            return Result.success(users);
        }
    }
}
