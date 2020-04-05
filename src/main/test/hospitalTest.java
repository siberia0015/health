import com.alibaba.fastjson.JSON;
import com.yxy.ssm.service.HospitalService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class hospitalTest {
    @Autowired
    HospitalService hospitalService;
    @Test
    public void selectByPlace(){
        System.out.println("根据地区查找");
        try{
            Map<String,Object> params = new HashMap();
            //params.put("place",2);
            List<Map<Object,Object>> list = hospitalService.selectByPlace(params);
            System.out.println(JSON.toJSONString(list));
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
