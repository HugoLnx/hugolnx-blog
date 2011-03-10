PostSlider = function(args) {
  var divElement = $(args.divSelector);
  var warningElement = $(args.warningSelector);
  var titleElement = $(args.titleSelector);
  var max = args.max;
  var titles = args.titles;

  divElement.slider({
    min: 1,
    max: max,
    stop: onStop,
    slide: onSliderStartOrSlide,
    start: onSliderStartOrSlide
  });

  this.updateValueWith = function(newValue) {
    divElement.slider({value: newValue});
  }

  function onStop(event,ui){
    warningElement.fadeIn(6000);
    titleElement.hide();
    document.location.hash = "#"+ui.value;
  }

  function onSliderStartOrSlide(event,ui){
    warningElement.hide();
    titleElement.show();
    titleElement.text(titleFor(ui));
  }

  function titleFor(ui) {
    return titles[ui.value-1];
  }
}
