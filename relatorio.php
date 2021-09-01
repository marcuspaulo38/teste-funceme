<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>FUNCEME - TESTE MARCUS</title>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
</head>
<body>
   <p></p>
   <p></p>
   <p>Clique aqui para buscar os dados</p>
   <div id="tables">   
     <div class="table">

     </div>
  </div>
  <script>
   $("p" ).click(function() {
      var api = "http://apil5.funceme.br/rest/pcd/dado-sensor?estacao=375&sensor=22&orderby=data,desc&data-gte=2010-01-01";
      
      var button = $(this);      
      $.ajax({
         url:api,
         method:'GET',
      })
      .always(function(){
         $(button).html('Funceme - Carregando seus dados...');
      })
      .done(function(evt) {
         $(button).prop('disabled',true);
          setTimeout(function(){
            var result = evt.data.list;

            var html = '<div class="container-fluid">';
                html +='<header>Funceme - Dados Carregados.</header>'
                           +'<div class="content-wrapper">'
                           +'<section class="content">'
                           +'<div class="box-header with-border">'
                           +'<h3 class="box-title col-md-12"></h3>'
                           +'</div>'
                           +'<table class="table table-hover" overflow="scroll">'
                        +'<thead>'
                           +'<tr>'
                           +'<th scope="col">ID</th>'
                           +'<th scope="col">Sensor</th>'
                           +'<th scope="col">Data</th>'
                           +'<th scope="col">Valor</th>'
                           +'<th scope="col">Intervalo</th>'
                           +'<th scope="col">Qualidade</th>'
                           +'<th scope="col">Estação</th>'
                           +'</tr>'
                        +'</thead>'
                        +'<tbody>';

            for(var i=0;i < result.length; i++) {
              
               html +='<tr>'
                        +'<th scope="row">'+result[i].id+'</th>'
                        +'<td>'+result[i].sensor+'</td>'
                        +'<td>'+result[i].data+'</td>'
                        +'<td>'+result[i].valor+'</td>'
                        +'<td>'+result[i].qualidade+'</td>'
                        +'<td>'+result[i].intervalo+'</td>'
                        +'<td>'+result[i].estacao+'</td>'
                     +'</tr>';
               
            }

            html +='</tbody></table>';
            html +='<footer class="navbar navbar-inverse navbar-fixed-bottom" style="background-color: #4682B4; border-color: #4682B4;>';
            html +='<div class="container-fluid">';
            html +='<p class="text-muted"><font color="#FFFFFF">&nbsp; TESTE - MARCUS PAULO - 85 98669.1853</font></p>';
            html +='</div>';
            html +='</div>';
            $('.table').html(html);

         },1000); 
      })
      .fail(function() {
         alert('Error : Falhou!!! ou API ou Url está sem conectividade');
         $(button).prop('disabled',false);
      })
      .then(function(evt){
         setTimeout(function(){        
            $(button).css({'background-color':'#ccc'}).hide();          
         },1000);
      });
   });
</script>

                  </tbody>
               </table>
               <script>
                  $(function(){
                      $('.table tr[data-href]').each(function(){
                          $(this).css('cursor','pointer').hover(
                              function(){ 
                                  $(this).addClass('active'); 
                              },  
                              function(){ 
                                  $(this).removeClass('active'); 
                              }).click( function(){ 
                                  document.location = $(this).attr('data-href'); 
                              }
                          );
                      });
                  });
               </script>
       


</body>
</html>