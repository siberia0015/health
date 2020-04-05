import com.alibaba.fastjson.JSON;
import com.yxy.ssm.service.PlaceService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:spring-*.xml", "classpath*:mybatis-config.xml"})
public class placeTest {
    @Autowired
    PlaceService placeService;
    @Test
    public void selectByID(){
        System.out.println("根据ID查找地点");
        try{
            System.out.println(JSON.toJSONString(placeService.getPlaceByID(1)));
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
