function onChange(event,slider){
  $("#slider_subtitle").text("");
  $("div#post").replaceWith($.ajax({
    type: "post",
    url: "/posts/change/",
    dataType: "html",
    data: {id: slider.value},
    async: false,
    context: document.body
  }).responseText);
}

function declareSlider(max,value,titles){
  $("#slider").slider({
    min: 1,
    max: max,
    value: value,
    change: onChange,
    slide: function onSlide(event,ui) {
      $("#slider_subtitle").text(titles[ui.value-1]);
    }
  });
}

$(function(){ $.syntax() });
