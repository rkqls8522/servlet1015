<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

   <%
   String id = request.getParameter("id");
   String password = request.getParameter("password").trim();
   String sql = "select * from woori where id= '" + id +"';" ;
   
   Connection conn = null;
   PreparedStatement pst = null;
   ResultSet rs = null;
   int cnt = 0;

   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
   } catch (ClassNotFoundException e) {
      out.println(e);
   }
   String dbURL = "jdbc:mysql://localhost:3306/member?serverTimezone=Asia/Seoul";
   String dbId = "root";
   String dbPw = "1234";
   
   try{
      conn = DriverManager.getConnection(dbURL,dbId,dbPw);

    
      }catch(SQLException e){
      out.print(e);
   }
   
   //퀴리를 실행함
   try{
        pst = conn.prepareStatement(sql);
        pst.setString(1, id); // ?의 갯수에 맞춰서 값을 세팅함, 첫번째? 에 id를 
        //sql 쿼리를 수행하고 ResultSet을 구함 
         rs = pst.executeQuery(sql);
        
        if(!(rs.next())){ %>
           해당하는 회원이 없습니다. 
           
        <% } else  {
           if(password.equals(rs.getString("password"))) { %>
              사용자 id가 <%= id %> 인 회원의 정보는 다음과 같습니다. 
              정보를 변경하려면 내용을 입력한 다음 <수정하기> 버튼을 누르세요
              <form action="update.jsp" name="form1" method="post">
                 <input type="hidden" name="id" value="<%=id%>">
               <br> 이름:
            <input type="text" name="name" value="<%=rs.getString("name")%>">
               <br> E-mail :
            <input type="text" name="email" value="<%=rs.getString("email")%>">
               <input type="submit" name="change" value="수정하기">
               <a href="delete.jsp?id=<%=id%>">삭제하기</a>
              </form>
        <%   } else { %>
               비밀번호가 틀립니다.
           <%}
           
        }
      rs.close();
      pst.close();
      conn.close();
   }catch(SQLException e){
      out.println(e);
      
   }
   
   
%>

[<a href = main.html>메인으로</a>]
&nbsp; [<a href = "insert.html">회원등록페이지로</a>]