<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SQL 사용(Import) -->
<%@ page language = "java" import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!-- 스크립트릿 생성 -->
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String sql = null;
	Connection conn = null;
	Statement  st 	= null;
	// 데이터를 수정할 거기 때문에 필요없어
	//ResultSet  rs 	= null;
	
	//JDBC-ODBC driver등록
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch(ClassNotFoundException e) {
		out.println(e);
	}
	String dbURL 	  = "jdbc:mysql://localhost:3306/member?&useSSL=false";
	String dbId  	  = "root";
	String dbPassword = "1234";
	// DB(데이터베이스)와 연결
	try {
		conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
		System.out.println("데이터베이스 연결 성공!!!");
	} catch(SQLException e) {
		out.println("<script>alert('가입처리되지 않았습니다. 다시 시도해주세요.') </script>");
	}
	// 쿼리를 실행한다.
	try {
		// 위에 선언한 Statement객체의 참조변수 사용
		// Connection.createStatement() : sql문을 데이터베이스로 보냄
		st = conn.createStatement();
		// Statement.executeUpdate() : SQL DDL문을 실행한다.
		//st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
		// 질의어 수행
		sql = "update woori set " ;                              
	    sql = sql + "name ='" + name + "'," + "email ='" + email + "'" ;
	    sql = sql + "  where id = '" + id + "'" ;                     
	    st.executeUpdate(sql);                                
	    conn.close();                              
	    st.close();                              
	}catch(SQLException e) {
			out.println(e);
	}
%> 
<jsp:forward page = "selectall.jsp"/>   