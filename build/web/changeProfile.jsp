<%-- 
    Document   : changeProfile.jsp
    Created on : Jun 5, 2022, 12:02:40 PM
    Author     : omg
--%>

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
            <form action="mainController" method="post" class="formlogin">
                <table>
                    <tr>
                        <td>your new full name</td>
                        <td><input type="text" name="txtfullname"></td>
                    </tr>
                    <tr>
                        <td>your new phone</td>
                        <td><input type="text" name="txtphone"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="edit" name="action"></td>
                    </tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
