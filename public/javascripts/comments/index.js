MyMath = {
  div: function(n1,n2) {
    result = 0;
    while ( n1 >= n2 ) {
      n1 -= n2;
      result++;
    }
    return result;
  }
}

ToShowBitABit = function(args){
  var contentElement = args["content"];
  var invisibleContentElement = args["invisibleContent"];

  this.showMoreCharacters = function(quantity) {
    var textToTransfer = invisibleContentElement.text().slice(0,quantity);
    var restOfText = invisibleContentElement.text().slice(quantity);

    var visibleText = contentElement.text().slice(0,-3);

    invisibleContentElement.text(restOfText);

    if (restOfText == "")
      contentElement.text(visibleText+textToTransfer);
    else contentElement.text(visibleText+textToTransfer+"...");
    
    updateRowsOf(contentElement);
  }

  this.isFullyVisible = function() {
    return invisibleContentElement.text() == "";
  }

  function updateRowsOf(textarea) {
    textarea.attr("rows",linesOf(textarea.text(),textarea.attr("cols")));
  }

  function linesOf(text,columnsAmount) {
    var linesAmount = 0;
    var extraLinesAmount = 0;
    var lineSize = 0;
    for(var i = 0; i < text.length; i++) {
      lineSize++;
      if (text[i] == "\n" || i == (text.length - 1)){
        linesAmount++;
        extraLinesAmount += MyMath.div(lineSize-1,columnsAmount+1);
        lineSize = 0;
      }
    }
    return (linesAmount + extraLinesAmount);
  }
}

ToShowBitABit.argsFrom = function(contentElement) {
  var args = {};
  args["content"] = contentElement;
  var invisibleContent = contentElement.nextAll(".invisible");
  if(invisibleContent.length==0)  {
    invisibleContent = $(document.createElement("span"));
    invisibleContent.addClass("invisible");
    invisibleContent.text(contentElement.text());
    invisibleContent.css("display","none");
    contentElement.parent().append(invisibleContent);
    contentElement.text("");
  }
  args["invisibleContent"] = invisibleContent;
  return args;
}

CommentDiv = function(args) {
  var divElement = args["div"];
  var textarea = args["textarea"]
  var showElement = args["show"];

  this.showMoreCharacters = function(quantity) {
    textarea.showMoreCharacters(quantity);
    if(textarea.isFullyVisible()) showElement.hide();
  }
}

CommentDiv.argsFrom = function(divElement) {
  var args = {};
  args["div"] = divElement;
  args["show"] = divElement.children(".show_more");
  var contentElement = divElement.children(".content");
  var args2 = ToShowBitABit.argsFrom(contentElement);
  args["textarea"] = new ToShowBitABit(args2);
  return args;
}

$(".show_more").click(function() {
  var args = CommentDiv.argsFrom($(this).parent());
  commentDiv = new CommentDiv(args);
  commentDiv.showMoreCharacters(800);
});

$("div.comment").load(function(){
  var args = CommentDiv.argsFrom($(this));
  commentDiv = new CommentDiv(args);
  commentDiv.showMoreCharacters(800);
});
$("div.comment").load();

/*
$("button.showMore").click(function() {
  var contentElement = $(this).parent();
  passCharactersToAppearSide(800,contentElement);
});

$("div.comment").load(function(){
  var commentDiv = new CommentDiv($(this));
  commentDiv.showMoreCharacters(800);
});
$("div.comment").load();

function passCharactersToAppearSide(charactersToPass,divElement) {
  var showMoreElement = divElement.children("button.showMore");
  var contentElement = divElement.children("p.content");
  var visibleFragmentElement = contentElement.children("textarea.appear");
  var invisibleFragmentElement = contentElement.children("span.not_appear");

  var textToTransfer = invisibleFragmentElement.text().slice(0,charactersToPass);
  var restOfText = invisibleFragmentElement.text().slice(charactersToPass);

  var visibleText = visibleFragmentElement.text().slice(0,-3);

  invisibleFragmentElement.text(restOfText);

  if (restOfText == "") {
    showMoreElement.hide();
    visibleFragmentElement.text(visibleText+textToTransfer);
  } else visibleFragmentElement.text(visibleText+textToTransfer+"...");
  
  updateRowsOf(visibleFragmentElement);
}

function linesOf(text,columnsAmount) {
  var linesAmount = 0;
  var extraLinesAmount = 0;
  var lineSize = 0;
  for(var i = 0; i < text.length; i++) {
    lineSize++;
    if (text[i] == "\n" || i == (text.length - 1)) {
      linesAmount++;
      extraLinesAmount += div(lineSize-1,columnsAmount);
      lineSize = 0;
    }
  }
  return (linesAmount + extraLinesAmount);
}

function div(n1,n2) {
  result = 0;
  while ( n1 >= n2 ) {
    n1 -= n2;
    result++;
  }
  return result;
}

function updateRowsOf(textarea) {
  textarea.attr("rows",linesOf(textarea.text(),textarea.attr("cols")));
}
*/
