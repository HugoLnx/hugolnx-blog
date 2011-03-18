$("a#signTwitter").click(function(){
  this.href = this.href + "?hash=" + hash.getArgument();
});
