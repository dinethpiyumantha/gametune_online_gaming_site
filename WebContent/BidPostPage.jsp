<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.bid.pack.Bid"%>
<%@page import="com.bid.pack.MyStrings"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bid.pack.BidDBUtil"%>
<%@page import="com.bid.pack.BidPost"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.bid.pack.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <% 	
    	int id = -1;; 
    	boolean avb = false; 
    	boolean av = false;
    	BidPost bidpost = null;
    %>
    
   


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gametune : Online Gaming Site</title>
    <link rel="stylesheet" href="Assests/Styles/style.main.css">
    <link rel="stylesheet" href="Assests/Styles/style.sub.css">
    <link rel="stylesheet" href="Assests/Styles/style.bidpost.css">
	<link href="Assests/fontawesome/css/fontawesome.css" rel="stylesheet">
	<link href="Assests/fontawesome/css/brands.css" rel="stylesheet">
	<link href="Assests/fontawesome/css/solid.css" rel="stylesheet">    

    <script type="text/javascript" src="Assests/JS/script_main.js"></script>

    <link rel="shortcut icon" href="Assests/Images/logo-w.png" type="image/x-icon">
    
     <script>
	setTimeout(() => {
		document.getElementById('logoLoad').style.visibility = 'hidden';
	}, 600);
	</script>
	
	<style type="text/css">
    	.btn-log{
		    text-decoration: none;
		    padding: 12px;
		    margin: 4px 5px;
		    box-sizing: border-box;
		    width: 100px;
		    height: 40px;
		    font-size: 16px;
		    font-family: kmbreg;
		    text-align: center;
		    border: none;
		    color: #fff;
		    border-radius: 5px;
		    background-image: linear-gradient(to right, #0f122b, #182C61,#6D214F, #B33771);
		    background-size: 500% 200%;
		
		    -moz-transition: all .4s ease-in-out;
		    -o-transition: all .4s ease-in-out;
		    -webkit-transition: all .4s ease-in-out;
		    transition: all .4s ease-in-out;
		} 
		
		.btn-log:hover{
		    background-position: 100% 0;
		    -moz-transition: all .4s ease-in-out;
		    -o-transition: all .4s ease-in-out;
		    -webkit-transition: all .4s ease-in-out;
		    transition: all .4s ease-in-out;
		}
    
    </style>
</head>
<body>
	<img src="Assests/Images/site_loader_fast.svg" id="logoLoad" class="loading-window"/>
    <div class="anim-bar" id="home"></div>
    <header class="nav-anim-bar">
        <div class="logo-position">
            <img src="Assests/Images/logo-w.png" alt="" class="logo-image">
        </div>
        <nav>
            <div class="drop-down" href="#" style="border: 2px solid #fff;">
                <span style="color: #fff;">Categories</span>
                <div class="dropdown-menu">
                    <ul>
                        <li><a href="BidFormPage.jsp">Accounts</a></li>
                        <li><a href="GameBoosting.jsp">Game Boosting</a></li>
                        <li><a href="BidFormPage.jsp">Game Coatches</a></li>
                        <li><a href="BidFormPage.jsp">Games</a></li>
                    </ul>
                </div>
            </div>
            
             <div class="username">
            
            	<% try {
            		
            		id = (int) request.getSession().getAttribute("uid");%>
            		
            		<span>
                	<% 	String userName = User.getName(id);
                		out.print("@"+userName); %>
	                </span>
	                <form action="logout" method="get" id="logOutF">
	                <button type="submit" class="btn-log">Logout</button>
	                <div id="profile">
	                    <p style="margin-bottom: 10px;">Your Profile Menu</p>
	                    <a href="BidFormPage.jsp" style="position: static; height: 25px; padding: 5px;">Post a Bid Post</a>
	                </div>
	                </form>
            		
            	<% } catch (Exception e) { 
            	
            		RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            		dis.forward(request, response);
            	
            	%>
            		
            		
            		<a href="Login.jsp">Login</a>
                	<a href="#">Register</a>
            		
            	<% } %>
            	
             
            </div>
        </nav>
    </header>
    
    

	<c:forEach var="i" items="${bidPost}">
    	<img alt="" src="Assests/Images/Games/${i.thumbnail}" class="postback">
    
    	<div class="content back-pattern" style="justify-content: space-around; display: flex;">
	
	
			<div class="postcont">
				<p class="game"><i class="fas fa-gamepad">&nbsp;&nbsp;</i>${i.game}</p>
				<h2>${i.title}</h2>
				<h3>${i.subTitle}</h3>
				<p id="descriptionTag">${i.bidDescription}</p>
				<ul>
					<li><i class="fas fa-desktop">&nbsp;</i> ${i.platform}</li>
					<li><i class="fas fa-chart-line">&nbsp;</i> Levels up ${i.lbFrom} to ${i.lbTo}</li>
					<li><i class="fas fa-dollar-sign">&nbsp;&nbsp;&nbsp;</i> Maximum bid : LKR. ${i.maxBid}</li>
					<li><i class="fas fa-clock">&nbsp;</i> Bid ends on ${i.bidEnd}</li>
				</ul>
				<p>Post by <b>${i.uid}</b></p>
			
			
		
	        
        <% 
        	bidpost = (BidPost) request.getAttribute("bpost");
        	avb = BidDBUtil.checkBidPostAvailability((int) request.getSession().getAttribute("uid"), (int) bidpost.getId());
        	av = Bid.checkBidAvailability((int) request.getSession().getAttribute("uid"), (int) bidpost.getId());
        	if(av == true) {
        	%>
	        
	        <form action="updatebid" class="bid-form" method="post">
	        	<input type="text" name="bidId" value="${i.id}" style="display: none;">
	        	<input type="text" class="s" name="price" placeholder="LKR">
	        	<input type="text" class="l" name="comment" placeholder="Comment">
        		<input type="submit" class="inp-btn" value="Update Bid">
	        </form>
	        	<% } else { %>
        	
        	<form action="insertbid" class="bid-form" method="post">
	        	<input type="text" name="bidId" value="${i.id}" style="display: none;">
	        	<input type="text" class="s" name="price" placeholder="LKR">
	        	<input type="text" class="l" name="comment" placeholder="Comment">
        		<input type="submit" class="inp-btn" value="Place Bid">
        	</form>
        	<% } %>
	        
	        </c:forEach>
	        <div class="bid-comment-body">
	        	 
	        	<c:forEach var="b" items="${bids}">
	        	<div class="bid-comment">
	        		<span class="com-name">@${b.uname}</span>
	        		<table class="com-comment-table">
		        		<tr>
		        			<td class="com-comment">${b.comment}</td>
		        			<td class="com-bid">LKR. ${b.price}</td>
		        		</tr>
	        		</table>
	        	</div>
	        	</c:forEach>
	        </div>
	        
	        
	        
	        </div>
	       
	       
	       <% if(avb == true) { %>
	       <form class="post-Bottons" method="post" action="deletepost">
	       		<button type="submit" name="deletePost" value="<% out.print(bidpost.getId()); %>" class="delete"><i class="fa fa-trash-alt"></i></button>
	       		<button type="button" class="delete"><i class="fa fa-link"></i></button>
	       </form>
	       <% } %>
    	</div>

    	
    <div class="anim-bar"></div>
    <footer>
        <div class="footer-left">
            <p class="description">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, dolorem eveniet excepturi quibusdam esse nobis cumque obcaecati veritatis iure consectetur non voluptatem soluta ullam ut explicabo dolores, blanditiis deleniti pariatur quos architecto debitis quo! Officia repudiandae, deserunt consequatur iste distinctio reiciendis sequi inventore sit vitae facilis nulla, veritatis quos quia.
            </p>
        </div>
        <div class="footer-right">
            <img class="logo-white" src="Assests/Images/logo-w.png" alt="">
            <p class="copyright">&copy; 2020 by SLIIT Assignment Group</p>
        </div>
    </footer>

    <a href="#home"><div class="top-scroll-btn"><img src="Assests/Images/top_scroll_icon..png" alt=""></div></a>

    <div id="message-box">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem earum voluptates dolorem nesciunt iure maxime iste vel sapiente, quo quam.</p>
        <button type="submit">Accept</button>
    </div>
</body>
</html>