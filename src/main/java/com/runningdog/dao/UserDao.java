package com.runningdog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.UserVo;


@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//회원가입
	public int insertUser(UserVo userVo) {
		System.out.println("UsersDao.insertUser()");
		
		int count = sqlSession.insert("user.insertUser", userVo);
		//System.out.println(count);
		
		return count;
	}
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("UsersDao.selectOneUser()");
		
		UserVo authUser = sqlSession.selectOne("user.selectOneUser", userVo);
		
		return authUser;
	}
	
	//유저 코드 있는지 확인
	public String selectOneUserCode(String code) {
		System.out.println("UsersDao.selectOneUserCode()");
		
		String userCode = sqlSession.selectOne("user.selectOneUserCode", code);
		
		return userCode;
	}
	
}



