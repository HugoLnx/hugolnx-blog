$(document).ready(function(){
  var scrollableDiv = new ScrollableDiv();
  scrollableDiv.fixInRelativePosition();
  scrollableDiv.activeAutoLenghtAdjust();
  scrollableDiv.prepareForWindowResize();
});
