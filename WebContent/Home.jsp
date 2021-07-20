<%@page import="java.io.PrintWriter"%>
<%@page import="com.bid.pack.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gametune : Online Gaming Site</title>
    <link rel="stylesheet" href="Assests/Styles/style.main.css">

    <link rel="shortcut icon" href="Assests/Images/logo-w.png" type="image/x-icon">
    
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
	
    <div class="anim-bar" id="home"></div>
    <header>
        <div class="logo-position">
            <img src="Assests/Images/logo.svg" alt="" class="logo-image">
        </div>
        <nav>
            <div class="drop-down" href="#">
                <span>Categories</span>
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
        <div class="banner-image-box">
            <img class="banner-image" src="Assests/Images/banner.png" alt="">
        </div>
        
        
        <div class="top-box">
            <div class="top-box-column">
                <div class="title">
                    <img src="Assests/Images/rocket-icon.png" alt="" class="icon">
                    <p class="icon-title">Top Boosting Sellers</p>
                </div>
                <table>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                </table>
            </div>
            <div class="top-box-column">
                <div class="title">
                    <img src="Assests/Images/sheild-icon.png" alt="" class="icon">
                    <p class="icon-title">Top Account Sellers</p>
                </div>
                <table>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                </table>
            </div>
            <div class="top-box-column">
                <div class="title">
                    <img src="Assests/Images/coatch-icon.png" alt="" class="icon">
                    <p class="icon-title">Top Coatches</p>
                </div>
                <table>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                    <tr><td>Hello</td><td>Game Name</td><td><a href="#">See</a></td></tr>
                </table>
            </div>
        </div>


        <div class="top-games">
            <div class="top-g-title">
                <img src="Assests/Images/coatch-icon.png" alt="" class="icon">
                <p class="icon-title">Games</p>
            </div>
            <div class="game-list">
                <a href=""><img src="Assests/Images/Games/PUBG.jpg" alt=""><div>Players Unknown's Battle Ground</div></a>
                <a href=""><img src="Assests/Images/Games/cod.jpg" alt=""><div>Call of Duty Mobile</div></a>
                <a href=""><img src="Assests/Images/Games/nfs.jpg" alt=""><div>Need for Speed Payback</div></a>
                <a href=""><img src="Assests/Images/Games/asph.jpg" alt=""><div>Asphalt 8</div></a>
                <a href=""><img src="Assests/Images/Games/cos2.jpg" alt=""><div>Clash of Clans 2</div></a>
                <a href=""><img src="Assests/Images/Games/cr.jpg" alt=""><div>Clash Royale</div></a>
                <a href=""><img src="Assests/Images/Games/asc.webp" alt=""><div>Assissins Creed Valhalla</div></a>
                <a href=""><img src="Assests/Images/Games/a.jpg" alt=""><div>+</div></a>
            </div>
        </div>
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