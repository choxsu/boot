package com.choxsu.common.jwt;

import com.choxsu.common.entity.Account;

/**
 * @author choxsu
 * @date 2019/8/31
 */
public class UserContext implements AutoCloseable {

    static final ThreadLocal<Account> current = new ThreadLocal<>();

    public UserContext(Account account) {
        current.set(account);
    }

    public static Account getCurrentAccount() {
        return current.get();
    }

    @Override
    public void close() throws Exception {
        current.remove();
    }
}
