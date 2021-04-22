package com.netty.wechatserver.service;

import com.ex.framework.base.BaseCRUDService;
import com.netty.wechatserver.mapper.ChatMsgMapper;
import com.netty.wechatserver.model.ChatMsg;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2021-04-22
 */
@Service
public class ChatMsgService extends BaseCRUDService<ChatMsgMapper, ChatMsg> {

}
