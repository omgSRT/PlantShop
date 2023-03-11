<%-- 
    Document   : completedOrder
    Created on : Jun 5, 2022, 2:40:12 PM
    Author     : omg
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="basicobject.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
    </head>
    <body>
        <section><h3><a href="personalPage.jsp">Go Back</a></h3></section>
        <section>
            <%
                String email = (String) session.getAttribute("email");
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {%>
                    <%if(ord.getStatus()==2){%>
                    <table class="order">
                        <tr>
                            <td>OrderID</td>
                            <td>Order Date</td>
                            <td>Ship Date</td>
                            <td>Order's status</td>
                            <td>action</td>
                        </tr>
                        <tr>
                            <td><%= ord.getOrderID()%></td>
                            <td><%= ord.getOrderDate()%></td>
                            <td><%= ord.getShipDate()%></td>
                            <td><%= status[ord.getStatus()]%>
                                </br>
                                <% if(ord.getStatus()==1){%><a href="#">cancel order</a>
                                <%} else if(ord.getStatus()==3){%><a href="reOrderServlet?orderid=<%= ord.getOrderID()%>">order again</a>
                                <%}%>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>">detail</a></td>
                        </tr>
                    </table>
                    <%}%>
            <%      }
                }
                else{  
            %>
                     <p>You don't have any order</p>
            <%
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
