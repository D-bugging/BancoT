<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSULTAR - ALUNO</title>
    <body>
       <div class="container"/>
       <h1>CONSULTAR ALUNO</h1>
       <form name="consultarPessoa" action="validaConsultarAluno.jsp" method="post">
           NOME: <input type="text" name ="nomeAluno" value=""> <br>
           <input type="submit" name ="Enviar" value=""> <br>
       </form>
       </div>
        <button></button>
    </body>
</html>
