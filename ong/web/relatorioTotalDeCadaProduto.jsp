<%-- 
    Document   : relatorios
    Created on : 26/11/2016, 19:00:09
    Author     : Clark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", -1);
    new java.util.Date();
    if(session.getAttribute("currentSessionUser")!=null)
    {
%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <title>Relatórios - Total de Cada Produto</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="col-md-9">
           
            <br>
            <br>
            <label>Retorna o nome do produto, quantidade total recebida, quantidade de doações recebidas, e a data da última doação de cada produto no período. (Período padrão 30 dias)</label>
            </br>
            </br>
            <form method="post" action="RelatorioServlet?acao=TotalDeCadaProduto">
                <div class="col-md-6">
                    <div class="col-md-5">
                        <label class="control-label" id="periodoLabel" for='periodo'>Quantidade de Dias: </label>
                    </div>
                    <div class="col-md-7">
                        <input class="form-control" value="" id="periodo" type='number' name='periodo'>
                    </div>
                </div>
                </br>
                </br>
                <br>
                <div class="col-md-offset-5">
                <a class="btn btn-sm btn-default" href='relatorios.jsp'>Voltar</a>
                <input class="btn btn-default" type='submit' value='Gerar Relatório' name='btnTotalDeCadaProduto'>
                </div>
            </form>
            </br>
            <div id="quantidadeCadaProduto">
                <div style="padding: 10px;">
                    <div class="table-responsive">
                        <label class="control-label erro" id="mensagemErro">
                            <%  
                                if(request.getAttribute("mensagem")!=null)
                                    out.print(request.getAttribute("mensagem"));
                             %>
                        </label>
                        <label class="control-label resultado" id="mensagemResultado">
                            <%  
                                if(request.getAttribute("mensagemResultado")!=null)
                                    out.print(request.getAttribute("mensagemResultado"));
                             %>
                        </label>
                        <table class="table">
                            <tr>
                                <th>Produto</th>
                                <th>Quantidade Total Recebida</th>
                                <th>Quantidade de Doações</th>
                                <th>Data da Última Doação</th>
                            </tr>
                            <c:forEach var="doacao" items="${listaDoacao}">
                                <tr>
                                    <td>${doacao.nomeProduto}</td>
                                    <td>${doacao.quantidade}</td>
                                    <td>${doacao.doador}</td>
                                    <td>${doacao.dataDoacao}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="rodape.jsp" %>
    </body>
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</html>
<%}
else
response.sendRedirect("login.jsp");%> 
