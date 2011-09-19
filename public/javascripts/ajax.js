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
