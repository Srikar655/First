<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page import="java.util.*,com.iss.beans.*,javax.persistence.*,com.iss.service.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.jsp?btn=show">Employee Data</a>
      </li>
    </ul>
  </div>
</nav>
	
<div class="container mt-3">
  <form action="index.jsp" method="post">
    <div class="mb-3 mt-3">
      <input type="text" class="form-control" id="eno" placeholder="Enter Employee No" name="eno">
    </div>
    <div class="mb-3">
      <input type="text" class="form-control" id="ename" placeholder="Enter Employee Name" name="ename">
    </div>
    <div class="mb-3">
      <input type="text" class="form-control" id="esal" placeholder="Enter Employee Salary" name="esal">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary" id="btn" name="btn" value="add">Submit</button>
  </form>
</div>
<c:choose>
	 	 <c:when test="${param.btn=='add'}">
	        <c:if test="${param.eno != null and param.ename != null}">
	            <jsp:useBean id="employee" class="com.iss.beans.Employee" scope="request">
	                <jsp:setProperty name="employee" property="id" value="${param.eno}" />
	                <jsp:setProperty name="employee" property="fName" value="${param.ename}" />
	                <jsp:setProperty name="employee" property="lName" value="${param.esal}" />
	            </jsp:useBean>
	
	         <%
	         	try{
	         			new JpaService().add(employee);
		         	
	         	}catch(Exception	ex)
		         {
		         		ex.printStackTrace();
		         }
	         %>
	        </c:if>
	        </c:when>
	         <c:when test="${param.btn=='show'}">
	         <% 
	         	System.out.println("HII");
	         	List<com.iss.beans.Employee> list=new JpaService().getAll();
	         	request.setAttribute("list",list);
	         %>
	         	<div class="container mt-3">
					 <table class="table table-dark table-striped">
					    <thead>
					      <tr>
					        <th>EmployeeId</th>
					        <th>EmployeeName</th>
					        <th>EmployeeSalary</th>
					      </tr>
					    </thead>
						<tbody>
						<c:forEach	items="${list}" var="temp">
							<tr>
							<td>${temp.id}</td>
							<td>${temp.fName}</td>
							<td>${temp.lName}</td>
							</tr>
						</c:forEach>
						</tbody>
						</table>
	         </c:when>
    </c:choose>

</body>
</html>