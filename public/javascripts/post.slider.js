$(document).ready(function() {
  var sliderKeys = [null];
  for (var i = 1; i <= id_max; i+=1) {
    sliderKeys.push({
      title: titles[i-1],
      link: "/" + i
    });
  }

  postSlider = new PostSlider(
    {
      element: $("#slider"),
      noticeElement: $("#slider_subtitle span#notice"),
      titleElement: $("#slider_subtitle span#title"),
      keys: sliderKeys,
      initialKey: id
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
            var title_base = document.title.split(' ')[0];
            var full_title = title_base + " " + titles[id-1];
            document.title = full_title;
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
  var keys = args["keys"];
  var initialKey = args["initialKey"]
  var max = keys.length - 1;

  element.slider({
    min: 1,
    max: max,
    stop: onStop,
    slide: onSliderStartOrSlide,
    start: onSliderStartOrSlide,
    value: initialKey
  });

  this.updateValueWith = function(newValue) {
    element.slider({value: newValue});
  }

  function onStop(event,ui){
    var key = keys[ui.value];
    noticeElement.fadeIn(6000);
    titleElement.hide();
    if (supportHistoryAPI()) {
      var title_base = document.title.split(' ')[0];
      var full_title = title_base + " " + key.title;
      document.title = full_title;
      history.pushState(true,full_title,key.link);
      ajax.changePostTo(ui.value);
    } else {
      document.location.href = key.link;
    }
  }

  function onSliderStartOrSlide(event,ui){
    var key = keys[ui.value];
    noticeElement.hide();
    titleElement.show();
    titleElement.text(key.title);
  }
}
