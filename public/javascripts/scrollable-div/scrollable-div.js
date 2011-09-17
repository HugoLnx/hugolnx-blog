ScrollableDiv = function() {
  var PARENT_DIV_SELECTOR = "div#post";
  var CHILDREN_DIV_SELECTOR = "div#post-left";
  var SIDE_CHILDREN_DIV_SELECTOR = "div#post-right";

  var myWindow = $(window);
  var myDocument = $(document);
  var myParent = $("div#content " + PARENT_DIV_SELECTOR);
  var me = myParent.find(CHILDREN_DIV_SELECTOR);
  var mySideDiv = myParent.find(SIDE_CHILDREN_DIV_SELECTOR);
  var relativeTop;
  var relativeLeft;
  var sideRelativeLeft = mySideDiv.offset().left;
  updateRelativePosition();
  var self = this;

  this.fixInRelativePosition = function(){
    me.css("position","fixed");
    updatePosition();
    mySideDiv.css("margin-left",sideRelativeLeft-mySideDiv.offset().left);
  };

  this.activeAutoLenghtAdjust = function() {
    updateLenght();
  };

  this.prepareForWindowResize = function() {
    myWindow.resize(adjustForResizement);
  };

  function adjustForResizement() {
    updateRelativePosition();
    updatePosition();
    updateLenght();
  }

  function updatePosition() {
    me.css("top",relativeTop);
    me.css("left",relativeLeft);
  };

  function updateRelativePosition(){
    var lastPosition = me.css("position");
    me.css("position","static");
    relativeTop = me.offset().top;
    relativeLeft = me.offset().left;
    me.css("position",lastPosition);
  };

  function updateLenght(){
    var parentBottom = myParent.offset().top + myParent.height();
    var parentBottomToBase = myDocument.height() - parentBottom;
    var height = myWindow.height() - (relativeTop + parentBottomToBase);
    me.height(height);
  };
};
