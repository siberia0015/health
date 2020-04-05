import com.alibaba.fastjson.JSON;
import com.yxy.ssm.model.User;
import com.yxy.ssm.service.UserService;
import com.yxy.ssm.utils.MD5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class userTest {
    @Autowired
    UserService userService;
    @Test
    public void login(){
        System.out.println("登陆");
        try{
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("userid",1);
            params.put("password", "123456");
            userService.login(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void register(){
        System.out.println("注册");
        try{
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("username","校长8");
            params.put("password", "123456");
            params.put("sex","男");
            params.put("age","40");
            User user = userService.register(params);
            System.out.println(user.getUserid());
            System.out.println(user.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void selectByID(){
        System.out.println("根据ID查找用户");
        try{
            System.out.println(JSON.toJSONString(userService.getUserByID(1)));
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
