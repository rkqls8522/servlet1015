<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
</head>
<body>
	<%
		String id = request.getParameter("id");	
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}catch (ClassNotFoundException e){
			out.print("드라이버 등록 실패 : " + e);
		}
		String url = "jdbc:mysql://localhost:3306/member?serverTimezone=Asia/Seoul&user=root&password=1234";
		
		try{
			conn = DriverManager.getConnection(url);
			out.print("db연경 성공. conn : " + conn + "<br>");
			st = conn.createStatement();
			rs = st.executeQuery("select * from woori where id = '" + id + "'");
			if(rs.next()){
				String rsid = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String email = rs.getString("email");
				out.print("id : " + rsid + "<br>password : " + password + "<br>name : " + name + "<br>email : " + email);
				out.print("<br>-----------------------------");
			}else{
				out.print(id + "가 없습니다.");
			}
			st.close();
		}catch(SQLException e){
			out.print(e);
		}finally{
			if(conn != null)
				try{
					conn.close();
				}catch(SQLException conne){
					
				}
		}
		
		
		
	%>
	<br>
	[<a href = main.html>메인으로</a>]
</body>
</html>