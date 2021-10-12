$( document ).on('turbolinks:load', function() {
  showSliderValue("power");
  showSliderValue("attack");
  showSliderValue("strenght");
  showSliderValue("spirit");
  showSliderValue("charisma");
  setPoints("power");
  setPoints("attack");
  setPoints("strenght");
  setPoints("spirit");
  setPoints("charisma");
  validateCharacter();
  initToast();
})

jQuery.validator.addMethod("maxPoints", function(value, element) {
  var total = 0;
  $(".form-range").each(function(){
    total += parseInt($(this).val());
  });
  return this.optional(element) || (total <= 2500);
}, "No puedes asignar más de 2000 pts");

function validateCharacter(){
  $("#new_character").validate({
    errorClass: 'is-invalid',
    errorElement: 'div',
    rules: {
      'character[image]': "required",
      'character[name]': "required",
      'character[power]': {
        required: true,
        maxPoints: true,
        min: 100,
        max: 1000,
      },
      'character[attack]': {
        required: true,
        maxPoints: true,
        min: 100,
        max: 1000,
      },
      'character[spirit]': {
        required: true,
        maxPoints: true,
        min: 100,
        max: 1000,
      },
      'character[charisma]': {
        required: true,
        maxPoints: true,
        min: 100,
        max: 1000,
      },
      'character[strenght]': {
        required: true,
        maxPoints: true,
        min: 100,
        max: 1000,
      },
      'character[special_skill]': "required",
    },
    messages: {
      'character[name]': {
        required: 'Debes asignarle un nombre a tu personaje'
      },
      'character[image]': {
        required: 'No olvides agregar una imagen'
      },
      'character[special_skill]': {
        required: 'Tienes elegir una habilidad especial'
      },
    }
   })
}

function showSliderValue(name){
  $("#character_" + name).on('input', function(){
    $("#" + name + "_indicator").val($(this).val());
    checkRemainingPoints();
  });
}

function checkRemainingPoints(){
  var total = 0;
  var remaining = 2500;
  var totalIndicator = $("#total_indicator");
  $(".form-range").each(function(){
    total += parseInt($(this).val());
  });
  remaining -= total;
  if (remaining < 0){
    totalIndicator.removeClass('text-success');
    totalIndicator.addClass('text-danger');
  }
  else{
    totalIndicator.removeClass('text-danger');
    totalIndicator.addClass('text-success');
  }
  $("#total_indicator").text(remaining);
}

function initToast(){
  var toastElList = [].slice.call(document.querySelectorAll('.toast'))
  var toastList = toastElList.map(function (toastEl) {
    return new bootstrap.Toast(toastEl).show();
  });
}

function setPoints(name){
  $("#" + name + "_indicator").on('change', function(){
    $("#character_" + name).val($(this).val());
    checkRemainingPoints();
  });
}