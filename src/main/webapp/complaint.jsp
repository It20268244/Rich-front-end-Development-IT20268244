<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
	<%@ page import="com.complaint" %>
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type='text/javascript' src='./componenets/hj.js'></script>
</head>
<body>
	<div class="container"><div class="row"><div class="col-6">
	<form id="formcomplaint" name="formcomplaint" method="post" action="complaint.jsp">
		Account Number: <input id="acc" name="acc" type="text"
			class="form-control form-control-sm" required> <br> 
			
		Complaint Type: <input id="D_Type" name="D_Type" type="text"
			class="form-control form-control-sm" required> <br> 
			
		Contact	Number: <input id="D_Contact_Number" name="D_Contact_Number"
			type="text"   placeholder="0xxxxxxxxx" maxlength="10"
			 pattern="^\d{10}$"  class="form-control form-control-sm" required> <br>
			
		Message: <input id="D_Address" name="D_Address" type="text"
			class="form-control form-control-sm" required> <br> 
			
		Reply: <input id="D_reply" name="D_reply" type="text"
			class="form-control form-control-sm" required> <br> 
			
			
		Status: <input id="D_Status" name="D_Status" type="text"
			class="form-control form-control-sm" required> <br> 
				
			
			
			<input id="btnSave" name="btnSave" type="submit" value="Save" class="btn btn-primary"> 
			
			<input type="hidden" id="hidcomplaintIDSave" name="hidcomplaintIDSave" value="">
	</form>
	
	

		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		<%
		out.print(session.getAttribute("statusMsg"));
		%>
		
	
		<% 
	     complaint d1=new complaint();
	     out.print(d1.readcomplaints());
	     %>
	     
	     
	     <br><br>
	     
	     </div> </div> </div>
</body>
</html>