import com.yxy.ssm.service.AssessService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class assessTest {
    @Autowired
    AssessService assessService;
    @Test
    public void agree(){
        Map params = new HashMap();
        params.put("id",1);
        params.put("userid",1);
        assessService.agree(params);
    }
    @Test
    public void checkAgree(){
        Map params = new HashMap();
        params.put("id",1);
        params.put("userid",1);
        if(assessService.checkAgree(params)==false){
            System.out.println("已操作");
        }else{
            System.out.println("可以操作");
        }
    }
    @Test
    public void disagree(){
        Map params = new HashMap();
        params.put("id",1);
        params.put("userid",1);
        assessService.disagree(params);
    }
    @Test
    public void checkDisagree(){
        Map params = new HashMap();
        params.put("id",1);
        params.put("userid",1);
        if(assessService.checkDisagree(params)==false){
            System.out.println("已操作");
        }else{
            System.out.println("可以操作");
        }
    }
}
