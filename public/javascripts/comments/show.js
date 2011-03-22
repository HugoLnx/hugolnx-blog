$("button.showMore").click(function() {
  var contentElement = $(this).parent();
  passCharactersToAppearSide(800,contentElement);
});

$("div.comment").load(function(){
  passCharactersToAppearSide(800,$(this));
  updateRowsOf($(this).children("p.content textarea.appear"));
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
