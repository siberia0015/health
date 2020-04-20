import com.alibaba.fastjson.JSON;
import com.yxy.ssm.service.DiseaseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class diseaseTest {
    @Autowired
    DiseaseService diseaseService;
    @Test
    public void add(){
        Map params = new HashMap();
        Date time= new java.sql.Date(new java.util.Date().getTime());
        params.put("begindate",time);
        params.put("title","测试");
        params.put("information","内容");
        params.put("user",1);
        diseaseService.addDisease(params);
    }
    @Test
    public void selectByUser(){
        Date time= new java.sql.Date(new java.util.Date().getTime());
        Map params = new HashMap();
        params.put("user",2);
        params.put("beginDate",time.toString());
        params.put("endDate",time.toString());
        System.out.println(JSON.toJSONString(diseaseService.selectByUser(1,999,params)));
    }
    @Test
    public void delete(){
        diseaseService.delete(1);
    }
}
