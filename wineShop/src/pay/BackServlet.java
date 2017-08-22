package pay;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BackServlet
 */
@WebServlet("/backServlet")
public class BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		/*
		 * �ױ����ṩһϵ�еĽ�����������ǻ�ȡ������Ҫ�ļ���
		 * ��ȡ֧�������r1_Code��1��ʾ֧���ɹ���
		 * ��ȡ֧����r3_Amt
		 * ��ȡ���̵Ķ����ţ�r6_Order
		 * ��ȡ����������ͣ�r9_BType��1��ʾ�ض��򷵻أ�2��ʾ��Ե㷵�أ�
		 *     ����Ե������ղ�������Ϊ���ǵ�ip���Ǿ�����ip��
		 */
		String r1_Code = request.getParameter("r1_Code");
		String r3_Amt = request.getParameter("r3_Amt");
		String r6_Order = request.getParameter("r6_Order");
		String r9_BType = request.getParameter("r9_BType");
		
		if(r1_Code.equals("1")) {
			if(r9_BType.equals("1")) {
				response.getWriter().print("<h1>֧���ɹ���</h1>");//��ʵ֧�����ɹ�ʱ�����ױ������Ͳ��᷵�ص���Servlet
				response.getWriter().print("֧�����Ϊ��" + r3_Amt + "<br/>");
				response.getWriter().print("������Ϊ��" + r6_Order + "<br/>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
