$(document).ready(function() {
  postSlider = new PostSlider(
    {
      element: $("#slider"),
      noticeElement: $("#slider_subtitle span#notice"),
      titleElement: $("#slider_subtitle span#title"),
      max: id_max,
      value: id,
      titles: titles
    }
  );

  setTimeout(function(){
    console.log("timeout");
    window.onpopstate = function(event) {
      console.log("onpopstate");
      var isHistoryApiEntry = event.state;
      //console.log("entry: " + isHistoryApiEntry);
      if (isHistoryApiEntry) {
        var pathname = document.location.pathname.substring(1);
        ajax.changePostTo(pathname);
        var id = pathname.match(/^\d+$/) ? pathname : id_max;
        postSlider.updateValueWith(id);
      } else document.location.reload();
    }
  },1000);

});

PostSlider = function(args) {
  var element = args["element"];
  var noticeElement = args["noticeElement"];
  var titleElement = args["titleElement"];
  var max = args["max"];
  var titles = args["titles"];
  var value = args["value"];

  element.slider({
    min: 1,
    max: max,
    stop: onStop,
    slide: onSliderStartOrSlide,
    start: onSliderStartOrSlide,
    value: value
  });

  this.updateValueWith = function(newValue) {
    element.slider({value: newValue});
  }

  function onStop(event,ui){
    console.log("onStop event");
    noticeElement.fadeIn(6000);
    titleElement.hide();
    history.pushState(true,"Post "+titleFor(ui.value),ui.value);
    ajax.changePostTo(ui.value);
  }

  function onSliderStartOrSlide(event,ui){
    noticeElement.hide();
    titleElement.show();
    titleElement.text(titleFor(ui));
  }

  function titleFor(ui) {
    return titles[ui.value-1];
  }
}
