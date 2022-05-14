<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
	<%@ page import="com.complaint" %>
    
    <% 
		//Save---------------------------------
		if (request.getParameter("acc") != null) {
			complaint d1 = new complaint();
			String
			stsMsg = "";
			//Insert------------------------------
			if (request.getParameter("hidcomplaintIDSave") == "") {
				stsMsg = d1.Createcomplaint(request.getParameter("acc"),
						request.getParameter("D_Type"), 
						request.getParameter("D_Contact_Number"), 
						request.getParameter("D_Address"),
						request.getParameter("D_reply"),
						request.getParameter("D_Status"));
				
			} else//Update----------------------
			{
				stsMsg = d1.updateComplaint(request.getParameter("hidcomplaintIDSave"),
								request.getParameter("acc"),
								request.getParameter("D_Type"), 
								request.getParameter("D_Contact_Number"), 
								request.getParameter("D_Address"),
								request.getParameter("D_reply"),
								request.getParameter("D_Status")); 
								
			}
			session.setAttribute("statusMsg", stsMsg);
		}
		//Delete-------------------------------------------
		if (request.getParameter("hidDoctorIDDelete") != null) {
			complaint d1 = new complaint();
			String stsMsg = d1.deletecomplaint(request.getParameter("hidDoctorIDDelete"));
			session.setAttribute("statusMsg", stsMsg);
		}
	%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type='text/javascript' src='./componenets/complaint.js'></script>
</head>
<body>
	
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
	
	
	<div id"alertSuccess" class="alert alert-success">
		<%
		out.print(session.getAttribute("statusMsg"));
		%>
		</div>
	
	
	

	<% 
	     complaint d1=new complaint();
	     out.print(d1.readcomplaints());
	     %>
	     
	     
	     <br><br>
</body>
</html>