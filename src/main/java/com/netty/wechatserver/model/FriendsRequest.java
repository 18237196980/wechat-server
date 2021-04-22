package com.netty.wechatserver.model;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2021-04-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("friends_request")
public class FriendsRequest implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String send_user_id;

    private String accept_user_id;

    /**
     * 发送请求的事件
     */
    private LocalDateTime request_date_time;


}
