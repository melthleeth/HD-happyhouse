//package com.ssafy.happyhouse.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.ssafy.happyhouse.model.MemberDto;
//import com.ssafy.happyhouse.model.dto.*;
//import com.ssafy.happyhouse.model.service.*;
//
///**
// * Servlet implementation class MainController
// */
//@WebServlet("/main.do")
//public class MainController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//     
//	private LoginService loginService;
//	private MemberService memberService;
//	
//	@Override
//	public void init() throws ServletException{
//		super.init();
//		loginService = new LoginServiceImpl();
//		memberService = new MemberServiceImpl();
//	}
//	
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public MainController() {
//        super();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		process(request, response);
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		request.setCharacterEncoding("utf-8");
//		process(request, response);
//	}
//	
//	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String root = request.getContextPath();
//		
//		String action = request.getParameter("action");
//		
//		if("login".equals(action)) {
//			login(request, response);   
//		} else if("logout".equals(action)) {
//			logout(request, response);
//		} else if("createMember".equals(action)) {
//			createMember(request, response);
//		} else if("searchMember".equals(action)) {
//			//searchHouse(request, response);
//		} else if("update".equals(action)) {
//			updateMember(request, response);
//		} else if("listMember".equals(action)) {
//			listMember(request, response);
//		} else if("delete".equals(action)) {
//			deleteMember(request, response);
//		} else if("findPW".equals(action)) {
//			findPassword(request, response);
//		} else {
//			response.sendRedirect(root);
//		}
//	}
//
//	private void findPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//String path = "/index.jsp";
//		try {
//			String username = request.getParameter("username");
//			String password = memberService.findPassword(username);
//			if(!password.equals(null)) {
//				password = password.substring(0, password.length()-2);
//				password = password + "**";
//			}
//			System.out.println("###"+password);
//			response.setContentType("text/plain;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.print(password);
////			member.setAddress(request.getParameter("address"));
////			member.setPhone(request.getParameter("phone"));
////			member.setEmail(request.getParameter("email"));
////			memberService.updateMember(memberno, member);
//			//path = "/index.jsp";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "회원을 수정하는 중 문제가 발생했습니다.");
//			//path = "/error/error.jsp";
//		}
//		
//		
//	}
//	
//	private void updateMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = "/main.do?action=listMember";
//		
//		try {
//			MemberDto member = null;
//			int memberno = Integer.parseInt(request.getParameter("memberno"));
//			member = memberService.searchMember(memberno);
//			member.setAddress(request.getParameter("address"));
//			member.setPhone(request.getParameter("phone"));
//			member.setEmail(request.getParameter("email"));
//			memberService.updateMember(memberno, member);
//			path = "/main.do?action=listMember";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "회원을 수정하는 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//		
//	}
//
//	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = "/index.jsp";
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		try {
//			MemberDto memberDto = loginService.login(username, password);
//			if(memberDto != null) { // 받은 값 있으면 = 로그인 성공이면
//				// session 설정
//				HttpSession session = request.getSession();
//				session.setAttribute("userinfo", memberDto);
//				
//			} else {
//				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인 해주세요.");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "로그인 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//	
//	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		HttpSession session = request.getSession();
//		session.invalidate();
//		response.sendRedirect(request.getContextPath());
//	}
//
//	private void deleteMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		String path = "/main.do?action=listMember";
//		
//		System.out.println("delete");
//		try {
//			memberService.deleteMember(Integer.parseInt(request.getParameter("memberno")));
//			path = "/main.do?action=listMember";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "회원을 삭제하는 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//
//	private void createMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		String path = "/index.jsp";
//		try {
//			MemberDto member = new MemberDto();
//			member.setUsername(request.getParameter("username"));
//			member.setPassword(request.getParameter("password"));
//			member.setAddress(request.getParameter("address"));
//			member.setPhone(request.getParameter("phone"));
//			member.setEmail(request.getParameter("email"));
//			
//			memberService.createMember(member);
//			
//			path = "/index.jsp";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "회원 가입 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//
//	private void listMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		String path = "/member-management.jsp";
//		try {
//			List<MemberDto> list = memberService.getMemberList();
//			System.out.println(list.size());
//			request.setAttribute("memberlist", list);
//			path = "/member-management.jsp";
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "회원 목록을 얻어오는 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//}
