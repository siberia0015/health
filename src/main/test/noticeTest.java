import com.alibaba.fastjson.JSON;
import com.yxy.ssm.service.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class noticeTest {
    @Autowired
    NoticeService noticeService;
    @Test
    public void getAll(){
        System.out.println(JSON.toJSONString(noticeService.getAll(1,10)));
    }
}
