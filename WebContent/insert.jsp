<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert</title>
</head>
<body>
   <%
   String id = request.getParameter("id");
   int password = Integer.parseInt(request.getParameter("password"));
   String name = request.getParameter("name");
   String email = request.getParameter("email");
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
      rs = st.executeQuery("select * from woori where id='" + id + "'");
      if(!(rs.next())){
         sql = "insert into woori(id,password,name,email)";
         sql = sql+ " values('" + id + "', " + password + ", '" + name + "', " + email + "');";
         //insert문을 이용하여 데이터 추가
         cnt = st.executeUpdate(sql);
         out.println("입력한 쿼리문 : " + sql + "<br>");
         if(cnt > 0) out.println("데이터가 성공적으로 입력되었습니다. ");
         else out.println("데이터가 입력되지 않았습니다.");
      }else{
         out.println("id가 이미 등록되어 있습니다.");
         st.close();
         conn.close();
      } 
   }catch(SQLException e){
	   out.println("입력한 쿼리문 : " + sql + "<br>");
         out.print(e);
   }


   %>
<br>
[<a href = main.html>메인으로</a>]
&nbsp;[<a href = insert.html>추가로 넣기</a>]


</body>
</html>