<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students List</title>

<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f4f6f9;
    }

    .container {
        margin-top: 40px;
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: bold;
        color: #343a40;
    }

    table {
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }

    thead {
        background-color: #0d6efd;
        color: white;
    }

    th, td {
        text-align: center;
        vertical-align: middle;
    }

    tr:hover {
        background-color: #f1f5ff;
    }

    .btn-sm {
        padding: 4px 10px;
    }

    .top-btn {
        margin-bottom: 15px;
    }

    .no-data {
        text-align: center;
        color: red;
        font-weight: bold;
        font-size: 18px;
        margin-top: 20px;
    }
</style>

</head>

<body>

<div class="container">

    <h2>🎓 Student Details</h2>

    <div class="top-btn text-end">
        <a href="/" class="btn btn-success">
            ➕ Add New Student
        </a>
    </div>

    <c:if test="${empty students}">
        <p class="no-data">No students found</p>
    </c:if>

    <c:if test="${not empty students}">

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Timings</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.course}</td>
                        <td>${student.email}</td>
                        <td>${student.gender}</td>
                        <td>${student.address}</td>
                        <td>${student.timings}</td>
                        <td>
                            <a href="edit?id=${student.id}" 
                               class="btn btn-primary btn-sm">
                                ✏ Edit
                            </a>

                            <a href="delete?id=${student.id}" 
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete?');">
                                🗑 Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </c:if>

</div>

</body>
</html>
