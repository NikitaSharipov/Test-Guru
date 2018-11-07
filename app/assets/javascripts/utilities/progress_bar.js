document.addEventListener('turbolinks:load', function() {
  var progress = document.getElementById('myBar')
  if (progress) {
    var questions_all = progress.dataset.amount;
    var questions_current = progress.dataset.completed;
    var width = questions_current/questions_all*100;
    interval(width, progress);
  }
})

function interval(width, progress) {
  progress.style.width = width + '%';
  width += width;
}
