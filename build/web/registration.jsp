<%-- 
    Document   : registration
    Created on : Jun 1, 2022, 5:21:12 PM
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
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <form action="mainController" method="post" class="formregister">
                <table>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="txtemail" required="" value="<%=(request.getAttribute("txtemail")==null)?"":request.getAttribute("txtemail")%>"></td>
                    </tr>
                    <tr>
                        <td>full name</td>
                        <td><input type="text" name="txtfullname" required="" value="<%=(request.getAttribute("txtfullname")==null)?"":request.getAttribute("txtfullname")%>"></td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td><input type="password" name="txtpassword" required=""></td>
                    </tr>
                    <tr>
                        <td>phone</td>
                        <td><input type="text" name="txtphone" required="" value="<%=(request.getAttribute("txtphone")==null)?"":request.getAttribute("txtphone")%>"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><%=(request.getAttribute("ERROR")==null)?"":request.getAttribute("ERROR")%></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="register" name="action"></td>
                    </tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
