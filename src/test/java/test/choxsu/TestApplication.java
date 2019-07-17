package test.choxsu;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.choxsu.Application;
import com.choxsu.config.ApplicationArgumentsConfig;
import com.choxsu.service.AccountService;
import com.choxsu.utils.RedisUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author choxsu
 * @date 2019/7/14
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestApplication {

    @Autowired
    ApplicationArgumentsConfig argumentsConfig;

    @Autowired
    private AccountService accountService;

    @Test
    public void debugInfo() {
        System.out.println("argumentsConfig.containsDebugOption() = " + argumentsConfig.containsDebugOption());
    }

    @Test
    public void getAccounts() {
        IPage iPage = new Page().setSize(2).setCurrent(1);
        IPage page = accountService.page(iPage);
        System.out.println(page.getRecords().toString());
        System.out.println("page.getPages() = " + page.getPages());
    }

    @Test
    public void test() {

    }

    @Before
    public void testBefore(){
        System.out.println("before");
        RedisUtil.set("123", "456");
    }

    @After
    public void testAfter(){
        System.out.println("after");
        System.out.println("redisUtil.get(\"123\") = " + RedisUtil.get("123"));
    }

}
