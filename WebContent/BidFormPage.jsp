<%@page import="com.bid.pack.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.bid.pack.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <% ArrayList<Game> arr = Game.getGames();
    	ArrayList<String> platforms = Game.getPlatforms();
   request.setAttribute("gameDetails", arr);
   request.setAttribute("platforms", platforms);%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gametune : Online Gaming Site</title>
    <link rel="stylesheet" href="Assests/Styles/style.main.css">
    <link rel="stylesheet" href="Assests/Styles/style.sub.css">

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
    <div class="content">

        <div class="top-g-title">
            <img src="Assests/Images/rocket-icon.png" alt="" class="icon">
            <p class="icon-title">Post A Game Boosting Bid Request Form</p>
        </div>


        <form id="bidForm" action="bpinsert" method="post">
            <table>
                <tr><td>Title</td><td><input type="text" name="Title" id="Title" class="half"></td>
                    <td rowspan="3" style="text-align: right;">
                        <div id="previewBox"></div>
                    </td>
                </tr>
                <tr><td>Sub Title</td><td><input type="text" name="SubTitle" id="SubTitle" class="half"></td></tr>
                <tr><td>Description</td><td><textarea name="BidDescription" id="BidDescription" cols="66" rows="20" class="half h300"></textarea></td></tr>
                <tr>
                    <td>Game</td>
                    <td>
                        <select class="half" id="Game" name="Game">
                        
                        	<c:forEach var="g" items="${gameDetails}">
                        	
                   				<option value="${g.id}">${g.name}</option>
                   				
                        	</c:forEach>
                            
                        </select>
                    </td>
                    <td rowspan="6">
                        
                    </td>
                </tr>
                <tr> 
                    <td>Level Boosting</td><td><input type="text" name="lbFrom" id="lbFrom" class="sml" placeholder="From">
                    &nbsp;<input type="text" name="lbTo" id="lbTo" class="sml" placeholder="To"></td>
                </tr>
                <tr>
                    <td>Platform</td>
                    <td>
                        <select class="qtr" id="Platform" name="Platform">
                        
                        	<c:forEach var="p" items="${platforms}">
                        		<option value="${p}">${p}</option>
                        	</c:forEach>
                            
                        </select>
                    </td>
                </tr>
                <tr><td>Maximum Bid</td>
                    <td><input type="text" name="MaxBid" id="MaxBid" class="qtr" placeholder="LKR"></td>
                </tr>
                <tr><td>Bidding Ends at</td><td><input type="date" name="BidEnd" id="BidEnd" class="qtr"></td></tr>
                <tr><td></td><td><input type="checkbox" name="uid" id="" value=""><span>I accept for the agreement</span></td></tr>
                <tr><td></td><td><button type="submit" name="Submit">Submit</button><button type="button" onclick="samplePreview();">Preview</button></td></tr>
            </table>
        </form>
    </div>
    <div class="footer-top">
        <ul>
            <li><a href=""><img src="Assests/Images/facebook.svg" alt=""></a><a href=""><img src="Assests/Images/twitter.svg" alt=""></a></li>
        </ul>
        <ul>
            <li>About Us</li>
            <li>Privacy & Policies</li>
        </ul>
        <ul>
            <li>Help</li>
            <li>Contact Us</li>
        </ul>
        <ul>
            <li>About Us</li>
            <li>New</li>
        </ul>
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