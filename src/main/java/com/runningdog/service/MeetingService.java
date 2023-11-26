package com.runningdog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MeetingDao;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MeetingInfosVo;
import com.runningdog.vo.MeetingsVo;
import com.runningdog.vo.TrailsVo;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;
	
	//모임 리스트 (전체)
	public Map<String, Object> selectMeetingList(String what, String keyword, int crtPage){
		System.out.println("MeetingService.selectMeetingList()");
		
		///////////////// 리스트 가져오기 ///////////////////////
				
		//페이지당 글 갯수
		int listCnt = 10;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("keyword", keyword);
		pageMap.put("what", what);
		pageMap.put("startRNum", startRNum);
		pageMap.put("endRNum", endRNum);
		
		List<MeetingsVo> meetingList = meetingDao.selectMeetingList(pageMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = meetingDao.selectMeetingCnt(keyword);
		
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
		
		Map<String, Object> meetingMap = new HashMap<String, Object>();
		meetingMap.put("startPageBtnNo", startPageBtnNo);
		meetingMap.put("endPageBtnNo", endPageBtnNo);
		meetingMap.put("prev", prev);
		meetingMap.put("next", next);
		meetingMap.put("keyword", keyword);
		meetingMap.put("meetingList", meetingList);
		
		return meetingMap;
	}
	
	//산책로 검색
	public List<TrailsVo> searchTrail(String what, String keyword){
		System.out.println("MeetingService.searchTrail()");

		Map<String, String> tMap = new HashMap<String, String>();
		tMap.put("keyword", keyword);
		tMap.put("what", what);
		
		List<TrailsVo> trailList = meetingDao.searchTrail(tMap);
		
		return trailList;
	}
	
	//강아지 리스트
	public List<DogsVo> selectDogList(int userNo) {
		System.out.println("MeetingService.selectDogList()");

		List<DogsVo> dList = meetingDao.selectDogList(userNo);
		
		return dList;
	}
	
	//모임 등록
	public void insertMeeting(MeetingsVo mVo) {
		System.out.println("MeetingService.insertMeeting()");

		String date = mVo.getMeetingDate();
		String time = mVo.getTime();
		
		mVo.setMeetingDate(date+" "+time);
		
		meetingDao.insertMeeting(mVo);
		
		List<Integer> dList = mVo.getDogNo();
		
		MeetingInfosVo miVo = new MeetingInfosVo();
		miVo.setMeetingNo(mVo.getMeetingNo());
		miVo.setUserNo(mVo.getUserNo());
		
		for(int i = 0; i< dList.size(); i++) {
			
			miVo.setDogNo(dList.get(i));
			
			meetingDao.insertMeetingInfo(miVo);
		}
	}
	
	
	//모임 1개
	public Map<String, Object> selectOneMeeting(int meetingNo, int userNo) {
		System.out.println("MeetingDao.selectOneMeeting()");
		
		//1개 가져오기
		MeetingsVo mvo = meetingDao.selectOneMeeting(meetingNo);

		//세션의 유저 강아지 리스트
		List<DogsVo> myDogList = meetingDao.selectDogList(userNo);
		
		//모임 참가 중인 강아지 리스트
		List<DogsVo> meetingDogList = meetingDao.selectMeetingDogList(meetingNo);
		
		//모임 참가중 인지 확인
		MeetingInfosVo mivo = new MeetingInfosVo();
		mivo.setMeetingNo(meetingNo);
		mivo.setUserNo(userNo);
		
		MeetingInfosVo meetingInfosVo = meetingDao.selectAreYouMember(mivo);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("meetingVo", mvo);
		map.put("myDogList", myDogList);
		map.put("meetingDogList", meetingDogList);
		map.put("meetingInfosVo", meetingInfosVo);
		
		return map;
	}
	
	//모임 신청
	public void insertMeetingInfo(MeetingsVo mVo) {
		System.out.println("MeetingService.insertMeetingInfo()");

		List<Integer> dList = mVo.getDogNo();
		
		MeetingInfosVo miVo = new MeetingInfosVo();
		miVo.setMeetingNo(mVo.getMeetingNo());
		miVo.setUserNo(mVo.getUserNo());
		
		for(int i = 0; i< dList.size(); i++) {
			
			miVo.setDogNo(dList.get(i));
			
			meetingDao.insertMeetingInfo(miVo);
		}
	}
	
	
	//내 모임 리스트
	public Map<String, Object> selectMyMeetingList(String what, String keyword, int crtPage, int userNo){
		System.out.println("MeetingService.selectMyMeetingList()");
		
		///////////////// 리스트 가져오기 ///////////////////////
				
		//페이지당 글 갯수
		int listCnt = 10;	//한 페이지에 출력되는 글 갯수
		
		//현제 페이지	crtPage 파라미터 받는다
		//int crtPage = 1;
		crtPage = (crtPage>0) ? crtPage : (crtPage = 1);
		
		//시작 글 번호
		int startRNum = (crtPage-1)*listCnt + 1;
		
		//끝 글 번호
		int endRNum = (startRNum+listCnt) - 1;

		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("keyword", keyword);
		pageMap.put("what", what);
		pageMap.put("startRNum", startRNum);
		pageMap.put("endRNum", endRNum);
		pageMap.put("userNo", userNo);
		
		List<MeetingsVo> meetingList = meetingDao.selectMyMeetingList(pageMap);
		
		///////////////// 페이징 계산 ///////////////////////
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//전체 글 갯수
		int totalCnt = meetingDao.selectMyMeetingCnt(pageMap);
		
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
		
		Map<String, Object> meetingMap = new HashMap<String, Object>();
		meetingMap.put("startPageBtnNo", startPageBtnNo);
		meetingMap.put("endPageBtnNo", endPageBtnNo);
		meetingMap.put("prev", prev);
		meetingMap.put("next", next);
		meetingMap.put("keyword", keyword);
		meetingMap.put("meetingList", meetingList);
		
		return meetingMap;
	}
	
	
	//모임 삭제 || 종료
	public int deleteMeeting(int userNo, int meetingNo, String meetingDate) {
		System.out.println("MeetingService.deleteMeeting()");
		
		//Vo로 묶기
		MeetingsVo mVo = new MeetingsVo();
		mVo.setUserNo(userNo);
		mVo.setMeetingNo(meetingNo);
		
		//현재 시간 구하기
		Date sysdate = new Date();
		
		/* 분까지만
		 * LocalDate now = LocalDate.now(); LocalTime time = LocalTime.now(); int hour =
		 * time.getHour(); int minute = time.getMinute();
		 * 
		 * String sysdate = now+" "+hour+":"+minute;
		 */
		
		Date mdate = null;
		
		//string -> date 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			mdate = sdf.parse(meetingDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int count = 0; 
		
		//모임 date와 현재 시간 비교 -> 현재가 모임날보다 이르면 true, 같거나 이후면 false
		if(sysdate.before(mdate)) {
			//미팅 F로 변경
			count = meetingDao.deleteMeetingF(mVo);
		}else {
			//미팅 E로 변경
			count = meetingDao.deleteMeetingE(mVo);
		}
		
		return count;
	}
	
	//신청 취소
	public int deleteMeetingInfo(int meetingNo, int userNo) {
		System.out.println("MeetingDao.deleteMeetingInfo()");
		
		MeetingsVo meetingsVo = new MeetingsVo();
		meetingsVo.setUserNo(userNo);
		meetingsVo.setMeetingNo(meetingNo);
		
		int count = meetingDao.deleteMeetingInfo(meetingsVo);
		
		return count;
	}
	
	
	
	
}










