AJAX = function() {
  this.changePostTo = function(argument) {
    var url = "/errors/show";
    
    var path = document.location.pathname.slice(1);
    var argumentIsAPostIdValid = (path == "" && document.location.hash.slice(1).match(/[^0-9]+/) == null) || path.match(/[0-9]+/) != null;
    if (argumentIsAPostIdValid) url = "/posts/show";

    $.ajax({
      type: "GET",
      url: url,
      dataType: "html",
      data: {id: argument},
      async: true,
      complete: insertDataInContents
    });
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#contents").html(xmlHttpRequest.responseText);
  }
}

