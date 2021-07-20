package com.bid.pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBid")
public class UpdateBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uid = (int) request.getSession().getAttribute("uid");
		int bid = (int) Integer.parseInt(request.getParameter("bidId"));
		float price = (float) Float.parseFloat(request.getParameter("price"));
		String comment = request.getParameter("comment");
		
		boolean ret = Bid.updateBid(uid, bid, price, comment);
		
		if(ret == true) {
			RequestDispatcher dis = request.getRequestDispatcher("/GameBoosting.jsp");
			dis.forward(request, response);
		} else {
			String message = "<Script>alert('You can place one bid only!, You already placed a bid...');</script>";
			String messageOnly = "You can place one bid only!, You already placed a bid...";
			request.setAttribute("alertScript", message);
			request.setAttribute("message", messageOnly);
			RequestDispatcher dis = request.getRequestDispatcher("/GameBoosting.jsp");
			dis.forward(request, response);
		}
	}

}
