<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.*,com.coforge.training.crudtest.Product" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
        .container{
  border-radius: 5px;
  background-color: rgb(162, 164, 170);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 500px;
  height: 450px;
  
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

<%! int pid;int price; String pname; String des;Session session1 = null; %>
<%  
String num1=request.getParameter("cl1");  
if(num1 != null)  
{  
pid=Integer.parseInt(num1);  
pname=request.getParameter("cl2");  
des=request.getParameter("cl3"); 
String pri=request.getParameter("cl4"); 
price=Integer.parseInt(pri); 
String q=request.getParameter("cl5"); 
int qnty=Integer.parseInt(q); 
try  
{  
	Session sess = new Configuration().configure("hibernate.cfg.xml")
			.buildSessionFactory().openSession();
			Transaction t = sess.beginTransaction();

			String ava="In Stock";
			
			Product p= new Product(pid,pname,des,price,ava,qnty);
			sess.save(p);
			t.commit();
out.println("<h4>Product Inserted Successfully!</h4>"); 
sess.close();
}  
catch(Exception e)  
{  
System.out.println("e="+e.getMessage());  
}  
}  
%>  
 
  <h3><a href="./showproducts.jsp">Show Products</a></h3>
<form>  
 <div class="container">
		<label>Pro_Id</label>
		<input type="text" name="cl1" >
		<label>Pro_Name</label>
		<input type="text" name="cl2" >
		<label>Pro_Des</label>
		<input type="text" name="cl3" >
		<label>Pro_Price</label>
		<input type="text" name="cl4">
		<label>Quantity</label>
		<input type="text" name="cl5">
		
		<input type="submit" name="button" id="btn" value="Submit">
		
		

	</div>
  </form>
</body>
</html>