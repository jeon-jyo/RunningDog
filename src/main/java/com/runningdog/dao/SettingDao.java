package com.runningdog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.DogsVo;
import com.runningdog.vo.FriendsVo;
import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Repository
public class SettingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//유저 정보 (이미지 제외)
	public UserVo selectUser(int userNo) {
		System.out.println("SettingDao.selectUser()");
		
		UserVo selectUser = sqlSession.selectOne("setting.selectUser", userNo);
		//System.out.println(selectUser);
		
		return selectUser;
	}
	
	//이미지 한 개 가져오기
	public String selectImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.selectImg()");
		
		String saveName = sqlSession.selectOne("setting.selectImg", mainImageVo);
		//System.out.println(selectUser);
		
		return saveName;
	}
	
	// 이미지 삭제
	public int deleteImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.deleteImg()");
		
		int count = sqlSession.delete("setting.deleteImg", mainImageVo);
		
		return count;
	}
	
	//이미지 저장
	public int insertImg(MainImageVo mainImageVo) {
		System.out.println("SettingDao.insertImg()");
		
		int count = sqlSession.insert("setting.insertImg", mainImageVo);
		
		return count;
	}
	
	//user 정보 수정
	public int updateUser(UserVo userVo) {
		System.out.println("SettingDao.updateUser()");
		
		int count = sqlSession.update("setting.updateUser", userVo);
		
		return count;
	}
	
	
	//동네 찾기
	public List<UserVo> selectAddressList(String keyword) {
		System.out.println("SettingDao.selectAddressList()");
		
		List<UserVo> addressList  = sqlSession.selectList("setting.selectAddressList", keyword);
		
		return addressList;
	}
	
	
	
/*	 강아지	*/
	
	//강아지 카드 리스트
	public List<DogsVo> selectDogList(int userNo) {
		System.out.println("SettingDao.selectDogList()");
		
		List<DogsVo> dogList = sqlSession.selectList("setting.selectDogList", userNo);
		
		return dogList;
	}
	
	//강아지 등록
	public int insertDog(DogsVo dogsVo) {
		System.out.println("SettingDao.insertDog()");
		
		//System.out.println(dogsVo.getDogNo());
		int count = sqlSession.insert("setting.insertDog", dogsVo);
		//selectkey로 추가한 값이 나옴
		//System.out.println(dogsVo.getDogNo());
		
		return count;
	}
	
	//강아지 수정 폼 (1마리 가져오기)
	public DogsVo selectDog(int dogNo) {
		System.out.println("SettingDao.selectDog()");

		DogsVo dogVo = sqlSession.selectOne("setting.selectDog", dogNo);
		
		return dogVo;
	}
	
	//강아지 삭제
	public int deleteDog(int dogNo) {
		System.out.println("SettingDao.deleteDog()");

		int count = sqlSession.update("setting.deleteDog", dogNo);
		
		return count;
	}
	
	//강아지 수정
	public int updateDog(DogsVo dogsVo) {
		System.out.println("SettingDao.updateDog()");

		int count = sqlSession.update("setting.updateDog", dogsVo);
		
		return count;
	}
	
	
	
/*	 친구		*/
	
	//친구 리스트 (검색 + 페이징)
	public List<FriendsVo> selectFriendList(Map<String, Object> pageMap) {
		System.out.println("SettingDao.selectFriendList()");
		
		List<FriendsVo> friendList = sqlSession.selectList("setting.selectFriendList", pageMap);
		//System.out.println(friendList);
		
		return friendList;
	}
	
	//친구 목록 전체 갯수
	public int selectTotalCnt(Map<String, Object> pageMap) {
		System.out.println("SettingDao.selectTotalCnt()");
		 
		int totalCount = sqlSession.selectOne("setting.selectTotalCnt", pageMap);
		
		return totalCount;
	}
	
	//친구 삭제
	public int deleteFriend(FriendsVo friendsVo) {
		System.out.println("SettingDao.deleteFriend()");

		int count = sqlSession.delete("setting.deleteFriend", friendsVo);
		
		return count;
	}
	
	//친구 강아지 목록
	public List<DogsVo> selectFriendDogList(int userNo) {
		System.out.println("SettingDao.selectFriendDogList()");
		 
		List<DogsVo> friendDogList = sqlSession.selectList("setting.selectFriendDogList", userNo);
		
		return friendDogList;
	}
	
	
	//내가 받은 신청
	public List<FriendsVo> selectAppliedList(Map<String, Integer> fMap) {
		System.out.println("SettingDao.selectAppliedList()");
		
		List<FriendsVo> appliedList = sqlSession.selectList("setting.selectAppliedList", fMap);
		//System.out.println(friendList);
		
		return appliedList;
	}
	
	//내가 받은 신청 전체 갯수
	public int selectAppliedTotalCnt(int userNo) {
		System.out.println("SettingDao.selectAppliedTotalCnt()");
		 
		int appliedCount = sqlSession.selectOne("setting.selectAppliedTotalCnt", userNo);
		
		return appliedCount;
	}
	
	
	//친구 수락
	public int acceptFriend(FriendsVo friendsVo) {
		System.out.println("SettingDao.acceptFriend()");

		int count = sqlSession.update("setting.acceptFriend", friendsVo);
		
		return count;
	}
	
	
	//내가 한 신청
	public List<FriendsVo> selectApplyList(Map<String, Integer> fMap) {
		System.out.println("SettingDao.selectApplyList()");
		
		List<FriendsVo> applyList = sqlSession.selectList("setting.selectApplyList", fMap);
		//System.out.println(friendList);
		
		return applyList;
	}
		
	//내가 한 신청 전체 갯수
	public int selectApplyTotalCnt(int userNo) {
		System.out.println("SettingDao.selectApplyTotalCnt()");
		 
		int applyCount = sqlSession.selectOne("setting.selectApplyTotalCnt", userNo);
		
		return applyCount;
	}
	
	
	//유저 리스트 (검색 + 페이징)
	public List<FriendsVo> selectUserList(Map<String, Object> pageMap) {
		System.out.println("SettingDao.selectUserList()");
		
		List<FriendsVo> friendList = sqlSession.selectList("setting.selectUserList", pageMap);
		//System.out.println(friendList);
		
		return friendList;
	}
	
	//유저 목록 전체 갯수
	public int selectUserTotalCnt(Map<String, Object> pageMap) {
		System.out.println("SettingDao.selectUserTotalCnt()");
		 
		int totalCount = sqlSession.selectOne("setting.selectUserTotalCnt", pageMap);
		
		return totalCount;
	}
	
	
	//존재하는 신청인지 select
	public int selectRequest(FriendsVo friendsVo) {
		System.out.println("SettingDao.selectRequest()");
		 
		int exist = sqlSession.selectOne("setting.selectRequest", friendsVo);
		
		return exist;
	}
	
	//친구 등록
	public int insertFriend(FriendsVo friendsVo) {
		System.out.println("SettingDao.insertFriend()");

		int count = sqlSession.insert("setting.insertFriend", friendsVo);
		
		return count;
	}
	
	
	
/////탈퇴/////
	
	//회원 탈퇴
	public int resign(UserVo userVo) {
		System.out.println("SettingDao.resign()");

		int count = sqlSession.update("setting.resign", userVo);
		
		return count;
	}
	
	//회원 탈퇴 친구 삭제
	public int resignf(int userNo) {
		System.out.println("SettingDao.resignf()");

		int count = sqlSession.delete("setting.resignf", userNo);
		
		return count;
	}

	
}




