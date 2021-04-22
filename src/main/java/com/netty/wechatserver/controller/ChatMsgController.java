package com.netty.wechatserver.controller;


import com.ex.framework.data.Result;
import com.netty.wechatserver.model.ChatMsg;
import com.netty.wechatserver.service.ChatMsgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author
 * @since 2021-04-22
 */
@Api(tags = "聊天信息")
@RestController
@RequestMapping("/chat")
public class ChatMsgController {

    @Autowired
    ChatMsgService chatMsgService;

    @PostMapping("test")
    @ApiOperation("聊天信息测试")
    public Result chat() {
        List<ChatMsg> list = chatMsgService.list();
        return Result.success(list);
    }

}
