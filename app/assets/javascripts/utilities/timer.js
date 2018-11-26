document.addEventListener('turbolinks:load', function() {

  var timer = document.querySelector('.timer');
  if (timer) {
    var timeSeconds = timer.dataset.passageTime;
//   var redirect_path = timer.dataset.path

    var x = setInterval(function() {
      var minutes = Math.floor(timeSeconds/60);
      var seconds = Math.floor(timeSeconds%60);

      document.getElementById("demo").innerHTML =minutes + "m " + seconds + "s ";
      if (timeSeconds < 0) {
        clearInterval(x);
//        document.getElementById("demo").innerHTML = "EXPIRED";
        document.getElementById("theForm").submit();
//        window.location.href = redirect_path
      }
      timeSeconds -= 1;
    }, 1000);
  }


})
