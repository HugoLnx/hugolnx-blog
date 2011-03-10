$(document).ready(function(){ 
  hash = new SynchronizedHash();
  hash.onChange(refreshComponents);
  ajax = new AJAX();
  postSlider = new PostSlider(
    {
      divSelector: "#slider",
      warningSelector: "#slider_subtitle span#warning",
      titleSelector: "slider_subtitle span#title",
      max: id_max,
      titles: titles
    }
  );
  refreshComponents();
});

function refreshComponents() {
  var argument = hash.getArgument();
  if(argument == "" || argument.match(/[a-zA-Z]+/) != null)
    argument = id_max;
  ajax.changePostTo(argument);
  postSlider.updateValueWith(argument);
}
