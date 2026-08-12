<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<style>
		body{
			background:#f4f6f9;
		}
		
		.card{
		
			margin-top:30px;
		
		}
		
		.table th{
		
			text-align:center;
		
		}
		
		.table td{
		
			vertical-align:middle;
		
		}
	</style>
</head>

<body>

<div class="container card shadow card-header bg-dark text-white">
	<div class="row">
		<div class="col-md-6">
			<h3>Customer Feedback Dashboard</h3>
		</div>
		<div class="col-md-6 text-end">
			<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
		</div>
	</div>
</div>

<div class="card-body">
	<table class="table table-bordered table-hover">
		<thead class="table-primary">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Created Date</th>
				<th>View</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${feedbackList}" var="fb">
				<tr>
					<td align="center">${fb.id}</td>
					<td>${fb.user.name}</td>
					<td>${fb.user.email}</td>
					<td>${fb.createdDate}</td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/view/${fb.id}" class="btn btn-info">View</a></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/edit/${fb.id}" class="btn btn-warning">Edit</a></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/delete/${fb.id}" class="btn btn-danger" 
						onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>