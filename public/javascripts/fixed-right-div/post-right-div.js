PostRightDiv = function() {
  var POST_DIV_SELECTOR = "div#post";
  var POST_RIGHT_DIV_SELECTOR = "div#post-right";

  var myWindow = $(window);
  var myDocument = $(document);
  var myParent = $("section#mainSection " + POST_DIV_SELECTOR);
  var me = myParent.find(POST_RIGHT_DIV_SELECTOR);
  var initialTop = me.offset().top;
  var initialLeft = me.offset().left;

  this.fixInInitialPosition = function(){
    me.css("position","relative");
    updateTop();
    myWindow.scroll(updateTop);
  };

  this.activeAutoLenghtAdjust = function() {
    updateLenght();
    myWindow.resize(updateLenght());
  };

  function updateTop(){
    me.css("top",myWindow.scrollTop());
  };

  function updateLenght(){
    var parentBottom = myParent.offset().top + myParent.height();
    var parentBottomToBase = myDocument.height() - parentBottom;
    var height = myWindow.height() - (initialTop + parentBottomToBase);
    me.height(height);
  };
};
