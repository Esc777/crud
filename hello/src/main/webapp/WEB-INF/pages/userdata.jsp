<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
    <title>User Data</title>
    <style type="text/css">
        body {
            margin: 0px;
            background: linear-gradient(#d5f5f2, #c7c7cc);
        }
        div {
            width: 100%;
        }
        h1 {
            text-align: center;
            font-size: 80px;
            font-weight: bold;
            -webkit-margin-before: 10%;
            -webkit-margin-after: 3%;
        }
        .button {
            text-align: center;
            margin-top: 3%;
        }
        a {
            font-size: 30px;
            color: white;
            background-color: darkcyan;
            box-shadow: 5px 5px darkslategrey;
            padding: 15px;
            border-radius: 20px;
            text-decoration: none;
        }
        a:hover {
            background-color: #9999a9;
        }
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #c7c7cc;
            width: 460px;
            margin: auto;
        }
        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            text-align: center;
            padding: 10px 2px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }
        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: bold;
            padding: 10px 2px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #c0c9cc;
            color: #28332b;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<div>
    <h1>User details</h1>

    <table class="tg">
        <tr>
            <th width="60">ID</th>
            <th width="120">Name</th>
            <th width="120">Age</th>
            <th width="120">Admin</th>
            <th width="200">Created</th>
        </tr>
        <tr>
            <td>${user.id}</td>
            <td style="text-align:left; padding-left: 5px">${user.name}</td>
            <td>${user.age}</td>
            <td>${user.admin}</td>
            <td>${user.createdDate.toString()}</td>
        </tr>
    </table>

    <div class="button">
        <a href="<c:url value='/users'/>">Back to Users</a>
    </div>
</div>
</body>
</html>
