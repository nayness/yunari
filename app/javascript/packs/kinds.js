$( document ).on('turbolinks:load', function() {
  validateCreateKind();
  loadSharedDeleteModal("race");
  loadSharedDeleteModal("kind");
});

function validateCreateKind(){
  $("#new_kind").validate({
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'kind[name]': {
        required: true,
      }
    },
    messages: {
      'kind[name]': {
        required: 'Debes ingresar un  nombre'
      }
    }
   })
}

function validateCreateRace(){
  $("#new_race").validate({
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'race[name]': {
        required: true,
      }
    },
    messages: {
      'race[name]': {
        required: 'Debes ingresar un  nombre'
      }
    }
   })
}

function loadSharedDeleteModal(name){
  $(".delete_" + name).on('click', function(){
    var mo = document.getElementById(this.dataset.linked);
    var modal = new bootstrap.Modal(mo);
    $(".delete-link").href = this.dataset.url;
    modal.show();
  });
}