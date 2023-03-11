<%-- 
    Document   : plantDetail
    Created on : Jun 18, 2022, 6:59:46 PM
    Author     : omg
--%>

<%@page import="basicobject.Plant"%>
<%@page import="dao.PlantDAO"%>
<%@page import="dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section><h3><a href="viewCart.jsp">Go Back</a></h3></section>
        <section>
            <%
                String plantid=request.getParameter("plantid");
                if(plantid!=null){
                    int plantID=Integer.parseInt(plantid.trim());
                    Plant p=PlantDAO.getPlant(plantID);
            %>
            <table class='plant'>
                <tr>
                    <td>Plant ID</td>
                    <td>Plant Name</td>
                    <td>Price</td>
                    <td>Image</td>
                    <td>Description</td>
                    <td>Status</td>
                    <td>Cate ID</td>
                    <td>Cate Name</td>
                </tr>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getName()%></td>
                    <td><%=p.getPrice()%></td>
                    <td><img src="<%=p.getImgpath()%>" class='plantimg'></td>
                    <td><%=p.getDescription()%></td>
                    <%
                        if(p.getStatus()==1){
                    %>
                    <td>In Stock</td>
                    <%
                        }else{
                    %>
                    <td>Out of Stock</td>
                    <%
                        }
                    %>
                    <td><%=p.getCateid()%></td>
                    <td><%=p.getCatename()%></td>
                </tr>
            </table>
        <%
            }else{
        %>
        <p>Invalid Plant ID</p>
        <%
            }
        %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
