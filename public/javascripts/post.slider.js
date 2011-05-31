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

  if (supportHistoryAPI()) {
    window.onload = function(){
      setTimeout(function(){
        window.onpopstate = function(event) {
          var isHistoryApiEntry = event.state;
          if (isHistoryApiEntry) {
            var pathname = document.location.pathname.substring(1);
            ajax.changePostTo(pathname);
            var id = pathname.match(/^\d+$/) ? pathname : id_max;
            postSlider.updateValueWith(id);
          } else {
            document.location.reload();
          }
        }
      },1);
    }
  }
});

var supportHistoryAPI = function(){
  return (window.history != null && history.pushState != null)
}

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
    noticeElement.fadeIn(6000);
    titleElement.hide();
    if (supportHistoryAPI()) {
      var title_base = document.title.split(' ')[0];
      var full_title = title = title_base + " " + titleFor(ui);
      document.title = full_title;
      history.pushState(true,full_title,ui.value);
      ajax.changePostTo(ui.value);
    } else {
      document.location.href = ui.value;
    }
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
