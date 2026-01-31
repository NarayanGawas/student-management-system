<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f6ff;
    }

    .container {
        width: 450px;
        margin: 50px auto;
        background-color: #ffffff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #2c3e50;
    }

    table {
        width: 100%;
    }

    td {
        padding: 8px;
        font-size: 14px;
    }

    input[type="text"],
    select {
        width: 100%;
        padding: 6px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .radio-group,
    .checkbox-group {
        margin-top: 5px;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #3498db;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 15px;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    .msg {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 10px;
    }
</style>

</head>
<body>

<div class="container">

    <h2>Student Registration Form</h2>
    
    <a href="students">AllStudents</a>

    <p class="msg">${msg}</p>

    <form:form action="edit-student" modelAttribute="student" method="post">

<form:hidden path="id"/>

    
        <table>

            <tr>
                <td>Name</td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>

            <tr>
                <td>Email</td>
                <td>
                    <form:input path="email"/>
                </td>
            </tr>

            <tr>
                <td>Gender</td>
                <td class="radio-group">
                    <form:radiobutton path="gender" value="Male"/> Male
                    <form:radiobutton path="gender" value="Female"/> Female
                </td>
            </tr>

            <tr>
                <td>Address</td>
                <td>
                    <form:select path="address">
                        <form:option value="">-- Select City --</form:option>
                        <form:option value="Pune">Pune</form:option>
                        <form:option value="Mumbai">Mumbai</form:option>
                        <form:option value="Delhi">Delhi</form:option>
                    </form:select>
                </td>
            </tr>

            <tr>
                <td>Course</td>
                <td>
                    <form:select path="course">
                        <form:option value="">-- Select Course --</form:option>
                        <form:options items="${courses}"/>
                    </form:select>
                </td>
            </tr>

            <tr>
                <td>Timings</td>
                <td class="checkbox-group">
                    <form:checkboxes items="${timings}" path="timings"/>
                </td>
            </tr>

        </table>

        <input type="submit" value="Edit">

    </form:form>

</div>

</body>
</html>
