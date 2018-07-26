<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@ page import="java.sql.*"%>
<%

/* if (username.length()>0 && password.length()>0)
{
    String query = "Select * from user Where Username='" + userName + "' and Password='" + password + "'";

    rs = sta.executeQuery(query);
 */


	String query = "select count(*) as \"exists\" from user where username=? and password=?";
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/hussain", "root", "root");
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1,userName);
    ps.setString(2,password);
	ResultSet results;
	results = ps.executeQuery();
	if (results.next()) {
		int i = results.getInt("exists");
		if (i == 1) {
			session.setAttribute("userid", userName);
			response.sendRedirect("success.jsp");
		} else {
			out.println("Invalid password <a href='index.jsp'>try again</a>");
			System.out.println("prem/t");
		}
	}
%>