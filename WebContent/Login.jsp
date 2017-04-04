<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="login.css">
<script type="text/javascript" src="login.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<br>
<!--  	<form method="post" action="LoginSuccess.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="Username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="Password"></td>
			</tr>
		</table>
		<br> <button type="submit" class="button buttonBlue">Submit</button>
	</form> 
	adfafdsd
	afadadadfadadas
	-->
	
	<form method="post" action="LoginSuccess.jsp">
		<h1>Ride Share Login</h1>
		<br><br>
  		<div class="group">
    		<input type="text" name="Username"><span class="highlight"></span><span class="bar"></span>
    		<label>Username</label>
  		</div>
  		<div class="group">
<<<<<<< HEAD
    		<input type="text" name="Password"><span class="highlight"></span><span class="bar"></span>
=======
    		<input type="password" name="Password"><span class="highlight"></span><span class="bar"></span>
>>>>>>> 2514d16864e0533174bb30a4341c5d2976ca8609
    		<label>Password</label>
  		</div>
  		<button type="submit" class="button buttonBlue">Login
    		<div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
 		</button>
	</form>
<br>


</body>
</html>