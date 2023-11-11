package com.runningdog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.UseTrailVo;

@Repository
public class MoWebDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// (1)
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Dao");		
		return sqlSession.selectList("walkLog.trailSelect");
	}	
	
	

}
