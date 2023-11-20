package com.runningdog.service;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.dao.MoWebDao;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.MoWalkedDogVo;
import com.runningdog.vo.UseTrailVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.XYVo;

@Service	
public class MoWebService {
	
	@Autowired
	private MoWebDao moWebDao;
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("서비스 모바일웹 로그인");
		return moWebDao.selectOneUser(userVo);
	}
	
	
	// (1) 산책로 불러오기
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Service");				
		return moWebDao.trailSelect();
	}
	
	// (2) 강아지정보 가져오기
	public List<MoDogVo> dogSelect(int userNo){
		System.out.println("서비스 강아지가져오기");				
		return moWebDao.dogSelect(userNo);
	}
	
	// (3) 산책기록하기
	public void walkLogInsert(MoWalkLogVo moWalkLogVo){
		System.out.println("서비스 산책기록하기");
		//산책기록
		moWebDao.walkLogInsert(moWalkLogVo);
		
		System.out.println("셀렉트키가 포함된 산책기록 : "+moWalkLogVo);	
		System.out.println("셀렉트키 : "+ moWalkLogVo.getWalkLogNo());		
		int walkLogNo = moWalkLogVo.getWalkLogNo();
		
		// 산책한 강아지 리스트 저장 ------------------------------------------------------
		System.out.println("강아지리스트 : "+moWalkLogVo.getDogNoList());
		for (Integer dogNo : moWalkLogVo.getDogNoList()) {
			MoWalkedDogVo walkedDogVo = new MoWalkedDogVo();
			walkedDogVo.setDogNo(dogNo); // 산책한 강아지번호
			walkedDogVo.setWalkLogNo(walkLogNo); // 셀렉트키
            System.out.println("개번호확인 : "+ walkedDogVo);	
            // 한땀한땀 뜯어낸 강아지번호값을 DB로 보내서 저장하기 
            moWebDao.dogListInsert(walkedDogVo);
        }
		
		// 좌표리스트 넣어서 저장 ------------------------------------------------------
		System.out.println("좌표리스트 : "+moWalkLogVo.getPolylinePath());	
        // XYVo 리스트를 순회하면서 CoordsVo로 변환 후 리스트에 추가
		// coordOrder 변수를 1부터 시작
        int coordOrder = 1;
        
        for (XYVo xyVo : moWalkLogVo.getPolylinePath()) {
            CoordsVo coordsVo = new CoordsVo();
            coordsVo.setUseNo(walkLogNo); // 셀렉트키
            coordsVo.setLat(xyVo.getY());  // XYVo의 Y값을 CoordsVo의 lat으로 설정
            coordsVo.setLng(xyVo.getX());  // XYVo의 X값을 CoordsVo의 lng으로 설정
            coordsVo.setCoordOrder(coordOrder);
            // 리스트에 추가
            // coordOrder를 1씩 증가
            coordOrder++;
            System.out.println("좌표확인 : "+ coordsVo);	
            // 한땀한땀 뜯어낸 좌표값을 DB로 보내서 저장하기 
            moWebDao.coordsListInsert(coordsVo);
        }       
		
		//캡쳐이미지
        //리턴되는게 파일 경로+이름
        mapImgSave(walkLogNo);
        
        //캡쳐이미지 정보(경로   , walkLogNo)   
		
		//첨부파일처리X
		
	}
	
	// (6) 캡쳐용 좌표값 불러오기
	public List<CoordsVo> mapSelect(int walkLogNo){
		System.out.println("서비스 캡쳐용 좌표값 불러오기");		
		return moWebDao.mapSelect(walkLogNo);		
	}
	
	// (0) 유사한 산책로 불러오기 (현재는 더미데이터 3개 불러오기)
	public List<MoTrailVo> trailSelect(int locationNo){
		System.out.println("서비스 산책로 3개 불러오기");			
		return moWebDao.trailSelect(locationNo);					
	}	
	
	// 첨부이미지 저장하기
	public String imgsSave(int walkLogNo,MultipartFile file){
		System.out.println("서비스 첨부이미지 저장하기");	
		
		ImagesVo imagesVo = new ImagesVo();
		
		// 0.파일 경로
		String saveDir = "C:\\\\javaStudy\\\\upload";
		
		// 1.파일관련 자료 추출/////////////////////////////////////////////////////////
		// (1) 오리지날네임 추출
		String orgName = file.getOriginalFilename();
		System.out.println(orgName);
		
		// (2) 확장자 추출
		String exName = orgName.substring(orgName.lastIndexOf("."));
        // 몇번째에 "." 있는지 확인하는 메소드 + 그걸 잘라내고 추출하는 메소드
		System.out.println(exName);
		
		// (3) 저장파일명 (겹치지 않아야 한다)
		String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
				                // long + 문자열 + 확장자
		System.out.println(saveName);
		
		// (4) 파일 사이즈
		long fileSize = file.getSize();
		System.out.println(fileSize);
		
		// (5) 파일 경로
		String filePath = saveDir +"\\"+ saveName;
		System.out.println(filePath);
		
		// (6) Vo로 묶기
		imagesVo.setFilePath(filePath);
		imagesVo.setOrgName(orgName);
		imagesVo.setSaveName(saveName);
		imagesVo.setType("walkLogCon"); // 타입지정
		imagesVo.setUseNo(walkLogNo); // 셀렉트키 넣기
		//imagesVo.setFileSize(fileSize);			
		
		System.out.println(imagesVo);
		
		// (7) Dao 만들어서 저장하기
		System.out.println("db에 저장 " + imagesVo);
		moWebDao.imgsSave(imagesVo);
		
		 //파일저장(서버쪽 하드디스크에 저장)/////////이거 서비스에서 처리하기///////////////// 
		try { byte[]
			fileData; fileData = file.getBytes();			 
			OutputStream os = new
			FileOutputStream("C:\\javaStudy\\upload\\"+file.getOriginalFilename()+".png"); BufferedOutputStream
			bos = new BufferedOutputStream(os);			 
			bos.write(fileData); bos.close();		 
		} catch (IOException e) {
		e.printStackTrace(); }	
		
		return "";					
	}	
	
	/* 셀레리움으로 화면캡쳐하기 */
	private String mapImgSave(int walkLogNo) {
		System.out.println("서비스 맵이미지 저장하기");	
		
		String path = System.getProperty("user.dir");
        System.out.println("현재 작업 경로: " + path);
		
        System.setProperty("webdriver.chrome.driver", "C:\\javaStudy\\RunningDog\\webapp\\assets\\driver\\chromedriver.exe");

        // Create a new instance of the Chrome driver
        WebDriver driver = new ChromeDriver();
        
        driver.get("http://localhost:433/RunningDog/m/walkMap?walkLogNo="+walkLogNo); // 학원 경로
        //driver.get("http://localhost:8000/RunningDog/m/walkMap?walkLogNo="+walkLogNo); // 집 경로
        driver.manage().window().setSize(new Dimension(745+16, 380+138));
 
        String savePath = null;
        try {
        	ImagesVo imagesVo = new ImagesVo();
        	
        	String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+".jpg";
        	
            // 캡쳐 코드
        	savePath = "C:\\javaStudy\\upload\\mapImg\\" + saveName;
            File srcFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
            FileUtils.copyFile(srcFile, new File(savePath));
            
         // (6) Vo로 묶기
    		imagesVo.setFilePath(savePath);
    		imagesVo.setOrgName(saveName);
    		imagesVo.setSaveName(saveName);
    		imagesVo.setType("walkLogMap"); // 타입지정
    		imagesVo.setUseNo(walkLogNo); // 셀렉트키 넣기
    		//imagesVo.setFileSize(fileSize);	
    		
    		// (7) Dao 만들어서 저장하기
    		System.out.println("맵이미지 db에 저장 " + imagesVo);
    		moWebDao.imgsSave(imagesVo);            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Close the browser
        //driver.quit();
      
		return savePath;
	}

}
