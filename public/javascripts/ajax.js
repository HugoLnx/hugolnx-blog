AJAX = function() {
  this.changeContentTo = function(href) {
    $.ajax({
      type: "GET",
      url: "/without_layout/" + href,
      dataType: "html",
      async: true,
      complete: insertDataInContents
    });
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#content").html(xmlHttpRequest.responseText);
  }
}

$(document).ready(function(){
  ajax = new AJAX();
  $("a").click(function(){
    var ajax = new AJAX();
    ajax.changeContentTo($(this).attr('href'));
    setupTwitterButton();
    return false;
  });
});

