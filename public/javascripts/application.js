PostSlider = function(elementSelector,warningSelector,titleSelector,max,initialValue,_titles) {
  var titles = _titles;
  var element = $(elementSelector);
  var warningElement = $(warningSelector);
  var titleElement = $(titleSelector);

  this.updateValueWith = function(newValue) {
    element.slider({value: newValue});
  }

  var titleFor = function(ui) {
    return titles[ui.value-1];
  }

  var events = {
    onChange: function(event,ui){
      warningElement.fadeIn(6000);
      titleElement.hide();
      changePostTo(ui.value);
      document.location.hash = "#"+ui.value;
    },

    onSliderStartOrSlide: function(event,ui){
      warningElement.hide();
      titleElement.show();
      titleElement.text(titleFor(ui));
    }
  }

  element.slider({
    min: 1,
    max: max,
    value: initialValue,
    change: events.onChange,
    slide: events.onSliderStartOrSlide,
    start: events.onSliderStartOrSlide
  });
}
$(document).ready(function(){ 
  recentHash = document.location.hash;
  setInterval(checkChangeOfHash,500);
  var id = catchIdFromHash();
  changePostTo(id);
  slider = new PostSlider("#slider","#slider_subtitle span#warning","#slider_subtitle span#title",id_max,id,titles);
});


function catchIdFromHash(){
  var id = document.location.hash.slice(1);
  if(id == "") id = id_max;
  return id;
}

function checkChangeOfHash(){
  if (recentHash != document.location.hash){
    var id = catchIdFromHash();
    changePostTo(id);
    slider.updateValueWith(id);
  }
}

function changePostTo(id) {
  $("div#post").replaceWith($.ajax({
    type: "post",
    url: "/posts/show/",
    dataType: "html",
    data: {id: id},
    async: false
  }).responseText);

  recentHash = document.location.hash;
  $.syntax()
}
