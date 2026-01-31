<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #eef3ff;
        font-family: "Segoe UI", sans-serif;
    }

    .card {
        margin-top: 50px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        border: none;
    }

    .card-header {
        background: linear-gradient(45deg, #0d6efd, #4e8cff);
        color: white;
        font-size: 22px;
        font-weight: bold;
        text-align: center;
        border-radius: 15px 15px 0 0;
    }

    .form-label {
        font-weight: 600;
    }

    .form-control, .form-select {
        border-radius: 8px;
    }

    .form-check {
        margin-right: 15px;
    }

    .btn-submit {
        width: 100%;
        background-color: #0d6efd;
        color: white;
        font-size: 18px;
        border-radius: 10px;
        padding: 10px;
    }

    .btn-submit:hover {
        background-color: #084298;
    }

    .top-link {
        text-align: right;
        margin-bottom: 10px;
    }

    .msg {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 15px;
    }
</style>

</head>

<body>

<div class="container col-md-6">

    <div class="card">

        <div class="card-header">
            🎓 Student Registration
        </div>

        <div class="card-body">

            <div class="top-link">
                <a href="students" class="btn btn-outline-primary btn-sm">
                    📋 View Students
                </a>
            </div>

            <p class="msg">${msg}</p>

            <form:form action="save" modelAttribute="student" method="post">

                <!-- NAME -->
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <form:input path="name" cssClass="form-control" placeholder="Enter full name"/>
                </div>

                <!-- EMAIL -->
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <form:input path="email" cssClass="form-control" placeholder="Enter email"/>
                </div>

                <!-- GENDER -->
                <div class="mb-3">
                    <label class="form-label">Gender</label><br>
                    <div class="form-check form-check-inline">
                        <form:radiobutton path="gender" value="Male" cssClass="form-check-input"/>
                        <label class="form-check-label">Male</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <form:radiobutton path="gender" value="Female" cssClass="form-check-input"/>
                        <label class="form-check-label">Female</label>
                    </div>
                </div>

                <!-- ADDRESS -->
                <div class="mb-3">
                    <label class="form-label">City</label>
                    <form:select path="address" cssClass="form-select">
                        <form:option value="">-- Select City --</form:option>
                        <form:option value="Pune">Pune</form:option>
                        <form:option value="Mumbai">Mumbai</form:option>
                        <form:option value="Delhi">Delhi</form:option>
                    </form:select>
                </div>

                <!-- COURSE -->
                <div class="mb-3">
                    <label class="form-label">Course</label>
                    <form:select path="course" cssClass="form-select">
                        <form:option value="">-- Select Course --</form:option>
                        <form:options items="${courses}"/>
                    </form:select>
                </div>

                <!-- TIMINGS -->
                <div class="mb-3">
                    <label class="form-label">Preferred Timings</label><br>
                    <form:checkboxes path="timings" items="${timings}" cssClass="form-check-input"/>
                </div>

                <button type="submit" class="btn btn-submit">
                    ✅ Register Student
                </button>

            </form:form>

        </div>
    </div>

</div>

</body>
</html>
