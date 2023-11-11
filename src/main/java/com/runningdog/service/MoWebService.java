package com.runningdog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.MoWebDao;
import com.runningdog.vo.UseTrailVo;

@Service	
public class MoWebService {
	
	@Autowired
	private MoWebDao moWebDao;
	
	// (1)
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Service");				
		return moWebDao.trailSelect();
	}

}
