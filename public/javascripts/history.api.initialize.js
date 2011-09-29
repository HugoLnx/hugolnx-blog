$(document).ready(function(){
  var History = window.History;

  if (!History.enabled) return;

  History.Adapter.bind(window, 'statechange',function(){
    setTimeout(function(){
      var State = History.getState();
      var data = State.data;
      var body = data.body;
      var sharing_head = data.sharing_head;
      console.log(sharing_head);

      $("div#content").html(body);

      var head = $("head");
      head.find("meta[itemprop='name'],meta[property='og:title']").attr("content",sharing_head["title"]);
      head.find("meta[itemprop='description'],meta[property='og:description']").attr("content",sharing_head["description"]);
      head.find("meta[itemprop='image'],meta[property='og:image']").attr("content",sharing_head["image"]);
      head.find("meta[property='og:url']").attr("content",sharing_head["url"]);
      head.find("meta[property='og:site_name']").attr("content",sharing_head["site_name"]);
      head.find("meta[property='fb:admins']").attr("content",sharing_head["facebook_app_token"]);
    },100);
  });
  
  var ajax = new AJAX();
  $("nav a").click(function(){
    var href = $(this).attr('href');
    var response = ajax.requestWithoutLayout(href, function(body,title,sharing_head){
      History.pushState({body:body,sharing_head:sharing_head},title,href);
    });
    return false;
  });
});
