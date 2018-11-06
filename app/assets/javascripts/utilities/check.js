document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check');
  if (control) { check_password() };
})

function check_password() {
  password_field = document.getElementById('user_password');
  password_confiramtion_field = document.getElementById('user_password_confirmation');
  alert_cursor = document.querySelector('.octicon-alert');


  password_field.addEventListener('keyup', check_duplicate);
  password_confiramtion_field.addEventListener('keyup', check_duplicate);

}

function check_duplicate() {
  if (password_field.value != password_confiramtion_field.value){
    alert_cursor.classList.remove('hide');
    alert_cursor.classList.remove('correct');
  } else {
    alert_cursor.classList.add('correct');
    hide_if_empty();
  }
}

function hide_if_empty() {
  if (password_field.value == '') {
    alert_cursor.classList.add('hide');
  }
}


