package com.netty.wechatserver.mianshi.hashmap;

/**
 * 自定义1.7版本的hashmap,数组+链表（下表获取v，时间复杂度o(1),会出现hash碰撞问题）
 */
public class MyHashMapO1<K, V> {

    HashEntry[] hashEntries = new HashEntry[10000];

    class HashEntry<K, V> {
        private K k;
        private V v;

        public HashEntry(K k, V v) {
            this.k = k;
            this.v = v;
        }
    }

    public void put(K k, V v) {
        int index = k.hashCode() % hashEntries.length;
        HashEntry<K, V> entry = new HashEntry<>(k, v);
        hashEntries[index] = entry;
    }

    public V get(K k) {
        // 直接通过key.hashcode()获取在数组中的下标，时间复杂度o(1)
        int index = k.hashCode() % hashEntries.length;
        System.out.println("index：" + index);
        return (V) hashEntries[index].v;
    }

    public static void main(String[] args) {
        MyHashMapO1<Object, Object> map = new MyHashMapO1<>();

        /**
         * map.put("a", 1);
         * map.put(97, 2);
         * 获取map.get("a")时打印2，结果被覆盖。
         *
         * 分析原因：“a”和97产生hash碰撞，导致结果被覆盖。
         * 需改造get方法(put也稍微改动)：通过key获取index，通过index下表获取产生hash碰撞的链表，
         * 循环链表，next能先获取下一个entry,循环中对比
         * 当前key和传入的key是否相等，相等则返回当前entry的v
         *
         * 改造见类 MyHashMapO2
         */

        map.put("a", 1);
        map.put(97, 2);

        Object id = map.get("a");
        System.out.println("结果:" + id);


    }
}
