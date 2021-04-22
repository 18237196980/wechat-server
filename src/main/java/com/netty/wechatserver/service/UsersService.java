package com.netty.wechatserver.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ex.framework.base.BaseCRUDService;
import com.netty.wechatserver.mapper.UsersMapper;
import com.netty.wechatserver.model.Users;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author
 * @since 2021-04-22
 */
@Service
public class UsersService extends BaseCRUDService<UsersMapper, Users> {

    // 根据用户名查询用户
    public Users getByUsername(String username) {
        QueryWrapper<Users> queryWrapper = new QueryWrapper<>();
        QueryWrapper<Users> wrapper = queryWrapper.eq("username", username);
        return get(wrapper);
    }
}
