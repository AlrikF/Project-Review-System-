
package com.login;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;






@WebServlet("/Form_submit")             // for skipping xml
@MultipartConfig(maxFileSize = 16177215)          //upload file's size up to 16MB


public class Form_submissions extends HttpServlet                // I had forgotten this used to inherit Http Servlet superclass
{
	         // folder for all the images 
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{

		
		String which_page=request.getParameter("button");
		
		System.out.println(which_page);
		System.out.println("Inside do post form submission ");
	
	
		if("Upload the report".equals(which_page))
		{
			String Save_image_dir="Images"; 
			QueriesDao que =new QueriesDao();
			HttpSession session=request.getSession();
			
			
			System.out.println("Inside upload group report ");
			
			String savepath="D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent"+File.separator+  Save_image_dir  ;
			
			
			Integer Group_id=(Integer)session.getAttribute("Group_no");
			Integer Week_no=Integer.parseInt(request.getParameter("week"));
			String Date_of_log=request.getParameter("Log_date");
			String Topics=request.getParameter("Topics");
			String Remarks=request.getParameter("Remarks");
			
			
			
			File file_save_dir=new File(savepath);
			
			Part part=request.getPart("Guide_sign_pic");
			
			String file_name=que.extractFilename(part);
			
			System.out.println(file_name);
			System.out.println(savepath+File.separator+file_name);
			
			
			
			part.write(savepath+File.separator+file_name);
			
			
			
			
			
			System.out.println(Group_id  );
			System.out.println(Week_no);
			System.out.println(Date_of_log);
			System.out.println(Topics);
			System.out.println(Remarks);
		
			String flnpth=que.Insert_sign(1,savepath,file_name);
			System.out.println("File path and image :"+flnpth);
		//	System.out.println(Guide_sign);                // photo insertion
			
			
			
	//		String status=que.Insert_weekly_report(Group_id, Week_no, Date_of_log, Topics, Remarks);
	//		System.out.println(status);
		}
		else if("See group details".equals(which_page))   // In guide home when we see group details 
		{
			
			System.out.println("Inside guide group" +request.getParameter("Guide_group")); 
		//	QueriesDao qdao=new QueriesDao();
		//	ArrayList<Weekly_log> grp_logs=new ArrayList<Weekly_log>();
			
			HttpSession session=request.getSession();
			
		//	grp_logs=qdao.Group_Weekly_Log((Integer.parseInt(request.getParameter("Guide_group"))));
		//	session.setAttribute("Guide_view_group", grp_logs);
			session.setAttribute("Guide_grp_id",(Integer.parseInt(request.getParameter("Guide_group"))) );
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("Guide_grpweekly.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		else if("See group weekly log".equals(which_page))   // In reviewer home when we select group weekly logs  
		{
			
			response.sendRedirect("Reviewer_weekly_log.jsp");
	/*		System.out.println("Inside reviewer group"); 
			QueriesDao qdao=new QueriesDao();
			ArrayList<Weekly_log> grp_logs=new ArrayList<Weekly_log>();
			HttpSession session=request.getSession();
			int grp_id=(Integer)session.getAttribute("Rev_grp_num");
			System.out.println(grp_id);
			
	//		grp_logs=qdao.Group_Weekly_Log((Integer.parseInt(request.getParameter("Reviewer_group"))));   // for group weekly logs old page

			grp_logs=qdao.Group_Weekly_Log(grp_id);   // New page
			request.setAttribute("Reviewer_weekly_log_group", grp_logs);
			request.setAttribute("RGrp_id",grp_id );
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("Reviewer_grpweekly.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
	*/	}
		else if("Evaluate students".equals(which_page))
		{
			System.out.println("Inside evaluation ");
			QueriesDao qdao=new QueriesDao();
			HttpSession session=request.getSession();
			int grp_id=(Integer)session.getAttribute("Rev_grp_num");
			
			
			qdao.Group_home(request,grp_id);
			
			
			session.setAttribute("RGrp_id",grp_id);
			
			
			response.sendRedirect("Rev1marks.jsp");
			
		}
		else if ("Submit Review".equals(which_page))
		{
			QueriesDao qdao=new QueriesDao();
			
			System.out.println();
			
			HttpSession session=request.getSession();
			Integer group_id=(Integer) session.getAttribute("RGrp_id");
			
			System.out.println("Getting");
			System.out.println("Group id:"+group_id);
			
			Integer count=qdao.No_of_group_members(group_id);
			
			System.out.println("No of students:"+count);
			
			
			for(int i=1;i<count+1;i++)
			{
				
					String mark=Integer.toString(i);
					
						Integer Student_Roll_No=Integer.parseInt(request.getParameter("Student_Roll_No"+mark));           //Marks 
						Integer bg_and_t=Integer.parseInt(request.getParameter("bg_and_t"+mark));
						Integer Pj_scope_n_obj=Integer.parseInt(request.getParameter("Pj_scope_n_obj"+mark));
						Integer Lit_survey=Integer.parseInt(request.getParameter("Lit_survey"+mark));
						Integer Proj_plan=Integer.parseInt(request.getParameter("Proj_plan"+mark));
						Integer Present_skill=Integer.parseInt(request.getParameter("Present_skill"+mark));
						Integer QnA=Integer.parseInt(request.getParameter("QnA"+mark));
						
						
						System.out.println("Student:"+i+":"+Student_Roll_No);
						System.out.println(bg_and_t);
						System.out.println(Pj_scope_n_obj);
						System.out.println(Lit_survey);
						System.out.println(Proj_plan);
						System.out.println(Present_skill);
						System.out.println(QnA);
						
						qdao.Review1_insert_marks(Student_Roll_No, bg_and_t, Pj_scope_n_obj, Lit_survey, Proj_plan, Present_skill, QnA);
						
						
			}
			
			
			
			String rev_comment=request.getParameter("comment_by_reviewer");
			System.out.println(rev_comment);
			qdao.Reviewer_Insert_comment(group_id, rev_comment);
			
			request.setAttribute("compMsg", "Marks and comment entered successfully");
		    RequestDispatcher rd = request.getRequestDispatcher("Rev1marks.jsp");
		    try 
		    {
		    	rd.forward(request, response);
			} 
		    catch (Exception e) 
		    {
				e.printStackTrace();
			}

			
		}

		else if ("Reviewer_group_home".equals(which_page) )   // In reviewer on clicking a tile 			
		{
			int	which_no=Integer.parseInt(request.getParameter("Id"));
			System.out.println("Group no"+which_no);
			QueriesDao qdao=new QueriesDao();
			Integer grp_id= which_no;
			//_______________________________________________________________________________________________________________________________
			HttpSession session=request.getSession();
			session.setAttribute("Reviewer_grp_id", grp_id);
			
			qdao.Group_home(request, grp_id);                      // Student Information 
			
			Group grp_obj= qdao.display_group(grp_id);             // Group Information
			
			request.setAttribute("Group_info", grp_obj);
			
			RequestDispatcher dispatcher= request.getRequestDispatcher("Reviewer_group_info.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
		}
		else if ("Guide_group_home".equals(which_page) )   // In reviewer on clicking a tile 			
		{
			int	which_no=Integer.parseInt(request.getParameter("Id"));
			System.out.println("Group no that guide wants to view "+which_no);
			QueriesDao qdao=new QueriesDao();
			Integer grp_id= which_no;
			
			qdao.Group_home(request, grp_id);                      // Student Information 
			
			Group grp_obj= qdao.display_group(grp_id);             // Group Information
			
			HttpSession session =request.getSession();
			session.setAttribute("Guide_grp_id", grp_id);
			
			request.setAttribute("Group_info", grp_obj);
			
			RequestDispatcher dispatcher= request.getRequestDispatcher("Guide_group_info.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			response.sendRedirect("Rev1marks.jsp");
		
		}
		
		else if ("Go to student Dashboard".equals(which_page)) 
		{
			System.out.println("Student Dashboard");
			RequestDispatcher dispatcher=request.getRequestDispatcher("Student_info.jsp");
			try 
			{
				dispatcher.forward(request, response);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		else if("Submit deliverable for review1".equals(which_page))
		{
			HttpSession session=request.getSession();
			int grp_id=(Integer)session.getAttribute("Student_group");
			System.out.println("Inside deliverable for review1 deliverable"+ grp_id);
					
			String Save_image_dir="Images"; 
			QueriesDao que =new QueriesDao();
			
			String savepath="D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent"+File.separator+ Save_image_dir  ;
			
			File file_save_dir=new File(savepath);
			Part part=request.getPart("myFile");
			
			String file_name=que.extractFilename(part);
			
			System.out.println(file_name);
			System.out.println(savepath+File.separator+file_name);
			
			
			
			
			part.write(savepath+File.separator+file_name);
			
			String image_path=Save_image_dir+File.separator+file_name;
			System.out.println(Save_image_dir+File.separator+file_name);
			que.Insert_abstract(grp_id,image_path);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("student_upload1.jsp");
			request.setAttribute("compMsg", "Abstract1 submitted successfully");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			//String flnpth=que.Insert_sign(1,savepath,file_name);
			//System.out.println("File path and image :"+flnpth);
			
			
		}
		else if("Submit deliverable for review2".equals(which_page)) 
		{
			HttpSession session=request.getSession();
			int grp_id=(Integer)session.getAttribute("Student_group");
			System.out.println("Inside deliverable for review2 deliverable"+grp_id);
			
			String Save_image_dir="Images"; 
			QueriesDao que =new QueriesDao();
			
			String savepath="D:\\Eclipse_EE\\servlet\\JSP_query\\WebContent"+File.separator+ Save_image_dir  ;
			
			File file_save_dir=new File(savepath);
			Part part=request.getPart("myFile");
			
			String file_name=que.extractFilename(part);
			
			System.out.println(file_name);
			System.out.println(savepath+File.separator+file_name);
			
			
			
			
			part.write(savepath+File.separator+file_name);
			
			String image_path=Save_image_dir+File.separator+file_name;
			
			que.Insert_abstract2(grp_id,image_path);
			
			request.setAttribute("compMsg", "Abstract2 submitted successfully");
			RequestDispatcher dispatcher=request.getRequestDispatcher("student_upload2.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			//String flnpth=que.Insert_sign(1,savepath,file_name);
			//System.out.println("File path and image :"+flnpth);
			
			
		}
		else if ("Co-ordinator_select_date".equals(which_page))
		{
			System.out.println("Inside Co ordinator select date ");
			Integer week_no=Integer.parseInt(request.getParameter("Week_no"));
			String from_date=request.getParameter("from_date");
			String to_date=request.getParameter("to_date");
			
			System.out.println(week_no);
			System.out.println(from_date);
			System.out.println(to_date);
			
			QueriesDao qdao=new QueriesDao();
			qdao.Co_ordinator_select_date(week_no, from_date, to_date);
			RequestDispatcher dispatcher=request.getRequestDispatcher("Co-ordinator_select_date.jsp");
			try 
			{
				dispatcher.forward(request, response);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		else if ("Enter weekly log for group".equals(which_page)) 
		{
			response.sendRedirect("Guide_enter_weekly_log.jsp");
		}
		
		else if("Guide_submit_weekly_log".equals(which_page))  // in guide to submit weekly log 
		{
			System.out.println("Inside submit guide weekly log ");
			
			QueriesDao qdao=new QueriesDao();
			HttpSession session =request.getSession();
			
			Integer grp_id=(Integer)session.getAttribute("Guide_grp_id");
			Integer week_no=qdao.Week_no();                                                  /////////////////////////SEEE WEEEK
			String date_of_log=request.getParameter("date_of_log");
			String topics=request.getParameter("topics");
			String remarks=request.getParameter("remarks");
			
			qdao.Insert_weekly_report(grp_id, week_no, date_of_log, topics, remarks);
			
			response.sendRedirect("Guide_enter_weekly_log.jsp");
			
		}
		else if ("Add Reviewer".equals(which_page)) 
		{
			QueriesDao qdao=new QueriesDao();
			Integer rev_id=Integer.parseInt(request.getParameter("Reviewer_id_add"));
			String name=request.getParameter("Reviewer_name");
			
			System.out.println(rev_id);
			System.out.println(name);
			
			qdao.Co_ordinator_insert_staff(rev_id, name, "reviewer", "1234");
			
			response.sendRedirect("Co_ordinator_alter_staff.jsp");
		}
		else if ("Add Guide".equals(which_page)) 
		{
			QueriesDao qdao=new QueriesDao();
			Integer guide_id=Integer.parseInt(request.getParameter("Guide_id_add"));
			String name=request.getParameter("Guide_name");
			System.out.println("Add guide");
			System.out.println(guide_id);
			System.out.println(name);
			
			qdao.Co_ordinator_insert_staff(guide_id, name, "guide", "1234");
		//	response.sendRedirect("Co_ordinator_alter_staff.jsp");
		}
	/*	else if("Delete Guide".equals(which_page))
		{
			QueriesDao qdao=new QueriesDao();
			Integer guide_id=Integer.parseInt(request.getParameter("Guide_id_delete"));
			
			System.out.println(guide_id);
			
			qdao.Co_ordinator_delete_staff(guide_id);
			response.sendRedirect("Co_ordinator_alter_staff.jsp");
		}
		else if("Delete Reviewer".equals(which_page))
		{
			QueriesDao qdao=new QueriesDao();
			Integer rev_id=Integer.parseInt(request.getParameter("Reviewer_id_delete"));
			
			System.out.println();
			
			qdao.Co_ordinator_delete_staff(rev_id);
			response.sendRedirect("Co_ordinator_alter_staff.jsp");
		}
	*/	
		else if ("Add the group".equals(which_page))
		{
			Integer stu1=Integer.parseInt(request.getParameter("student1_id"));
			Integer stu2=Integer.parseInt(request.getParameter("student2_id"));
			Integer stu3=Integer.parseInt(request.getParameter("student3_id"));
			Integer stu4=Integer.parseInt(request.getParameter("student4_id"));
			Integer grp_id=Integer.parseInt(request.getParameter("Group_id"));
			Integer rev_id=Integer.parseInt(request.getParameter("rev_id"));
			Integer guide_id=Integer.parseInt(request.getParameter("guide_id"));
			
			QueriesDao qDao=new QueriesDao();
			qDao.Co_ordinator_insert_group(grp_id, guide_id,rev_id, "1234");
			qDao.Co_ordinator_insert_student(stu1, grp_id);
			qDao.Co_ordinator_insert_student(stu2, grp_id);
			qDao.Co_ordinator_insert_student(stu3, grp_id);
			qDao.Co_ordinator_insert_student(stu4, grp_id);
			
			response.sendRedirect("Co_ordinator_alter_group.jsp");
			
		}
		else if("Update Reviewer".equals(which_page)) 
		{
			System.out.println("Update Reviewer");
			Integer old_rev_id=Integer.parseInt(request.getParameter("old_rev_id"));
			String s_name=request.getParameter("new_rev_name");
			Integer new_rev_id=Integer.parseInt(request.getParameter("new_rev_id"));
			
			QueriesDao qdao=new QueriesDao();
			qdao.update_staff(old_rev_id, new_rev_id, s_name, "reviewer");
			
			response.sendRedirect("Co_ordinator_alter_staff.jsp");
			
			
		}
		else if("Update Guide".equals(which_page)) 
		{
			System.out.println("Update Guide");
			Integer old_rev_id=Integer.parseInt(request.getParameter("old_guide_id"));
			String s_name=request.getParameter("new_guide_name");
			Integer new_rev_id=Integer.parseInt(request.getParameter("new_guide_id"));
			
			QueriesDao qdao=new QueriesDao();
			qdao.update_staff(old_rev_id, new_rev_id, s_name, "guide");
			
			response.sendRedirect("Co_ordinator_alter_staff.jsp");
			
			
		}
		else if("Guide_set_group_weekly_dates".equals(which_page))
		{
			System.out.println("Inside set guide weekly log date");
			
			QueriesDao qdao=new QueriesDao();
			HttpSession session =request.getSession();
			
			Integer grp_id=(Integer)session.getAttribute("Guide_grp_id");
			Integer week_no=Integer.parseInt(request.getParameter("Week_no"));                                                  /////////////////////////SEEE WEEEK
			String date_of_log=request.getParameter("date_of_log");
			
			
			qdao.Insert_guide_weekly_date(grp_id, week_no, date_of_log);
			response.sendRedirect("Guide_enter_weekly_log_dates.jsp");
			
		}
		else if("Update Student".equals(which_page))
		{
			Integer student_id= Integer.parseInt(request.getParameter("Student_id"));
			String Student_name=request.getParameter("Student_name");
			String Student_email =request.getParameter("Student_email");
			
			QueriesDao qdao=new QueriesDao();
			qdao.Update_Student(student_id, Student_name, Student_email);
			response.sendRedirect("Group_upload_details.jsp");
		}
		else if("Update Group".equals(which_page))
		{
			HttpSession session =request.getSession();
			Integer grp_id= (Integer)session.getAttribute("Student_group");
			String project_title=request.getParameter("Project title");
			String project_platform =request.getParameter("Project Platform");
			String project_area=request.getParameter("Project Area");
			
			QueriesDao qdao=new QueriesDao();
			qdao.Update_Group(grp_id, project_title, project_platform, project_area);
			response.sendRedirect("Group_upload_details.jsp");
		}
		
		else 
		{
			System.out.println("Nothing ");
		}
	
	}
}
