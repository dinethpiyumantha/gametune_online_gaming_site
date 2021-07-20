package com.bid.pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pid = Integer.parseInt(request.getParameter("deletePost"));
		
		boolean ret = BidDBUtil.deletePost(pid);
		
		if(ret == true) {
	
			RequestDispatcher dis = request.getRequestDispatcher("/GameBoosting.jsp");
			dis.forward(request, response);
		}
		else {
			String message = "<Script>alert('Error : Post can't delete from the database...');</script>";
			request.setAttribute("alertScript", message);
			RequestDispatcher dis = request.getRequestDispatcher("/GameBoosting.jsp");
			dis.forward(request, response);
		}
		
	}

}
