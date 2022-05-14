package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class complaintsAPI
 */
@WebServlet("/complaintsAPI")
public class complaintsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	complaint complaintOBJ = new complaint();
   
    public complaintsAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = complaintOBJ.Createcomplaint(request.getParameter("acc"),
				request.getParameter("D_Type"), 
				request.getParameter("D_Contact_Number"), 
				request.getParameter("D_Address"),
				request.getParameter("D_reply"),
				request.getParameter("D_Status"));
		
		System.out.println(request.getParameter("acc")+" "+request.getParameter("D_Type")+" "+request.getParameter("D_Contact_Number")+" "+request.getParameter("D_Address")+" "+request.getParameter("D_reply")+" "+request.getParameter("D_Status"));
				response.getWriter().write(output);
	
	
	
			}
	
	private static Map getParasMap(HttpServletRequest request)
	{
	Map<String, String> map = new HashMap<String, String>();
	try
	{
	Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
	String queryString = scanner.hasNext() ?
	scanner.useDelimiter("\\A").next() : "";
	scanner.close();
	String[] params = queryString.split("&");
	for (String param : params)
	{

	String[] p = param.split("=");
	map.put(p[0], p[1]);
	}
	}
	catch (Exception e)
	{
	}
	return map;
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		String output = complaintOBJ.updateComplaint(paras.get("hidcomplaintIDSave").toString(),
		paras.get("acc").toString().replace('+', ' '),
		paras.get("D_Type").toString().replace('+', ' '),
		paras.get("D_Contact_Number").toString(),
		paras.get("D_Address").toString(),
		paras.get("D_reply").toString(),
		paras.get("D_Status").toString());
		response.getWriter().write(output);
	}
	
	


	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		String output = complaintOBJ.deletecomplaint(paras.get("complaintID").toString());
		response.getWriter().write(output);
	
	}

}
