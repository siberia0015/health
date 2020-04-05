import com.yxy.ssm.service.BodyService;
import com.yxy.ssm.service.RecordService;
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
public class recordTest {
    @Autowired
    RecordService recordService;
    @Test
    public void addRecord(){
        System.out.println("添加记录");
        try {
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("tips","无");
            Date time= new java.sql.Date(new java.util.Date().getTime());
            params.put("date",time);
            recordService.addRecord(params,1);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void selectRecord(){
        System.out.println("搜索记录");
        try{
            Map<String,Object> params = new HashMap<String,Object>();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
