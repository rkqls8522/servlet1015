<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selectAll</title>
</head>
<body>
   <%
   
   String sql = null;
   Connection conn = null;
   Statement st = null;
   ResultSet rs = null;
   int cnt = 0;
   
   //jdbc-odbc driver 등록
   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
   } catch (ClassNotFoundException e) {
      out.print("드라이버 등록 실패 : " + e);
   }
   
   String dbURL = "jdbc:mysql://localhost:3306/member?serverTimezone=Asia/Seoul";
   String dbId = "root";
   String dbPw = "1234";
   
   //DB와 연결 
   try{
      conn = DriverManager.getConnection(dbURL,dbId,dbPw);
      out.println("db 연결 성공. conn : " + conn + "<br>");
      st = conn.createStatement();
      rs = st.executeQuery("select * from woori;");
		// 각 열을 반복적으로 나타내줌
		while (rs.next()) {
			String id = rs.getString("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			String email = rs.getString("email");
			out.print("id : " + id + "<br>password : " + password + "<br>name : " + name + "<br>email : " + email);
			out.print("<br>-----------------------------");
		}
		st.close();
	
	} catch (SQLException e) {
		out.print(e);
	} finally {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException conne) {
			}
	}

   %>
<br>
[<a href = main.html>메인으로</a>]


</body>
</html>