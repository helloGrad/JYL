package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.NotiDao;
import com.grad.net.vo.NotiVo;

@Service
public class NotiService {
	
	@Autowired
	NotiDao notiDao;

	/**
	 * 허주한
	 */
	public List<NotiVo> getNotiList(String type) {
		
		return notiDao.getNotiList(type);
	}
	/**

	
	/**
	 * 허주한
	 */
	public List<NotiVo> getNotiListByPage(int page, String type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("page", page-1);
		map.put("type", type);
		return notiDao.getNotiListByPage(map);
	}
	
	
	/*
	 * 정예린, 박가혜
	 */	
	public NotiVo getNoti(String tabnm, int no) {
		return notiDao.getByNo(tabnm,no);
		
	}

}
