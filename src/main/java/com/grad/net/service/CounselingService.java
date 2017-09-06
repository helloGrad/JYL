package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.CounselingDao;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;





@Service
public class CounselingService {
	
	@Autowired
	CounselingDao counselingDao;
	
	
	/**
	 * 박가혜 2017-08-23
	 */
	public void setWrite(CounselingVo counselingVo) {
		
		counselingDao.insert(counselingVo);

	}

	/**
	 * 박가혜 2017-08-23
	 */
	public List<CounselingVo> getCounselingList() {
		
		return counselingDao.getCounselingList();
	}

	/**
	 * 박가혜 2017-08-23
	 */
	public List<CounselingVo> getReplyList() {
		
		return counselingDao.getReplyList();
	}
	/**
	 * 박가혜 2017-08-24
	 */
	public  CounselingVo getCounselingPrnts(Long no) {
		
		return counselingDao.getCounselingPrnts(no);
	}
	
	/**
	 * 박가혜 2017-08-24
	 */
	public List<CounselingVo> getCounselingReplyDetail(Long no) {
		
		return counselingDao.getReplyDetail(no);
	}
	
	/**
	 * 박가혜 2017-08-24
	 */
	public void setReplyWrite(CounselingVo counselingVo) {
		
		counselingDao.insertReply(counselingVo);

	}
	
	
	/**
	 * 박가혜 2017-08-25
	 */
	public void ChangefindCo(Long no) {
		
		counselingDao.updateFindCo(no);

	}
	
	
	/**
	 * 박가혜 2017-08-25
	 */
	public List<CounselingVo> existLike(Long mbNo,Long no){
		
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("no", no);
		
		return counselingDao.getLike(map);
		
	}
	
	/**
	 * 박가혜 2017-08-28
	 */
	public  CounselingVo existLikeOne(Long mbNo,Long no) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("no", no);
		
		return counselingDao.selectLikeOne(map);
	}
	
	
	
	
	
	/**
	 * 박가혜 2017-08-28
	 */
	public void deleteLike(Long mbNo, Long wrtbtNo, String infroDstnct) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("wrtbtNo", wrtbtNo);
		
		if(infroDstnct.equals("like")==true) {
			
			counselingDao.updateDownLike(wrtbtNo);
			
		}
		if(infroDstnct.equals("dislike")==true) {
			
			
			counselingDao.updateDownDislike(wrtbtNo);
		}
		
		
		counselingDao.deleteLike(map);
		

	}
	
	/**
	 * 박가혜 2017-08-28
	 */
	public void setLike(Long mbNo, Long wrtbtNo, String infroDstnct) {
		
		Map<String, Object> map = new HashMap<String, Object>() ;
		map.put("mbNo", mbNo);
		map.put("wrtbtNo", wrtbtNo);
		map.put("infroDstnct", infroDstnct);
		
		if(infroDstnct.equals("like")==true) {
			
			counselingDao.updateUpLike(wrtbtNo);
			
		}
		if(infroDstnct.equals("dislike")==true) {
			
			
			counselingDao.updateUpDislike(wrtbtNo);
		}
		
		
		counselingDao.insertLike(map);

	}
	
}
