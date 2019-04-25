<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Estados</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
   
    <script>
        $(document).ready(function() {
            var dataF = document.getElementById('dataFinal'),
                dataI = document.getElementById('dataInicial'),
                err_message = document.getElementById('err-message');

            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1" ).click(function() {
                window.location.href = "consultarPessoas.jsp"
            });
            
            //Funcao para verificar a data quando sai do campo de ano inicial
            $(dataF).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });

            //Funcao para verificar a data quando sai do campo de ano final
            $(dataI).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });
            
            //Funcao para tartar o click no botao de consultar
            $("#consultar").on('click', function(){
                if($(dataF).val() < $(dataI).val()){ //Intervalo de tempo invalido
                    alert('Coloque um intervalo de tempo válido!')
                }
                else{ //Intervalo de tempo valido
                    $('#texto').hide();
                    $('div').removeClass('form-group');
                    $('#form').removeClass('form-container');
                    $('#art1').removeClass('col-md-3');
                    $('#art1').addClass('offset-md-3');
                    $('#art1').css("text-align", "center");
                    $('#form').addClass('form-inline');
                    $('input').css('margin-right', '10px');
                    $('#target').css("margin-top", "10px");
                    $('#pBotao1').css("margin-top", "7%");
                    $('#pBotao1').css("margin-left", "10%");
                    $('#titulo1').css("margin-bottom", "0");
                    $('#secao').css("padding-bottom", "0");
                    $('#form').css("width", "90%");
                    $('#form').css("margin-left", "5%");
                    $('#art1').css("margin-left", "3%");
                    $('#texto1').css("margin-bottom", "15px");
                    $('#section1').show();
                    $('#section1').css("padding-bottom", "70px");
                }
            });
            
            //Configuracao da tabela
            $('#myTable').DataTable({
               "searching": false,
               "bLengthChange" : false,
               "paging": false,
               "bInfo": false
            });
            
            $('.dataTables_length').addClass('bs-select');
        });
    </script>
    
    <body>
        <header>
            <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                        <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                    <li class="nav-item" ><a class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                    <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Estados</button>
                    <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
                </ul>
            </nav>
        </header>
        
        <section class="container-fluid S" style="margin-bottom: 50px;">
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <section class="row justify-content-center" style="width: 100%;">
                <article class="col-12 col-sm-6 col-md-3" id="art1" >
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="form" class="form-container">
                        <div class="form-group">
                                <label> Data inicial</label>
                                <input type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                        </div>
                        <div class="form-group">
                                <label> Data final</label>
                                <input type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                        </div>

                        <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary">Consultar</button></p>
                        
                        <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                    </form>
                </article>
            </section>
        </section>
        
        <section id="section1" class="table-responsive">
            <div class="row" style="width: 100%; margin-top: 30px;" id="resul">
                <div class="form-container col-md-3" style=" margin-left: 40px; margin-right: 30px; height: 800px;">
                        <h5 style="margin-bottom: 0px">Filtros dos valores</h5>
                        <label style="margin: 5px 0px 0px 0px">Valor mínimo das dívidas:</label>
                        <input type="number" class="form-control" id="anoFinal" name="quantity" min="0" style="width: 40%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Valor máximo das dívidas:</label>
                        <input type="number" class="form-control" id="anoFinal" name="quantity" min="0" style="width: 40%;">
                        
                        <button type="submit" class="btn btn-primary">Submit</button>
                    
                </div>
                <div style="width:  60%;">
                    <table id="myTable" class="table table-striped table-bordered table-sm" style="border: solid 1px #999;">
                        <thead class="thead-dark table table-striped">
                            <tr>
                                <th class="th-sm" id="co1">Unidade Federativa</th> 
                                <th class="th-sm">Valor das dívidas</th>
                                <th class="th-sm">Quantidade de devedores</th>
                                <th class="th-sm">Quantidade de dívidas</th>
                                <th class="th-sm">Valor das ações judiciais</th>
                                <th class="th-sm">Quantidade de ações judiciais</th>
                            </tr>
                        </thead>
                        <tbody id="corpoTable">
                            <tr><td>AC</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>AL</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>AP</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>AM</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>BA</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>CE</td><td>2012</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        
        <br>
        <footer>
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
        
       
    </body>
</html>
