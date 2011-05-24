$(document).ready(function(){
  ajax = new AJAX();
});

AJAX = function() {
  this.changePostTo = function(argument) {
    $.ajax({
      type: "GET",
      url: "/" + argument,
      dataType: "html",
      data: {without_layout: 'true'},
      async: true,
      complete: insertDataInContents
    });
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#contents").html(xmlHttpRequest.responseText);
  }
}

