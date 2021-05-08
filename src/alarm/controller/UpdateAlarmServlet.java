package alarm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alarm.model.service.AlarmService;
import alarm.model.vo.Alarm;

/**
 * Servlet implementation class UpdateAlarmServlet
 */
@WebServlet(name = "UpdateAlarm", urlPatterns = { "/updateAlarm" })
public class UpdateAlarmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAlarmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String stat = request.getParameter("stat");
		int alarmNum = Integer.parseInt(request.getParameter("alarmNum"));
		int result = new AlarmService().updateStatus(alarmNum,stat);
		Alarm prevAl = new AlarmService().searchAlarm(alarmNum);
		
		int sendResult = new AlarmService().sendMessage(alarmNum,prevAl);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.print(true);
		}
		else {
			out.print(false);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
