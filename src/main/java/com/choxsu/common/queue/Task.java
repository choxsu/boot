package com.choxsu.common.queue;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * [任务调度系统]
 * <br>
 * [队列中要执行的任务]
 * </p>
 *
 * @author choxsu
 * @date 2019/7/15
 */
public class Task implements Delayed {

    /**
     * 过期时间 nanoTime
     */
    private long time;
    /**
     * 要做的业务
     */
    private Runnable runnable;

    Task(long time, Runnable runnable) {
        this.time = TimeUnit.NANOSECONDS.convert(time, TimeUnit.SECONDS) + System.nanoTime();
        this.runnable = runnable;
    }

    @Override
    public long getDelay(TimeUnit unit) {
        return this.time - System.nanoTime();
    }

    @Override
    public int compareTo(Delayed o) {
        return Long.compare(this.time, ((Task) o).time);
    }

    void run() {
        this.runnable.run();
    }

}
