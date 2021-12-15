<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.*,
org.hibernate.cfg.Configuration,
com.coforge.training.crudtest.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
 <style>
        .container{
  border-radius: 5px;
  background-color: rgb(162, 164, 170);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 500px;
  height: 150px;
  
}
input {
  width: 500px;
  padding: 12px;
  border: 1px solid rgb(24, 174, 233);
  border-radius: 10px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
#btn{
    cursor: pointer;
    background-color: seagreen;
}
h3,h1{
text-align:center;}
h4{
text-align:center;
color:red;
}

    </style>
</head>
<body>

<h3><a href="./showproducts.jsp">Show Products</a></h3>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();

String num=request.getParameter("cl1");
if(num!=null){
int pid=Integer.parseInt(num);  
String hql1 = "delete from Product where id = :id";
Query query;
query = sess.createQuery(hql1); 
query.setParameter("id", pid);
int rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("<h4>"+"Product deleted Successfully"+"</h4>");
}
else{
out.println("<h4>"+"No Record Found!!"+"</h4>");
}
}
sess.getTransaction().commit();
sess.close();
factory.close();
%>
<form>  
 <div class="container">
		<label>Pro_Id</label>
		<input type="text" name="cl1">
		<input type="submit" name="button" id="btn" value="Submit">
	</div>
  </form>
</body>
</html>