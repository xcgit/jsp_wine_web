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
		 * 易宝会提供一系列的结果参数，我们获取其中需要的即可
		 * 获取支付结果：r1_Code，1表示支付成功。
		 * 获取支付金额：r3_Amt
		 * 获取电商的订单号：r6_Order
		 * 获取结果返回类型：r9_BType，1表示重定向返回，2表示点对点返回，
		 *     但点对点我们收不到，因为我们的ip都是局域网ip。
		 */
		String r1_Code = request.getParameter("r1_Code");
		String r3_Amt = request.getParameter("r3_Amt");
		String r6_Order = request.getParameter("r6_Order");
		String r9_BType = request.getParameter("r9_BType");
		
		if(r1_Code.equals("1")) {
			if(r9_BType.equals("1")) {
				response.getWriter().print("<h1>支付成功！</h1>");//其实支付不成功时根本易宝根本就不会返回到本Servlet
				response.getWriter().print("支付金额为：" + r3_Amt + "<br/>");
				response.getWriter().print("订单号为：" + r6_Order + "<br/>");
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
