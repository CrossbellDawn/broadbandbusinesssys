package edu.jwj439.text;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jwj439.dao.UserDao;
import edu.jwj439.entity.User;
import edu.jwj439.service.UserService;

public class TestSpring {
	@Test
    public void run1() throws IOException {
        User account =new User();
        account.setUserName("AAA");
        account.setPassword("123456");
        // 加载配置文件
        InputStream in = Resources.getResourceAsStream("mappers/UserMapper.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        // 创建SqlSession对象
        SqlSession session = factory.openSession();
        // 获取到代理对象
        UserDao dao = session.getMapper(UserDao.class);


        // 提交事务
        session.commit();

        // 关闭资源
        session.close();
        in.close();
    }
}