package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@WebServlet("/All_login")   // with this there is no need of xml for linking 
@MultipartConfig(maxFileSize = 16177215)

public class All_login extends HttpServlet
{
	String url="jdbc:mysql://localhost:3306/mini_project";
	String sql_sel_all="Select * from student_login";
	String username="root";
	String password="";
	String user_data;
	String pass_data;
	
	
	
	
	protected void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException
	{
		String which_method = request.getParameter("button");
		System.out.println(which_method);
			
			if ("Student Sign In".equals(which_method))
			{
				Integer group_id =Integer.parseInt(request.getParameter("group_id"));
				String group_password =request.getParameter("group_password");
				HttpSession session=request.getSession();
				session.setAttribute("Student_group",group_id );
				
				
				System.out.println(group_id);
				System.out.println(group_password);
				
				PrintWriter out=response.getWriter();
				All_LoginDao dao= new All_LoginDao();
				QueriesDao query= new QueriesDao();
				 
				
				if(dao.check_group(group_id, group_password))
				{
					
					//session.setAttribute("",student_name );
					System.out.println("Inside the student Login");
					query.Group_home(request,group_id);
					
					Group grp_obj= query.display_group(group_id);             // Group Information
					request.setAttribute("Group_info", grp_obj);
					
					session.setAttribute("Group_no", group_id);
					RequestDispatcher dispatcher= request.getRequestDispatcher("Group_home_new.jsp");
					try 
					{
						dispatcher.forward(request, response);
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
	
				}	
				else
				{
					request.setAttribute("errMsg", "Username and password are incorrect");
				    
				    RequestDispatcher rd = request.getRequestDispatcher("login_student.jsp");
				    try 
				    {
				    	rd.forward(request, response);
					} 
				    catch (Exception e) 
				    {
						
					}

				}							
	        } 
			
		
			else if ("Staff Sign In".equals(which_method) && "Reviewer".equals(request.getParameter("class"))) 
			{
	            Integer staff_id=Integer.parseInt(request.getParameter("Staff_id"));
	            String staff_password=request.getParameter("Staff_password");
	            
	            All_LoginDao dao =new All_LoginDao();
	            HttpSession session=request.getSession();
	            
	            
	            if(dao.check_reviewer(staff_id,staff_password))
	            {	
	            	session.setAttribute("Reviewer_id", staff_id);   	
	            	
	         
					QueriesDao qdao=new QueriesDao();
					System.out.println("Inside the reviewer Login");
					session.setAttribute("Reviewer_logged_in", staff_id);
					
					ArrayList<Group> groups=qdao.Groups_under_Reviewer(staff_id);
					session.setAttribute("Groups_under_reviewer", groups);
								
					RequestDispatcher dispatcher=request.getRequestDispatcher("Reviewer_home_new.jsp");
					try 
					{
						dispatcher.forward(request, response);
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
	            }
	            else
				{
	            	request.setAttribute("errMsg", "Username and password are incorrect");
				    
				    RequestDispatcher rd = request.getRequestDispatcher("login_staff.jsp");
				    try 
				    {
				    	rd.forward(request, response);
					} 
				    catch (Exception e) 
				    {
						
					}
					
				}
	        } 
			else if ("Staff Sign In".equals(which_method) && "Guide".equals(request.getParameter("class")))
			{
				Integer staff_id=Integer.parseInt(request.getParameter("Staff_id"));
	            String staff_password=request.getParameter("Staff_password");
	            
	            All_LoginDao dao =new All_LoginDao(); 
	            
	            if(dao.check_guide(staff_id,staff_password))
	            {
	            	HttpSession session=request.getSession();
	            	
	            	session.setAttribute("Guide_id", staff_id);
	            	
	            	
	            	QueriesDao qdao=new QueriesDao();
	            	
	            	session.setAttribute("Guide_logged_in",staff_id );
	            	
	            	System.out.println("Inside the guide Login");
	            	
	            	 
	            	ArrayList<Group> groups= qdao.Groups_under_guide((Integer)session.getAttribute("Guide_logged_in"));
	            	session.setAttribute("Groups_under_guide", groups);
					
					
					RequestDispatcher dispatcher=request.getRequestDispatcher("Guide_home_new.jsp");
					try 
					{
						dispatcher.forward(request, response);
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}

	            }
	            else
				{
	            	request.setAttribute("errMsg", "Username and password are incorrect");
				    
				    RequestDispatcher rd = request.getRequestDispatcher("login_staff.jsp");
				    try 
				    {
				    	rd.forward(request, response);
					} 
				    catch (Exception e) 
				    {
						
					}
					
				}
			}
	        else if ("Staff Sign In".equals(which_method) && "Co-ordinator".equals(request.getParameter("class")))
				{
					Integer staff_id=Integer.parseInt(request.getParameter("Staff_id"));
		            String staff_password=request.getParameter("Staff_password");
		            
		            All_LoginDao dao =new All_LoginDao(); 
		            
		            if(dao.check_Co_ordinator(staff_id,staff_password,request))
		            {
		            	HttpSession session=request.getSession();
		            	
		            	session.setAttribute("Co-ordinator_id", staff_id);
		            	
		            	
		            	QueriesDao qdao=new QueriesDao();
		            	
		            	session.setAttribute("Co-ordinator_logged_in",staff_id );
		            	
		            	System.out.println("Inside the Co-ordinator Login");
		            	
		            	 
		            	ArrayList<Group> groups= qdao.Groups_under_Co_ordinator();
		            	request.setAttribute("Groups_under_co-ordinator", groups);
						
						
						RequestDispatcher dispatcher=request.getRequestDispatcher("Co-ordinator_info.jsp");
						try 
						{
							dispatcher.forward(request, response);
						} 
						catch (Exception e) 
						{
							e.printStackTrace();
						}

		            }
		            else
					{
		            	
					    request.setAttribute("errMsg", "Username and password are incorrect");
					    RequestDispatcher rd = request.getRequestDispatcher("login_staff.jsp");
					    try 
					    {
					    	rd.forward(request, response);
						} 
					    catch (Exception e) 
					    {
							e.printStackTrace();
						}
						
					}
			}
			
			else 
			{
				System.out.println("Nothing");
	        }
		
		
	}
}
