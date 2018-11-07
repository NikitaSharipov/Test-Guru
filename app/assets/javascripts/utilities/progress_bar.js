document.addEventListener('turbolinks:load', function() {
  var progress = document.getElementById('myBar')
  if (progress) {
    var questions_all = progress.dataset.amount;
    console.log(questions_all);
    var questions_current = progress.dataset.completed;
    console.log(questions_current);
    var width = questions_current/questions_all*100;
    console.log(width);
    interval(width, progress);
  }
})

function interval(width, progress) {
  console.log(width);
  progress.style.width = width + '%';
  width += width;
}
