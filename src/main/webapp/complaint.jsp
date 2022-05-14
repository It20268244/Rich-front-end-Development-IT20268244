<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.complaintsAPI" %>
	<%@ page import="com.complaint" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script type='text/javascript' src='./componenets/fg.js'></script>
	   <style>

			table {
				font-family: arial, sans-serif;
				border-collapse: collapse;
				width: 90%;
				margin-left: auto;
				margin-right: auto;
			}
	
			td,
			th {
				border: 1px solid #dddddd;
				text-align: left;
				padding: 8px;
			}
	
			tr:nth-child(even) {
				background-color: #dddddd;
			}
			
			.card {
				padding: 30px;
				border: 1px solid black;
				border-radius: 10px;
				margin-bottom: 20px;
				font-size: 15px;
				margin-top: 15px;
				background-size: cover;
				color: white;
				font-weight: 900;
				background-repeat: no-repeat ;
			
	
			#btnSave {
				margin-top: 15px;
				font-size: 20px;
				padding: 10px;
				width: 15%;
			}
	
		</style>

</head>
<body style="background-image: url('pics/gh.jpg');">
	
	<h1><center>Complaint Handlling</center></h1>
		
		<div class="container"><div class="row"><div class="col-6">
		
		<div class="container"  >
			<div class="row" >
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="card">
						<form id="formcomplaint" name="formcomplaint" method="post" action="complaint.jsp">
							Account Number: <input id="acc" name="acc" type="text"
								class="form-control form-control-sm" required> <br> 
								
							Complaint Type: <input id="D_Type" name="D_Type" type="text"
								class="form-control form-control-sm" required> <br> 
								
							Contact	Number: <input id="D_Contact_Number" name="D_Contact_Number"
								type="text"   placeholder="0xxxxxxxxx" maxlength="10"
								 pattern="^\d{10}$"  class="form-control form-control-sm" required> <br>
								
							Message: <input id="D_Address" name="D_Address" type="text" placeholder="Enter reson for complaint"
								class="form-control form-control-sm" required> <br> 
								
							Reply: <input id="D_reply" name="D_reply" type="text"
								class="form-control form-control-sm" required> <br> 
								
								 <label for="status">Status:</label><br>
									<select id="D_Status" name="D_Status">
									  <option value="replied">Replied</option>
									  <option value="pending">Pending</option>
									
									</select> 	
								<br><br>
								<input id="btnSave" name="btnSave" type="submit" value="Save" class="btn btn-primary"> 
								<input type="hidden" id="hidcomplaintIDSave" name="hidcomplaintIDSave" value="">
						</form>
					</div>
				</div>
			</div>
		</div>	
	
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			<%
			out.print(session.getAttribute("statusMsg"));
			%>
			
		
		<div id="divItemsGrid">
			<% 
		     complaint h1= new complaint();
			out.print(h1.readcomplaints());
		     %>
		</div>
				     
		<br><br>
		     
		</div> </div> </div>
</body>
</html>