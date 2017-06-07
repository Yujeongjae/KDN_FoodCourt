package com.kdn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.MemberService;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberServie;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		
		return model;
	}
	
	@RequestMapping(value="insertMemberForm.do", method=RequestMethod.GET)
	public String insertMemberForm(Model model) {
		model.addAttribute("content", "member/insertMember.jsp;");
		return "index";
	}
	
	@RequestMapping(value="insertMember.do", method=RequestMethod.POST)
	public String insertMember(Member member, Model model) {
		memberServie.add(member);
		model.addAttribute("content", "member/login.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, String id, String pw) {
		System.out.println(id);
		session.setAttribute("id", id);
		return "index";
	}
	
	@RequestMapping(value="loginform.do", method=RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("content", "member/login.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String login(HttpSession session) {
		session.removeAttribute("id");
		return "index";
	}
	
	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("member", memberServie.search(id));
		model.addAttribute("content", "member/memberInfo.jsp");
		
		return "index";
		
	}
	
	@RequestMapping(value="memberUpdateForm.do", method=RequestMethod.GET)
	public String memberUpdateForm(Model model) {
		model.addAttribute("content", "member/updateMember.jsp");
		
		return "index";
		
		
	}
	
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public String updateMember(Member member, Model model) {
		memberServie.update(member);
		model.addAttribute("content", "member/memberInfo.jsp");
		
		return "index";
		
	}
	
	@RequestMapping(value="memberList.do", method=RequestMethod.GET)
	public String memberList(PageBean bean, Model model) {
		List<Member> list = memberServie.searchAll(bean);
		model.addAttribute("mlist", list);
		model.addAttribute("content", "member/memberList.jsp");
		
		return "index";
	}
}








