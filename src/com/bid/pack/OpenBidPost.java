package com.bid.pack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OpenBidPost")
public class OpenBidPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		try {
			int pid = Integer.parseInt(request.getParameter("bidBtn"));
			ArrayList<BidPost> bp = BidDBUtil.getBidPosts(pid);
			BidPost b = BidDBUtil.getBidAPost(pid);
			ArrayList<Bid> bid = Bid.getBids(pid);
			request.setAttribute("bpost", b);
			request.setAttribute("bidPost", bp);
			request.setAttribute("bids", bid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("BidPostPage.jsp");
		dis.forward(request, response);
	}

}
