package spring.conf;

import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:spring/db.properties")
public class SpringConfiguration {
	@Value("${jdbc.driver}")
	private String driver;
	@Value("${jdbc.url}")
	private String url;
	@Value("${jdbc.username}")
	private String username;
	@Value("${jdbc.password}")
	private String password;
	
	//Connection Pool
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(driver);
		basicDataSource.setUrl(url);
		basicDataSource.setUsername(username);
		basicDataSource.setPassword(password);
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);
		return basicDataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
			// 여기에 mybatis-config.xml의 경로를 알려줘야하는데, 문자열로 주면 안됨. 
			// setConfigLocation에서 매개변수를 Resource로 보내주길 원하기때문에, 우리가 가지고 있는 classpath를 Resource형식으로 바꾸어줌.
		sqlSessionFactoryBean.setDataSource(dataSource());
		//sqlSessionFactoryBean.setMapperLocations(new ClassPathResource("user/dao/userMapper.xml"));
			return sqlSessionFactoryBean.getObject(); // 우리가 반환하고 싶은 것은 SqlSessionFactory이기 때문에 변환해주기
	}
	
	@Bean
	public SqlSession sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory()); 
		// 여기 생성자에 sqlSessionFactory를 써야해서 위의 메소드의 리턴형을 굳이 SqlSessionFactory로 바꿔준 것!
		// 여기 return형을 SqlSessionTemplate로 써도되고 SqlSession으로 써도 되고~~
		// SqlSessionTemplate이 바로 SqlSession을 만드는 클래스!
	}
	
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	//이메일 인증
	@Bean(name="mailSender")
	public JavaMailSender getJavaMailSender() {
		Properties properties = new Properties(); 
		properties.put("mail.smtp.auth", true);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.starttls.required", true);
		properties.put("mail.debug", true);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("milkywayforest11@gmail.com"); //이메일
		mailSender.setPassword("dmsgktnv11"); //비밀번호 은하숲11
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(properties);
		
		return mailSender;
		
	}
}
