<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.*,com.coforge.training.crudtest.Product" %>

<!DOCTYPE html>
<html>
 
<head>
<meta charset="ISO-8859-1">
<title>Show Books</title>
<style>
        table {
            width: 100%;
            border-collapse: collapse;
            border: 3px solid purple;
        }
        
        td {
            padding: 10px;
        }
       h2 {
         text-align: center;}
        
        th {
            padding: 20px;
        }
        
        thead {
            color: white;
            text-shadow: 1px 1px 1px black;
        }
        
        thead th {
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.5));
            border: 0px solid purple;
        }
        /* zebra striping*/
        
        tbody tr:nth-child(odd) {
            background-color: #C0C0C0;
        }
        
        tbody tr:nth-child(even) {
            background-color: #808080;
        }
        
        table {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
<h2>Available Products are</h2>
  <%! int pid;int price; String pname; String des;String ava;Session session1 = null; %>
	<table id="table" width="220" border="1">
		<thead>
			<tr>
				<th>Pro_Id</th>
				<th>Pro_Name</th>
				<th>Pro_Des</th>
				<th>pro_Price</th>
				<th>Availability</th>
				<th>Quantity</th>
			</tr>
		</thead>
		 <tbody>

            </tbody>
		<%
		Configuration cf = new Configuration();
		cf.configure();
		SessionFactory sf = cf.buildSessionFactory();
		session1 = sf.openSession();
		//Using from Clause  
		String hql = "from Product";
		Query query = session1.createQuery(hql);
		Iterator it = query.iterate();
		while (it.hasNext()) {
			Product p = (Product) it.next();
			pid = p.getId();
			pname = p.getPname();
			des= p.getDes();
			price = p.getPrice();
			ava=p.getAva();
			int qnty=p.getQty();
		%>
		<tr>
			<td><%=pid%></td>
			<td><%=pname%></td>
			<td><%=des%></td>
			<td><%=price%></td>
			<td><%=ava%></td>
			<td><%=qnty%></td>
		</tr>
		<%  
}  
 session1.close(); 
%>

	</table>
	<h3><a href="./deleteproduct.jsp">Delete Product</a></h3>
    <h3> <a href="./createproduct.jsp">Insert Product</a></h3>
     <h3> <a href="./updateproduct.jsp">Update Product</a></h3>
      <h3> <a href="./purchase.jsp">Purchase Product</a></h3>
</body>
</html>

 