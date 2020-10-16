<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language ="java" import ="java.sql.*" %>

<%
	String url = "jdbc:mysql://127.0.0.1:3306/member?useSSL=false&user=root&password=1234&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
	// 커넥션 생성 전, 정의 먼저 깔끔하게 해주기
	Connection conn = null;
	ResultSet rs = null;
	Statement st = null;
	String qu = null;
	ResultSetMetaData rsmd = null;

	// 드라이버 로드
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url); // 커넥션 생성
		st = conn.createStatement();
		
		out.println("Database connection OK!<br>");
		out.println("conn : " + conn + "<br>");
		out.println("query : " + qu);
		//st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		//qu = "create table dbtest.woori(id char(10) primary key, name char(10));";
		//st.executeUpdate(qu);
		
		qu = "select * from dbtest.woori;";
		rs = st.executeQuery(qu);
		
		rsmd = rs.getMetaData();
		out.println("칼럼 갯수 : " + rsmd.getColumnCount() + "<br>");
		out.println("첫 번째 칼럼 : " + rsmd.getColumnName(1) + "<br>");
		out.println("두 번째 칼럼 : " + rsmd.getColumnName(2) + "<br>");
		
		
	} catch (SQLException e) {
		out.println(e);
	} finally {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException conne) {
			}
	}


%>