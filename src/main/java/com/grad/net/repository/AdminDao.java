package com.grad.net.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.NotiVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void insertNoti(Map<String, Object> map) {
		sqlSession.insert("noti.insertNoti", map);		
	}

}
