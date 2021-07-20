<%@page import="java.util.ArrayList"%>
<%@page import="com.bid.pack.BidDBUtil"%>
<%@page import="com.bid.pack.BidPost"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.bid.pack.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<% ArrayList<BidPost> arr = BidDBUtil.getBidPosts();
   request.setAttribute("postDetails", arr);%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gametune : Online Gaming Site</title>
    <link rel="stylesheet" href="Assests/Styles/style.main.css">
    <link rel="stylesheet" href="Assests/Styles/style.sub.css">
    <link rel="stylesheet" href="Assests/Styles/style.card.css">

    <script type="text/javascript" src="Assests/JS/script_main.js"></script>

    <link rel="shortcut icon" href="Assests/Images/logo-w.png" type="image/x-icon">
    
     <script>
	setTimeout(() => {
		document.getElementById('logoLoad').style.visibility = 'hidden';
	}, 2000);
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
	
	<% try{ %>
	${alertScript}
	<% } catch (Exception e) {} %>
	
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
            		
            		int id = (int) request.getSession().getAttribute("uid");%>
            		
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
            		
            	<% } catch (Exception e) { %>
            		
            		
            		<a href="Login.jsp">Login</a>
                	<a href="#">Register</a>
            		
            	<% } %>
            	
             
            </div>
        </nav>
    </header>
    <div class="content" style="display:flex; background: #e4e4e4; justify-content: space-between; flex-wrap: wrap;">
    
    	
    	<c:forEach var="post" items="${postDetails}">
    	
    	
		<form action="openbidpost" method="post">
	        <div class="card-thumb">
				<div class="card-img">
					<img src="Assests/Images/Games/${post.thumbnail}">
				</div>
				<div class="card-icon">
					<img src="Assests/Images/Games/${post.thumbnail}">
				</div>
				<div class="card-content">
					<pre name="game">${post.game}</pre>
					<div class="card-title" name="title">${post.title}</div>
					<div class="card-subtitle" name="subtitle">${post.subTitle}</div>
					<div class="card-disc" name="description">${post.bidDescriptionShort}</div>
					<div class="card-spec" name="platform"><b>Platform : </b>${post.platform}</div>
					<div class="card-spec" name="level"><b>Level from ${post.lbFrom} to ${post.lbTo}</b></div>
					<div class="card-spec" name="maxbid"><b>Max Bid :</b> LKR.${post.maxBid}</div>
					<div class="card-spec" name="bidends"><b>Bid Ends : </b>${post.bidEnd}</div>
					<div class="card-spec" name="poster">post by <b>${post.uid}</b></div>
					
					<button type="submit" class="bid-button" id="bidBtn" name="bidBtn" value="${post.id}">Bid Now</button>
				</div>  
	        </div>
        </form>
        
        </c:forEach>
        
        
        
        
        
        
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


