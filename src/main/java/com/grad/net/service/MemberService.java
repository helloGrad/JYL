package com.grad.net.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.net.repository.MemberDao;
import com.grad.net.vo.CodeVo;
import com.grad.net.vo.MemberVo;



	

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public boolean register(MemberVo memberVo) {
		return memberDao.insert(memberVo);

	}

	/*
	 * 정예린, 박가혜
	 */
	
	// sns login(fb, nave, google)
	public void snslogin(MemberVo memberVo, String snsnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (snsnm.equals("fb") || snsnm.equals("google")) {
			memberVo = changeData(memberVo, snsnm);
		}

		System.out.println("service : " + memberVo);
		map.put("memberVo", memberVo);
		map.put("snsnm", snsnm);

		memberDao.snsinsert(map); //회원가입 
	}

	public MemberVo getUser(String iden, String pw) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iden", iden);
		map.put("pw", pw);

		return memberDao.getUser(map);

	}

	/*
	 * 정예린
	 */
	public boolean existEamil(String IDEN) {
		MemberVo memberVo = memberDao.getByIden(IDEN);
		return memberVo != null;
	}
	

	/*
	 * 허주한
	 */
	public boolean existNknm(String nknm) {
		MemberVo vo = memberDao.existNknm(nknm);
		if(vo==null){
			return false;
		}
		return true;
	}

	private MemberVo changeData(MemberVo memberVo, String snsnm) {

		if (memberVo.getSex().equals("female")) {
			memberVo.setSex("F");
			;
		} else if (memberVo.getSex().equals("male")) {
			memberVo.setSex("M");
			;
		} else {
			memberVo.setSex(null);
			;
		}

		if (snsnm.equals("fb")) {
			String[] split = (memberVo.getBirdt()).split("/");
			memberVo.setBirdt(split[2] + split[0] + split[1]);

			if (memberVo.getIden().equals("") || memberVo.getIden().equals("undefined")) {
				memberVo.setIden(null);
				;
			}
		}
		return memberVo;

	}

	public boolean checkMember(MemberVo memberVo) {
		MemberVo membervo = memberDao.getByToken(memberVo);
		return membervo != null;
	}

	public List<CodeVo> getMbinfoList(MemberVo memberVo) {

		return memberDao.getMbinfoList(memberVo);
	}

	public void registerMbinfo(Long mbNo, List<String> information) {

		for (int i = 0; i < information.size(); i++) {
			memberDao.insertMbinfo(mbNo, information.get(i));
		}
	}

	public void updateMbinfo(Long mbNo, String[] info) {

		memberDao.infordelete(mbNo);
		for (int i = 0; i < info.length; i++) {
			memberDao.insertMbinfo(mbNo, info[i]);
		}
	}
	
	
	
	public MemberVo getUser(String iden){


		return memberDao.getUser(iden);

	}
	
	public MemberVo getUserByToken(String token){
		return memberDao.getUserByToken(token);
	}
	
	
	public void changeInfoYn(Long mbNo){


		 memberDao.updateInfoYn(mbNo);

	}
}
