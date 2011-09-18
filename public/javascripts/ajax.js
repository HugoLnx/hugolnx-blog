$(document).ready(function(){
  ajax = new AJAX();
});

AJAX = function() {
  this.changePostTo = function(id) {
    $.ajax({
      type: "GET",
      url: "/without_layout/" + id,
      dataType: "html",
      async: true,
      complete: insertDataInContents
    });
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#content").html(xmlHttpRequest.responseText);
  }
}

