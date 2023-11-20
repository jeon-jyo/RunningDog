package com.runningdog.service;

import java.util.ArrayList;
import java.util.Arrays;

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
		
		//코드 뽑기
		String code = getCode();
		
		//뽑은 거 넣기
		userVo.setCode(code);

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
	

	//코드 내놔
	public String getCode() {

//		//무작위 영어 + 숫자 6자리 뽑기 (이게 뭐누)
//		Random rnd = new Random();
//
//		StringBuffer buf = new StringBuffer();
//
//		for(int i=0;i<6;i++){
//		    if(rnd.nextBoolean()){
//		        buf.append((char)((int)(rnd.nextInt(26))+65));
//		    }else{
//		        buf.append((rnd.nextInt(10))); 
//		    }
//		}
		
		//무작위 영어 + 숫자 6자리 뽑기 (배열 사용)
		ArrayList<Object> arr = new ArrayList<Object>(Arrays.asList(
			/* 0~9 */
			0,1,2,3,4,5,6,7,8,9,
			/* A~Z */
			"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
		));
		
		StringBuffer sb = new StringBuffer();
		
		String stringCode = "";
		String userCode = "";

		//반복문
		do {
			//코드 뽑기
			for(int i=0;i<6;i++){
				Object code = arr.get((int) (Math.random() * arr.size()));
				sb.append(code);
			}
			
			//String으로 변환
			stringCode = sb.toString();
			
			//있는지 검사
			userCode = userDao.selectOneUserCode(stringCode);  
			
				//null이 아니거나(값이 있거나), 비어있을 때
		} while (userCode != null  || "".equals(userCode));
		
		//입국심사 통과하면 return
		return stringCode;		
	}	

}




