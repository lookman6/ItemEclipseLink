<%-- 
    Document   : Edit_Article
    Created on : 23 mai 2022, 20:51:04
    Author     : Mohamed EL HADDAD
--%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ENTITES.Article"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center> <H1> GESTION DES ARTICLES</h1> </center>
    <% Article art = (Article)request.getAttribute("article");%>
    <center>
         <fieldset style="width:50px; height:150px">
            <legend>                UPDATE  ARTICLE            </legend>
               <form action="UpdateArticle" method="POST" >
           <table width="300px">
                    <tr>
                        <td>CODE </td>
                        <td><input type="text" name="code"  value="<%=art.getCode()%>" ></td>    </tr>
                    <tr>
                        <td>DESIGNATION  </td>
                        <td>  <input type="text" name="designation" value="<%=art.getDesignation()%>">   </td>
                    </tr>
                    <tr>
                        <td>PRIX :</td>
                        <td><input type="number" name="prix" value="<%=art.getPrix()%>"></td> </tr>
                    <tr> <td><input type="submit" value="UPDATE"></td>                    </tr>
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
                                <a href="EditArticle?code=<%=article.getCode()%>" >
                                    <img src="img/edit.png" width="40" height="40"/>
                                </a>                    	
                            </td>
                        </tr>
                    <%}
                %>
            </table>
            
        </center>
    </body>
</html>
