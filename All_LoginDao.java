package com.login;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import com.mysql.fabric.Response;


public class All_LoginDao extends HttpServlet
{	
	String url="jdbc:mysql://localhost:3306/mini_project";
	String username="root";
	String password="";
	//String user_data ;
	ArrayList<Group> grp_array=new ArrayList<Group>();
	
	
	
	
	public boolean check_group(Integer Grp_id,String Group_password)
	{
		String sql="select * from group_info where grp_id=? and Group_password=? ";
		System.out.println(Grp_id);
		System.out.println(Group_password);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password);
			PreparedStatement st =con.prepareStatement(sql);    //Prepared statements are used where we have condition statements 
			st.setInt(1, Grp_id);
			st.setString(2,Group_password);
		
			ResultSet rs=st.executeQuery();
		
			if(rs.next())
			{
				return true;
			}	
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	
	}
	
	public boolean check_reviewer(Integer Staff_id, String Staff_password)
	{
		String sql_check_review="Select * from staff where s_id=? and job='reviewer' and staff_password=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password); 
			PreparedStatement st= con.prepareStatement(sql_check_review);
			st.setInt(1, Staff_id);
			st.setString(2, Staff_password);
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean check_guide(Integer Staff_id, String Staff_password)
	{
		String sql_check_guide="Select * from staff where s_id=? and job='guide' and staff_password=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password); 
			PreparedStatement st= con.prepareStatement(sql_check_guide);
			st.setInt(1, Staff_id);
			st.setString(2, Staff_password);
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean check_Co_ordinator(Integer Staff_id, String Staff_password,HttpServletRequest request)
	{
		String sql_check_guide="Select * from staff where s_id=? and job='Co-ordinator' and staff_password=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password); 
			PreparedStatement st= con.prepareStatement(sql_check_guide);
			st.setInt(1, Staff_id);
			st.setString(2, Staff_password);
			
			
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("staff_name", rs.getString(2));
				return true;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean display_group(HttpServletRequest req)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password);
			Statement st =con.createStatement();    //Prepared statements are used where we have condition statements 
			String sql1="Select * from group_info";
		
			ResultSet rs=st.executeQuery(sql1);
		
			
			while(rs.next())
			{
				Group grp_obj=new Group();
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setGroup_password(rs.getString(7));
				grp_array.add(grp_obj);
			}	
			
			HttpSession session=req.getSession();
			session.setAttribute("Group_table", grp_array);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	
	}
	
}
