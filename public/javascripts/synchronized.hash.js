SynchronizedHash = function(args) {
  var delay = args.syncronizingEach;

  var lastHash = document.location.hash;
  var onchangeFunction = function(){};
  synchronizeWithDocumentHashEach(delay);

  function synchronizeWithDocumentHashEach(delay) {
    setInterval(checkHashChangeNow,delay);
  }

  function checkHashChangeNow(){
    if (lastHash != document.location.hash){
      lastHash = document.location.hash;
      onChangeFunction();
    }
  }

  this.getArgument = function(){
    return lastHash.slice(1);
  }

  this.onChange = function(_onChangeFunction){
    onChangeFunction = _onChangeFunction;
  }
}

