package com.runningdog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.WalkBlogDao;
import com.runningdog.vo.BlogDogVo;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.FollowListVo;
import com.runningdog.vo.LogWalkedDogVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.UsedTrailVo;
import com.runningdog.vo.WalkLogConImgVo;

@Service
public class WalkBlogService {
	
	@Autowired
	private WalkBlogDao walkBlogDao;

	public BlogInfoVo selectBlogInfo(String paramCode, int authUserNo) {
		
		System.out.println("selectBlogInfo");
		System.out.println(paramCode);
		System.out.println(authUserNo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("paramCode",paramCode);
		map.put("authUserNo",authUserNo);
		
		BlogInfoVo blogInfoVo = new BlogInfoVo();
		
		/*
		 * Map<String, Object> ownerInfo = walkBlogDao.selectBlogOwner(map);
		 * 
		 * System.out.println(ownerInfo);
		 * 
		 * blogInfoVo.setName((String)ownerInfo.get("NAME"));
		 */
		
		 
			/*
			 * blogInfoVo.setOwnerNo((Integer)(ownerInfo.get("USERNO")));
			 * 
			 * System.out.println(blogInfoVo.getOwnerNo());
			 */
		 
		blogInfoVo.setOwnerNo(walkBlogDao.selectOwnerNo(paramCode));
		blogInfoVo.setUserSavename(walkBlogDao.getUserSavename(paramCode));
		
		blogInfoVo.setName(walkBlogDao.selectOwnerName(paramCode));
		 
		blogInfoVo.setAuthNo(authUserNo);
		
		blogInfoVo.setParamCode(paramCode);
		
		
		blogInfoVo.setFollowerNum(walkBlogDao.selectfollowerNum(paramCode));
		
		blogInfoVo.setFollowingNum(walkBlogDao.selectfollowingNum(paramCode));
		
		
		blogInfoVo.setFollowNo(walkBlogDao.didIFollow2(map));
		
		blogInfoVo.setBannerSavename(walkBlogDao.selectBannerImg(paramCode));
	
		
		blogInfoVo.setMonthlyStatsThisMonth(walkBlogDao.getMonthlyStats(paramCode));
		blogInfoVo.setMonthlyStatsTotal(walkBlogDao.getTotalStats(paramCode));
		
		blogInfoVo.getMonthlyStatsThisMonth().setThisMonthStats(
		        blogInfoVo.getMonthlyStatsThisMonth().getWalkCountThisMonth(),
		        blogInfoVo.getMonthlyStatsThisMonth().getTotalDistanceThisMonth(),
		        blogInfoVo.getMonthlyStatsThisMonth().getTotalLogTimeThisMonth()
		    );
		    blogInfoVo.getMonthlyStatsTotal().setTotalStats(
		        blogInfoVo.getMonthlyStatsTotal().getWalkCountTotal(),
		        blogInfoVo.getMonthlyStatsTotal().getTotalDistanceTotal(),
		        blogInfoVo.getMonthlyStatsTotal().getTotalLogTimeTotal()
		    );
		    
		    
		    List<FollowListVo> followerList =  walkBlogDao.getFollowerList(paramCode);
		    List<FollowListVo> followingList =  walkBlogDao.getFollowingList(paramCode);
		    
		    blogInfoVo.setFollowerList(followerList);
		    blogInfoVo.setFollowingList(followingList);
		
		    
		   List<BlogDogVo> blogDogList =  walkBlogDao.getBlogDogList(paramCode);
		    
		   for (BlogDogVo blogDog : blogDogList) {
	             
	            blogDog.setSaveName(walkBlogDao.getDogSaveName(blogDog.getDogNo()));
	        }
		   
		   List<BlogDogVo> friendDogList =  walkBlogDao.getFriendDogList(paramCode);
		    
		   for (BlogDogVo friendDog : friendDogList) {
	             
			   friendDog.setSaveName(walkBlogDao.getDogSaveName(friendDog.getDogNo()));
	        }
		   
		   List<BlogDogVo> mergedList = new ArrayList<>();         // list 합치기        mergedList.addAll(list1);        mergedList.addAll(list2);
		   
		   
		   mergedList.addAll(blogDogList);        
		   mergedList.addAll(friendDogList);
		   
		   
		   
		   blogInfoVo.setBlogDogList(mergedList); 
		    
		    
			System.out.println(blogInfoVo.getBannerSavename());
			System.out.println(blogInfoVo.getUserSavename());
			System.out.println(blogInfoVo.getBlogDogList());
		return blogInfoVo; 
	}

	public Map<String, Object> walkLogList(String paramCode, int crtPage, String date, int dogNo) {
	
		//페이징 계산
		System.out.println("WalkBlogService.walkLogList()");

		// 페이지당 글갯수
		int listCnt = 5;

		// 현재페이지 crtPage 파라미터 받는다
		// 없는 페이지면 1로 보낸다
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);

		// 시작글번호
		int startRNum = (crtPage - 1) * listCnt + 1;

		// 끝글번호
		int endRNum = (startRNum + listCnt) - 1;

		//walkLog리스트 가져오기
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogList(paramCode, startRNum, endRNum, date, dogNo);


		 // 각 walkLog에 대한 댓글 리스트 설정
        for (ShowLogVo walkLog : walkLogList) {
            List<ShowLogCmtVo> cmtList = walkBlogDao.getShowLogCmtList(walkLog.getWalkLogNo());
            walkLog.setShowLogCmtList(cmtList);
        }
        
        for (ShowLogVo walkLog : walkLogList) {
            List<UsedTrailVo> usedTrailList = walkBlogDao.getUsedTrailList(walkLog.getWalkLogNo());
            walkLog.setUsedTrailList(usedTrailList);
            
            System.out.println("usedTrailList = "+usedTrailList);
        }
        
        
        for (ShowLogVo walkLog : walkLogList) {
            
            walkLog.setWalkLogMap(walkBlogDao.getWalkLogMap(walkLog.getWalkLogNo()));
            walkLog.setUserSavename(walkBlogDao.getUserSavenameByWalkLogNo(walkLog.getWalkLogNo()));
        }
        
        
        for (ShowLogVo walkLog : walkLogList) {
        	System.out.println(walkLog.getWalkLogNo());
        	List<LogWalkedDogVo> walkedDogList = walkBlogDao.getWalkedDogList(walkLog.getWalkLogNo());
        	System.out.println(walkedDogList);
        	for (LogWalkedDogVo walkedDog : walkedDogList) {
                walkedDog.setSaveName(walkBlogDao.getWalkedDogImg(walkedDog.getDogNo()));
                System.out.println(walkedDog.getSaveName());
            }
    		
        	
        	
            walkLog.setWalkedDogList(walkedDogList);
           
        }
        
        for (ShowLogVo walkLog : walkLogList) {
            List<WalkLogConImgVo> imageList = walkBlogDao.getShowLogImageList(walkLog.getWalkLogNo());
            walkLog.setImageList(imageList);
            System.out.println(imageList);
        }

        
        
		///////////////////////////////////////////
		// 페이징 계산
		int pageBtnCount = 3; // 페이지당 버튼 갯수
		
		int totalCnt = walkBlogDao.selectTotalCnt(paramCode , date, dogNo); // 전체 글 갯수
		
		// 마지막버튼번호
		int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCount) * pageBtnCount;
		
