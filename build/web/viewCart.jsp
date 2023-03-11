<%-- 
    Document   : viewCart
    Created on : Jun 11, 2022, 6:54:30 PM
    Author     : omg
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="basicobject.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String name=(String)session.getAttribute("name");
                if(name!=null){
            %>
            <h3>Welcome <%= session.getAttribute("name") %> come back</h3>
            <h3><a href="mainController?action=logout">Log Out</a></h3>
            <h3><a href="personalPage.jsp">personal page</a></h3>
            <%
                }
            %>
            <font style='color:red;'> <%= (request.getAttribute("WARNING")==null)?"":(String)request.getAttribute("WARNING")%></font>
            <table width="100%" class="shopping">
                <tr>
                    <td>Product id</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>quantity</td>
                    <td>action</td>
                </tr>
                <%
                    int total=0;
                    HashMap<String, Integer> cart=(HashMap)session.getAttribute("cart");
                    if(cart!=null){
                        Set<String> pids=cart.keySet();
                        for(String pid:pids){
                            int quantity=cart.get(pid);
                            Plant p=PlantDAO.getPlant(Integer.parseInt(pid));
                %>
                <form action="mainController" method="post">
                    <tr>
                        <td><input type="hidden" value="<%=pid%>" name="txtpid"><a href="getPlantServlet?pid=<%=p.getId()%>"><%=pid%></a></td>
                        <td><img src="<%=p.getImgpath()%>" class='plantimg'></td>
                        <td><%=p.getPrice() %></td>
                        <td><input type="number" value="<%=quantity%>" name="quantity"></td>
                        <td>
                            <input type="submit" value="update" name="action">
                            <input type="submit" value="delete" name="action">
                        </td>
                    </tr>
                </form>
                <%
                    total=total+cart.get(pid)*p.getPrice();
                        }
                    }
                    else{
                %>
                         <tr><td>Your cart is empty</td></tr>
                <%
                    }
                %>
                <tr><td>Total money: <%=total%></td></tr>
                <tr><td>Order Date: <%=(new Date()).toString()%></td></tr>
                <tr><td>Ship Date: N/A</td></tr>
            </table>
        </section>
                <section>
                    <form action="mainController" method="post">
                        <input type="submit" value="saveOrder" name="action" class="submitorder">
                    </form>
                </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
