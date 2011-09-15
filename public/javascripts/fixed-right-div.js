$(document).ready(function(){
  var postRightDiv = $("div#post div#post-right");
  var initialPostRightDivTop = postRightDiv.offset().top;
  var initialPostRightDivLeft = postRightDiv.offset().left;
  var jWindow = $(window);
  var jDocument = $(document);
  var postDiv = $("div#post");

  postRightDiv.css("position","absolute");
  postRightDiv.css("left", initialPostRightDivLeft);
  postRightDiv.css("top",initialPostRightDivTop + jWindow.scrollTop());

  autoAdjustPostRightDiv();

  jWindow.resize(autoAdjustPostRightDiv);
  jWindow.scroll(updatePostRightDivTop);

  function autoAdjustPostRightDiv() {
    var height = jWindow.height() - (postRightDiv.offset().top - jWindow.scrollTop() + (jDocument.height() - (postDiv.offset().top + postDiv.height())));
    postRightDiv.height(height);
  }

  function updatePostRightDivTop(){
    postRightDiv.css("top",initialPostRightDivTop + jWindow.scrollTop());
  }
});
