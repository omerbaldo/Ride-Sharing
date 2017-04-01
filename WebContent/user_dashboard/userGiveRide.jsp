<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<div class="tab">
  <button class="tablinks">User Profile</button>
  <button class="tablinks" id="selected">Give a Ride</button>
  <button class="tablinks">Find a Ride</button>
  <button class="tablinks" style ="float: right;">Logout</button>
</div>

<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet" type="text/css" href="dropdown.css">
<link rel="stylesheet" type="text/css" href="overflow.css">







</head>
<body>

<div class="dropdown">
  <button class="dropbtn">Pickup location </button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>


<div class="dropdown">
  <button class="dropbtn">Destination </button>
  <div class="dropdown-content">
    <a href="#">Livingston</a>
    <a href="#">College Ave</a>
    <a href="#">Cook</a>
  </div>
</div>


<div class="dropdown">
  <button class="dropbtn">Start Time </button>
  <div class="dropdown-content">
      <a href="#">6:00am</a>
      <a href="#">7:00am</a>
      <a href="#">8:00am</a>
      <a href="#">9:00am</a>
      <a href="#">10:00am</a>
       <a href="#">3:00pm</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">End Time </button>
  <div class="dropdown-content">
      <a href="#">6:00am</a>
      <a href="#">7:00am</a>
      <a href="#">8:00am</a>
      <a href="#">9:00am</a>
      <a href="#">10:00am</a>
       <a href="#">3:00pm</a>
  </div>
</div>


<div class="dropdown">
  <button class="dropbtn">Your Car </button>
  <div class="dropdown-content">
      <a href="#">Car 1</a>
      <a href="#">Car 2</a>
      <a href="#">Car 3</a>
      <a href="#">Car 4</a>
      <a href="#">Car 5</a>
  </div>
</div>

</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>


<form action="">
  <label> Make this a regularly scheduled offer? </label>
  </br>
  <input type="radio" name="reoccuring" value="yes"> Yes <br>
  <input type="radio" name="reoccuring" value="no"> No <br>
 </br>
  
  <label> If yes, then how often? </label>
  </br>
  <input type="radio" name="reoccuring" value="Daily"> Daily <br>
  <input type="radio" name="reoccuring" value="Weekly"> Weekly <br>
  <input type="radio" name="reoccuring" value="Monthly"> Monthly <br>
    </br>
    </br>
  
  <button> Make ride public </button>
</form>


</body>
</html>