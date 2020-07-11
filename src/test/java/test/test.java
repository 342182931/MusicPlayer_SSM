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

public class test {

	// ����sqlsessionfactory
		private SqlSessionFactory sqlSessionFactory;

		@Before
		public void setUp() throws Exception {
			// mybatis�����ļ�
			String resource = "classpath:SqlMapConfig.xml";
			// �õ������ļ���
			InputStream inputstream = Resources.getResourceAsStream(resource);
			// �����Ự����������mybatis������Ϣ
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
