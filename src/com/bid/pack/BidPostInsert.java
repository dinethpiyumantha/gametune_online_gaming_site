package com.bid.pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BidPostInsert")
public class BidPostInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uid = Integer.toString((int) request.getSession().getAttribute("uid"));
		String title = request.getParameter("Title");
		String subTitle = request.getParameter("SubTitle");
		String bidDescription = request.getParameter("BidDescription");
		String game = request.getParameter("Game");
		String lbFrom = request.getParameter("lbFrom");
		String lbTo = request.getParameter("lbTo");
		String platform = request.getParameter("Platform");
		String maxBid = request.getParameter("MaxBid");
		String bidEnd = request.getParameter("BidEnd");
		System.out.println(uid+"----------------"+game);
		
		boolean ret = BidDBUtil.insertBidPost(title, subTitle, bidDescription, lbFrom, lbTo, platform, maxBid, bidEnd, uid, game);
		
		if(ret == true) {
			RequestDispatcher dis = request.getRequestDispatcher("/GameBoosting.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("/Home.jsp");
			dis2.forward(request, response);
		}
	}
}
