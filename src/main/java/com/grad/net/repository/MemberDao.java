package com.grad.net.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;


	public boolean insert(MemberVo memberVo) {
		return 1==sqlSession.insert("member.insert", memberVo);
	}
	
	
	public void snsinsert(Map<String, Object> map) {
		System.out.println(map.get("memberVo"));
		sqlSession.insert("member.snsinsert",map);		
	}


	public MemberVo getByToken(MemberVo memberVo) {
		return sqlSession.selectOne("member.getByToken", memberVo);
	}

	public MemberVo getByIden(String EMAIL) {
		return sqlSession.selectOne("member.getByIden", EMAIL);
	}

	
	public MemberVo getUser(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("member.getByLoginInfo", map);
	}

	
	public List<CodeVo> getMbinfoList(MemberVo memberVo) {
	
		Long mbNo = memberVo.getMbNo();
		return sqlSession.selectList("member.getByCode", mbNo);
	}

	public void insertMbinfo(Long mbNo, String information) {				
		Map<String, Object> map= new HashMap<String, Object>(); 
		
		map.put("mbNo", mbNo);
		map.put("information", information);
		
		sqlSession.insert("member.insertMbinfo",map);		
	}
	
	public void infordelete(Long mbNo){		
		sqlSession.delete("member.deleteMbinfo",mbNo);		
	}
	

	public MemberVo getUser(String iden){
		return sqlSession.selectOne("member.getBySns", iden);
	}

	
	public void updateInfoYn(Long mbNo){
		
		sqlSession.update("member.updateInfoYn", mbNo);
	}
	
	public MemberVo existNknm(String nknm) {
		return sqlSession.selectOne("member.existNknm", nknm);
	}


	public MemberVo getUserByToken(String token) {
		return sqlSession.selectOne("member.getBySnsToken", token);
	}


}
