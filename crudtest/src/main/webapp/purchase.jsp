<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.*,
java.util.*,
org.hibernate.cfg.Configuration,
com.coforge.training.crudtest.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update</title>
 <style>
        .container{
  border-radius: 5px;
  background-color: rgb(162, 164, 170);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 500px;
  height: 400px;
  
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
h3,h2{
text-align:center;}
h4{
text-align:center;
color:red;
}

    </style>
</head>
<body>
  <%! int num1; int up_qty; String aval;%>
<hr>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");

SessionFactory factory = cfg.buildSessionFactory();
Session sess= factory.openSession();
sess.beginTransaction();




String num=request.getParameter("cl1");
if(num!=null){
int pid=Integer.parseInt(num);  
String qnty=request.getParameter("cl2");
int q=Integer.parseInt(qnty);


String hql1="select qty from Product p where p.id = :id";

Query query1=sess.createQuery(hql1);
query1.setParameter("id", pid);
List p = query1.list();
num1 =((Integer)p.get(0)).intValue();
 out.println();

if((num1-q)>=0){
	up_qty=num1-q;
	
	
	
String hql = "update Product set qty = :qty, ava = :ava where id = :id";
Query query = sess.createQuery(hql);

query.setParameter("qty",up_qty);
query.setParameter("id",pid);
if(up_qty==0){
	query.setParameter("ava","<h4>"+"Out Of Stock"+"</h4>");
}

	



int rowsAffected = query.executeUpdate();
if (rowsAffected > 0) {
out.println("<h4>"+"Updated Successfull!"+"</h4>");
}}
else{
	out.println("<h4>"+"Available items are :"+num1+"<br>"+" Please select less than or equal to  "+num1+" Products!"+ "</h4>");
}
}
sess.getTransaction().commit();
sess.close();
factory.close();
%>

<h3><a href="./showproducts.jsp">Show Products</a></h3>
<form>  
<div class="container">
		<label>Pro_Id</label>
		<input type="text" name="cl1">
		<label>Quantity</label>
		<input type="text" name="cl2">
	
		
		<input type="submit" name="button" id="btn" value="Submit">
	</div>

  
  </form>
</body>
</html>
