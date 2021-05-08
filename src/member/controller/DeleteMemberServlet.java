package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet(name = "DeleteMember", urlPatterns = { "/deleteMember" })
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		int result = new MemberService().deleteMember(m.getMemberNo());
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		
		if(result>0) {
			session.invalidate();
			request.setAttribute("msg", "회원탈퇴 되었습니다.\\n이용해주셔서 감사합니다.");
			request.setAttribute("loc", "/index.jsp");
		}
		else {
			request.setAttribute("msg", "회원탈퇴에 실패했습니다.");
			request.setAttribute("loc", "/myPage");
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
