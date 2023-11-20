package com.runningdog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.MoWalkedDogVo;
import com.runningdog.vo.UseTrailVo;
import com.runningdog.vo.UserVo;

@Repository
public class MoWebDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("다오 모바일웹 로그인");	
		System.out.println("다오 "+userVo);
		UserVo authUser = sqlSession.selectOne("walkLog.selectOneUser", userVo);	
		System.out.println("다오 "+authUser);
		return authUser;
	}
	
	// (1) 산책로 불러오기
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Dao");		
		return sqlSession.selectList("walkLog.mapTrailSelect");
	}	
	
	// (2) 강아지정보 가져오기
	public List<MoDogVo> dogSelect(int userNo){
		System.out.println("다오 강아지가져오기");	
		System.out.println("다오 아이디 "+userNo);	
		List<MoDogVo> dogList = sqlSession.selectList("walkLog.dogSelect", userNo);
		System.out.println(dogList);	
		return dogList;
	}
	
	// (3) 산책기록하기
	public void walkLogInsert(MoWalkLogVo moWalkLogVo){
		System.out.println("다오 산책기록하기");
		moWalkLogVo.setLocationNo(1174010900); // 동네번호
		moWalkLogVo.setMeetingNo(0); // 모임번호
		moWalkLogVo.setStatus('T');	
		moWalkLogVo.setStartTime("2023-11-17 11:31");
		moWalkLogVo.setEndTime("2023-11-17 11:45");
			
		System.out.println("셀렉트키 받기 전 " + moWalkLogVo);	              
		sqlSession.insert("walkLog.walkLogInsert", moWalkLogVo);
	}
	
	// (4) 강아지리스트기록하기
	public void dogListInsert(MoWalkedDogVo walkedDogVo){
		System.out.println("다오 강아지리스트기록하기");	
		sqlSession.insert("walkLog.walkedDogInsert", walkedDogVo);
	}
	
	// (5) 좌표리스트기록하기
	public void coordsListInsert(CoordsVo coordsVo){
		System.out.println("다오 좌표리스트기록하기");			
		sqlSession.insert("walkLog.coordsInsert", coordsVo);
	}
	
	// (6) 캡쳐용 좌표값 불러오기
	public List<CoordsVo> mapSelect(int walkLogNo){
		System.out.println("다오 캡쳐용 좌표값 불러오기");			
		return  sqlSession.selectList("walkLog.mapSelect", walkLogNo);
	}
		
	
	
	
	
	// (0) 유사한 산책로 불러오기 (현재는 더미데이터 3개 불러오기)
	public List<MoTrailVo> trailSelect(int locationNo){
		System.out.println("다오 산책로 3개 불러오기");			
		return sqlSession.selectList("walkLog.trailSelect",locationNo);			
	}
	

}
