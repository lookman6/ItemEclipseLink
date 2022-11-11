<%-- 
    Document   : ArticlePage
    Created on : 28 oct. 2022, 00:00:39
    Author     : dell
--%>

<%@page import="java.util.List"%>
<%@page import="ENTITES.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Article Page</title>
    </head>
    <body>
         <center>
        <center> <H1> GESTION DES ARTICLES</h1> </center>
        <center>
         <fieldset style="width:50px; height:150px">
             <legend>                Ajout ARTICLE            </legend>
        <form action="AddArticle" method="post">
            
            <table width="300px">
                
                <tr><td><label for="code">CODE : </label></td><td><input type="text" id="code" name="code"/></td></tr>
                <tr><td><label for="designation">DESIGNATION : </label></td><td><input type="text" id="designation" name="designation"/></td></tr>
                <tr><td><label for="prix">PRIX :</td></label><td><input type="number" id="prix" name="prix"/></td></tr>
                <tr><td colspan="2"><input type="submit" value="Ajouter"></td></tr>
                
            </table>
            
        </form>
        </fieldset>
        </center>
        <center>
            <% 
                 List<Article> list = (List<Article>)request.getAttribute("liste");   
             %>
            <table width="300px">
                
                <tr><th>CODE</th><th>DESCRIPTION</th><th>PRIX</th><th colspan="2">Action</th></tr>
                <% 
                    for(Article article : list)
                    {%>
                        <tr>
                            <td><%=article.getCode()%></td>
                            <td><%=article.getDesignation()%></td>
                            <td><%=article.getPrix()%></td>
                            <td>  <a href="DeleteArticle?code=<%=article.getCode()%>"
                           onclick="return confirm('Etes vous sur de la suppression ?')" accesskey="">
                           <img src="img/delete.png" width="40" height="40"/></a> </td> 
                            <td>
                                <a href="EditArticle?code=<%=article.getCode()%>&designation=<%=article.getDesignation()%>&prix=<%=article.getPrix()%>" >
                                    <img src="img/edit.png" width="40" height="40"/>
                                </a>                    	
                            </td>
                        </tr>
                    <%}
                %>
            </table>
            
        </center>
        </center>
    </body>
</html>
