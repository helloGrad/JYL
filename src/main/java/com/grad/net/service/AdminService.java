package com.grad.net.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.AdminDao;
import com.grad.net.vo.NotiVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	
	/*
	 * 정예린
	 */	
	public void registerNoti(NotiVo notiVo, String tabnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notiVo", notiVo);
		map.put("tabnm", tabnm);
		
		System.out.println(notiVo);
		adminDao.insertNoti(map);		
	}

}
