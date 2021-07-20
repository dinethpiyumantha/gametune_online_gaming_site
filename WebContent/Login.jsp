<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
    
    <style type="text/css">
   
    </style>
    
    <script>
	setTimeout(() => {
		document.getElementById('logoLoad').style.visibility = 'hidden';
	}, 600);
	</script>
</head>
<body>
	<img src="Assests/Images/site_loader_fast.svg" id="logoLoad" class="loading-window"/>
    <div class="anim-bar" id="home"></div>
    
    <div class="login-content">
		<div class="login-box">
			<img src="Assests/Images/logo.png" class="login-logo">
			
			<form action="logincheck" id="input-login" method="post">
				<input type="text" name="un" class="input-h" placeholder="Username">
				<input type="password" name="pw" class="input-h" placeholder="Password">
				<input type="submit" value="Login" class="log-btn">
			</form>
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