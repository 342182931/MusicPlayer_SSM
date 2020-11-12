package test;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.xu.ssm.mapper.MusicMapper;
import com.xu.ssm.po.Music;

public class test<main> {

	// 闯将sqlsessionfactory
		private SqlSessionFactory sqlSessionFactory;

		@Before
		public void setUp() throws Exception {
			// mybatis配置文件
			String resource = "classpath:SqlMapConfig.xml";
			// 得到配置文件流
			InputStream inputstream = Resources.getResourceAsStream(resource);
			// 创建会话工厂，传入mybatis配置信息
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputstream);
		}

		@Test
		public void testFindUserByid() throws Exception {
			SqlSession sqlsession = sqlSessionFactory.openSession();
			MusicMapper musicMapper = sqlsession.getMapper(MusicMapper.class);
			List<Music> lm = musicMapper.selectByExample(null);
			System.out.println(lm.size());
		}

}
