AJAX = function() {
  this.changePostTo = function(id) {
    $.ajax({
      type: "POST",
      url: "/posts/show/",
      dataType: "html",
      data: {id: id},
      async: true,
      complete: insertDataInContents
    });
    $.syntax()
  }

  function insertDataInContents(xmlHttpRequest) {
    $("div#contents").html(xmlHttpRequest.responseText);
  }
}

