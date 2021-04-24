package com.netty.wechatserver.mianshi.hashmap;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义1.7版本的hashmap,数组+链表（get时需循环N次，时间复杂度o(n)）
 */
public class MyHashMap<K, V> {

    List<HashEntry> list = new ArrayList<>(); // 本质也是数组

    class HashEntry<K, V> {
        private K k;
        private V v;

        public HashEntry(K k, V v) {
            this.k = k;
            this.v = v;
        }
    }

    public void put(K k, V v) {
        HashEntry<K, V> entry = new HashEntry<>(k, v);
        list.add(entry);
    }

    public Object get(K k) {
        // 循环N次，时间复杂度o(n)
        for (HashEntry hashEntry : list) {
            if (k.equals(hashEntry.k)) {
                return hashEntry.v;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        MyHashMap<String, Object> map = new MyHashMap<>();
        map.put("id", 1234);

        Object id = map.get("id");
        System.out.println(id);
    }
}
