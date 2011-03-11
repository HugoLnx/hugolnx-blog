AJAX = function() {
  this.changePostTo = function(id) {
    var url = "/errors/show";
    
    var x = document.location.pathname.slice(1);
    if ((x == "" && document.location.hash.slice(1).match(/[^0-9]+/) == null) || x.match(/[0-9]+/) != null) url = "/posts/show";
    $.ajax({
      type: "GET",
      url: url,
      dataType: "html",
      data: {id: id},
      async: true,
      complete: insertDataInContents
    });
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#contents").html(xmlHttpRequest.responseText);
  }
}

