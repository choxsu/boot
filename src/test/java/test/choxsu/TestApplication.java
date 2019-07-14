package test.choxsu;

import com.choxsu.Application;
import com.choxsu.config.ApplicationArgumentsConfig;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author choxsu
 * @date 2019/7/14
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestApplication {

    @Autowired
    ApplicationArgumentsConfig argumentsConfig;


    @Test
    public void debugInfo() {
        System.out.println("argumentsConfig.containsDebugOption() = " + argumentsConfig.containsDebugOption());
    }

    @Before
    public void testBefore(){
        System.out.println("before");
    }

    @After
    public void testAfter(){
        System.out.println("after");
    }

}
