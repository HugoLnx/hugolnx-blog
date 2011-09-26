AJAX = function() {
  var whatDoWithResponse;
  this.requestWithoutLayout = function(href,givenFunction) {
    whatDoWithResponse = givenFunction;
    $.ajax({
      type: "GET",
      url: "/without_layout/" + href,
      dataType: "html",
      async: true,
      complete: prepareToGivenFunction
    });
  }

  function prepareToGivenFunction(xmlHttpRequest) {
    var title = "Hugolnx::Blog: " + xmlHttpRequest.getResponseHeader("title")
    var body = xmlHttpRequest.responseText
    whatDoWithResponse(body,title);
  }
}
