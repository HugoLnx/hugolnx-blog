function innerPostJavascripts() {
  var GREAT = {
    TOPBAR: "rgba(0,0,255,0.5)",
    BOTTOMBAR: "#009"
  };

  var GOOD = {
    TOPBAR: "rgba(0,255,0,0.5)",
    BOTTOMBAR: "#090"
  };

  var BAD = {
    TOPBAR: "rgba(255,0,0,0.5)",
    BOTTOMBAR: "#900"
  };

  var progressBars = $("div.progress-bar");
  progressBars.each(function(i){
    var progressBar = $(progressBars[i]);
    fillBar = $(document.createElement('div'));
    fillTopBar = $(document.createElement('div'));
    fillBottomBar = $(document.createElement('div'));

    fillBar.width(progressBar.attr("data-progress"));
    fillBar.height("100%");

    fillTopBar.height("60%");
    fillTopBar.width("100%");

    var porcent = parseInt(progressBar.attr("data-progress").slice(0,-1));

    var fillColor;
    if (porcent > 80) {
      fillColor = GREAT;
    } else if (porcent > 40) {
      fillColor = GOOD;
    } else {
      fillColor = BAD;
    }
    fillTopBar.css("background-color",fillColor.TOPBAR);
    fillBar.css("background-color",fillColor.BOTTOMBAR);

    fillBar.append(fillTopBar);

    progressBar.append(fillBar);
  });
};
