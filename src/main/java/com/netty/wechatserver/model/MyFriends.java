package com.netty.wechatserver.model;

import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("my_friends")
public class MyFriends implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 用户id
     */
    private String my_user_id;

    /**
     * 用户的好友id
     */
    private String my_friend_user_id;


}
