<%-- 
    Document   : manageOrders
    Created on : Jun 26, 2022, 8:50:08 PM
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
        <input type="date" name="txtSearch" required="">
        <input type="submit" value="searchOrder" name="action">
    </form>
    <h1></h1>
    <table class="order">
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Ship Date</th>
            <th>Status</th>
            <th>Acc ID</th>
        </tr>
        
        <c:forEach var="ord" items="${requestScope.orderList}">
            <tr>
                <td><c:out value="${ord.getOrderID()}"></c:out></td>
                <td><c:out value="${ord.getOrderDate()}"></c:out></td>
                <td><c:out value="${ord.getShipDate()}"></c:out></td>
                <td>
                <c:choose>
                    <c:when test="${ord.getStatus() eq 1}">processing</c:when>
                    <c:when test="${ord.getStatus() eq 2}">completed</c:when>
                    <c:when test="${ord.getStatus() eq 3}">canceled</c:when>
                </c:choose>
                </td>
                <td><c:out value="${ord.getAccID()}"></c:out></td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
