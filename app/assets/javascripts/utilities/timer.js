document.addEventListener('turbolinks:load', function() {

  var timer = document.querySelector('.timer');
  if (timer) {
    var time_seconds = timer.dataset.passageTime;
//   var redirect_path = timer.dataset.path

    var x = setInterval(function() {
      var minutes = Math.floor(time_seconds/60);
      var seconds = Math.floor(time_seconds%60);

      document.getElementById("demo").innerHTML =minutes + "m " + seconds + "s ";
      if (time_seconds < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
//        window.location.href = redirect_path
      }
      time_seconds -= 1;
    }, 1000);
  }


})
