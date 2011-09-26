$(document).ready(function(){
  if (!History.enabled) return;
  
  var ajax = new AJAX();
  $("nav a").click(function(){
    var href = $(this).attr('href');
    var response = ajax.requestWithoutLayout(href, function(body,title){
      $("div#content").html(body);
      History.pushState({},title,href);
    });
    return false;
  });
});
