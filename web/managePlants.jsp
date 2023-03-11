<%-- 
    Document   : managePlants
    Created on : Jun 28, 2022, 7:19:30 PM
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
        <input type="text" name="txtSearch" placeholder="input plant name">
        <input type="submit" value="searchPlant" name="action">
    </form>
    <h1></h1>
    <table class="order">
        <tr>
            <th>Plant ID</th>
            <th>Plant Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Description</th>
            <th>Status</th>
            <th>Cate ID</th>
            <th>Cate Name</th>
        </tr>
        
        <c:forEach var="p" items="${requestScope.plantList}">
            <tr>
                <td><c:out value="${p.getId()}"></c:out></td>
                <td><c:out value="${p.getName()}"></c:out></td>
                <td><c:out value="${p.getPrice()}"></c:out></td>
                <td><img src="<c:out value="${p.getImgpath()}" ></c:out>" class="plantimg"/></td>
                <td><c:out value="${p.getDescription()}"></c:out></td>
                <td>
                <c:choose>
                    <c:when test="${p.getStatus() eq 1}">Available</c:when>
                    <c:when test="${p.getStatus() eq 0}">Unavailable</c:when>
                </c:choose>
                </td>
                <td><c:out value="${p.getCateid()}"></c:out></td>
                <td><c:out value="${p.getCatename()}"></c:out></td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