		// 시작버튼번호
		int startPageBtnNo = (endPageBtnNo - pageBtnCount) + 1;
		
		// 다음화살표 유무
		boolean next = false;
		if (listCnt * endPageBtnNo < totalCnt) {
			next = true;
		} else { // 다음버튼이 없을때
			endPageBtnNo = (int) Math.ceil(totalCnt / (double) listCnt);
		}
		
		// 이전화살표 유무
		boolean prev = false;
		if (startPageBtnNo != 1) {
			prev = true;
		}
		
		
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("prev", prev);
		pMap.put("next", next);
		/* pMap.put("date", date); */
		pMap.put("walkLogList", walkLogList);
		
		/* return pMap; */
        
		System.out.println(pMap);
        
        
		
       
	
		
		
		return pMap;
	}
	
	

	public void deleteWalkLog(int no) {
		
		walkBlogDao.deleteWalkLog(no);
		
	}

	public void addComment(ShowLogCmtVo comment) {
	    walkBlogDao.addComment(comment);
	}
	
	public void deleteComment(int walkLogCmtNo) {
	    walkBlogDao.deleteComment(walkLogCmtNo);
	}
	 
	public String toggleFollow(int followerNo, int followeeNo) {
	    Map<String, Integer> map = new HashMap<>();
	    map.put("followerNo", followerNo);
	    map.put("followeeNo", followeeNo);

	    int followStatus = walkBlogDao.didIFollow(map);

	    if (followStatus == 0) {
	        // Follow
	        walkBlogDao.insertFollow(map);
	    } else {
	        // Unfollow
	        walkBlogDao.deleteFollow(map);
	    }

	    return "success";
	}

	public ShowLogVo getWalkLogByNo(int walkLogNo) {
		
		ShowLogVo walkLog = walkBlogDao.selectWalkLog(walkLogNo);
		
		List<LogWalkedDogVo> walkedDogList = walkBlogDao.getWalkedDogList(walkLogNo);
    	System.out.println(walkedDogList);
    	for (LogWalkedDogVo walkedDog : walkedDogList) {
            walkedDog.setSaveName(walkBlogDao.getWalkedDogImg(walkedDog.getDogNo()));
            System.out.println(walkedDog.getSaveName());
        }
    	
    	System.out.println(walkedDogList);
		
    	
    	
        walkLog.setWalkedDogList(walkedDogList);
		
		
		
		List<WalkLogConImgVo> imageList = walkBlogDao.getShowLogImageList(walkLogNo);
		
		walkLog.setImageList(imageList);
		System.out.println(imageList);
		
		return  walkLog;
	}

	public void updateWalkLog(ShowLogVo walkLogVo) {
		
		System.out.println("service.updateWalkLog");
		walkBlogDao.updateTitleContent(walkLogVo);
		
		
		
	}

	public List<ShowLogVo> walkLogListByDog(String paramCode, int dogNo) {
		
		Map<String, Object> map = new HashMap<>();
	    map.put("paramCode", paramCode);
	    map.put("dogNo", dogNo);
	    
	    System.out.println("dogNo = " + dogNo);
		
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogListByDog(map);
		
		
		 for (ShowLogVo walkLog : walkLogList) {
	            List<ShowLogCmtVo> cmtList = walkBlogDao.getShowLogCmtList(walkLog.getWalkLogNo());
	            walkLog.setShowLogCmtList(cmtList);
	        }
	        
	        
	        
	        for (ShowLogVo walkLog : walkLogList) {
	            
	            walkLog.setWalkLogMap(walkBlogDao.getWalkLogMap(walkLog.getWalkLogNo()));
	            walkLog.setUserSavename(walkBlogDao.getUserSavenameByWalkLogNo(walkLog.getWalkLogNo()));
	        }
	        
	        
	        for (ShowLogVo walkLog : walkLogList) {
	        	System.out.println(walkLog.getWalkLogNo());
	        	List<LogWalkedDogVo> walkedDogList = walkBlogDao.getWalkedDogList(walkLog.getWalkLogNo());
	        	System.out.println(walkedDogList);
	        	for (LogWalkedDogVo walkedDog : walkedDogList) {
	                walkedDog.setSaveName(walkBlogDao.getWalkedDogImg(walkedDog.getDogNo()));
	                System.out.println(walkedDog.getSaveName());
	            }
	    		
	        	
	        	
	            walkLog.setWalkedDogList(walkedDogList);
	           
	        }
	        
	        for (ShowLogVo walkLog : walkLogList) {
	            List<WalkLogConImgVo> imageList = walkBlogDao.getShowLogImageList(walkLog.getWalkLogNo());
	            walkLog.setImageList(imageList);
	            System.out.println(imageList);
	        }
			
		
		return walkLogList;
	}

	public List<ShowLogVo> walkLogListByDate(String paramCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * public String save(MultipartFile file) {
	 * System.out.println("FileService.save()");
	 * System.out.println(file.getOriginalFilename());
	 * 
	 * // 파일저장디렉토리 String saveDir = "C:\\javaStudy\\upload";
	 * 
	 * // (1)파일관련 정보 추출////////////////////////////////////////////////
	 * 
	 * // 오리지널 파일명 String orgName = file.getOriginalFilename();
	 * System.out.println(orgName);
	 * 
	 * // 확장자 String exName = orgName.substring(orgName.lastIndexOf("."));
	 * System.out.println(exName);
	 * 
	 * // 저장파일명(겹치지 않아야한다) String saveName = System.currentTimeMillis() +
	 * UUID.randomUUID().toString() + exName; System.out.println(saveName);
	 * 
	 * 
	 * // 파일사이즈 long fileSize = file.getSize(); System.out.println(fileSize);
	 * 
	 * 
	 * // 파일전체경로 String filePath = saveDir + "\\" + saveName;
	 * System.out.println(filePath);
	 * 
	 * // vo로 묶기 WalkLogConImgVo fileVo = new WalkLogConImgVo(orgName, saveName,
	 * filePath, fileSize, "walkLogCon", walkLogNo); System.out.println(fileVo);
	 * 
	 * // Dao만들기 --> DB저장 과제 ㅇㅇ 잘묶었으니 insert만들면 된다는데 System.out.println(fileVo
	 * +"DB저장");
	 * 
	 * // (2)파일저장(서버쪽 하드디스크에 저장)////////////////////////// // Stream 사용
	 * 
	 * try { byte[] fileData; fileData = file.getBytes();
	 * 
	 * OutputStream os = new FileOutputStream(filePath); BufferedOutputStream bos =
	 * new BufferedOutputStream(os);
	 * 
	 * bos.write(fileData); bos.close(); } catch (IOException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return saveName;
	 * 
	 * }
	 */
	
	public int getTotalWalkLogs(String paramCode) {
	    return walkBlogDao.getTotalWalkLogs(paramCode);
	}


}
