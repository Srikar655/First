<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page import="java.util.*,com.iss.beans.*" %>


<html>
<body>
<h2>Hello World!</h2>
<%
	Student student=new Student(1001,"ravi");
	session.setAttribute("student",student);

%>
<c:set var="x" value="100"/>
<c:out value="${x}"/>
<c:out value="${student.sno}"/>
<table>
	<tr>
		<td>ID</td>
		<td>First Name</td>
		<td>Last NAme</td>
	</tr>
	
	<c:forEach items="${employees}" var="emp">
		<tr>
			<td>
				${emp.id}
			</td>
			<td>
				${emp.fName}
			</td>
			<td>
				${emp.lName }
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>