<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Search Results</title>
    <style type="text/css">
        body {
            margin: 0px;
            background: linear-gradient(whitesmoke, darkgray);
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
        #back_btn {
            font-size: 30px;
            color: white;
            background-color: darkcyan;
            box-shadow: 5px 5px darkslategrey;
            padding: 15px;
            border-radius: 20px;
            text-decoration: none;
        }
        #back_btn:hover {
            background-color: lightgreen;
        }
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
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
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<div>
    <h1>Search results</h1>

    <c:if test="${!empty listUsers}">
        <table class="tg">
            <tr>
                <th width="30">ID</th>
                <th width="120">Name</th>
                <th width="120">Age</th>
                <th width="120">Admin</th>
                <th width="200">Created </th>
            </tr>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td style="text-align:left; padding-left: 5px"><a href="/userdata/${user.id}">${user.name}</a></td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${user.createdDate.toString()}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty listUsers}">
        <h2>Sory, there aren't users with name ${searchName}</h2>
    </c:if>

    <div class="button">
        <a href="<c:url value='/users'/>" id="back_btn">Back to Users</a>
    </div>
</div>
</body>
</html>

