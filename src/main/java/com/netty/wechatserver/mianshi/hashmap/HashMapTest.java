package com.netty.wechatserver.mianshi.hashmap;

import java.util.HashMap;

public class HashMapTest {
    public static void main(String[] args) {
        HashMap<Object, Object> map = new HashMap<>();

        map.put(5, "16");
        map.put(4, "3");

        for (Object o : map.keySet()) {
            System.out.println(o + "  " + map.get(o));
        }

    }
}
