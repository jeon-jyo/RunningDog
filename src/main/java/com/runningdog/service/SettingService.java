package com.runningdog.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.dao.SettingDao;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.FriendsVo;
import com.runningdog.vo.MainImageVo;
import com.runningdog.vo.UserVo;


@Service
public class SettingService {

	@Autowired
	private SettingDao settingDao;
	
	//유저 정보
	public UserVo selectUser(int userNo) {
		System.out.println("SettingService.selectUser()");
			
		UserVo selectUser = settingDao.selectUser(userNo);
		
		System.out.println(selectUser);
		
		//이미지 가져오기
		MainImageVo userImg = new MainImageVo("users", userNo);
		String saveName = settingDao.selectImg(userImg);
		selectUser.setSaveName(saveName);
		
		return selectUser;
	}
	
	
	//프로필 이미지 업로드 form으로
	public int modifyMyProfile(UserVo userVo, int userNo, MultipartFile file) {
		System.out.println("SettingService.modifyMyProfile()");
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\userProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "users", userNo); 
			//System.out.println(mainImageVo);

			
			//기존 사진 지우기
			MainImageVo userImg = new MainImageVo("users", userNo);
			settingDao.deleteImg(userImg);
			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//유저 정보 수정
		userVo.setUserNo(userNo);
		
		if("".equals(userVo.getBirth())) {
			userVo.setBirth(null);
		}
		
		int count = settingDao.updateUser(userVo);
		
		return count;
	}

	//동네 목록
	public List<UserVo> selectAddressList(String keyword){
		System.out.println("SettingService.selectAddressList()");
		
		List<UserVo> addressList = settingDao.selectAddressList(keyword);
		
		return addressList;
	}
	
	
	
