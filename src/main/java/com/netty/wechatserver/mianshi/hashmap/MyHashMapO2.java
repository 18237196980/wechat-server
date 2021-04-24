package com.netty.wechatserver.mianshi.hashmap;

/**
 * 自定义1.7版本的hashmap,数组+链表（下表获取v，时间复杂度o(1),主要解决hash碰撞问题）
 */
public class MyHashMapO2<K, V> {

    HashEntry[] hashEntries = new HashEntry[10000];

    class HashEntry<K, V> {
        private K k;
        private V v;
        private HashEntry next;

        public HashEntry(K k, V v) {
            this.k = k;
            this.v = v;
        }
    }

    /**
     * map.put("a", 1);
     * map.put(97, 2);
     * <p>
     * 以前两个只能put进去一个，原因是产生了hash碰撞
     * 现在可以全部都可以插入
     * 两个在一个链表上，next关联，是单向链表
     *
     * @param k
     * @param v
     */
    public void put(K k, V v) {
        int index = k.hashCode() % hashEntries.length;
        HashEntry<K, V> entry = new HashEntry<>(k, v);

        HashEntry oldEntry = hashEntries[index];
        if (oldEntry == null) {
            // 可以添加
            hashEntries[index] = entry;
        } else {
            // 尾插法
            oldEntry.next = entry;
        }
    }

    /**
     * 循环单链表，获取指定v
     *
     * @param k
     * @return
     */
    public V get(K k) {
        // 直接通过key.hashcode()获取在数组中的下标，时间复杂度o(1)
        int index = k.hashCode() % hashEntries.length;
        System.out.println("index：" + index);

        /**
         * 循环链表for (HashEntry<K, V> entry = hashEntries[index]; entry != null; entry = entry.next)
         */
        for (HashEntry<K, V> entry = hashEntries[index]; entry != null; entry = entry.next) {
            if (entry.k.equals(k) || entry.k == k) {
                System.out.println("对比成功");
                return entry.v;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        MyHashMapO2<Object, Object> map = new MyHashMapO2<>();

        map.put("a", 1);
        map.put(97, 2);

        Object id = map.get(97);
        System.out.println("结果:" + id);


    }
}
