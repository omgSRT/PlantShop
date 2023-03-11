<%-- 
    Document   : manageCategories
    Created on : Jun 28, 2022, 7:20:28 PM
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
        <input type="text" name="txtSearch" placeholder="input cate name">
        <input type="submit" value="searchCategory" name="action">
    </form>
    <h1></h1>
    <table class="order">
        <tr>
            <th>Cate ID</th>
            <th>Cate Name</th>
        </tr>
        
        <c:forEach var="cate" items="${requestScope.categoryList}">
            <tr>
                <td><c:out value="${cate.getCateID()}"></c:out></td>
                <td><c:out value="${cate.getCateName()}"></c:out></td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
