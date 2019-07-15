package com.choxsu.common.queue;

import java.util.concurrent.DelayQueue;

/**
 * @author choxsu
 * @date 2019/7/15
 */
public class TaskThread {

    private DelayQueue<Task> delayQueue = new DelayQueue<>();

    private static TaskThread me = new TaskThread();

    private Thread thread;

    private TaskThread() {
        init();
        thread.start();
    }

    private void init() {
        thread = new Thread(() -> {
            for (; ; ) {
                try {
                    Task task = delayQueue.take();
                    task.run();
                } catch (InterruptedException e) {
                    break;
                }
            }
        });
    }

    public void add(long time, Runnable runnable) {
        delayQueue.add(new Task(time, runnable));
    }

    public static TaskThread getInstance() {
        return me;
    }


    public static void main(String[] args) throws InterruptedException {
        me.add(1, () -> System.out.println("1秒后发送短信"));
        me.add(2, () -> System.out.println("2秒后处理订单"));
        me.add(3, () -> System.out.println("3秒后订单超时"));
        Thread.sleep(1000);
        me.add(5, () -> System.out.println("5等前面的执行完我再执行"));
    }

}
