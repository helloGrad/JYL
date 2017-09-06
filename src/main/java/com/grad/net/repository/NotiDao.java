package com.grad.net.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.NotiVo;
import com.grad.net.vo.OrganzVo;



@Repository
public class NotiDao {
	
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 허규준
	 */
	public List<NotiVo> getNotiList(String type) {
		return sqlSession.selectList("noti.getNotiList",type);
	}

	

	/**
	 * 허규준
	 */
	public List<NotiVo> getNotiListByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noti.getNotiListByPage", map);
	}

	
	public NotiVo getByNo(String tabnm, int no) {
		NotiVo vo = new NotiVo();
		
		/*
		 * 정예린 
		 */	
		if(tabnm.equals("대학원")) {
			vo = sqlSession.selectOne("noti.getGradByNo", no);
			//System.out.println("vo");
		}
		/*
		 * 박가혜 
		 */
		else if(tabnm.equals("연구실")) {
			vo = sqlSession.selectOne("noti.getLabByNo", no);
		}
		
		return vo;
	}
	
	

}
