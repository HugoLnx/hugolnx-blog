function onChange(event,slider){
  $("#slider_subtitle span#warning").fadeIn(6000);
  $("#slider_subtitle span#title").hide();
  $("div#post").replaceWith($.ajax({
    type: "post",
    url: "/posts/change/",
    dataType: "html",
    data: {id: slider.value},
    async: false,
    context: document.body
  }).responseText);
  $.syntax()
}

function declareSlider(max,value,titles){
  $("#slider").slider({
    min: 1,
    max: max,
    value: value,
    change: onChange,
    slide: function onSlide(event,ui) {
      $("#slider_subtitle span#warning").hide();
      $("#slider_subtitle span#title").show();
      $("#slider_subtitle span#title").text(titles[ui.value-1]);
    },
  });
}

$(function(){ $.syntax() });
