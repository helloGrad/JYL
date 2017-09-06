package com.grad.net;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.net.security.Auth;
import com.grad.net.security.AuthUser;
import com.grad.net.service.CounselingService;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;

import net.sf.json.JSONArray;





@Controller
@RequestMapping("/counseling")
public class CounselingController {
	
	
	@Autowired
	CounselingService counselingService;
	
	
	/**
	 * 박가혜 2017-08-23
	 */
	
	@RequestMapping("/list")
	public String counselingList(Model model, @AuthUser MemberVo authUser) {

		List<CounselingVo> counselingList= counselingService.getCounselingList();
		List<CounselingVo> ReplyList= counselingService.getReplyList();
	
		model.addAttribute("authUser", authUser);
		model.addAttribute("counselingList", counselingList);
		model.addAttribute("replyList", ReplyList);
		
		

		return "/counseling/list";
	}
	
	/**
	 * 박가혜 2017-08-24
	 */
	
	
	@RequestMapping("/detail")
	@Auth(role = Auth.Role.USER)
	public String counselingDetail( Model model, @RequestParam("no") Long no,@AuthUser MemberVo authUser, @RequestParam("type") String type) {
		
		
		//System.out.println(authUser.getMbNo()+" "+no);
		CounselingVo counselingPrnts = counselingService.getCounselingPrnts(no); //원글
		List<CounselingVo> counselingReplyList = counselingService.getCounselingReplyDetail(no); //답글
		List<CounselingVo> existLike =counselingService.existLike(authUser.getMbNo(),no);
		
	
		

		
		//조횟수 
		//counselingService.ChangefindCo(no);
		
		

		model.addAttribute("authUser", authUser);
		model.addAttribute("counselingPrnts", counselingPrnts);
		model.addAttribute("counselingReplyList", counselingReplyList);
		model.addAttribute("type", type); //제목클릭 , 답변하기 클릭을 구분하기 위해서 
		model.addAttribute("existLike", existLike); //좋아요 싫어요
		
		
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		JSONArray jsonArray3 = new JSONArray();
		
		
		
		CounselingVo counselingPrnts2 = new CounselingVo();
		counselingPrnts2.setWrtbtNo(counselingPrnts.getWrtbtNo());
			
		List<CounselingVo> counselingReplyList2 = new ArrayList<CounselingVo>();


		
		for(int i=0; i<counselingReplyList.size(); i++) {
			
			counselingReplyList2.add(new CounselingVo());
			counselingReplyList2.get(i).setWrtbtNo(counselingReplyList.get(i).getWrtbtNo());
			//System.out.println(counselingReplyList2.get(i).getWrtbtNo());
			
	
		}

		//System.out.println(existLike);
		
	
		model.addAttribute("jsoncounselingPrnts", jsonArray.fromObject(counselingPrnts2));
		model.addAttribute("jsonexistLike", jsonArray2.fromObject(existLike)); 
		
		model.addAttribute("jsoncounselingReply", jsonArray3.fromObject(counselingReplyList2)); 
	
		


		
		return "/counseling/detail";
	}
	
	
	
	
	
	
	

}