/*   강아지   */
	
	//강아지 리스트
	public Map<String, List<DogsVo>> selectDogList(int userNo){
		System.out.println("SettingService.selectDogList()");
		
		List<DogsVo> dogList = settingDao.selectDogList(userNo);
		//System.out.println(dogList);
		
		List<DogsVo> friendDogList = settingDao.selectFriendDogList(userNo);
		//System.out.println(friendDogList);
		
		Map<String, List<DogsVo>> dogListMap = new HashMap<String, List<DogsVo>>();
		dogListMap.put("dogList", dogList);
		dogListMap.put("friendDogList", friendDogList);
		
		return dogListMap;
	}
	
	//강아지 등록
	public void insertDog(int userNo, DogsVo dogsVo, MultipartFile file) {
		System.out.println("SettingService.insertDog()");

		//강아지 등록하기
		dogsVo.setUserNo(userNo);

		settingDao.insertDog(dogsVo);
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\dogProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//dog pk값
			int dogNo = dogsVo.getDogNo();
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "dog", dogNo); 
			//System.out.println(mainImageVo);

			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}		
	}
	
	//강아지 하나
	public DogsVo selectDog(int dogNo){
		System.out.println("SettingService.selectDog()");
		
		DogsVo dogsVo = settingDao.selectDog(dogNo);
		
		return dogsVo;
	}
	
	//강아지 삭제 update
	public int deleteDog(int dogNo){
		System.out.println("SettingService.deleteDog()");
		
		int count = settingDao.deleteDog(dogNo);
		
		return count;
	}
	
	//강아지 정보 update
	public void updateDog(int userNo, DogsVo dogsVo, MultipartFile file){
		System.out.println("SettingService.updateDog()");
		
		//강아지 등록하기
		dogsVo.setUserNo(userNo);
		settingDao.updateDog(dogsVo);
		
		// 파일 null 예외처리
		if(!file.isEmpty()){
			//파일 저장 디렉토리
			String saveDir = "C:\\javaStudy\\rdimg\\dogProfile";
			
			//파일 관련 정보 추출 //////////////////////////
			//오리지널 파일 명
			String orgName = file.getOriginalFilename();
			//System.out.println(orgName);
			
			//확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));
			//System.out.println(exName);
			
			//저장 파일명(겹치지 않아야 함)
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
								//		 long		 	 +			String
			//System.out.println(saveName);
			
			//파일 사이즈
			long fileSize = file.getSize();
			//System.out.println(fileSize);
			
			//파일 전체 경로
			String filePath = saveDir + "\\" + saveName;
			//System.out.println(filePath);
			
			
			//dog pk값
			int dogNo = dogsVo.getDogNo();
			
			//vo로 묶기
			MainImageVo mainImageVo = new MainImageVo(orgName, saveName, filePath, fileSize, "dog", dogNo); 
			//System.out.println(mainImageVo);

			
			//기존 사진 지우기
			MainImageVo dogImg = new MainImageVo("dog", dogNo);
			settingDao.deleteImg(dogImg);
			
			//이미지 테이블에 저장
			settingDao.insertImg(mainImageVo);
			
			
			//파일 저장(서버쪽 하드 디스크에 저장) //////////////////////////////
			
			try {
				byte[] fileData;
				
				fileData = file.getBytes();
				
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
//////////////////////
/*    친구    */
//////////////////////
	
	//친구 리스트
	public Map<String, Object> selectFriendList(int userNo, String what, String keyword, int crtPage){
		System.out.println("SettingService.selectFriendList()");
		
		///////////////// 리스트 가져오기 ///////////////////////
				
		//페이지당 글 갯수
		int listCnt = 5;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;
		
		/*
		 listCnt = 7	listCnt = 10
		 1	1	7		1	1	10
		 2	8	14		2	11	20
		 3	15	21		3	21	30
		 */
		
		//System.out.println(crtPage+", "+startRNum +", "+endRNum);
				
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("userNo", userNo);
		pageMap.put("keyword", keyword);
		pageMap.put("what", what);
		pageMap.put("startRNum", startRNum);
		pageMap.put("endRNum", endRNum);
		
		List<FriendsVo> friendList = settingDao.selectFriendList(pageMap);
		
		///////////////////////////////////////////////
		
		///////////////// 페이징 계산 ///////////////////////
		
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = settingDao.selectTotalCnt(pageMap);
		
		//마지막 버튼 번호
		int endPageBtnNo = (int) Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
								//올림 함수 //(현재 페이지 / 페이지당 버튼 갯수) * 페이지당 버튼 갯수
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount)+1;
		
		//System.out.println(crtPage+", "+startPageBtnNo +", "+endPageBtnNo);
		
		//다음 화살표 유무
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCnt) {
			next = true;
			
		}else {	//다음 버튼이 없을(false) 때 endPageBtnNo를 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt/(double)listCnt);
										/* 157/10.0 => 15.7 => 16 */
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		/*
		System.out.println("===============================");
		System.out.println("crtPage: "+crtPage);
		System.out.println(startPageBtnNo);
		System.out.println(endPageBtnNo);
		System.out.println(prev);
		System.out.println(next);
		System.out.println("===============================");
		*/
		
		Map<String, Object> friendMap = new HashMap<String, Object>();
		friendMap.put("startPageBtnNo", startPageBtnNo);
		friendMap.put("endPageBtnNo", endPageBtnNo);
		friendMap.put("prev", prev);
		friendMap.put("next", next);
		friendMap.put("keyword", keyword);
		friendMap.put("what", what);
		friendMap.put("friendList", friendList);
		
		return friendMap;
	}
	
	//친구 삭제
	public int deleteFriend(int friendNo, int userNo){
		System.out.println("SettingService.deleteFriend()");
		
		FriendsVo friendsVo = new FriendsVo(friendNo, userNo);
		
		int count = settingDao.deleteFriend(friendsVo);
		
		return count;
	}
	
	//내가 받은 신청
	public Map<String, Object> selectAppliedList(int userNo, int crtPage){
		System.out.println("SettingService.selectAppliedList()");
		
		//////////////// 리스트 //////////////////
		
		//페이지당 글 갯수
		int listCnt = 5;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		//System.out.println(crtPage+", "+startRNum +", "+endRNum);
				
		Map<String, Integer> fMap = new HashMap<String, Integer>();
		fMap.put("userNo", userNo);
		fMap.put("startRNum", startRNum);
		fMap.put("endRNum", endRNum);
		
		List<FriendsVo> appliedList = settingDao.selectAppliedList(fMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = settingDao.selectAppliedTotalCnt(userNo);
		
		//마지막 버튼 번호
		int endPageBtnNo = (int) Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
								//올림 함수 //(현재 페이지 / 페이지당 버튼 갯수) * 페이지당 버튼 갯수
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount)+1;
		
		//System.out.println(crtPage+", "+startPageBtnNo +", "+endPageBtnNo);
		
		//다음 화살표 유무
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCnt) {
			next = true;
			
		}else {	//다음 버튼이 없을(false) 때 endPageBtnNo를 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt/(double)listCnt);
										/* 157/10.0 => 15.7 => 16 */
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}

		Map<String, Object> friendMap = new HashMap<String, Object>();
		friendMap.put("startPageBtnNo", startPageBtnNo);
		friendMap.put("endPageBtnNo", endPageBtnNo);
		friendMap.put("prev", prev);
		friendMap.put("next", next);
		friendMap.put("appliedList", appliedList);
		
		return friendMap;
	}
	
	//친구 수락
	public int acceptFriend(int friendNo, int userNo){
		System.out.println("SettingService.deleteFriend()");
		
		FriendsVo friendsVo = new FriendsVo(friendNo, userNo);
		
		int count = settingDao.acceptFriend(friendsVo);
		
		return count;
	}
	
	//내가 한 신청
	public Map<String, Object> selectApplyList(int userNo, int crtPage){
		System.out.println("SettingService.selectApplyList()");
		
		//////////////// 리스트 //////////////////
		
		//페이지당 글 갯수
		int listCnt = 5;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		//System.out.println(crtPage+", "+startRNum +", "+endRNum);
				
		Map<String, Integer> fMap = new HashMap<String, Integer>();
		fMap.put("userNo", userNo);
		fMap.put("startRNum", startRNum);
		fMap.put("endRNum", endRNum);
		
		List<FriendsVo> applyList = settingDao.selectApplyList(fMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = settingDao.selectApplyTotalCnt(userNo);
		
		//마지막 버튼 번호
		int endPageBtnNo = (int) Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
								//올림 함수 //(현재 페이지 / 페이지당 버튼 갯수) * 페이지당 버튼 갯수
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount)+1;
		
		//System.out.println(crtPage+", "+startPageBtnNo +", "+endPageBtnNo);
		
		//다음 화살표 유무
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCnt) {
			next = true;
			
		}else {	//다음 버튼이 없을(false) 때 endPageBtnNo를 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt/(double)listCnt);
										/* 157/10.0 => 15.7 => 16 */
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}

		Map<String, Object> friendMap = new HashMap<String, Object>();
		friendMap.put("startPageBtnNo", startPageBtnNo);
		friendMap.put("endPageBtnNo", endPageBtnNo);
		friendMap.put("prev", prev);
		friendMap.put("next", next);
		friendMap.put("applyList", applyList);
		
		return friendMap;
	}
	
	
	//유저 검색
	public Map<String, Object> selectUserList(int userNo, String what, String keyword, int crtPage){
		System.out.println("SettingService.selectUserList()");
		
		///////////////// 리스트 가져오기 ///////////////////////
				
		//페이지당 글 갯수
		int listCnt = 5;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		//System.out.println(crtPage+", "+startRNum +", "+endRNum);
				
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("keyword", keyword);
		pageMap.put("what", what);
		pageMap.put("userNo", userNo);
		pageMap.put("startRNum", startRNum);
		pageMap.put("endRNum", endRNum);
		
		List<FriendsVo> userList = settingDao.selectUserList(pageMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = settingDao.selectUserTotalCnt(pageMap);
		
		//마지막 버튼 번호
		int endPageBtnNo = (int) Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
								//올림 함수 //(현재 페이지 / 페이지당 버튼 갯수) * 페이지당 버튼 갯수
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount)+1;
		
		//System.out.println(crtPage+", "+startPageBtnNo +", "+endPageBtnNo);
		
		//다음 화살표 유무
		boolean next = false;
		if(listCnt * endPageBtnNo < totalCnt) {
			next = true;
			
		}else {	//다음 버튼이 없을(false) 때 endPageBtnNo를 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt/(double)listCnt);
										/* 157/10.0 => 15.7 => 16 */
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}

		Map<String, Object> friendMap = new HashMap<String, Object>();
		friendMap.put("startPageBtnNo", startPageBtnNo);
		friendMap.put("endPageBtnNo", endPageBtnNo);
		friendMap.put("prev", prev);
		friendMap.put("next", next);
		friendMap.put("keyword", keyword);
		friendMap.put("what", what);
		friendMap.put("userList", userList);
		
		return friendMap;
	}
	
	
	//친구 신청
	public int insertFriend(int userNo, int authUserNo) {
		System.out.println("SettingService.selectUser()");
		
		FriendsVo fVo = new FriendsVo();
		fVo.setAppliedUserNo(userNo);
		fVo.setApplyUserNo(authUserNo);
		
		//이미 있는 신청인지 확인
		int count = settingDao.selectRequest(fVo);
		
		//결과 반환용
		int icount = 0;
				
		if(count == 0) {
			icount = settingDao.insertFriend(fVo);
			
			return icount;
		}else {
			
			return icount;
		}
	}
	
	//친구 신청
		public int resign(int userNo, UserVo userVo) {
			System.out.println("SettingService.resign()");
	
			userVo.setUserNo(userNo);
			
			int count = settingDao.resign(userVo);
			int icount = 0;
			
			if(count == 1) {
				icount = settingDao.resignf(userNo);
				
				return icount;
			}else {
				
				return icount;
			}
		}
		
}




