import org.mybatis.generator.api.ShellRunner;

public class databaseTest {

    public static void main(String[] args) {
        args = new String[]{"-configfile", "src\\main\\resources\\generatorConfig.xml", "-overwrite"};
        ShellRunner.main(args);
    }
}