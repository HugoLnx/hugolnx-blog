AJAX = function() {
  var whatDoWithResponse;
  this.requestWithoutLayout = function(href,givenFunction) {
    if (href !== "#") {
      whatDoWithResponse = givenFunction;
      $.ajax({
        type: "GET",
        url: "/without_layout/" + href,
        dataType: "json",
        async: true,
        success: prepareToGivenFunction
      });
    }
  }

  function prepareToGivenFunction(data) {
    var title = "Hugolnx::Blog: " + data["title"];
    var body = data["body"];
    var sharing_head = data["sharing_head"];
    whatDoWithResponse(body,title,sharing_head);
  }
}
