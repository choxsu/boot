package com.choxsu.common.schedule;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.concurrent.*;

/**
 * 单例 线程超时队列
 *
 * @author choxsu
 * @date 2019/7/15
 */
@Slf4j
public class TaskSchedule {

    private static final ScheduledExecutorService scheduledExecutor = Executors.newSingleThreadScheduledExecutor();
    private static final Map<String, Object> runnableList = new ConcurrentHashMap<>(16);
    private static final TaskSchedule me = new TaskSchedule();

    private TaskSchedule() {
    }

    /**
     * 将超时任务给超时队列执行
     *
     * @param key      当前任务key , 需要唯一，  可以用业务单号等信息来做key
     * @param time     过期倒计时   单位秒
     * @param runnable 执行的任务
     */
    public void add(String key, long time, Runnable runnable) {
        if (key == null) {
            throw new NullPointerException("key cannot be null");
        }
        if (runnableList.containsKey(key)) {
            log.warn("key : {} already exists in the list of runnable queues", key);
            return;
        }
        runnableList.put(key, runnable);
        scheduledExecutor.schedule(runnable, time, TimeUnit.SECONDS);
    }

    /**
     * 关闭线程池
     */
    public void stop() {
        if (scheduledExecutor != null) {
            scheduledExecutor.shutdown();
        }
    }

    public static TaskSchedule getInstance() {
        return me;
    }

    public static void main(String[] args) throws InterruptedException {
        for (int i = 0; i < 5; i++) {
            me.add("1" + i, 1, () -> log.info("1秒后发送短信"));
        }
        me.add("2", 2, () -> log.info("2秒后处理订单"));
        me.add("3", 3, () -> log.info("3秒后订单超时"));
        Thread.sleep(1000);
        me.add("4", 4, () -> log.info("5等前面的执行完我再执行"));
        me.stop();
        System.out.println("RUNNABLE_LIST.size() = " + runnableList.size());
    }

}
