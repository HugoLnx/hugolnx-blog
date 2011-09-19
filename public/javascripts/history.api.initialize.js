$(document).ready(function(){
  if (!History.enabled) return;
  
  var ajax = new AJAX();
  $("div#menu a").click(function(){
    var href = $(this).attr('href');
    ajax.changeContentTo(href);
    History.pushState({},"Novo Titulo",href);
    return false;
  });
});
