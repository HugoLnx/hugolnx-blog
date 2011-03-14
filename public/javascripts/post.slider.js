PostSlider = function(args) {
  var element = args["element"];
  var noticeElement = args["noticeElement"];
  var titleElement = args["titleElement"];
  var max = args["max"];
  var titles = args["titles"];

  element.slider({
    min: 1,
    max: max,
    stop: onStop,
    slide: onSliderStartOrSlide,
    start: onSliderStartOrSlide
  });

  this.updateValueWith = function(newValue) {
    element.slider({value: newValue});
  }

  function onStop(event,ui){
    noticeElement.fadeIn(6000);
    titleElement.hide();
    document.location.hash = "#"+ui.value;
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
