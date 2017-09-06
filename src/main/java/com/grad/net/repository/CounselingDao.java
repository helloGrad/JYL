package com.grad.net.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;





@Repository
public class CounselingDao {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 박가혜 2017-08-23
	 */
	public void insert(CounselingVo counselingVo) {
		sqlSession.insert("counseling.insert",counselingVo);
	}
	
	/**
	 * 박가혜 2017-08-23
	 */
	public List<CounselingVo> getCounselingList() {
		return sqlSession.selectList("counseling.getcounselingList");
	}
	/**
	 * 박가혜 2017-08-23
	 */
	public List<CounselingVo> getReplyList() {
		return sqlSession.selectList("counseling.getReplyList");
	}
	/**
	 * 박가혜 2017-08-24
	 */
	public CounselingVo getCounselingPrnts(Long no) {
		CounselingVo vo = sqlSession.selectOne("counseling.getcounselingPrnts", no);
		return vo;
	}
	
	/**
	 * 박가혜 2017-08-24
	 */
	public List<CounselingVo> getReplyDetail(Long no) {
		return sqlSession.selectList("counseling.getReplyDetail", no);
	}

	
	/**
	 * 박가혜 2017-08-24
	 */
	public void insertReply(CounselingVo counselingVo) {
		sqlSession.insert("counseling.insertReply",counselingVo);
	}
	
	/**
	 * 박가혜 2017-08-25
	 */
	public void updateFindCo(Long no) {
		sqlSession.update("counseling.updateFindCo",no);
	}
	
	
	/**
	 * 박가혜 2017-08-25
	 */
	public List<CounselingVo> getLike(Map<String, Object> map){
		
		return sqlSession.selectList("counseling.getLike", map);
	}
	
	/**
	 * 박가혜 2017-08-28
	 */
	public CounselingVo selectLikeOne(Map<String, Object> map) {
		CounselingVo vo = sqlSession.selectOne("counseling.selectLikeOne", map);
		return vo;
	}
	
	
	
	/**
	 * 박가혜 2017-08-28
	 */
	public void deleteLike(Map<String, Object> map) {
		
		sqlSession.delete("counseling.deleteLike",map);

	}
	
	/**
	 * 박가혜 2017-08-28
	 */
	public void insertLike(Map<String, Object> map) {
		
		sqlSession.insert("counseling.insertLike",map);

	}
	
	/**
	 * 박가혜 2017-08-25
	 */
	public void updateDownLike(Long wrtbtNo) {
		sqlSession.update("counseling.updateDownLike",wrtbtNo);
	}

	
	/**
	 * 박가혜 2017-08-25
	 */
	public void updateDownDislike(Long wrtbtNo) {
		sqlSession.update("counseling.updateDownDislike",wrtbtNo);
	}

	/**
	 * 박가혜 2017-08-25
	 */
	public void updateUpLike(Long wrtbtNo) {
		sqlSession.update("counseling.updateUpLike",wrtbtNo);
		
	}

	
	/**
	 * 박가혜 2017-08-25
	 */
	public void updateUpDislike(Long wrtbtNo) {
		sqlSession.update("counseling.updateUpDislike",wrtbtNo);
	}
}
