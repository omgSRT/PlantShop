<%-- 
    Document   : ManageAccounts
    Created on : Jun 26, 2022, 3:13:20 PM
    Author     : omg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
    </head>
    <body>
    <c:import url="header_loginedAdmin.jsp"/>
    <form action="mainController" method="post">
        <input type="text" name="txtSearch" placeholder="input email or fullname">
        <input type="submit" value="searchAccount" name="action">
    </form>
    <h1></h1>
    <table class="order">
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Full name</th>
            <th>status</th>
            <th>phone</th>
            <th>role</th>
            <th>action</th> 
        </tr>
        
        <c:forEach var="acc" items="${requestScope.accountList}">
            <tr>
                <td><c:out value="${acc.getAccID()}"></c:out></td>
                <td><c:out value="${acc.getEmail()}"></c:out></td>
                <td><c:out value="${acc.getFullname()}"></c:out></td>
                <td><c:choose>
                        <c:when test="${acc.getStatus() eq 1}">active</c:when>
                        <c:otherwise>inActive</c:otherwise>
                    </c:choose></td>
                <td><c:out value="${acc.getPhone()}"></c:out></td>
                <td>
                <c:choose>
                    <c:when test="${acc.getRole() eq 1}">admin</c:when>
                    <c:otherwise>user</c:otherwise>
                </c:choose>
                </td>
                <td>
                <c:if test="${acc.getRole() eq 0}">
                    <c:url var="mylink" value="mainController">
                        <c:param name="email" value="${acc.getEmail()}"></c:param>
                        <c:param name="status" value="${acc.getStatus()}"></c:param>
                        <c:param name="action" value="updateStatusAccount"></c:param>
                    </c:url>
                    <a href="${mylink}">Block/Unblock</a>
                </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
