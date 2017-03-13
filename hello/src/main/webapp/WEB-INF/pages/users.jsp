<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        body {
            margin: 0px;
            background: linear-gradient(whitesmoke, #a49ca9);
        }
        h1 {
            text-align: center;
            font-size: 80px;
            font-weight: bold;
            -webkit-margin-before: 6%;
            -webkit-margin-after: 3%;
        }
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #bcbccc;
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
            border-color: #bcccc0;
            color: #2b332a;
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
            border-color: #bfccbd;
            color: #263331;
            background-color: #f0f0f0;
        }
        #listing {
            text-align: center;
            width: 40%;
            float: left;
            padding-left: 15%;
        }
        #form {
            width: 25%;
            float: right;
            padding-right: 10%;
            padding-top: 2%;
        }
        #search {
            width: 25%;
            float: right;
            padding-right: 10%;
        }
    </style>
</head>
<body>
<h1>Users List</h1>

<div style="width: 100%">
    <div id="listing">
        <div style="padding: 5px">
            <c:url value="/users" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
                <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
            </c:if>
            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/users" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <a href='<c:out value="${url}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/users" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
                <a href='<c:out value="${next}" />' class="pn next">Next</a>
            </c:if>
        </div>
        <c:if test="${!empty listUsers}">
            <table class="tg">
                <tr>
                    <th width="30">ID</th>
                    <th width="120">Name</th>
                    <th width="120">Age</th>
                    <th width="120">Admin</th>
                    <th width="200">Created </th>
                    <th width="50"></th>
                    <th width="50"></th>
                </tr>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td style="text-align:left; padding-left: 5px"><a href="/userdata/${user.id}">${user.name}</a></td>
                        <td>${user.age}</td>
                        <td>${user.admin}</td>
                        <td>${user.createdDate.toString()}</td>
                        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <div id="form">
        <form:form action="/users/add" commandName="user">
            <table>
                <c:if test="${!empty user.name}">
                    <h2 style="padding-left: 20%;">Edit User</h2>
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${empty user.name}"><h2 style="padding-left: 20%;">Add User</h2></c:if>
                <tr>
                    <td>
                        <form:label path="name">
                            <spring:message text="Name"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="age">
                            <spring:message text="Age"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="age"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="admin">
                            <spring:message text="Admin"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="admin"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${!empty user.name}">
                            <input style="margin-left: 32%;" type="submit"
                                   value="<spring:message text="Edit User"/>"/>
                        </c:if>
                        <c:if test="${empty user.name}">
                            <input style="margin-left: 35%;" type="submit"
                                   value="<spring:message text="Add User"/>"/>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>

    <div id="search">
        <c:if test="${!empty listUsers}">
            <form action="/searchUser">
                <h2>Search users by name:</h2>
                <input type="text" name="searchName" id="searchName"
                       placeholder="type name here..">
                <input class="btn btn-xs" type='submit' value='Search'/>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>
