import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxy.ssm.model.Hospital;
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
            JSONObject result = new JSONObject();
            Map<String,Object> params = new HashMap();
            //params.put("place",2);
            List<Map<Object,Object>> list = hospitalService.selectByPlace(1,10,params);
            result.put("code","0");
            result.put("data",list);
            result.put("msg","");
            result.put("count",list.size());
            System.out.println(result.toJSONString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void selectById(){
        System.out.println("根据ID查找");
        Hospital h = hospitalService.selectById(2);
        System.out.println(h.getName());
    }

}
