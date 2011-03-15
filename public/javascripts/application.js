$(document).ready(function(){ 
  hash = new SynchronizedHash({synchronizingEach: 500});
  hash.onChange(refreshComponents);
  ajax = new AJAX();
  postSlider = new PostSlider(
    {
      element: $("#slider"),
      noticeElement: $("#slider_subtitle span#notice"),
      titleElement: $("#slider_subtitle span#title"),
      max: id_max,
      titles: titles
    }
  );
  refreshComponents();
});

function refreshComponents() {
  var argument = hash.getArgument();
  if((argument == "" || argument.match(/[^0-9]+/) != null)) argument = id_max;
  ajax.changePostTo(argument);
  postSlider.updateValueWith(argument);
}
