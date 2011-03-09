$(document).ready(function(){ 
  recentHash = document.location.hash;
  setInterval(checkChangeOfHash,500);
  var id = catchIdFromHash();
  changePostTo(id);
  $.syntax() 
  declareSlider(id_max,id,titles);
});

function onChange(event,slider){
  $("#slider_subtitle span#warning").fadeIn(6000);
  $("#slider_subtitle span#title").hide();
  changePostTo(slider.value);
  document.location.hash = "#"+slider.value;
  $.syntax()
}

function declareSlider(max,value,titles){
  $("#slider").slider({
    min: 1,
    max: max,
    value: value,
    change: onChange,
    slide: onSliderStartOrSlide,
    start: onSliderStartOrSlide
  });
}

function onSliderStartOrSlide(event,ui){
  $("#slider_subtitle span#warning").hide();
  $("#slider_subtitle span#title").show();
  $("#slider_subtitle span#title").text(titles[ui.value-1]);
}

function catchIdFromHash(){
  var id = document.location.hash.slice(1);
  if(id == "") id = id_max;
  return id;
}

function checkChangeOfHash(){
  if (recentHash != document.location.hash){
    var id = catchIdFromHash();
    changePostTo(id);
    $("#slider").slider({value: id});
  }
}

function changePostTo(id) {
  $("div#post").replaceWith($.ajax({
    type: "post",
    url: "/posts/show/",
    dataType: "html",
    data: {id: id},
    async: false,
    context: document.body
  }).responseText);

  recentHash = document.location.hash;
}
