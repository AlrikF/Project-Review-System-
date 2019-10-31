
package com.login;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.jsp.JspWriter;

import org.apache.el.parser.BooleanNode;

import com.mysql.jdbc.CallableStatement;








@MultipartConfig(maxFileSize = 16177215)  

public class QueriesDao 
{
String db_url="jdbc:mysql://localhost:3306/";
	
	String db_name="mini_project";
	String db_user="root";
	String db_password="";
	
	ArrayList<Group> groups=new ArrayList<Group>();
	ArrayList<Student> students=new ArrayList<Student>();    /// See about deleting these elements 
	
	public boolean Group_home(HttpServletRequest request,Integer group_id)                //Select students of a group	
	{
		String display_members="Select * from student where Group_id=? order by roll_no";
		try 
		{
			System.out.println("Executing Group home page query ");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement st= con.prepareStatement(display_members);
			st.setInt(1,group_id );
			ResultSet rs=st.executeQuery();
			
			System.out.println("Executing Group home page query 2 ");
			
			while(rs.next())
			{
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				Student stu_obj=new Student();
				stu_obj.setStudentId(rs.getInt(1));
				stu_obj.setStudentname(rs.getString(2));
				stu_obj.setStudentemail(rs.getString(3));
				
				students.add(stu_obj);
				
			}
			
			HttpSession session= request.getSession();
			session.setAttribute("student_array",students );
			
			
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return true;
	}
	
	
	public Group display_group(Integer grp_id)
	{
		String display_grp="Select * from group_info where grp_id=? ";
		Group grp_obj=new Group();
		try 
		{
			System.out.println("Executing Group home page query ");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement st= con.prepareStatement(display_grp);
			
			st.setInt(1, grp_id);
			ResultSet rs=st.executeQuery();
			
			while(rs.next())
			{
				
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setProject_platform(rs.getString(2));
				grp_obj.setProj_area(rs.getString(3));
				grp_obj.setGuide_id(rs.getInt(4));
				grp_obj.setReviewer_id(rs.getInt(5));
				grp_obj.setGroup_password(rs.getString(6));
				grp_obj.setProblem_title(rs.getString(7));
				
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		System.out.println("Inside display"+grp_obj.getGroup_id());
		return grp_obj;
	}
	
	
	public String Insert_weekly_report(int Group_id ,int Week_no,String Date_of_log ,String Topics,String Remarks) 
	{
	
		String upload_report="Update weekly_log set Topics=? ,remarks=? where Group_id=? and Week_no=?";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection= DriverManager.getConnection(db_url+db_name,db_user,db_password);
			
			PreparedStatement st=connection.prepareStatement(upload_report);
			st.setInt(3,Group_id );
			st.setInt(4, Week_no);
			//st.setString(3, Date_of_log);
			st.setString(1, Topics);
			st.setString(2, Remarks);
			
			st.executeUpdate();
			
			st.close();
			connection.close();
			
			System.out.println("Executed Update"); 
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		return "Executed update";
	}
	
	public String Insert_sign(int Staff_id ,String savepath,String filename) 
	{
		System.out.println("Inside Insert signature"+Staff_id);
		
		String upload_report="Insert into sign Values(?,?)";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection= DriverManager.getConnection(db_url+db_name,db_user,db_password);
			
			PreparedStatement st=connection.prepareStatement(upload_report);
			st.setInt(1,Staff_id );
			
			
			String filepath=savepath+File.separator+filename;
			st.setString(2, filepath);
			
			int count=st.executeUpdate();
			
			return filepath;
		}
		catch (Exception e) 
		{
			e.printStackTrace(); 
		}
		
		return "";
			
	}
	
	
	public ArrayList<Group> Groups_under_guide(Integer Guide_id)
	{
		ArrayList<Group> groups=new ArrayList<Group>();
		String grp_under_guide="Select * from group_info where Guide_id=?";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement= connection.prepareStatement(grp_under_guide); 
			statement.setInt(1, Guide_id);
			
			ResultSet rs =statement.executeQuery();
			
			while(rs.next())
			{
				Group grp_obj=new Group();
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setProject_platform(rs.getString(2));
				grp_obj.setProj_area(rs.getString(3));
				grp_obj.setGuide_id(rs.getInt(4));
				grp_obj.setReviewer_id(rs.getInt(5));
				grp_obj.setGroup_password(rs.getString(6));
				grp_obj.setProblem_title(rs.getString(7));
				
				groups.add(grp_obj);
				
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return groups;
	}
	
	public ArrayList<Group> Groups_under_Reviewer(Integer Reviewer_id)
	{
		ArrayList<Group> groups=new ArrayList<Group>();
		String grp_under_reviewer="Select * from group_info where Reviewer_id=?";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement= connection.prepareStatement(grp_under_reviewer); 
			statement.setInt(1, Reviewer_id);
			
			ResultSet rs =statement.executeQuery();
			
			while(rs.next())
			{
				Group grp_obj=new Group();
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setProject_platform(rs.getString(2));
				grp_obj.setProj_area(rs.getString(3));
				grp_obj.setGuide_id(rs.getInt(4));
				grp_obj.setReviewer_id(rs.getInt(5));
				grp_obj.setGroup_password(rs.getString(6));
				grp_obj.setProblem_title(rs.getString(7));
				
				groups.add(grp_obj);	
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return groups;
	}
	public ArrayList<Group> Groups_under_Co_ordinator()
	{
		ArrayList<Group> groups=new ArrayList<Group>();
		String grp_under_co_ordinator="Select * from group_info ";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement= connection.prepareStatement(grp_under_co_ordinator); 
			
			
			ResultSet rs =statement.executeQuery();
			
			while(rs.next())
			{
				Group grp_obj=new Group();
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setProject_platform(rs.getString(2));
				grp_obj.setProj_area(rs.getString(3));
				grp_obj.setGuide_id(rs.getInt(4));
				grp_obj.setReviewer_id(rs.getInt(5));
				grp_obj.setGroup_password(rs.getString(6));
				grp_obj.setProblem_title(rs.getString(7));
				
				groups.add(grp_obj);	
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return groups;
	}
	
	
	
	public ArrayList<Weekly_log> Group_Weekly_Log(Integer group_id)
	{
		ArrayList<Weekly_log> week_logs= new ArrayList<Weekly_log>();
		String grp_log="Select * from weekly_log where Group_id=? order by Week_no";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement= connection.prepareStatement(grp_log);
			statement.setInt(1, group_id);
			ResultSet rs =statement.executeQuery();
			
			while(rs.next())
			{
				Weekly_log week_obj=new Weekly_log();
				week_obj.setGroup_id(rs.getInt(1));
				week_obj.setWeek_no(rs.getInt(2));
				week_obj.setDate_of_log(rs.getString(3));
				week_obj.setTopics(rs.getString(4));
				week_obj.setRemarks(rs.getString(5));
				
				week_logs.add(week_obj);
				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return week_logs;
	}
	
	
	
	public Integer No_of_group_members(Integer Group_id) 
	{
		String no_of_group="Select count(roll_no) from student where Group_id=?";
		Integer student_count;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement= connection.prepareStatement(no_of_group);
			statement.setInt(1, Group_id);
			ResultSet rs =statement.executeQuery();
			
			if(rs.next())
			{
				student_count= rs.getInt(1);
				System.out.println(student_count);
				return student_count;
			}
			
			System.out.println("No rs");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public void Review1_insert_marks(Integer stu_id,Integer bg_and_topic,Integer proj_scope,Integer lit_survey,Integer proj_planning,Integer presentation_skills,Integer q_and_a )
	{
		String review1_insert="Insert into review1 values(?,?,?,?,?,?,?)  ON DUPLICATE KEY UPDATE stu_id=?,bg_and_topic=?,proj_scope=?,lit_survey=?,proj_planning=?,presentation_skills=?,q_and_a=?";
		System.out.println("Inside Review 1 marks ");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection= DriverManager.getConnection(db_url+db_name,db_user,db_password);
			
			PreparedStatement st=connection.prepareStatement(review1_insert);
			st.setInt(1, stu_id);
			st.setInt(2, bg_and_topic);
			st.setInt(3, proj_scope);
			st.setInt(4, lit_survey);
			st.setInt(5, proj_planning);
			st.setInt(6, presentation_skills);
			st.setInt(7, q_and_a);
			
			st.setInt(8, stu_id);
			st.setInt(9, bg_and_topic);
			st.setInt(10, proj_scope);
			st.setInt(11, lit_survey);
			st.setInt(12, proj_planning);
			st.setInt(13, presentation_skills);
			st.setInt(14, q_and_a);
			
			st.executeUpdate();
			
			st.close();
			connection.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public String extractFilename(Part part)
	{
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		
		System.out.println("Inside extract "); 
		
		for (String s :items)
		{
			if(s.trim().startsWith("filename"))
			{
				return s.substring(s.indexOf("=")+2,s.length()-1);
			}
		}
		return "";
	}
	
	public boolean Insert_abstract(Integer Group_id, String image_path)
	{
		System.out.println("Inside Insert abstract"+Group_id);
		
		String upload_abstract="{call Abstract_upload_path(?,?)}";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection= DriverManager.getConnection(db_url+db_name,db_user,db_password);
			
			PreparedStatement statement=connection.prepareStatement(upload_abstract);
			statement.setInt(1,Group_id );
			
			statement.setString(2, image_path);
			
			statement.executeUpdate();
			return true;
		}
		catch (Exception e) 
		{
			e.printStackTrace(); 
		}
		
		return false;
	}
	
	public boolean Insert_abstract2(Integer Group_id, String image_path)
	{
		System.out.println("Inside Insert abstract"+Group_id);
		
		String upload_abstract="{call Abstract_upload_path2(?,?)}";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection= DriverManager.getConnection(db_url+db_name,db_user,db_password);
			
			PreparedStatement statement=connection.prepareStatement(upload_abstract);
			statement.setInt(1,Group_id );
			
			statement.setString(2, image_path);
			
			statement.executeUpdate();
			return true;
		}
		catch (Exception e) 
		{
			e.printStackTrace(); 
		}
		
		return false;
	}
	public boolean Co_ordinator_select_date(Integer week_no,String from_date,String to_date)
	{
		String insert_week_date="{call Co_ordinator_select_date(?,?,?)}";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_week_date);
			statement.setInt(1, week_no);
			statement.setString(2, from_date);
			statement.setString(3, to_date);
			statement.executeUpdate();
			return true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
		
	}
	
	public ArrayList<Weekly_date> Co_ordinator_display_date()
	{
		String display_week_date="Select * from weekly_date";
		ArrayList<Weekly_date> week_dates=new ArrayList<Weekly_date>();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(display_week_date);
			
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{
				Weekly_date week_obj= new Weekly_date();
				week_obj.setWeek_no(rs.getInt(1));
				week_obj.setFrom_date(rs.getString(2));
				week_obj.setTo_date(rs.getString(3));
				week_dates.add(week_obj);
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return week_dates;
		
	}
	
	public boolean Co_ordinator_insert_group(Integer group_id,Integer Guide_id,Integer reviewer_id,String group_password )
	{
		String insert_group="Insert into group_info(grp_id,Guide_id,Reviewer_id,Group_password) values (?,?,?,?)";
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_group);
			statement.setInt(1, group_id);
			
			statement.setInt(2, Guide_id);
			statement.setInt(3, reviewer_id);
			statement.setString(4, group_password);
			
			
			statement.executeUpdate();
			
			return true;
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean Co_ordinator_insert_student(Integer roll_no,Integer grp_id )
	{
		String insert_group="Insert into student(roll_no,Group_id) values (?,?)";
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_group);
			statement.setInt(1, roll_no);
			
			statement.setInt(2, grp_id);
			
			
			statement.executeUpdate();
			
			return true;
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	public boolean Co_ordinator_delete_group(Integer group_id )
	{
		String insert_group="Delete from group_info where grp_id=?";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_group);
			statement.setInt(1, group_id);
			
			statement.executeUpdate();
			
			return true;
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean Co_ordinator_insert_staff(Integer staff_id,String staff_name,String staff_job,String staff_password)
	{
		String insert_staff="Insert into staff(s_id,s_name,job,staff_password) Values(?,?,?,?)";
		System.out.println(staff_id);
		System.out.println(staff_name);
		System.out.println(staff_job);
		System.out.println(staff_password);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_staff);
			statement.setInt(1,staff_id);
			statement.setString(2, staff_name);
			statement.setString(3, staff_job);
			statement.setString(4, staff_password);
			
			statement.executeUpdate();
			return true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean Co_ordinator_delete_staff(Integer staff_id)
	{
		String insert_staff="Delete from  staff where s_id=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_staff);
			statement.setInt(1,staff_id);
			
			
			statement.executeUpdate();
			return true;
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return false;
	}
	
	public Integer Week_no() 
	{
		String which_week="Select Week_no from weekly_date where CURDATE()>From_date Order by Week_no desc limit 1";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(which_week);
			
			Integer week;
			
			ResultSet rs= statement.executeQuery();
			if (rs.next()) 
			{
				week=rs.getInt(1);
				System.out.println(week);
				return week;
			}
			
			
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return 0;
		
	}
	
	public ArrayList<Weekly_date> Display_weekly_dates()
	{
		String insert_week_date="Select * from weekly_date order by Week_no";
		ArrayList<Weekly_date> weekly_dates=new ArrayList<Weekly_date>();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(insert_week_date);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next())
			{
				Weekly_date week_obj=new Weekly_date();
				week_obj.setWeek_no(rs.getInt(1));
				week_obj.setFrom_date(rs.getString(2));
				week_obj.setTo_date(rs.getString(3));
				weekly_dates.add(week_obj);
			}
			return weekly_dates;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return weekly_dates;
		
	}	
/*	public boolean Co_ordinator_view_student_and_group(HttpServletResponse response)
	{
		String view_student_and_group="Select student.roll_no,student.stu_name,student.Group_id,group_info.Problem_title,group_info.Guide_id,group_info.Reviewer_id from student,group_info where group_info.grp_id=student.Group_id";
		try 
		{
			System.out.println("Inside view student and group ");
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(view_student_and_group);
			
			ResultSet rs= statement.executeQuery();
			JspWriter out=new Jsp;
			out.write("<table>" );
			out.write("<thead><tr><th>RollNo</th><th>Student name</th><th>Group ID</th><th>Problem Title</th><th>Guide ID</th><th>Reviewer ID</th></tr></thead>" );
			while(rs.next())
			{
				out.write("<tr>");
				out.write("<td>");
				out.write(rs.getString(1));
				out.write("</td>");
				out.write("<td>");
				out.write(rs.getString(2));
				out.write("</td>");
				out.write("<td>");
				out.write(rs.getString(3));
				out.write("</td>");
				out.write("<td>");
				out.write(rs.getString(4));
				out.write("</td>");
				out.write("<td>");
				out.write(rs.getString(5));
				out.write("</td>");
				out.write("<td>");
				out.write(rs.getString(6));
				out.write("</td>");
				out.write("</tr>");
			}
			out.write("</table>");
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return false ;
		
	}
*/	
	public ArrayList<Staff> Co_ordinator_all_guide()
	{
		String selectString="Select s_id from staff where job='guide'";
		ArrayList<Staff> sta=new ArrayList<Staff>();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(selectString);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next())
			{
				Staff staff_obj=new Staff();
				staff_obj.setStaff_id(rs.getInt(1));
				sta.add(staff_obj);
			}
			return sta;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return sta;
	}
	public ArrayList<Staff> Co_ordinator_all_reviewer()
	{
		String selectString="Select s_id from staff where job='reviewer'";
		ArrayList<Staff> sta=new ArrayList<Staff>();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(selectString);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next())
			{
				Staff staff_obj=new Staff();
				staff_obj.setStaff_id(rs.getInt(1));
				sta.add(staff_obj);
			}
			return sta;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return sta;
	}
	
	public boolean update_staff(Integer old_staff_id,Integer new_staff_id,String s_name,String job )
	{
		String update="Update staff set s_id=?,s_name=?,job=?  where s_id=? and job=? ";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(update);
			
			statement.setInt(1, new_staff_id);
			statement.setString(2, s_name);
			statement.setString(3, job);
			statement.setInt(4, old_staff_id);
			statement.setString(5, job);
			statement.executeUpdate();
			
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean Insert_guide_weekly_date(Integer Group_id,Integer Week_no,String Date_of_log)
	{
		String update="Insert into weekly_log (Group_id,Week_no,Date_of_log) Values(?,?,?)";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(update);
			
			statement.setInt(1, Group_id);
			statement.setInt(2, Week_no);
			statement.setString(3, Date_of_log);
			
			statement.executeUpdate();
			
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
		
	public ArrayList<Weekly_log> Group_notification_guide(Integer Group_id,Integer week_no)
	{
		String get_date="Select * from weekly_log where Group_id=? and Week_no=?";
		ArrayList<Weekly_log> grps=new ArrayList<Weekly_log>();
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(get_date);
			System.out.println(Group_id);
			
			statement.setInt(1, Group_id);
			statement.setInt(2, week_no);
			System.out.println(week_no);
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{
				Weekly_log grp_obj=new Weekly_log();
				grp_obj.setGroup_id(rs.getInt(1));
				grp_obj.setWeek_no(rs.getInt(2));
				grp_obj.setDate_of_log(rs.getString(3));
				grp_obj.setTopics(rs.getString(4));
				grp_obj.setRemarks(rs.getString(5));
				grps.add(grp_obj);
			}
			return grps;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return grps;
	}
	
	public boolean Update_Student(Integer Student_id,String name,String Email)
	{
		String update_stu="Update student set stu_name=?,stu_email=? where roll_no=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(update_stu);
			statement.setString(1, name);
			statement.setString(2, Email);
			statement.setInt(3, Student_id);
			
			statement.executeUpdate();
			return true;
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean Update_Group(Integer Group_id, String Project_title,String Project_platform,String Project_area)
	{
		String update_stu="Update group_info set proj_platform=?,proj_area=?,Problem_title=? where grp_id=?";
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(update_stu);
			statement.setInt(4, Group_id);
			statement.setString(1, Project_platform);
			statement.setString(2, Project_area);
			statement.setString(3,Project_title);
			
			statement.executeUpdate();
			return true;
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return false;
	}
	
	public Float Co_ordinator_complete_groups()
	{
		String total_grp="Select count(*) from group_info";
		String completed_grp="SELECT count(*) FROM `group_info` WHERE Problem_title is NOT null";
		Float total;
		Float comp;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement1=connection.prepareStatement(total_grp);
		
			ResultSet rs1=statement1.executeQuery();
			
			PreparedStatement statement2=connection.prepareStatement(completed_grp);
		
			ResultSet rs2=statement2.executeQuery();
			if(rs2.next() && rs1.next())
			{
				total=rs1.getFloat(1);
				comp=rs2.getFloat(1);
				System.out.println(comp/total*100);
				Float percent=comp/total*100;
				return percent;
				
			}
		
		
			
		}
		catch (Exception e) 
		{
		// TODO: handle exception
		}
		return 0.0f;
	}
	public boolean Reviewer_Insert_comment(Integer groupid,String comment)
	{
		String insert_comment="{call rev_comment(?,?)}";
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement1=connection.prepareStatement(insert_comment);
			statement1.setInt(1, groupid);
			statement1.setString(2, comment);
		
			statement1.executeUpdate();
	
			return true;
		}
		catch (Exception e) 
		{
		// TODO: handle exception
		}
		
		
		
		return false ;
	}
	
	
	//Atharva Galphade code///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
		public ArrayList<Weekly_log> Co_ordinator_weekly_log() 
		{
			String status="Select * from weekly_log";
			
			ArrayList<Weekly_log>weeks=new ArrayList<Weekly_log>(); 
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
				PreparedStatement statement= connection.prepareStatement(status);
				ResultSet rs =statement.executeQuery();
				
				while(rs.next())
				{
					Weekly_log week_obj=new Weekly_log();
					week_obj.setGroup_id(rs.getInt(1));
					week_obj.setWeek_no(rs.getInt(2));
					week_obj.setDate_of_log(rs.getString(3));
					week_obj.setTopics(rs.getString(4));
					week_obj.setRemarks(rs.getString(5));
					
					weeks.add(week_obj);
				}
				
				System.out.println("No rs");
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return weeks;
		}
		
		
		public ArrayList<group_review1> reviewer_acknowledge_upload(Integer group_id) 
		{
			String stat="Select * from group_review1 where Group_id=?";
			
			ArrayList<group_review1>acknowledge=new ArrayList<group_review1>(); 
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
				PreparedStatement statement= connection.prepareStatement(stat);
				statement.setInt(1, group_id);
				ResultSet rs =statement.executeQuery();
				while(rs.next())
				{
					group_review1 ack_obj=new group_review1();
					ack_obj.setProject_report(rs.getString(4));
					ack_obj.setGroup_id(rs.getInt(1));
					ack_obj.setGuide_comments(rs.getString(3));
					ack_obj.setReviewer_comments(rs.getString(2));
					//System.out.println("String is" + rs.getString(4));
					acknowledge.add(ack_obj);
				}
					
					
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return acknowledge;
		}
		
		
		public ArrayList<group_review1> student_see_comments(Integer group_id) 
		{
			String stat="Select * from group_review1 where Group_id=?";
			
			ArrayList<group_review1>see_comment=new ArrayList<group_review1>(); 
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
				PreparedStatement statement= connection.prepareStatement(stat);
				statement.setInt(1, group_id);
				ResultSet rs =statement.executeQuery();
				while(rs.next())
				{
					group_review1 seecom_obj=new group_review1();
					seecom_obj.setProject_report(rs.getString(4));
					seecom_obj.setGroup_id(rs.getInt(1));
					seecom_obj.setGuide_comments(rs.getString(3));
					seecom_obj.setReviewer_comments(rs.getString(2));
					see_comment.add(seecom_obj);
					
				}
					
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return see_comment;
		}
		
		public review1 see_marks_rev1(Integer stud_id) 
		{
			String stat="Select * from review1 where stu_id=?";
			
			review1 see_marks1=new review1(); 
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
				PreparedStatement statement= connection.prepareStatement(stat);
				statement.setInt(1, stud_id);
				ResultSet rs =statement.executeQuery();
				if(rs.next())
				{
					review1 seemarks_1_obj=new review1();
					seemarks_1_obj.setStu_id(rs.getInt(1));
					seemarks_1_obj.setBg_and_topic(rs.getInt(2));
					seemarks_1_obj.setProj_scope(rs.getInt(3));
					seemarks_1_obj.setLit_survey(rs.getInt(5));
					seemarks_1_obj.setProj_planning(rs.getInt(6));
					seemarks_1_obj.setPresentation_skills(rs.getInt(7));
					
				}
					
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return see_marks1;
		}
	
	
	
	
	
}
