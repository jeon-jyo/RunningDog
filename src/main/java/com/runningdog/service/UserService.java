package com.runningdog.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.UserDao;
import com.runningdog.vo.UserVo;



@Service
public class UserService {

	@Autowired
	private UserDao userDao;


	//회원가입
	public int insertUser(UserVo userVo) {
		System.out.println("UserService.insertUser()");
		
		
		//랜덤 6자리 뽑기
		StringBuffer rCode = getCode();
		
		//String으로 변환
		String stringCode = rCode.toString(); /* "YCK53T"; */
		
		//뽑은 거 있는지 select
		UserVo userCode = userDao.selectOneUserCode(stringCode);
		
		//이미 있으면 다시 뽑으셈
		while(userCode != null) {
			
			rCode = getCode();
			
			stringCode = rCode.toString();
			
			userCode = userDao.selectOneUserCode(stringCode);
		}
		//없으면 그걸 써라
		if(userCode == null) {
			userVo.setCode(stringCode);
		}

		//System.out.println(userVo);
		int count = userDao.insertUser(userVo);
		
		return count;
	}
	
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("UsersService.selectOneUser()");
		
		UserVo authUser = userDao.selectOneUser(userVo);
		
		return authUser;
	}
	
	
	
	//무작위 영어 + 숫자 6자리 뽑는 함수
	public StringBuffer getCode() {
		Random rnd = new Random();

		StringBuffer buf = new StringBuffer();


		for(int i=0;i<6;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+65));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		
		return buf;
	}	
	
}




