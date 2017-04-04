package org.zerock.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.Connection;
/**
 * What : 기본적인 기능의 게시물 관리의 등록 수정 삭제 조회 기능의 DataSource 테스트.
 * Why : DataSourceTest는 설정된 DataSource를 자동으로 주입받을 수 있게 함.
 * How :
 */

/**
 * 실제 테스트는 try - with 구문을 이용해서 자동으로 Connection 객체가 close() 될 수 있도록 작성.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {

	@Inject
	private DataSource ds;

	/**
	 * Test conection.
	 *
	 * @throws Exception the exception
	 */
	@Test
	public void testConection()throws Exception{
		
		try(Connection con = ds.getConnection()){
			
			System.out.println("lll~~~" + con + "lll~~~");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


