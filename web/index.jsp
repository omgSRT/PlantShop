<%-- 
    Document   : index.jsp
    Created on : Jun 1, 2022, 5:18:35 PM
    Author     : omg
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="basicobject.Plant"%>
<%@page import="java.util.ArrayList"%>
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
                String keyword=request.getParameter("txtsearch");
                String searchby=request.getParameter("searchby");
                ArrayList<Plant> list;
                String [] tmp={"out of stock","available"}; 
                if(keyword==null && searchby==null) //when the page is loaded, all products will be displayed
                    list=PlantDAO.getPlants("","");// only get products by name/category
                else
                    list=PlantDAO.getPlants(keyword, searchby);// only get products by name/category
                if(list!=null&&!list.isEmpty()){
                    for (Plant p:list){ %>
                    <table class='product'>
                        <tr>
                            <td><img src='<%= p.getImgpath()%>' class='plantimg'/></td>
                        </tr>
                        <tr>
                            <td>Product ID:<%= p.getId()%></td>
                        </tr>
                        <tr>
                            <td>Product Name:<%= p.getName()%></td>
                        </tr>
                        <tr>
                            <td>Status:<%= tmp[p.getStatus()]%></td>
                        </tr>
                        <tr>
                            <td>Category:<%= p.getCatename()%></td>
                        </tr>
                        <tr>
                            <td><a href="mainController?action=addtocart&pid=<%=p.getId()%>">add to cart</a></td>
                        </tr>
                    </table>
                            
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
