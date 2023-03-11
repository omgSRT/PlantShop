<%-- 
    Document   : personalPage
    Created on : Jun 2, 2022, 6:20:22 PM
    Author     : omg
--%>

<%@page import="java.sql.Date"%>
<%@page import="basicobject.Account"%>
<%@page import="dao.AccountDAO"%>
<%@page import="basicobject.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
    </head>
    <body>
        <%
            String name=(String) session.getAttribute("name");
            String email=(String) session.getAttribute("email");
            Cookie[] c=request.getCookies();
            boolean login=false;
            if(name==null){
                String token="";
                for (Cookie aCookie: c){
                    if(aCookie.getName().equals("selector")){
                        token = aCookie.getValue();
                        Account acc=AccountDAO.getAccount(token);
                        if(acc!=null){
                            name=acc.getFullname();
                            email=acc.getEmail();
                            login=true; 
                        }
                    }
                }
            }else{
                login=true;
            }
            //show content if login=true
            if(login==true){
        %>
        
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back </h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section> <!--load all orders of the user at here -->
            <%
                String dateFrom=request.getParameter("from");
                String dateTo=request.getParameter("to");
                ArrayList<Order> list;
                if(dateFrom==null || dateTo==null || (dateFrom=="" && dateTo=="")){
                    list=OrderDAO.getOrders(email);
                }else{
                    list=OrderDAO.getOrder(email, dateFrom, dateTo);
                }
                String[] status={"","processing","completed","canceled"};
                if(list!=null&&!list.isEmpty()){
                for(Order ord : list){ %>
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
                                <% if(ord.getStatus()==1){%><a href="cancelOrderServlet?orderid=<%= ord.getOrderID()%>">cancel order</a>
                                <%} else if(ord.getStatus()==3){%><a href="reOrderServlet?orderid=<%= ord.getOrderID()%>">order again</a>
                                <%}%>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>">detail</a></td>
                        </tr>
                    </table>
                        
            <%         }
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
        <%}%>
    </body>
</html>
