package com.grad.net.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.net.dto.JSONResult;
import com.grad.net.security.AuthUser;
import com.grad.net.service.CounselingService;
import com.grad.net.service.MemberService;
import com.grad.net.vo.CounselingVo;
import com.grad.net.vo.MemberVo;
import com.grad.net.vo.NotiVo;

@Controller("counselingAPIController")
@RequestMapping("/counseling/api")
public class CounselingController {

	@Autowired
	CounselingService counselingService;

	/**
	 * 박가혜 2017-08-23
	 */
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST) // 질문글 쓰기(원글쓰기)
	public JSONResult CounselingList(Model model, @RequestBody CounselingVo counselingVo, @AuthUser MemberVo authUser) {

		counselingVo.setMbNo(authUser.getMbNo());
		counselingService.setWrite(counselingVo);

		return JSONResult.success(counselingVo);
	}

	/**
	 * 박가혜 2017-08-24
	 */
	@ResponseBody
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST) // 질문글 쓰기(답글쓰기)
	public JSONResult CounselingReplyList(Model model, @RequestBody CounselingVo counselingVo,
			@AuthUser MemberVo authUser) {

		counselingVo.setMbNo(authUser.getMbNo());
		System.out.println(counselingVo);
		counselingService.setReplyWrite(counselingVo);

		return JSONResult.success(counselingVo);
	}

	/**
	 * 박가혜 2017-08-26, 28
	 */
	@ResponseBody
	@RequestMapping(value = "/likeadd", method = RequestMethod.POST) // 좋아요 +
	public JSONResult CounselingLikeAdd(Model model, @RequestBody CounselingVo counselingVo) {

		// 있으면 삭제하고 좋아요 취소
		// 없으면 새로 입력

		//System.out.println(counselingVo);
		CounselingVo existLike = counselingService.existLikeOne(counselingVo.getMbNo(), counselingVo.getWrtbtNo());
		//System.out.println(existLike);
	

		if (existLike == null) {

			//System.out.println("추가");
			counselingService.setLike(counselingVo.getMbNo(), counselingVo.getWrtbtNo(),counselingVo.getInfroDstnct());

		} else {

			//System.out.println("삭제");
			counselingService.deleteLike(counselingVo.getMbNo(), counselingVo.getWrtbtNo(),counselingVo.getInfroDstnct());

		}
		CounselingVo result = counselingService.getCounselingPrnts(counselingVo.getWrtbtNo()); //원글
		

		return JSONResult.success(result);
	}

}
