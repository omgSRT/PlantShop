<%-- 
    Document   : header_loginedUser
    Created on : Jun 2, 2022, 6:22:36 PM
    Author     : omg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css">
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="changeProfile.jsp">change profile</a></li>
                <li><a href="completedOrder.jsp">completed orders</a></li>
                <li><a href="canceledOrder.jsp">canceled orders</a></li>
                <li><a href="processingOrder.jsp">processing orders</a></li>
                <li><form action="mainController" method="post">
                        from<input type="date" name="from"> to <input type="date" name="to">
                        <input type="submit" value="filter" name="action">
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
