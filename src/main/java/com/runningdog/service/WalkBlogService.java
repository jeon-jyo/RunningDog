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
import com.runningdog.vo.LogWalkedDogVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.WalkLogConImgVo;
import com.runningdog.vo.WalkedDogVo;

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

	public List<ShowLogVo> walkLogList(String paramCode) {
		
		//기본정보가져오기
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogList(paramCode);
		
		
		 // 각 walkLog에 대한 댓글 리스트 설정
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
		
		
		
		List<WalkLogConImgVo> imageList = walkBlogDao.getShowLogImageList(walkLogNo);
		ShowLogVo walkLog = walkBlogDao.selectWalkLog(walkLogNo);
		walkLog.setImageList(imageList);
		
		return  walkLog;
	}

	public void updateWalkLog(ShowLogVo walkLogVo) {
		
		System.out.println("service.updateWalkLog");
		walkBlogDao.updateTitleContent(walkLogVo);
		
		
		
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


}
