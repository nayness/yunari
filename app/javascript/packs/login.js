$( document ).on('turbolinks:load', function() {
  validateCreateAccount();
});
function validateCreateAccount(){
  $("#new_user").validate({
    onkeyup: true,
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'user[email]': {
        required: true,
        email: true
      },
      'user[password]': {
        required: true,
        minlength: 6
      },
      'user[password_confirmation]': {
        required: true,
        minlength: 6,
        equalTo: "#user_password"
      },
    },
    messages: {
      'user[email]': {
        required: 'Tienes que ingresar un correo',
        email: 'Este correo no es válido'
      },
      'user[password]': {
        required: 'Tienes ingresar una contraseña',
        minlength: 'Debe tener al menos 6 caracteres'
      },
      'user[password_confirmation]': {
        required: 'Tienes confirmar la contraseña',
        minlength: 'Debe tener al menos 6 caracteres',
        equalTo: 'Las contraseñas no coinciden'
      },
    }
   })
}