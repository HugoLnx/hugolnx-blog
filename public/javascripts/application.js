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
    onStop: function(event,ui){
      warningElement.fadeIn(6000);
      titleElement.hide();
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
    stop: events.onStop,
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
    console.log("recentHash="+recentHash+"|"+"actualHash="+document.location.hash);
    changePostTo(id);
    slider.updateValueWith(id);
  }
}

function changePostTo(id) {
  recentHash = document.location.hash;
  $.ajax({
    type: "POST",
    url: "/posts/show/",
    dataType: "html",
    data: {id: id},
    async: false,
    success: success,
    statusCode: {
      500: failure
    }
  });
  $.syntax()
}

function success(data) {
  $("div#contents").html(data);
}

function failure(ajax) {
  $("div#contents").html(ajax.responseText);
}
