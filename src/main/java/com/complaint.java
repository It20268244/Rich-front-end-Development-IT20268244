package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBconnect;

public class complaint {
	
	//creating an object to connect to DBconnect
		DBconnect dbconn = new DBconnect();
		
		
		
		//Insert 
		public String Createcomplaint(String Account_no, String complaint_T, String contact_no, String message, String reply, String status) { 
			
			 String output = ""; 
			 try
			 { 
				 
			// create connection object & call the connection method	 
			 Connection con = dbconn.connect(); 
			 
			 if (con == null) {
				 return "Error while connecting to the database for inserting complaint."; 
			} 
			 
			 String query = " insert into complaints(`complaintID`,`AccNo`,`complaintType`,`contactNo`,`message`,`replyMessage`,`status`)"
						+ " values (?, ?, ?, ?,?,?,?)";
			 // create a prepared statement
		
			 PreparedStatement preparedStmt = con.prepareStatement(query); 
		
			 // binding values
			 preparedStmt.setInt(1, 0); 
			 preparedStmt.setString(2, Account_no); 
			 preparedStmt.setString(3, complaint_T); 
			 preparedStmt.setString(4, contact_no); 
			 preparedStmt.setString(5, message); 
			 preparedStmt.setString(6, reply);
			 preparedStmt.setString(7, status);
			 // execute the statement
			 preparedStmt.execute(); 
			 
			 // close the connection
			 con.close(); 
			 output = "Complaint Created Successfully."; 
			 }
			 catch (Exception e) { 
				 output = "Error while inserting complaint."; 
				 System.err.println(e.getMessage()); 
				 
			 } 
		 
		 return output;
		 
		 }
		
	  
		
		
		//read all complaints
			public String readcomplaints()
			{
			String output = "";
			try
			{
			Connection con = dbconn.connect(); 
					if (con == null)
					{
						return "Error while connecting to the database for reading."; 
					}
						// Prepare the html table to be displayed
						output = "<table border='1'><tr><th>Account number</th>" +
						"<th>Complaint Type</th>" +
						"<th>Contact Number</th>" +
						"<th>Message</th>" +
						"<th>Reply</th>" +
						"<th>Status</th>" +
						"<th>Date</th>" +
						"</tr>";
						
						String query = "select * from complaints";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(query);
						// iterate through the rows in the result set
						while (rs.next())
						{
							String complaintID = Integer.toString(rs.getInt("complaintID"));
							String accno = rs.getString("AccNo");
							String complainttype = rs.getString("complaintType");
							String mobile = rs.getString("contactNo");
							String cmessage =  rs.getString("message");
							String datentime = rs.getString("date");
							String reply = rs.getString("replyMessage");
							String status = rs.getString("status");
							
							
							// Add into the html table
							output += "<tr><td><input id='hidItemIDUpdate' name='hidcomplaintIDUpdate'type='hidden' value='" + complaintID + "'>" + accno + "</td>";
							output += "<td>" + complainttype + "</td>";
							output += "<td>" + mobile + "</td>";
							output += "<td>" + cmessage + "</td>";
							output += "<td>" + reply + "</td>";
							output += "<td>" + status + "</td>";
							output += "<td>" + datentime + "</td>";
							// buttons
							
							output += "<td><input name=\"btnUpdate\" type=\"button\"value=\"Update\" class=\"btn btn-warning btnUpdate\"></td>"
									+ "<td><form method=\"post\" action=\"complaint.jsp\">"
									+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\"class=\"btn btn-danger\">"
									+ "<input name=\"hidDoctorIDDelete\" type=\"hidden\" value=\"" + complaintID + "\">"
									+ "</form></td></tr>";
							
							
						}
						con.close();
						// Complete the html table
						output += "</table>";
					}
			catch (Exception e)
			{
				output = "Error while reading the items.";
				System.err.println(e.getMessage());
			}
				return output;
			}
			
			
			public String updateComplaint(String ID, String accountno, String complaint_type, String contact, String message,String c_reply,String C_status)
			
			{
			String output = "";
			try
			{
				Connection con = dbconn.connect(); 
				if (con == null)
				{
					return "Error while connecting to the database for updating.";
				}
				// create a prepared statement
				String query = "UPDATE complaints SET AccNo=?,complaintType=?,contactNo=?,message=?,replyMessage=?,status=? WHERE complaintID=?";
				PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setString(1, accountno);
					preparedStmt.setString(2, complaint_type);
					preparedStmt.setString(3, contact);
					preparedStmt.setString(4, message);
					preparedStmt.setString(5, c_reply);
					preparedStmt.setString(6, C_status);
					preparedStmt.setInt(7, Integer.parseInt(ID));
					// execute the statement
					preparedStmt.execute();
					con.close();
					output = "Updated successfully";
				}
				catch (Exception e)
				{
					output = "Error while updating the item.";
					System.err.println(e.getMessage());
				}
				return output;
			}	
			
		
	/*	//update
		public String updateComplaint(String ID,String c_reply,String C_status)
		
		{
		String output = "";
		try
		{
			Connection con = dbconn.connect(); 
			if (con == null)
			{
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE complaints SET replyMessage=?,status=? WHERE complaintID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
				// binding values

				preparedStmt.setString(1, c_reply);
				preparedStmt.setString(2, C_status);
				preparedStmt.setInt(3, Integer.parseInt(ID));
				// execute the statement
				preparedStmt.execute();
				con.close();
				output = "Updated successfully";
			}
			catch (Exception e)
			{
				output = "Error while updating the item.";
				System.err.println(e.getMessage());
			}
			return output;
		}*/
		
		
		// Delete Operation
		public String deletecomplaint(String complaintID)
		{
			String output = "";
		try
		{
		Connection con = dbconn.connect(); 
		if (con == null)
			{
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "delete from complaints where complaintID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(complaintID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Deleted successfully";
		}
		catch (Exception e)
		{
			output = "Error while deleting the item(Reply to the complaint before deleting.).";
			System.err.println(e.getMessage());
		}
			return output;
		}
		
		
		
		


}
