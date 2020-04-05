import com.alibaba.fastjson.JSON;
import com.yxy.ssm.model.Body;
import com.yxy.ssm.service.BodyService;
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
public class bodyTest {
    @Autowired
    BodyService bodyService;
    @Test
    public void selectByUser(){
        System.out.println("根据用户查找");
        try{
            System.out.println(JSON.toJSONString(bodyService.selectByUser(1)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void addOriginInfo(){
        System.out.println("添加原始信息");
        try{
            bodyService.addOriginInfo(2);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void updateByUser(){
        System.out.println("更新用户信息");
        try{
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("blood","AB型");
            bodyService.updateByUser(1,params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
